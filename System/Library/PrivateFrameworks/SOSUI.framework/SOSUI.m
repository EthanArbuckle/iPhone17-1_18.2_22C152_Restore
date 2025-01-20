id _PositionAnimation(void *a1, double a2, float a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  uint64_t vars8;

  v5 = (void *)MEMORY[0x263F157D8];
  v6 = a1;
  v7 = [v5 animation];
  [v7 setValues:v6];

  [v7 setKeyPath:@"position"];
  [v7 setCalculationMode:*MEMORY[0x263F15968]];
  [v7 setDuration:a2];
  *(float *)&v8 = a3;
  [v7 setRepeatCount:v8];
  return v7;
}

uint64_t sub_25B6AA150()
{
  uint64_t v0 = sub_25B6D2990();
  __swift_allocate_value_buffer(v0, qword_26A50D300);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A50D300);
  return sub_25B6D2980();
}

uint64_t sub_25B6AA1CC()
{
  if (qword_26A5093E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25B6D2990();
  return __swift_project_value_buffer(v0, (uint64_t)qword_26A50D300);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

unint64_t sub_25B6AA2EC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_25B6D2990();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v29 = a1;
  v13 = (void *)sub_25B6D29C0();
  unint64_t v14 = (unint64_t)objc_msgSend(v12, sel_BOOLForKey_, v13);

  uint64_t v15 = sub_25B6AA1CC();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v16 = sub_25B6D2970();
  os_log_type_t v17 = sub_25B6D2AD0();
  if (os_log_type_enabled(v16, v17))
  {
    unsigned int v27 = v14;
    uint64_t v28 = v8;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v31 = v26;
    *(_DWORD *)uint64_t v18 = 136315906;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_25B6BE940(a3, a4, &v31);
    sub_25B6D2B50();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    id v19 = objc_msgSend(self, sel_mainBundle);
    id v20 = objc_msgSend(v19, sel_bundleIdentifier);

    if (v20)
    {
      unint64_t v21 = sub_25B6D29D0();
      unint64_t v23 = v22;
    }
    else
    {
      unint64_t v23 = 0x800000025B6D54E0;
      unint64_t v21 = 0xD000000000000011;
    }
    uint64_t v30 = sub_25B6BE940(v21, v23, &v31);
    sub_25B6D2B50();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_25B6BE940(v29, a2, &v31);
    sub_25B6D2B50();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 32) = 1024;
    unint64_t v14 = v27;
    LODWORD(v30) = v27;
    sub_25B6D2B50();
    _os_log_impl(&dword_25B6A7000, v16, v17, "using %s default from %s.%s: %{BOOL}d", (uint8_t *)v18, 0x26u);
    uint64_t v24 = v26;
    swift_arrayDestroy();
    MEMORY[0x2611672F0](v24, -1, -1);
    MEMORY[0x2611672F0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v14;
}

uint64_t sub_25B6AA6B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508900);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B6D2950();
  uint64_t v5 = sub_25B6D2960();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  }
  sub_25B6BF834((uint64_t)v4, &qword_26A508900);
  unint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_25B6D2B80();
  swift_bridgeObjectRelease();
  unint64_t v11 = 0xD000000000000019;
  unint64_t v12 = 0x800000025B6D5500;
  sub_25B6D2A40();
  unint64_t v7 = v11;
  unint64_t v8 = v12;
  sub_25B6BEFDC();
  swift_allocError();
  *uint64_t v9 = v7;
  v9[1] = v8;
  return swift_willThrow();
}

id SOSUIWebRTCView.state.getter()
{
  v1 = (void **)(v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_25B6AA968(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  v4 = *v3;
  *uint64_t v3 = a1;
}

uint64_t sub_25B6AA9BC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

void sub_25B6AAA18(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

uint64_t variable initialization expression of SOSUIWebRTCView.webView()
{
  return 0;
}

void *SOSUIWebRTCView.webView.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25B6AAB80(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v4 = *v3;
  *id v3 = a1;
}

uint64_t sub_25B6AABD4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

void sub_25B6AAC30(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t variable initialization expression of SOSUIWebRTCView.delegate()
{
  return 0;
}

uint64_t SOSUIWebRTCView.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate;
  swift_beginAccess();
  return MEMORY[0x261167390](v1);
}

uint64_t SOSUIWebRTCView.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*SOSUIWebRTCView.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x261167390](v5);
  return sub_25B6AAE78;
}

void sub_25B6AAE78(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t variable initialization expression of SOSUIWebRTCView.rtcRPC()
{
  return 0;
}

unint64_t variable initialization expression of SOSUIWebRTCView.enableTrickleWhipKey()
{
  return 0xD000000000000016;
}

unint64_t variable initialization expression of SOSUIWebRTCView.webViewIsInspectableKey()
{
  return 0xD00000000000001FLL;
}

unint64_t variable initialization expression of SOSUIWebRTCView.enableDebugDataChannel()
{
  return 0xD00000000000001BLL;
}

unint64_t variable initialization expression of SOSUIWebRTCView.originUrlString()
{
  return 0xD000000000000017;
}

uint64_t variable initialization expression of SOSUIWebRTCView.blankUrlString()
{
  return 0x6C623A74756F6261;
}

id SOSUIWebRTCView.__allocating_init(frame:delegate:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return SOSUIWebRTCView.init(frame:delegate:)(a1, a2, a3, a4);
}

id SOSUIWebRTCView.init(frame:delegate:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC] = 0;
  id v9 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableTrickleWhipKey];
  *(void *)id v9 = 0xD000000000000016;
  *((void *)v9 + 1) = 0x800000025B6D5520;
  uint64_t v10 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey];
  *(void *)uint64_t v10 = 0xD00000000000001FLL;
  *((void *)v10 + 1) = 0x800000025B6D5540;
  unint64_t v11 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel];
  *(void *)unint64_t v11 = 0xD00000000000001BLL;
  *((void *)v11 + 1) = 0x800000025B6D5560;
  unint64_t v12 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString];
  *(void *)unint64_t v12 = 0xD000000000000017;
  *((void *)v12 + 1) = 0x800000025B6D5580;
  v13 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString];
  *(void *)v13 = 0x6C623A74756F6261;
  *((void *)v13 + 1) = 0xEB000000006B6E61;
  unint64_t v14 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished];
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  type metadata accessor for SOSUIWebRTCState();
  uint64_t v15 = v4;
  *(void *)&v15[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state] = SOSUIWebRTCState.__allocating_init()();

  v18.receiver = v15;
  v18.super_class = (Class)type metadata accessor for SOSUIWebRTCView();
  id v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  sub_25B6AB6FC();
  swift_unknownObjectRelease();

  return v16;
}

uint64_t variable initialization expression of SOSUIWebRTCView.onNavigationFinished()
{
  return 0;
}

id SOSUIWebRTCView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SOSUIWebRTCView.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC] = 0;
  id v3 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableTrickleWhipKey];
  *(void *)id v3 = 0xD000000000000016;
  *((void *)v3 + 1) = 0x800000025B6D5520;
  uint64_t v4 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey];
  *(void *)uint64_t v4 = 0xD00000000000001FLL;
  *((void *)v4 + 1) = 0x800000025B6D5540;
  uint64_t v5 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel];
  *(void *)uint64_t v5 = 0xD00000000000001BLL;
  *((void *)v5 + 1) = 0x800000025B6D5560;
  uint64_t v6 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString];
  *(void *)uint64_t v6 = 0xD000000000000017;
  *((void *)v6 + 1) = 0x800000025B6D5580;
  unint64_t v7 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString];
  *(void *)unint64_t v7 = 0x6C623A74756F6261;
  *((void *)v7 + 1) = 0xEB000000006B6E61;
  unint64_t v8 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished];
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  type metadata accessor for SOSUIWebRTCState();
  id v9 = v1;
  *(void *)&v9[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state] = SOSUIWebRTCState.__allocating_init()();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for SOSUIWebRTCView();
  id v10 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    sub_25B6AB6FC();
  }
  return v11;
}

id SOSUIWebRTCView.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B6D2990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B6AA1CC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unint64_t v7 = sub_25B6D2970();
  os_log_type_t v8 = sub_25B6D2AE0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_25B6A7000, v7, v8, "SOSUIWebRTCView.deinit", v9, 2u);
    MEMORY[0x2611672F0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = (id *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView];
  swift_beginAccess();
  id result = *v10;
  if (*v10)
  {
    id v12 = objc_msgSend(result, sel_configuration);
    id v13 = objc_msgSend(v12, sel_userContentController);

    objc_msgSend(v13, sel_removeAllScriptMessageHandlers);
    objc_super v14 = (objc_class *)type metadata accessor for SOSUIWebRTCView();
    v16.receiver = v1;
    v16.super_class = v14;
    return objc_msgSendSuper2(&v16, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25B6AB6FC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25B6D2990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v27 - v9;
  id v11 = sub_25B6ADABC();
  id v12 = (void **)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView];
  swift_beginAccess();
  id v13 = *v12;
  *id v12 = v11;

  id v14 = objc_msgSend(self, sel_authorizationStatusForMediaType_, *MEMORY[0x263EF9D48]);
  uint64_t v15 = sub_25B6AA1CC();
  objc_super v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if (v14 == (id)3)
  {
    v16(v10, v15, v4);
    os_log_type_t v17 = sub_25B6D2970();
    os_log_type_t v18 = sub_25B6D2B10();
    if (!os_log_type_enabled(v17, v18))
    {
      os_log_type_t v8 = v10;
      goto LABEL_8;
    }
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_25B6A7000, v17, v18, "SOSUIWebRTCView: has camera permission", v19, 2u);
    os_log_type_t v8 = v10;
    goto LABEL_6;
  }
  v16(v8, v15, v4);
  os_log_type_t v17 = sub_25B6D2970();
  os_log_type_t v20 = sub_25B6D2B10();
  if (os_log_type_enabled(v17, v20))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_25B6A7000, v17, v20, "SOSUIWebRTCView: denied camera permission", v19, 2u);
LABEL_6:
    MEMORY[0x2611672F0](v19, -1, -1);
  }
LABEL_8:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  uint64_t v21 = sub_25B6D2AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v3, 1, 1, v21);
  sub_25B6D2AA0();
  unint64_t v22 = v1;
  uint64_t v23 = sub_25B6D2A90();
  uint64_t v24 = (void *)swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  v24[2] = v23;
  v24[3] = v25;
  v24[4] = v22;
  sub_25B6ABC58((uint64_t)v3, (uint64_t)&unk_26A508F80, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_25B6ABA50()
{
  v0[2] = sub_25B6D2AA0();
  v0[3] = sub_25B6D2A90();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25B6ABAFC;
  return sub_25B6ABDE0();
}

uint64_t sub_25B6ABAFC()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25B6D2A70();
  if (v0) {
    uint64_t v4 = sub_25B6C1988;
  }
  else {
    uint64_t v4 = sub_25B6C199C;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_25B6ABC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25B6D2AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_25B6D2AB0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_25B6BF834(a1, &qword_26A508960);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25B6D2A70();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_25B6ABDE0()
{
  v1[6] = v0;
  uint64_t v2 = sub_25B6D2990();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  sub_25B6D2AA0();
  v1[10] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  v1[11] = v4;
  v1[12] = v3;
  return MEMORY[0x270FA2498](sub_25B6ABED4, v4, v3);
}

uint64_t sub_25B6ABED4()
{
  sub_25B6ADF80();
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xB8))();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)(v0 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A508B68);
    id v5 = v4;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_25B6AC044;
    return sub_25B6CE604(v3, (uint64_t)v1, (uint64_t)&type metadata for SOSUIWebRTCMessage);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25B6AC044(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    uint64_t v7 = sub_25B6AC894;
  }
  else
  {
    v4[15] = a1;
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    uint64_t v7 = sub_25B6AC16C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25B6AC16C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  *(void *)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC) = v0[15];

  uint64_t v4 = *(void **)(v1 + v2);
  v0[16] = v4;
  if (v4)
  {
    type metadata accessor for SOSUIWebRTCView();
    sub_25B6BF59C();
    uint64_t v5 = v4;
    uint64_t v6 = sub_25B6CFB24();
    v0[17] = v6;
    unint64_t v7 = sub_25B6CFB30();
    v0[18] = v7;
    os_log_type_t v8 = *(int **)((*MEMORY[0x263F8EED0] & *v5) + 0xF8);
    unint64_t v22 = (int *)((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[19] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_25B6AC44C;
    return ((uint64_t (*)(void *, uint64_t, unint64_t, uint64_t, unint64_t))v22)(v0 + 2, 0x74617453636E7973, 0xE900000000000065, v6, v7);
  }
  else
  {
    uint64_t v11 = v0[9];
    uint64_t v12 = v0[7];
    uint64_t v13 = v0[8];
    swift_release();
    uint64_t v14 = sub_25B6AA1CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    uint64_t v15 = sub_25B6D2970();
    os_log_type_t v16 = sub_25B6D2AF0();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl(&dword_25B6A7000, v15, v16, "SOSUIWebRTCView.sharedSetup: failed to initialize RPC", v17, 2u);
      MEMORY[0x2611672F0](v17, -1, -1);
    }
    uint64_t v19 = v0[8];
    uint64_t v18 = v0[9];
    uint64_t v20 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
}

uint64_t sub_25B6AC44C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v4 = *(void *)(v2 + 96);
    uint64_t v5 = sub_25B6AC900;
  }
  else
  {
    sub_25B6BF834(v2 + 16, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v4 = *(void *)(v2 + 96);
    uint64_t v5 = sub_25B6AC58C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6AC58C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  char v2 = sub_25B6AA2EC(*(void *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel), *(void *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel + 8), 0xD000000000000012, 0x800000025B6D59F0);
  uint64_t v3 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x250);
  uint64_t v6 = (uint64_t (*)(void))((char *)v3 + *v3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v4;
  void *v4 = v0;
  v4[1] = sub_25B6AC6E4;
  return v6(v2 & 1);
}

uint64_t sub_25B6AC6E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_25B6AC990;
  }
  else {
    uint64_t v5 = sub_25B6AC820;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25B6AC820()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25B6AC894()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6AC900()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25B6AC990()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SOSUIWebRTCView.reset()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508960);
  MEMORY[0x270FA5388](v2 - 8);
  v58 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25B6D28A0();
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  MEMORY[0x270FA5388](v4);
  v53 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B6D2960();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v52 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (uint64_t)&v51 - v9;
  uint64_t v10 = sub_25B6D2990();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v63 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v51 - v14;
  uint64_t v16 = sub_25B6AA1CC();
  v60 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v60(v15, v16, v10);
  os_log_type_t v17 = sub_25B6D2970();
  os_log_type_t v18 = sub_25B6D2AD0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_25B6A7000, v17, v18, "SOSUIWebRTCView.reset: resetting view", v19, 2u);
    MEMORY[0x2611672F0](v19, -1, -1);
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v15, v10);
  type metadata accessor for SOSUIWebRTCState();
  id v21 = SOSUIWebRTCState.__allocating_init()();
  unint64_t v22 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x278))();

  uint64_t v23 = *(void **)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  *(void *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC) = 0;

  v59 = *(uint64_t (**)(void))((*v22 & *v1) + 0xB8);
  uint64_t v24 = (void *)v59();
  if (!v24)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v25 = v24;
  id v26 = objc_msgSend(v24, sel_configuration);

  id v27 = objc_msgSend(v26, sel_userContentController);
  objc_msgSend(v27, sel_removeAllScriptMessageHandlers);

  uint64_t v28 = v63;
  v60(v63, v16, v10);
  uint64_t v29 = sub_25B6D2970();
  os_log_type_t v30 = sub_25B6D2AD0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_25B6A7000, v29, v30, "SOSUIWebRTCView.reset: unloading page", v31, 2u);
    v32 = v31;
    uint64_t v28 = v63;
    MEMORY[0x2611672F0](v32, -1, -1);
  }

  v20(v28, v10);
  uint64_t v33 = v61;
  uint64_t v34 = v62;
  uint64_t v35 = sub_25B6AA6B8(v62);
  if (!v33)
  {
    uint64_t v36 = ((uint64_t (*)(uint64_t))v59)(v35);
    if (v36)
    {
      v37 = (void *)v36;
      uint64_t v39 = v56;
      uint64_t v38 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v52, v34, v57);
      v40 = v53;
      sub_25B6D2880();
      v41 = (void *)sub_25B6D2860();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
      id v42 = objc_msgSend(v37, sel_loadRequest_, v41);

      uint64_t v43 = sub_25B6D2AC0();
      uint64_t v44 = v34;
      uint64_t v45 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v58, 1, 1, v43);
      sub_25B6D2AA0();
      v46 = v1;
      id v47 = v42;
      uint64_t v48 = sub_25B6D2A90();
      v49 = (void *)swift_allocObject();
      uint64_t v50 = MEMORY[0x263F8F500];
      v49[2] = v48;
      v49[3] = v50;
      v49[4] = v46;
      v49[5] = v42;
      sub_25B6ABC58(v45, (uint64_t)&unk_26A508970, (uint64_t)v49);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v44, v38);
      return;
    }
LABEL_11:
    __break(1u);
  }
}

uint64_t sub_25B6AD050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_25B6D2990();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  v5[7] = swift_task_alloc();
  v5[8] = swift_task_alloc();
  v5[9] = sub_25B6D2AA0();
  v5[10] = sub_25B6D2A90();
  uint64_t v8 = sub_25B6D2A70();
  v5[11] = v8;
  v5[12] = v7;
  return MEMORY[0x270FA2498](sub_25B6AD164, v8, v7);
}

uint64_t sub_25B6AD164()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = sub_25B6AA1CC();
  v0[13] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v0[15] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_25B6D2970();
  os_log_type_t v7 = sub_25B6D2AD0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25B6A7000, v6, v7, "SOSUIWebRTCView.reset: waiting for unload", v8, 2u);
    MEMORY[0x2611672F0](v8, -1, -1);
  }
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[4];
  uint64_t v11 = v0[5];
  uint64_t v13 = v0[2];
  uint64_t v12 = v0[3];

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[16] = v14;
  v0[17] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v9, v10);
  v0[18] = sub_25B6D2A90();
  uint64_t v15 = swift_task_alloc();
  v0[19] = v15;
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = v12;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[20] = v16;
  void *v16 = v0;
  v16[1] = sub_25B6AD344;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_25B6AD344()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_25B6AD4A4, v3, v2);
}

uint64_t sub_25B6AD4A4()
{
  (*(void (**)(void, void, void))(v0 + 112))(*(void *)(v0 + 56), *(void *)(v0 + 104), *(void *)(v0 + 32));
  uint64_t v1 = sub_25B6D2970();
  os_log_type_t v2 = sub_25B6D2AD0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25B6A7000, v1, v2, "SOSUIWebRTCView.reset: sharedsetup", v3, 2u);
    MEMORY[0x2611672F0](v3, -1, -1);
  }
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);

  v4(v5, v6);
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v7;
  *os_log_type_t v7 = v0;
  v7[1] = sub_25B6AD5E0;
  return sub_25B6ABDE0();
}

uint64_t sub_25B6AD5E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_25B6AD85C;
  }
  else {
    uint64_t v5 = sub_25B6AD71C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25B6AD71C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[14];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[4];
  swift_release();
  v1(v3, v2, v4);
  uint64_t v5 = sub_25B6D2970();
  os_log_type_t v6 = sub_25B6D2AD0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25B6A7000, v5, v6, "SOSUIWebRTCView.reset: after sharedsetup", v7, 2u);
    MEMORY[0x2611672F0](v7, -1, -1);
  }
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[16];
  uint64_t v9 = v0[6];
  uint64_t v10 = v0[4];

  v8(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_25B6AD85C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6AD8E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = (void (**)(void *))(a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  uint64_t v12 = *(void *)(a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  char *v11 = sub_25B6C1724;
  v11[1] = (void (*)(void *))v10;
  id v13 = a3;
  return sub_25B6BF07C(v12);
}

id sub_25B6ADABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B6D2990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B6AA1CC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_25B6D2970();
  os_log_type_t v8 = sub_25B6D2B10();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_25B6A7000, v7, v8, "SOSUIWebRTCView.createWebView: creating web view", v9, 2u);
    MEMORY[0x2611672F0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA60]), sel_init);
  objc_msgSend(v10, sel_setAllowsInlineMediaPlayback_, 1);
  objc_msgSend(v10, sel_setMediaTypesRequiringUserActionForPlayback_, 0);
  id v11 = objc_msgSend(v10, sel_preferences);
  objc_msgSend(v11, sel__setEnumeratingAllNetworkInterfacesEnabled_, 1);

  objc_msgSend(v10, sel__setCanShowWhileLocked_, 1);
  id result = objc_msgSend(v10, sel_defaultWebpagePreferences);
  if (result)
  {
    id v13 = result;
    objc_msgSend(result, sel_setLockdownModeEnabled_, 0);

    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA58]), sel_initWithFrame_configuration_, v10, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v14, sel_setUIDelegate_, v1);
    objc_msgSend(v14, sel_setNavigationDelegate_, v1);
    objc_msgSend(v14, sel_setInspectable_, sub_25B6AA2EC(*(void *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey], *(void *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey + 8], 0xD000000000000015, 0x800000025B6D59D0) & 1);
    objc_msgSend(v1, sel_addSubview_, v14);
    objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v15 = objc_msgSend(v14, sel_leadingAnchor);
    id v16 = objc_msgSend(v1, sel_leadingAnchor);
    id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    objc_msgSend(v17, sel_setActive_, 1);
    id v18 = objc_msgSend(v14, sel_trailingAnchor);
    id v19 = objc_msgSend(v1, sel_trailingAnchor);
    id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

    objc_msgSend(v20, sel_setActive_, 1);
    id v21 = objc_msgSend(v14, sel_topAnchor);
    id v22 = objc_msgSend(v1, sel_topAnchor);
    id v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

    objc_msgSend(v23, sel_setActive_, 1);
    id v24 = objc_msgSend(v14, sel_bottomAnchor);
    id v25 = objc_msgSend(v1, sel_bottomAnchor);
    id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

    objc_msgSend(v26, sel_setActive_, 1);
    id v27 = objc_msgSend(v14, sel_scrollView);
    objc_msgSend(v27, sel_setContentInsetAdjustmentBehavior_, 2);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_25B6ADF80()
{
  uint64_t v0 = sub_25B6D2A10();
  MEMORY[0x270FA5388](v0 - 8);
  v30[1] = (char *)v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508900);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25B6D2960();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (uint64_t)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)v30 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)v30 - v12;
  type metadata accessor for SOSUIWebRTCView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v16 = (void *)sub_25B6D29C0();
  id v17 = (void *)sub_25B6D29C0();
  id v18 = objc_msgSend(v15, sel_URLForResource_withExtension_, v16, v17);

  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_8;
  }
  sub_25B6D2940();

  id v19 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v19(v4, v11, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v20 = v13;
  v19(v13, v4, v5);
  uint64_t v22 = v30[2];
  id v21 = (void *)v30[3];
  uint64_t v23 = sub_25B6AA6B8(v31);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v20, v5);

    return;
  }
  uint64_t v24 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v21) + 0xB8))(v23);
  if (v24)
  {
    id v25 = (void *)v24;
    sub_25B6D2A00();
    sub_25B6D29B0();
    id v26 = (void *)sub_25B6D29C0();
    swift_bridgeObjectRelease();
    id v27 = (void *)sub_25B6D2930();
    id v28 = objc_msgSend(v25, sel_loadHTMLString_baseURL_, v26, v27);

    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v29(v31, v5);
    v29((uint64_t)v20, v5);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t SOSUIWebRTCView.webView(_:requestMediaCapturePermissionFor:initiatedByFrame:type:decisionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(1);
}

Swift::Void __swiftcall SOSUIWebRTCView.webView(_:didFinish:)(WKWebView *_, WKNavigation_optional didFinish)
{
  uint64_t v3 = *(void (**)(Class))(v2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  if (v3)
  {
    Class isa = didFinish.value.super.isa;
    if (didFinish.value.super.isa)
    {
      swift_retain();
      v3(isa);
      sub_25B6BF07C((uint64_t)v3);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t SOSUIWebRTCView.webView(_:didReceive:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  uint64_t v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0xD0))();
  if (v6)
  {
    uint64_t v7 = (uint64_t)objc_msgSend(v6, sel_serverAuthenticationChallengeWithChallenge_, a2);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v7 = 1;
  }
  return a3(v7, 0);
}

uint64_t SOSUIWebRTCView.webView(_:decidePolicyFor:decisionHandler:)(uint64_t a1, void *a2, void (*a3)(void))
{
  os_log_type_t v30 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508900);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25B6D28A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25B6D2960();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v29 - v16;
  id v18 = objc_msgSend(a2, sel_request);
  sub_25B6D2870();

  sub_25B6D2890();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_25B6BF834((uint64_t)v6, &qword_26A508900);
    return ((uint64_t (*)(void))v30)(0);
  }
  id v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v6, v11);
  uint64_t v21 = sub_25B6D2920();
  uint64_t v23 = v29;
  if (v21 == *(void *)(v29 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString)
    && v22 == *(void *)(v29 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString + 8))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    goto LABEL_12;
  }
  char v25 = sub_25B6D2D90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  if (v25)
  {
LABEL_12:
    id v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v15, v11);
LABEL_13:
    v20(1);
    return ((uint64_t (*)(char *, uint64_t))v27)(v17, v11);
  }
  if (sub_25B6D2920() == *(void *)(v23 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString)
    && v26 == *(void *)(v23 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v28 = sub_25B6D2D90();
  swift_bridgeObjectRelease();
  id v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v27(v15, v11);
  if (v28) {
    goto LABEL_13;
  }
  v20(0);
  return ((uint64_t (*)(char *, uint64_t))v27)(v17, v11);
}

void sub_25B6AEC04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25B6D2990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v1, sel_window);

  if (!v6)
  {
    uint64_t v7 = sub_25B6AA1CC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    uint64_t v8 = sub_25B6D2970();
    os_log_type_t v9 = sub_25B6D2AF0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25B6A7000, v8, v9, "SOSUIWebRTCView.verifyAttachment: WKWebView must be attached to a window to function properly", v10, 2u);
      MEMORY[0x2611672F0](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

unint64_t sub_25B6AED7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F58);
  uint64_t v2 = sub_25B6D2BF0();
  uint64_t v3 = (void *)v2;
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
    sub_25B6C15E8(v6, (uint64_t)&v15, &qword_26A508F60);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25B6C10A0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25B6BF260(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_25B6AEEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = sub_25B6D2990();
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  sub_25B6D2AA0();
  v6[12] = sub_25B6D2A90();
  uint64_t v9 = sub_25B6D2A70();
  v6[13] = v9;
  v6[14] = v8;
  return MEMORY[0x270FA2498](sub_25B6AEFB0, v9, v8);
}

