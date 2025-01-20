uint64_t _initializePreviewAgent()
{
  return MEMORY[0x270F9A540](UVFauxPreviewAgent);
}

Swift::Void __swiftcall PreviewDebugOverlay.contentsUpdated()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount) = v3;
    sub_23B5331A8();
  }
}

void sub_23B5331A8()
{
  uint64_t v1 = v0;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) != 0
    || *(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D50);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_23B552F30;
    uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
    swift_beginAccess();
    uint64_t v4 = *v3;
    uint64_t v5 = MEMORY[0x263F8EF38];
    *(void *)(v2 + 56) = MEMORY[0x263F8EF38];
    unint64_t v6 = sub_23B535148();
    *(void *)(v2 + 64) = v6;
    *(void *)(v2 + 32) = v4;
    uint64_t v7 = v3[1];
    *(void *)(v2 + 96) = v5;
    *(void *)(v2 + 104) = v6;
    *(void *)(v2 + 72) = v7;
    uint64_t v8 = sub_23B5523E0();
    uint64_t v10 = v9;
    swift_beginAccess();
    unint64_t v11 = sub_23B53519C();
    uint64_t v12 = MEMORY[0x263F8D310];
    sub_23B552540();
    uint64_t v30 = v13;
    unint64_t v28 = v11;
    unint64_t v29 = v11;
    uint64_t v26 = v12;
    unint64_t v27 = v11;
    uint64_t v14 = sub_23B552540();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D68);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_23B552F40;
    *(void *)(v17 + 32) = sub_23B552610();
    *(void *)(v17 + 40) = v18;
    *(void *)(v17 + 48) = sub_23B552610();
    *(void *)(v17 + 56) = v19;
    *(void *)(v17 + 64) = v8;
    *(void *)(v17 + 72) = v10;
    *(void *)(v17 + 80) = v14;
    *(void *)(v17 + 88) = v16;
    v20 = (char *)sub_23B5340B0();
    id v21 = *(id *)&v20[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label];

    __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D70);
    sub_23B5351F0();
    sub_23B5523A0();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_23B5523C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setText_, v22, v26, v27, v28, v29, 1397315157, 0xE400000000000000, 0x7463656A6E495655, 0xEF656E6563536465, v17, v30);

    id v23 = sub_23B5340B0();
    id v24 = objc_msgSend(v23, sel_superview);

    if (v24)
    {
      id v25 = sub_23B5340B0();
      objc_msgSend(v24, sel_bringSubviewToFront_, v25);
    }
  }
}

uint64_t PreviewDebugOverlay.identifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_23B53358C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

void sub_23B5335E4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_23B5331A8();
}

void PreviewDebugOverlay.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  sub_23B5331A8();
}

uint64_t (*PreviewDebugOverlay.identifier.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23B533720;
}

double PreviewDebugOverlay.size.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size;
  swift_beginAccess();
  return *(double *)v1;
}

__n128 sub_23B53376C@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

void sub_23B5337C0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  *uint64_t v4 = v2;
  v4[1] = v3;
  sub_23B5331A8();
}

void PreviewDebugOverlay.size.setter(double a1, double a2)
{
  uint64_t v5 = (double *)(v2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_23B5331A8();
}

uint64_t (*PreviewDebugOverlay.size.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23B533720;
}

void sub_23B5338D8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_23B5331A8();
  }
}

uint64_t PreviewDebugOverlay.enabled.getter()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled)) {
    return 1;
  }
  else {
    return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled);
  }
}

Swift::Void __swiftcall PreviewDebugOverlay.enable()()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) = 1;
  sub_23B533948();
}

void sub_23B533948()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) == 0
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) != 1)
  {
    goto LABEL_7;
  }
  id v3 = sub_23B5340B0();
  id v4 = objc_msgSend(v3, sel_superview);

  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent);
  if (!v4
    || (sub_23B534F24(0, &qword_268A69D30),
        id v6 = v5,
        id v7 = v4,
        char v8 = sub_23B552500(),
        v6,
        v7,
        v7,
        (v8 & 1) == 0))
  {
    id v13 = sub_23B5340B0();
    LOBYTE(v19[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_edge);
    sub_23B534538((char *)v19, v5);

    uint64_t v14 = self;
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v19[4] = sub_23B534F04;
    v19[5] = v15;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = sub_23B534358;
    v19[3] = &block_descriptor;
    uint64_t v16 = _Block_copy(v19);
    swift_release();
    id v17 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v16, 1.0);
    _Block_release(v16);
    uint64_t v18 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer);
    *(void *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer) = v17;

    return;
  }
  if ((*(unsigned char *)(v1 + v2) & 1) == 0
    && (*(unsigned char *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) & 1) == 0)
  {
LABEL_7:
    id v9 = sub_23B5340B0();
    objc_msgSend(v9, sel_removeFromSuperview);

    uint64_t v10 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer;
    unint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer);
    if (v11)
    {
      objc_msgSend(v11, sel_invalidate);
      uint64_t v12 = *(void **)(v1 + v10);
    }
    else
    {
      uint64_t v12 = 0;
    }
    *(void *)(v1 + v10) = 0;

    *(void *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown) = 0;
  }
}

void PreviewDebugOverlay.settings(_:changedValueForKey:)()
{
  id v1 = objc_msgSend(self, sel_rootSettings);
  unsigned __int8 v2 = objc_msgSend(v1, sel_showDebugUI);

  *(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) = v2;
  sub_23B533948();
}

BOOL static PreviewDebugOverlay.AlignmentEdge.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PreviewDebugOverlay.AlignmentEdge.hash(into:)()
{
  return sub_23B552660();
}

uint64_t PreviewDebugOverlay.AlignmentEdge.hashValue.getter()
{
  return sub_23B552670();
}

BOOL sub_23B533D84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23B533D9C()
{
  return sub_23B552670();
}

uint64_t sub_23B533DE4()
{
  return sub_23B552660();
}

uint64_t sub_23B533E10()
{
  return sub_23B552670();
}

unsigned char *PreviewDebugOverlay.__allocating_init(edge:parent:)(char *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return PreviewDebugOverlay.init(edge:parent:)(a1, a2);
}

unsigned char *PreviewDebugOverlay.init(edge:parent:)(char *a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v6 = *a1;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer] = 0;
  id v7 = &v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier];
  *id v7 = 17481;
  v7[1] = 0xE200000000000000;
  char v8 = &v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size];
  *char v8 = 0;
  v8[1] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled] = 0;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_edge] = v6;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent] = a2;
  v16.receiver = v2;
  v16.super_class = ObjectType;
  id v9 = a2;
  id v10 = objc_msgSendSuper2(&v16, sel_init);
  unint64_t v11 = self;
  uint64_t v12 = v10;
  id v13 = objc_msgSend(v11, sel_rootSettings, v16.receiver, v16.super_class);
  objc_msgSend(v13, sel_addKeyObserver_, v12);

  id v14 = objc_msgSend(v11, sel_rootSettings);
  LOBYTE(v13) = objc_msgSend(v14, sel_showDebugUI);

  v12[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled] = (_BYTE)v13;
  sub_23B533948();

  return v12;
}

Swift::Void __swiftcall PreviewDebugOverlay.bringToFront()()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) != 0
    || *(unsigned char *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) == 1)
  {
    sub_23B533948();
    id v1 = *(void **)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent);
    id v2 = sub_23B5340B0();
    objc_msgSend(v1, sel_bringSubviewToFront_, v2);
  }
}

id sub_23B5340B0()
{
  uint64_t v1 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PreviewDebugOverlay.OverlayView()), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_23B534124(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D38);
  MEMORY[0x270FA5388]();
  id v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = MEMORY[0x23ECC76A0](a2 + 16);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = sub_23B5524C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    char v8 = (void *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6;
    sub_23B54EDE8((uint64_t)v4, (uint64_t)&unk_268A69D48, (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t sub_23B53423C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_23B5524A0();
  *(void *)(v4 + 24) = sub_23B552490();
  uint64_t v6 = sub_23B552470();
  return MEMORY[0x270FA2498](sub_23B5342D4, v6, v5);
}

uint64_t sub_23B5342D4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t result = swift_release();
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown) = v5;
    sub_23B5331A8();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  return result;
}

void sub_23B534358(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

char *sub_23B5343C0()
{
  *(void *)&v0[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_labelPadding] = 0x4010000000000000;
  id v1 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  *(void *)&v2[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label] = v3;
  id v4 = v3;
  objc_msgSend(v4, sel_setAdjustsFontSizeToFitWidth_, 1);

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PreviewDebugOverlay.OverlayView();
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, sel_addSubview_, *(void *)&v5[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label]);
  return v5;
}

void sub_23B534538(char *a1, id a2)
{
  id v3 = v2;
  char v5 = *a1;
  objc_msgSend(a2, sel_addSubview_, v2);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D20);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23B552F50;
  id v7 = objc_msgSend(v3, sel_leadingAnchor);
  id v8 = objc_msgSend(a2, sel_leadingAnchor);
  id v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(void *)(v6 + 32) = v9;
  id v10 = objc_msgSend(v3, sel_trailingAnchor);
  id v11 = objc_msgSend(a2, sel_trailingAnchor);
  id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(void *)(v6 + 40) = v12;
  uint64_t v21 = v6;
  sub_23B552440();
  id v13 = objc_allocWithZone(MEMORY[0x263F825C8]);
  if (v5)
  {
    id v14 = objc_msgSend(v13, sel_initWithRed_green_blue_alpha_, 0.49, 0.75, 0.96, 1.0);
    objc_msgSend(v3, sel_setBackgroundColor_, v14);

    id v15 = objc_msgSend(v3, sel_bottomAnchor);
    id v16 = objc_msgSend(a2, sel_bottomAnchor);
  }
  else
  {
    id v17 = objc_msgSend(v13, sel_initWithRed_green_blue_alpha_, 0.84, 0.51, 0.3, 1.0);
    objc_msgSend(v3, sel_setBackgroundColor_, v17);

    id v15 = objc_msgSend(v3, sel_topAnchor);
    id v16 = objc_msgSend(a2, sel_topAnchor);
  }
  id v18 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  MEMORY[0x23ECC6E20]();
  if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_23B552450();
  }
  sub_23B552460();
  sub_23B552440();
  uint64_t v19 = self;
  sub_23B534F24(0, &qword_268A69D28);
  id v20 = (id)sub_23B552430();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_activateConstraints_, v20);
}

id sub_23B5349D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewDebugOverlay.OverlayView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PreviewDebugOverlay.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PreviewDebugOverlay.init()()
{
}

id PreviewDebugOverlay.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23B534AE8()
{
  unint64_t result = qword_268A69C88;
  if (!qword_268A69C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69C88);
  }
  return result;
}

uint64_t type metadata accessor for PreviewDebugOverlay()
{
  return self;
}

uint64_t method lookup function for PreviewDebugOverlay(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreviewDebugOverlay);
}

uint64_t dispatch thunk of PreviewDebugOverlay.__allocating_init(edge:parent:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewDebugOverlay.AlignmentEdge(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewDebugOverlay.AlignmentEdge(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23B534D68);
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

uint64_t sub_23B534D90(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23B534D9C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewDebugOverlay.AlignmentEdge()
{
  return &type metadata for PreviewDebugOverlay.AlignmentEdge;
}

uint64_t type metadata accessor for PreviewDebugOverlay.OverlayView()
{
  return self;
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23B534DFC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23B534E1C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

BOOL sub_23B534E58(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_23B534E6C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_23B534E7C(void *a1@<X8>)
{
  *a1 = *v1;
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

uint64_t sub_23B534ECC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23B534F04(uint64_t a1)
{
  return sub_23B534124(a1, v1);
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

uint64_t sub_23B534F24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23B534F60()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23B534FA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_23B535054;
  return sub_23B53423C(a1, v4, v5, v6);
}

uint64_t sub_23B535054()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_23B535148()
{
  unint64_t result = qword_268A69D58;
  if (!qword_268A69D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69D58);
  }
  return result;
}

unint64_t sub_23B53519C()
{
  unint64_t result = qword_268A69D60;
  if (!qword_268A69D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69D60);
  }
  return result;
}

unint64_t sub_23B5351F0()
{
  unint64_t result = qword_268A69D78;
  if (!qword_268A69D78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A69D70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69D78);
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

uint64_t initializeBufferWithCopyOfBuffer for EntryPointType(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_23B5352DC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23B5352FC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

void sub_23B535348(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

PreviewsOSSupportUI::EntryPointCategory __swiftcall EntryPointCategory.init(stringLiteral:)(PreviewsOSSupportUI::EntryPointCategory stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t EntryPointCategory.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EntryPointCategory.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t static EntryPointCategory.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_23B552630();
  }
}

uint64_t EntryPointCategory.hashValue.getter()
{
  return sub_23B552670();
}

void *sub_23B5354AC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_23B5354B8()
{
  return sub_23B552670();
}

uint64_t sub_23B535514()
{
  swift_bridgeObjectRetain();
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B53556C()
{
  return sub_23B552670();
}

uint64_t sub_23B5355C4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23B5355F4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_23B552630();
  }
}

void static EntryPointCategory.previewProvider.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000023B5552C0;
}

void static EntryPointCategory.previewPreflight.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000023B5552E0;
}

void static EntryPointCategory.complicationInstance.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000023B555300;
}

void static EntryPointCategory.cFunction.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static EntryPointCategory.registryPreflight.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000023B555320;
}

void static EntryPointCategory.registryExecution.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000023B555340;
}

void static EntryPointCategory.noop.getter(void *a1@<X8>)
{
  *a1 = 0x706F6F6E2E7675;
  a1[1] = 0xE700000000000000;
}

void static EntryPointCategory.legacyMacStaticHosting.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000023B555360;
}

void static EntryPointCategory.legacyMacLive.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000023B555380;
}

void static EntryPointCategory.nsPreviewHostable.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000023B5553A0;
}

void static EntryPointCategory.previewInstance.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000023B5553C0;
}

void static EntryPointCategory.mainPreview.getter(char *a1@<X8>)
{
  a1[15] = -18;
}

void static EntryPointCategory.runningApp.getter(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 14) = -4864;
}

uint64_t AgentUpdate.Context.contentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B5366D0(MEMORY[0x263F60A78], a1);
}

uint64_t AgentUpdate.Context.contentIdentifier.setter(uint64_t a1)
{
  return sub_23B536758(a1, MEMORY[0x263F60A78]);
}

uint64_t (*AgentUpdate.Context.contentIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t AgentUpdate.Context.updateSeed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_23B53594C(v1 + *(int *)(v3 + 20), a1, &qword_268A69DF0);
}

uint64_t type metadata accessor for AgentUpdate.Context(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F80);
}

uint64_t AgentUpdate.Context.updateSeed.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_23B5359F0(a1, v1 + *(int *)(v3 + 20), &qword_268A69DF0);
}

uint64_t (*AgentUpdate.Context.updateSeed.modify())()
{
  return nullsub_1;
}

uint64_t AgentUpdate.Context.setupPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_23B53594C(v1 + *(int *)(v3 + 24), a1, &qword_268A69DF8);
}

uint64_t sub_23B53594C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t AgentUpdate.Context.setupPayload.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_23B5359F0(a1, v1 + *(int *)(v3 + 24), &qword_268A69DF8);
}

uint64_t sub_23B5359F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t (*AgentUpdate.Context.setupPayload.modify())()
{
  return nullsub_1;
}

uint64_t AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v9 = a4 + *(int *)(v8 + 20);
  uint64_t v10 = sub_23B552090();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = a4 + *(int *)(v8 + 24);
  uint64_t v12 = sub_23B5520C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(a4, a1, v13);
  sub_23B5359F0(a2, v9, &qword_268A69DF0);
  return sub_23B5359F0(a3, v11, &qword_268A69DF8);
}

uint64_t AgentUpdate.entryPointCategory.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AgentUpdate.entryPointPayload.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B536810(type metadata accessor for AgentUpdate, MEMORY[0x263F60500], a1);
}

uint64_t type metadata accessor for AgentUpdate(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F70);
}

uint64_t AgentUpdate.entryPointFrameworkPath.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AgentUpdate(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentUpdate.context.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AgentUpdate(0);
  return sub_23B537320(v1 + *(int *)(v3 + 28), a1, type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.mangledFactoryName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AgentUpdate(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentUpdate.mangledFactoryName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AgentUpdate(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AgentUpdate.mangledFactoryName.modify())()
{
  return nullsub_1;
}

uint64_t AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = (int *)type metadata accessor for AgentUpdate(0);
  id v14 = (void *)((char *)a6 + v13[8]);
  *id v14 = 0;
  v14[1] = 0;
  *a6 = v11;
  a6[1] = v12;
  id v15 = (char *)a6 + v13[5];
  uint64_t v16 = sub_23B552140();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a2, v16);
  id v17 = (void *)((char *)a6 + v13[6]);
  *id v17 = a3;
  v17[1] = a4;
  return sub_23B537388(a5, (uint64_t)a6 + v13[7], type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.init(entryPointType:entryPointPayload:context:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v11 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v12 = (void *)((char *)a4 + v11[8]);
  *a4 = 0x79726F74636166;
  a4[1] = 0xE700000000000000;
  uint64_t v13 = (void *)((char *)a4 + v11[6]);
  *uint64_t v13 = v8;
  v13[1] = v7;
  *uint64_t v12 = v10;
  v12[1] = v9;
  id v14 = (char *)a4 + v11[5];
  uint64_t v15 = sub_23B552140();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a2, v15);
  return sub_23B537388(a3, (uint64_t)a4 + v11[7], type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.init(contentIdentifier:entryPointType:entryPointPayload:setupPayload:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v52 = a4;
  uint64_t v61 = a1;
  uint64_t v62 = a3;
  v63 = a5;
  uint64_t v53 = type metadata accessor for AgentUpdate.Context(0) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = v13;
  uint64_t v14 = sub_23B5520B0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v49 = v14;
  uint64_t v50 = v15;
  MEMORY[0x270FA5388]();
  id v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v17;
  uint64_t v18 = sub_23B552140();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v57 = v18;
  MEMORY[0x270FA5388]();
  uint64_t v59 = *a2;
  v60 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = a2[1];
  uint64_t v20 = a2[2];
  uint64_t v54 = a2[3];
  uint64_t v55 = v20;
  (*(void (**)(void))(v21 + 16))();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  uint64_t v22 = sub_23B552090();
  id v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v13, 1, 1, v22);
  uint64_t v24 = sub_23B5520C0();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v47 = v11;
  v26(v11, a4, v24);
  unint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  v27(v11, 0, 1, v24);
  uint64_t v28 = v53;
  uint64_t v29 = (uint64_t)&v9[*(int *)(v53 + 28)];
  v23((char *)v29, 1, 1, v22);
  uint64_t v30 = (uint64_t)&v9[*(int *)(v28 + 32)];
  uint64_t v31 = (uint64_t)v9;
  v27((char *)v30, 1, 1, v24);
  uint64_t v32 = v50;
  v33 = v9;
  uint64_t v34 = v49;
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v33, v51, v49);
  sub_23B5359F0((uint64_t)v48, v29, &qword_268A69DF0);
  sub_23B5359F0((uint64_t)v47, v30, &qword_268A69DF8);
  v35 = (int *)type metadata accessor for AgentUpdate(0);
  v36 = v63;
  sub_23B537388(v31, (uint64_t)v63 + v35[7], type metadata accessor for AgentUpdate.Context);
  v37 = (void *)((char *)v36 + v35[8]);
  void *v36 = 0x79726F74636166;
  v36[1] = 0xE700000000000000;
  v38 = (void *)((char *)v36 + v35[6]);
  uint64_t v39 = v54;
  void *v38 = v55;
  v38[1] = v39;
  v40 = v60;
  uint64_t v41 = v58;
  void *v37 = v59;
  v37[1] = v41;
  v42 = (char *)v36 + v35[5];
  uint64_t v44 = v56;
  uint64_t v43 = v57;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v42, v40, v57);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v52, v24);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v62, v43);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v61, v34);
}

uint64_t AgentUpdate.contentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AgentUpdate(0) + 28);
  uint64_t v4 = sub_23B5520B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SceneAgentConnectionContext.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SceneAgentConnectionContext.sceneIdentifier.modify())()
{
  return nullsub_1;
}

BOOL PreviewSceneRole.allowsAnimations.getter()
{
  return (*v0 & 1) == 0;
}