uint64_t sub_25B6AEFB0()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0[8] + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  v0[15] = v1;
  if (v1)
  {
    uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0xF8);
    uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
    v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[16] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_25B6AF2EC;
    uint64_t v4 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[4];
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[3];
    return v26(v8, v6, v7, v4, v5);
  }
  else
  {
    uint64_t v10 = v0[11];
    uint64_t v11 = v0[9];
    uint64_t v12 = v0[10];
    swift_release();
    uint64_t v13 = sub_25B6AA1CC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v13, v11);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_25B6D2970();
    os_log_type_t v15 = sub_25B6D2AF0();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v18 = v0[10];
    uint64_t v17 = v0[11];
    uint64_t v19 = v0[9];
    unint64_t v20 = v0[5];
    if (v16)
    {
      uint64_t v21 = v0[4];
      uint64_t v27 = v0[11];
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v28 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = sub_25B6BE940(v21, v20, &v28);
      sub_25B6D2B50();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25B6A7000, v14, v15, "SOSUIWebRTCView: RPC call %s made before RPC has been initialized", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611672F0](v23, -1, -1);
      MEMORY[0x2611672F0](v22, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v27, v19);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    uint64_t v24 = (_OWORD *)v0[3];
    *uint64_t v24 = 0u;
    v24[1] = 0u;
    swift_task_dealloc();
    char v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
}

uint64_t sub_25B6AF2EC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v5 = sub_25B6AF49C;
  }
  else {
    uint64_t v5 = sub_25B6AF428;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25B6AF428()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25B6AF49C()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t SOSUIWebRTCView.pauseVideo()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6AF5A8, v3, v2);
}

uint64_t sub_25B6AF5A8()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6AF684;
  return sub_25B6AEEB4(v0 + 16, 0x6469566573756170, 0xEA00000000006F65, v1, v2);
}

uint64_t sub_25B6AF684()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_25B6AF818;
  }
  else
  {
    sub_25B6BF834(v2 + 16, &qword_26A508988);
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_25B6AF7B4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6AF7B4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6AF818()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6AF9F0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6AFA88, v4, v3);
}

uint64_t sub_25B6AFA88()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.pauseVideo()();
}

uint64_t SOSUIWebRTCView.pauseVideo(pausedString:)(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  sub_25B6D2AA0();
  v3[19] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v3[20] = v5;
  v3[21] = v4;
  return MEMORY[0x270FA2498](sub_25B6AFBD4, v5, v4);
}

uint64_t sub_25B6AFBD4()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v3 = swift_allocObject();
  v0[22] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_25B6D3960;
  strcpy((char *)(v3 + 32), "pausedString");
  *(unsigned char *)(v3 + 45) = 0;
  *(_WORD *)(v3 + 46) = -5120;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3960;
  strcpy((char *)(inited + 32), "pausedString");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = v2;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_25B6AED7C(inited);
  v0[23] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[24] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25B6AFD4C;
  return sub_25B6AEEB4((uint64_t)(v0 + 12), 0x6469566573756170, 0xEA00000000006F65, v3, v5);
}

uint64_t sub_25B6AFD4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    unint64_t v5 = sub_25B6AFEF0;
  }
  else
  {
    sub_25B6BF834(v2 + 96, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    unint64_t v5 = sub_25B6AFE8C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6AFE8C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6AFEF0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B00E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_25B6D2AA0();
  v3[5] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B0180, v5, v4);
}

uint64_t sub_25B6B0180()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  uint64_t v3 = sub_25B6D29D0();
  uint64_t v5 = v4;
  v0[7] = v4;
  id v6 = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25B6B025C;
  return SOSUIWebRTCView.pauseVideo(pausedString:)(v3, v5);
}

uint64_t sub_25B6B025C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 32);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v8 = (void *)sub_25B6D2910();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t SOSUIWebRTCView.unpauseVideo()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B0494, v3, v2);
}

uint64_t sub_25B6B0494()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x5665737561706E75, 0xEC0000006F656469, v1, v2);
}

uint64_t sub_25B6B057C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_25B6C1978;
  }
  else
  {
    sub_25B6BF834(v2 + 16, &qword_26A508988);
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_25B6C1990;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B0814(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B08AC, v4, v3);
}

uint64_t sub_25B6B08AC()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.unpauseVideo()();
}

uint64_t SOSUIWebRTCView.useFrontCamera()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B09F4, v3, v2);
}

uint64_t sub_25B6B09F4()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x746E6F7246657375, 0xEE006172656D6143, v1, v2);
}

uint64_t sub_25B6B0C48(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B0CE0, v4, v3);
}

uint64_t sub_25B6B0CE0()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.useFrontCamera()();
}

uint64_t SOSUIWebRTCView.useRearCamera()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B0E28, v3, v2);
}

uint64_t sub_25B6B0E28()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x4372616552657375, 0xED00006172656D61, v1, v2);
}

uint64_t sub_25B6B107C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B1114, v4, v3);
}

uint64_t sub_25B6B1114()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.useRearCamera()();
}

uint64_t SOSUIWebRTCView.startVideoPreview()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B125C, v3, v2);
}

uint64_t sub_25B6B125C()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0xD000000000000011, 0x800000025B6D55A0, v1, v2);
}

uint64_t sub_25B6B14A8(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B1540, v4, v3);
}

uint64_t sub_25B6B1540()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.startVideoPreview()();
}

uint64_t SOSUIWebRTCView.startVideoPreview(cameraFacing:)(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  sub_25B6D2AA0();
  v2[18] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_25B6B1688, v4, v3);
}

uint64_t sub_25B6B1688()
{
  uint64_t v1 = v0[16];
  sub_25B6AEC04();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25B6D3960;
  strcpy((char *)(v2 + 32), "cameraFacing");
  *(unsigned char *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3960;
  strcpy((char *)(inited + 32), "cameraFacing");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 72) = &type metadata for SOSUIWebRTCCameraFacing;
  *(void *)(inited + 48) = v1;
  unint64_t v4 = sub_25B6AED7C(inited);
  v0[22] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[23] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25B6B17F8;
  return sub_25B6AEEB4((uint64_t)(v0 + 12), 0xD000000000000011, 0x800000025B6D55A0, v2, v4);
}

uint64_t sub_25B6B17F8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25B6C1970;
  }
  else
  {
    sub_25B6BF834(v2 + 96, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25B6C1984;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B1AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_25B6D2AA0();
  v3[5] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B1B4C, v5, v4);
}

uint64_t sub_25B6B1B4C()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C1980;
  uint64_t v5 = v0[2];
  return SOSUIWebRTCView.startVideoPreview(cameraFacing:)(v5);
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:)(uint64_t a1, uint64_t a2)
{
  v3[2] = sub_25B6D2AA0();
  v3[3] = sub_25B6D2A90();
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x1C0);
  uint64_t v9 = (int *)((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  v3[4] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25B6ABAFC;
  return ((uint64_t (*)(uint64_t, uint64_t, void, unint64_t))v9)(a1, a2, 0, 0xE000000000000000);
}

uint64_t sub_25B6B1ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_25B6D2AA0();
  v3[6] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B1F78, v5, v4);
}

uint64_t sub_25B6B1F78()
{
  uint64_t v1 = (const void *)v0[3];
  uint64_t v2 = (void *)v0[4];
  swift_release();
  v0[7] = _Block_copy(v1);
  uint64_t v3 = sub_25B6D29D0();
  uint64_t v5 = v4;
  v0[8] = v4;
  uint64_t v6 = v2;
  v0[9] = sub_25B6D2A90();
  uint64_t v7 = *(int **)((*MEMORY[0x263F8EED0] & *v6) + 0x1C0);
  uint64_t v10 = (int *)((char *)v7 + *v7);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25B6B20EC;
  return ((uint64_t (*)(uint64_t, uint64_t, void, unint64_t))v10)(v3, v5, 0, 0xE000000000000000);
}

uint64_t sub_25B6B20EC()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25B6D2A70();
  if (v0) {
    uint64_t v4 = sub_25B6B22E0;
  }
  else {
    uint64_t v4 = sub_25B6B2248;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_25B6B2248()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void **)(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 56));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25B6B22E0()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void **)(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_25B6D2910();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 56));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:token:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[2] = sub_25B6D2AA0();
  v5[3] = sub_25B6D2A90();
  uint64_t v10 = *(int **)((*MEMORY[0x263F8EED0] & *v4) + 0x1C8);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  uint64_t v11 = (void *)swift_task_alloc();
  v5[4] = v11;
  void *v11 = v5;
  v11[1] = sub_25B6B2500;
  return v13(a1, a2, a3, a4, 1);
}

uint64_t sub_25B6B2500()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25B6D2A70();
  if (v0) {
    uint64_t v4 = sub_25B6B26C0;
  }
  else {
    uint64_t v4 = sub_25B6B265C;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_25B6B265C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B26C0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B28A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_25B6D2AA0();
  v4[7] = sub_25B6D2A90();
  uint64_t v6 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B2948, v6, v5);
}

uint64_t sub_25B6B2948()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  swift_release();
  v0[8] = _Block_copy(v1);
  uint64_t v3 = sub_25B6D29D0();
  uint64_t v5 = v4;
  v0[9] = v4;
  uint64_t v6 = sub_25B6D29D0();
  uint64_t v8 = v7;
  v0[10] = v7;
  uint64_t v9 = v2;
  v0[11] = sub_25B6D2A90();
  uint64_t v10 = *(int **)((*MEMORY[0x263F8EED0] & *v9) + 0x1C8);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  void *v11 = v0;
  v11[1] = sub_25B6B2ADC;
  return v13(v3, v5, v6, v8, 1);
}

uint64_t sub_25B6B2ADC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25B6D2A70();
  if (v0) {
    uint64_t v4 = sub_25B6B2CD8;
  }
  else {
    uint64_t v4 = sub_25B6B2C38;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_25B6B2C38()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 64));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25B6B2CD8()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void **)(v0 + 40);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_25B6D2910();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 64));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:token:trickle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 248) = a4;
  *(void *)(v6 + 256) = v5;
  *(unsigned char *)(v6 + 320) = a5;
  *(void *)(v6 + 232) = a2;
  *(void *)(v6 + 240) = a3;
  *(void *)(v6 + 224) = a1;
  sub_25B6D2AA0();
  *(void *)(v6 + 264) = sub_25B6D2A90();
  uint64_t v8 = sub_25B6D2A70();
  *(void *)(v6 + 272) = v8;
  *(void *)(v6 + 280) = v7;
  return MEMORY[0x270FA2498](sub_25B6B2E40, v8, v7);
}

uint64_t sub_25B6B2E40()
{
  char v11 = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v9 = *(void *)(v0 + 224);
  uint64_t v10 = *(void *)(v0 + 240);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 288) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_25B6D3970;
  *(void *)(v3 + 32) = 0x746E696F70646E65;
  *(void *)(v3 + 40) = 0xE800000000000000;
  *(void *)(v3 + 48) = 0x6E656B6F74;
  *(void *)(v3 + 56) = 0xE500000000000000;
  *(void *)(v3 + 64) = 0x656C6B63697274;
  *(void *)(v3 + 72) = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3970;
  *(void *)(inited + 32) = 0x746E696F70646E65;
  *(void *)(inited + 40) = 0xE800000000000000;
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x6E656B6F74;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v1;
  *(void *)(inited + 120) = v5;
  *(void *)(inited + 128) = 0x656C6B63697274;
  *(void *)(inited + 136) = 0xE700000000000000;
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25B6AED7C(inited);
  *(void *)(v0 + 296) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25B6B303C;
  return sub_25B6AEEB4(v0 + 192, 0xD000000000000010, 0x800000025B6D55C0, v3, v6);
}

uint64_t sub_25B6B303C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_25B6B31E0;
  }
  else
  {
    sub_25B6BF834(v2 + 192, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_25B6B317C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B317C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B31E0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B33EC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  *(unsigned char *)(v5 + 88) = a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_25B6D2AA0();
  *(void *)(v5 + 48) = sub_25B6D2A90();
  uint64_t v7 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B348C, v7, v6);
}

uint64_t sub_25B6B348C()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = *(const void **)(v0 + 32);
  swift_release();
  *(void *)(v0 + 56) = _Block_copy(v2);
  uint64_t v3 = sub_25B6D29D0();
  uint64_t v5 = v4;
  *(void *)(v0 + 64) = v4;
  uint64_t v6 = sub_25B6D29D0();
  uint64_t v8 = v7;
  *(void *)(v0 + 72) = v7;
  id v9 = v1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_25B6B3594;
  char v11 = *(unsigned char *)(v0 + 88);
  return SOSUIWebRTCView.startVideoStream(endpoint:token:trickle:)(v3, v5, v6, v8, v11);
}

uint64_t sub_25B6B3594()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 40);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 56);
  if (v2)
  {
    uint64_t v8 = (void *)sub_25B6D2910();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 56));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t SOSUIWebRTCView.endVideoStream()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B37F0, v3, v2);
}

uint64_t sub_25B6B37F0()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x6F65646956646E65, 0xEE006D6165727453, v1, v2);
}

uint64_t sub_25B6B3A3C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B3AD4, v4, v3);
}

uint64_t sub_25B6B3AD4()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.endVideoStream()();
}

uint64_t SOSUIWebRTCView.flipCamera()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B3C1C, v3, v2);
}

uint64_t sub_25B6B3C1C()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6AF684;
  return sub_25B6AEEB4(v0 + 16, 0x656D614370696C66, 0xEA00000000006172, v1, v2);
}

uint64_t sub_25B6B3E68(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B3F00, v4, v3);
}

uint64_t sub_25B6B3F00()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6B3FB0;
  return SOSUIWebRTCView.flipCamera()();
}

uint64_t sub_25B6B3FB0()
{
  unint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 40);
  if (v2)
  {
    uint64_t v8 = (void *)sub_25B6D2910();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 40));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t SOSUIWebRTCView.torchOn()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B41CC, v3, v2);
}

uint64_t sub_25B6B41CC()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x6E4F6863726F74, 0xE700000000000000, v1, v2);
}

uint64_t sub_25B6B4414(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B44AC, v4, v3);
}

uint64_t sub_25B6B44AC()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.torchOn()();
}

uint64_t SOSUIWebRTCView.torchOff()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B45F4, v3, v2);
}

uint64_t sub_25B6B45F4()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x66664F6863726F74, 0xE800000000000000, v1, v2);
}

uint64_t sub_25B6B483C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B48D4, v4, v3);
}

uint64_t sub_25B6B48D4()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.torchOff()();
}

uint64_t SOSUIWebRTCView.toggleTorch()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B4A1C, v3, v2);
}

uint64_t sub_25B6B4A1C()
{
  sub_25B6AEC04();
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x6F54656C67676F74, 0xEB00000000686372, v1, v2);
}

uint64_t sub_25B6B4C6C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B4D04, v4, v3);
}

uint64_t sub_25B6B4D04()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.toggleTorch()();
}

uint64_t SOSUIWebRTCView.setZoomLevel(zoom:)(double a1)
{
  *(void *)(v2 + 136) = v1;
  *(double *)(v2 + 128) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 144) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 152) = v4;
  *(void *)(v2 + 160) = v3;
  return MEMORY[0x270FA2498](sub_25B6B4E50, v4, v3);
}

uint64_t sub_25B6B4E50()
{
  uint64_t v1 = v0[16];
  sub_25B6AEC04();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25B6D3960;
  *(void *)(v2 + 32) = 1836019578;
  *(void *)(v2 + 40) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3960;
  *(void *)(inited + 32) = 1836019578;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 72) = MEMORY[0x263F8D538];
  *(void *)(inited + 48) = v1;
  unint64_t v4 = sub_25B6AED7C(inited);
  v0[22] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[23] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25B6B4FB8;
  return sub_25B6AEEB4((uint64_t)(v0 + 12), 0x4C6D6F6F5A746573, 0xEC0000006C657665, v2, v4);
}

uint64_t sub_25B6B4FB8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25B6B515C;
  }
  else
  {
    sub_25B6BF834(v2 + 96, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25B6B50F8;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B50F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B515C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B534C(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  *(double *)(v3 + 16) = a3;
  sub_25B6D2AA0();
  *(void *)(v3 + 40) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B53E8, v5, v4);
}

uint64_t sub_25B6B53E8()
{
  uint64_t v1 = (void *)*((void *)v0 + 4);
  uint64_t v2 = (const void *)*((void *)v0 + 3);
  swift_release();
  *((void *)v0 + 6) = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *((void *)v0 + 7) = v4;
  void *v4 = v0;
  v4[1] = sub_25B6B549C;
  double v5 = v0[2];
  return SOSUIWebRTCView.setZoomLevel(zoom:)(v5);
}

uint64_t sub_25B6B549C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  double v5 = *(void **)(*v1 + 32);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v8 = (void *)sub_25B6D2910();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t SOSUIWebRTCView.endVideoPreview()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6B56B8, v3, v2);
}

uint64_t sub_25B6B56B8()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0x6F65646956646E65, 0xEF77656976657250, v1, v2);
}

uint64_t sub_25B6B5904(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B599C, v4, v3);
}

uint64_t sub_25B6B599C()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.endVideoPreview()();
}

uint64_t SOSUIWebRTCView.getCapabilities()()
{
  v1[15] = v0;
  sub_25B6D2AA0();
  v1[16] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[17] = v3;
  v1[18] = v2;
  return MEMORY[0x270FA2498](sub_25B6B5AE4, v3, v2);
}

uint64_t sub_25B6B5AE4()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 152) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B5BC8;
  return sub_25B6AEEB4(v0 + 16, 0x6261706143746567, 0xEF73656974696C69, v1, v2);
}

uint64_t sub_25B6B5BC8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_25B6B5E24;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_25B6B5CE4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B5CE4()
{
  swift_release();
  sub_25B6C15E8(v0 + 16, v0 + 80, &qword_26A508988);
  if (*(void *)(v0 + 104))
  {
    sub_25B6BF260((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 48));
    uint64_t v1 = type metadata accessor for SOSUIWebtRTCCapabilities();
    unint64_t v2 = sub_25B6BF270();
    sub_25B6D13A0(v1, v0 + 48, v1, v2, v0 + 112);
    id v3 = *(id *)(v0 + 112);
    if (!v3) {
      id v3 = sub_25B6C7648(0);
    }
    __swift_destroy_boxed_opaque_existential_0(v0 + 48);
    uint64_t v4 = v0 + 16;
  }
  else
  {
    sub_25B6BF834(v0 + 80, &qword_26A508988);
    type metadata accessor for SOSUIWebtRTCCapabilities();
    id v3 = sub_25B6C7648(0);
    uint64_t v4 = v0 + 16;
  }
  sub_25B6BF834(v4, &qword_26A508988);
  uint64_t v5 = *(uint64_t (**)(id))(v0 + 8);
  return v5(v3);
}

uint64_t sub_25B6B5E24()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6B5FFC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B6094, v4, v3);
}

uint64_t sub_25B6B6094()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6B6144;
  return SOSUIWebRTCView.getCapabilities()();
}

uint64_t sub_25B6B6144(void *a1)
{
  id v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 24);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  uint64_t v8 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    id v9 = (void *)sub_25B6D2910();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t SOSUIWebRTCView.configure(_:)(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  sub_25B6D2AA0();
  v2[18] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_25B6B637C, v4, v3);
}

uint64_t sub_25B6B637C()
{
  uint64_t v1 = v0[16];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25B6D3960;
  *(void *)(v2 + 32) = 0x736E6F6974706FLL;
  *(void *)(v2 + 40) = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3960;
  *(void *)(inited + 32) = 0x736E6F6974706FLL;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 72) = &type metadata for SOSUIWebRTCConfiguration;
  uint64_t v4 = swift_allocObject();
  *(void *)(inited + 48) = v4;
  long long v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v4 + 32) = v5;
  long long v6 = *(_OWORD *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 32);
  long long v7 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v4 + 96) = v6;
  *(_OWORD *)(v4 + 48) = v8;
  *(_OWORD *)(v4 + 64) = v7;
  long long v10 = *(_OWORD *)(v1 + 112);
  long long v9 = *(_OWORD *)(v1 + 128);
  long long v11 = *(_OWORD *)(v1 + 96);
  *(unsigned char *)(v4 + 160) = *(unsigned char *)(v1 + 144);
  *(_OWORD *)(v4 + 128) = v10;
  *(_OWORD *)(v4 + 144) = v9;
  *(_OWORD *)(v4 + 112) = v11;
  sub_25B6BF350(v1);
  unint64_t v12 = sub_25B6AED7C(inited);
  v0[22] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  v0[23] = v13;
  void *v13 = v0;
  v13[1] = sub_25B6B4FB8;
  return sub_25B6AEEB4((uint64_t)(v0 + 12), 0x72756769666E6F63, 0xE900000000000065, v2, v12);
}

uint64_t SOSUIWebRTCView.setPoorConnectionThreshold(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B65CC, v4, v3);
}

uint64_t sub_25B6B65CC()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  char v15 = *(unsigned char *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 32);
  char v17 = *(unsigned char *)(v0 + 40);
  *(unsigned char *)(v0 + 400) = 0;
  *(unsigned char *)(v0 + 424) = v17;
  *(unsigned char *)(v0 + 376) = v15;
  *(unsigned char *)(v0 + 384) = v13;
  *(unsigned char *)(v0 + 392) = v11;
  *(unsigned char *)(v0 + 432) = v9;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v2;
  *(unsigned char *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = v16;
  *(unsigned char *)(v0 + 192) = v17;
  *(void *)(v0 + 200) = v14;
  *(unsigned char *)(v0 + 208) = v15;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B67C4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    char v5 = sub_25B6C1964;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    char v5 = sub_25B6C1998;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6B6A58(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B6AF8, v5, v4);
}

uint64_t sub_25B6B6AF8()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B6BA4, v5, v4);
}

uint64_t sub_25B6B6BA4()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  char v15 = *(unsigned char *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 32);
  char v17 = *(unsigned char *)(v0 + 40);
  *(unsigned char *)(v0 + 432) = 0;
  *(unsigned char *)(v0 + 456) = v17;
  *(unsigned char *)(v0 + 408) = v15;
  *(unsigned char *)(v0 + 416) = v13;
  *(unsigned char *)(v0 + 424) = v11;
  *(unsigned char *)(v0 + 464) = v9;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v2;
  *(unsigned char *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = v16;
  *(unsigned char *)(v0 + 192) = v17;
  *(void *)(v0 + 200) = v14;
  *(unsigned char *)(v0 + 208) = v15;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t sub_25B6B6D9C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    char v5 = sub_25B6C196C;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    char v5 = sub_25B6C198C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t SOSUIWebRTCView.setPoorConnectionGracePeriod(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B6F54, v4, v3);
}

uint64_t sub_25B6B6F54()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  char v15 = *(unsigned char *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = 0;
  *(unsigned char *)(v0 + 376) = v15;
  *(unsigned char *)(v0 + 384) = v13;
  *(unsigned char *)(v0 + 392) = v11;
  *(unsigned char *)(v0 + 432) = v9;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v2;
  *(unsigned char *)(v0 + 192) = 0;
  *(void *)(v0 + 200) = v14;
  *(unsigned char *)(v0 + 208) = v15;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B72C4(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B7364, v5, v4);
}

uint64_t sub_25B6B7364()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B7410, v5, v4);
}

uint64_t sub_25B6B7410()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  char v15 = *(unsigned char *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = 0;
  *(unsigned char *)(v0 + 408) = v15;
  *(unsigned char *)(v0 + 416) = v13;
  *(unsigned char *)(v0 + 424) = v11;
  *(unsigned char *)(v0 + 464) = v9;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v2;
  *(unsigned char *)(v0 + 192) = 0;
  *(void *)(v0 + 200) = v14;
  *(unsigned char *)(v0 + 208) = v15;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setIceRestartTimeout(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B76A4, v4, v3);
}

uint64_t sub_25B6B76A4()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = 0;
  *(unsigned char *)(v0 + 384) = v13;
  *(unsigned char *)(v0 + 392) = v11;
  *(unsigned char *)(v0 + 432) = v9;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v2;
  *(unsigned char *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B7A14(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B7AB4, v5, v4);
}

uint64_t sub_25B6B7AB4()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B7B60, v5, v4);
}

uint64_t sub_25B6B7B60()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  char v13 = *(unsigned char *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = 0;
  *(unsigned char *)(v0 + 416) = v13;
  *(unsigned char *)(v0 + 424) = v11;
  *(unsigned char *)(v0 + 464) = v9;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v2;
  *(unsigned char *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = v12;
  *(unsigned char *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setIceRestartRetryCount(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B7DF4, v4, v3);
}

uint64_t sub_25B6B7DF4()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = v13;
  *(unsigned char *)(v0 + 384) = 0;
  *(unsigned char *)(v0 + 392) = v11;
  *(unsigned char *)(v0 + 432) = v9;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v2;
  *(unsigned char *)(v0 + 224) = 0;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B8164(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B8204, v5, v4);
}

uint64_t sub_25B6B8204()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B82B0, v5, v4);
}

uint64_t sub_25B6B82B0()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 80);
  char v11 = *(unsigned char *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = v13;
  *(unsigned char *)(v0 + 416) = 0;
  *(unsigned char *)(v0 + 424) = v11;
  *(unsigned char *)(v0 + 464) = v9;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v2;
  *(unsigned char *)(v0 + 224) = 0;
  *(void *)(v0 + 232) = v10;
  *(unsigned char *)(v0 + 240) = v11;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setMinimumBitrate(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B8544, v4, v3);
}

uint64_t sub_25B6B8544()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = v13;
  *(unsigned char *)(v0 + 384) = v11;
  *(unsigned char *)(v0 + 392) = 0;
  *(unsigned char *)(v0 + 432) = v9;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v2;
  *(unsigned char *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B88B4(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B8954, v5, v4);
}

uint64_t sub_25B6B8954()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B8A00, v5, v4);
}

uint64_t sub_25B6B8A00()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  char v9 = *(unsigned char *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = v13;
  *(unsigned char *)(v0 + 416) = v11;
  *(unsigned char *)(v0 + 424) = 0;
  *(unsigned char *)(v0 + 464) = v9;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v2;
  *(unsigned char *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = v8;
  *(unsigned char *)(v0 + 256) = v9;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setMaximumBitrate(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6B8C94, v4, v3);
}

uint64_t sub_25B6B8C94()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = v13;
  *(unsigned char *)(v0 + 384) = v11;
  *(unsigned char *)(v0 + 392) = v9;
  *(unsigned char *)(v0 + 432) = 0;
  *(unsigned char *)(v0 + 408) = v7;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v2;
  *(unsigned char *)(v0 + 256) = 0;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6B9004(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B90A4, v5, v4);
}

uint64_t sub_25B6B90A4()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6B9150, v5, v4);
}

uint64_t sub_25B6B9150()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = v13;
  *(unsigned char *)(v0 + 416) = v11;
  *(unsigned char *)(v0 + 424) = v9;
  *(unsigned char *)(v0 + 464) = 0;
  *(unsigned char *)(v0 + 440) = v7;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v2;
  *(unsigned char *)(v0 + 256) = 0;
  *(void *)(v0 + 264) = v6;
  *(unsigned char *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  uint64_t v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setPausedString(_:)(uint64_t a1, uint64_t a2)
{
  v3[80] = v2;
  v3[79] = a2;
  v3[78] = a1;
  sub_25B6D2AA0();
  v3[81] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v3[82] = v5;
  v3[83] = v4;
  return MEMORY[0x270FA2498](sub_25B6B93EC, v5, v4);
}

uint64_t sub_25B6B93EC()
{
  uint64_t v1 = *(void *)(v0 + 632);
  uint64_t v22 = *(void *)(v0 + 624);
  uint64_t v24 = *(void **)(v0 + 640);
  sub_25B6C3828(v0 + 320);
  uint64_t v21 = *(void *)(v0 + 320);
  *(void *)(v0 + 672) = v21;
  char v2 = *(unsigned char *)(v0 + 328);
  uint64_t v20 = *(void *)(v0 + 336);
  *(void *)(v0 + 680) = v20;
  char v3 = *(unsigned char *)(v0 + 344);
  uint64_t v19 = *(void *)(v0 + 352);
  *(void *)(v0 + 688) = v19;
  char v4 = *(unsigned char *)(v0 + 360);
  uint64_t v18 = *(void *)(v0 + 368);
  *(void *)(v0 + 696) = v18;
  char v5 = *(unsigned char *)(v0 + 376);
  uint64_t v17 = *(void *)(v0 + 384);
  *(void *)(v0 + 704) = v17;
  char v6 = *(unsigned char *)(v0 + 392);
  uint64_t v15 = *(void *)(v0 + 400);
  *(void *)(v0 + 712) = v15;
  char v7 = *(unsigned char *)(v0 + 408);
  uint64_t v13 = *(void *)(v0 + 416);
  *(void *)(v0 + 720) = v13;
  char v8 = *(unsigned char *)(v0 + 424);
  char v16 = *(unsigned char *)(v0 + 448);
  *(unsigned char *)(v0 + 161) = v16;
  uint64_t v14 = *(void *)(v0 + 456);
  *(void *)(v0 + 728) = v14;
  char v9 = *(unsigned char *)(v0 + 464);
  *(unsigned char *)(v0 + 872) = v2;
  *(unsigned char *)(v0 + 808) = v3;
  *(unsigned char *)(v0 + 816) = v4;
  *(unsigned char *)(v0 + 824) = v5;
  *(unsigned char *)(v0 + 832) = v6;
  *(unsigned char *)(v0 + 840) = v7;
  *(unsigned char *)(v0 + 848) = v8;
  *(unsigned char *)(v0 + 856) = v9;
  swift_bridgeObjectRetain();
  sub_25B6BF37C(v0 + 320);
  *(unsigned char *)(v0 + 800) = v2;
  *(unsigned char *)(v0 + 864) = v3;
  *(unsigned char *)(v0 + 792) = v4;
  *(unsigned char *)(v0 + 784) = v5;
  *(unsigned char *)(v0 + 752) = v6;
  *(unsigned char *)(v0 + 760) = v7;
  *(unsigned char *)(v0 + 768) = v8;
  *(unsigned char *)(v0 + 776) = v9;
  *(void *)(v0 + 472) = v21;
  *(unsigned char *)(v0 + 480) = v2;
  *(void *)(v0 + 488) = v20;
  *(unsigned char *)(v0 + 496) = v3;
  *(void *)(v0 + 504) = v19;
  *(unsigned char *)(v0 + 512) = v4;
  *(void *)(v0 + 520) = v18;
  *(unsigned char *)(v0 + 528) = v5;
  *(void *)(v0 + 536) = v17;
  *(unsigned char *)(v0 + 544) = v6;
  *(void *)(v0 + 552) = v15;
  *(unsigned char *)(v0 + 560) = v7;
  *(void *)(v0 + 568) = v13;
  *(unsigned char *)(v0 + 576) = *(unsigned char *)(v0 + 768);
  *(void *)(v0 + 584) = v22;
  *(void *)(v0 + 592) = v1;
  *(unsigned char *)(v0 + 600) = v16;
  *(void *)(v0 + 608) = v14;
  *(unsigned char *)(v0 + 616) = *(unsigned char *)(v0 + 776);
  uint64_t v10 = *(int **)((*MEMORY[0x263F8EED0] & *v24) + 0x210);
  uint64_t v23 = (uint64_t (*)(uint64_t))((char *)v10 + *v10);
  char v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 736) = v11;
  void *v11 = v0;
  v11[1] = sub_25B6B96A8;
  return v23(v0 + 472);
}

uint64_t sub_25B6B96A8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 744) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 664);
  uint64_t v4 = *(void *)(v2 + 656);
  if (v0) {
    char v5 = sub_25B6B98F4;
  }
  else {
    char v5 = sub_25B6B97C4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25B6B97C4()
{
  uint64_t v13 = *(void *)(v0 + 728);
  char v12 = *(unsigned char *)(v0 + 161);
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 704);
  uint64_t v4 = *(void *)(v0 + 696);
  uint64_t v5 = *(void *)(v0 + 688);
  uint64_t v6 = *(void *)(v0 + 680);
  uint64_t v7 = *(void *)(v0 + 672);
  uint64_t v8 = *(void *)(v0 + 632);
  uint64_t v9 = *(void *)(v0 + 624);
  swift_release();
  *(void *)(v0 + 16) = v7;
  *(unsigned char *)(v0 + 24) = *(unsigned char *)(v0 + 872);
  *(void *)(v0 + 32) = v6;
  *(unsigned char *)(v0 + 40) = *(unsigned char *)(v0 + 808);
  *(void *)(v0 + 48) = v5;
  *(unsigned char *)(v0 + 56) = *(unsigned char *)(v0 + 816);
  *(void *)(v0 + 64) = v4;
  *(unsigned char *)(v0 + 72) = *(unsigned char *)(v0 + 824);
  *(void *)(v0 + 80) = v3;
  *(unsigned char *)(v0 + 88) = *(unsigned char *)(v0 + 832);
  *(void *)(v0 + 96) = v2;
  *(unsigned char *)(v0 + 104) = *(unsigned char *)(v0 + 840);
  *(void *)(v0 + 112) = v1;
  *(unsigned char *)(v0 + 120) = *(unsigned char *)(v0 + 848);
  *(void *)(v0 + 128) = v9;
  *(void *)(v0 + 136) = v8;
  *(unsigned char *)(v0 + 144) = v12;
  *(void *)(v0 + 152) = v13;
  *(unsigned char *)(v0 + 160) = *(unsigned char *)(v0 + 856);
  sub_25B6BF37C(v0 + 16);
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_25B6B98F4()
{
  uint64_t v13 = *(void *)(v0 + 728);
  char v12 = *(unsigned char *)(v0 + 161);
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 704);
  uint64_t v4 = *(void *)(v0 + 696);
  uint64_t v5 = *(void *)(v0 + 688);
  uint64_t v6 = *(void *)(v0 + 680);
  uint64_t v7 = *(void *)(v0 + 672);
  uint64_t v8 = *(void *)(v0 + 632);
  uint64_t v9 = *(void *)(v0 + 624);
  swift_release();
  *(void *)(v0 + 168) = v7;
  *(unsigned char *)(v0 + 176) = *(unsigned char *)(v0 + 872);
  *(void *)(v0 + 184) = v6;
  *(unsigned char *)(v0 + 192) = *(unsigned char *)(v0 + 808);
  *(void *)(v0 + 200) = v5;
  *(unsigned char *)(v0 + 208) = *(unsigned char *)(v0 + 816);
  *(void *)(v0 + 216) = v4;
  *(unsigned char *)(v0 + 224) = *(unsigned char *)(v0 + 824);
  *(void *)(v0 + 232) = v3;
  *(unsigned char *)(v0 + 240) = *(unsigned char *)(v0 + 832);
  *(void *)(v0 + 248) = v2;
  *(unsigned char *)(v0 + 256) = *(unsigned char *)(v0 + 840);
  *(void *)(v0 + 264) = v1;
  *(unsigned char *)(v0 + 272) = *(unsigned char *)(v0 + 848);
  *(void *)(v0 + 280) = v9;
  *(void *)(v0 + 288) = v8;
  *(unsigned char *)(v0 + 296) = v12;
  *(void *)(v0 + 304) = v13;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 856);
  sub_25B6BF37C(v0 + 168);
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_25B6B9BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_25B6D2AA0();
  v3[5] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6B9C3C, v5, v4);
}

uint64_t sub_25B6B9C3C()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  uint64_t v3 = sub_25B6D29D0();
  uint64_t v5 = v4;
  v0[7] = v4;
  id v6 = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25B6C1968;
  return SOSUIWebRTCView.setPausedString(_:)(v3, v5);
}

uint64_t SOSUIWebRTCView.setDebugConnection(_:)(char a1)
{
  *(void *)(v2 + 320) = v1;
  *(unsigned char *)(v2 + 161) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 328) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 336) = v4;
  *(void *)(v2 + 344) = v3;
  return MEMORY[0x270FA2498](sub_25B6B9DB4, v4, v3);
}

uint64_t sub_25B6B9DB4()
{
  uint64_t v1 = *(void **)(v0 + 320);
  char v2 = *(unsigned char *)(v0 + 161);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 112);
  char v6 = *(unsigned char *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 96);
  char v8 = *(unsigned char *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 80);
  char v10 = *(unsigned char *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 64);
  char v12 = *(unsigned char *)(v0 + 72);
  uint64_t v13 = *(void *)(v0 + 48);
  char v14 = *(unsigned char *)(v0 + 56);
  uint64_t v15 = *(void *)(v0 + 32);
  char v16 = *(unsigned char *)(v0 + 40);
  uint64_t v17 = *(void *)(v0 + 16);
  char v18 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 392) = v18;
  *(unsigned char *)(v0 + 416) = v16;
  *(unsigned char *)(v0 + 368) = v14;
  *(unsigned char *)(v0 + 376) = v12;
  *(unsigned char *)(v0 + 384) = v10;
  *(unsigned char *)(v0 + 424) = v8;
  *(unsigned char *)(v0 + 400) = v6;
  *(unsigned char *)(v0 + 408) = v4;
  *(void *)(v0 + 168) = v17;
  *(unsigned char *)(v0 + 176) = v18;
  *(void *)(v0 + 184) = v15;
  *(unsigned char *)(v0 + 192) = v16;
  *(void *)(v0 + 200) = v13;
  *(unsigned char *)(v0 + 208) = v14;
  *(void *)(v0 + 216) = v11;
  *(unsigned char *)(v0 + 224) = v12;
  *(void *)(v0 + 232) = v9;
  *(unsigned char *)(v0 + 240) = v10;
  *(void *)(v0 + 248) = v7;
  *(unsigned char *)(v0 + 256) = v8;
  *(void *)(v0 + 264) = v5;
  *(unsigned char *)(v0 + 272) = v6;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v2;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 408);
  uint64_t v19 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v22 = (uint64_t (*)(uint64_t))((char *)v19 + *v19);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_25B6B9FB4;
  return v22(v0 + 168);
}

uint64_t sub_25B6B9FB4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 360) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_25B6BA134;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_25B6BA0D0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6BA0D0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BA134()
{
  swift_release();
  sub_25B6BF37C(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BA31C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 320) = a2;
  *(void *)(v3 + 328) = a3;
  *(unsigned char *)(v3 + 161) = a1;
  *(void *)(v3 + 336) = sub_25B6D2AA0();
  *(void *)(v3 + 344) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6BA3BC, v5, v4);
}

uint64_t sub_25B6BA3BC()
{
  uint64_t v1 = (const void *)v0[40];
  uint64_t v2 = (void *)v0[41];
  swift_release();
  v0[44] = _Block_copy(v1);
  id v3 = v2;
  v0[45] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[46] = v5;
  v0[47] = v4;
  return MEMORY[0x270FA2498](sub_25B6BA468, v5, v4);
}

uint64_t sub_25B6BA468()
{
  uint64_t v1 = *(void **)(v0 + 328);
  char v2 = *(unsigned char *)(v0 + 161);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 112);
  char v6 = *(unsigned char *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 96);
  char v8 = *(unsigned char *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 80);
  char v10 = *(unsigned char *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 64);
  char v12 = *(unsigned char *)(v0 + 72);
  uint64_t v13 = *(void *)(v0 + 48);
  char v14 = *(unsigned char *)(v0 + 56);
  uint64_t v15 = *(void *)(v0 + 32);
  char v16 = *(unsigned char *)(v0 + 40);
  uint64_t v17 = *(void *)(v0 + 16);
  char v18 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 424) = v18;
  *(unsigned char *)(v0 + 448) = v16;
  *(unsigned char *)(v0 + 400) = v14;
  *(unsigned char *)(v0 + 408) = v12;
  *(unsigned char *)(v0 + 416) = v10;
  *(unsigned char *)(v0 + 456) = v8;
  *(unsigned char *)(v0 + 432) = v6;
  *(unsigned char *)(v0 + 440) = v4;
  *(void *)(v0 + 168) = v17;
  *(unsigned char *)(v0 + 176) = v18;
  *(void *)(v0 + 184) = v15;
  *(unsigned char *)(v0 + 192) = v16;
  *(void *)(v0 + 200) = v13;
  *(unsigned char *)(v0 + 208) = v14;
  *(void *)(v0 + 216) = v11;
  *(unsigned char *)(v0 + 224) = v12;
  *(void *)(v0 + 232) = v9;
  *(unsigned char *)(v0 + 240) = v10;
  *(void *)(v0 + 248) = v7;
  *(unsigned char *)(v0 + 256) = v8;
  *(void *)(v0 + 264) = v5;
  *(unsigned char *)(v0 + 272) = v6;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v2;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 440);
  uint64_t v19 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v22 = (uint64_t (*)(uint64_t))((char *)v19 + *v19);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_25B6BA668;
  return v22(v0 + 168);
}

uint64_t sub_25B6BA668()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 368);
    uint64_t v4 = *(void *)(v2 + 376);
    uint64_t v5 = sub_25B6BA808;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 368);
    uint64_t v4 = *(void *)(v2 + 376);
    uint64_t v5 = sub_25B6BA784;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6BA784()
{
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v2 = *(void **)(v0 + 328);
  swift_release();

  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 352));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25B6BA808()
{
  uint64_t v1 = *(void **)(v0 + 392);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void **)(v0 + 328);
  swift_release();
  sub_25B6BF37C(v0 + 16);

  uint64_t v4 = (void *)sub_25B6D2910();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 352));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t SOSUIWebRTCView.setVideoPreference(_:)(uint64_t a1)
{
  v2[40] = a1;
  v2[41] = v1;
  sub_25B6D2AA0();
  v2[42] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  v2[43] = v4;
  v2[44] = v3;
  return MEMORY[0x270FA2498](sub_25B6BA954, v4, v3);
}

uint64_t sub_25B6BA954()
{
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v1 = *(void **)(v0 + 328);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 96);
  char v7 = *(unsigned char *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = v13;
  *(unsigned char *)(v0 + 384) = v11;
  *(unsigned char *)(v0 + 392) = v9;
  *(unsigned char *)(v0 + 432) = v7;
  *(unsigned char *)(v0 + 408) = 0;
  *(unsigned char *)(v0 + 416) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v6;
  *(unsigned char *)(v0 + 256) = v7;
  *(void *)(v0 + 264) = v2;
  *(unsigned char *)(v0 + 272) = 0;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  char v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B67C4;
  return v21(v0 + 168);
}

uint64_t sub_25B6BACC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[41] = a2;
  v3[42] = a3;
  v3[40] = a1;
  v3[43] = sub_25B6D2AA0();
  v3[44] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6BAD60, v5, v4);
}

uint64_t sub_25B6BAD60()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6BAE0C, v5, v4);
}

uint64_t sub_25B6BAE0C()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 152);
  char v4 = *(unsigned char *)(v0 + 160);
  char v5 = *(unsigned char *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 96);
  char v7 = *(unsigned char *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = v13;
  *(unsigned char *)(v0 + 416) = v11;
  *(unsigned char *)(v0 + 424) = v9;
  *(unsigned char *)(v0 + 464) = v7;
  *(unsigned char *)(v0 + 440) = 0;
  *(unsigned char *)(v0 + 448) = v4;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v6;
  *(unsigned char *)(v0 + 256) = v7;
  *(void *)(v0 + 264) = v2;
  *(unsigned char *)(v0 + 272) = 0;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v3;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  char v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6B6D9C;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setFrameRate(_:)(double a1)
{
  *(void *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 336) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v3;
  return MEMORY[0x270FA2498](sub_25B6BB0A0, v4, v3);
}

uint64_t sub_25B6BB0A0()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 112);
  char v5 = *(unsigned char *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 96);
  char v7 = *(unsigned char *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 400) = v17;
  *(unsigned char *)(v0 + 424) = v15;
  *(unsigned char *)(v0 + 376) = v13;
  *(unsigned char *)(v0 + 384) = v11;
  *(unsigned char *)(v0 + 392) = v9;
  *(unsigned char *)(v0 + 432) = v7;
  *(unsigned char *)(v0 + 408) = v5;
  *(unsigned char *)(v0 + 416) = 0;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v6;
  *(unsigned char *)(v0 + 256) = v7;
  *(void *)(v0 + 264) = v4;
  *(unsigned char *)(v0 + 272) = *(unsigned char *)(v0 + 408);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v3;
  *(void *)(v0 + 304) = v2;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 416);
  char v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6BB298;
  return v21(v0 + 168);
}

uint64_t sub_25B6BB298()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    char v5 = sub_25B6BB418;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 344);
    uint64_t v4 = *(void *)(v2 + 352);
    char v5 = sub_25B6BB3B4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6BB3B4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BB418()
{
  swift_release();
  sub_25B6BF37C(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BB600(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 328) = a1;
  *(void *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(void *)(v3 + 344) = sub_25B6D2AA0();
  *(void *)(v3 + 352) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6BB6A0, v5, v4);
}

uint64_t sub_25B6BB6A0()
{
  uint64_t v1 = (const void *)v0[41];
  uint64_t v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  id v3 = v2;
  v0[46] = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  v0[47] = v5;
  v0[48] = v4;
  return MEMORY[0x270FA2498](sub_25B6BB74C, v5, v4);
}

uint64_t sub_25B6BB74C()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_25B6C3828(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 112);
  char v5 = *(unsigned char *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 96);
  char v7 = *(unsigned char *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  char v11 = *(unsigned char *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  char v13 = *(unsigned char *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 32);
  char v15 = *(unsigned char *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 16);
  char v17 = *(unsigned char *)(v0 + 24);
  *(unsigned char *)(v0 + 432) = v17;
  *(unsigned char *)(v0 + 456) = v15;
  *(unsigned char *)(v0 + 408) = v13;
  *(unsigned char *)(v0 + 416) = v11;
  *(unsigned char *)(v0 + 424) = v9;
  *(unsigned char *)(v0 + 464) = v7;
  *(unsigned char *)(v0 + 440) = v5;
  *(unsigned char *)(v0 + 448) = 0;
  *(void *)(v0 + 168) = v16;
  *(unsigned char *)(v0 + 176) = v17;
  *(void *)(v0 + 184) = v14;
  *(unsigned char *)(v0 + 192) = v15;
  *(void *)(v0 + 200) = v12;
  *(unsigned char *)(v0 + 208) = v13;
  *(void *)(v0 + 216) = v10;
  *(unsigned char *)(v0 + 224) = v11;
  *(void *)(v0 + 232) = v8;
  *(unsigned char *)(v0 + 240) = v9;
  *(void *)(v0 + 248) = v6;
  *(unsigned char *)(v0 + 256) = v7;
  *(void *)(v0 + 264) = v4;
  *(unsigned char *)(v0 + 272) = *(unsigned char *)(v0 + 440);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(unsigned char *)(v0 + 296) = v3;
  *(void *)(v0 + 304) = v2;
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 448);
  char v18 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x210);
  uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_25B6BB944;
  return v21(v0 + 168);
}

uint64_t sub_25B6BB944()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    char v5 = sub_25B6BBAE4;
  }
  else
  {
    sub_25B6BF37C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    char v5 = sub_25B6BBA60;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6BBA60()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void **)(v0 + 336);
  swift_release();

  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 360));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25B6BBAE4()
{
  uint64_t v1 = *(void **)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 360);
  uint64_t v3 = *(void **)(v0 + 336);
  swift_release();
  sub_25B6BF37C(v0 + 16);

  uint64_t v4 = (void *)sub_25B6D2910();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 360));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t SOSUIWebRTCView.goToError(retryable:)(char a1)
{
  *(void *)(v2 + 128) = v1;
  *(unsigned char *)(v2 + 192) = a1;
  sub_25B6D2AA0();
  *(void *)(v2 + 136) = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  *(void *)(v2 + 144) = v4;
  *(void *)(v2 + 152) = v3;
  return MEMORY[0x270FA2498](sub_25B6BBC34, v4, v3);
}

uint64_t sub_25B6BBC34()
{
  char v1 = *(unsigned char *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508998);
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 160) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_25B6D3960;
  *(void *)(v2 + 32) = 0x6C62617972746572;
  *(void *)(v2 + 40) = 0xE900000000000065;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5089A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25B6D3960;
  *(void *)(inited + 32) = 0x6C62617972746572;
  *(void *)(inited + 40) = 0xE900000000000065;
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = v1;
  unint64_t v4 = sub_25B6AED7C(inited);
  *(void *)(v0 + 168) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25B6BBD94;
  return sub_25B6AEEB4(v0 + 96, 0x6F7272456F546F67, 0xE900000000000072, v2, v4);
}

uint64_t sub_25B6BBD94()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = *(void *)(v2 + 152);
    uint64_t v5 = sub_25B6BBF38;
  }
  else
  {
    sub_25B6BF834(v2 + 96, &qword_26A508988);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = *(void *)(v2 + 152);
    uint64_t v5 = sub_25B6BBED4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6BBED4()
{
  swift_release();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BBF38()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6BC128(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  sub_25B6D2AA0();
  *(void *)(v3 + 32) = sub_25B6D2A90();
  uint64_t v5 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6BC1C4, v5, v4);
}

uint64_t sub_25B6BC1C4()
{
  char v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(const void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  char v5 = *(unsigned char *)(v0 + 56);
  return SOSUIWebRTCView.goToError(retryable:)(v5);
}

uint64_t SOSUIWebRTCView.networkInterfacesDidChange()()
{
  v1[6] = v0;
  sub_25B6D2AA0();
  v1[7] = sub_25B6D2A90();
  uint64_t v3 = sub_25B6D2A70();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25B6BC314, v3, v2);
}

uint64_t sub_25B6BC314()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25B6B057C;
  return sub_25B6AEEB4(v0 + 16, 0xD00000000000001ALL, 0x800000025B6D55E0, v1, v2);
}

uint64_t sub_25B6BC558(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_25B6D2AA0();
  v2[4] = sub_25B6D2A90();
  uint64_t v4 = sub_25B6D2A70();
  return MEMORY[0x270FA2498](sub_25B6BC5F0, v4, v3);
}

uint64_t sub_25B6BC5F0()
{
  uint64_t v1 = (void *)v0[3];
  unint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6C197C;
  return SOSUIWebRTCView.networkInterfacesDidChange()();
}