PreviewsOSSupportUI::PreviewSceneRole_optional __swiftcall PreviewSceneRole.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_23B552600();
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

uint64_t PreviewSceneRole.rawValue.getter()
{
  if (*v0) {
    return 0x636974617473;
  }
  else {
    return 0x646574736F68;
  }
}

uint64_t sub_23B53659C(char *a1, char *a2)
{
  return sub_23B546B00(*a1, *a2);
}

uint64_t sub_23B5365A8()
{
  return sub_23B546B78();
}

uint64_t sub_23B5365B0()
{
  return sub_23B5473DC();
}

uint64_t sub_23B5365B8()
{
  return sub_23B547898();
}

PreviewsOSSupportUI::PreviewSceneRole_optional sub_23B5365C0(Swift::String *a1)
{
  return PreviewSceneRole.init(rawValue:)(*a1);
}

uint64_t sub_23B5365CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewSceneRole.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23B5365F4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B544A60();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B536650()
{
  return sub_23B5521F0();
}

uint64_t SceneUpdateContext.seed.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B5366D0(MEMORY[0x263F60FF0], a1);
}

uint64_t sub_23B5366D0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, v2, v4);
}

uint64_t SceneUpdateContext.seed.setter(uint64_t a1)
{
  return sub_23B536758(a1, MEMORY[0x263F60FF0]);
}

uint64_t sub_23B536758(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = a2(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v2, a1, v4);
}

uint64_t (*SceneUpdateContext.seed.modify())()
{
  return nullsub_1;
}

uint64_t SceneUpdateContext.timing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B536810(type metadata accessor for SceneUpdateContext, MEMORY[0x263F61020], a1);
}

uint64_t sub_23B536810@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *(int *)(a1(0) + 20);
  uint64_t v7 = a2(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v8(a3, v6, v7);
}

uint64_t type metadata accessor for SceneUpdateContext(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69FA0);
}

uint64_t SceneUpdateContext.timing.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SceneUpdateContext(0) + 20);
  uint64_t v4 = sub_23B551FF0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*SceneUpdateContext.timing.modify())()
{
  return nullsub_1;
}

uint64_t SceneUpdateContext.role.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for SceneUpdateContext(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t SceneUpdateContext.role.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for SceneUpdateContext(0);
  *(unsigned char *)(v1 + *(int *)(result + 24)) = v2;
  return result;
}

uint64_t (*SceneUpdateContext.role.modify())()
{
  return nullsub_1;
}

uint64_t SceneUpdateContext.init(seed:timing:role:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a3;
  uint64_t v8 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t updated = type metadata accessor for SceneUpdateContext(0);
  uint64_t v10 = a4 + *(int *)(updated + 20);
  uint64_t v11 = sub_23B551FF0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  *(unsigned char *)(a4 + *(int *)(updated + 24)) = v7;
  return result;
}

uint64_t sub_23B536AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5381E4(&qword_268A6A0A8, MEMORY[0x263F61020]);
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B536B88()
{
  return sub_23B5521F0();
}

uint64_t sub_23B536C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5381E4(&qword_268A6A0A0, MEMORY[0x263F60FF0]);
  uint64_t v5 = MEMORY[0x263F60690];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B536CAC()
{
  return sub_23B5521F0();
}

uint64_t sub_23B536D58@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

uint64_t sub_23B536D64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B5448FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23B536D8C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B5447AC();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B536DE8()
{
  return sub_23B5521F0();
}

uint64_t sub_23B536E50(char a1)
{
  if (a1) {
    return 0x657461647075;
  }
  else {
    return 0x696D697263736964;
  }
}

uint64_t sub_23B536E8C(char *a1, char *a2)
{
  return sub_23B5464B8(*a1, *a2);
}

uint64_t sub_23B536E98()
{
  return sub_23B546BE8();
}

uint64_t sub_23B536EA0()
{
  return sub_23B5472C4();
}

uint64_t sub_23B536EA8()
{
  return sub_23B547A58();
}

uint64_t sub_23B536EB0@<X0>(char *a1@<X8>)
{
  return sub_23B538A7C(a1);
}

uint64_t sub_23B536EBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B536E50(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B536EE8()
{
  return sub_23B536E50(*v0);
}

uint64_t ShellToPreviewNonUIAgent.TwoWayMessage.propertyListValue.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E00);
  MEMORY[0x270FA5388]();
  char v2 = &v11[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for AgentUpdate(0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(0);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = v0;
  unint64_t v9 = sub_23B537278();
  sub_23B5372CC();
  sub_23B552130();
  sub_23B537320(v0, (uint64_t)v8, type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage);
  sub_23B537388((uint64_t)v8, (uint64_t)v6, type metadata accessor for AgentUpdate);
  sub_23B537320((uint64_t)v6, (uint64_t)v2, type metadata accessor for AgentUpdate);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  uint64_t v14 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
  unint64_t v15 = v9;
  v13[0] = 1;
  sub_23B5381E4(&qword_268A69E18, (void (*)(uint64_t))type metadata accessor for AgentUpdate);
  sub_23B5520D0();
  sub_23B544AB4((uint64_t)v2, &qword_268A69E00);
  sub_23B538184((uint64_t)v6, type metadata accessor for AgentUpdate);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F30);
}

uint64_t sub_23B5371B4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_23B537320(a3, (uint64_t)v7, type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage);
  uint64_t result = sub_23B538184((uint64_t)v7, type metadata accessor for AgentUpdate);
  *a2 = 0;
  return result;
}

uint64_t sub_23B537270(unsigned char *a1, unsigned char *a2)
{
  return sub_23B5371B4(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_23B537278()
{
  unint64_t result = qword_268A69E08;
  if (!qword_268A69E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E08);
  }
  return result;
}

unint64_t sub_23B5372CC()
{
  unint64_t result = qword_268A69E10;
  if (!qword_268A69E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E10);
  }
  return result;
}

uint64_t sub_23B537320(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B537388(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
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

uint64_t ShellToPreviewNonUIAgent.TwoWayMessage.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v7 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
  unint64_t v3 = sub_23B537278();
  unint64_t v8 = v3;
  v6[0] = 0;
  sub_23B5372CC();
  sub_23B5520E0();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    uint64_t v7 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
    unint64_t v8 = v3;
    v6[0] = 1;
    type metadata accessor for AgentUpdate(0);
    sub_23B5381E4(&qword_268A69E18, (void (*)(uint64_t))type metadata accessor for AgentUpdate);
    sub_23B5520E0();
  }
  uint64_t v4 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

unint64_t sub_23B537574(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23B537618(uint64_t a1)
{
  return ShellToPreviewNonUIAgent.TwoWayMessage.init(propertyListValue:)(a1);
}

uint64_t sub_23B537630(unsigned __int8 *a1, char *a2)
{
  return sub_23B546974(*a1, *a2);
}

uint64_t sub_23B53763C()
{
  return sub_23B546C70();
}

uint64_t sub_23B537644()
{
  return sub_23B54756C();
}

uint64_t sub_23B53764C()
{
  return sub_23B547640();
}

uint64_t sub_23B537654@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B544920();
  *a1 = result;
  return result;
}

unint64_t sub_23B537684@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_23B537574(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_23B5376B0()
{
  return sub_23B537574(*v0);
}

void sub_23B5376B8(void *a1@<X8>)
{
  *a1 = &unk_26EE98700;
}

uint64_t AgentUpdate.propertyListValue.getter()
{
  return sub_23B552120();
}

uint64_t sub_23B537704(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0F0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v48 = (uint64_t)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E38);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v46 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0F8) - 8;
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v47 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A100);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v42 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v50 = (uint64_t)&v37 - v12;
  uint64_t v13 = *a1;
  uint64_t v40 = a1[1];
  uint64_t v41 = v13;
  uint64_t v14 = (char *)&v37 + *(int *)(v9 + 56) - v12;
  *((unsigned char *)&v37 - v12) = 1;
  unint64_t v15 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v16 = (char *)a1 + v15[5];
  uint64_t v17 = sub_23B552140();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v19(v14, v16, v17);
  uint64_t v20 = v15[7];
  uint64_t v21 = (uint64_t *)((char *)a1 + v15[6]);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v39 = v23;
  uint64_t v38 = v22;
  uint64_t v24 = v45;
  uint64_t v25 = *(int *)(v45 + 56);
  uint64_t v49 = v7;
  v37 = &v7[v25];
  *uint64_t v7 = 3;
  sub_23B537320((uint64_t)a1 + v20, (uint64_t)&v7[v25], type metadata accessor for AgentUpdate.Context);
  uint64_t v26 = (uint64_t *)((char *)a1 + v15[8]);
  uint64_t v27 = *v26;
  uint64_t v43 = v26[1];
  uint64_t v44 = v27;
  char v61 = 0;
  uint64_t v59 = v41;
  uint64_t v60 = v40;
  uint64_t v28 = *(int *)(v9 + 56);
  uint64_t v29 = v42;
  uint64_t v30 = &v42[v28];
  unsigned char *v42 = 1;
  v19(&v29[v28], v14, v17);
  uint64_t v31 = (uint64_t)v46;
  (*(void (**)(char *, unsigned char *, uint64_t))(v18 + 32))(v46, v30, v17);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v31, 0, 1, v17);
  char v58 = 1;
  char v57 = 2;
  uint64_t v55 = v39;
  uint64_t v56 = v38;
  uint64_t v32 = (uint64_t)&v47[*(int *)(v24 + 56)];
  unsigned char *v47 = 3;
  sub_23B537320((uint64_t)v37, v32, type metadata accessor for AgentUpdate.Context);
  uint64_t v33 = v48;
  sub_23B537388(v32, v48, type metadata accessor for AgentUpdate.Context);
  uint64_t v34 = type metadata accessor for AgentUpdate.Context(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 0, 1, v34);
  char v54 = 3;
  char v53 = 4;
  uint64_t v51 = v44;
  uint64_t v52 = v43;
  sub_23B5380DC();
  sub_23B538130();
  sub_23B5381E4(&qword_268A69E30, (void (*)(uint64_t))type metadata accessor for AgentUpdate.Context);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_23B552190();
  sub_23B544AB4(v33, &qword_268A6A0F0);
  swift_bridgeObjectRelease();
  sub_23B544AB4(v31, &qword_268A69E38);
  swift_bridgeObjectRelease();
  sub_23B544AB4((uint64_t)v49, &qword_268A6A0F8);
  sub_23B544AB4(v50, &qword_268A6A100);
  return v35;
}

uint64_t sub_23B537C30()
{
  return sub_23B537704(*(uint64_t **)(v0 + 16));
}

uint64_t AgentUpdate.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AgentUpdate.Context(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23B552140();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AgentUpdate(0);
  uint64_t v12 = (void *)((char *)a2 + *(int *)(v11 + 32));
  *uint64_t v12 = 0;
  v12[1] = 0;
  uint64_t v27 = v12;
  uint64_t v29 = &type metadata for AgentUpdate.Key;
  unint64_t v26 = sub_23B5380DC();
  unint64_t v30 = v26;
  v28[0] = 0;
  sub_23B538130();
  uint64_t v13 = v32;
  sub_23B5520E0();
  if (v13)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = (void *)v4;
    uint64_t v25 = v6;
    uint64_t v32 = v11;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    uint64_t v14 = *((void *)&v31 + 1);
    *a2 = v31;
    a2[1] = v14;
    unint64_t v15 = v26;
    uint64_t v29 = &type metadata for AgentUpdate.Key;
    unint64_t v30 = v26;
    v28[0] = 1;
    sub_23B5520E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    uint64_t v16 = v8;
    (*(void (**)(void, char *, uint64_t))(v8 + 32))(*(int *)(v32 + 20), v10, v7);
    uint64_t v29 = &type metadata for AgentUpdate.Key;
    unint64_t v30 = v15;
    v28[0] = 2;
    sub_23B552110();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    uint64_t v17 = v32;
    *(_OWORD *)((char *)a2 + *(int *)(v32 + 24)) = v31;
    uint64_t v29 = &type metadata for AgentUpdate.Key;
    unint64_t v30 = v15;
    v28[0] = 3;
    sub_23B5381E4(&qword_268A69E30, (void (*)(uint64_t))type metadata accessor for AgentUpdate.Context);
    uint64_t v18 = (uint64_t)v25;
    sub_23B5520E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    uint64_t v20 = *(int *)(v17 + 28);
    uint64_t v24 = a2;
    sub_23B537388(v18, (uint64_t)a2 + v20, type metadata accessor for AgentUpdate.Context);
    uint64_t v29 = &type metadata for AgentUpdate.Key;
    unint64_t v30 = v26;
    v28[0] = 4;
    sub_23B552110();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    long long v21 = v31;
    uint64_t v22 = v27;
    uint64_t result = swift_bridgeObjectRelease();
    _OWORD *v22 = v21;
  }
  return result;
}

unint64_t sub_23B5380DC()
{
  unint64_t result = qword_268A69E20;
  if (!qword_268A69E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E20);
  }
  return result;
}

unint64_t sub_23B538130()
{
  unint64_t result = qword_268A69E28;
  if (!qword_268A69E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E28);
  }
  return result;
}

uint64_t sub_23B538184(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B5381E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23B53822C()
{
  return sub_23B552120();
}

uint64_t sub_23B538268@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return AgentUpdate.init(propertyListValue:)(a1, a2);
}

uint64_t sub_23B538280()
{
  return 1;
}

uint64_t sub_23B53828C()
{
  return sub_23B5523F0();
}

uint64_t sub_23B5382AC@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

void sub_23B5382B8(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000023B554E90;
}

uint64_t sub_23B5382D8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B544800();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B538334()
{
  return sub_23B5521F0();
}

uint64_t sub_23B53839C(char a1)
{
  return *(void *)&aDiscrimiidenti[8 * a1];
}

uint64_t sub_23B5383BC(char *a1, char *a2)
{
  return sub_23B5462F4(*a1, *a2);
}

uint64_t sub_23B5383C8()
{
  return sub_23B546D64();
}

uint64_t sub_23B5383D0()
{
  return sub_23B5471A0();
}

uint64_t sub_23B5383D8()
{
  return sub_23B547ADC();
}

uint64_t sub_23B5383E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t sub_23B538418@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B53839C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B538444()
{
  return sub_23B53839C(*v0);
}

uint64_t ShellToPreviewNonUIAgent.XPCEndpointContext.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E38);
  MEMORY[0x270FA5388](v1 - 8);
  long long v21 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E40);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23B552140();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v22 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23B5520B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext(0);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v0;
  unint64_t v16 = sub_23B5388F0();
  sub_23B538944();
  sub_23B552130();
  sub_23B537320(v0, (uint64_t)v15, type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext);
  uint64_t v17 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v22, v17, v6);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  uint64_t v25 = &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
  unint64_t v26 = v16;
  v24[0] = 1;
  sub_23B5381E4(&qword_268A69E60, MEMORY[0x263F60A78]);
  sub_23B5520D0();
  sub_23B544AB4((uint64_t)v5, &qword_268A69E40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  uint64_t v18 = (uint64_t)v21;
  uint64_t v19 = v22;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v22, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  uint64_t v25 = &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
  unint64_t v26 = v16;
  v24[0] = 2;
  sub_23B5520D0();
  sub_23B544AB4(v18, &qword_268A69E38);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F40);
}

uint64_t sub_23B5388AC(unsigned char *a1, unsigned char *a2)
{
  return sub_23B53A81C(a1, a2, *(void *)(v2 + 16), type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext, type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext);
}

unint64_t sub_23B5388F0()
{
  unint64_t result = qword_268A69E48;
  if (!qword_268A69E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E48);
  }
  return result;
}

unint64_t sub_23B538944()
{
  unint64_t result = qword_268A69E50;
  if (!qword_268A69E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E50);
  }
  return result;
}

uint64_t ShellToPreviewNonUIAgent.XPCEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_23B53AA78(a1, (uint64_t)&type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key, (uint64_t (*)(void))sub_23B5388F0, (void (*)(void))sub_23B538944);
}

uint64_t sub_23B5389E8(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0x556D726F66726570;
  }
}

uint64_t sub_23B538A34(uint64_t a1)
{
  return ShellToPreviewNonUIAgent.XPCEndpointContext.init(propertyListValue:)(a1);
}

uint64_t sub_23B538A4C(char *a1, char *a2)
{
  return sub_23B546404(*a1, *a2);
}

uint64_t sub_23B538A58()
{
  return sub_23B546DD0();
}

uint64_t sub_23B538A60()
{
  return sub_23B547248();
}

uint64_t sub_23B538A68()
{
  return sub_23B547B44();
}

uint64_t sub_23B538A70@<X0>(char *a1@<X8>)
{
  return sub_23B538A7C(a1);
}

uint64_t sub_23B538A7C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_23B552600();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_23B538AD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B5389E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B538B04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B544854();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B538B60()
{
  return sub_23B5521F0();
}

uint64_t sub_23B538BC8(char a1)
{
  return *(void *)&aDiscrimiupdate[8 * a1];
}

uint64_t sub_23B538BE8(char *a1, char *a2)
{
  return sub_23B54637C(*a1, *a2);
}

uint64_t sub_23B538BF4()
{
  return sub_23B546E64();
}

uint64_t sub_23B538BFC()
{
  return sub_23B5471F4();
}

uint64_t sub_23B538C04()
{
  return sub_23B547BD4();
}

uint64_t sub_23B538C0C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t sub_23B538C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B538BC8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B538C70()
{
  return sub_23B538BC8(*v0);
}

uint64_t ShellToPreviewSceneAgent.TwoWayMessage.propertyListValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E68);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E00);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateContext(0);
  uint64_t v25 = *(void *)(updated - 8);
  uint64_t v26 = updated;
  MEMORY[0x270FA5388](updated);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AgentUpdate(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v2;
  unint64_t v20 = sub_23B539280();
  sub_23B5392D4();
  uint64_t v27 = a1;
  sub_23B552130();
  sub_23B537320(v2, (uint64_t)v19, type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48))(v19, 1, v21);
  if (result != 1)
  {
    uint64_t v23 = (uint64_t)&v19[*(int *)(v21 + 48)];
    sub_23B537388((uint64_t)v19, (uint64_t)v16, type metadata accessor for AgentUpdate);
    sub_23B537388(v23, (uint64_t)v12, type metadata accessor for SceneUpdateContext);
    sub_23B537320((uint64_t)v16, (uint64_t)v9, type metadata accessor for AgentUpdate);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
    unint64_t v30 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
    unint64_t v31 = v20;
    v29[0] = 1;
    sub_23B5381E4(&qword_268A69E18, (void (*)(uint64_t))type metadata accessor for AgentUpdate);
    sub_23B5520D0();
    sub_23B544AB4((uint64_t)v9, &qword_268A69E00);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    sub_23B537320((uint64_t)v12, (uint64_t)v6, type metadata accessor for SceneUpdateContext);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v26);
    unint64_t v30 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
    unint64_t v31 = v20;
    v29[0] = 2;
    sub_23B5381E4(&qword_268A69E88, (void (*)(uint64_t))type metadata accessor for SceneUpdateContext);
    sub_23B5520D0();
    sub_23B544AB4((uint64_t)v6, &qword_268A69E68);
    sub_23B538184((uint64_t)v12, type metadata accessor for SceneUpdateContext);
    sub_23B538184((uint64_t)v16, type metadata accessor for AgentUpdate);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

uint64_t type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F50);
}

uint64_t sub_23B539144(unsigned char *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_23B537320(a3, (uint64_t)v8, type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  int v11 = result;
  if (result != 1)
  {
    sub_23B538184((uint64_t)&v8[*(int *)(v9 + 48)], type metadata accessor for SceneUpdateContext);
    uint64_t result = sub_23B538184((uint64_t)v8, type metadata accessor for AgentUpdate);
  }
  *a2 = v11 == 1;
  return result;
}

uint64_t sub_23B539278(unsigned char *a1, BOOL *a2)
{
  return sub_23B539144(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_23B539280()
{
  unint64_t result = qword_268A69E70;
  if (!qword_268A69E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E70);
  }
  return result;
}

unint64_t sub_23B5392D4()
{
  unint64_t result = qword_268A69E78;
  if (!qword_268A69E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E78);
  }
  return result;
}

uint64_t ShellToPreviewSceneAgent.TwoWayMessage.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
  unint64_t v8 = sub_23B539280();
  unint64_t v17 = v8;
  v15[0] = 0;
  sub_23B5392D4();
  sub_23B5520E0();
  if (v2)
  {
    uint64_t v9 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    if (v18)
    {
      uint64_t v11 = sub_23B552140();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 1, 1, v12);
    }
    else
    {
      unint64_t v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
      unint64_t v17 = v8;
      v15[0] = 1;
      type metadata accessor for AgentUpdate(0);
      sub_23B5381E4(&qword_268A69E18, (void (*)(uint64_t))type metadata accessor for AgentUpdate);
      sub_23B5520E0();
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      unint64_t v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
      unint64_t v17 = v8;
      v15[0] = 2;
      type metadata accessor for SceneUpdateContext(0);
      sub_23B5381E4(&qword_268A69E88, (void (*)(uint64_t))type metadata accessor for SceneUpdateContext);
      sub_23B5520E0();
      uint64_t v14 = sub_23B552140();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
      return sub_23B537388((uint64_t)v7, a2, type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage);
    }
  }
}