void sub_25B6BC6A0(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_25B6D2990();
  uint64_t v181 = *(void *)(v4 - 8);
  uint64_t v182 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v175 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  v175 = (char *)&v175 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v176 = (char *)&v175 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v177 = (char *)&v175 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v178 = (char *)&v175 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v179 = (char *)&v175 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v175 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v175 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v175 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v175 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  v32 = (char *)&v175 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v175 - v34;
  uint64_t v36 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0xD0))(v33);
  if (v36)
  {
    id v180 = v36;
    unint64_t v37 = a1;
    switch(a1 >> 61)
    {
      case 1uLL:
        unint64_t v66 = a1;
        char v67 = *(unsigned char *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_retryable);
        v68 = (char *)(id)(a1 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v69 = sub_25B6AA1CC();
        uint64_t v70 = v181;
        v71 = *(void (**)(char *, uint64_t, uint64_t))(v181 + 16);
        if (v67)
        {
          uint64_t v72 = v182;
          v71(v32, v69, v182);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          v73 = sub_25B6D2970();
          os_log_type_t v74 = sub_25B6D2B00();
          if (os_log_type_enabled(v73, v74))
          {
            uint64_t v75 = swift_slowAlloc();
            v179 = (char *)swift_slowAlloc();
            v183[0] = (uint64_t)v179;
            *(_DWORD *)uint64_t v75 = 134218754;
            id v184 = *(id *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode];
            sub_25B6D2B50();
            *(_WORD *)(v75 + 12) = 2080;
            uint64_t v76 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error];
            unint64_t v77 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error + 8];
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v76, v77, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            *(_WORD *)(v75 + 22) = 2080;
            Swift::String v78 = SOSUIWebRTCStateName.getValue()();
            id v184 = (id)sub_25B6BE940(v78._countAndFlagsBits, (unint64_t)v78._object, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);
            *(_WORD *)(v75 + 32) = 2080;
            uint64_t v79 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack];
            unint64_t v80 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack + 8];
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v79, v80, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);
            _os_log_impl(&dword_25B6A7000, v73, v74, "SOSUIWebRTCView.messageWasReceived: web client retryable fatal error message received:\nerrorCode: %ld\nerror: %s\nlast state: %s\nstack: %s", (uint8_t *)v75, 0x2Au);
            v81 = v179;
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v81, -1, -1);
            MEMORY[0x2611672F0](v75, -1, -1);

            (*(void (**)(char *, uint64_t))(v181 + 8))(v32, v182);
          }
          else
          {
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);

            (*(void (**)(char *, uint64_t))(v70 + 8))(v32, v72);
          }
        }
        else
        {
          uint64_t v123 = v182;
          v71(v29, v69, v182);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          sub_25B6BF3F4(v66);
          v124 = sub_25B6D2970();
          os_log_type_t v125 = sub_25B6D2B00();
          if (os_log_type_enabled(v124, v125))
          {
            uint64_t v126 = swift_slowAlloc();
            v179 = (char *)swift_slowAlloc();
            v183[0] = (uint64_t)v179;
            *(_DWORD *)uint64_t v126 = 134218754;
            id v184 = *(id *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode];
            sub_25B6D2B50();
            *(_WORD *)(v126 + 12) = 2080;
            uint64_t v127 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error];
            unint64_t v128 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error + 8];
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v127, v128, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            *(_WORD *)(v126 + 22) = 2080;
            Swift::String v129 = SOSUIWebRTCStateName.getValue()();
            id v184 = (id)sub_25B6BE940(v129._countAndFlagsBits, (unint64_t)v129._object, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);
            *(_WORD *)(v126 + 32) = 2080;
            uint64_t v130 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack];
            unint64_t v131 = *(void *)&v68[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack + 8];
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v130, v131, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);
            _os_log_impl(&dword_25B6A7000, v124, v125, "SOSUIWebRTCView.messageWasReceived: web client fatal error message received:\nerrorCode: %ld\nerror: %s\nlast state: %s\nstack: %s", (uint8_t *)v126, 0x2Au);
            v132 = v179;
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v132, -1, -1);
            MEMORY[0x2611672F0](v126, -1, -1);

            (*(void (**)(char *, uint64_t))(v181 + 8))(v29, v182);
          }
          else
          {
            sub_25B6BF3A8(v66);
            sub_25B6BF3A8(v66);

            (*(void (**)(char *, uint64_t))(v70 + 8))(v29, v123);
          }
        }
        objc_msgSend(v180, sel_webRTCErrorWithError_, v68);
        swift_unknownObjectRelease();
        unint64_t v119 = v66;
        goto LABEL_53;
      case 2uLL:
        v82 = (id)(a1 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v83 = sub_25B6AA1CC();
        uint64_t v84 = v181;
        uint64_t v85 = v182;
        (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v26, v83, v182);
        sub_25B6BF3F4(v37);
        unint64_t v86 = v37;
        v87 = sub_25B6D2970();
        os_log_type_t v88 = sub_25B6D2B10();
        if (os_log_type_enabled(v87, v88))
        {
          uint64_t v89 = swift_slowAlloc();
          *(_DWORD *)uint64_t v89 = 134219520;
          double v90 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate + 8]) {
            double v90 = 0.0;
          }
          *(double *)v183 = v90;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 12) = 2048;
          double v91 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate + 8]) {
            double v91 = 0.0;
          }
          *(double *)v183 = v91;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 22) = 2048;
          double v92 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss + 8]) {
            double v92 = 0.0;
          }
          *(double *)v183 = v92;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 32) = 2048;
          double v93 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime + 8]) {
            double v93 = 0.0;
          }
          *(double *)v183 = v93;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 42) = 2048;
          double v94 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond + 8]) {
            double v94 = 0.0;
          }
          *(double *)v183 = v94;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 52) = 1024;
          LODWORD(v183[0]) = v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_connectionPoor] & 1;
          sub_25B6D2B50();
          *(_WORD *)(v89 + 58) = 2048;
          double v95 = *(double *)&v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter];
          if (v82[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter + 8]) {
            double v95 = 0.0;
          }
          *(double *)v183 = v95;
          sub_25B6D2B50();
          sub_25B6BF3A8(v86);
          _os_log_impl(&dword_25B6A7000, v87, v88, "SOSUIWebRTCView.messageWasReceived: web client quality message received:\nbitrate: %f\navailableBitrate: %f\npacketLoss: %f\ncurrentRoundTripTime: %f\nframesPerSecond: %f\nconnectionPoor: %{BOOL}d\njitter: %f", (uint8_t *)v89, 0x44u);
          MEMORY[0x2611672F0](v89, -1, -1);
        }
        else
        {
          sub_25B6BF3A8(v86);
        }

        (*(void (**)(char *, uint64_t))(v84 + 8))(v26, v85);
        objc_msgSend(v180, sel_videoStreamQualityChangedWithQuality_, v82);
        swift_unknownObjectRelease();
        unint64_t v119 = v86;
        goto LABEL_53;
      case 3uLL:
        unint64_t v96 = a1;
        uint64_t v97 = a1 & 0x1FFFFFFFFFFFFFFFLL;
        v98 = (uint64_t *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_level);
        uint64_t v99 = *v98;
        uint64_t v100 = v98[1];
        BOOL v101 = *v98 == 0x6775626564 && v100 == 0xE500000000000000;
        if (v101 || (sub_25B6D2D90() & 1) != 0)
        {
          sub_25B6BF3F4(a1);
          uint64_t v102 = sub_25B6AA1CC();
          uint64_t v104 = v181;
          uint64_t v103 = v182;
          (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v20, v102, v182);
          sub_25B6BF3F4(v96);
          v105 = sub_25B6D2970();
          os_log_type_t v106 = sub_25B6D2AE0();
          if (os_log_type_enabled(v105, v106))
          {
            v107 = (uint8_t *)swift_slowAlloc();
            uint64_t v108 = swift_slowAlloc();
            v183[0] = v108;
            *(_DWORD *)v107 = 136315138;
            v179 = (char *)(v107 + 4);
            uint64_t v109 = v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message;
            uint64_t v110 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
            unint64_t v111 = *(void *)(v109 + 8);
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v110, v111, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v96);
            _os_log_impl(&dword_25B6A7000, v105, v106, "SOSUIWebRTCView.messageWasReceived: %s", v107, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v108, -1, -1);
            MEMORY[0x2611672F0](v107, -1, -1);

            sub_25B6BF3A8(v96);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v104 + 8))(v20, v182);
          }
          else
          {
            sub_25B6BF3A8(v96);

            swift_unknownObjectRelease();
            sub_25B6BF3A8(v96);
            (*(void (**)(char *, uint64_t))(v104 + 8))(v20, v103);
          }
          return;
        }
        BOOL v133 = v99 == 0x726F727265 && v100 == 0xE500000000000000;
        if (v133 || (sub_25B6D2D90() & 1) != 0)
        {
          sub_25B6BF3F4(a1);
          uint64_t v134 = sub_25B6AA1CC();
          uint64_t v136 = v181;
          uint64_t v135 = v182;
          v137 = v179;
          (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v179, v134, v182);
          sub_25B6BF3F4(v96);
          v138 = sub_25B6D2970();
          os_log_type_t v139 = sub_25B6D2AF0();
          if (os_log_type_enabled(v138, v139))
          {
            v140 = (uint8_t *)swift_slowAlloc();
            uint64_t v141 = swift_slowAlloc();
            v183[0] = v141;
            *(_DWORD *)v140 = 136315138;
            v178 = (char *)(v140 + 4);
            uint64_t v142 = v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message;
            uint64_t v143 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
            unint64_t v144 = *(void *)(v142 + 8);
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v143, v144, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(v96);
            _os_log_impl(&dword_25B6A7000, v138, v139, "SOSUIWebRTCView.messageWasReceived: %s", v140, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v141, -1, -1);
            MEMORY[0x2611672F0](v140, -1, -1);

            sub_25B6BF3A8(v96);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v136 + 8))(v137, v182);
          }
          else
          {
            sub_25B6BF3A8(v96);

            swift_unknownObjectRelease();
            sub_25B6BF3A8(v96);
            (*(void (**)(char *, uint64_t))(v136 + 8))(v137, v135);
          }
          return;
        }
        if (v99 == 1868983913 && v100 == 0xE400000000000000 || (sub_25B6D2D90() & 1) != 0)
        {
          sub_25B6BF3F4(a1);
          uint64_t v145 = sub_25B6AA1CC();
          uint64_t v147 = v181;
          uint64_t v146 = v182;
          v148 = v178;
          (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v178, v145, v182);
          sub_25B6BF3F4(a1);
          v149 = sub_25B6D2970();
          os_log_type_t v150 = sub_25B6D2AD0();
          if (os_log_type_enabled(v149, v150))
          {
            v151 = (uint8_t *)swift_slowAlloc();
            uint64_t v152 = swift_slowAlloc();
            v183[0] = v152;
            *(_DWORD *)v151 = 136315138;
            uint64_t v153 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
            unint64_t v154 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message + 8);
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v153, v154, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(a1);
            _os_log_impl(&dword_25B6A7000, v149, v150, "SOSUIWebRTCView.messageWasReceived: %s", v151, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v152, -1, -1);
            MEMORY[0x2611672F0](v151, -1, -1);

            sub_25B6BF3A8(a1);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v147 + 8))(v178, v182);
            return;
          }
LABEL_72:
          sub_25B6BF3A8(a1);

          swift_unknownObjectRelease();
          sub_25B6BF3A8(a1);
          (*(void (**)(char *, uint64_t))(v147 + 8))(v148, v146);
          return;
        }
        if (v99 == 6778732 && v100 == 0xE300000000000000 || (sub_25B6D2D90() & 1) != 0)
        {
          sub_25B6BF3F4(a1);
          uint64_t v155 = sub_25B6AA1CC();
          uint64_t v147 = v181;
          uint64_t v146 = v182;
          v148 = v177;
          (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v177, v155, v182);
          sub_25B6BF3F4(a1);
          v149 = sub_25B6D2970();
          os_log_type_t v156 = sub_25B6D2B10();
          if (os_log_type_enabled(v149, v156))
          {
            v157 = (uint8_t *)swift_slowAlloc();
            uint64_t v158 = swift_slowAlloc();
            v183[0] = v158;
            *(_DWORD *)v157 = 136315138;
            uint64_t v159 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
            unint64_t v160 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message + 8);
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v159, v160, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(a1);
            _os_log_impl(&dword_25B6A7000, v149, v156, "SOSUIWebRTCView.messageWasReceived: %s", v157, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v158, -1, -1);
            MEMORY[0x2611672F0](v157, -1, -1);

            sub_25B6BF3A8(a1);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v147 + 8))(v177, v182);
            return;
          }
          goto LABEL_72;
        }
        uint64_t v147 = v181;
        uint64_t v146 = v182;
        if (v99 == 1852989815 && v100 == 0xE400000000000000 || (sub_25B6D2D90() & 1) != 0)
        {
          sub_25B6BF3F4(a1);
          uint64_t v161 = sub_25B6AA1CC();
          v148 = v176;
          (*(void (**)(char *, uint64_t, uint64_t))(v147 + 16))(v176, v161, v146);
          sub_25B6BF3F4(a1);
          v149 = sub_25B6D2970();
          os_log_type_t v162 = sub_25B6D2AF0();
          if (os_log_type_enabled(v149, v162))
          {
            v163 = (uint8_t *)swift_slowAlloc();
            uint64_t v164 = swift_slowAlloc();
            v183[0] = v164;
            *(_DWORD *)v163 = 136315138;
            uint64_t v165 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
            unint64_t v166 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message + 8);
            swift_bridgeObjectRetain();
            id v184 = (id)sub_25B6BE940(v165, v166, v183);
            sub_25B6D2B50();
            swift_bridgeObjectRelease();
            sub_25B6BF3A8(a1);
            _os_log_impl(&dword_25B6A7000, v149, v162, "SOSUIWebRTCView.messageWasReceived: %s", v163, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611672F0](v164, -1, -1);
            MEMORY[0x2611672F0](v163, -1, -1);

            sub_25B6BF3A8(a1);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v147 + 8))(v176, v182);
            return;
          }
          goto LABEL_72;
        }
        sub_25B6BF3F4(a1);
        uint64_t v167 = sub_25B6AA1CC();
        v168 = v175;
        (*(void (**)(char *, uint64_t, uint64_t))(v147 + 16))(v175, v167, v146);
        sub_25B6BF3F4(a1);
        v169 = sub_25B6D2970();
        os_log_type_t v170 = sub_25B6D2B10();
        if (os_log_type_enabled(v169, v170))
        {
          v171 = (uint8_t *)swift_slowAlloc();
          uint64_t v172 = swift_slowAlloc();
          v183[0] = v172;
          *(_DWORD *)v171 = 136315138;
          v179 = (char *)(v171 + 4);
          uint64_t v173 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
          unint64_t v174 = *(void *)(v97 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message + 8);
          swift_bridgeObjectRetain();
          id v184 = (id)sub_25B6BE940(v173, v174, v183);
          sub_25B6D2B50();
          swift_bridgeObjectRelease();
          sub_25B6BF3A8(a1);
          _os_log_impl(&dword_25B6A7000, v169, v170, "SOSUIWebRTCView.messageWasReceived: %s", v171, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611672F0](v172, -1, -1);
          MEMORY[0x2611672F0](v171, -1, -1);

          sub_25B6BF3A8(a1);
          swift_unknownObjectRelease();
        }
        else
        {
          sub_25B6BF3A8(a1);

          swift_unknownObjectRelease();
          sub_25B6BF3A8(a1);
        }
        (*(void (**)(char *, uint64_t))(v147 + 8))(v168, v182);
        break;
      case 4uLL:
        id v58 = (id)(a1 & 0x1FFFFFFFFFFFFFFFLL);
        uint64_t v59 = sub_25B6AA1CC();
        uint64_t v60 = v181;
        uint64_t v61 = v182;
        (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v7, v59, v182);
        uint64_t v62 = (char *)v58;
        v63 = sub_25B6D2970();
        os_log_type_t v64 = sub_25B6D2B10();
        if (os_log_type_enabled(v63, v64))
        {
          v65 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v65 = 134217984;
          v183[0] = *(void *)(*(void *)&v62[OBJC_IVAR____TtC5SOSUI32SOSUIWebRTCConnectionInfoMessage_addresses]
                              + 16);
          sub_25B6D2B50();
          sub_25B6BF3A8(a1);
          _os_log_impl(&dword_25B6A7000, v63, v64, "SOSUIWebRTCView.messageWasReceived: connectedMessage received with %ld addresses", v65, 0xCu);
          MEMORY[0x2611672F0](v65, -1, -1);
        }
        else
        {
          sub_25B6BF3A8(a1);
        }

        (*(void (**)(char *, uint64_t))(v60 + 8))(v7, v61);
        swift_bridgeObjectRetain();
        v118 = (void *)sub_25B6D2A60();
        swift_bridgeObjectRelease();
        objc_msgSend(v180, sel_connectedWithAddresses_, v118);
        swift_unknownObjectRelease();

        unint64_t v119 = a1;
        goto LABEL_53;
      case 5uLL:
        uint64_t v112 = sub_25B6AA1CC();
        uint64_t v113 = v181;
        uint64_t v114 = v182;
        (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v23, v112, v182);
        v115 = sub_25B6D2970();
        os_log_type_t v116 = sub_25B6D2B10();
        if (os_log_type_enabled(v115, v116))
        {
          v117 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v117 = 0;
          _os_log_impl(&dword_25B6A7000, v115, v116, "SOSUIWebRTCView.messageWasReceived: web client call lost message received", v117, 2u);
          MEMORY[0x2611672F0](v117, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v113 + 8))(v23, v114);
        objc_msgSend(v180, sel_videoStreamLost);
        swift_unknownObjectRelease();
        return;
      default:
        id v38 = (id)a1;
        uint64_t v39 = sub_25B6AA1CC();
        uint64_t v40 = v181;
        uint64_t v41 = v182;
        (*(void (**)(char *, uint64_t, uint64_t))(v181 + 16))(v35, v39, v182);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        sub_25B6BF3F4(a1);
        id v42 = (unsigned __int8 *)v38;
        uint64_t v43 = sub_25B6D2970();
        os_log_type_t v44 = sub_25B6D2B10();
        int v45 = v44;
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v46 = swift_slowAlloc();
          LODWORD(v177) = v45;
          uint64_t v47 = v46;
          v178 = (char *)swift_slowAlloc();
          v183[0] = (uint64_t)v178;
          *(_DWORD *)uint64_t v47 = 136316674;
          v179 = v35;
          Swift::String v48 = SOSUIWebRTCStateName.getValue()();
          id v184 = (id)sub_25B6BE940(v48._countAndFlagsBits, (unint64_t)v48._object, v183);
          sub_25B6D2B50();
          swift_bridgeObjectRelease();
          sub_25B6BF3A8(a1);
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 12) = 1024;
          int v49 = v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected];
          sub_25B6BF3A8(a1);
          LODWORD(v184) = v49;
          sub_25B6D2B50();
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 18) = 1024;
          int v50 = v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive];
          sub_25B6BF3A8(a1);
          LODWORD(v184) = v50;
          sub_25B6D2B50();
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 24) = 2080;
          uint64_t v51 = sub_25B6C1DEC(*(void *)&v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing]);
          id v184 = (id)sub_25B6BE940(v51, v52, v183);
          sub_25B6D2B50();
          swift_bridgeObjectRelease();
          sub_25B6BF3A8(a1);
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 34) = 2048;
          id v184 = *(id *)&v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel];
          sub_25B6D2B50();
          sub_25B6BF3A8(a1);
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 44) = 1024;
          int v53 = v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch];
          sub_25B6BF3A8(a1);
          LODWORD(v184) = v53;
          sub_25B6D2B50();
          sub_25B6BF3A8(a1);
          *(_WORD *)(v47 + 50) = 2080;
          id v184 = *(id *)&v42[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error];
          id v54 = v184;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A508A98);
          uint64_t v55 = sub_25B6D2A20();
          id v184 = (id)sub_25B6BE940(v55, v56, v183);
          sub_25B6D2B50();
          swift_bridgeObjectRelease();
          sub_25B6BF3A8(a1);
          sub_25B6BF3A8(a1);
          _os_log_impl(&dword_25B6A7000, v43, (os_log_type_t)v177, "SOSUIWebRTCView.messageWasReceived: web client state message received: (%s):\nconnected: %{BOOL}d\ncameraActive: %{BOOL}d\ncameraFacing: %s\nzoomLevel: %f\ntorch: %{BOOL}d\nerror: %s", (uint8_t *)v47, 0x3Cu);
          uint64_t v57 = v178;
          swift_arrayDestroy();
          MEMORY[0x2611672F0](v57, -1, -1);
          MEMORY[0x2611672F0](v47, -1, -1);

          (*(void (**)(char *, uint64_t))(v181 + 8))(v179, v182);
        }
        else
        {
          sub_25B6BF3A8(a1);
          sub_25B6BF3A8(a1);

          (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v41);
        }
        v120 = (void **)((char *)v2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
        swift_beginAccess();
        v121 = *v120;
        *v120 = v42;
        v122 = v42;

        objc_msgSend(v180, sel_stateChangeWithState_, v122);
        swift_unknownObjectRelease();
        unint64_t v119 = a1;
LABEL_53:
        sub_25B6BF3A8(v119);
        return;
    }
  }
}

id SOSUIWebRTCView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void SOSUIWebRTCView.init(frame:)()
{
}

uint64_t sub_25B6BE3E8(void *a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x278))(*a1);
}

uint64_t sub_25B6BE428(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_25B6C1974;
  return v6();
}

uint64_t sub_25B6BE4F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25B6C1974;
  return v7();
}

uint64_t sub_25B6BE5C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25B6D2AC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25B6D2AB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25B6BF834(a1, &qword_26A508960);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25B6D2A70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25B6BE76C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25B6BE848;
  return v6(a1);
}

uint64_t sub_25B6BE848()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25B6BE940(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25B6BEA14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25B6C1904((uint64_t)v12, *a3);
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
      sub_25B6C1904((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25B6BEA14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25B6D2B60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25B6BEBD0(a5, a6);
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
  uint64_t v8 = sub_25B6D2BC0();
  if (!v8)
  {
    sub_25B6D2BD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25B6D2C00();
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

uint64_t sub_25B6BEBD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25B6BEC68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25B6BEE48(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25B6BEE48(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25B6BEC68(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25B6BEDE0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25B6D2B90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25B6D2BD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25B6D2A50();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25B6D2C00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25B6D2BD0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25B6BEDE0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5093A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25B6BEE48(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5093A0);
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
  uint64_t result = sub_25B6D2C00();
  __break(1u);
  return result;
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

unint64_t sub_25B6BEFDC()
{
  unint64_t result = qword_26A508908;
  if (!qword_26A508908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A508908);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCView()
{
  return self;
}

uint64_t sub_25B6BF054(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B6BF07C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25B6BF08C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25B6BF0D4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6BF16C;
  return sub_25B6AD050((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_25B6BF16C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

_OWORD *sub_25B6BF260(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_25B6BF270()
{
  unint64_t result = qword_26A508A28;
  if (!qword_26A508A28)
  {
    type metadata accessor for SOSUIWebtRTCCapabilities();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A508A28);
  }
  return result;
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

uint64_t sub_25B6BF318()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 161, 7);
}

uint64_t sub_25B6BF350(uint64_t a1)
{
  return a1;
}

uint64_t sub_25B6BF37C(uint64_t a1)
{
  return a1;
}

void sub_25B6BF3A8(unint64_t a1)
{
  switch(a1 >> 61)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      a1 &= 0x1FFFFFFFFFFFFFFFuLL;
LABEL_3:

      break;
    default:
      return;
  }
}

unint64_t sub_25B6BF3F4(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      result &= 0x1FFFFFFFFFFFFFFFuLL;
LABEL_3:
      unint64_t result = (unint64_t)(id)result;
      break;
    default:
      return result;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for WebRTCError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WebRTCError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for WebRTCError(void *a1, void *a2)
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

void *assignWithTake for WebRTCError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WebRTCError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WebRTCError(uint64_t result, int a2, int a3)
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

uint64_t sub_25B6BF580()
{
  return 0;
}

ValueMetadata *type metadata accessor for WebRTCError()
{
  return &type metadata for WebRTCError;
}

unint64_t sub_25B6BF59C()
{
  unint64_t result = qword_26A508B70;
  if (!qword_26A508B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A508B70);
  }
  return result;
}

uint64_t sub_25B6BF5F4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508B78 + dword_26A508B78);
  return v5(v2, v3);
}

uint64_t sub_25B6BF6A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26A508B88 + dword_26A508B88);
  return v6(v2, v3, v4);
}

uint64_t sub_25B6BF768(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_25B6C1974;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A508B98 + dword_26A508B98);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_25B6BF834(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25B6BF890()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B6BF8C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A508BA8 + dword_26A508BA8);
  return v6(a1, v4);
}

uint64_t sub_25B6BF984()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A508BB8 + dword_26A508BB8);
  return v6(v2, v4, v3);
}

uint64_t sub_25B6BFA44()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508BD8 + dword_26A508BD8);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6BFB04()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A508BF8 + dword_26A508BF8);
  return v6(v2, v3, v4);
}

uint64_t sub_25B6BFBC4()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A508C18 + dword_26A508C18);
  return v6(v2, v4, v3);
}

uint64_t sub_25B6BFC84()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A508C38 + dword_26A508C38);
  return v6(v2, v3, v4);
}

uint64_t sub_25B6BFD44()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508C58 + dword_26A508C58);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6BFE04()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508C78 + dword_26A508C78);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6BFEC4()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508C98 + dword_26A508C98);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6BFF84()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508CB8 + dword_26A508CB8);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6C0044()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508CD8 + dword_26A508CD8);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6C0104()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508CF8 + dword_26A508CF8);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6C01C4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508D18 + dword_26A508D18);
  return v5(v2, v3);
}

uint64_t sub_25B6C027C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508D38 + dword_26A508D38);
  return v5(v2, v3);
}

uint64_t sub_25B6C0334()
{
  double v2 = v0[2];
  uint64_t v3 = *((void *)v0 + 3);
  uint64_t v4 = *((void *)v0 + 4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_26A508D58 + dword_26A508D58);
  return v6(v3, v4, v2);
}

uint64_t sub_25B6C03F4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508D78 + dword_26A508D78);
  return v5(v2, v3);
}

uint64_t sub_25B6C04AC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508D98 + dword_26A508D98);
  return v5(v2, v3);
}

uint64_t sub_25B6C0564()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508DB8 + dword_26A508DB8);
  return v5(v2, v3);
}

uint64_t sub_25B6C061C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6BF16C;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508DD8 + dword_26A508DD8);
  return v5(v2, v3);
}

uint64_t sub_25B6C06D4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508DF8 + dword_26A508DF8);
  return v5(v2, v3);
}

uint64_t sub_25B6C0788()
{
  _Block_release(*(const void **)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25B6C07D8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_25B6C1974;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_26A508E18 + dword_26A508E18);
  return v8(v2, v3, v4, v6, v5);
}

uint64_t sub_25B6C08A8()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25B6C08F8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_25B6C1974;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A508E38 + dword_26A508E38);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_25B6C09C4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A508E58 + dword_26A508E58);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_101Tm()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25B6C0AC4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A508E78 + dword_26A508E78);
  return v6(v2, v3, v4);
}

uint64_t sub_25B6C0B84()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508E98 + dword_26A508E98);
  return v5(v2, v3);
}

uint64_t sub_25B6C0C3C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508EB8 + dword_26A508EB8);
  return v5(v2, v3);
}

uint64_t sub_25B6C0CF4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508ED8 + dword_26A508ED8);
  return v5(v2, v3);
}

uint64_t sub_25B6C0DAC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508EF8 + dword_26A508EF8);
  return v5(v2, v3);
}

uint64_t objectdestroy_161Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25B6C0EAC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25B6C1974;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A508F18 + dword_26A508F18);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_81Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25B6C0FAC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_25B6C1974;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A508F38 + dword_26A508F38);
  return v5(v2, v3);
}

uint64_t objectdestroy_85Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_25B6C10A0(uint64_t a1, uint64_t a2)
{
  sub_25B6D2E20();
  sub_25B6D2A30();
  uint64_t v4 = sub_25B6D2E40();
  return sub_25B6C1118(a1, a2, v4);
}

unint64_t sub_25B6C1118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25B6D2D90() & 1) == 0)
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
      while (!v14 && (sub_25B6D2D90() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25B6C11FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508900);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25B6D28A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25B6D2960();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v31 - v17;
  id v19 = objc_msgSend(a1, sel_request);
  sub_25B6D2870();

  sub_25B6D2890();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_25B6BF834((uint64_t)v7, &qword_26A508900);
    return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
  }
  uint64_t v21 = a3;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v7, v12);
  uint64_t v22 = sub_25B6D2920();
  uint64_t v24 = v32;
  if (v22 == *(void *)(v32 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString)
    && v23 == *(void *)(v32 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString + 8))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    goto LABEL_12;
  }
  char v26 = sub_25B6D2D90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  if (v26)
  {
LABEL_12:
    uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v16, v12);
    uint64_t v29 = v21;
LABEL_13:
    (*(void (**)(uint64_t, uint64_t))(v29 + 16))(v29, 1);
    return ((uint64_t (*)(char *, uint64_t))v28)(v18, v12);
  }
  if (sub_25B6D2920() == *(void *)(v24 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString)
    && v27 == *(void *)(v24 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v30 = sub_25B6D2D90();
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  v28(v16, v12);
  uint64_t v29 = v21;
  if (v30) {
    goto LABEL_13;
  }
  (*(void (**)(void))(v21 + 16))();
  return ((uint64_t (*)(char *, uint64_t))v28)(v18, v12);
}

uint64_t sub_25B6C15D8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_25B6C15E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25B6C164C(uint64_t a1)
{
  return sub_25B6AD8E8(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_25B6C1654()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_25B6C1724(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v4 = *(void **)(v2 + 16);
  if (v4)
  {
    sub_25B6C17F0();
    id v5 = a1;
    id v6 = v4;
    char v7 = sub_25B6D2B20();

    if (v7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
      sub_25B6D2A80();
    }
  }
}

unint64_t sub_25B6C17F0()
{
  unint64_t result = qword_26A508F70;
  if (!qword_26A508F70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A508F70);
  }
  return result;
}

uint64_t sub_25B6C1830()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25B6C1870()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25B6C1974;
  return sub_25B6ABA50();
}

uint64_t sub_25B6C1904(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::String __swiftcall SOSUIWebRTCStateName.getValue()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)0xE900000000000064;
  uint64_t v3 = 0x6564616F6C746F6ELL;
  switch(v1)
  {
    case 0:
      break;
    case 1:
      uint64_t v2 = (void *)0xE800000000000000;
      uint64_t v3 = 0x646F6F676C6C6163;
      break;
    case 2:
      uint64_t v3 = 0x737561706C6C6163;
      uint64_t v2 = (void *)0xEA00000000006465;
      break;
    case 3:
      uint64_t v2 = (void *)0xE800000000000000;
      uint64_t v3 = 0x726F6F706C6C6163;
      break;
    case 4:
      uint64_t v2 = (void *)0xE400000000000000;
      uint64_t v3 = 1701602409;
      break;
    case 5:
      uint64_t v2 = (void *)0xE700000000000000;
      uint64_t v3 = 0x77656976657270;
      break;
    case 6:
      uint64_t v2 = (void *)0xEA0000000000726FLL;
      uint64_t v3 = 0x7272656C61746166;
      break;
    case 7:
      uint64_t v2 = (void *)0xEA0000000000676ELL;
      uint64_t v3 = 0x697463656E6E6F63;
      break;
    case 8:
      uint64_t v2 = (void *)0xE500000000000000;
      uint64_t v3 = 0x6465646E65;
      break;
    default:
      sub_25B6D2DD0();
      __break(1u);
      JUMPOUT(0x25B6C1AE0);
  }
  result._object = v2;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t SOSUIWebRTCStateName.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E70();
  SOSUIWebRTCStateName.getValue()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_25B6D2DC0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t SOSUIWebRTCStateName.init(from:)(void *a1)
{
  return sub_25B6C7D98(a1);
}

unint64_t SOSUIWebRTCStateName.init(rawValue:)(unint64_t a1)
{
  return sub_25B6C8228(a1);
}

BOOL sub_25B6C1C84(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25B6C1C9C()
{
  return sub_25B6D2E30();
}

unint64_t sub_25B6C1CCC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25B6C8228(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25B6C1D00(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25B6C1D0C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25B6C7D98(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25B6C1D38(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E70();
  SOSUIWebRTCStateName.getValue()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_25B6D2DC0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_25B6C1DEC(uint64_t a1)
{
  if (!a1) {
    return 1919251317;
  }
  if (a1 == 1) {
    return 0x6D6E6F7269766E65;
  }
  uint64_t result = sub_25B6D2DD0();
  __break(1u);
  return result;
}

uint64_t SOSUIWebRTCCameraFacing.encode(to:)(void *a1, unint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E70();
  if (a2 > 1)
  {
    uint64_t result = sub_25B6D2DD0();
    __break(1u);
  }
  else
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_25B6D2DC0();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  return result;
}

uint64_t SOSUIWebRTCCameraFacing.init(from:)(void *a1)
{
  return sub_25B6C8238(a1);
}

BOOL SOSUIWebRTCCameraFacing.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

void *sub_25B6C1F98@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25B6C1FC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25B6C8238(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25B6C1FF4(void *a1)
{
  return SOSUIWebRTCCameraFacing.encode(to:)(a1, *v1);
}

uint64_t SOSUIWebRTCVideoPreference.encode(to:)(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E70();
  if (!a2 || a2 == 2 || a2 == 1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_25B6D2DC0();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    uint64_t result = sub_25B6D2DD0();
    __break(1u);
  }
  return result;
}

uint64_t SOSUIWebRTCVideoPreference.init(from:)(void *a1)
{
  return sub_25B6C848C(a1);
}

unint64_t SOSUIWebRTCVideoPreference.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t sub_25B6C2154()
{
  return sub_25B6D2E40();
}

uint64_t sub_25B6C219C()
{
  return sub_25B6D2E40();
}

uint64_t *sub_25B6C21E0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_25B6C21FC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25B6C848C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25B6C2228(void *a1)
{
  return SOSUIWebRTCVideoPreference.encode(to:)(a1, *v1);
}

id SOSUIWebRTCState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t SOSUIWebRTCState.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = (*(uint64_t (**)(void, void, void, void, void, uint64_t, void, void, double))(ObjectType + 152))(0, 0, 0, 0, 0, 1, 0, 0, 1.0);
  swift_deallocPartialClassInstance();
  return v1;
}

id SOSUIWebRTCState.__allocating_init(state:connected:connecting:cameraExists:cameraActive:cameraFacing:zoomLevel:torch:error:)(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7, uint64_t a8, double a9)
{
  id v19 = objc_allocWithZone(v9);
  *(void *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = a1;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = a2;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = a3;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = a4;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = a5;
  *(void *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = a6;
  *(double *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = a9;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = a7;
  *(void *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = a8;
  v21.receiver = v19;
  v21.super_class = v9;
  return objc_msgSendSuper2(&v21, sel_init);
}

id SOSUIWebRTCState.init(state:connected:connecting:cameraExists:cameraActive:cameraFacing:zoomLevel:torch:error:)(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7, uint64_t a8, double a9)
{
  *(void *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = a1;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = a2;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = a3;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = a4;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = a5;
  *(void *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = a6;
  *(double *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = a9;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = a7;
  *(void *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = a8;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for SOSUIWebRTCState();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t SOSUIWebRTCState.state.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state);
}

uint64_t SOSUIWebRTCState.connected.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected);
}

uint64_t SOSUIWebRTCState.connecting.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting);
}

uint64_t SOSUIWebRTCState.cameraExists.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists);
}

uint64_t SOSUIWebRTCState.cameraActive.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive);
}

uint64_t SOSUIWebRTCState.cameraFacing.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing);
}

double SOSUIWebRTCState.zoomLevel.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel);
}

uint64_t SOSUIWebRTCState.torch.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch);
}

void *SOSUIWebRTCState.error.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error);
  id v2 = v1;
  return v1;
}

uint64_t sub_25B6C25CC(char a1)
{
  uint64_t result = 0x6574617473;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x657463656E6E6F63;
      break;
    case 2:
      uint64_t result = 0x697463656E6E6F63;
      break;
    case 3:
      uint64_t result = 0x78456172656D6163;
      break;
    case 4:
      uint64_t result = 0x63416172656D6163;
      break;
    case 5:
      uint64_t result = 0x61466172656D6163;
      break;
    case 6:
      uint64_t result = 0x6576654C6D6F6F7ALL;
      break;
    case 7:
      uint64_t result = 0x6863726F74;
      break;
    case 8:
      uint64_t result = 0x726F727265;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_25B6C2700(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25B6C2718()
{
  return sub_25B6D2E30();
}

uint64_t sub_25B6C2748()
{
  return sub_25B6C25CC(*v0);
}

uint64_t sub_25B6C2750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6C8A28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B6C2778()
{
  return 0;
}

void sub_25B6C2784(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_25B6C2790(uint64_t a1)
{
  unint64_t v2 = sub_25B6C8750();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C27CC(uint64_t a1)
{
  unint64_t v2 = sub_25B6C8750();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebRTCState.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebRTCState);
}

uint64_t SOSUIWebRTCState.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509038);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C8750();
  sub_25B6D2E80();
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state);
  HIBYTE(v10) = 0;
  sub_25B6C87A4();
  sub_25B6D2D60();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_25B6D2D30();
    LOBYTE(v11) = 2;
    sub_25B6D2D30();
    LOBYTE(v11) = 3;
    sub_25B6D2D30();
    LOBYTE(v11) = 4;
    sub_25B6D2D30();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing);
    HIBYTE(v10) = 5;
    sub_25B6C87F8();
    sub_25B6D2D60();
    LOBYTE(v11) = 6;
    sub_25B6D2D40();
    LOBYTE(v11) = 7;
    sub_25B6D2D30();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error);
    HIBYTE(v10) = 8;
    type metadata accessor for SOSUIWebRTCErrorMessage();
    sub_25B6CDDB0(&qword_26A509050, (void (*)(void))type metadata accessor for SOSUIWebRTCErrorMessage);
    sub_25B6D2D10();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *SOSUIWebRTCState.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCState.init(from:)(a1);
}

char *SOSUIWebRTCState.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509058);
  uint64_t v15 = *(void *)(v4 - 8);
  uint64_t v16 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v17 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25B6C8750();
  uint64_t v8 = v1;
  uint64_t v9 = v6;
  sub_25B6D2E60();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    type metadata accessor for SOSUIWebRTCState();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v15;
    char v19 = 0;
    sub_25B6C8870();
    uint64_t v11 = v16;
    sub_25B6D2CB0();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = v20;
    LOBYTE(v20) = 1;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = sub_25B6D2C80() & 1;
    LOBYTE(v20) = 2;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = sub_25B6D2C80() & 1;
    LOBYTE(v20) = 3;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = sub_25B6D2C80() & 1;
    LOBYTE(v20) = 4;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = sub_25B6D2C80() & 1;
    char v19 = 5;
    sub_25B6C88C4();
    sub_25B6D2CB0();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = v20;
    LOBYTE(v20) = 6;
    sub_25B6D2C90();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = v12;
    LOBYTE(v20) = 7;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = sub_25B6D2C80() & 1;
    type metadata accessor for SOSUIWebRTCErrorMessage();
    char v19 = 8;
    sub_25B6CDDB0(&qword_26A509070, (void (*)(void))type metadata accessor for SOSUIWebRTCErrorMessage);
    sub_25B6D2C60();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = v20;

    uint64_t v14 = (objc_class *)type metadata accessor for SOSUIWebRTCState();
    v18.receiver = v8;
    v18.super_class = v14;
    uint64_t v6 = (char *)objc_msgSendSuper2(&v18, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  }
  return v6;
}

uint64_t sub_25B6C2F90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 168))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C2FCC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xA0))();
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.poorConnectionThreshold()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionThreshold.getter()
{
  return *(void *)v0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionThreshold.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.poorConnectionThreshold.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.poorConnectionGracePeriod()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionGracePeriod.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionGracePeriod.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.poorConnectionGracePeriod.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.iceRestartTimeout()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.iceRestartTimeout.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t SOSUIWebRTCConfiguration.iceRestartTimeout.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.iceRestartTimeout.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.iceRestartRetryCount()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.iceRestartRetryCount.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t SOSUIWebRTCConfiguration.iceRestartRetryCount.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.iceRestartRetryCount.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.minimumBitrate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.minimumBitrate.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t SOSUIWebRTCConfiguration.minimumBitrate.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(unsigned char *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.minimumBitrate.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.maximumBitrate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.maximumBitrate.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t SOSUIWebRTCConfiguration.maximumBitrate.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 80) = result;
  *(unsigned char *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.maximumBitrate.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.videoPreference()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.videoPreference.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t SOSUIWebRTCConfiguration.videoPreference.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 96) = result;
  *(unsigned char *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.videoPreference.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.pausedString()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.pausedString.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCConfiguration.pausedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.pausedString.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.debugConnection()
{
  return 2;
}

uint64_t SOSUIWebRTCConfiguration.debugConnection.getter()
{
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t SOSUIWebRTCConfiguration.debugConnection.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 128) = result;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.debugConnection.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.frameRate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.frameRate.getter()
{
  return *(void *)(v0 + 136);
}

uint64_t SOSUIWebRTCConfiguration.frameRate.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 136) = result;
  *(unsigned char *)(v2 + 144) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.frameRate.modify())()
{
  return nullsub_1;
}

uint64_t sub_25B6C332C(char a1)
{
  uint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      uint64_t result = 0xD000000000000019;
      break;
    case 2:
      uint64_t result = 0xD000000000000011;
      break;
    case 3:
      uint64_t result = 0xD000000000000014;
      break;
    case 4:
      unsigned int v3 = 1768843629;
      goto LABEL_8;
    case 5:
      unsigned int v3 = 1769496941;
LABEL_8:
      uint64_t result = v3 | 0x426D756D00000000;
      break;
    case 6:
      uint64_t result = 0x6572506F65646976;
      break;
    case 7:
      uint64_t result = 0x7453646573756170;
      break;
    case 8:
      uint64_t result = 0x6E6F436775626564;
      break;
    case 9:
      uint64_t result = 0x746152656D617266;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B6C3490()
{
  return sub_25B6C332C(*v0);
}

uint64_t sub_25B6C3498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6C8E24(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B6C34C0(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_25B6C34CC(uint64_t a1)
{
  unint64_t v2 = sub_25B6C8918();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C3508(uint64_t a1)
{
  unint64_t v2 = sub_25B6C8918();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SOSUIWebRTCConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509078);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C8918();
  sub_25B6D2E80();
  v11[0] = 0;
  sub_25B6D2D00();
  if (!v2)
  {
    v11[0] = 1;
    sub_25B6D2D00();
    v11[0] = 2;
    sub_25B6D2D00();
    v11[0] = 3;
    sub_25B6D2D00();
    v11[0] = 4;
    sub_25B6D2D00();
    v11[0] = 5;
    sub_25B6D2D00();
    sub_25B6C896C(v3 + 96, (uint64_t)v12);
    sub_25B6C896C((uint64_t)v12, (uint64_t)v11);
    v10[15] = 6;
    sub_25B6C89D4();
    sub_25B6D2D10();
    v11[0] = 7;
    sub_25B6D2CE0();
    v11[0] = 8;
    sub_25B6D2CF0();
    v11[0] = 9;
    sub_25B6D2D00();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_25B6C3828(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 1;
  *(void *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 88) = 1;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 1;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = 2;
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 1;
}

double SOSUIWebRTCConfiguration.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25B6C92B8(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(unsigned char *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

double sub_25B6C3920@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25B6C92B8(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(unsigned char *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_25B6C3994(void *a1)
{
  return SOSUIWebRTCConfiguration.encode(to:)(a1);
}

uint64_t SOSUIWebRTCErrorMessage.error.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCErrorMessage.errorCode.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode);
}

uint64_t SOSUIWebRTCErrorMessage.stack.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCErrorMessage.lastState.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState);
}

uint64_t SOSUIWebRTCErrorMessage.retryable.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_retryable);
}

uint64_t SOSUIWebRTCErrorMessage.description.getter()
{
  return 0;
}

uint64_t sub_25B6C3CFC()
{
  uint64_t result = 0x726F727265;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x646F43726F727265;
      break;
    case 2:
      uint64_t result = 0x6B63617473;
      break;
    case 3:
      uint64_t result = 0x746174537473616CLL;
      break;
    case 4:
      uint64_t result = 0x6C62617972746572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B6C3D98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6CA01C(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B6C3DC0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_25B6C3DCC(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9B68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C3E08(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9B68();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebRTCErrorMessage.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebRTCErrorMessage);
}

uint64_t SOSUIWebRTCErrorMessage.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5090B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9B68();
  sub_25B6D2E80();
  char v14 = 0;
  sub_25B6D2D20();
  if (!v2)
  {
    char v13 = 1;
    sub_25B6D2D50();
    char v12 = 2;
    sub_25B6D2D20();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState);
    v10[15] = 3;
    sub_25B6C87A4();
    sub_25B6D2D60();
    v10[14] = 4;
    sub_25B6D2D30();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

id SOSUIWebRTCErrorMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCErrorMessage.init(from:)(a1);
}

id SOSUIWebRTCErrorMessage.init(from:)(void *a1)
{
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5090C0);
  uint64_t v4 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v23 = a1;
  long long v8 = __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25B6C9B68();
  uint64_t v9 = v1;
  id v10 = v8;
  sub_25B6D2E60();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);

    type metadata accessor for SOSUIWebRTCErrorMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v4;
    LOBYTE(v26) = 0;
    uint64_t v12 = v22;
    uint64_t v13 = sub_25B6D2C70();
    uint64_t v15 = (uint64_t *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error];
    *uint64_t v15 = v13;
    v15[1] = v16;
    LOBYTE(v26) = 1;
    *(void *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode] = sub_25B6D2CA0();
    LOBYTE(v26) = 2;
    uint64_t v17 = sub_25B6D2C70();
    objc_super v18 = (uint64_t *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack];
    *objc_super v18 = v17;
    v18[1] = v19;
    char v25 = 3;
    sub_25B6C8870();
    sub_25B6D2CB0();
    *(void *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState] = v26;
    LOBYTE(v26) = 4;
    v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_retryable] = sub_25B6D2C80() & 1;

    uint64_t v20 = (objc_class *)type metadata accessor for SOSUIWebRTCErrorMessage();
    v24.receiver = v9;
    v24.super_class = v20;
    id v10 = objc_msgSendSuper2(&v24, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  }
  return v10;
}

uint64_t sub_25B6C4408@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C4444()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x78))();
}

uint64_t SOSUIWebRTCQualityMessage.bitrate.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate);
}

uint64_t SOSUIWebRTCQualityMessage.availableBitrate.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate);
}

uint64_t SOSUIWebRTCQualityMessage.packetLoss.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss);
}

uint64_t SOSUIWebRTCQualityMessage.currentRoundTripTime.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime);
}

uint64_t SOSUIWebRTCQualityMessage.framesPerSecond.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond);
}

uint64_t SOSUIWebRTCQualityMessage.jitter.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter);
}

uint64_t SOSUIWebRTCQualityMessage.connectionPoor.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_connectionPoor);
}

uint64_t SOSUIWebRTCQualityMessage.bytesSent.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bytesSent);
}

unint64_t sub_25B6C4550(char a1)
{
  unint64_t result = 0x65746172746962;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x6F4C74656B636170;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x655073656D617266;
      break;
    case 5:
      unint64_t result = 0x72657474696ALL;
      break;
    case 6:
      unint64_t result = 0x697463656E6E6F63;
      break;
    case 7:
      unint64_t result = 0x6E65537365747962;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25B6C467C()
{
  return sub_25B6C4550(*v0);
}

uint64_t sub_25B6C4684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6CA248(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B6C46AC(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_25B6C46B8(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9BE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C46F4(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9BE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebRTCQualityMessage.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebRTCQualityMessage);
}

uint64_t SOSUIWebRTCQualityMessage.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509108);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9BE0();
  sub_25B6D2E80();
  v8[15] = 0;
  sub_25B6D2D00();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B6D2D00();
    v8[13] = 2;
    sub_25B6D2D00();
    v8[12] = 3;
    sub_25B6D2D00();
    v8[11] = 4;
    sub_25B6D2D00();
    v8[10] = 5;
    sub_25B6D2D00();
    v8[9] = 6;
    sub_25B6D2CF0();
    v8[8] = 7;
    sub_25B6D2D00();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

char *SOSUIWebRTCQualityMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCQualityMessage.init(from:)(a1);
}

char *SOSUIWebRTCQualityMessage.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509110);
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25B6C9BE0();
  long long v8 = v1;
  uint64_t v9 = v6;
  sub_25B6D2E60();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
    type metadata accessor for SOSUIWebRTCQualityMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v37;
    uint64_t v11 = v38;
    char v41 = 0;
    uint64_t v12 = sub_25B6D2C50();
    uint64_t v13 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate];
    *(void *)uint64_t v13 = v12;
    v13[8] = v14 & 1;
    char v41 = 1;
    uint64_t v15 = sub_25B6D2C50();
    uint64_t v16 = (uint64_t)v39;
    uint64_t v17 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate];
    *(void *)uint64_t v17 = v15;
    v17[8] = v18 & 1;
    char v41 = 2;
    uint64_t v19 = sub_25B6D2C50();
    uint64_t v20 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss];
    *(void *)uint64_t v20 = v19;
    v20[8] = v21 & 1;
    char v41 = 3;
    uint64_t v22 = sub_25B6D2C50();
    uint64_t v23 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime];
    *(void *)uint64_t v23 = v22;
    v23[8] = v24 & 1;
    char v41 = 4;
    uint64_t v25 = sub_25B6D2C50();
    uint64_t v26 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond];
    *(void *)uint64_t v26 = v25;
    v26[8] = v27 & 1;
    char v41 = 5;
    uint64_t v28 = sub_25B6D2C50();
    uint64_t v29 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter];
    *(void *)uint64_t v29 = v28;
    v29[8] = v30 & 1;
    char v41 = 6;
    v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_connectionPoor] = sub_25B6D2C40();
    char v41 = 7;
    uint64_t v31 = sub_25B6D2C50();
    uint64_t v33 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bytesSent];
    *(void *)uint64_t v33 = v31;
    v33[8] = v34 & 1;

    uint64_t v35 = (objc_class *)type metadata accessor for SOSUIWebRTCQualityMessage();
    v40.receiver = v8;
    v40.super_class = v35;
    long long v8 = (char *)objc_msgSendSuper2(&v40, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v11);
    __swift_destroy_boxed_opaque_existential_0(v16);
  }
  return v8;
}

uint64_t sub_25B6C4DE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 152))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C4E24()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x90))();
}

uint64_t SOSUIWebRTCLogMessage.level.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_level);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCLogMessage.message.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_25B6C4EF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25B6C4F08()
{
  if (*v0) {
    return 0x6567617373656DLL;
  }
  else {
    return 0x6C6576656CLL;
  }
}

uint64_t sub_25B6C4F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6CA5E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B6C4F68(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25B6C4F74(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9C58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C4FB0(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9C58();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebRTCLogMessage.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebRTCLogMessage);
}

uint64_t sub_25B6C5018()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SOSUIWebRTCLogMessage.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509128);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9C58();
  sub_25B6D2E80();
  v8[15] = 0;
  sub_25B6D2D20();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B6D2D20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

id SOSUIWebRTCLogMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCLogMessage.init(from:)(a1);
}

id SOSUIWebRTCLogMessage.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509130);
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9C58();
  long long v8 = v1;
  id v9 = v7;
  sub_25B6D2E60();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    type metadata accessor for SOSUIWebRTCLogMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v20;
    uint64_t v10 = v21;
    char v23 = 0;
    uint64_t v12 = sub_25B6D2C70();
    char v14 = (uint64_t *)&v8[OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_level];
    *char v14 = v12;
    v14[1] = v15;
    char v23 = 1;
    uint64_t v16 = sub_25B6D2C70();
    uint64_t v17 = (uint64_t *)&v8[OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message];
    *uint64_t v17 = v16;
    v17[1] = v18;

    uint64_t v19 = (objc_class *)type metadata accessor for SOSUIWebRTCLogMessage();
    v22.receiver = v8;
    v22.super_class = v19;
    id v9 = objc_msgSendSuper2(&v22, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_25B6C5460@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C549C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x60))();
}

uint64_t SOSUIWebRTCConnectionInfoMessage.addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25B6C5500()
{
  return 1;
}

uint64_t sub_25B6C5510()
{
  return 0x6573736572646461;
}

uint64_t sub_25B6C552C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6573736572646461 && a2 == 0xE900000000000073)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_25B6C55D0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25B6C55DC(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9CD0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C5618(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9CD0();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebRTCConnectionInfoMessage.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebRTCConnectionInfoMessage);
}

uint64_t SOSUIWebRTCConnectionInfoMessage.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509140);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9CD0();
  sub_25B6D2E80();
  v9[1] = *(void *)(v2 + OBJC_IVAR____TtC5SOSUI32SOSUIWebRTCConnectionInfoMessage_addresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A509148);
  sub_25B6C9D6C(&qword_26A509150);
  sub_25B6D2D60();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id SOSUIWebRTCConnectionInfoMessage.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCConnectionInfoMessage.init(from:)(a1);
}

id SOSUIWebRTCConnectionInfoMessage.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509158);
  uint64_t v14 = *(void *)(v4 - 8);
  uint64_t v15 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9CD0();
  long long v8 = v1;
  id v9 = v7;
  sub_25B6D2E60();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A509148);
    sub_25B6C9D6C(&qword_26A509160);
    uint64_t v11 = v15;
    sub_25B6D2CB0();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI32SOSUIWebRTCConnectionInfoMessage_addresses] = v17;

    uint64_t v13 = (objc_class *)type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
    v16.receiver = v8;
    v16.super_class = v13;
    id v9 = objc_msgSendSuper2(&v16, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_25B6C5A60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 96))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C5A9C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x58))();
}

uint64_t sub_25B6C5AF0()
{
  return 0;
}