uint64_t sub_23B5396BC(char a1)
{
  return *(void *)&aSeed_1[8 * a1];
}

uint64_t sub_23B5396E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellToPreviewSceneAgent.TwoWayMessage.init(propertyListValue:)(a1, a2);
}

uint64_t sub_23B5396F8(char *a1, char *a2)
{
  return sub_23B546694(*a1, *a2);
}

uint64_t sub_23B539704()
{
  return sub_23B546ED0();
}

uint64_t sub_23B53970C()
{
  return sub_23B547388();
}

uint64_t sub_23B539714()
{
  return sub_23B547904();
}

uint64_t sub_23B53971C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t sub_23B539754@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B5396BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B539780()
{
  return sub_23B5396BC(*v0);
}

void sub_23B539788(void *a1@<X8>)
{
  *a1 = &unk_26EE988E8;
}

uint64_t SceneUpdateContext.propertyListValue.getter()
{
  return sub_23B552120();
}

uint64_t sub_23B5397D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v46 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v49 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0E0) - 8;
  uint64_t v42 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v39 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0E8);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v43 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v47 = (uint64_t)&v39 - v15;
  uint64_t v40 = (char *)&v39 + *(int *)(v12 + 56) - v15;
  unint64_t v16 = v40;
  *((unsigned char *)&v39 - v15) = 0;
  uint64_t v48 = sub_23B551FE0();
  uint64_t v17 = *(void *)(v48 - 8);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  char v18 = v16;
  uint64_t v19 = a1;
  uint64_t v41 = a1;
  v39(v18, a1, v48);
  uint64_t v20 = *(int *)(v6 + 56);
  uint64_t v45 = v10;
  uint64_t v21 = &v10[v20];
  *uint64_t v10 = 1;
  uint64_t updated = type metadata accessor for SceneUpdateContext(0);
  uint64_t v23 = v19 + *(int *)(updated + 20);
  uint64_t v24 = sub_23B551FF0();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v25 + 16);
  v26(v21, v23, v24);
  uint64_t v27 = (void (*)(unsigned char *, unsigned char *, uint64_t))v26;
  uint64_t v28 = v40;
  LODWORD(v41) = *(unsigned __int8 *)(v41 + *(int *)(updated + 24));
  uint64_t v29 = &v43[*(int *)(v12 + 56)];
  *uint64_t v43 = 0;
  uint64_t v30 = v48;
  v39(v29, (uint64_t)v28, v48);
  unint64_t v31 = v49;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v49, v29, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v31, 0, 1, v30);
  char v53 = 0;
  uint64_t v32 = *(int *)(v42 + 56);
  uint64_t v33 = v44;
  uint64_t v34 = &v44[v32];
  *uint64_t v44 = 1;
  v27(&v33[v32], v21, v24);
  uint64_t v35 = (uint64_t)v46;
  (*(void (**)(char *, unsigned char *, uint64_t))(v25 + 32))(v46, v34, v24);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v35, 0, 1, v24);
  char v52 = 1;
  char v51 = 2;
  char v50 = v41;
  sub_23B53A0D4();
  sub_23B5381E4(&qword_268A69E98, MEMORY[0x263F60FF0]);
  sub_23B5381E4(&qword_268A69EA0, MEMORY[0x263F61020]);
  sub_23B53A128();
  uint64_t v36 = (uint64_t)v49;
  uint64_t v37 = sub_23B5521A0();
  sub_23B544AB4(v35, &qword_268A6A0D0);
  sub_23B544AB4(v36, &qword_268A6A0D8);
  sub_23B544AB4((uint64_t)v45, &qword_268A6A0E0);
  sub_23B544AB4(v47, &qword_268A6A0E8);
  return v37;
}

uint64_t sub_23B539CB0()
{
  return sub_23B5397D4(*(void *)(v0 + 16));
}

uint64_t SceneUpdateContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_23B551FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23B551FE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = &type metadata for SceneUpdateContext.Key;
  unint64_t v12 = sub_23B53A0D4();
  unint64_t v24 = v12;
  v22[0] = 0;
  sub_23B5381E4(&qword_268A69E98, MEMORY[0x263F60FF0]);
  sub_23B5520E0();
  if (v2)
  {
    uint64_t v13 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    uint64_t v20 = v5;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    uint64_t v19 = v9;
    uint64_t v15 = v21;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21, v11, v8);
    uint64_t v23 = &type metadata for SceneUpdateContext.Key;
    unint64_t v24 = v12;
    v22[0] = 1;
    sub_23B5381E4(&qword_268A69EA0, MEMORY[0x263F61020]);
    sub_23B5520E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    uint64_t updated = type metadata accessor for SceneUpdateContext(0);
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v15 + *(int *)(updated + 20), v7, v4);
    uint64_t v23 = &type metadata for SceneUpdateContext.Key;
    unint64_t v24 = v12;
    v22[0] = 2;
    sub_23B53A128();
    sub_23B5520E0();
    uint64_t v16 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    *(unsigned char *)(v15 + *(int *)(updated + 24)) = v25;
  }
  return result;
}

unint64_t sub_23B53A0D4()
{
  unint64_t result = qword_268A69E90;
  if (!qword_268A69E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69E90);
  }
  return result;
}

unint64_t sub_23B53A128()
{
  unint64_t result = qword_268A69EA8;
  if (!qword_268A69EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EA8);
  }
  return result;
}

uint64_t sub_23B53A17C()
{
  return sub_23B552120();
}

uint64_t sub_23B53A1B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SceneUpdateContext.init(propertyListValue:)(a1, a2);
}

uint64_t sub_23B53A1D0()
{
  return sub_23B552670();
}

uint64_t sub_23B53A228()
{
  return sub_23B552670();
}

uint64_t sub_23B53A27C@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

uint64_t sub_23B53A288(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B5448A8();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B53A2E4()
{
  return sub_23B5521F0();
}

uint64_t sub_23B53A34C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t ShellToPreviewSceneAgent.XPCEndpointContext.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E38);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v21 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E40);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23B552140();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v22 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23B5520B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v0;
  unint64_t v16 = sub_23B53A980();
  sub_23B53A9D4();
  sub_23B552130();
  sub_23B537320(v0, (uint64_t)v15, type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext);
  uint64_t v17 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v22, v17, v6);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  char v25 = &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
  unint64_t v26 = v16;
  v24[0] = 1;
  sub_23B5381E4(&qword_268A69E60, MEMORY[0x263F60A78]);
  sub_23B5520D0();
  sub_23B544AB4((uint64_t)v5, &qword_268A69E40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  uint64_t v18 = (uint64_t)v21;
  uint64_t v19 = v22;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v22, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  char v25 = &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
  unint64_t v26 = v16;
  v24[0] = 2;
  sub_23B5520D0();
  sub_23B544AB4(v18, &qword_268A69E38);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A69F60);
}

uint64_t sub_23B53A7E4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23B53A81C(unsigned char *a1, unsigned char *a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v9 = a4(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - v10;
  *a1 = 0;
  sub_23B537320(a3, (uint64_t)&v16 - v10, a5);
  unint64_t v12 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48)];
  uint64_t v13 = sub_23B552140();
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = sub_23B5520B0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v11, v14);
  *a2 = 0;
  return result;
}

uint64_t sub_23B53A93C(unsigned char *a1, unsigned char *a2)
{
  return sub_23B53A81C(a1, a2, *(void *)(v2 + 16), type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext, type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext);
}

unint64_t sub_23B53A980()
{
  unint64_t result = qword_268A69EB0;
  if (!qword_268A69EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EB0);
  }
  return result;
}

unint64_t sub_23B53A9D4()
{
  unint64_t result = qword_268A69EB8;
  if (!qword_268A69EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EB8);
  }
  return result;
}

uint64_t ShellToPreviewSceneAgent.XPCEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_23B53AA78(a1, (uint64_t)&type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key, (uint64_t (*)(void))sub_23B53A980, (void (*)(void))sub_23B53A9D4);
}

uint64_t sub_23B53AA78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(void))
{
  uint64_t v13 = a2;
  uint64_t v8 = a3();
  uint64_t v14 = v8;
  v12[0] = 0;
  a4();
  sub_23B5520E0();
  if (v4)
  {
    uint64_t v9 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v13 = a2;
    uint64_t v14 = v8;
    v12[0] = 1;
    sub_23B5520B0();
    sub_23B5381E4(&qword_268A69E60, MEMORY[0x263F60A78]);
    sub_23B5520E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v13 = a2;
    uint64_t v14 = v8;
    v12[0] = 2;
    uint64_t v11 = sub_23B552140();
    sub_23B5520E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23B53ACAC(uint64_t a1)
{
  return ShellToPreviewSceneAgent.XPCEndpointContext.init(propertyListValue:)(a1);
}

uint64_t sub_23B53ACD0@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

uint64_t sub_23B53ACDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B54496C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23B53AD08(void *a1@<X8>)
{
  *a1 = &unk_26EE989E8;
}

uint64_t EntryPointCategory.propertyListValue.getter()
{
  return sub_23B53C0C0((void (*)(void))sub_23B53AD50);
}

unint64_t sub_23B53AD50()
{
  unint64_t result = qword_268A69EC0;
  if (!qword_268A69EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EC0);
  }
  return result;
}

uint64_t EntryPointCategory.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_23B53C1B8(a1, (uint64_t)&type metadata for EntryPointCategory.Key, (uint64_t (*)(void))sub_23B53AD50, a2);
}

uint64_t sub_23B53ADD8(uint64_t a1, uint64_t a2)
{
  return sub_23B53C540(a1, a2, (void (*)(void))sub_23B53AD50);
}

uint64_t sub_23B53AE0C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_23B53C5E4(a1, (uint64_t)&type metadata for EntryPointCategory.Key, (uint64_t (*)(void))sub_23B53AD50, a2);
}

uint64_t sub_23B53AE4C@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

uint64_t sub_23B53AE58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B5449D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23B53AE80(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23B544980();
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B53AEDC()
{
  return sub_23B5521F0();
}

uint64_t sub_23B53AF44(char a1)
{
  if (!a1) {
    return 0x696D697263736964;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x726F77656D617266;
}

uint64_t sub_23B53AFB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23B54671C(*a1, *a2);
}

uint64_t sub_23B53AFC0()
{
  return sub_23B546F3C();
}

uint64_t sub_23B53AFC8()
{
  return sub_23B54742C();
}

uint64_t sub_23B53AFD0()
{
  return sub_23B5477E0();
}

uint64_t sub_23B53AFD8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t sub_23B53B010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B53AF44(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B53B03C()
{
  return sub_23B53AF44(*v0);
}

uint64_t EntryPointType.propertyListValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = sub_23B53B164();
  sub_23B53B1B8();
  sub_23B552130();
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v8 = &type metadata for EntryPointType.Key;
  unint64_t v9 = v5;
  v7[0] = 1;
  swift_bridgeObjectRetain();
  sub_23B5520D0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  uint64_t v10 = v4;
  uint64_t v11 = v3;
  uint64_t v8 = &type metadata for EntryPointType.Key;
  unint64_t v9 = v5;
  v7[0] = 2;
  sub_23B5520D0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

unsigned char *sub_23B53B158(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

unint64_t sub_23B53B164()
{
  unint64_t result = qword_268A69EC8;
  if (!qword_268A69EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EC8);
  }
  return result;
}

unint64_t sub_23B53B1B8()
{
  unint64_t result = qword_268A69ED0;
  if (!qword_268A69ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69ED0);
  }
  return result;
}

uint64_t EntryPointType.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v14 = &type metadata for EntryPointType.Key;
  unint64_t v5 = sub_23B53B164();
  unint64_t v15 = v5;
  v13[0] = 0;
  sub_23B53B1B8();
  sub_23B5520E0();
  if (v2)
  {
    uint64_t v6 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v14 = &type metadata for EntryPointType.Key;
    unint64_t v15 = v5;
    v13[0] = 1;
    sub_23B5520E0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v14 = &type metadata for EntryPointType.Key;
    unint64_t v15 = v5;
    v13[0] = 2;
    sub_23B5520E0();
    uint64_t v7 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    *a2 = v11;
    a2[1] = v12;
    a2[2] = v9;
    a2[3] = v10;
  }
  return result;
}

uint64_t sub_23B53B3E4(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x6553657461647075;
  }
  return 0x7961507075746573;
}

uint64_t sub_23B53B450@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return EntryPointType.init(propertyListValue:)(a1, a2);
}

uint64_t sub_23B53B468(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23B546850(*a1, *a2);
}

uint64_t sub_23B53B474()
{
  return sub_23B546FF8();
}

uint64_t sub_23B53B47C()
{
  return sub_23B5474D0();
}

uint64_t sub_23B53B484()
{
  return sub_23B547730();
}

uint64_t sub_23B53B48C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B5449E8();
  *a1 = result;
  return result;
}

uint64_t sub_23B53B4C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B53B3E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B53B4F0()
{
  return sub_23B53B3E4(*v0);
}

void sub_23B53B4F8(void *a1@<X8>)
{
  *a1 = &unk_26EE98B18;
}

uint64_t AgentUpdate.Context.propertyListValue.getter()
{
  return sub_23B552120();
}

uint64_t sub_23B53B544(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v44 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0B8) - 8;
  uint64_t v4 = MEMORY[0x270FA5388](v42);
  uint64_t v45 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v48 = (char *)&v40 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0C0);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0C8);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v47 = (uint64_t)&v40 - v18;
  uint64_t v40 = (char *)&v40 + *(int *)(v14 + 56) - v18;
  uint64_t v19 = v40;
  *((unsigned char *)&v40 - v18) = 0;
  uint64_t v20 = sub_23B5520B0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v22(v19, a1, v20);
  uint64_t v23 = *(int *)(v8 + 56);
  uint64_t v46 = v12;
  uint64_t v24 = (uint64_t)&v12[v23];
  uint64_t v41 = &v12[v23];
  *uint64_t v12 = 1;
  uint64_t v25 = type metadata accessor for AgentUpdate.Context(0);
  sub_23B53594C(a1 + *(int *)(v25 + 20), v24, &qword_268A69DF0);
  uint64_t v26 = v42;
  uint64_t v27 = (uint64_t)&v48[*(int *)(v42 + 56)];
  unsigned char *v48 = 2;
  uint64_t v28 = a1 + *(int *)(v25 + 24);
  uint64_t v29 = v27;
  sub_23B53594C(v28, v27, &qword_268A69DF8);
  uint64_t v30 = &v17[*(int *)(v14 + 56)];
  *uint64_t v17 = 0;
  v22(v30, (uint64_t)v40, v20);
  uint64_t v31 = (uint64_t)v44;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v44, v30, v20);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v31, 0, 1, v20);
  char v51 = 0;
  uint64_t v32 = *(int *)(v8 + 56);
  uint64_t v33 = v43;
  uint64_t v34 = (uint64_t)&v43[v32];
  *uint64_t v43 = 1;
  sub_23B53594C((uint64_t)v41, (uint64_t)&v33[v32], &qword_268A69DF0);
  char v50 = 1;
  uint64_t v35 = *(int *)(v26 + 56);
  uint64_t v36 = v45;
  uint64_t v37 = (uint64_t)&v45[v35];
  *uint64_t v45 = 2;
  sub_23B53594C(v29, (uint64_t)&v36[v35], &qword_268A69DF8);
  char v49 = 2;
  sub_23B552090();
  sub_23B5520C0();
  sub_23B53BF40();
  sub_23B5381E4(&qword_268A69E60, MEMORY[0x263F60A78]);
  sub_23B5381E4(&qword_268A69EE0, MEMORY[0x263F60888]);
  sub_23B5381E4(&qword_268A69EE8, MEMORY[0x263F60B28]);
  uint64_t v38 = sub_23B5521A0();
  sub_23B544AB4(v31, &qword_268A69E40);
  sub_23B544AB4((uint64_t)v48, &qword_268A6A0B8);
  sub_23B544AB4((uint64_t)v46, &qword_268A6A0C0);
  sub_23B544AB4(v47, &qword_268A6A0C8);
  sub_23B544AB4(v37, &qword_268A69DF8);
  sub_23B544AB4(v34, &qword_268A69DF0);
  return v38;
}

uint64_t sub_23B53BA38()
{
  return sub_23B53B544(*(void *)(v0 + 16));
}

uint64_t AgentUpdate.Context.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v26 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23B5520B0();
  uint64_t v27 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v14 = a2 + *(int *)(v13 + 20);
  uint64_t v15 = sub_23B552090();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v28 = v14;
  v16(v14, 1, 1, v15);
  uint64_t v17 = a2 + *(int *)(v13 + 24);
  uint64_t v18 = sub_23B5520C0();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v32 = v17;
  v19(v17, 1, 1, v18);
  uint64_t v30 = &type metadata for AgentUpdate.Context.Key;
  unint64_t v20 = sub_23B53BF40();
  unint64_t v31 = v20;
  v29[0] = 0;
  sub_23B5381E4(&qword_268A69E60, MEMORY[0x263F60A78]);
  sub_23B5520E0();
  if (v2)
  {
    uint64_t v21 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a1, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v22 = v32;
    sub_23B544AB4(v28, &qword_268A69DF0);
    return sub_23B544AB4(v22, &qword_268A69DF8);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a2, v12, v10);
    uint64_t v30 = &type metadata for AgentUpdate.Context.Key;
    unint64_t v31 = v20;
    v29[0] = 1;
    sub_23B5381E4(&qword_268A69EE0, MEMORY[0x263F60888]);
    uint64_t v23 = (uint64_t)v26;
    sub_23B552110();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    sub_23B5359F0(v23, v28, &qword_268A69DF0);
    uint64_t v30 = &type metadata for AgentUpdate.Context.Key;
    unint64_t v31 = v20;
    v29[0] = 2;
    sub_23B5381E4(&qword_268A69EE8, MEMORY[0x263F60B28]);
    sub_23B552110();
    uint64_t v25 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(a1, v25);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    return sub_23B5359F0((uint64_t)v7, v32, &qword_268A69DF8);
  }
}

unint64_t sub_23B53BF40()
{
  unint64_t result = qword_268A69ED8;
  if (!qword_268A69ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69ED8);
  }
  return result;
}

uint64_t sub_23B53BF94()
{
  return sub_23B552120();
}

uint64_t sub_23B53BFD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return AgentUpdate.Context.init(propertyListValue:)(a1, a2);
}

uint64_t sub_23B53BFF4@<X0>(BOOL *a1@<X8>)
{
  return sub_23B53C000(a1);
}

uint64_t sub_23B53C000@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23B552600();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_23B53C050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B544A30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23B53C07C(void *a1@<X8>)
{
  *a1 = &unk_26EE98B78;
}

uint64_t SceneAgentConnectionContext.propertyListValue.getter()
{
  return sub_23B53C0C0((void (*)(void))sub_23B53C130);
}

uint64_t sub_23B53C0C0(void (*a1)(void))
{
  return sub_23B552130();
}

unint64_t sub_23B53C130()
{
  unint64_t result = qword_268A69EF0;
  if (!qword_268A69EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EF0);
  }
  return result;
}

uint64_t SceneAgentConnectionContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_23B53C1B8(a1, (uint64_t)&type metadata for SceneAgentConnectionContext.Key, (uint64_t (*)(void))sub_23B53C130, a2);
}

uint64_t sub_23B53C1B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, void *a4@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v12 = a3();
  sub_23B5520E0();
  uint64_t v7 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    uint64_t v9 = v14;
    *a4 = v13;
    a4[1] = v9;
  }
  return result;
}