uint64_t sub_25B6C5AFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25B6C5B2C(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9ECC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C5B68(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9ECC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C5BA4()
{
  return sub_25B6D2E40();
}

uint64_t sub_25B6C5BEC()
{
  return sub_25B6D2E40();
}

unint64_t sub_25B6C5C30()
{
  unint64_t result = 0x73654D6574617473;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x73654D726F727265;
      break;
    case 2:
      unint64_t result = 0x4D7974696C617571;
      break;
    case 3:
      unint64_t result = 0x74736F4C6C6C6163;
      break;
    case 4:
      unint64_t result = 0x617373654D676F6CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25B6C5D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6CA6CC(a1, a2);
  *a3 = result;
  return result;
}

void sub_25B6C5D44(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_25B6C5D50(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9DD0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C5D8C(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9DD0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C5DC8()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_25B6C5DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x697463656E6E6F63 && a2 == 0xEE006F666E496E6FLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C5EA8(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9E24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C5EE4(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9E24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C5F20()
{
  return 0x726F727265;
}

uint64_t sub_25B6C5F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C5FC4(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9F74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C6000(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9F74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C603C()
{
  return sub_25B6D2E30();
}

uint64_t sub_25B6C6064()
{
  return 6778732;
}

uint64_t sub_25B6C6074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C60FC(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9E78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C6138(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9E78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C6174()
{
  return 0x7974696C617571;
}

uint64_t sub_25B6C618C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7974696C617571 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C6224(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9F20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C6260(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9F20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C629C()
{
  return 0x6574617473;
}

uint64_t sub_25B6C62B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C6340(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9FC8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C637C(uint64_t a1)
{
  unint64_t v2 = sub_25B6C9FC8();
  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25B6C63B8(void *a1, unint64_t a2)
{
  unint64_t v59 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509168);
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  MEMORY[0x270FA5388](v3);
  int v53 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509170);
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v5);
  int v50 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509178);
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509180);
  uint64_t v48 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509188);
  uint64_t v44 = *(void *)(v13 - 8);
  uint64_t v45 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509190);
  uint64_t v43 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509198);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v57 = v19;
  uint64_t v58 = v20;
  MEMORY[0x270FA5388](v19);
  objc_super v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C9DD0();
  unint64_t v56 = v22;
  unint64_t v23 = v59;
  sub_25B6D2E80();
  switch(v23 >> 61)
  {
    case 1uLL:
      LOBYTE(v60) = 1;
      sub_25B6C9F74();
      id v27 = (id)(v23 & 0x1FFFFFFFFFFFFFFFLL);
      uint64_t v28 = v56;
      uint64_t v29 = v57;
      sub_25B6D2CD0();
      id v60 = v27;
      type metadata accessor for SOSUIWebRTCErrorMessage();
      sub_25B6CDDB0(&qword_26A509050, (void (*)(void))type metadata accessor for SOSUIWebRTCErrorMessage);
      uint64_t v30 = v45;
      sub_25B6D2D60();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v30);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v28, v29);
      goto LABEL_10;
    case 2uLL:
      LOBYTE(v60) = 2;
      sub_25B6C9F20();
      id v31 = (id)(v23 & 0x1FFFFFFFFFFFFFFFLL);
      uint64_t v32 = v56;
      uint64_t v25 = v57;
      sub_25B6D2CD0();
      id v60 = v31;
      type metadata accessor for SOSUIWebRTCQualityMessage();
      sub_25B6CDDB0(&qword_26A5091B0, (void (*)(void))type metadata accessor for SOSUIWebRTCQualityMessage);
      uint64_t v33 = v49;
      sub_25B6D2D60();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v33);
      char v34 = *(void (**)(char *, uint64_t))(v58 + 8);
      uint64_t v35 = v32;
      goto LABEL_9;
    case 3uLL:
      LOBYTE(v60) = 4;
      sub_25B6C9E78();
      id v36 = (id)(v23 & 0x1FFFFFFFFFFFFFFFLL);
      uint64_t v37 = v50;
      uint64_t v26 = v56;
      uint64_t v25 = v57;
      sub_25B6D2CD0();
      id v60 = v36;
      type metadata accessor for SOSUIWebRTCLogMessage();
      sub_25B6CDDB0(&qword_26A5091A8, (void (*)(void))type metadata accessor for SOSUIWebRTCLogMessage);
      uint64_t v38 = v52;
      sub_25B6D2D60();
      uint64_t v39 = v51;
      goto LABEL_7;
    case 4uLL:
      LOBYTE(v60) = 5;
      sub_25B6C9E24();
      id v40 = (id)(v23 & 0x1FFFFFFFFFFFFFFFLL);
      uint64_t v37 = v53;
      uint64_t v26 = v56;
      uint64_t v25 = v57;
      sub_25B6D2CD0();
      id v60 = v40;
      type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
      sub_25B6CDDB0(&qword_26A5091A0, (void (*)(void))type metadata accessor for SOSUIWebRTCConnectionInfoMessage);
      uint64_t v38 = v55;
      sub_25B6D2D60();
      uint64_t v39 = v54;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v39 + 8))(v37, v38);
      goto LABEL_8;
    case 5uLL:
      LOBYTE(v60) = 3;
      sub_25B6C9ECC();
      id v42 = v56;
      uint64_t v41 = v57;
      sub_25B6D2CD0();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v47);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v41);
      return;
    default:
      LOBYTE(v60) = 0;
      sub_25B6C9FC8();
      id v24 = (id)v23;
      uint64_t v26 = v56;
      uint64_t v25 = v57;
      sub_25B6D2CD0();
      id v60 = v24;
      type metadata accessor for SOSUIWebRTCState();
      sub_25B6CDDB0(&qword_26A5091B8, (void (*)(void))type metadata accessor for SOSUIWebRTCState);
      sub_25B6D2D60();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v18, v16);
LABEL_8:
      char v34 = *(void (**)(char *, uint64_t))(v58 + 8);
      uint64_t v35 = v26;
LABEL_9:
      v34(v35, v25);
LABEL_10:
      sub_25B6BF3A8(v23);
      return;
  }
}

unint64_t sub_25B6C6C40@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_25B6CA9CC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_25B6C6C6C(void *a1)
{
  sub_25B6C63B8(a1, *v1);
}

uint64_t sub_25B6C6C88()
{
  return 0x654D646564616F6CLL;
}

uint64_t sub_25B6C6CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x654D646564616F6CLL && a2 == 0xED00006567617373)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C6D68(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB4F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C6DA4(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB4F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C6DE0(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB548();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C6E1C(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB548();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25B6C6E58(void *a1)
{
  return sub_25B6CB59C(a1);
}

uint64_t sub_25B6C6E70(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5091C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5091C8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB4F4();
  sub_25B6D2E80();
  sub_25B6CB548();
  sub_25B6D2CD0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_25B6C7040(double a1, double a2)
{
  char v5 = (char *)objc_allocWithZone(v2);
  *(double *)&v5[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min] = a1;
  *(double *)&v5[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

double SOSUIWebtRTCDoubleRange.min.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min);
}

double SOSUIWebtRTCDoubleRange.max.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max);
}

void SOSUIWebtRTCDoubleRange.init()()
{
}

uint64_t sub_25B6C7120()
{
  if (*v0) {
    return 7889261;
  }
  else {
    return 7235949;
  }
}

uint64_t sub_25B6C7144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25B6CDCDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25B6C716C(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB8A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C71A8(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB8A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebtRTCDoubleRange.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebtRTCDoubleRange);
}

uint64_t SOSUIWebtRTCDoubleRange.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5091E0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB8A8();
  sub_25B6D2E80();
  v8[15] = 0;
  sub_25B6D2D40();
  if (!v1)
  {
    v8[14] = 1;
    sub_25B6D2D40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

id SOSUIWebtRTCDoubleRange.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebtRTCDoubleRange.init(from:)(a1);
}

id SOSUIWebtRTCDoubleRange.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5091E8);
  uint64_t v16 = *(void *)(v4 - 8);
  uint64_t v17 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB8A8();
  uint64_t v8 = v1;
  id v9 = v7;
  sub_25B6D2E60();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for SOSUIWebtRTCDoubleRange();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v16;
    uint64_t v10 = v17;
    char v19 = 0;
    sub_25B6D2C90();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min] = v12;
    char v19 = 1;
    sub_25B6D2C90();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max] = v14;

    uint64_t v15 = (objc_class *)type metadata accessor for SOSUIWebtRTCDoubleRange();
    v18.receiver = v8;
    v18.super_class = v15;
    id v9 = objc_msgSendSuper2(&v18, sel_init);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_25B6C75B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C75F4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x68))();
}

id sub_25B6C7648(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

void *SOSUIWebtRTCCapabilities.zoom.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom);
  id v2 = v1;
  return v1;
}

void SOSUIWebtRTCCapabilities.init()()
{
}

uint64_t sub_25B6C7728()
{
  return sub_25B6D2E40();
}

uint64_t sub_25B6C776C()
{
  return sub_25B6D2E40();
}

uint64_t sub_25B6C77AC()
{
  return 1836019578;
}

uint64_t sub_25B6C77BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1836019578 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25B6C7844(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB920();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25B6C7880(uint64_t a1)
{
  unint64_t v2 = sub_25B6CB920();
  return MEMORY[0x270FA00B8](a1, v2);
}

id SOSUIWebtRTCCapabilities.__deallocating_deinit()
{
  return sub_25B6C78D4(type metadata accessor for SOSUIWebtRTCCapabilities);
}

id sub_25B6C78D4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t SOSUIWebtRTCCapabilities.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5091F8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB920();
  sub_25B6D2E80();
  v9[1] = *(void *)(v2 + OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom);
  type metadata accessor for SOSUIWebtRTCDoubleRange();
  sub_25B6CDDB0(&qword_26A509200, (void (*)(void))type metadata accessor for SOSUIWebtRTCDoubleRange);
  sub_25B6D2D10();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id SOSUIWebtRTCCapabilities.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SOSUIWebtRTCCapabilities.init(from:)(a1);
}

id SOSUIWebtRTCCapabilities.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509208);
  uint64_t v14 = *(void *)(v4 - 8);
  uint64_t v15 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB920();
  uint64_t v8 = v1;
  id v9 = v7;
  sub_25B6D2E60();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for SOSUIWebtRTCCapabilities();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v14;
    type metadata accessor for SOSUIWebtRTCDoubleRange();
    sub_25B6CDDB0(&qword_26A509210, (void (*)(void))type metadata accessor for SOSUIWebtRTCDoubleRange);
    uint64_t v11 = v15;
    sub_25B6D2C60();
    *(void *)&v8[OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom] = v17;

    uint64_t v13 = (objc_class *)type metadata accessor for SOSUIWebtRTCCapabilities();
    v16.receiver = v8;
    v16.super_class = v13;
    id v9 = objc_msgSendSuper2(&v16, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_25B6C7D08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_25B6C7D44()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x60))();
}

uint64_t sub_25B6C7D98(void *a1)
{
  uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E50();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v4 = sub_25B6D2DB0();
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    BOOL v9 = v4 == 0x646F6F676C6C6163 && v5 == 0xE800000000000000;
    if (v9 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 1;
LABEL_11:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x737561706C6C6163 && v8 == 0xEA00000000006465 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 2;
      goto LABEL_11;
    }
    if (v7 == 0x726F6F706C6C6163 && v8 == 0xE800000000000000 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 3;
      goto LABEL_11;
    }
    if (v7 == 1701602409 && v8 == 0xE400000000000000 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 4;
      goto LABEL_11;
    }
    if (v7 == 0x77656976657270 && v8 == 0xE700000000000000 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 5;
      goto LABEL_11;
    }
    if (v7 == 0x7272656C61746166 && v8 == 0xEA0000000000726FLL || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 6;
      goto LABEL_11;
    }
    if (v7 == 0x697463656E6E6F63 && v8 == 0xEA0000000000676ELL || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 7;
      goto LABEL_11;
    }
    if (v7 == 0x6465646E65 && v8 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_40:
      uint64_t v3 = 8;
      goto LABEL_11;
    }
    char v10 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_40;
    }
    uint64_t v11 = sub_25B6D2BB0();
    swift_allocError();
    uint64_t v13 = v12;
    uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_25B6D2DA0();
    sub_25B6D2BA0();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

unint64_t sub_25B6C8228(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

uint64_t sub_25B6C8238(void *a1)
{
  uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E50();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v4 = sub_25B6D2DB0();
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    BOOL v9 = v4 == 1919251317 && v5 == 0xE400000000000000;
    if (v9 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 0;
LABEL_12:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x6D6E6F7269766E65 && v8 == 0xEB00000000746E65)
    {
      swift_bridgeObjectRelease();
LABEL_17:
      uint64_t v3 = 1;
      goto LABEL_12;
    }
    char v10 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_17;
    }
    uint64_t v11 = sub_25B6D2BB0();
    swift_allocError();
    uint64_t v13 = v12;
    uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_25B6D2DA0();
    sub_25B6D2BA0();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_25B6C848C(void *a1)
{
  uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6D2E50();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v4 = sub_25B6D2DB0();
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    BOOL v9 = v4 == 0x6E6F69746F6DLL && v5 == 0xE600000000000000;
    if (v9 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 0;
LABEL_11:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x6C6961746564 && v8 == 0xE600000000000000 || (sub_25B6D2D90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v3 = 1;
      goto LABEL_11;
    }
    if (v7 == 0x6465636E616C6162 && v8 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_20:
      uint64_t v3 = 2;
      goto LABEL_11;
    }
    char v10 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_20;
    }
    uint64_t v11 = sub_25B6D2BB0();
    swift_allocError();
    uint64_t v13 = v12;
    uint64_t v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_25B6D2DA0();
    sub_25B6D2BA0();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for SOSUIWebRTCState()
{
  return self;
}

unint64_t sub_25B6C8750()
{
  unint64_t result = qword_26A509470;
  if (!qword_26A509470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509470);
  }
  return result;
}

unint64_t sub_25B6C87A4()
{
  unint64_t result = qword_26A509040;
  if (!qword_26A509040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509040);
  }
  return result;
}

unint64_t sub_25B6C87F8()
{
  unint64_t result = qword_26A509048;
  if (!qword_26A509048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509048);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCErrorMessage()
{
  return self;
}

unint64_t sub_25B6C8870()
{
  unint64_t result = qword_26A509060;
  if (!qword_26A509060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509060);
  }
  return result;
}

unint64_t sub_25B6C88C4()
{
  unint64_t result = qword_26A509068;
  if (!qword_26A509068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509068);
  }
  return result;
}

unint64_t sub_25B6C8918()
{
  unint64_t result = qword_26A509478;
  if (!qword_26A509478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509478);
  }
  return result;
}

uint64_t sub_25B6C896C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509080);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25B6C89D4()
{
  unint64_t result = qword_26A509088;
  if (!qword_26A509088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509088);
  }
  return result;
}

uint64_t sub_25B6C8A28(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657463656E6E6F63 && a2 == 0xE900000000000064 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEA0000000000676ELL || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x78456172656D6163 && a2 == 0xEC00000073747369 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63416172656D6163 && a2 == 0xEC00000065766974 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x61466172656D6163 && a2 == 0xEC000000676E6963 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6576654C6D6F6F7ALL && a2 == 0xE90000000000006CLL || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6863726F74 && a2 == 0xE500000000000000 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_25B6C8E24(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x800000025B6D61A0 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000025B6D61C0 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025B6D61E0 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025B6D6200 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x426D756D696E696DLL && a2 == 0xEE00657461727469 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x426D756D6978616DLL && a2 == 0xEE00657461727469 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6572506F65646976 && a2 == 0xEF65636E65726566 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7453646573756170 && a2 == 0xEC000000676E6972 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E6F436775626564 && a2 == 0xEF6E6F697463656ELL || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x746152656D617266 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v5 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_25B6C92B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5092A8);
  uint64_t v5 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v107 = 1;
  char v105 = 1;
  char v103 = 1;
  char v101 = 1;
  char v99 = 1;
  char v97 = 1;
  char v95 = 1;
  char v92 = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6C8918();
  uint64_t v52 = v7;
  sub_25B6D2E60();
  uint64_t v55 = a1;
  if (v2)
  {
    uint64_t v108 = v2;
    uint64_t v54 = 0;
    int v53 = 2;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v55);
    uint64_t v65 = 0;
    char v66 = v107;
    *(_DWORD *)char v67 = *(_DWORD *)v106;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v106[3];
    uint64_t v68 = 0;
    char v69 = v105;
    *(_DWORD *)uint64_t v70 = *(_DWORD *)v104;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v104[3];
    uint64_t v71 = 0;
    char v72 = v103;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v102[3];
    *(_DWORD *)v73 = *(_DWORD *)v102;
    uint64_t v74 = 0;
    char v75 = v101;
    *(_DWORD *)uint64_t v76 = *(_DWORD *)v100;
    *(_DWORD *)&v76[3] = *(_DWORD *)&v100[3];
    uint64_t v77 = 0;
    char v78 = v99;
    *(_DWORD *)uint64_t v79 = *(_DWORD *)v98;
    *(_DWORD *)&v79[3] = *(_DWORD *)&v98[3];
    uint64_t v80 = 0;
    char v81 = v97;
    *(_DWORD *)&v82[3] = *(_DWORD *)&v96[3];
    *(_DWORD *)v82 = *(_DWORD *)v96;
    uint64_t v83 = 0;
    char v84 = v95;
    *(_DWORD *)&v85[3] = *(_DWORD *)&v94[3];
    *(_DWORD *)uint64_t v85 = *(_DWORD *)v94;
    uint64_t v86 = v54;
    uint64_t v87 = 0;
    char v88 = v53;
    *(_DWORD *)uint64_t v89 = *(_DWORD *)v93;
    *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
    uint64_t v90 = 0;
    char v91 = v92;
    return sub_25B6BF37C((uint64_t)&v65);
  }
  else
  {
    LOBYTE(v65) = 0;
    uint64_t v8 = sub_25B6D2C50();
    char v11 = v10;
    uint64_t v50 = v8;
    char v107 = v10 & 1;
    LOBYTE(v65) = 1;
    uint64_t v12 = sub_25B6D2C50();
    int v14 = v13;
    uint64_t v49 = v12;
    char v105 = v13 & 1;
    LOBYTE(v65) = 2;
    uint64_t v15 = sub_25B6D2C50();
    int v47 = v14;
    uint64_t v48 = v15;
    char v103 = v16 & 1;
    LOBYTE(v65) = 3;
    int v17 = v16;
    uint64_t v46 = sub_25B6D2C50();
    int v45 = v17;
    char v101 = v18 & 1;
    LOBYTE(v65) = 4;
    int v19 = v18;
    uint64_t v44 = sub_25B6D2C50();
    int v43 = v19;
    char v99 = v20 & 1;
    LOBYTE(v65) = 5;
    int v21 = v20;
    uint64_t v22 = sub_25B6D2C50();
    int v41 = v21;
    uint64_t v42 = v22;
    char v97 = v23 & 1;
    char v64 = 6;
    int v24 = v23;
    sub_25B6CDDF4();
    sub_25B6D2C60();
    int v40 = v24;
    uint64_t v25 = v65;
    LOBYTE(v24) = v66;
    char v95 = v66;
    LOBYTE(v65) = 7;
    uint64_t v26 = sub_25B6D2C30();
    uint64_t v28 = v27;
    uint64_t v54 = v26;
    LOBYTE(v65) = 8;
    swift_bridgeObjectRetain();
    int v29 = sub_25B6D2C40();
    uint64_t v108 = 0;
    int v53 = v29;
    uint64_t v39 = v28;
    char v64 = 9;
    uint64_t v38 = sub_25B6D2C50();
    uint64_t v108 = 0;
    char v31 = v30;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v52, v51);
    char v92 = v31 & 1;
    char v63 = v11 & 1;
    char v62 = v47 & 1;
    char v61 = v45 & 1;
    char v60 = v43 & 1;
    char v59 = v41 & 1;
    char v58 = v40 & 1;
    char v57 = v24;
    char v56 = v31 & 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v55);
    uint64_t v65 = v50;
    char v66 = v107;
    *(_DWORD *)char v67 = *(_DWORD *)v106;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v106[3];
    uint64_t v68 = v49;
    char v69 = v105;
    *(_DWORD *)uint64_t v70 = *(_DWORD *)v104;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v104[3];
    uint64_t v71 = v48;
    char v72 = v103;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v102[3];
    *(_DWORD *)v73 = *(_DWORD *)v102;
    uint64_t v74 = v46;
    char v75 = v101;
    *(_DWORD *)uint64_t v76 = *(_DWORD *)v100;
    *(_DWORD *)&v76[3] = *(_DWORD *)&v100[3];
    uint64_t v32 = v44;
    uint64_t v77 = v44;
    char v78 = v99;
    *(_DWORD *)uint64_t v79 = *(_DWORD *)v98;
    *(_DWORD *)&v79[3] = *(_DWORD *)&v98[3];
    uint64_t v33 = v42;
    uint64_t v80 = v42;
    char v81 = v97;
    *(_DWORD *)&v82[3] = *(_DWORD *)&v96[3];
    *(_DWORD *)v82 = *(_DWORD *)v96;
    uint64_t v83 = v25;
    char v84 = v95;
    *(_DWORD *)&v85[3] = *(_DWORD *)&v94[3];
    *(_DWORD *)uint64_t v85 = *(_DWORD *)v94;
    uint64_t v34 = v54;
    uint64_t v36 = v38;
    uint64_t v35 = v39;
    uint64_t v86 = v54;
    uint64_t v87 = v39;
    char v37 = v53;
    char v88 = v53;
    *(_DWORD *)uint64_t v89 = *(_DWORD *)v93;
    *(_DWORD *)&v89[3] = *(_DWORD *)&v93[3];
    uint64_t v90 = v38;
    char v91 = v92;
    uint64_t result = sub_25B6BF37C((uint64_t)&v65);
    *(void *)a2 = v50;
    *(unsigned char *)(a2 + 8) = v63;
    *(void *)(a2 + 16) = v49;
    *(unsigned char *)(a2 + 24) = v62;
    *(void *)(a2 + 32) = v48;
    *(unsigned char *)(a2 + 40) = v61;
    *(void *)(a2 + 48) = v46;
    *(unsigned char *)(a2 + 56) = v60;
    *(void *)(a2 + 64) = v32;
    *(unsigned char *)(a2 + 72) = v59;
    *(void *)(a2 + 80) = v33;
    *(unsigned char *)(a2 + 88) = v58;
    *(void *)(a2 + 96) = v25;
    *(unsigned char *)(a2 + 104) = v57;
    *(void *)(a2 + 112) = v34;
    *(void *)(a2 + 120) = v35;
    *(unsigned char *)(a2 + 128) = v37;
    *(void *)(a2 + 136) = v36;
    *(unsigned char *)(a2 + 144) = v56;
  }
  return result;
}

unint64_t sub_25B6C9B68()
{
  unint64_t result = qword_26A509480;
  if (!qword_26A509480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509480);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCQualityMessage()
{
  return self;
}

unint64_t sub_25B6C9BE0()
{
  unint64_t result = qword_26A509488;
  if (!qword_26A509488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509488);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCLogMessage()
{
  return self;
}

unint64_t sub_25B6C9C58()
{
  unint64_t result = qword_26A509490;
  if (!qword_26A509490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509490);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCConnectionInfoMessage()
{
  return self;
}

unint64_t sub_25B6C9CD0()
{
  unint64_t result = qword_26A509498;
  if (!qword_26A509498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509498);
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

uint64_t sub_25B6C9D6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A509148);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B6C9DD0()
{
  unint64_t result = qword_26A5094A0;
  if (!qword_26A5094A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094A0);
  }
  return result;
}

unint64_t sub_25B6C9E24()
{
  unint64_t result = qword_26A5094A8;
  if (!qword_26A5094A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094A8);
  }
  return result;
}

unint64_t sub_25B6C9E78()
{
  unint64_t result = qword_26A5094B0;
  if (!qword_26A5094B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094B0);
  }
  return result;
}

unint64_t sub_25B6C9ECC()
{
  unint64_t result = qword_26A5094B8;
  if (!qword_26A5094B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094B8);
  }
  return result;
}

unint64_t sub_25B6C9F20()
{
  unint64_t result = qword_26A5094C0;
  if (!qword_26A5094C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094C0);
  }
  return result;
}

unint64_t sub_25B6C9F74()
{
  unint64_t result = qword_26A5094C8;
  if (!qword_26A5094C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094C8);
  }
  return result;
}

unint64_t sub_25B6C9FC8()
{
  unint64_t result = qword_26A5094D0;
  if (!qword_26A5094D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094D0);
  }
  return result;
}

uint64_t sub_25B6CA01C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6B63617473 && a2 == 0xE500000000000000 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746174537473616CLL && a2 == 0xE900000000000065 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C62617972746572 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_25B6CA248(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65746172746962 && a2 == 0xE700000000000000;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025B6D6060 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F4C74656B636170 && a2 == 0xEA00000000007373 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025B6D6080 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x655073656D617266 && a2 == 0xEF646E6F63655372 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x72657474696ALL && a2 == 0xE600000000000000 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEE00726F6F506E6FLL || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E65537365747962 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_25B6CA5E0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6576656CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B6CA6CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73654D6574617473 && a2 == 0xEC00000065676173;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4D7974696C617571 && a2 == 0xEE00656761737365 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74736F4C6C6C6163 && a2 == 0xEF6567617373654DLL || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x617373654D676F6CLL && a2 == 0xEA00000000006567 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025B6D6220)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_25B6CA9CC(void *a1)
{
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509250);
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v54 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509258);
  uint64_t v50 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  int v53 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509260);
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v52 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509268);
  uint64_t v47 = *(void *)(v6 - 8);
  uint64_t v48 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509270);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509278);
  uint64_t v40 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509280);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  int v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1[3];
  unint64_t v18 = a1[4];
  uint64_t v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_25B6C9DD0();
  uint64_t v20 = v56;
  sub_25B6D2E60();
  if (!v20)
  {
    int v21 = v13;
    uint64_t v39 = v11;
    int v23 = v53;
    uint64_t v22 = v54;
    uint64_t v56 = v15;
    uint64_t v24 = sub_25B6D2CC0();
    if (*(void *)(v24 + 16) == 1)
    {
      switch(*(unsigned char *)(v24 + 32))
      {
        case 1:
          LOBYTE(v57) = 1;
          sub_25B6C9F74();
          int v29 = v10;
          sub_25B6D2C10();
          type metadata accessor for SOSUIWebRTCErrorMessage();
          sub_25B6CDDB0(&qword_26A509070, (void (*)(void))type metadata accessor for SOSUIWebRTCErrorMessage);
          uint64_t v30 = v43;
          sub_25B6D2CB0();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v30);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v14);
          unint64_t v18 = v57 | 0x2000000000000000;
          break;
        case 2:
          LOBYTE(v57) = 2;
          sub_25B6C9F20();
          char v31 = v51;
          sub_25B6D2C10();
          type metadata accessor for SOSUIWebRTCQualityMessage();
          sub_25B6CDDB0(&qword_26A509298, (void (*)(void))type metadata accessor for SOSUIWebRTCQualityMessage);
          uint64_t v32 = v48;
          sub_25B6D2CB0();
          uint64_t v33 = v56;
          (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v32);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v14);
          unint64_t v18 = v57 | 0x4000000000000000;
          break;
        case 3:
          LOBYTE(v57) = 3;
          sub_25B6C9ECC();
          uint64_t v34 = v52;
          sub_25B6D2C10();
          (*(void (**)(char *, uint64_t))(v44 + 8))(v34, v45);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v14);
          unint64_t v18 = 0xA000000000000000;
          break;
        case 4:
          LOBYTE(v57) = 4;
          sub_25B6C9E78();
          sub_25B6D2C10();
          type metadata accessor for SOSUIWebRTCLogMessage();
          sub_25B6CDDB0(&qword_26A509290, (void (*)(void))type metadata accessor for SOSUIWebRTCLogMessage);
          uint64_t v35 = v41;
          sub_25B6D2CB0();
          uint64_t v36 = v56;
          (*(void (**)(char *, uint64_t))(v50 + 8))(v23, v35);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v17, v14);
          unint64_t v18 = v57 | 0x6000000000000000;
          break;
        case 5:
          LOBYTE(v57) = 5;
          sub_25B6C9E24();
          sub_25B6D2C10();
          type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
          sub_25B6CDDB0(&qword_26A509288, (void (*)(void))type metadata accessor for SOSUIWebRTCConnectionInfoMessage);
          uint64_t v37 = v46;
          sub_25B6D2CB0();
          uint64_t v38 = v56;
          (*(void (**)(char *, uint64_t))(v49 + 8))(v22, v37);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v14);
          unint64_t v18 = v57 | 0x8000000000000000;
          break;
        default:
          LOBYTE(v57) = 0;
          sub_25B6C9FC8();
          sub_25B6D2C10();
          type metadata accessor for SOSUIWebRTCState();
          sub_25B6CDDB0(&qword_26A5092A0, (void (*)(void))type metadata accessor for SOSUIWebRTCState);
          uint64_t v25 = v39;
          sub_25B6D2CB0();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v25);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v14);
          unint64_t v18 = v57;
          break;
      }
    }
    else
    {
      unint64_t v18 = sub_25B6D2BB0();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A509248);
      *uint64_t v27 = &type metadata for SOSUIWebRTCMessage;
      sub_25B6D2C20();
      sub_25B6D2BA0();
      (*(void (**)(void *, void, unint64_t))(*(void *)(v18 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v18);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v14);
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v55);
  return v18;
}

unint64_t sub_25B6CB4F4()
{
  unint64_t result = qword_26A5094D8;
  if (!qword_26A5094D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094D8);
  }
  return result;
}

unint64_t sub_25B6CB548()
{
  unint64_t result = qword_26A5094E0;
  if (!qword_26A5094E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094E0);
  }
  return result;
}

uint64_t sub_25B6CB59C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509238);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A509240);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25B6CB4F4();
  sub_25B6D2E60();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_25B6D2CC0() + 16) == 1)
    {
      sub_25B6CB548();
      sub_25B6D2C10();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_25B6D2BB0();
      swift_allocError();
      int v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A509248);
      void *v13 = &type metadata for SOSUIWebRTCInternalMessage;
      sub_25B6D2C20();
      sub_25B6D2BA0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t type metadata accessor for SOSUIWebtRTCDoubleRange()
{
  return self;
}

unint64_t sub_25B6CB8A8()
{
  unint64_t result = qword_26A5094E8;
  if (!qword_26A5094E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5094E8);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebtRTCCapabilities()
{
  return self;
}

unint64_t sub_25B6CB920()
{
  unint64_t result = qword_26A5094F0[0];
  if (!qword_26A5094F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5094F0);
  }
  return result;
}

unint64_t sub_25B6CB978()
{
  unint64_t result = qword_26A509218;
  if (!qword_26A509218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509218);
  }
  return result;
}

unint64_t sub_25B6CB9D0()
{
  unint64_t result = qword_26A509220;
  if (!qword_26A509220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509220);
  }
  return result;
}

unint64_t sub_25B6CBA28()
{
  unint64_t result = qword_26A509228;
  if (!qword_26A509228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509228);
  }
  return result;
}

unint64_t sub_25B6CBA80()
{
  unint64_t result = qword_26A509230;
  if (!qword_26A509230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509230);
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCStateName()
{
  return &type metadata for SOSUIWebRTCStateName;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCCameraFacing()
{
  return &type metadata for SOSUIWebRTCCameraFacing;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCVideoPreference()
{
  return &type metadata for SOSUIWebRTCVideoPreference;
}

uint64_t initializeBufferWithCopyOfBuffer for SOSUIWebRTCConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SOSUIWebRTCConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v3 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v3;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v4 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v4;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v5 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = a2[4];
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = a2[6];
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = a2[8];
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v9;
  uint64_t v10 = a2[12];
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 96) = v10;
  *(void *)(a1 + 112) = a2[14];
  *(void *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  uint64_t v11 = a2[17];
  *(unsigned char *)(a1 + 144) = *((unsigned char *)a2 + 144);
  *(void *)(a1 + 136) = v11;
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v5 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 145)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 120);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 0;
    }
    if (a2) {
      *(void *)(result + 120) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConfiguration()
{
  return &type metadata for SOSUIWebRTCConfiguration;
}

unint64_t *initializeBufferWithCopyOfBuffer for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_25B6BF3F4(*a2);
  *a1 = v3;
  return a1;
}

void destroy for SOSUIWebRTCMessage(unint64_t *a1)
{
}

unint64_t *assignWithCopy for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_25B6BF3F4(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_25B6BF3A8(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

unint64_t *assignWithTake for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_25B6BF3A8(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7B && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 123);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7A) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7A)
  {
    *(void *)__n128 result = a2 - 123;
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7B) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_25B6CC010(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 4) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 5;
  }
}

void *sub_25B6CC02C(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_25B6CC03C(unint64_t *result, uint64_t a2)
{
  if (a2 < 5)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 61;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 5);
    unint64_t v3 = 0xA000000000000000;
  }
  *__n128 result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage()
{
  return &type metadata for SOSUIWebRTCMessage;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage()
{
  return &type metadata for SOSUIWebRTCInternalMessage;
}

ValueMetadata *type metadata accessor for SOSUIWebtRTCCapabilities.CodingKeys()
{
  return &type metadata for SOSUIWebtRTCCapabilities.CodingKeys;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebtRTCDoubleRange.CodingKeys()
{
  return &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCInternalMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SOSUIWebRTCMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x25B6CC248);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.StateMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.ErrorMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.QualityMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.CallLostMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.CallLostMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.LogMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.ConnectedMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys;
}

uint64_t _s5SOSUI26SOSUIWebRTCInternalMessageOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s5SOSUI26SOSUIWebRTCInternalMessageOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25B6CC3CCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConnectionInfoMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys;
}

uint64_t _s5SOSUI23SOSUIWebtRTCDoubleRangeC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s5SOSUI23SOSUIWebtRTCDoubleRangeC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25B6CC560);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25B6CC588(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25B6CC590(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCLogMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCLogMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCQualityMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SOSUIWebRTCQualityMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x25B6CC708);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCQualityMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCQualityMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCErrorMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SOSUIWebRTCErrorMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25B6CC89CLL);
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

ValueMetadata *type metadata accessor for SOSUIWebRTCErrorMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCErrorMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SOSUIWebRTCConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *__n128 result = a2 + 9;
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
        JUMPOUT(0x25B6CCA30);
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
          *__n128 result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConfiguration.CodingKeys()
{
  return &type metadata for SOSUIWebRTCConfiguration.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SOSUIWebRTCState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 8;
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
        JUMPOUT(0x25B6CCBC4);
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
          *__n128 result = a2 + 8;
        break;
    }
  }
  return result;
}

unsigned char *sub_25B6CCBEC(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCState.CodingKeys()
{
  return &type metadata for SOSUIWebRTCState.CodingKeys;
}

unint64_t sub_25B6CCC08()
{
  unint64_t result = qword_26A50A880[0];
  if (!qword_26A50A880[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50A880);
  }
  return result;
}

unint64_t sub_25B6CCC60()
{
  unint64_t result = qword_26A50AA90[0];
  if (!qword_26A50AA90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50AA90);
  }
  return result;
}

unint64_t sub_25B6CCCB8()
{
  unint64_t result = qword_26A50ACA0[0];
  if (!qword_26A50ACA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50ACA0);
  }
  return result;
}

unint64_t sub_25B6CCD10()
{
  unint64_t result = qword_26A50AEB0[0];
  if (!qword_26A50AEB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50AEB0);
  }
  return result;
}

unint64_t sub_25B6CCD68()
{
  unint64_t result = qword_26A50B0C0[0];
  if (!qword_26A50B0C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50B0C0);
  }
  return result;
}

unint64_t sub_25B6CCDC0()
{
  unint64_t result = qword_26A50B2D0[0];
  if (!qword_26A50B2D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50B2D0);
  }
  return result;
}

unint64_t sub_25B6CCE18()
{
  unint64_t result = qword_26A50B4E0[0];
  if (!qword_26A50B4E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50B4E0);
  }
  return result;
}

unint64_t sub_25B6CCE70()
{
  unint64_t result = qword_26A50B6F0[0];
  if (!qword_26A50B6F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50B6F0);
  }
  return result;
}

unint64_t sub_25B6CCEC8()
{
  unint64_t result = qword_26A50BA00[0];
  if (!qword_26A50BA00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50BA00);
  }
  return result;
}

unint64_t sub_25B6CCF20()
{
  unint64_t result = qword_26A50BC10[0];
  if (!qword_26A50BC10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50BC10);
  }
  return result;
}

unint64_t sub_25B6CCF78()
{
  unint64_t result = qword_26A50BE20[0];
  if (!qword_26A50BE20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50BE20);
  }
  return result;
}

unint64_t sub_25B6CCFD0()
{
  unint64_t result = qword_26A50C030[0];
  if (!qword_26A50C030[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C030);
  }
  return result;
}

unint64_t sub_25B6CD028()
{
  unint64_t result = qword_26A50C340[0];
  if (!qword_26A50C340[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C340);
  }
  return result;
}

unint64_t sub_25B6CD080()
{
  unint64_t result = qword_26A50C550[0];
  if (!qword_26A50C550[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C550);
  }
  return result;
}

unint64_t sub_25B6CD0D8()
{
  unint64_t result = qword_26A50C760[0];
  if (!qword_26A50C760[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C760);
  }
  return result;
}

unint64_t sub_25B6CD130()
{
  unint64_t result = qword_26A50C870;
  if (!qword_26A50C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50C870);
  }
  return result;
}

unint64_t sub_25B6CD188()
{
  unint64_t result = qword_26A50C878;
  if (!qword_26A50C878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50C878);
  }
  return result;
}

unint64_t sub_25B6CD1E0()
{
  unint64_t result = qword_26A50C900;
  if (!qword_26A50C900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50C900);
  }
  return result;
}

unint64_t sub_25B6CD238()
{
  unint64_t result = qword_26A50C908[0];
  if (!qword_26A50C908[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C908);
  }
  return result;
}

unint64_t sub_25B6CD290()
{
  unint64_t result = qword_26A50C990;
  if (!qword_26A50C990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50C990);
  }
  return result;
}

unint64_t sub_25B6CD2E8()
{
  unint64_t result = qword_26A50C998[0];
  if (!qword_26A50C998[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50C998);
  }
  return result;
}

unint64_t sub_25B6CD340()
{
  unint64_t result = qword_26A50CA20;
  if (!qword_26A50CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CA20);
  }
  return result;
}

unint64_t sub_25B6CD398()
{
  unint64_t result = qword_26A50CA28[0];
  if (!qword_26A50CA28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CA28);
  }
  return result;
}

unint64_t sub_25B6CD3F0()
{
  unint64_t result = qword_26A50CAB0;
  if (!qword_26A50CAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CAB0);
  }
  return result;
}

unint64_t sub_25B6CD448()
{
  unint64_t result = qword_26A50CAB8[0];
  if (!qword_26A50CAB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CAB8);
  }
  return result;
}

unint64_t sub_25B6CD4A0()
{
  unint64_t result = qword_26A50CB40;
  if (!qword_26A50CB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CB40);
  }
  return result;
}

unint64_t sub_25B6CD4F8()
{
  unint64_t result = qword_26A50CB48[0];
  if (!qword_26A50CB48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CB48);
  }
  return result;
}

unint64_t sub_25B6CD550()
{
  unint64_t result = qword_26A50CBD0;
  if (!qword_26A50CBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CBD0);
  }
  return result;
}

unint64_t sub_25B6CD5A8()
{
  unint64_t result = qword_26A50CBD8[0];
  if (!qword_26A50CBD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CBD8);
  }
  return result;
}

unint64_t sub_25B6CD600()
{
  unint64_t result = qword_26A50CC60;
  if (!qword_26A50CC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CC60);
  }
  return result;
}

unint64_t sub_25B6CD658()
{
  unint64_t result = qword_26A50CC68[0];
  if (!qword_26A50CC68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CC68);
  }
  return result;
}

unint64_t sub_25B6CD6B0()
{
  unint64_t result = qword_26A50CCF0;
  if (!qword_26A50CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CCF0);
  }
  return result;
}

unint64_t sub_25B6CD708()
{
  unint64_t result = qword_26A50CCF8[0];
  if (!qword_26A50CCF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CCF8);
  }
  return result;
}

unint64_t sub_25B6CD760()
{
  unint64_t result = qword_26A50CD80;
  if (!qword_26A50CD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CD80);
  }
  return result;
}

unint64_t sub_25B6CD7B8()
{
  unint64_t result = qword_26A50CD88[0];
  if (!qword_26A50CD88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CD88);
  }
  return result;
}

unint64_t sub_25B6CD810()
{
  unint64_t result = qword_26A50CE10;
  if (!qword_26A50CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CE10);
  }
  return result;
}

unint64_t sub_25B6CD868()
{
  unint64_t result = qword_26A50CE18[0];
  if (!qword_26A50CE18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CE18);
  }
  return result;
}

unint64_t sub_25B6CD8C0()
{
  unint64_t result = qword_26A50CEA0;
  if (!qword_26A50CEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CEA0);
  }
  return result;
}

unint64_t sub_25B6CD918()
{
  unint64_t result = qword_26A50CEA8[0];
  if (!qword_26A50CEA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CEA8);
  }
  return result;
}

unint64_t sub_25B6CD970()
{
  unint64_t result = qword_26A50CF30;
  if (!qword_26A50CF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CF30);
  }
  return result;
}

unint64_t sub_25B6CD9C8()
{
  unint64_t result = qword_26A50CF38[0];
  if (!qword_26A50CF38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CF38);
  }
  return result;
}

unint64_t sub_25B6CDA20()
{
  unint64_t result = qword_26A50CFC0;
  if (!qword_26A50CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50CFC0);
  }
  return result;
}

unint64_t sub_25B6CDA78()
{
  unint64_t result = qword_26A50CFC8[0];
  if (!qword_26A50CFC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50CFC8);
  }
  return result;
}

unint64_t sub_25B6CDAD0()
{
  unint64_t result = qword_26A50D050;
  if (!qword_26A50D050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D050);
  }
  return result;
}

unint64_t sub_25B6CDB28()
{
  unint64_t result = qword_26A50D058[0];
  if (!qword_26A50D058[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50D058);
  }
  return result;
}

unint64_t sub_25B6CDB80()
{
  unint64_t result = qword_26A50D0E0;
  if (!qword_26A50D0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D0E0);
  }
  return result;
}

unint64_t sub_25B6CDBD8()
{
  unint64_t result = qword_26A50D0E8[0];
  if (!qword_26A50D0E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50D0E8);
  }
  return result;
}

unint64_t sub_25B6CDC30()
{
  unint64_t result = qword_26A50D170;
  if (!qword_26A50D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A50D170);
  }
  return result;
}

unint64_t sub_25B6CDC88()
{
  unint64_t result = qword_26A50D178[0];
  if (!qword_26A50D178[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A50D178);
  }
  return result;
}

uint64_t sub_25B6CDCDC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v2 || (sub_25B6D2D90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25B6D2D90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25B6CDDB0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25B6CDDF4()
{
  unint64_t result = qword_26A5092B0;
  if (!qword_26A5092B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5092B0);
  }
  return result;
}

uint64_t sub_25B6CDE80()
{
  return sub_25B6CDFF0(&qword_26A5092C0);
}

void sub_25B6CDE8C(void *a1)
{
}

void (*sub_25B6CDEE4(void *a1))(id **a1, char a2)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = qword_26A5092C0;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x261167390](v5);
  return sub_25B6CDF68;
}

void sub_25B6CDF68(id **a1, char a2)
{
  int v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();
  }
  free(v3);
}

uint64_t sub_25B6CDFE4()
{
  return sub_25B6CDFF0(&qword_26A5092C8);
}

uint64_t sub_25B6CDFF0(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x261167390](v2);
}

uint64_t sub_25B6CE038()
{
  return swift_unknownObjectRelease();
}

void (*sub_25B6CE094(void *a1))(void **a1, char a2)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = qword_26A5092C8;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x261167390](v5);
  return sub_25B6AAE78;
}

uint64_t sub_25B6CE118()
{
  uint64_t v1 = (uint64_t *)(v0 + qword_26A5092F0);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_25B6C15D8(*v1);
  return v2;
}

uint64_t sub_25B6CE174(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + qword_26A5092F0);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_25B6BF07C(v6);
}

uint64_t (*sub_25B6CE1D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25B6CE230()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + qword_26A5092F8);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_25B6CE278(char a1)
{
  int v3 = (unsigned char *)(v1 + qword_26A5092F8);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_25B6CE2C4())()
{
  return j__swift_endAccess;
}

uint64_t sub_25B6CE324(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x88);
  swift_retain();
  return v6(a1, a2);
}

void (*sub_25B6CE3AC(uint64_t a1, void *a2))(void)
{
  return sub_25B6D1CDC(a2);
}

uint64_t sub_25B6CE3B4@<X0>(id a1@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v9 = objc_msgSend(a1, sel_body);
  sub_25B6D2B70();
  swift_unknownObjectRelease();
  sub_25B6D13A0(a2, (uint64_t)v11, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
}

void sub_25B6CE448(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  sub_25B6D1CDC(v7);
}

id sub_25B6CE4C0()
{
  uint64_t v1 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v2 = (void *)((char *)v0 + qword_26A5092F0);
  *uint64_t v2 = 0;
  v2[1] = 0;
  *((unsigned char *)v0 + qword_26A5092F8) = 0;
  long long v3 = *(_OWORD *)(v1 + 96);
  v6[0] = *(_OWORD *)(v1 + 80);
  v6[1] = v3;
  uint64_t v4 = (objc_class *)type metadata accessor for SOSUIWebRTCRPC.LoadedListener(0, (uint64_t)v6);
  v7.receiver = v0;
  v7.super_class = v4;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_25B6CE554()
{
  return sub_25B6CE4C0();
}

id sub_25B6CE578()
{
  long long v1 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4[0] = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  v4[1] = v1;
  uint64_t v2 = (objc_class *)type metadata accessor for SOSUIWebRTCRPC.LoadedListener(0, (uint64_t)v4);
  v5.receiver = v0;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

uint64_t sub_25B6CE5F0(uint64_t a1)
{
  return sub_25B6BF07C(*(void *)(a1 + qword_26A5092F0));
}

uint64_t sub_25B6CE604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_allocWithZone(v3);
  id v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *id v8 = v4;
  v8[1] = sub_25B6CE6BC;
  return sub_25B6CE7BC(a1, a2, a3);
}

uint64_t sub_25B6CE6BC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  objc_super v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_25B6CE7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[28] = a3;
  v4[29] = v3;
  v4[26] = a1;
  v4[27] = a2;
  v4[30] = *MEMORY[0x263F8EED0] & *v3;
  uint64_t v5 = sub_25B6D2990();
  v4[31] = v5;
  v4[32] = *(void *)(v5 - 8);
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  v4[37] = sub_25B6D2AA0();
  v4[38] = sub_25B6D2A90();
  uint64_t v7 = sub_25B6D2A70();
  v4[39] = v7;
  v4[40] = v6;
  return MEMORY[0x270FA2498](sub_25B6CE918, v7, v6);
}

uint64_t sub_25B6CE918()
{
  id receiver = v0[16].receiver;
  id v38 = v0[18].receiver;
  Class super_class = v0[15].super_class;
  Class v3 = v0[14].super_class;
  uint64_t v2 = v0[15].receiver;
  id v41 = v0[14].receiver;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v4 = (char *)v3 + qword_26A5092D8;
  strcpy((char *)v3 + qword_26A5092D8, "webRTCParent");
  v4[13] = 0;
  *((_WORD *)v4 + 7) = -5120;
  uint64_t v5 = (void *)((char *)v3 + qword_26A5092E0);
  *uint64_t v5 = 0xD000000000000012;
  v5[1] = 0x800000025B6D62E0;
  uint64_t v6 = (char *)v3 + qword_26A5092E8;
  strcpy((char *)v3 + qword_26A5092E8, "WebRTCClient");
  v6[13] = 0;
  *((_WORD *)v6 + 7) = -5120;
  *((unsigned char *)v3 + qword_26A509310) = 1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *(void *)((char *)v3 + qword_26A5092D0) = v41;
  uint64_t v7 = (objc_class *)v2[11];
  uint64_t v8 = (void *)v2[12];
  uint64_t v9 = (objc_class *)v2[13];
  uint64_t v37 = (void *)v2[10];
  v0[1].id receiver = v37;
  v0[1].Class super_class = v7;
  v0[2].id receiver = v8;
  v0[2].Class super_class = v9;
  uint64_t v10 = type metadata accessor for SOSUIWebRTCRPC(0, (uint64_t)&v0[1]);
  v0[12].id receiver = v3;
  v0[12].Class super_class = (Class)v10;
  uint64_t v11 = (objc_class *)objc_msgSendSuper2(v0 + 12, sel_init);
  v0[20].Class super_class = v11;
  uint64_t v42 = v11;
  uint64_t v12 = sub_25B6AA1CC();
  v0[21].id receiver = (id)v12;
  int v13 = (objc_class *)*((void *)receiver + 2);
  v0[21].Class super_class = v13;
  v0[22].id receiver = (id)(((unint64_t)receiver + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000);
  ((void (*)(id, uint64_t, Class))v13)(v38, v12, super_class);
  uint64_t v14 = sub_25B6D2970();
  os_log_type_t v15 = sub_25B6D2B10();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_25B6A7000, v14, v15, "SOSUIWebRTCRPC.init: waiting for web client connection", v16, 2u);
    MEMORY[0x2611672F0](v16, -1, -1);
  }
  id v17 = v0[18].receiver;
  Class v18 = v0[15].super_class;
  id v19 = v0[16].receiver;
  id v20 = v0[13].receiver;

  int v21 = (objc_class *)*((void *)v19 + 1);
  v0[22].Class super_class = v21;
  v0[23].id receiver = (id)(((unint64_t)v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
  ((void (*)(id, Class))v21)(v17, v18);
  v0[5].id receiver = v37;
  v0[5].Class super_class = v7;
  v0[6].id receiver = v8;
  v0[6].Class super_class = v9;
  uint64_t v22 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SOSUIWebRTCRPC.LoadedListener(0, (uint64_t)&v0[5])), sel_init);
  v0[23].Class super_class = v22;
  id v23 = objc_msgSend(v20, sel_configuration);
  id v24 = objc_msgSend(v23, sel_userContentController);

  v0[24].id receiver = (id)qword_26A5092E0;
  uint64_t v25 = v22;
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)sub_25B6D29C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_addScriptMessageHandler_name_, v25, v26);

  id v27 = objc_msgSend(v20, sel_configuration);
  id v28 = objc_msgSend(v27, sel_userContentController);

  int v29 = v42;
  swift_bridgeObjectRetain();
  uint64_t v30 = (void *)sub_25B6D29C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_addScriptMessageHandler_name_, v29, v30);

  uint64_t v31 = MEMORY[0x263F8EE78];
  unint64_t v32 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  v0[24].Class super_class = (Class)v32;
  uint64_t v33 = *(int **)((*MEMORY[0x263F8EED0] & *(void *)v29) + 0xF8);
  uint64_t v34 = (*MEMORY[0x263F8EED0] & *(void *)v29) + 248;
  v0[25].id receiver = v33;
  v0[25].Class super_class = (Class)(v34 & 0xFFFFFFFFFFFFLL | 0xE2DD000000000000);
  uint64_t v40 = (uint64_t (*)(objc_super *, uint64_t, unint64_t, uint64_t, unint64_t))((char *)v33 + *v33);
  uint64_t v35 = (void *)swift_task_alloc();
  v0[26].id receiver = v35;
  *uint64_t v35 = v0;
  v35[1] = sub_25B6CEE28;
  return v40(v0 + 3, 0x4364694474736F68, 0xEE007463656E6E6FLL, v31, v32);
}

uint64_t sub_25B6CEE28()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 312);
    uint64_t v4 = *(void *)(v2 + 320);
    uint64_t v5 = sub_25B6CF754;
  }
  else
  {
    sub_25B6BF834(v2 + 48, &qword_26A508988);
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 312);
    uint64_t v4 = *(void *)(v2 + 320);
    uint64_t v5 = sub_25B6CEF60;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25B6CEF60()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[43];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[31];
  swift_release();
  v1(v3, v2, v4);
  uint64_t v5 = sub_25B6D2970();
  os_log_type_t v6 = sub_25B6D2B10();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25B6A7000, v5, v6, "SOSUIWebRTCRPC.init: web client already loaded", v7, 2u);
    MEMORY[0x2611672F0](v7, -1, -1);
  }
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[45];
  uint64_t v9 = v0[35];
  uint64_t v10 = v0[31];
  uint64_t v11 = (void *)v0[26];

  v8(v9, v10);
  id v12 = objc_msgSend(v11, sel_configuration);
  id v13 = objc_msgSend(v12, sel_userContentController);

  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_25B6D29C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_removeScriptMessageHandlerForName_, v14);

  ((void (*)(void, void, void))v0[43])(v0[34], v0[42], v0[31]);
  os_log_type_t v15 = sub_25B6D2970();
  os_log_type_t v16 = sub_25B6D2B10();
  BOOL v17 = os_log_type_enabled(v15, v16);
  Class v18 = (void *)v0[47];
  id v19 = (void *)v0[41];
  id v20 = (void *)v0[26];
  if (v17)
  {
    int v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v21 = 0;
    _os_log_impl(&dword_25B6A7000, v15, v16, "SOSUIWebRTCRPC.init: web client connected", v21, 2u);
    MEMORY[0x2611672F0](v21, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  ((void (*)(void, void))v0[45])(v0[34], v0[31]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v23 = v0[41];
  return v22(v23);
}

uint64_t sub_25B6CF208()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 320);
  uint64_t v3 = *(void *)(v1 + 312);
  return MEMORY[0x270FA2498](sub_25B6CF368, v3, v2);
}