unint64_t sub_23B53C2B8()
{
  unint64_t result = qword_268A69EF8;
  if (!qword_268A69EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69EF8);
  }
  return result;
}

unint64_t sub_23B53C310()
{
  unint64_t result = qword_268A69F00;
  if (!qword_268A69F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69F00);
  }
  return result;
}

unint64_t sub_23B53C368()
{
  unint64_t result = qword_268A69F08;
  if (!qword_268A69F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69F08);
  }
  return result;
}

uint64_t sub_23B53C3BC()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_23B53C3CC()
{
  unint64_t result = qword_268A69F10;
  if (!qword_268A69F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69F10);
  }
  return result;
}

unint64_t sub_23B53C424()
{
  unint64_t result = qword_268A69F18;
  if (!qword_268A69F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69F18);
  }
  return result;
}

uint64_t sub_23B53C478()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_23B53C484()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_23B53C494()
{
  unint64_t result = qword_268A69F20;
  if (!qword_268A69F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69F20);
  }
  return result;
}

uint64_t sub_23B53C4E8()
{
  return MEMORY[0x263F60648];
}

uint64_t sub_23B53C4F4()
{
  return MEMORY[0x263F60690];
}

uint64_t sub_23B53C500()
{
  return MEMORY[0x263F604F8];
}

uint64_t sub_23B53C50C(uint64_t a1, uint64_t a2)
{
  return sub_23B53C540(a1, a2, (void (*)(void))sub_23B53C130);
}

uint64_t sub_23B53C540(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_23B552130();
}

uint64_t sub_23B53C5B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_23B53C5E4(a1, (uint64_t)&type metadata for SceneAgentConnectionContext.Key, (uint64_t (*)(void))sub_23B53C130, a2);
}

uint64_t sub_23B53C5E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t (*a3)(void)@<X4>, void *a4@<X8>)
{
  uint64_t v11 = a2;
  uint64_t v12 = a3();
  sub_23B5520E0();
  uint64_t v7 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    uint64_t v9 = v14;
    *a4 = v13;
    a4[1] = v9;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent()
{
  return &type metadata for ShellToPreviewNonUIAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = (int *)type metadata accessor for AgentUpdate(0);
    uint64_t v8 = v7[5];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23B552140();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = v7[6];
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v7[7];
    uint64_t v18 = (char *)v4 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_23B5520B0();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    uint64_t v22 = type metadata accessor for AgentUpdate.Context(0);
    uint64_t v23 = *(int *)(v22 + 20);
    uint64_t v24 = &v18[v23];
    uint64_t v25 = &v19[v23];
    uint64_t v26 = sub_23B552090();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    uint64_t v30 = *(int *)(v22 + 24);
    unint64_t v31 = &v18[v30];
    uint64_t v32 = &v19[v30];
    uint64_t v33 = sub_23B5520C0();
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    uint64_t v36 = v7[8];
    uint64_t v37 = (uint64_t *)((char *)v4 + v36);
    uint64_t v38 = (uint64_t *)((char *)a2 + v36);
    uint64_t v39 = v38[1];
    void *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for AgentUpdate(0);
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(v2 + 28);
  uint64_t v6 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v8 = v5 + *(int *)(v7 + 20);
  uint64_t v9 = sub_23B552090();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = v5 + *(int *)(v7 + 24);
  uint64_t v12 = sub_23B5520C0();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ShellToPreviewNonUIAgent.TwoWayMessage(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23B552140();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = v5[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = v5[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_23B5520B0();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  uint64_t v20 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v21 = *(int *)(v20 + 20);
  uint64_t v22 = &v16[v21];
  uint64_t v23 = &v17[v21];
  uint64_t v24 = sub_23B552090();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v27 = *(int *)(v20 + 24);
  uint64_t v28 = &v16[v27];
  uint64_t v29 = &v17[v27];
  uint64_t v30 = sub_23B5520C0();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  uint64_t v33 = v5[8];
  uint64_t v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ShellToPreviewNonUIAgent.TwoWayMessage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = v4[6];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = a2;
  uint64_t v12 = v4[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v38 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v16 = *(int *)(v38 + 20);
  uint64_t v17 = &v13[v16];
  uint64_t v18 = &v14[v16];
  uint64_t v19 = sub_23B552090();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_7:
  uint64_t v25 = *(int *)(v38 + 24);
  uint64_t v26 = &v13[v25];
  uint64_t v27 = &v14[v25];
  uint64_t v28 = sub_23B5520C0();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 24))(v26, v27, v28);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
    goto LABEL_12;
  }
  if (v32)
  {
LABEL_12:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_13:
  uint64_t v34 = v4[8];
  uint64_t v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = (void *)((char *)v39 + v34);
  void *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ShellToPreviewNonUIAgent.TwoWayMessage(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v5 = v4[5];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  uint64_t v9 = v4[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v14 = *(int *)(v13 + 20);
  uint64_t v15 = &v10[v14];
  uint64_t v16 = &v11[v14];
  uint64_t v17 = sub_23B552090();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v20 = *(int *)(v13 + 24);
  uint64_t v21 = &v10[v20];
  int v22 = &v11[v20];
  uint64_t v23 = sub_23B5520C0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
  return a1;
}

void *assignWithTake for ShellToPreviewNonUIAgent.TwoWayMessage(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v6 = v5[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = v5[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v44 = a2;
  uint64_t v15 = v5[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v43 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v19 = *(int *)(v43 + 20);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = sub_23B552090();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
LABEL_7:
  uint64_t v28 = *(int *)(v43 + 24);
  uint64_t v29 = &v16[v28];
  uint64_t v30 = &v17[v28];
  uint64_t v31 = sub_23B5520C0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 40))(v29, v30, v31);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v31);
    goto LABEL_12;
  }
  if (v35)
  {
LABEL_12:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v29, v30, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
LABEL_13:
  uint64_t v37 = v5[8];
  uint64_t v38 = (void *)((char *)a1 + v37);
  uint64_t v39 = (void *)((char *)v44 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  void *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B5404D0(a1, a2, a3, &qword_268A69F28);
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23B54053C(a1, a2, a3, a4, &qword_268A69F28);
}

uint64_t sub_23B53D9F8()
{
  return 0;
}

uint64_t sub_23B53DA00(uint64_t a1)
{
  uint64_t result = type metadata accessor for AgentUpdate(319);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B5404D0(a1, a2, a3, &qword_268A69E58);
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23B54053C(a1, a2, a3, a4, &qword_268A69E58);
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent()
{
  return &type metadata for ShellToPreviewSceneAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v55 = v8;
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = (int *)type metadata accessor for AgentUpdate(0);
      uint64_t v12 = v11[5];
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_23B552140();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      uint64_t v17 = v11[6];
      uint64_t v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      *uint64_t v18 = *v19;
      v18[1] = v20;
      char v54 = v11;
      uint64_t v21 = v11[7];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_23B5520B0();
      int v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
      swift_bridgeObjectRetain();
      v25(v22, v23, v24);
      uint64_t v26 = type metadata accessor for AgentUpdate.Context(0);
      uint64_t v27 = *(int *)(v26 + 20);
      uint64_t v28 = &v22[v27];
      uint64_t v29 = &v23[v27];
      uint64_t v30 = sub_23B552090();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
        memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      }
      uint64_t v33 = *(int *)(v26 + 24);
      int v34 = &v22[v33];
      int v35 = &v23[v33];
      uint64_t v36 = sub_23B5520C0();
      uint64_t v37 = *(void *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
        memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      uint64_t v39 = v54[8];
      uint64_t v40 = (uint64_t *)((char *)a1 + v39);
      uint64_t v41 = (uint64_t *)((char *)a2 + v39);
      uint64_t v42 = v41[1];
      void *v40 = *v41;
      v40[1] = v42;
      uint64_t v43 = *(int *)(v7 + 48);
      uint64_t v44 = (char *)a1 + v43;
      uint64_t v45 = (char *)a2 + v43;
      uint64_t v46 = sub_23B551FE0();
      uint64_t v47 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
      swift_bridgeObjectRetain();
      v47(v44, v45, v46);
      uint64_t updated = type metadata accessor for SceneUpdateContext(0);
      uint64_t v49 = *(int *)(updated + 20);
      char v50 = &v44[v49];
      char v51 = &v45[v49];
      uint64_t v52 = sub_23B551FF0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16))(v50, v51, v52);
      v44[*(int *)(updated + 24)] = v45[*(int *)(updated + 24)];
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v55 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = type metadata accessor for AgentUpdate(0);
    uint64_t v5 = a1 + *(int *)(v4 + 20);
    uint64_t v6 = sub_23B552140();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    swift_bridgeObjectRelease();
    uint64_t v7 = a1 + *(int *)(v4 + 28);
    uint64_t v8 = sub_23B5520B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    uint64_t v9 = type metadata accessor for AgentUpdate.Context(0);
    uint64_t v10 = v7 + *(int *)(v9 + 20);
    uint64_t v11 = sub_23B552090();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
    uint64_t v13 = v7 + *(int *)(v9 + 24);
    uint64_t v14 = sub_23B5520C0();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = a1 + *(int *)(v2 + 48);
    uint64_t v17 = sub_23B551FE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    uint64_t v18 = v16 + *(int *)(type metadata accessor for SceneUpdateContext(0) + 20);
    uint64_t v19 = sub_23B551FF0();
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
    return v20(v18, v19);
  }
  return result;
}

void *initializeWithCopy for ShellToPreviewSceneAgent.TwoWayMessage(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v53 = v7;
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    uint64_t v9 = (int *)type metadata accessor for AgentUpdate(0);
    uint64_t v10 = v9[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_23B552140();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    uint64_t v15 = v9[6];
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v52 = v9;
    uint64_t v19 = v9[7];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = sub_23B5520B0();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
    uint64_t v24 = type metadata accessor for AgentUpdate.Context(0);
    uint64_t v25 = *(int *)(v24 + 20);
    uint64_t v26 = &v20[v25];
    uint64_t v27 = &v21[v25];
    uint64_t v28 = sub_23B552090();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v31 = *(int *)(v24 + 24);
    uint64_t v32 = &v20[v31];
    uint64_t v33 = &v21[v31];
    uint64_t v34 = sub_23B5520C0();
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
      memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    uint64_t v37 = v52[8];
    uint64_t v38 = (void *)((char *)a1 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    uint64_t v40 = v39[1];
    void *v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = *(int *)(v6 + 48);
    uint64_t v42 = (char *)a1 + v41;
    uint64_t v43 = (char *)a2 + v41;
    uint64_t v44 = sub_23B551FE0();
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
    swift_bridgeObjectRetain();
    v45(v42, v43, v44);
    uint64_t updated = type metadata accessor for SceneUpdateContext(0);
    uint64_t v47 = *(int *)(updated + 20);
    uint64_t v48 = &v42[v47];
    uint64_t v49 = &v43[v47];
    uint64_t v50 = sub_23B551FF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
    v42[*(int *)(updated + 24)] = v43[*(int *)(updated + 24)];
    (*(void (**)(void *, void, uint64_t, uint64_t))(v53 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for ShellToPreviewSceneAgent.TwoWayMessage(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_23B544AB4((uint64_t)a1, &qword_268A69E80);
      goto LABEL_7;
    }
    *a1 = *a2;
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v32 = (int *)type metadata accessor for AgentUpdate(0);
    uint64_t v33 = v32[5];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = sub_23B552140();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 24))(v34, v35, v36);
    uint64_t v37 = v32[6];
    uint64_t v38 = (void *)((char *)a1 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    void *v38 = *v39;
    v38[1] = v39[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v98 = v32;
    uint64_t v40 = v32[7];
    uint64_t v41 = (char *)a1 + v40;
    uint64_t v42 = (char *)a2 + v40;
    uint64_t v43 = sub_23B5520B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 24))(v41, v42, v43);
    uint64_t v93 = type metadata accessor for AgentUpdate.Context(0);
    v94 = v41;
    uint64_t v44 = *(int *)(v93 + 20);
    uint64_t v45 = &v41[v44];
    v96 = v42;
    uint64_t v46 = &v42[v44];
    uint64_t v47 = sub_23B552090();
    uint64_t v48 = *(void *)(v47 - 8);
    uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
    LODWORD(v42) = v49(v45, 1, v47);
    int v50 = v49(v46, 1, v47);
    if (v42)
    {
      if (!v50)
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v50)
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v45, v46, v47);
LABEL_19:
        uint64_t v71 = *(int *)(v93 + 24);
        v72 = &v94[v71];
        v73 = &v96[v71];
        uint64_t v74 = sub_23B5520C0();
        uint64_t v75 = *(void *)(v74 - 8);
        v76 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
        int v77 = v76(v72, 1, v74);
        int v78 = v76(v73, 1, v74);
        if (v77)
        {
          if (!v78)
          {
            (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v72, v73, v74);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v75 + 56))(v72, 0, 1, v74);
LABEL_25:
            uint64_t v80 = v98[8];
            v81 = (void *)((char *)a1 + v80);
            v82 = (void *)((char *)a2 + v80);
            void *v81 = *v82;
            v81[1] = v82[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v83 = *(int *)(v6 + 48);
            v84 = (char *)a1 + v83;
            v85 = (char *)a2 + v83;
            uint64_t v86 = sub_23B551FE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v86 - 8) + 24))(v84, v85, v86);
            uint64_t updated = type metadata accessor for SceneUpdateContext(0);
            uint64_t v88 = *(int *)(updated + 20);
            v89 = &v84[v88];
            v90 = &v85[v88];
            uint64_t v91 = sub_23B551FF0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 24))(v89, v90, v91);
            v84[*(int *)(updated + 24)] = v85[*(int *)(updated + 24)];
            return a1;
          }
        }
        else
        {
          if (!v78)
          {
            (*(void (**)(char *, char *, uint64_t))(v75 + 24))(v72, v73, v74);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v74);
        }
        uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
        memcpy(v72, v73, *(void *)(*(void *)(v79 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
    }
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v45, v46, *(void *)(*(void *)(v70 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v97 = v7;
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v11 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_23B552140();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  uint64_t v17 = v11[6];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  v95 = v11;
  uint64_t v20 = v11[7];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_23B5520B0();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  uint64_t v25 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v26 = *(int *)(v25 + 20);
  uint64_t v27 = &v21[v26];
  uint64_t v28 = &v22[v26];
  uint64_t v29 = sub_23B552090();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  uint64_t v51 = *(int *)(v25 + 24);
  uint64_t v52 = &v21[v51];
  uint64_t v53 = &v22[v51];
  uint64_t v54 = sub_23B5520C0();
  uint64_t v55 = *(void *)(v54 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54))
  {
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v52, v53, v54);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
  }
  uint64_t v57 = v95[8];
  char v58 = (void *)((char *)a1 + v57);
  uint64_t v59 = (void *)((char *)a2 + v57);
  *char v58 = *v59;
  v58[1] = v59[1];
  uint64_t v60 = *(int *)(v6 + 48);
  char v61 = (char *)a1 + v60;
  uint64_t v62 = (char *)a2 + v60;
  uint64_t v63 = sub_23B551FE0();
  v64 = *(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16);
  swift_bridgeObjectRetain();
  v64(v61, v62, v63);
  uint64_t v65 = type metadata accessor for SceneUpdateContext(0);
  uint64_t v66 = *(int *)(v65 + 20);
  v67 = &v61[v66];
  v68 = &v62[v66];
  uint64_t v69 = sub_23B551FF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16))(v67, v68, v69);
  v61[*(int *)(v65 + 24)] = v62[*(int *)(v65 + 24)];
  (*(void (**)(void *, void, uint64_t, uint64_t))(v97 + 56))(a1, 0, 1, v6);
  return a1;
}

_OWORD *initializeWithTake for ShellToPreviewSceneAgent.TwoWayMessage(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v41 = v7;
    *a1 = *a2;
    uint64_t v8 = (int *)type metadata accessor for AgentUpdate(0);
    uint64_t v9 = v8[5];
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_23B552140();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
    uint64_t v40 = v8;
    uint64_t v13 = v8[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_23B5520B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    uint64_t v17 = type metadata accessor for AgentUpdate.Context(0);
    uint64_t v18 = *(int *)(v17 + 20);
    uint64_t v19 = &v14[v18];
    uint64_t v20 = &v15[v18];
    uint64_t v21 = sub_23B552090();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    uint64_t v24 = *(int *)(v17 + 24);
    uint64_t v25 = &v14[v24];
    uint64_t v26 = &v15[v24];
    uint64_t v27 = sub_23B5520C0();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    *(_OWORD *)((char *)a1 + v40[8]) = *(_OWORD *)((char *)a2 + v40[8]);
    uint64_t v30 = *(int *)(v6 + 48);
    uint64_t v31 = (char *)a1 + v30;
    uint64_t v32 = (char *)a2 + v30;
    uint64_t v33 = sub_23B551FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
    uint64_t updated = type metadata accessor for SceneUpdateContext(0);
    uint64_t v35 = *(int *)(updated + 20);
    uint64_t v36 = &v31[v35];
    uint64_t v37 = &v32[v35];
    uint64_t v38 = sub_23B551FF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    v31[*(int *)(updated + 24)] = v32[*(int *)(updated + 24)];
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v41 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for ShellToPreviewSceneAgent.TwoWayMessage(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_23B544AB4((uint64_t)a1, &qword_268A69E80);
      goto LABEL_7;
    }
    uint64_t v27 = a2[1];
    *a1 = *a2;
    a1[1] = v27;
    swift_bridgeObjectRelease();
    uint64_t v28 = (int *)type metadata accessor for AgentUpdate(0);
    uint64_t v29 = v28[5];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = sub_23B552140();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 40))(v30, v31, v32);
    uint64_t v33 = v28[6];
    uint64_t v34 = (void *)((char *)a1 + v33);
    uint64_t v35 = (void *)((char *)a2 + v33);
    uint64_t v37 = *v35;
    uint64_t v36 = v35[1];
    *uint64_t v34 = v37;
    v34[1] = v36;
    swift_bridgeObjectRelease();
    v94 = v28;
    uint64_t v38 = v28[7];
    uint64_t v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = sub_23B5520B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 40))(v39, v40, v41);
    uint64_t v89 = type metadata accessor for AgentUpdate.Context(0);
    v90 = v39;
    uint64_t v42 = *(int *)(v89 + 20);
    uint64_t v43 = &v39[v42];
    v92 = v40;
    uint64_t v44 = &v40[v42];
    uint64_t v45 = sub_23B552090();
    uint64_t v46 = *(void *)(v45 - 8);
    uint64_t v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
    LODWORD(v40) = v47(v43, 1, v45);
    int v48 = v47(v44, 1, v45);
    if (v40)
    {
      if (!v48)
      {
        (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v43, v44, v45);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v48)
      {
        (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v43, v44, v45);
LABEL_19:
        uint64_t v65 = *(int *)(v89 + 24);
        uint64_t v66 = &v90[v65];
        v67 = &v92[v65];
        uint64_t v68 = sub_23B5520C0();
        uint64_t v69 = *(void *)(v68 - 8);
        uint64_t v70 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v69 + 48);
        int v71 = v70(v66, 1, v68);
        int v72 = v70(v67, 1, v68);
        if (v71)
        {
          if (!v72)
          {
            (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v66, v67, v68);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v66, 0, 1, v68);
LABEL_25:
            uint64_t v74 = v94[8];
            uint64_t v75 = (void *)((char *)a1 + v74);
            v76 = (void *)((char *)a2 + v74);
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            *uint64_t v75 = v78;
            v75[1] = v77;
            swift_bridgeObjectRelease();
            uint64_t v79 = *(int *)(v6 + 48);
            uint64_t v80 = (char *)a1 + v79;
            v81 = (char *)a2 + v79;
            uint64_t v82 = sub_23B551FE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 40))(v80, v81, v82);
            uint64_t updated = type metadata accessor for SceneUpdateContext(0);
            uint64_t v84 = *(int *)(updated + 20);
            v85 = &v80[v84];
            uint64_t v86 = &v81[v84];
            uint64_t v87 = sub_23B551FF0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 40))(v85, v86, v87);
            v80[*(int *)(updated + 24)] = v81[*(int *)(updated + 24)];
            return a1;
          }
        }
        else
        {
          if (!v72)
          {
            (*(void (**)(char *, char *, uint64_t))(v69 + 40))(v66, v67, v68);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v69 + 8))(v66, v68);
        }
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
        memcpy(v66, v67, *(void *)(*(void *)(v73 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    }
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v43, v44, *(void *)(*(void *)(v64 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v93 = v7;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v11 = (int *)type metadata accessor for AgentUpdate(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)((char *)a1 + v11[6]) = *(_OWORD *)((char *)a2 + v11[6]);
  uint64_t v91 = v11;
  uint64_t v16 = v11[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v21 = *(int *)(v20 + 20);
  uint64_t v22 = &v17[v21];
  uint64_t v23 = &v18[v21];
  uint64_t v24 = sub_23B552090();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v49 = *(int *)(v20 + 24);
  int v50 = &v17[v49];
  uint64_t v51 = &v18[v49];
  uint64_t v52 = sub_23B5520C0();
  uint64_t v53 = *(void *)(v52 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52))
  {
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v50, v51, *(void *)(*(void *)(v54 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v50, v51, v52);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
  }
  *(_OWORD *)((char *)a1 + v91[8]) = *(_OWORD *)((char *)a2 + v91[8]);
  uint64_t v55 = *(int *)(v6 + 48);
  uint64_t v56 = (char *)a1 + v55;
  uint64_t v57 = (char *)a2 + v55;
  uint64_t v58 = sub_23B551FE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
  uint64_t v59 = type metadata accessor for SceneUpdateContext(0);
  uint64_t v60 = *(int *)(v59 + 20);
  char v61 = &v56[v60];
  uint64_t v62 = &v57[v60];
  uint64_t v63 = sub_23B551FF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 32))(v61, v62, v63);
  v56[*(int *)(v59 + 24)] = v57[*(int *)(v59 + 24)];
  (*(void (**)(void *, void, uint64_t, uint64_t))(v93 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23B53FD64);
}

uint64_t sub_23B53FD64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23B53FDE8);
}

uint64_t sub_23B53FDE8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_23B53FE6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_23B53FED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E80);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_23B53FF4C()
{
  uint64_t result = type metadata accessor for AgentUpdate(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SceneUpdateContext(319);
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSinglePayload();
      return 0;
    }
  }
  return result;
}

uint64_t *_s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = sub_23B5520B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
    uint64_t v8 = (char *)a1 + v7;
    int v9 = (char *)a2 + v7;
    uint64_t v10 = sub_23B552140();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
  uint64_t v4 = sub_23B552140();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A69E58) + 48);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_23B5404D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  return v7(a1, a2, v6);
}

uint64_t sub_23B54053C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a5);
  int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  return v9(a1, a2, a3, v8);
}

uint64_t sub_23B5405B8(uint64_t a1)
{
  uint64_t result = sub_23B5520B0();
  if (v3 <= 0x3F)
  {
    uint64_t result = sub_23B552140();
    if (v4 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSingleCase();
      uint64_t result = 0;
      *(_DWORD *)(*(void *)(a1 - 8) + 84) = v5;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for EntryPointCategory(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EntryPointCategory()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for EntryPointCategory(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for EntryPointCategory()
{
  return &type metadata for EntryPointCategory;
}

uint64_t destroy for EntryPointType()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EntryPointType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EntryPointType(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for EntryPointType(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntryPointType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntryPointType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EntryPointType()
{
  return &type metadata for EntryPointType;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentUpdate(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    int v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23B552140();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)v4 + v14;
    uint64_t v19 = (char *)a2 + v14;
    uint64_t v20 = sub_23B5520B0();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    uint64_t v22 = type metadata accessor for AgentUpdate.Context(0);
    uint64_t v23 = *(int *)(v22 + 20);
    uint64_t v24 = &v18[v23];
    uint64_t v25 = &v19[v23];
    uint64_t v26 = sub_23B552090();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    uint64_t v30 = *(int *)(v22 + 24);
    uint64_t v31 = &v18[v30];
    uint64_t v32 = &v19[v30];
    uint64_t v33 = sub_23B5520C0();
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    uint64_t v36 = a3[8];
    uint64_t v37 = (uint64_t *)((char *)v4 + v36);
    uint64_t v38 = (uint64_t *)((char *)a2 + v36);
    uint64_t v39 = v38[1];
    void *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AgentUpdate(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_23B552140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v9 = v6 + *(int *)(v8 + 20);
  uint64_t v10 = sub_23B552090();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v6 + *(int *)(v8 + 24);
  uint64_t v13 = sub_23B5520C0();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AgentUpdate(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23B552140();
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
  uint64_t v17 = (char *)a1 + v13;
  uint64_t v18 = (char *)a2 + v13;
  uint64_t v19 = sub_23B5520B0();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  uint64_t v21 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v22 = *(int *)(v21 + 20);
  uint64_t v23 = &v17[v22];
  uint64_t v24 = &v18[v22];
  uint64_t v25 = sub_23B552090();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v28 = *(int *)(v21 + 24);
  uint64_t v29 = &v17[v28];
  uint64_t v30 = &v18[v28];
  uint64_t v31 = sub_23B5520C0();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  uint64_t v34 = a3[8];
  uint64_t v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = v36[1];
  void *v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AgentUpdate(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = a2;
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v39 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v17 = *(int *)(v39 + 20);
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = sub_23B552090();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v18, v19, v20);
LABEL_7:
  uint64_t v26 = *(int *)(v39 + 24);
  uint64_t v27 = &v14[v26];
  uint64_t v28 = &v15[v26];
  uint64_t v29 = sub_23B5520C0();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  int v32 = v31(v27, 1, v29);
  int v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    goto LABEL_12;
  }
  if (v33)
  {
LABEL_12:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_13:
  uint64_t v35 = a3[8];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)v40 + v35);
  void *v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AgentUpdate(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v15 = *(int *)(v14 + 20);
  uint64_t v16 = &v11[v15];
  uint64_t v17 = &v12[v15];
  uint64_t v18 = sub_23B552090();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v21 = *(int *)(v14 + 24);
  uint64_t v22 = &v11[v21];
  int v23 = &v12[v21];
  uint64_t v24 = sub_23B5520C0();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

void *assignWithTake for AgentUpdate(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23B552140();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v45 = a2;
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_23B5520B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v44 = type metadata accessor for AgentUpdate.Context(0);
  uint64_t v20 = *(int *)(v44 + 20);
  uint64_t v21 = &v17[v20];
  uint64_t v22 = &v18[v20];
  uint64_t v23 = sub_23B552090();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v21, v22, v23);
LABEL_7:
  uint64_t v29 = *(int *)(v44 + 24);
  uint64_t v30 = &v17[v29];
  uint64_t v31 = &v18[v29];
  uint64_t v32 = sub_23B5520C0();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v30, v31, v32);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_12;
  }
  if (v36)
  {
LABEL_12:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v30, v31, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v31, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_13:
  uint64_t v38 = a3[8];
  uint64_t v39 = (void *)((char *)a1 + v38);
  uint64_t v40 = (void *)((char *)v45 + v38);
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  *uint64_t v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23B541BD4);
}

uint64_t sub_23B541BD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_23B552140();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for AgentUpdate.Context(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AgentUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23B541D14);
}

uint64_t sub_23B541D14(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_23B552140();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for AgentUpdate.Context(0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_23B541E40()
{
  uint64_t result = sub_23B552140();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AgentUpdate.Context(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentUpdate.Context(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23B5520B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23B552090();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_23B5520C0();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for AgentUpdate.Context(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_23B552090();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = sub_23B5520C0();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

uint64_t initializeWithCopy for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_23B552090();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_23B5520C0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t assignWithCopy for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_23B552090();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_23B5520C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t initializeWithTake for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_23B552090();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  int v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_23B5520C0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t assignWithTake for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5520B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_23B552090();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_23B5520C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23B542DFC);
}

uint64_t sub_23B542DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5520B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23B542F64);
}

uint64_t sub_23B542F64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23B5520B0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69DF8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_23B5430C4()
{
  sub_23B5520B0();
  if (v0 <= 0x3F)
  {
    sub_23B543200(319, &qword_268A69F90, MEMORY[0x263F60888]);
    if (v1 <= 0x3F)
    {
      sub_23B543200(319, &qword_268A69F98, MEMORY[0x263F60B28]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_23B543200(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23B552510();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *_s19PreviewsOSSupportUI18EntryPointCategoryVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19PreviewsOSSupportUI18EntryPointCategoryVwet_0(uint64_t a1, int a2)
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

uint64_t sub_23B5432E0(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SceneAgentConnectionContext()
{
  return &type metadata for SceneAgentConnectionContext;
}

ValueMetadata *type metadata accessor for PreviewSceneRole()
{
  return &type metadata for PreviewSceneRole;
}

void *initializeBufferWithCopyOfBuffer for SceneUpdateContext(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23B551FE0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23B551FF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for SceneUpdateContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_23B551FF0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23B54384C);
}

uint64_t sub_23B54384C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B551FE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = sub_23B551FF0();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
      if (v14 >= 2) {
        return v14 - 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23B543970);
}

uint64_t sub_23B543970(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23B551FE0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23B551FF0();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23B543A80()
{
  uint64_t result = sub_23B551FE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23B551FF0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneAgentConnectionContext.Key()
{
  return &type metadata for SceneAgentConnectionContext.Key;
}

ValueMetadata *type metadata accessor for AgentUpdate.Context.Key()
{
  return &type metadata for AgentUpdate.Context.Key;
}

ValueMetadata *type metadata accessor for EntryPointType.Discriminant()
{
  return &type metadata for EntryPointType.Discriminant;
}

ValueMetadata *type metadata accessor for EntryPointType.Key()
{
  return &type metadata for EntryPointType.Key;
}

ValueMetadata *type metadata accessor for EntryPointCategory.Key()
{
  return &type metadata for EntryPointCategory.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant()
{
  return &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext.Key()
{
  return &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
}

ValueMetadata *type metadata accessor for SceneUpdateContext.Key()
{
  return &type metadata for SceneUpdateContext.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant()
{
  return &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant;
}

uint64_t getEnumTagSinglePayload for AgentToShellMessage.Key(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19PreviewsOSSupportUI11AgentUpdateV7ContextV3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x23B543D70);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext.Key()
{
  return &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
}

uint64_t getEnumTagSinglePayload for AgentUpdate.Key(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AgentUpdate.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x23B543F04);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_23B543F2C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AgentUpdate.Key()
{
  return &type metadata for AgentUpdate.Key;
}

uint64_t _s19PreviewsOSSupportUI27SceneAgentConnectionContextV3KeyOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s19PreviewsOSSupportUI27SceneAgentConnectionContextV3KeyOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23B544030);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant;
}

unsigned char *_s19PreviewsOSSupportUI16PreviewSceneRoleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23B544134);
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

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
}

unint64_t sub_23B544170()
{
  unint64_t result = qword_268A69FB0;
  if (!qword_268A69FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FB0);
  }
  return result;
}

unint64_t sub_23B5441C8()
{
  unint64_t result = qword_268A69FB8;
  if (!qword_268A69FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FB8);
  }
  return result;
}

uint64_t sub_23B54421C()
{
  return sub_23B544704(&qword_268A69FC0, &qword_268A69FC8);
}

unint64_t sub_23B544248()
{
  unint64_t result = qword_268A69FD0;
  if (!qword_268A69FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FD0);
  }
  return result;
}

unint64_t sub_23B5442A0()
{
  unint64_t result = qword_268A69FD8;
  if (!qword_268A69FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FD8);
  }
  return result;
}

unint64_t sub_23B5442F8()
{
  unint64_t result = qword_268A69FE0;
  if (!qword_268A69FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FE0);
  }
  return result;
}

unint64_t sub_23B544350()
{
  unint64_t result = qword_268A69FE8;
  if (!qword_268A69FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FE8);
  }
  return result;
}

unint64_t sub_23B5443A8()
{
  unint64_t result = qword_268A69FF0;
  if (!qword_268A69FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A69FF0);
  }
  return result;
}

uint64_t sub_23B5443FC()
{
  return sub_23B544704(&qword_268A69FF8, &qword_268A6A000);
}

unint64_t sub_23B544428()
{
  unint64_t result = qword_268A6A008;
  if (!qword_268A6A008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A008);
  }
  return result;
}

unint64_t sub_23B544480()
{
  unint64_t result = qword_268A6A010;
  if (!qword_268A6A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A010);
  }
  return result;
}

unint64_t sub_23B5444D8()
{
  unint64_t result = qword_268A6A018;
  if (!qword_268A6A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A018);
  }
  return result;
}

uint64_t sub_23B54452C()
{
  return sub_23B544704(&qword_268A6A020, &qword_268A6A028);
}

unint64_t sub_23B544558()
{
  unint64_t result = qword_268A6A030;
  if (!qword_268A6A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A030);
  }
  return result;
}

unint64_t sub_23B5445B0()
{
  unint64_t result = qword_268A6A038;
  if (!qword_268A6A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A038);
  }
  return result;
}

unint64_t sub_23B544608()
{
  unint64_t result = qword_268A6A040;
  if (!qword_268A6A040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A040);
  }
  return result;
}

uint64_t sub_23B54465C()
{
  return sub_23B544704(&qword_268A6A048, &qword_268A6A050);
}

unint64_t sub_23B544688()
{
  unint64_t result = qword_268A6A058;
  if (!qword_268A6A058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A058);
  }
  return result;
}

uint64_t sub_23B5446DC()
{
  return sub_23B544704(&qword_268A6A060, &qword_268A6A068);
}

uint64_t sub_23B544704(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_23B544758()
{
  unint64_t result = qword_268A6A070;
  if (!qword_268A6A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A070);
  }
  return result;
}

unint64_t sub_23B5447AC()
{
  unint64_t result = qword_268A6A078;
  if (!qword_268A6A078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A078);
  }
  return result;
}

unint64_t sub_23B544800()
{
  unint64_t result = qword_268A6A080;
  if (!qword_268A6A080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A080);
  }
  return result;
}

unint64_t sub_23B544854()
{
  unint64_t result = qword_268A6A088;
  if (!qword_268A6A088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A088);
  }
  return result;
}

unint64_t sub_23B5448A8()
{
  unint64_t result = qword_268A6A090;
  if (!qword_268A6A090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A090);
  }
  return result;
}

uint64_t sub_23B5448FC()
{
  return 0x556D726F66726570;
}

uint64_t sub_23B544920()
{
  unint64_t v0 = sub_23B552600();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_23B54496C()
{
  return 0x65756C6176;
}

unint64_t sub_23B544980()
{
  unint64_t result = qword_268A6A098;
  if (!qword_268A6A098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A098);
  }
  return result;
}

uint64_t sub_23B5449D4()
{
  return 0x646564616F6CLL;
}

uint64_t sub_23B5449E8()
{
  unint64_t v0 = sub_23B552600();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_23B544A30()
{
  return 0x656449656E656373;
}

uint64_t sub_23B544A54(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(v2 + 24);
  *a2 = *(void *)(v2 + 16);
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23B544A60()
{
  unint64_t result = qword_268A6A0B0;
  if (!qword_268A6A0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A0B0);
  }
  return result;
}

uint64_t sub_23B544AB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void UIScene.setPreviewSceneActionHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_23B5523C0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v8[4] = sub_23B544CFC;
  v8[5] = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_23B544D04;
  v8[3] = &block_descriptor_0;
  BOOL v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_uv_registerActionHandlerForKey_handler_, v5, v7);
  _Block_release(v7);
}

BOOL sub_23B544C58(void *a1, void (*a2)(uint64_t))
{
  sub_23B552040();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    id v5 = a1;
    a2(v4);
  }
  return v4 != 0;
}

uint64_t sub_23B544CC4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL sub_23B544CFC(void *a1)
{
  return sub_23B544C58(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_23B544D04(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
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

id UIScene.sendPreviewSceneAction(_:)(uint64_t a1)
{
  return objc_msgSend(v1, sel_uv_sendSceneAction_, a1);
}

id UIScene.previewAgentDisplaysUI.getter()
{
  return objc_msgSend(v0, sel_uv_previewAgentDisplaysUI);
}

void static CATransaction.afterCommit(on:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_23B544DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = a1;
  uint64_t v28 = sub_23B552360();
  uint64_t v31 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  id v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23B552390();
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v30 = v5;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23B552170();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = sub_23B552370();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B546098();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F060], v11);
  uint64_t v24 = sub_23B5524F0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  uint64_t v17 = (void *)(v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v18 = v27;
  *uint64_t v17 = v26;
  v17[1] = v18;
  aBlock[4] = sub_23B545470;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B5451F8;
  aBlock[3] = &block_descriptor_33;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  sub_23B552380();
  uint64_t v32 = MEMORY[0x263F8EE78];
  sub_23B546214();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A130);
  sub_23B54626C();
  uint64_t v20 = v28;
  sub_23B552550();
  uint64_t v21 = (void *)v24;
  MEMORY[0x23ECC6EE0](0, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v30);
  return swift_release();
}

uint64_t sub_23B5451FC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

void static CATransaction.afterSynchronize(on:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_23B545284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  unsigned int v20 = a7;
  uint64_t v19 = a6;
  uint64_t v11 = sub_23B552170();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = self;
  objc_msgSend(v14, sel_activate);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  uint64_t v17 = (void *)(v16 + ((v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v17 = a2;
  v17[1] = a3;
  aBlock[4] = a5;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B5451F8;
  aBlock[3] = v19;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_addCommitHandler_forPhase_, v18, v20);
  _Block_release(v18);
}

uint64_t static CATransaction.afterCommit()()
{
  return sub_23B552200();
}

uint64_t static CATransaction.afterSynchronize()()
{
  return sub_23B552200();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v0[2] = sub_23B5524A0();
  v0[3] = sub_23B552490();
  uint64_t v2 = sub_23B552470();
  v0[4] = v2;
  v0[5] = v1;
  return MEMORY[0x270FA2498](sub_23B54560C, v2, v1);
}

uint64_t sub_23B54560C()
{
  objc_msgSend(self, sel_activate);
  *(void *)(v0 + 48) = sub_23B552490();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23B54570C;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_23B54570C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_23B545850, v3, v2);
}

uint64_t sub_23B545850()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_23B5458B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A118);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = self;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_23B545F94;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B5451F8;
  aBlock[3] = &block_descriptor_13;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v5, sel_addCommitHandler_forPhase_, v8, 5);
  _Block_release(v8);
}