uint64_t sub_25B6CF368()
{
  uint64_t v1 = (int *)v0[50];
  uint64_t v2 = MEMORY[0x263F8EE78];
  unint64_t v3 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
  v0[57] = v3;
  os_log_type_t v6 = (int *)((char *)v1 + *v1);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[58] = v4;
  void *v4 = v0;
  v4[1] = sub_25B6CF490;
  return ((uint64_t (*)(void *, uint64_t, unint64_t, uint64_t, unint64_t))v6)(v0 + 14, 0x4364694474736F68, 0xEE007463656E6E6FLL, v2, v3);
}

uint64_t sub_25B6CF490()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v3 = (void *)v2[41];
    swift_bridgeObjectRelease();

    uint64_t v4 = v2[39];
    uint64_t v5 = v2[40];
    os_log_type_t v6 = sub_25B6CFA48;
  }
  else
  {
    sub_25B6BF834((uint64_t)(v2 + 14), &qword_26A508988);
    swift_bridgeObjectRelease();
    uint64_t v4 = v2[39];
    uint64_t v5 = v2[40];
    os_log_type_t v6 = sub_25B6CF5D0;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_25B6CF5D0()
{
  uint64_t v1 = *(void **)(v0 + 424);
  swift_release();

  (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 272), *(void *)(v0 + 336), *(void *)(v0 + 248));
  uint64_t v2 = sub_25B6D2970();
  os_log_type_t v3 = sub_25B6D2B10();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void **)(v0 + 376);
  os_log_type_t v6 = *(void **)(v0 + 328);
  uint64_t v7 = *(void **)(v0 + 208);
  if (v4)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25B6A7000, v2, v3, "SOSUIWebRTCRPC.init: web client connected", v8, 2u);
    MEMORY[0x2611672F0](v8, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  (*(void (**)(void, void))(v0 + 360))(*(void *)(v0 + 272), *(void *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v10 = *(void *)(v0 + 328);
  return v9(v10);
}

uint64_t sub_25B6CF754()
{
  (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 264), *(void *)(v0 + 336), *(void *)(v0 + 248));
  uint64_t v1 = sub_25B6D2970();
  os_log_type_t v2 = sub_25B6D2B10();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_25B6A7000, v1, v2, "SOSUIWebRTCRPC.init: web client not loaded, waiting for load", v3, 2u);
    MEMORY[0x2611672F0](v3, -1, -1);
  }
  BOOL v4 = *(void **)(v0 + 376);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 264);
  uint64_t v7 = *(void *)(v0 + 248);

  uint64_t v8 = v5(v6, v7);
  if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x98))(v8))
  {
    uint64_t v9 = *(int **)(v0 + 400);
    uint64_t v10 = MEMORY[0x263F8EE78];
    unint64_t v11 = sub_25B6AED7C(MEMORY[0x263F8EE78]);
    *(void *)(v0 + 456) = v11;
    id v19 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t))((char *)v9 + *v9);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 464) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_25B6CF490;
    return v19(v0 + 112, 0x4364694474736F68, 0xEE007463656E6E6FLL, v10, v11);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 376);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v16 = *(void *)(v0 + 208);
    *(void *)(v0 + 432) = sub_25B6D2A90();
    BOOL v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v17;
    v17[2] = v14;
    v17[3] = v16;
    v17[4] = v15;
    Class v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v18;
    *Class v18 = v0;
    v18[1] = sub_25B6CF208;
    return MEMORY[0x270FA2318]();
  }
}

uint64_t sub_25B6CFA48()
{
  uint64_t v1 = *(void **)(v0 + 424);
  os_log_type_t v2 = *(void **)(v0 + 376);
  os_log_type_t v3 = *(void **)(v0 + 328);

  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25B6CFB24()
{
  return MEMORY[0x263F8EE78];
}

unint64_t sub_25B6CFB30()
{
  return sub_25B6AED7C(MEMORY[0x263F8EE78]);
}

uint64_t sub_25B6CFB3C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a4;
  uint64_t v7 = *MEMORY[0x263F8EED0] & *a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = *(void *)(v7 + 80);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)(v7 + 88);
  *(void *)(v12 + 40) = *(void *)(v7 + 104);
  *(void *)(v12 + 48) = a3;
  id v13 = v19;
  *(void *)(v12 + 56) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  uint64_t v14 = *(void (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x263F8EED0] & *a2) + 0xB0);
  id v15 = a3;
  id v16 = v13;
  v14(sub_25B6D27A0, v12);
  return swift_release();
}

uint64_t sub_25B6CFD44(void *a1)
{
  uint64_t v2 = sub_25B6D2990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25B6AA1CC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_25B6D2970();
  os_log_type_t v8 = sub_25B6D2B10();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25B6A7000, v7, v8, "SOSUIWebRTCRPC.init: received load message", v9, 2u);
    MEMORY[0x2611672F0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = objc_msgSend(a1, sel_configuration);
  id v11 = objc_msgSend(v10, sel_userContentController);

  uint64_t v12 = (void *)sub_25B6D29C0();
  objc_msgSend(v11, sel_removeScriptMessageHandlerForName_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  return sub_25B6D2A80();
}

id sub_25B6CFF34()
{
  uint64_t v1 = v0;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *(void *)v0;
  uint64_t v3 = sub_25B6D2990();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25B6AA1CC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  os_log_type_t v8 = sub_25B6D2970();
  os_log_type_t v9 = sub_25B6D2AE0();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_25B6A7000, v8, v9, "SOSUIWebRTCRPC.deinit", v10, 2u);
    MEMORY[0x2611672F0](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v11 = &v1[qword_26A5092C0];
  swift_beginAccess();
  uint64_t v12 = (void *)MEMORY[0x261167390](v11);
  if (v12)
  {
    id v13 = v12;
    id v14 = objc_msgSend(v12, sel_configuration);

    id v15 = objc_msgSend(v14, sel_userContentController);
    swift_bridgeObjectRetain();
    id v16 = (void *)sub_25B6D29C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_removeScriptMessageHandlerForName_, v16);
  }
  long long v17 = *(_OWORD *)(v2 + 96);
  v20[0] = *(_OWORD *)(v2 + 80);
  v20[1] = v17;
  uint64_t v18 = (objc_class *)type metadata accessor for SOSUIWebRTCRPC(0, (uint64_t)v20);
  v21.id receiver = v1;
  v21.Class super_class = v18;
  return objc_msgSendSuper2(&v21, sel_dealloc);
}

id sub_25B6D01AC(void *a1)
{
  id v1 = a1;
  return sub_25B6CFF34();
}

uint64_t sub_25B6D01D4()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25B6D025C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[10] = a5;
  v6[11] = v5;
  v6[8] = a3;
  v6[9] = a4;
  v6[6] = a1;
  v6[7] = a2;
  uint64_t v7 = sub_25B6D2990();
  v6[12] = v7;
  v6[13] = *(void *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  sub_25B6D2AA0();
  v6[16] = sub_25B6D2A90();
  uint64_t v9 = sub_25B6D2A70();
  v6[17] = v9;
  v6[18] = v8;
  return MEMORY[0x270FA2498](sub_25B6D0368, v9, v8);
}

uint64_t sub_25B6D0368()
{
  uint64_t v31 = v0;
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[9];
  sub_25B6D2B80();
  swift_bridgeObjectRelease();
  uint64_t v29 = 0x206E7275746572;
  unint64_t v30 = 0xE700000000000000;
  swift_bridgeObjectRetain();
  sub_25B6D2A40();
  swift_bridgeObjectRelease();
  sub_25B6D2A40();
  sub_25B6D2A40();
  sub_25B6D2A40();
  v0[2] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A509148);
  sub_25B6D20B0();
  sub_25B6D29A0();
  sub_25B6D2A40();
  swift_bridgeObjectRelease();
  sub_25B6D2A40();
  uint64_t v6 = v29;
  unint64_t v5 = v30;
  v0[19] = v29;
  v0[20] = v5;
  uint64_t v7 = sub_25B6AA1CC();
  v0[21] = v7;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[22] = v8;
  v0[23] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v1, v7, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_25B6D2970();
  os_log_type_t v10 = sub_25B6D2B10();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = v0[13];
    uint64_t v27 = v0[12];
    uint64_t v28 = v0[15];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_25B6BE940(v6, v5, &v29);
    sub_25B6D2B50();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25B6A7000, v9, v10, "SOSUIWebRTCRPC.rpcCall:argumentNames:arguments: making rpc call %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611672F0](v13, -1, -1);
    MEMORY[0x2611672F0](v12, -1, -1);

    id v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v14(v28, v27);
  }
  else
  {
    uint64_t v15 = v0[15];
    uint64_t v16 = v0[12];
    uint64_t v17 = v0[13];
    swift_bridgeObjectRelease_n();

    id v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v14(v15, v16);
  }
  v0[24] = v14;
  uint64_t v18 = (void *)v0[11];
  uint64_t v19 = sub_25B6D18B0(v0[10]);
  v0[25] = v19;
  uint64_t v20 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v18) + 0xA8))();
  v0[26] = v20;
  if (v20)
  {
    id v21 = objc_msgSend(self, sel_pageWorld);
    v0[27] = v21;
    uint64_t v22 = (void *)swift_task_alloc();
    v0[28] = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_25B6D07C4;
    uint64_t v23 = v0[6];
    return MEMORY[0x270FA1968](v23, v6, v5, v19, 0, v21);
  }
  else
  {
    id v24 = (_OWORD *)v0[6];
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    *id v24 = 0u;
    v24[1] = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
}

uint64_t sub_25B6D07C4()
{
  uint64_t v2 = (void *)*v1;
  v2[29] = v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)v2[27];
  uint64_t v4 = (void *)v2[26];
  if (v0)
  {

    swift_release();
    uint64_t v5 = v2[17];
    uint64_t v6 = v2[18];
    uint64_t v7 = sub_25B6D09C0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();

    uint64_t v5 = v2[17];
    uint64_t v6 = v2[18];
    uint64_t v7 = sub_25B6D094C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25B6D094C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25B6D09C0()
{
  uint64_t v28 = v0;
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[22];
  uint64_t v3 = v0[21];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[12];
  swift_release();
  v2(v4, v3, v5);
  id v6 = v1;
  swift_bridgeObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_25B6D2970();
  os_log_type_t v9 = sub_25B6D2B10();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (void *)v0[29];
    uint64_t v11 = v0[19];
    unint64_t v12 = v0[20];
    uint64_t v25 = v0[14];
    uint64_t v26 = (void (*)(uint64_t, uint64_t))v0[24];
    uint64_t v24 = v0[12];
    uint64_t v13 = swift_slowAlloc();
    id v14 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    v0[3] = sub_25B6BE940(v11, v12, &v27);
    sub_25B6D2B50();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2112;
    id v15 = v10;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v16;
    sub_25B6D2B50();
    *id v14 = v16;

    _os_log_impl(&dword_25B6A7000, v8, v9, "SOSUIWebRTCRPC.rpcCall:argumentNames:arguments: making rpc call %s failed, error: %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A509338);
    swift_arrayDestroy();
    MEMORY[0x2611672F0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2611672F0](v23, -1, -1);
    MEMORY[0x2611672F0](v13, -1, -1);

    v26(v25, v24);
  }
  else
  {
    uint64_t v17 = (void *)v0[29];
    uint64_t v18 = (void (*)(uint64_t, uint64_t))v0[24];
    uint64_t v19 = v0[14];
    uint64_t v20 = v0[12];
    swift_bridgeObjectRelease_n();

    v18(v19, v20);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  id v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_25B6D0CA4()
{
  uint64_t v0 = sub_25B6D2990();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_25B6D2A10();
  MEMORY[0x270FA5388](v1 - 8);
  sub_25B6D2900();
  swift_allocObject();
  sub_25B6D28F0();
  uint64_t v2 = sub_25B6D28E0();
  unint64_t v4 = v3;
  sub_25B6D210C(v2, v3);
  sub_25B6D2A00();
  uint64_t v5 = sub_25B6D29F0();
  sub_25B6D2164(v2, v4);
  sub_25B6D2164(v2, v4);
  swift_release();
  return v5;
}

uint64_t sub_25B6D0F08(uint64_t a1, void *a2)
{
  return sub_25B6D21BC(a2);
}

void sub_25B6D0F10(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  sub_25B6D21BC(v7);
}

void sub_25B6D0F88()
{
}

uint64_t sub_25B6D0FF4(uint64_t a1)
{
  uint64_t v2 = sub_25B6D2990();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  id v8 = &v26[-v7];
  uint64_t v9 = sub_25B6D2A10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25B6C1904(a1, (uint64_t)v27);
  if (swift_dynamicCast())
  {
    sub_25B6D2A00();
    uint64_t v13 = sub_25B6D29E0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
    if (v15 >> 60 != 15)
    {
      sub_25B6D28D0();
      swift_allocObject();
      sub_25B6D28C0();
      sub_25B6D2808();
      sub_25B6D28B0();
      uint64_t v24 = 0;
      swift_release();
      sub_25B6D25A0(v13, v15);
      goto LABEL_11;
    }
    uint64_t v16 = sub_25B6AA1CC();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v6, v16, v2);
    uint64_t v17 = sub_25B6D2970();
    os_log_type_t v18 = sub_25B6D2B10();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25B6A7000, v17, v18, "decodeJson: unable to access json data", v19, 2u);
      MEMORY[0x2611672F0](v19, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    uint64_t v20 = sub_25B6AA1CC();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v8, v20, v2);
    id v21 = sub_25B6D2970();
    os_log_type_t v22 = sub_25B6D2B10();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_25B6A7000, v21, v22, "decodeJson: malformed json", v23, 2u);
      MEMORY[0x2611672F0](v23, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  }
  uint64_t v24 = 1;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  return v24;
}

uint64_t sub_25B6D13A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v48 = a4;
  uint64_t v51 = a5;
  uint64_t v7 = sub_25B6D2990();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v43 - v11;
  uint64_t v13 = sub_25B6D2B40();
  uint64_t v49 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v43 - v14;
  uint64_t v16 = sub_25B6D2A10();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B6C1904(a2, (uint64_t)v52);
  if (swift_dynamicCast())
  {
    uint64_t v43 = v15;
    uint64_t v44 = v12;
    uint64_t v20 = v50;
    uint64_t v45 = v13;
    uint64_t v46 = a3;
    sub_25B6D2A00();
    uint64_t v21 = sub_25B6D29E0();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    if (v23 >> 60 == 15)
    {
      uint64_t v24 = sub_25B6AA1CC();
      uint64_t v25 = v20;
      uint64_t v26 = v44;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v44, v24, v7);
      uint64_t v27 = sub_25B6D2970();
      os_log_type_t v28 = sub_25B6D2B10();
      BOOL v29 = os_log_type_enabled(v27, v28);
      uint64_t v30 = v46;
      if (v29)
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_25B6A7000, v27, v28, "decodeJson: unable to access json data", v31, 2u);
        MEMORY[0x2611672F0](v31, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v51, 1, 1, v30);
    }
    else
    {
      sub_25B6D28D0();
      swift_allocObject();
      sub_25B6D28C0();
      id v38 = v43;
      uint64_t v39 = v46;
      sub_25B6D28B0();
      uint64_t v40 = v45;
      uint64_t v41 = v49;
      swift_release();
      sub_25B6D25A0(v21, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
      (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v51, v38, v40);
    }
  }
  else
  {
    uint64_t v32 = a3;
    uint64_t v33 = sub_25B6AA1CC();
    uint64_t v34 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v10, v33, v7);
    uint64_t v35 = sub_25B6D2970();
    os_log_type_t v36 = sub_25B6D2B10();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_25B6A7000, v35, v36, "decodeJson: malformed json", v37, 2u);
      MEMORY[0x2611672F0](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v51, 1, 1, v32);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
}

uint64_t sub_25B6D18B0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F58);
  uint64_t result = sub_25B6D2BE0();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v25 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v26 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = result + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    sub_25B6C1904(*(void *)(a1 + 56) + 32 * i, (uint64_t)v29);
    swift_bridgeObjectRetain();
    sub_25B6C1904((uint64_t)v29, (uint64_t)&v34);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_25B6C1904((uint64_t)v29, (uint64_t)v37);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
LABEL_19:
      sub_25B6C1904((uint64_t)v29, (uint64_t)v36);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
LABEL_20:
      sub_25B6C1904((uint64_t)v29, (uint64_t)&v27);
      goto LABEL_21;
    }
    sub_25B6C1904((uint64_t)v29, (uint64_t)v37);
    sub_25B6BF260(v37, &v34);
    if (swift_dynamicCast()) {
      goto LABEL_19;
    }
    sub_25B6C1904((uint64_t)v29, (uint64_t)v36);
    sub_25B6BF260(v36, &v34);
    if (swift_dynamicCast()) {
      goto LABEL_20;
    }
    sub_25B6C1904((uint64_t)v29, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5093B0);
    if (swift_dynamicCast())
    {
      sub_25B6D26B0(&v30, (uint64_t)&v34);
      __swift_project_boxed_opaque_existential_1(&v34, v35);
      uint64_t v21 = sub_25B6D0CA4();
      if (v22)
      {
        *((void *)&v31 + 1) = MEMORY[0x263F8D310];
        *(void *)&long long v30 = v21;
        *((void *)&v30 + 1) = v22;
        sub_25B6BF260(&v30, &v27);
      }
      else
      {
        id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
        unint64_t v28 = sub_25B6D2670();
        *(void *)&long long v27 = v24;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
    }
    else
    {
      uint64_t v32 = 0;
      long long v30 = 0u;
      long long v31 = 0u;
      sub_25B6BF834((uint64_t)&v30, &qword_26A5093B8);
      id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
      unint64_t v28 = sub_25B6D2670();
      *(void *)&long long v27 = v23;
    }
LABEL_21:
    if (v38)
    {
      swift_bridgeObjectRelease();
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      return (uint64_t)v3;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
    *(void *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v18 = (void *)(v3[6] + 16 * i);
    *uint64_t v18 = v16;
    v18[1] = v17;
    uint64_t result = (uint64_t)sub_25B6BF260(&v27, (_OWORD *)(v3[7] + 32 * i));
    uint64_t v19 = v3[2];
    BOOL v12 = __OFADD__(v19, 1);
    uint64_t v20 = v19 + 1;
    if (v12)
    {
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v3[2] = v20;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v12 = __OFADD__(v4++, 1);
    if (v12) {
      goto LABEL_39;
    }
    if (v4 >= v26) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v25 + 8 * v4);
    if (!v13) {
      break;
    }
LABEL_15:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v4 + 1;
  if (v4 + 1 >= v26) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v25 + 8 * v14);
  if (v13) {
    goto LABEL_14;
  }
  int64_t v14 = v4 + 2;
  if (v4 + 2 >= v26) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v25 + 8 * v14);
  if (v13) {
    goto LABEL_14;
  }
  int64_t v14 = v4 + 3;
  if (v4 + 3 >= v26) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v25 + 8 * v14);
  if (v13)
  {
LABEL_14:
    int64_t v4 = v14;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v26) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v25 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_15;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_25B6D1CDC(void *a1))(void)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25B6D2990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v27 - v9;
  id v11 = objc_msgSend(a1, sel_body);
  sub_25B6D2B70();
  swift_unknownObjectRelease();
  LOBYTE(a1) = sub_25B6D0FF4((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  uint64_t v12 = sub_25B6AA1CC();
  unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if (a1)
  {
    v13(v8, v12, v4);
    uint64_t v21 = sub_25B6D2970();
    os_log_type_t v22 = sub_25B6D2B10();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v29[0] = v24;
      *(_DWORD *)id v23 = 136315138;
      LOBYTE(v28) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5093C8);
      uint64_t v25 = sub_25B6D2A20();
      uint64_t v28 = sub_25B6BE940(v25, v26, v29);
      sub_25B6D2B50();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25B6A7000, v21, v22, "SOSUIWebRTCRPC.LoadedListener: unhandled message %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611672F0](v24, -1, -1);
      MEMORY[0x2611672F0](v23, -1, -1);
    }

    return (void (*)(void))(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    v13(v10, v12, v4);
    int64_t v14 = sub_25B6D2970();
    os_log_type_t v15 = sub_25B6D2B10();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25B6A7000, v14, v15, "SOSUIWebRTCRPC.LoadedListener: web client loaded message received", v16, 2u);
      MEMORY[0x2611672F0](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    uint64_t v17 = (void *)MEMORY[0x263F8EED0];
    uint64_t v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0xA0))(1);
    uint64_t result = (void (*)(void))(*(uint64_t (**)(uint64_t))((*v17 & *v2) + 0x80))(v18);
    if (result)
    {
      uint64_t v20 = (uint64_t)result;
      result();
      return (void (*)(void))sub_25B6BF07C(v20);
    }
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCRPC.LoadedListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SOSUIWebRTCRPC.LoadedListener);
}

uint64_t type metadata accessor for SOSUIWebRTCRPC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for SOSUIWebRTCRPC);
}

uint64_t sub_25B6D20A4(uint64_t a1)
{
  return sub_25B6CFB3C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_25B6D20B0()
{
  unint64_t result = qword_26A509330;
  if (!qword_26A509330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A509148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A509330);
  }
  return result;
}

uint64_t sub_25B6D210C(uint64_t a1, unint64_t a2)
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

uint64_t sub_25B6D2164(uint64_t a1, unint64_t a2)
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

uint64_t sub_25B6D21BC(void *a1)
{
  id v26 = a1;
  uint64_t v24 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v2 = v24;
  uint64_t v3 = sub_25B6D2990();
  uint64_t v25 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v24 + 80);
  uint64_t v7 = sub_25B6D2B40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v23 - v10;
  uint64_t v12 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v9);
  int64_t v14 = (char *)&v23 - v13;
  sub_25B6CE3B4(v26, *(void *)((char *)v1 + qword_26A5092D0), v6, *(void *)(v2 + 96), (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    uint64_t v15 = sub_25B6AA1CC();
    uint64_t v16 = v25;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v5, v15, v3);
    uint64_t v17 = sub_25B6D2970();
    os_log_type_t v18 = sub_25B6D2B10();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25B6A7000, v17, v18, "SOSUIWebRTCRPC.userContentController:didReceive: failed to decode message", v19, 2u);
      MEMORY[0x2611672F0](v19, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v3);
  }
  else
  {
    uint64_t v21 = v24;
    uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, v6);
    if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(v22))
    {
      (*(void (**)(char *, void))(*(void *)(v21 + 104) + 16))(v14, *(void *)(v21 + 88));
      swift_unknownObjectRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v6);
  }
}

void sub_25B6D2570()
{
}

uint64_t sub_25B6D25A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25B6D2164(a1, a2);
  }
  return a1;
}

uint64_t sub_25B6D25B8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25B6D2624()
{
  return swift_initClassMetadata2();
}

unint64_t sub_25B6D2670()
{
  unint64_t result = qword_26A5093C0;
  if (!qword_26A5093C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5093C0);
  }
  return result;
}

uint64_t sub_25B6D26B0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25B6D26C8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25B6D27A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A508F68);
  uint64_t v1 = *(void **)(v0 + 48);
  return sub_25B6CFD44(v1);
}

unint64_t sub_25B6D2808()
{
  unint64_t result = qword_26A5093D0;
  if (!qword_26A5093D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5093D0);
  }
  return result;
}

uint64_t sub_25B6D2860()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_25B6D2870()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_25B6D2880()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_25B6D2890()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_25B6D28A0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25B6D28B0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25B6D28C0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25B6D28D0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25B6D28E0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25B6D28F0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25B6D2900()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25B6D2910()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25B6D2920()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25B6D2930()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25B6D2940()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25B6D2950()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25B6D2960()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25B6D2970()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25B6D2980()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25B6D2990()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25B6D29A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25B6D29B0()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_25B6D29C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25B6D29D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25B6D29E0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25B6D29F0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25B6D2A00()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25B6D2A10()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25B6D2A20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25B6D2A30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25B6D2A40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25B6D2A50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25B6D2A60()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25B6D2A70()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25B6D2A80()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25B6D2A90()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25B6D2AA0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25B6D2AB0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25B6D2AC0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25B6D2AD0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25B6D2AE0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25B6D2AF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25B6D2B00()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25B6D2B10()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25B6D2B20()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25B6D2B40()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25B6D2B50()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25B6D2B60()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25B6D2B70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25B6D2B80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25B6D2B90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25B6D2BA0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25B6D2BB0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25B6D2BC0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25B6D2BD0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25B6D2BE0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25B6D2BF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25B6D2C00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25B6D2C10()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25B6D2C20()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25B6D2C30()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25B6D2C40()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25B6D2C50()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25B6D2C60()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25B6D2C70()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25B6D2C80()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25B6D2C90()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25B6D2CA0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25B6D2CB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25B6D2CC0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25B6D2CD0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25B6D2CE0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25B6D2CF0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25B6D2D00()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25B6D2D10()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25B6D2D20()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25B6D2D30()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25B6D2D40()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25B6D2D50()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25B6D2D60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25B6D2D70()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25B6D2D90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25B6D2DA0()
{
  return MEMORY[0x270F9F7E0]();
}

uint64_t sub_25B6D2DB0()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_25B6D2DC0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_25B6D2DD0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25B6D2DE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25B6D2DF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25B6D2E00()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25B6D2E10()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25B6D2E20()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25B6D2E30()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25B6D2E40()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25B6D2E50()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_25B6D2E60()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25B6D2E70()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_25B6D2E80()
{
  return MEMORY[0x270F9FD98]();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}