uint64_t sub_23B545A68(uint64_t (*a1)())
{
  uint64_t v2 = sub_23B552170();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - v7;
  swift_retain();
  sub_23B552150();
  uint64_t v9 = self;
  objc_msgSend(v9, sel_activate);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v11 = (v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v10, v6, v2);
  uint64_t v13 = (uint64_t (**)())(v12 + v11);
  *uint64_t v13 = sub_23B546000;
  v13[1] = a1;
  aBlock[4] = sub_23B5451F4;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B5451F8;
  aBlock[3] = &block_descriptor_27;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_addCommitHandler_forPhase_, v14, 2);
  _Block_release(v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_23B545CB4(uint64_t a1)
{
  uint64_t v2 = sub_23B552170();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - v7;
  swift_retain();
  sub_23B552150();
  uint64_t v9 = self;
  objc_msgSend(v9, sel_activate);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v11 = (v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v10, v6, v2);
  uint64_t v13 = (void *)(v12 + v11);
  *uint64_t v13 = sub_23B5462F0;
  v13[1] = a1;
  aBlock[4] = sub_23B545470;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B5451F8;
  aBlock[3] = &block_descriptor_20;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_addCommitHandler_forPhase_, v14, 5);
  _Block_release(v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_23B545F00()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A118);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_23B545F94()
{
  return sub_23B552480();
}

uint64_t sub_23B546008()
{
  uint64_t v1 = *(void *)(sub_23B552170() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + v2;
  uint64_t v4 = (uint64_t *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  return sub_23B544DD8(v3, v5, v6);
}

unint64_t sub_23B546098()
{
  unint64_t result = qword_268A6A120;
  if (!qword_268A6A120)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A6A120);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_23B552170();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_23B546184()
{
  return sub_23B552160();
}

unint64_t sub_23B546214()
{
  unint64_t result = qword_268A6A128;
  if (!qword_268A6A128)
  {
    sub_23B552360();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A128);
  }
  return result;
}

unint64_t sub_23B54626C()
{
  unint64_t result = qword_268A6A138;
  if (!qword_268A6A138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A6A130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A138);
  }
  return result;
}

uint64_t sub_23B5462F4(char a1, char a2)
{
  if (*(void *)&aDiscrimiidenti_0[8 * a1] == *(void *)&aDiscrimiidenti_0[8 * a2]
    && *(void *)&aDiscrimiidenti_0[8 * a1 + 24] == *(void *)&aDiscrimiidenti_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23B54637C(char a1, char a2)
{
  if (*(void *)&aDiscrimiupdate_0[8 * a1] == *(void *)&aDiscrimiupdate_0[8 * a2]
    && *(void *)&aSceneconnant_0[8 * a1 + 8] == *(void *)&aSceneconnant_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23B546404(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x556D726F66726570;
  }
  if (v2) {
    unint64_t v4 = 0xED00006574616470;
  }
  else {
    unint64_t v4 = 0x800000023B554EC0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x556D726F66726570;
  }
  if (a2) {
    unint64_t v6 = 0x800000023B554EC0;
  }
  else {
    unint64_t v6 = 0xED00006574616470;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23B5464B8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657461647075;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x657461647075;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23B546560(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0xD000000000000015;
  }
  if (v2) {
    unint64_t v4 = 0x800000023B554FD0;
  }
  else {
    unint64_t v4 = 0x800000023B554FF0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0xD000000000000015;
  }
  if (a2) {
    unint64_t v6 = 0x800000023B554FF0;
  }
  else {
    unint64_t v6 = 0x800000023B554FD0;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23B54660C(char a1, char a2)
{
  if (*(void *)&aPreferenupdate[8 * a1] == *(void *)&aPreferenupdate[8 * a2]
    && *(void *)&aPreferenupdate[8 * a1 + 24] == *(void *)&aPreferenupdate[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23B546694(char a1, char a2)
{
  if (*(void *)&aSeed_2[8 * a1] == *(void *)&aSeed_2[8 * a2] && qword_23B554BC8[a1] == qword_23B554BC8[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23B54671C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000012;
    }
    else {
      unint64_t v3 = 0x726F77656D617266;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000023B554E70;
    }
    else {
      unint64_t v4 = 0xED0000687461506BLL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000012;
      }
      else {
        unint64_t v6 = 0x726F77656D617266;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000023B554E70;
      }
      else {
        unint64_t v7 = 0xED0000687461506BLL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xEC000000746E616ELL;
    unint64_t v3 = 0x696D697263736964;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    char v8 = sub_23B552630();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23B546850(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000023B554F10;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x6553657461647075;
    }
    else {
      unint64_t v5 = 0x7961507075746573;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEA00000000006465;
    }
    else {
      unint64_t v6 = 0xEC00000064616F6CLL;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000011;
  unint64_t v6 = 0x800000023B554F10;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x6553657461647075;
    }
    else {
      unint64_t v2 = 0x7961507075746573;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xEA00000000006465;
    }
    else {
      unint64_t v3 = 0xEC00000064616F6CLL;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23B546974(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000023B554E10;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "entryPointPayload";
      goto LABEL_6;
    case 2:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "entryPointFrameworkPath";
      goto LABEL_6;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x747865746E6F63;
      break;
    case 4:
      unint64_t v6 = "mangledFactoryName";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000023B554E10;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "entryPointPayload";
      goto LABEL_12;
    case 2:
      unint64_t v2 = 0xD000000000000017;
      char v8 = "entryPointFrameworkPath";
      goto LABEL_12;
    case 3:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x747865746E6F63;
      break;
    case 4:
      char v8 = "mangledFactoryName";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_23B546B00(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x636974617473;
  }
  else {
    uint64_t v2 = 0x646574736F68;
  }
  if (a2) {
    uint64_t v3 = 0x636974617473;
  }
  else {
    uint64_t v3 = 0x646574736F68;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_23B552630();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_23B546B78()
{
  return sub_23B552670();
}

uint64_t sub_23B546BE8()
{
  return sub_23B552670();
}

uint64_t sub_23B546C70()
{
  return sub_23B552670();
}

uint64_t sub_23B546D64()
{
  return sub_23B552670();
}

uint64_t sub_23B546DD0()
{
  return sub_23B552670();
}

uint64_t sub_23B546E64()
{
  return sub_23B552670();
}

uint64_t sub_23B546ED0()
{
  return sub_23B552670();
}

uint64_t sub_23B546F3C()
{
  return sub_23B552670();
}

uint64_t sub_23B546FF8()
{
  return sub_23B552670();
}

uint64_t sub_23B5470AC()
{
  return sub_23B552670();
}

uint64_t sub_23B547118()
{
  return sub_23B552670();
}

uint64_t sub_23B5471A0()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B5471F4()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B547248()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B5472C4()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B547334()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B547388()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B5473DC()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B54742C()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B5474D0()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B54756C()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B547640()
{
  return sub_23B552670();
}

uint64_t sub_23B547730()
{
  return sub_23B552670();
}

uint64_t sub_23B5477E0()
{
  return sub_23B552670();
}

uint64_t sub_23B547898()
{
  return sub_23B552670();
}

uint64_t sub_23B547904()
{
  return sub_23B552670();
}

uint64_t sub_23B54796C()
{
  return sub_23B552670();
}

uint64_t sub_23B5479D4()
{
  return sub_23B552670();
}

uint64_t sub_23B547A58()
{
  return sub_23B552670();
}

uint64_t sub_23B547ADC()
{
  return sub_23B552670();
}

uint64_t sub_23B547B44()
{
  return sub_23B552670();
}

uint64_t sub_23B547BD4()
{
  return sub_23B552670();
}

uint64_t sub_23B547C3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = AgentToShellMessage.messageType.getter();
  *a1 = result;
  return result;
}

uint64_t AgentToShellMessage.messageType.getter()
{
  uint64_t v1 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B547E10(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = 2;
  switch(EnumCaseMultiPayload)
  {
    case 1:

      uint64_t v6 = sub_23B552030();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v3, v6);
      uint64_t result = 1;
      break;
    case 2:
      uint64_t v7 = sub_23B552070();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
      uint64_t result = 4;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = 3;
      break;
    default:
      sub_23B54B444((uint64_t)v3, type metadata accessor for SceneUpdateHandshake);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t type metadata accessor for AgentToShellMessage(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A6A1B0);
}

uint64_t sub_23B547E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AgentToShellMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SceneUpdateHandshake(uint64_t a1)
{
  return sub_23B53A7E4(a1, (uint64_t *)&unk_268A6A1C0);
}

void *AgentToShellMessage.fenceHandle.getter()
{
  uint64_t v1 = v0;
  uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B547E10(v1, (uint64_t)v7);
  uint64_t v8 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v8 = *(void **)&v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48)];
      uint64_t v11 = sub_23B552030();
      (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v7, v11);
      break;
    case 2u:
      uint64_t v10 = sub_23B552070();
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
      uint64_t v8 = 0;
      break;
    case 3u:
    case 4u:
      return v8;
    default:
      sub_23B54A028((uint64_t)v7, (uint64_t)v4, type metadata accessor for SceneUpdateHandshake);
      uint64_t v8 = *(void **)&v4[*(int *)(updated + 24)];
      id v9 = v8;
      sub_23B54B444((uint64_t)v4, type metadata accessor for SceneUpdateHandshake);
      break;
  }
  return v8;
}

uint64_t AgentToShellMessage.payload.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23B552140();
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  int v35 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23B552070();
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23B552030();
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x270FA5388](updated - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E38);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v32 - v20;
  sub_23B547E10(v1, (uint64_t)v15);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      uint64_t v25 = v33;
      uint64_t v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v33 + 32))(v9, v15, v7);
      MEMORY[0x270FA5388](v26);
      *(&v32 - 2) = (uint64_t)v9;
      sub_23B549EE8();
      sub_23B549FD8(&qword_268A6A158, MEMORY[0x263F61050]);
      sub_23B552130();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
      goto LABEL_6;
    case 2u:
      uint64_t v27 = v34;
      uint64_t v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v34 + 32))(v6, v15, v4);
      MEMORY[0x270FA5388](v28);
      *(&v32 - 2) = (uint64_t)v6;
      sub_23B549EE8();
      sub_23B549FD8(&qword_268A6A150, MEMORY[0x263F61060]);
      sub_23B552130();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
      goto LABEL_6;
    case 3u:
    case 4u:
      uint64_t v23 = v36;
      uint64_t v22 = v37;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v21, 1, 1, v37);
      goto LABEL_7;
    default:
      uint64_t v24 = sub_23B54A028((uint64_t)v15, (uint64_t)v12, type metadata accessor for SceneUpdateHandshake);
      MEMORY[0x270FA5388](v24);
      *(&v32 - 2) = (uint64_t)v12;
      sub_23B552120();
      sub_23B54B444((uint64_t)v12, type metadata accessor for SceneUpdateHandshake);
LABEL_6:
      uint64_t v23 = v36;
      uint64_t v22 = v37;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v19, 0, 1, v37);
      sub_23B549F3C((uint64_t)v19, (uint64_t)v21);
LABEL_7:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v30 = v35;
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v35, v21, v22);
        uint64_t v29 = sub_23B552100();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v30, v22);
      }
      sub_23B544AB4((uint64_t)v21, &qword_268A69E38);
      return v29;
  }
}

uint64_t sub_23B5486B4@<X0>(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return AgentToShellMessage.init(messageType:fenceHandle:payload:)(*a1, a2, a3);
}

uint64_t AgentToShellMessage.init(messageType:fenceHandle:payload:)@<X0>(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v43 = a2;
  uint64_t v38 = a3;
  uint64_t v4 = sub_23B551FE0();
  uint64_t v36 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_23B552030();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for AgentToShellMessage(0);
  uint64_t v9 = MEMORY[0x270FA5388](v40);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v35 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  uint64_t v17 = sub_23B552140();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  uint64_t v42 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B5520F0();
  switch(a1)
  {
    case 1:
      uint64_t v45 = &type metadata for AgentToShellMessage.Key;
      unint64_t v46 = sub_23B549EE8();
      v44[0] = 0;
      sub_23B549FD8(&qword_268A6A158, MEMORY[0x263F61050]);
      uint64_t v23 = v47;
      sub_23B5520E0();
      if (v23) {
        goto LABEL_5;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      v44[0] = 1;
      sub_23B549FD8(&qword_268A6A160, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
      id v30 = v43;
      uint64_t v33 = sub_23B551FC0();

      uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v41);
      *(void *)&v14[v34] = v33;
      swift_storeEnumTagMultiPayload();
      uint64_t v32 = (uint64_t)v14;
      goto LABEL_16;
    case 2:
      v44[0] = 2;
      sub_23B549FD8(&qword_268A6A160, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
      id v25 = v43;
      uint64_t v26 = v47;
      sub_23B551FA0();
      if (!v26) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 3:
      v44[0] = 3;
      sub_23B549FD8(&qword_268A6A160, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
      id v25 = v43;
      uint64_t v27 = v47;
      sub_23B551FA0();
      if (!v27)
      {
LABEL_7:

        (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v41);
        return swift_storeEnumTagMultiPayload();
      }
LABEL_9:

      goto LABEL_12;
    case 4:
      v44[0] = 4;
      sub_23B549FD8(&qword_268A6A160, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
      id v28 = v43;
      uint64_t v29 = v47;
      sub_23B551FA0();
      if (!v29)
      {
        uint64_t v45 = &type metadata for AgentToShellMessage.Key;
        unint64_t v46 = sub_23B549EE8();
        v44[0] = 2;
        sub_23B552070();
        sub_23B549FD8(&qword_268A6A150, MEMORY[0x263F61060]);
        sub_23B5520E0();

        (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v41);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
        swift_storeEnumTagMultiPayload();
        uint64_t v32 = (uint64_t)v11;
        goto LABEL_16;
      }

LABEL_12:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v20, v41);
      break;
    default:
      uint64_t v45 = &type metadata for AgentToShellMessage.Key;
      unint64_t v21 = sub_23B549EE8();
      unint64_t v46 = v21;
      v44[0] = 0;
      sub_23B549FD8(&qword_268A6A158, MEMORY[0x263F61050]);
      uint64_t v22 = v47;
      sub_23B5520E0();
      if (v22)
      {
LABEL_5:

        (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v41);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
        uint64_t v45 = &type metadata for AgentToShellMessage.Key;
        unint64_t v46 = v21;
        v44[0] = 1;
        sub_23B549FD8(&qword_268A69E98, MEMORY[0x263F60FF0]);
        sub_23B5520E0();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v41);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
        (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v16, v8, v39);
        uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v16[*(int *)(updated + 20)], v6, v4);
        *(void *)&v16[*(int *)(updated + 24)] = v43;
        swift_storeEnumTagMultiPayload();
        uint64_t v32 = (uint64_t)v16;
LABEL_16:
        uint64_t result = sub_23B54A028(v32, v38, type metadata accessor for AgentToShellMessage);
      }
      break;
  }
  return result;
}

uint64_t AgentToShellMessage.payloadDescription.getter()
{
  uint64_t v1 = sub_23B552070();
  uint64_t v18 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23B552030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x270FA5388](updated);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B547E10(v0, (uint64_t)v13);
  uint64_t v14 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:

      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v13, v4);
      uint64_t v19 = 0x203A7366657270;
      unint64_t v20 = 0xE700000000000000;
      sub_23B549FD8(&qword_268A6A168, MEMORY[0x263F61050]);
      sub_23B552610();
      sub_23B552400();
      swift_bridgeObjectRelease();
      uint64_t v14 = v19;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      break;
    case 2u:
      uint64_t v15 = v18;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v3, v13, v1);
      uint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
      sub_23B552570();
      sub_23B552400();
      sub_23B5525A0();
      uint64_t v14 = v19;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v3, v1);
      break;
    case 3u:
    case 4u:
      return v14;
    default:
      sub_23B54A028((uint64_t)v13, (uint64_t)v10, type metadata accessor for SceneUpdateHandshake);
      uint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
      sub_23B552570();
      swift_bridgeObjectRelease();
      uint64_t v19 = 0x203A7366657270;
      unint64_t v20 = 0xE700000000000000;
      sub_23B549FD8(&qword_268A6A168, MEMORY[0x263F61050]);
      sub_23B552610();
      sub_23B552400();
      swift_bridgeObjectRelease();
      sub_23B552400();
      sub_23B551FE0();
      sub_23B549FD8(&qword_268A6A170, MEMORY[0x263F60FF0]);
      sub_23B552610();
      sub_23B552400();
      swift_bridgeObjectRelease();
      uint64_t v14 = v19;
      sub_23B54B444((uint64_t)v10, type metadata accessor for SceneUpdateHandshake);
      break;
  }
  return v14;
}

uint64_t sub_23B549420(uint64_t a1)
{
  uint64_t v2 = sub_23B549FD8(&qword_268A6A160, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
  return MEMORY[0x270F56E28](a1, v2);
}

BOOL static ShellToAgentMessage.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ShellToAgentMessage.hash(into:)()
{
  return sub_23B552660();
}

uint64_t ShellToAgentMessage.hashValue.getter()
{
  return sub_23B552670();
}

void sub_23B54950C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ShellToAgentMessage.messageType.getter(char a1)
{
  return a1 & 1;
}

uint64_t sub_23B549520()
{
  return 0;
}

uint64_t ShellToAgentMessage.fenceHandle.getter()
{
  return 0;
}

uint64_t ShellToAgentMessage.payload.getter()
{
  return 0;
}

uint64_t sub_23B549538@<X0>(char *a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23B54A948(*a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

uint64_t ShellToAgentMessage.init(messageType:fenceHandle:payload:)(char a1, void *a2)
{
  return sub_23B54A948(a1 & 1, a2) & 1;
}

uint64_t sub_23B54958C()
{
  return 0;
}

uint64_t ShellToAgentMessage.payloadDescription.getter()
{
  return 0;
}

uint64_t sub_23B5495A4(uint64_t a1)
{
  unint64_t v2 = sub_23B54C61C();
  return MEMORY[0x270F56E28](a1, v2);
}

unint64_t AgentToShellMessage.MessageType.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x5A74736575716572;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x6148657461647075;
      break;
  }
  return result;
}

uint64_t sub_23B5496B4(char a1)
{
  return *(void *)&aPreferenupdate[8 * a1];
}

uint64_t sub_23B5496D4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = AgentToShellMessage.MessageType.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == AgentToShellMessage.MessageType.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_23B552630();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23B549760()
{
  char v1 = *v0;
  sub_23B552650();
  AgentToShellMessage.MessageType.rawValue.getter(v1);
  sub_23B5523F0();
  swift_bridgeObjectRelease();
  return sub_23B552670();
}

uint64_t sub_23B5497C4()
{
  AgentToShellMessage.MessageType.rawValue.getter(*v0);
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B549818()
{
  char v1 = *v0;
  sub_23B552650();
  AgentToShellMessage.MessageType.rawValue.getter(v1);
  sub_23B5523F0();
  swift_bridgeObjectRelease();
  return sub_23B552670();
}

uint64_t sub_23B549878@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s19PreviewsOSSupportUI19AgentToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_23B5498A8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AgentToShellMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B5498D4(char *a1, char *a2)
{
  return sub_23B54660C(*a1, *a2);
}

uint64_t sub_23B5498E0()
{
  return sub_23B5470AC();
}

uint64_t sub_23B5498E8()
{
  return sub_23B547334();
}

uint64_t sub_23B5498F0()
{
  return sub_23B54796C();
}

uint64_t sub_23B5498F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23B54C5D0();
  *a1 = result;
  return result;
}

uint64_t sub_23B549928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23B5496B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23B549954()
{
  return sub_23B5496B4(*v0);
}

uint64_t sub_23B54995C(char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A0D8);
  MEMORY[0x270FA5388](v2 - 8);
  id v43 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A1E8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v41 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A1F0) - 8;
  uint64_t v39 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A1F8);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v44 = (uint64_t)&v36 - v16;
  uint64_t v38 = (char *)&v36 + *(int *)(v12 + 56) - v16;
  uint64_t v17 = v38;
  *((unsigned char *)&v36 - v16) = 0;
  uint64_t v18 = sub_23B552030();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = *(void (**)(unsigned char *, char *, uint64_t))(v19 + 16);
  uint64_t v36 = v18;
  uint64_t v37 = v20;
  v20(v17, a1, v18);
  uint64_t v21 = *(int *)(v6 + 56);
  uint64_t v42 = v10;
  uint64_t v22 = &v10[v21];
  *uint64_t v10 = 1;
  uint64_t v23 = &a1[*(int *)(type metadata accessor for SceneUpdateHandshake(0) + 20)];
  uint64_t v24 = sub_23B551FE0();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v25 + 16);
  v26(v22, (uint64_t)v23, v24);
  uint64_t v27 = &v15[*(int *)(v12 + 56)];
  *uint64_t v15 = 0;
  uint64_t v28 = v36;
  v37(v27, v38, v36);
  uint64_t v29 = (uint64_t)v41;
  (*(void (**)(char *, unsigned char *, uint64_t))(v19 + 32))(v41, v27, v28);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v29, 0, 1, v28);
  char v46 = 0;
  id v30 = v40;
  uint64_t v31 = *(int *)(v39 + 56);
  uint64_t v32 = &v40[v31];
  unsigned char *v40 = 1;
  v26(&v30[v31], (uint64_t)v22, v24);
  uint64_t v33 = (uint64_t)v43;
  (*(void (**)(char *, unsigned char *, uint64_t))(v25 + 32))(v43, v32, v24);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v33, 0, 1, v24);
  char v45 = 1;
  sub_23B549EE8();
  sub_23B549FD8(&qword_268A6A158, MEMORY[0x263F61050]);
  sub_23B549FD8(&qword_268A69E98, MEMORY[0x263F60FF0]);
  uint64_t v34 = sub_23B5521B0();
  sub_23B544AB4(v33, &qword_268A6A0D8);
  sub_23B544AB4(v29, &qword_268A6A1E8);
  sub_23B544AB4((uint64_t)v42, &qword_268A6A1F0);
  sub_23B544AB4(v44, &qword_268A6A1F8);
  return v34;
}

uint64_t sub_23B549DDC(unsigned char *a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(void))
{
  *a1 = a4;
  uint64_t v7 = a5(0);
  uint64_t v10 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, a3, v7);
  uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
  return v8(a2, 0, 1, v7);
}

uint64_t sub_23B549EB4(unsigned char *a1, uint64_t a2)
{
  return sub_23B549DDC(a1, a2, *(void *)(v2 + 16), 2, MEMORY[0x263F61060]);
}

unint64_t sub_23B549EE8()
{
  unint64_t result = qword_268A6A148;
  if (!qword_268A6A148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A148);
  }
  return result;
}

uint64_t sub_23B549F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69E38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B549FA4(unsigned char *a1, uint64_t a2)
{
  return sub_23B549DDC(a1, a2, *(void *)(v2 + 16), 0, MEMORY[0x263F61050]);
}

uint64_t sub_23B549FD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23B54A020()
{
  return sub_23B54995C(*(char **)(v0 + 16));
}

uint64_t sub_23B54A028(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t SceneUpdateHandshake.init(preferences:updateSeed:fenceHandle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
  uint64_t v10 = a4 + *(int *)(updated + 20);
  uint64_t v11 = sub_23B551FE0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  *(void *)(a4 + *(int *)(updated + 24)) = a3;
  return result;
}

PreviewsOSSupportUI::ShellToAgentMessage::MessageType_optional __swiftcall ShellToAgentMessage.MessageType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_23B552600();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = PreviewsOSSupportUI_ShellToAgentMessage_MessageType_requestPreferredSize;
  }
  else {
    v2.value = PreviewsOSSupportUI_ShellToAgentMessage_MessageType_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

unint64_t ShellToAgentMessage.MessageType.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_23B54A1F0(char *a1, char *a2)
{
  return sub_23B546560(*a1, *a2);
}

uint64_t sub_23B54A1FC()
{
  return sub_23B547118();
}

uint64_t sub_23B54A204()
{
  sub_23B5523F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B54A278()
{
  return sub_23B5479D4();
}

uint64_t sub_23B54A280@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_23B552600();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_23B54A2E0(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000014;
  }
  else {
    unint64_t v2 = 0xD000000000000015;
  }
  unint64_t v3 = 0x800000023B554FD0;
  if (*v1) {
    unint64_t v3 = 0x800000023B554FF0;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t SceneUpdateHandshake.preferences.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23B552030();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t SceneUpdateHandshake.updateSeed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 20);
  uint64_t v4 = sub_23B551FE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

void *SceneUpdateHandshake.fenceHandle.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 24));
  id v2 = v1;
  return v1;
}

uint64_t SceneUpdateHandshake.timing.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 24));
  uint64_t v4 = sub_23B551FF0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);
  uint64_t v6 = (unsigned int *)MEMORY[0x263F61010];
  if (v3) {
    uint64_t v6 = (unsigned int *)MEMORY[0x263F61018];
  }
  uint64_t v7 = *v6;
  return v5(a1, v7, v4);
}

uint64_t PreviewPreferences.propertyListValue.getter()
{
  sub_23B552010();
  return sub_23B5520F0();
}

uint64_t PreviewPreferences.init(propertyListValue:)(uint64_t a1)
{
  sub_23B552100();
  sub_23B552000();
  uint64_t v2 = sub_23B552140();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23B54A580()
{
  sub_23B552010();
  return sub_23B5520F0();
}

uint64_t sub_23B54A5B8(uint64_t a1)
{
  sub_23B552100();
  sub_23B552000();
  uint64_t v2 = sub_23B552140();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23B54A638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B549FD8(&qword_268A6A1D8, MEMORY[0x263F61060]);
  uint64_t v5 = MEMORY[0x263F60648];
  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_23B54A6C4()
{
  return sub_23B5521F0();
}

uint64_t sub_23B54A75C()
{
  return sub_23B54A7CC();
}

uint64_t sub_23B54A780()
{
  return sub_23B54A7CC();
}

uint64_t sub_23B54A794()
{
  return sub_23B54A7CC();
}

uint64_t sub_23B54A7A8()
{
  return sub_23B54A7CC();
}

uint64_t sub_23B54A7CC()
{
  return sub_23B552670();
}

uint64_t sub_23B54A81C()
{
  return sub_23B5523F0();
}

uint64_t sub_23B54A840()
{
  return sub_23B5523F0();
}

uint64_t sub_23B54A864()
{
  return sub_23B5523F0();
}

uint64_t sub_23B54A878()
{
  return sub_23B5523F0();
}

uint64_t sub_23B54A88C()
{
  return sub_23B54A8FC();
}

uint64_t sub_23B54A8A0()
{
  return sub_23B54A8FC();
}

uint64_t sub_23B54A8B4()
{
  return sub_23B54A8FC();
}

uint64_t sub_23B54A8D8()
{
  return sub_23B54A8FC();
}

uint64_t sub_23B54A8FC()
{
  return sub_23B552670();
}

uint64_t sub_23B54A948(char a1, void *a2)
{
  return a1 & 1;
}

uint64_t _s19PreviewsOSSupportUI19AgentToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_23B552600();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_23B54AA34()
{
  return sub_23B549FD8(&qword_268A6A178, (void (*)(uint64_t))type metadata accessor for AgentToShellMessage);
}

unint64_t sub_23B54AA80()
{
  unint64_t result = qword_268A6A180;
  if (!qword_268A6A180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A180);
  }
  return result;
}

unint64_t sub_23B54AAD8()
{
  unint64_t result = qword_268A6A188;
  if (!qword_268A6A188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A188);
  }
  return result;
}

unint64_t sub_23B54AB30()
{
  unint64_t result = qword_268A6A190;
  if (!qword_268A6A190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A190);
  }
  return result;
}

unint64_t sub_23B54AB88()
{
  unint64_t result = qword_268A6A198;
  if (!qword_268A6A198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A198);
  }
  return result;
}

unint64_t sub_23B54ABE0()
{
  unint64_t result = qword_268A6A1A0;
  if (!qword_268A6A1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A1A0);
  }
  return result;
}

unint64_t sub_23B54AC38()
{
  unint64_t result = qword_268A6A1A8;
  if (!qword_268A6A1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A1A8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentToShellMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v18 = sub_23B552070();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v18 - 8) + 16))(a1, a2, v18);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v19 = sub_23B552030();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
      uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48);
      uint64_t v21 = *(void **)((char *)a2 + v20);
      *(uint64_t *)((char *)a1 + v20) = (uint64_t)v21;
      id v22 = v21;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_23B552030();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
      uint64_t v10 = *(int *)(updated + 20);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_23B551FE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      uint64_t v14 = *(int *)(updated + 24);
      uint64_t v15 = *(void **)((char *)a2 + v14);
      *(uint64_t *)((char *)a1 + v14) = (uint64_t)v15;
      id v16 = v15;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void destroy for AgentToShellMessage(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_23B552070();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    v9(a1, v8);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_23B552030();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48);
    }
    else
    {
      if (EnumCaseMultiPayload) {
        return;
      }
      uint64_t v3 = sub_23B552030();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
      uint64_t v5 = a1 + *(int *)(updated + 20);
      uint64_t v6 = sub_23B551FE0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
      uint64_t v7 = *(int *)(updated + 24);
    }
    uint64_t v11 = *(void **)(a1 + v7);
  }
}

char *initializeWithCopy for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v16 = sub_23B552070();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v17 = sub_23B552030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
    uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48);
    uint64_t v19 = *(void **)&a2[v18];
    *(void *)&a1[v18] = v19;
    id v20 = v19;
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_23B552030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
    uint64_t v9 = *(int *)(updated + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_23B551FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = *(int *)(updated + 24);
    uint64_t v14 = *(void **)&a2[v13];
    *(void *)&a1[v13] = v14;
    id v15 = v14;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_23B54B444((uint64_t)a1, type metadata accessor for AgentToShellMessage);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v16 = sub_23B552070();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = sub_23B552030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
      uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140) + 48);
      uint64_t v19 = *(void **)&a2[v18];
      *(void *)&a1[v18] = v19;
      id v20 = v19;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_23B552030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
      uint64_t v9 = *(int *)(updated + 20);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = sub_23B551FE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      uint64_t v13 = *(int *)(updated + 24);
      uint64_t v14 = *(void **)&a2[v13];
      *(void *)&a1[v13] = v14;
      id v15 = v14;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23B54B444(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v13 = sub_23B552070();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v14 = sub_23B552030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140);
    *(void *)&a1[*(int *)(v15 + 48)] = *(void *)&a2[*(int *)(v15 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_23B552030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
    uint64_t v9 = *(int *)(updated + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_23B551FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *(void *)&a1[*(int *)(updated + 24)] = *(void *)&a2[*(int *)(updated + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_23B54B444((uint64_t)a1, type metadata accessor for AgentToShellMessage);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v13 = sub_23B552070();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = sub_23B552030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A140);
      *(void *)&a1[*(int *)(v15 + 48)] = *(void *)&a2[*(int *)(v15 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_23B552030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t updated = type metadata accessor for SceneUpdateHandshake(0);
      uint64_t v9 = *(int *)(updated + 20);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = sub_23B551FE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      *(void *)&a1[*(int *)(updated + 24)] = *(void *)&a2[*(int *)(updated + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentToShellMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AgentToShellMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_23B54B8E4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23B54B8F4()
{
  uint64_t result = type metadata accessor for SceneUpdateHandshake(319);
  if (v1 <= 0x3F)
  {
    uint64_t v5 = *(void *)(result - 8) + 64;
    uint64_t result = sub_23B552030();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v6 = &v4;
      uint64_t result = sub_23B552070();
      if (v3 <= 0x3F)
      {
        uint64_t v7 = *(void *)(result - 8) + 64;
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToAgentMessage()
{
  return &type metadata for ShellToAgentMessage;
}

unsigned char *storeEnumTagSinglePayload for AgentToShellMessage.MessageType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x23B54BAECLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AgentToShellMessage.MessageType()
{
  return &type metadata for AgentToShellMessage.MessageType;
}

unsigned char *_s19PreviewsOSSupportUI19ShellToAgentMessageOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23B54BBF0);
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

ValueMetadata *type metadata accessor for ShellToAgentMessage.MessageType()
{
  return &type metadata for ShellToAgentMessage.MessageType;
}

uint64_t *initializeBufferWithCopyOfBuffer for SceneUpdateHandshake(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23B552030();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23B551FE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
    id v14 = v13;
  }
  return a1;
}

void destroy for SceneUpdateHandshake(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t initializeWithCopy for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)(a2 + v11);
  *(void *)(a1 + v11) = v12;
  id v13 = v12;
  return a1;
}

uint64_t assignWithCopy for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)(a1 + v11);
  id v13 = *(void **)(a2 + v11);
  *(void *)(a1 + v11) = v13;
  id v14 = v13;

  return a1;
}

uint64_t initializeWithTake for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B552030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23B551FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);

  return a1;
}

uint64_t getEnumTagSinglePayload for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23B54C160);
}

uint64_t sub_23B54C160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B552030();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23B551FE0();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23B54C294);
}

uint64_t sub_23B54C294(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23B552030();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23B551FE0();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23B54C3A4()
{
  uint64_t result = sub_23B552030();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23B551FE0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AgentToShellMessage.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x23B54C540);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AgentToShellMessage.Key()
{
  return &type metadata for AgentToShellMessage.Key;
}

unint64_t sub_23B54C57C()
{
  unint64_t result = qword_268A6A1D0;
  if (!qword_268A6A1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A1D0);
  }
  return result;
}

uint64_t sub_23B54C5D0()
{
  unint64_t v0 = sub_23B552600();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_23B54C61C()
{
  unint64_t result = qword_268A6A1E0;
  if (!qword_268A6A1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A1E0);
  }
  return result;
}

uint64_t SceneMessenger.send<A>(message:expecting:timeout:)()
{
  return sub_23B552200();
}

uint64_t sub_23B54C714(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a2;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v7 + *MEMORY[0x263F60FE8];
  *(void *)(v8 + 16) = *(void *)v9;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 8);
  *(void *)(v8 + 40) = *(void *)(v9 + 24);
  *(void *)(v8 + 48) = a5;
  *(void *)(v8 + 56) = a1;
  swift_retain();
  sub_23B551FD0();
  return swift_release();
}

uint64_t sub_23B54C80C(uint64_t a1)
{
  return sub_23B54C714(a1, *(uint64_t **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t sub_23B54C818(void *a1, char a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *a3;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a4;
  *(void *)(v16 + 24) = a5;
  *(void *)(v16 + 32) = *(void *)(v15 + *MEMORY[0x263F60608]);
  *(void *)(v16 + 40) = a6;
  *(void *)(v16 + 48) = a7;
  *(void *)(v16 + 56) = a8;
  *(void *)(v16 + 64) = a1;
  *(unsigned char *)(v16 + 72) = a2 & 1;
  sub_23B54D8C0(a1, a2 & 1);
  sub_23B552230();
  return swift_release();
}

uint64_t sub_23B54C918(id a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    return swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
    return sub_23B5521D0();
  }
}

uint64_t SceneMessenger.send(message:timeout:)()
{
  return sub_23B552200();
}

uint64_t sub_23B54CA24()
{
  swift_retain();
  sub_23B551FD0();
  return swift_release();
}

uint64_t sub_23B54CA98()
{
  return sub_23B54CA24();
}

void sub_23B54CAA4(id a1, char a2)
{
  if (a2) {
    id v4 = a1;
  }
  sub_23B552220();
  sub_23B54D7F4(a1, a2 & 1);
}

uint64_t SceneMessageResponder.reply<A>(payload:)()
{
  sub_23B5521C0();
  sub_23B552060();
  return swift_bridgeObjectRelease();
}

void SceneMessageResponder.reply<A>(result:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unsigned int v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A6A200);
  uint64_t v7 = sub_23B552680();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void **)((char *)&v12 - v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v12 - v8, a1, v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = *v9;
    sub_23B552050();
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v4 + 32))(v6, v9, a2);
    sub_23B5521C0();
    sub_23B552060();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
  }
}

uint64_t PreviewPreferences.InterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23B552020();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F61048])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F60810];
LABEL_7:
    uint64_t v11 = *v9;
    uint64_t v12 = sub_23B552080();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
    uint64_t v14 = a1;
    uint64_t v15 = v11;
    return v13(v14, v15, v12);
  }
  int v10 = v8;
  if (v8 == *MEMORY[0x263F61040])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F60808];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x263F61030])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F607F8];
    goto LABEL_7;
  }
  int v17 = *MEMORY[0x263F61038];
  uint64_t v12 = sub_23B552080();
  id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x263F60810], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = *MEMORY[0x263F60800];
  uint64_t v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t PreviewInterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23B552280();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F049A8])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F60810];
LABEL_7:
    uint64_t v11 = *v9;
    uint64_t v12 = sub_23B552080();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
    uint64_t v14 = a1;
    uint64_t v15 = v11;
    return v13(v14, v15, v12);
  }
  int v10 = v8;
  if (v8 == *MEMORY[0x263F049A0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F60808];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x263F04990])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F607F8];
    goto LABEL_7;
  }
  int v17 = *MEMORY[0x263F04998];
  uint64_t v12 = sub_23B552080();
  id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x263F60810], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = *MEMORY[0x263F60800];
  uint64_t v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t PreviewTraits.Orientation.previewPreferencesOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23B552080();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F60810])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F61048];
LABEL_7:
    uint64_t v11 = *v9;
    uint64_t v12 = sub_23B552020();
    id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
    uint64_t v14 = a1;
    uint64_t v15 = v11;
    return v13(v14, v15, v12);
  }
  int v10 = v8;
  if (v8 == *MEMORY[0x263F60808])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F61040];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x263F607F8])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x263F61030];
    goto LABEL_7;
  }
  int v17 = *MEMORY[0x263F60800];
  uint64_t v12 = sub_23B552020();
  id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x263F61048], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = *MEMORY[0x263F61038];
  uint64_t v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t InterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23B552350();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v10 = (char *)&v21 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v21 - v9, v2, v4);
  sub_23B552340();
  sub_23B54D6B0();
  char v11 = sub_23B5523B0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if (v11)
  {
    v12(v10, v4);
  }
  else
  {
    sub_23B552330();
    char v14 = sub_23B5523B0();
    v12(v8, v4);
    if (v14)
    {
      v12(v10, v4);
      id v13 = (unsigned int *)MEMORY[0x263F60808];
      goto LABEL_10;
    }
    sub_23B552310();
    char v15 = sub_23B5523B0();
    v12(v8, v4);
    if (v15)
    {
      v12(v10, v4);
      id v13 = (unsigned int *)MEMORY[0x263F607F8];
      goto LABEL_10;
    }
    sub_23B552320();
    char v16 = sub_23B5523B0();
    v12(v8, v4);
    uint64_t v17 = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    if (v16)
    {
      id v13 = (unsigned int *)MEMORY[0x263F60800];
      goto LABEL_10;
    }
    MEMORY[0x270FA5388](v17);
    sub_23B552180();
  }
  id v13 = (unsigned int *)MEMORY[0x263F60810];
LABEL_10:
  uint64_t v18 = *v13;
  uint64_t v19 = sub_23B552080();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(a1, v18, v19);
}

unint64_t sub_23B54D6B0()
{
  unint64_t result = qword_268A6A208;
  if (!qword_268A6A208)
  {
    sub_23B552350();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A208);
  }
  return result;
}

uint64_t sub_23B54D708()
{
  return 0;
}

uint64_t sub_23B54D7A8()
{
  return sub_23B54D708();
}

uint64_t PreviewSourceContentCategory.contentCategory.getter()
{
  uint64_t v0 = sub_23B5522A0();
  return MEMORY[0x270F563E8](v0);
}

void sub_23B54D7E8(void *a1, char a2)
{
}

void sub_23B54D7F4(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_23B54D800()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23B54D838(void *a1, char a2)
{
  return sub_23B54C818(a1, a2 & 1, *(uint64_t **)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_23B54D84C()
{
  sub_23B54D888(*(id *)(v0 + 64), *(unsigned char *)(v0 + 72));
  return MEMORY[0x270FA0238](v0, 73, 7);
}

void sub_23B54D888(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B54D894()
{
  return sub_23B54C918(*(id *)(v0 + 64), *(unsigned char *)(v0 + 72));
}

id sub_23B54D8C0(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t PreviewViewShim.body.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23B54D8D8(v1, a1);
}

uint64_t sub_23B54D8D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t PreviewViewShim.init<A>(body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);
  return v7(boxed_opaque_existential_1, a1, a2);
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

uint64_t Preview.init<A>(with:_:traits:body:arguments:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void (*a6)(uint64_t)@<X6>, uint64_t a7@<X8>, uint64_t a8)
{
  uint64_t v22 = a4;
  uint64_t v23 = a7;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v24 = a1;
  uint64_t v10 = sub_23B5522B0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_23B552270();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A210);
  MEMORY[0x270FA5388](v15);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F04980], v11);
  sub_23B552290();
  uint64_t v16 = sub_23B552250();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  a6(v17);
  uint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = v22;
  v18[2] = a8;
  v18[3] = v19;
  v18[4] = a5;
  swift_retain();
  sub_23B552260();
  sub_23B5522C0();
  sub_23B54DDF0();
  sub_23B5522D0();
  return swift_release();
}

uint64_t sub_23B54DC98@<X0>(void (*a1)(void *__return_ptr)@<X1>, uint64_t a2@<X8>)
{
  a1(v11);
  long long v10 = v12;
  uint64_t v3 = v12;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  *(_OWORD *)(a2 + 24) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a2);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_1, v7, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_23B54DDAC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23B54DDE4@<X0>(uint64_t a1@<X8>)
{
  return sub_23B54DC98(*(void (**)(void *__return_ptr))(v1 + 24), a1);
}

unint64_t sub_23B54DDF0()
{
  unint64_t result = qword_268A6A218;
  if (!qword_268A6A218)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A6A210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A6A218);
  }
  return result;
}

uint64_t initializeWithCopy for PreviewViewShim(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for PreviewViewShim(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
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
        *long long v3 = v12;
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
          *long long v3 = *a2;
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

uint64_t assignWithTake for PreviewViewShim(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewViewShim(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewViewShim(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewViewShim()
{
  return &type metadata for PreviewViewShim;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

double static CGAffineTransform.transform(from:to:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_23B54E2FC(a1, a2, (double *)v6);
  long long v4 = v6[1];
  *a3 = v6[0];
  a3[1] = v4;
  double result = *(double *)&v7;
  a3[2] = v7;
  return result;
}

void CGAffineTransform.integralTransform.getter(double *a1@<X8>)
{
  double v3 = CGRound(*v1);
  double v4 = CGRound(v1[1]);
  double v5 = CGRound(v1[2]);
  double v6 = CGRound(v1[3]);
  double v7 = CGRound(v1[4]);
  double v8 = CGRound(v1[5]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
}

void sub_23B54E2FC(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  if (a1 == a2)
  {
    double v4 = 0.0;
    double v5 = 1.0;
    double v6 = 0.0;
    double v7 = 1.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  else
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v16, v10);
    double b = v16.b;
    double c = v16.c;
    double d = v16.d;
    double tx = v16.tx;
    double ty = v16.ty;
    double v5 = CGRound(v16.a);
    double v4 = CGRound(b);
    double v6 = CGRound(c);
    double v7 = CGRound(d);
    double v8 = CGRound(tx);
    double v9 = CGRound(ty);
  }
  *a3 = v5;
  a3[1] = v4;
  a3[2] = v6;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
}

double CGRound(double a1)
{
  return round(a1);
}

id CounterRotationViewController.contentView.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView);
}

uint64_t CounterRotationViewController.contentOrientation.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation);
}

id CounterRotationViewController.__allocating_init(contentView:contentOrientation:)(uint64_t a1, uint64_t a2)
{
  double v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView] = a1;
  *(void *)&v5[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

id CounterRotationViewController.init(contentView:contentOrientation:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView] = a1;
  *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

Swift::Void __swiftcall CounterRotationViewController.viewDidLoad()()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    unint64_t v2 = v1;
    objc_msgSend(v1, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView]);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall CounterRotationViewController.viewWillLayoutSubviews()()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewWillLayoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    objc_super v3 = v2;
    objc_msgSend(v2, sel_bounds);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
}

id sub_23B54E808()
{
  id v1 = objc_msgSend(v0, sel_containerView);
  self;
  id v2 = (id)swift_dynamicCastObjCClass();
  if (!v2)
  {

    id v3 = objc_msgSend(v0, sel_containerView);
    id v2 = objc_msgSend(v3, sel_window);
  }
  return v2;
}

void sub_23B54E8A4(uint64_t a1, char *a2, _OWORD *a3)
{
  double v4 = *(void **)&a2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  long long v5 = a3[1];
  v10[0] = *a3;
  v10[1] = v5;
  v10[2] = a3[2];
  objc_msgSend(v4, sel_setTransform_, v10);
  id v6 = objc_msgSend(a2, sel_view);
  if (v6)
  {
    double v7 = v6;
    objc_msgSend(v6, sel_setNeedsLayout);

    id v8 = objc_msgSend(a2, sel_view);
    if (v8)
    {
      double v9 = v8;
      objc_msgSend(v8, sel_layoutIfNeeded);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_23B54E964(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id CounterRotationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_23B5523C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CounterRotationViewController.init(nibName:bundle:)()
{
}

id CounterRotationViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s19PreviewsOSSupportUI29CounterRotationViewControllerC18viewWillTransition2to4withySo6CGSizeV_So06UIViewgJ11Coordinator_ptF_0(void *a1)
{
  objc_super v2 = v1;
  swift_getObjectType();
  id v4 = sub_23B54E808();
  if (v4)
  {
    long long v5 = v4;
    id v6 = objc_msgSend(v4, sel_windowScene);

    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_interfaceOrientation);

      sub_23B54E2FC((uint64_t)v7, *(void *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation], (double *)&v21);
      long long v8 = v21;
      long long v9 = v22;
      long long v10 = v23;
      if (objc_msgSend(a1, sel_isAnimated))
      {
        uint64_t v11 = swift_allocObject();
        long long v12 = v22;
        *(_OWORD *)(v11 + 24) = v21;
        *(void *)(v11 + 16) = v2;
        *(_OWORD *)(v11 + 40) = v12;
        *(_OWORD *)(v11 + 56) = v23;
        *(void *)&long long v20 = sub_23B54EDC4;
        *((void *)&v20 + 1) = v11;
        *(void *)&long long v18 = MEMORY[0x263EF8330];
        *((void *)&v18 + 1) = 1107296256;
        *(void *)&long long v19 = sub_23B54E964;
        *((void *)&v19 + 1) = &block_descriptor_2;
        uint64_t v13 = _Block_copy(&v18);
        char v14 = v2;
        swift_release();
        objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v13, 0);
        _Block_release(v13);
      }
      else
      {
        uint64_t v15 = *(void **)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
        long long v18 = v8;
        long long v19 = v9;
        long long v20 = v10;
        objc_msgSend(v15, sel_setTransform_, &v18);
        id v16 = objc_msgSend(v2, sel_view);
        if (v16)
        {
          uint64_t v17 = v16;
          objc_msgSend(v16, sel_setNeedsLayout);
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

uint64_t type metadata accessor for CounterRotationViewController()
{
  return self;
}

uint64_t method lookup function for CounterRotationViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CounterRotationViewController);
}

uint64_t dispatch thunk of CounterRotationViewController.__allocating_init(contentView:contentOrientation:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_23B54ED8C()
{
  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_23B54EDC4(uint64_t a1)
{
  sub_23B54E8A4(a1, *(char **)(v1 + 16), (_OWORD *)(v1 + 24));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23B54EDE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23B5524C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B5524B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23B551E38(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B552470();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_23B54EF8C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UVAgentSceneRegistry()), sel_init);
  qword_268A6A230 = (uint64_t)result;
  return result;
}

id UVAgentSceneRegistry.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static UVAgentSceneRegistry.shared.getter()
{
  if (qword_268A69C30 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_268A6A230;
  return v0;
}

uint64_t static UVAgentSceneRegistry.deliverScene(_:forIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D38);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23B5524C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_23B5524A0();
  id v12 = a1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_23B552490();
  char v14 = (void *)swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v4;
  v14[5] = v12;
  v14[6] = a2;
  v14[7] = a3;
  sub_23B54EDE8((uint64_t)v10, (uint64_t)&unk_268A6A240, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_23B54F190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a5;
  sub_23B5524A0();
  v7[5] = sub_23B552490();
  uint64_t v9 = sub_23B552470();
  return MEMORY[0x270FA2498](sub_23B54F22C, v9, v8);
}

uint64_t sub_23B54F22C()
{
  swift_release();
  if (qword_268A69C30 != -1) {
    swift_once();
  }
  sub_23B54F3A8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23B54F2D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  long long v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *long long v10 = v2;
  v10[1] = sub_23B551F9C;
  return sub_23B54F190(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_23B54F3A8(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_23B552300();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)v40 - v13;
  uint64_t v15 = (uint64_t *)((char *)v3 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers);
  swift_beginAccess();
  uint64_t v16 = *v15;
  if (*(void *)(*v15 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_23B550918(a2, a3);
    if (v18)
    {
      uint64_t v19 = a2;
      uint64_t v20 = *(void *)(v16 + 56) + 16 * v17;
      uint64_t v21 = *(void *)(v20 + 8);
      uint64_t v42 = *(void (**)(uint64_t *))v20;
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      sub_23B5522E0();
      swift_bridgeObjectRetain_n();
      long long v22 = sub_23B5522F0();
      os_log_type_t v23 = sub_23B5524D0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v44 = v8;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v43 = v9;
        uint64_t v25 = (uint8_t *)v24;
        uint64_t v26 = swift_slowAlloc();
        uint64_t v41 = a1;
        uint64_t v27 = v26;
        v46[0] = v26;
        v40[1] = v21;
        *(_DWORD *)uint64_t v25 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_23B5502C0(v19, a3, v46);
        sub_23B552520();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23B530000, v22, v23, "UVAgentSceneRegistry received scene for %{public}s; will fulfill stored request",
          v25,
          0xCu);
        swift_arrayDestroy();
        uint64_t v28 = v27;
        a1 = v41;
        MEMORY[0x23ECC75F0](v28, -1, -1);
        MEMORY[0x23ECC75F0](v25, -1, -1);

        (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v44);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_23B550A8C(v19, a3);
      swift_endAccess();
      swift_bridgeObjectRelease();
      sub_23B551F88(v39);
      v46[0] = (uint64_t)a1;
      v42(v46);
      return swift_release();
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_23B5522E0();
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_23B5522F0();
  os_log_type_t v30 = sub_23B5524D0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v44 = v8;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v42 = v4;
    uint64_t v33 = v32;
    v46[0] = v32;
    uint64_t v43 = v9;
    *(_DWORD *)uint64_t v31 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_23B5502C0(a2, a3, v46);
    sub_23B552520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B530000, v29, v30, "UVAgentSceneRegistry received scene for %{public}s; no request yet, will store scene",
      v31,
      0xCu);
    swift_arrayDestroy();
    uint64_t v34 = v33;
    uint64_t v4 = v42;
    MEMORY[0x23ECC75F0](v34, -1, -1);
    MEMORY[0x23ECC75F0](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  uint64_t v35 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v36 = a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v45 = *v35;
  uint64_t *v35 = 0x8000000000000000;
  sub_23B551540((uint64_t)v36, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v35 = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

void UVAgentSceneRegistry.requestScene(for:handler:)(uint64_t a1, unint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v9 = sub_23B552300();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v41 - v14;
  char v46 = v4;
  uint64_t v16 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes);
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (*(void *)(*v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_23B550918(a1, a2);
    if (v19)
    {
      uint64_t v44 = v10;
      uint64_t v45 = v9;
      uint64_t v20 = a1;
      uint64_t v21 = *(void **)(*(void *)(v17 + 56) + 8 * v18);
      swift_endAccess();
      id v22 = v21;
      swift_bridgeObjectRelease();
      sub_23B5522E0();
      swift_bridgeObjectRetain_n();
      os_log_type_t v23 = sub_23B5522F0();
      os_log_type_t v24 = sub_23B5524D0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v43 = a4;
        uint64_t v25 = swift_slowAlloc();
        char v46 = a3;
        uint64_t v26 = (uint8_t *)v25;
        uint64_t v27 = swift_slowAlloc();
        id v42 = v22;
        uint64_t v28 = v27;
        v48[0] = v27;
        *(_DWORD *)uint64_t v26 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_23B5502C0(v20, a2, v48);
        sub_23B552520();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23B530000, v23, v24, "UVAgentSceneRegistry request for %{public}s; will fulfill with stored scene",
          v26,
          0xCu);
        swift_arrayDestroy();
        uint64_t v29 = v28;
        id v22 = v42;
        MEMORY[0x23ECC75F0](v29, -1, -1);
        os_log_type_t v30 = v26;
        a3 = v46;
        MEMORY[0x23ECC75F0](v30, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v45);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v40 = (void *)sub_23B5509BC(v20, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();

      a3(v22);
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_23B5522E0();
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_23B5522F0();
  os_log_type_t v32 = sub_23B5524D0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v43 = a4;
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v45 = v9;
    uint64_t v35 = v34;
    v48[0] = v34;
    uint64_t v44 = v10;
    *(_DWORD *)uint64_t v33 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_23B5502C0(a1, a2, v48);
    a4 = v43;
    sub_23B552520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B530000, v31, v32, "UVAgentSceneRegistry request for %{public}s; no scene yet, will store request",
      v33,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECC75F0](v35, -1, -1);
    MEMORY[0x23ECC75F0](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v13, v45);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  id v36 = v46;
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = a3;
  *(void *)(v37 + 24) = a4;
  uint64_t v38 = (uint64_t *)((char *)v36 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v47 = *v38;
  uint64_t *v38 = 0x8000000000000000;
  sub_23B5516B0((uint64_t)sub_23B550990, v37, a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t *v38 = v47;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

id UVAgentSceneRegistry.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = MEMORY[0x263F8EE80];
  *(void *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes] = MEMORY[0x263F8EE80];
  *(void *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers] = v2;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

id UVAgentSceneRegistry.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23B5500EC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *objc_super v4 = v2;
  v4[1] = sub_23B5501C8;
  return v6(a1);
}

uint64_t sub_23B5501C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23B5502C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23B550394(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23B551DD8((uint64_t)v12, *a3);
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
      sub_23B551DD8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23B550394(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B552530();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23B550550(a5, a6);
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
  uint64_t v8 = sub_23B552590();
  if (!v8)
  {
    sub_23B5525B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23B5525F0();
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

uint64_t sub_23B550550(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23B5505E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23B5507C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23B5507C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B5505E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23B550760(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23B552580();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23B5525B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23B552410();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23B5525F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23B5525B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23B550760(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A268);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B5507C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A268);
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
  uint64_t result = sub_23B5525F0();
  __break(1u);
  return result;
}

unint64_t sub_23B550918(uint64_t a1, uint64_t a2)
{
  sub_23B552650();
  sub_23B5523F0();
  uint64_t v4 = sub_23B552670();
  return sub_23B55197C(a1, a2, v4);
}

uint64_t sub_23B550990(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_23B5509BC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_23B550918(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23B551A60();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_23B551190(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23B550A8C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_23B550918(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23B551C14();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_23B551368(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23B550B74(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A260);
  char v38 = a2;
  uint64_t v6 = sub_23B5525E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    os_log_type_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_23B552650();
    sub_23B5523F0();
    uint64_t result = sub_23B552670();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_23B550E84(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A270);
  char v6 = a2;
  uint64_t v7 = sub_23B5525E0();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_23B552650();
      sub_23B5523F0();
      uint64_t result = sub_23B552670();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      unint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v8;
  return result;
}

unint64_t sub_23B551190(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_23B552560();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_23B552650();
        swift_bridgeObjectRetain();
        sub_23B5523F0();
        uint64_t v9 = sub_23B552670();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23B551368(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_23B552560();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_23B552650();
        swift_bridgeObjectRetain();
        sub_23B5523F0();
        uint64_t v9 = sub_23B552670();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_23B551540(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_23B550918(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23B551A60();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_23B550B74(v15, a4 & 1);
  unint64_t v20 = sub_23B550918(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_23B552640();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_23B5516B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_23B550918(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_23B551C14();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      char v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_release();
      *char v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_23B550E84(v17, a5 & 1);
  unint64_t v23 = sub_23B550918(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_23B552640();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  *char v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for UVAgentSceneRegistry()
{
  return self;
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23B5518A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_23B535054;
  return sub_23B54F190(a1, v4, v5, v6, v7, v9, v8);
}

unint64_t sub_23B55197C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23B552630() & 1) == 0)
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
      while (!v14 && (sub_23B552630() & 1) == 0);
    }
  }
  return v6;
}

id sub_23B551A60()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A260);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23B5525D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23B551C14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A6A270);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23B5525D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23B551DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B551E38(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A69D38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B551E98()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23B551ED0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23B535054;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268A6A278 + dword_268A6A278);
  return v6(a1, v4);
}

uint64_t sub_23B551F88(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23B551FA0()
{
  return MEMORY[0x270F56E20]();
}

uint64_t sub_23B551FC0()
{
  return MEMORY[0x270F56E30]();
}

uint64_t sub_23B551FD0()
{
  return MEMORY[0x270F56E50]();
}

uint64_t sub_23B551FE0()
{
  return MEMORY[0x270F56E60]();
}

uint64_t sub_23B551FF0()
{
  return MEMORY[0x270F56E70]();
}

uint64_t sub_23B552000()
{
  return MEMORY[0x270F56E80]();
}

uint64_t sub_23B552010()
{
  return MEMORY[0x270F56E88]();
}

uint64_t sub_23B552020()
{
  return MEMORY[0x270F56E90]();
}

uint64_t sub_23B552030()
{
  return MEMORY[0x270F56EA0]();
}

uint64_t sub_23B552040()
{
  return MEMORY[0x270F56EA8]();
}

uint64_t sub_23B552050()
{
  return MEMORY[0x270F56EB0]();
}

uint64_t sub_23B552060()
{
  return MEMORY[0x270F56EB8]();
}

uint64_t sub_23B552070()
{
  return MEMORY[0x270F56EC8]();
}

uint64_t sub_23B552080()
{
  return MEMORY[0x270F56240]();
}

uint64_t sub_23B552090()
{
  return MEMORY[0x270F562C8]();
}

uint64_t sub_23B5520B0()
{
  return MEMORY[0x270F56520]();
}

uint64_t sub_23B5520C0()
{
  return MEMORY[0x270F56650]();
}

uint64_t sub_23B5520D0()
{
  return MEMORY[0x270F55820]();
}

uint64_t sub_23B5520E0()
{
  return MEMORY[0x270F55828]();
}

uint64_t sub_23B5520F0()
{
  return MEMORY[0x270F55840]();
}

uint64_t sub_23B552100()
{
  return MEMORY[0x270F55848]();
}

uint64_t sub_23B552110()
{
  return MEMORY[0x270F55850]();
}

uint64_t sub_23B552120()
{
  return MEMORY[0x270F55860]();
}

uint64_t sub_23B552130()
{
  return MEMORY[0x270F55870]();
}

uint64_t sub_23B552140()
{
  return MEMORY[0x270F55880]();
}

uint64_t sub_23B552150()
{
  return MEMORY[0x270F558A8]();
}

uint64_t sub_23B552160()
{
  return MEMORY[0x270F558B8]();
}

uint64_t sub_23B552170()
{
  return MEMORY[0x270F558C0]();
}

uint64_t sub_23B552180()
{
  return MEMORY[0x270F559E0]();
}

uint64_t sub_23B552190()
{
  return MEMORY[0x270F55AF8]();
}

uint64_t sub_23B5521A0()
{
  return MEMORY[0x270F55B08]();
}

uint64_t sub_23B5521B0()
{
  return MEMORY[0x270F55B10]();
}

uint64_t sub_23B5521C0()
{
  return MEMORY[0x270F55C58]();
}

uint64_t sub_23B5521D0()
{
  return MEMORY[0x270F55C60]();
}

uint64_t sub_23B5521F0()
{
  return MEMORY[0x270F55C70]();
}

uint64_t sub_23B552200()
{
  return MEMORY[0x270F55D78]();
}

uint64_t sub_23B552210()
{
  return MEMORY[0x270F55DB8]();
}

uint64_t sub_23B552220()
{
  return MEMORY[0x270F55DD0]();
}

uint64_t sub_23B552230()
{
  return MEMORY[0x270F55DD8]();
}

uint64_t sub_23B552240()
{
  return MEMORY[0x270F55DF8]();
}

uint64_t sub_23B552250()
{
  return MEMORY[0x270EEB250]();
}

uint64_t sub_23B552260()
{
  return MEMORY[0x270EEB2A8]();
}

uint64_t sub_23B552270()
{
  return MEMORY[0x270EEB308]();
}

uint64_t sub_23B552280()
{
  return MEMORY[0x270EEB310]();
}

uint64_t sub_23B552290()
{
  return MEMORY[0x270EFEB38]();
}

uint64_t sub_23B5522A0()
{
  return MEMORY[0x270EEB318]();
}

uint64_t sub_23B5522B0()
{
  return MEMORY[0x270EEB320]();
}

uint64_t sub_23B5522C0()
{
  return MEMORY[0x270EEB330]();
}

uint64_t sub_23B5522D0()
{
  return MEMORY[0x270EEB338]();
}

uint64_t sub_23B5522E0()
{
  return MEMORY[0x270F55E58]();
}

uint64_t sub_23B5522F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23B552300()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23B552310()
{
  return MEMORY[0x270F018B0]();
}

uint64_t sub_23B552320()
{
  return MEMORY[0x270F018B8]();
}

uint64_t sub_23B552330()
{
  return MEMORY[0x270F018C0]();
}

uint64_t sub_23B552340()
{
  return MEMORY[0x270F018C8]();
}

uint64_t sub_23B552350()
{
  return MEMORY[0x270F018D0]();
}

uint64_t sub_23B552360()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23B552370()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_23B552380()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23B552390()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23B5523A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23B5523B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23B5523C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23B5523D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23B5523E0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23B5523F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23B552400()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23B552410()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23B552420()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23B552430()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23B552440()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23B552450()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23B552460()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23B552470()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23B552480()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23B552490()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23B5524A0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23B5524B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23B5524C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23B5524D0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23B5524E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23B5524F0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_23B552500()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23B552510()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23B552520()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23B552530()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23B552540()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23B552550()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23B552560()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23B552570()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23B552580()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23B552590()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23B5525A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23B5525B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23B5525C0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23B5525D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23B5525E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23B5525F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23B552600()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23B552610()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23B552630()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23B552640()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23B552650()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23B552660()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23B552670()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23B552680()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x270F106F8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t UVLog()
{
  return MEMORY[0x270F56E18]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}