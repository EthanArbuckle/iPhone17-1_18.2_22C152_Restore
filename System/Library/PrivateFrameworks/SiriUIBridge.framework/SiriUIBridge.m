void type metadata accessor for SUIBAttendingStartReason(uint64_t a1)
{
  sub_25DD96334(a1, &qword_26A6C75E0);
}

void type metadata accessor for SUIBAttendingStopReason(uint64_t a1)
{
}

void type metadata accessor for AFUIBridgeAttendingStopReason(uint64_t a1)
{
}

void type metadata accessor for SUIBMitigationResult(uint64_t a1)
{
}

void sub_25DD96334(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t static IntelligenceFlowActionSummaryParameterMatcher.matches(in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76C0);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  sub_25DDAC430();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76C8);
  sub_25DD96514();
  sub_25DD96B10(&qword_26A6C76D8, &qword_26A6C76C0);
  uint64_t v9 = sub_25DDACA50();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v4);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25DD965A8(v9, a1, a2);
  swift_bridgeObjectRelease();
  return v10;
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

unint64_t sub_25DD96514()
{
  unint64_t result = qword_26A6C76D0;
  if (!qword_26A6C76D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C76D0);
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

uint64_t sub_25DD965A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7738);
  MEMORY[0x270FA5388]();
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76E8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    v20[1] = v3;
    uint64_t v25 = MEMORY[0x263F8EE78];
    v23 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25DDACC40();
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v13 = v10 + 16;
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v24 = v13;
    uint64_t v21 = *(void *)(v13 + 56);
    v22 = v14;
    do
    {
      uint64_t v16 = (uint64_t)v23;
      v22(v23, v15, v9);
      swift_bridgeObjectRetain();
      sub_25DDAC440();
      id v17 = objc_allocWithZone((Class)type metadata accessor for BridgedMatch());
      sub_25DD968E4(v16, a2, a3, (uint64_t)v8);
      sub_25DDACC20();
      sub_25DDACC50();
      sub_25DDACC60();
      sub_25DDACC30();
      v15 += v21;
      --v12;
    }
    while (v12);
    uint64_t v18 = v25;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v18;
}

id IntelligenceFlowActionSummaryParameterMatcher.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher()
{
  return self;
}

id IntelligenceFlowActionSummaryParameterMatcher.__deallocating_deinit(uint64_t a1)
{
  return sub_25DD96D44(a1, type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher);
}

id sub_25DD968E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = &v4[OBJC_IVAR___SUIBBridgedMatch_match];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76E8);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v9, a1, v10);
  uint64_t v14 = &v4[OBJC_IVAR___SUIBBridgedMatch_originalString];
  *(void *)uint64_t v14 = a2;
  *((void *)v14 + 1) = a3;
  uint64_t v15 = &v4[OBJC_IVAR___SUIBBridgedMatch_captureReference];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7738);
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a4, v16);
  v20.receiver = v4;
  v20.super_class = (Class)type metadata accessor for BridgedMatch();
  id v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a4, v16);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v10);
  return v18;
}

uint64_t sub_25DD96A50()
{
  return sub_25DDACBA0();
}

uint64_t sub_25DD96B10(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25DD96B54()
{
  unint64_t result = qword_26A6C7708;
  if (!qword_26A6C7708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7708);
  }
  return result;
}

uint64_t sub_25DD96BE4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C76E8);
  sub_25DDAC920();
  return v1;
}

id BridgedMatch.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BridgedMatch.init()()
{
}

id BridgedMatch.__deallocating_deinit()
{
  return sub_25DD96D44(0, type metadata accessor for BridgedMatch);
}

id sub_25DD96D44(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for BridgedMatch()
{
  uint64_t result = qword_26A6C7718;
  if (!qword_26A6C7718) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD96E94()
{
  return type metadata accessor for BridgedMatch();
}

void sub_25DD96E9C()
{
  sub_25DD96FF0();
  if (v0 <= 0x3F)
  {
    sub_25DD9704C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for BridgedMatch(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BridgedMatch);
}

uint64_t dispatch thunk of BridgedMatch.range()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of BridgedMatch.captured()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

void sub_25DD96FF0()
{
  if (!qword_26A6C7728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C76C8);
    unint64_t v0 = sub_25DDAC940();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6C7728);
    }
  }
}

void sub_25DD9704C()
{
  if (!qword_26A6C7730)
  {
    unint64_t v0 = sub_25DDAC420();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6C7730);
    }
  }
}

void sub_25DD970B8()
{
  qword_26B380630 = 0x6567646972424955;
  *(void *)algn_26B380638 = 0xE800000000000000;
}

uint64_t sub_25DD970DC()
{
  uint64_t v0 = sub_25DDAC9E0();
  __swift_allocate_value_buffer(v0, qword_26B380680);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B380680);
  sub_25DD97830();
  if (qword_26B380310 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_25DDACBB0();
  return sub_25DDAC9F0();
}

void sub_25DD971A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    sub_25DD975D8(a1, a2, a3, a5, a6);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, void, void, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
  }
}

void sub_25DD97228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12 = *(void (**)(uint64_t))(a10 + 8);
  uint64_t v13 = OUTLINED_FUNCTION_0_0();
  v12(v13);
  sub_25DDAC9A0();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_25DDACB80();
    uint64_t v17 = OUTLINED_FUNCTION_0_0();
    id v19 = (id)((uint64_t (*)(uint64_t))v12)(v17);
    OUTLINED_FUNCTION_2();
    sub_25DDAC990();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_25DDACB80();
    uint64_t v14 = OUTLINED_FUNCTION_0_0();
    uint64_t v15 = (void *)((uint64_t (*)(uint64_t))v12)(v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7740);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25DDADCC0;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_25DD976D4();
    *(void *)(v16 + 32) = a7;
    *(void *)(v16 + 40) = a8;
    OUTLINED_FUNCTION_2();
    sub_25DDAC980();

    swift_bridgeObjectRelease();
  }
}

void sub_25DD973E0()
{
}

void static SignpostLogger.end(_:_:)()
{
  sub_25DDACB70();
  uint64_t v0 = OUTLINED_FUNCTION_1();
  id v2 = (id)v1(v0);
  sub_25DDAC990();
}

uint64_t sub_25DD97498()
{
  return static SignpostLogger.event(_:)();
}

uint64_t static SignpostLogger.event(_:)()
{
  uint64_t v0 = sub_25DDAC9C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDACB90();
  uint64_t v4 = OUTLINED_FUNCTION_1();
  uint64_t v6 = (void *)v5(v4);
  sub_25DDAC9B0();
  sub_25DDAC990();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_25DD975D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_25DDAC9A0();
  sub_25DDACB80();
  id v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_25DDAC980();
}

unint64_t sub_25DD976D4()
{
  unint64_t result = qword_26A6C7748;
  if (!qword_26A6C7748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7748);
  }
  return result;
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25DD97830()
{
  unint64_t result = qword_26B3805B8;
  if (!qword_26B3805B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B3805B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t UIBridge.__allocating_init(_:_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  return UIBridge.init(_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t UIBridge.init(_:_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  uint64_t v8 = v7;
  v27[0] = a5;
  v27[1] = a1;
  v27[2] = a2;
  uint64_t v12 = sub_25DDAC9E0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD989F0(a3, (uint64_t)v30);
  id v18 = objc_allocWithZone((Class)type metadata accessor for UIBridgeService());
  swift_retain();
  id v19 = a7;
  swift_unknownObjectRetain();
  sub_25DD9B310();
  *(void *)(v8 + qword_26B380338) = v20;
  swift_release();
  sub_25DD989F0(a3, (uint64_t)v30);
  uint64_t v28 = a6;
  sub_25DD989F0(a6, (uint64_t)v29);
  uint64_t v21 = qword_26B380558;
  id v22 = v19;
  swift_unknownObjectRetain();
  id v23 = v27[0];
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v12, (uint64_t)qword_26B380680);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v24, v12);
  uint64_t v25 = sub_25DDAC970();
  swift_retain();
  sub_25DD97B34();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v28);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v25;
}

uint64_t sub_25DD97B34()
{
  sub_25DDAC4B0();
  sub_25DDAC950();
  sub_25DDAC490();
  sub_25DDAC950();
  sub_25DDAC510();
  sub_25DDAC950();
  sub_25DDAC4A0();
  sub_25DDAC950();
  sub_25DDAC450();
  sub_25DDAC950();
  sub_25DDAC640();
  sub_25DDAC950();
  sub_25DDAC660();
  sub_25DDAC950();
  sub_25DDAC890();
  sub_25DDAC950();
  sub_25DDAC550();
  sub_25DDAC950();
  sub_25DDAC680();
  sub_25DDAC950();
  sub_25DDAC6B0();
  sub_25DDAC950();
  sub_25DDAC4F0();
  sub_25DDAC950();
  sub_25DDAC4D0();
  sub_25DDAC950();
  sub_25DDAC7C0();
  sub_25DDAC950();
  sub_25DDAC6A0();
  sub_25DDAC950();
  sub_25DDAC7B0();
  sub_25DDAC950();
  sub_25DDAC770();
  sub_25DDAC950();
  sub_25DDAC540();
  sub_25DDAC950();
  sub_25DDAC480();
  return sub_25DDAC950();
}

uint64_t (*sub_25DD97E4C())()
{
  return sub_25DD98C38;
}

uint64_t (*sub_25DD97E90())()
{
  return sub_25DD98C34;
}

void (*sub_25DD97ED4())()
{
  return sub_25DD98C2C;
}

void sub_25DD97F14()
{
}

void (*sub_25DD97F44())()
{
  return sub_25DD98C24;
}

void sub_25DD97F84()
{
}

void (*sub_25DD97FB4())()
{
  return sub_25DD98C1C;
}

void sub_25DD97FF4()
{
}

void (*sub_25DD98024())()
{
  return sub_25DD98C14;
}

void sub_25DD98064()
{
}

void (*sub_25DD98094())()
{
  return sub_25DD98C0C;
}

void sub_25DD980D4()
{
}

void (*sub_25DD98104())()
{
  return sub_25DD98C04;
}

void sub_25DD98144()
{
}

void (*sub_25DD98174())()
{
  return sub_25DD98BFC;
}

void sub_25DD981B4()
{
}

void (*sub_25DD981E4())()
{
  return sub_25DD98BF4;
}

void sub_25DD98224()
{
}

void (*sub_25DD98254())()
{
  return sub_25DD98BEC;
}

void sub_25DD98294()
{
}

void (*sub_25DD982C4())()
{
  return sub_25DD98BE4;
}

void sub_25DD98304()
{
}

void (*sub_25DD98334())()
{
  return sub_25DD98BDC;
}

void sub_25DD98374()
{
}

void (*sub_25DD983A4())()
{
  return sub_25DD98BD4;
}

void sub_25DD983E4()
{
}

void (*sub_25DD98414())()
{
  return sub_25DD98BCC;
}

void sub_25DD98454()
{
}

void (*sub_25DD98484())()
{
  return sub_25DD98BC4;
}

void sub_25DD984C4()
{
}

void (*sub_25DD984F4())()
{
  return sub_25DD98BBC;
}

void sub_25DD98534()
{
}

void (*sub_25DD98564())()
{
  return sub_25DD98BB4;
}

void sub_25DD985A4()
{
}

void (*sub_25DD985D4())()
{
  return sub_25DD98BAC;
}

void sub_25DD98614()
{
}

uint64_t sub_25DD98644(void *a1)
{
  return sub_25DD98684(a1, "Handling SessionStartedMessage for session id: %s", (uint64_t (*)(void))sub_25DD9B614);
}

uint64_t sub_25DD98664(void *a1)
{
  return sub_25DD98684(a1, "Handling SessionEndedMessage for session id: %s", (uint64_t (*)(void))sub_25DD9B734);
}

uint64_t sub_25DD98684(void *a1, const char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3;
  uint64_t v8 = sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25DDAC9E0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B380680);
  id v14 = a1;
  uint64_t v15 = sub_25DDAC9D0();
  os_log_type_t v16 = sub_25DDACB10();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = a3;
    id v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v31 = v19;
    v26 = a2;
    *(_DWORD *)id v18 = 136315138;
    v25[1] = v18 + 4;
    sub_25DDAC850();
    sub_25DD98B5C();
    uint64_t v20 = sub_25DDACCA0();
    uint64_t v27 = v6;
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v8);
    uint64_t v30 = sub_25DDA2008(v20, v22, &v31);
    sub_25DDACBC0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v15, v16, v26, v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C6880](v19, -1, -1);
    id v23 = v18;
    a3 = v28;
    MEMORY[0x2611C6880](v23, -1, -1);
  }
  else
  {
  }
  return a3(v14);
}

void UIBridge.__allocating_init(_:_:_:_:_:_:_:)()
{
}

void UIBridge.init(_:_:_:_:_:_:_:)()
{
}

void sub_25DD98958()
{
}

uint64_t UIBridge.deinit()
{
  uint64_t v0 = sub_25DDAC960();

  return v0;
}

uint64_t UIBridge.__deallocating_deinit()
{
  uint64_t v0 = sub_25DDAC960();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25DD989F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t type metadata accessor for UIBridge()
{
  uint64_t result = qword_26B380258;
  if (!qword_26B380258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD98AEC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for UIBridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIBridge);
}

uint64_t sub_25DD98B54()
{
  return type metadata accessor for UIBridge();
}

unint64_t sub_25DD98B5C()
{
  unint64_t result = qword_26B380320;
  if (!qword_26B380320)
  {
    sub_25DDAC410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B380320);
  }
  return result;
}

void sub_25DD98BAC()
{
}

void sub_25DD98BB4()
{
}

void sub_25DD98BBC()
{
}

void sub_25DD98BC4()
{
}

void sub_25DD98BCC()
{
}

void sub_25DD98BD4()
{
}

void sub_25DD98BDC()
{
}

void sub_25DD98BE4()
{
}

void sub_25DD98BEC()
{
}

void sub_25DD98BF4()
{
}

void sub_25DD98BFC()
{
}

void sub_25DD98C04()
{
}

void sub_25DD98C0C()
{
}

void sub_25DD98C14()
{
}

void sub_25DD98C1C()
{
}

void sub_25DD98C24()
{
}

void sub_25DD98C2C()
{
}

id SUIBUIBridgeClient.init(delegate:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDelegate_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  void *v1;
  id v2;

  uint64_t v2 = objc_msgSend(v1, sel_initWithDelegate_delegateQueue_, a1, 0);
  swift_unknownObjectRelease();
  return v2;
}

id SUIBUIBridgeClient.init(delegate:delegateQueue:)(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDelegate_delegateQueue_, a1, a2);
  swift_unknownObjectRelease();

  return v3;
}

{
  char *v2;
  char *v3;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  id v3 = v2;
  *(void *)&v3[OBJC_IVAR___SUIBUIBridgeClient_connection] = 0;
  uint64_t v5 = OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper;
  *(void *)&v3[OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper] = 0;
  objc_allocWithZone((Class)type metadata accessor for UIBridgeServiceDelegateWrapper());
  uint64_t v6 = a2;
  uint64_t v7 = v3;
  uint64_t v8 = swift_unknownObjectRetain();
  *(void *)&v3[v5] = sub_25DDA3C10(v8, (uint64_t)a2);

  swift_unknownObjectRelease();
  v11.receiver = v7;
  v11.super_class = (Class)SUIBUIBridgeClient;
  uint64_t v9 = objc_msgSendSuper2(&v11, sel_init);
  swift_unknownObjectRelease();

  return v9;
}

id sub_25DD98E88()
{
  sub_25DD98EC4();
  v2.receiver = v0;
  v2.super_class = (Class)SUIBUIBridgeClient;
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25DD98EC4()
{
  uint64_t v1 = OBJC_IVAR___SUIBUIBridgeClient_connection;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR___SUIBUIBridgeClient_connection);
  if (v2)
  {
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_super v2 = *(void **)(v0 + v1);
    if (v2)
    {
      objc_msgSend(v2, sel_invalidate);
      objc_super v2 = *(void **)(v0 + v1);
    }
  }
  *(void *)(v0 + v1) = 0;
}

Swift::Void __swiftcall SUIBUIBridgeClient.preheat()()
{
}

uint64_t sub_25DD98FAC()
{
  uint64_t v1 = sub_25DDAC9E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25DD996AC();
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_remoteObjectProxy);

    sub_25DDACBE0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3802C8);
    if (swift_dynamicCast()) {
      return v19;
    }
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v1, (uint64_t)qword_26B380680);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
  id v10 = v0;
  uint64_t v11 = sub_25DDAC9D0();
  os_log_type_t v12 = sub_25DDACB20();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = sub_25DD996AC();
    if (v15)
    {
      os_log_type_t v16 = v15;
      id v17 = objc_msgSend(v15, sel_remoteObjectProxy);

      sub_25DDACBE0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v20, 0, sizeof(v20));
    }
    sub_25DD9A068((uint64_t)v20);
    *(void *)&v20[0] = sub_25DDA2008(0x6C616E6F6974704FLL, 0xED00003E796E413CLL, &v19);
    sub_25DDACBC0();

    _os_log_impl(&dword_25DD92000, v11, v12, "Unexpected remoteObjectProxy type for UIBridge connection %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C6880](v14, -1, -1);
    MEMORY[0x2611C6880](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0;
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriDismissed()()
{
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriPrompted()()
{
}

void *SUIBUIBridgeClient.stopAttending(for:)(uint64_t a1)
{
  unint64_t result = (void *)sub_25DD98FAC();
  if (result)
  {
    objc_msgSend(result, sel_stopAttendingForReason_, a1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriWillPrompt()()
{
}

void *sub_25DD99474(SEL *a1)
{
  unint64_t result = (void *)sub_25DD98FAC();
  if (result)
  {
    [result *a1];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall SUIBUIBridgeClient.startAttending()()
{
  objc_msgSend(v0, sel_startAttendingWithReason_deviceId_, 0, 0);
}

void SUIBUIBridgeClient.startAttending(with:deviceId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25DD98FAC();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (a3) {
      uint64_t v7 = sub_25DDACA60();
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = (id)v7;
    objc_msgSend(v6, sel_startAttendingWithReason_deviceId_, a1);
    swift_unknownObjectRelease();
  }
}

void *sub_25DD996AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___SUIBUIBridgeClient_connection;
  if (!*(void *)(v0 + OBJC_IVAR___SUIBUIBridgeClient_connection))
  {
    sub_25DD9A0C8(0, &qword_26B380210);
    id v3 = sub_25DD99C90(0xD000000000000024, 0x800000025DDAE3B0, 0);
    uint64_t v4 = *(void **)(v0 + v2);
    *(void *)(v0 + v2) = v3;

    uint64_t v5 = *(void **)(v0 + v2);
    if (v5)
    {
      uint64_t v6 = self;
      id v7 = v5;
      id v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_270AC5D28);
      objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);
    }
    id v9 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_270AC65D0);
    sub_25DD9A0C8(0, (unint64_t *)&unk_26B3802D8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380300);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_25DDADD00;
    uint64_t v11 = sub_25DD9A0C8(0, &qword_26B3802E8);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3802F0);
    *(void *)(v10 + 56) = v12;
    *(void *)(v10 + 32) = v11;
    uint64_t v13 = sub_25DD9A0C8(0, (unint64_t *)&qword_26B3802B0);
    *(void *)(v10 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3802C0);
    *(void *)(v10 + 64) = v13;
    id v14 = sub_25DD99D0C();
    sub_25DDACAF0();

    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_25DDADD00;
    *(void *)(v15 + 56) = v12;
    *(void *)(v15 + 32) = v11;
    uint64_t v16 = sub_25DD9A0C8(0, &qword_26B3805E8);
    *(void *)(v15 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805F0);
    *(void *)(v15 + 64) = v16;
    id v17 = sub_25DD99D0C();
    sub_25DDACAF0();

    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_25DDADD00;
    *(void *)(v18 + 56) = v12;
    *(void *)(v18 + 32) = v11;
    uint64_t v19 = sub_25DD9A0C8(0, &qword_26B3805F8);
    *(void *)(v18 + 88) = __swift_instantiateConcreteTypeFromMangledName(qword_26B380600);
    *(void *)(v18 + 64) = v19;
    id v20 = sub_25DD99D0C();
    uint64_t aBlock = 0;
    sub_25DDACAF0();

    unint64_t v21 = *(void **)(v1 + v2);
    if (v21)
    {
      objc_msgSend(v21, sel_setExportedInterface_, v9);
      unint64_t v22 = *(void **)(v1 + v2);
      if (v22)
      {
        objc_msgSend(v22, sel_setExportedObject_, *(void *)(v1 + OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper));
        id v23 = *(void **)(v1 + v2);
        if (v23)
        {
          uint64_t v24 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v40 = sub_25DD9A13C;
          uint64_t v41 = v24;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v37 = 1107296256;
          v38 = sub_25DD9A16C;
          v39 = &block_descriptor;
          uint64_t v25 = _Block_copy(&aBlock);
          id v26 = v23;
          swift_release();
          objc_msgSend(v26, sel_setInvalidationHandler_, v25);
          _Block_release(v25);

          uint64_t v27 = *(void **)(v1 + v2);
          if (v27)
          {
            uint64_t v28 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v40 = sub_25DD9A15C;
            uint64_t v41 = v28;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v37 = 1107296256;
            v38 = sub_25DD9A16C;
            v39 = &block_descriptor_6;
            uint64_t v29 = _Block_copy(&aBlock);
            id v30 = v27;
            swift_release();
            objc_msgSend(v30, sel_setInterruptionHandler_, v29);
            _Block_release(v29);

            uint64_t v31 = *(void **)(v1 + v2);
            if (v31)
            {
              id v32 = v31;
              objc_msgSend(v32, sel_resume);
            }
          }
        }
      }
    }
  }
  v33 = *(void **)(v1 + v2);
  id v34 = v33;
  return v33;
}

id sub_25DD99C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

id sub_25DD99D0C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25DDACAB0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_25DD99D84(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DDAC9E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B380680);
  id v3 = sub_25DDAC9D0();
  os_log_type_t v4 = sub_25DDACB10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25DD92000, v3, v4, "UIBridge Connection Invalidated", v5, 2u);
    MEMORY[0x2611C6880](v5, -1, -1);
  }

  swift_beginAccess();
  id v6 = (char *)MEMORY[0x2611C6920](v1);
  if (v6)
  {
    id v7 = *(void **)&v6[OBJC_IVAR___SUIBUIBridgeClient_connection];
    *(void *)&v6[OBJC_IVAR___SUIBUIBridgeClient_connection] = 0;
  }
}

void sub_25DD99EA0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DDAC9E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B380680);
  id v3 = sub_25DDAC9D0();
  os_log_type_t v4 = sub_25DDACB10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25DD92000, v3, v4, "UIBridge Connection Interrupted", v5, 2u);
    MEMORY[0x2611C6880](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611C6920](v1);
  if (v6)
  {
    id v7 = (char *)v6;
    uint64_t v8 = OBJC_IVAR___SUIBUIBridgeClient_connection;
    id v9 = *(void **)(v6 + OBJC_IVAR___SUIBUIBridgeClient_connection);
    if (v9)
    {
      objc_msgSend(v9, sel_invalidate);
      uint64_t v10 = *(void **)&v7[v8];
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)&v7[v8] = 0;
  }
}

void __swiftcall SUIBUIBridgeClient.init()(SUIBUIBridgeClient *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void SUIBUIBridgeClient.init()()
{
}

uint64_t type metadata accessor for SUIBUIBridgeClient(uint64_t a1)
{
  return sub_25DD9A0C8(a1, &qword_26A6C7768);
}

uint64_t sub_25DD9A068(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD9A0C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25DD9A104()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25DD9A13C()
{
  sub_25DD99D84(v0);
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

void sub_25DD9A15C()
{
  sub_25DD99EA0(v0);
}

uint64_t sub_25DD9A16C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25DD9A1B0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection) = a1;
  return MEMORY[0x270F9A758]();
}

char *sub_25DD9A1C4(void *a1)
{
  uint64_t v16 = sub_25DDACB40();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = v5 - v4;
  sub_25DDACB30();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_0();
  sub_25DDACA30();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_0();
  *(void *)&v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection] = 0;
  swift_unknownObjectWeakInit();
  id v7 = &v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
  *(void *)id v7 = 0xD000000000000024;
  *((void *)v7 + 1) = 0x800000025DDAE3B0;
  sub_25DD9A0C8(0, &qword_26B380250);
  uint64_t v8 = v1;
  *(void *)&v8[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener] = sub_25DD9A4B8();
  swift_unknownObjectWeakAssign();
  sub_25DD9A0C8(0, (unint64_t *)&qword_26B3805A0);
  sub_25DDACA20();
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_25DD9B208();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380570);
  sub_25DD9B258();
  sub_25DDACBF0();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8F130], v16);
  *(void *)&v8[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue] = sub_25DDACB60();

  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for UIBridgeConnectionListener();
  id v9 = (char *)objc_msgSendSuper2(&v17, sel_init);
  uint64_t v10 = OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener;
  uint64_t v11 = *(void **)&v9[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener];
  uint64_t v12 = v9;
  objc_msgSend(v11, sel_setDelegate_, v12);
  id v13 = *(id *)&v9[v10];
  objc_msgSend(v13, sel_resume);

  return v12;
}

id sub_25DD9A4B8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithMachServiceName_, v1);

  return v2;
}

id sub_25DD9A52C()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeConnectionListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25DD9A620(int a1, id a2)
{
  id v3 = a2;
  unsigned int v4 = objc_msgSend(a2, sel_processIdentifier);
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25DDAC9E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B380680);
  uint64_t v6 = v2;
  id v7 = sub_25DDAC9D0();
  os_log_type_t v8 = sub_25DDACB10();
  if (os_log_type_enabled(v7, v8))
  {
    id v33 = v3;
    uint64_t v9 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109378;
    LODWORD(v41[0]) = v4;
    sub_25DDACBC0();
    *(_WORD *)(v9 + 8) = 2080;
    uint64_t v10 = &v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
    uint64_t v11 = v6;
    uint64_t v13 = *(void *)&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
    unint64_t v12 = *((void *)v10 + 1);
    swift_bridgeObjectRetain();
    uint64_t v14 = v13;
    uint64_t v6 = v11;
    *(void *)&v41[0] = sub_25DDA2008(v14, v12, &aBlock);
    sub_25DDACBC0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v7, v8, "Incoming connection request from %d for %s", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    id v3 = v33;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v3, sel_valueForEntitlement_, v15);

  if (v16)
  {
    sub_25DDACBE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v41, 0, sizeof(v41));
  }
  sub_25DD9B0A0((uint64_t)v41, (uint64_t)&aBlock);
  if (v37)
  {
    if swift_dynamicCast() && (v40)
    {
      objc_msgSend(v3, sel__setQueue_, *(void *)&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue]);
      objc_super v17 = self;
      id v18 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_270AC5D28);
      OUTLINED_FUNCTION_3((uint64_t)v18, sel_setExportedInterface_);

      uint64_t v19 = (void *)MEMORY[0x2611C6920](&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_uiBridgeService]);
      OUTLINED_FUNCTION_3((uint64_t)v19, sel_setExportedObject_);

      id v20 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_270AC65D0);
      OUTLINED_FUNCTION_3((uint64_t)v20, sel_setRemoteObjectInterface_);

      uint64_t v21 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v22 = swift_allocObject();
      *(_DWORD *)(v22 + 16) = v4;
      *(void *)(v22 + 24) = v21;
      v38 = sub_25DD9B178;
      uint64_t v39 = v22;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v35 = 1107296256;
      v36 = sub_25DD9A16C;
      uint64_t v37 = &block_descriptor_0;
      id v23 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v3, sel_setInvalidationHandler_, v23);
      _Block_release(v23);
      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v25 = swift_allocObject();
      *(_DWORD *)(v25 + 16) = v4;
      *(void *)(v25 + 24) = v24;
      v38 = sub_25DD9B1CC;
      uint64_t v39 = v25;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v35 = 1107296256;
      v36 = sub_25DD9A16C;
      uint64_t v37 = &block_descriptor_26;
      id v26 = _Block_copy(&aBlock);
      uint64_t v27 = swift_release();
      OUTLINED_FUNCTION_3(v27, sel_setInterruptionHandler_);
      _Block_release(v26);
      id v28 = v3;
      sub_25DD9A1B0((uint64_t)v3);
      objc_msgSend(v28, sel_resume);
      return 1;
    }
  }
  else
  {
    sub_25DD9A068((uint64_t)&aBlock);
  }
  id v30 = sub_25DDAC9D0();
  os_log_type_t v31 = sub_25DDACB20();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v32 = 0;
    _os_log_impl(&dword_25DD92000, v30, v31, "Entitlement missing on incoming connection request", v32, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  return 0;
}

void sub_25DD9AB98(uint64_t a1, uint64_t a2, const char *a3, void (*a4)(void))
{
  uint64_t v6 = a2 + 16;
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25DDAC9E0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B380680);
  os_log_type_t v8 = sub_25DDAC9D0();
  os_log_type_t v9 = sub_25DDACB10();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109120;
    sub_25DDACBC0();
    _os_log_impl(&dword_25DD92000, v8, v9, a3, v10, 8u);
    OUTLINED_FUNCTION_2_0();
  }

  swift_beginAccess();
  uint64_t v11 = MEMORY[0x2611C6920](v6);
  if (v11)
  {
    unint64_t v12 = (void *)v11;
    uint64_t v13 = MEMORY[0x2611C6920](v11 + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_uiBridgeService);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      a4();
    }
  }
}

uint64_t sub_25DD9AD60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25DDAC9E0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection];
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_msgSend(v11, sel_remoteObjectProxy);
    sub_25DDACBE0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380240);
    if (swift_dynamicCast())
    {

      return v21;
    }
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26B380680);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v14, v2);
    uint64_t v15 = v1;
    id v16 = sub_25DDAC9D0();
    os_log_type_t v17 = sub_25DDACB20();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)id v18 = 136315138;
      uint64_t v19 = *(void **)&v1[v9];
      if (v19)
      {
        id v20 = objc_msgSend(v19, sel_remoteObjectProxy);
        sub_25DDACBE0();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v22, 0, sizeof(v22));
      }
      sub_25DD9A068((uint64_t)v22);
      *(void *)&v22[0] = sub_25DDA2008(0x6C616E6F6974704FLL, 0xED00003E796E413CLL, &v21);
      sub_25DDACBC0();

      _os_log_impl(&dword_25DD92000, v16, v17, "Unexpected remoteObjectProxy type for UIBridgeServiceDelegateWrapperProtocol %s", v18, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  }
  return 0;
}

void sub_25DD9B03C()
{
}

uint64_t type metadata accessor for UIBridgeConnectionListener()
{
  return self;
}

uint64_t sub_25DD9B0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DD9B108()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DD9B140()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25DD9B178()
{
  sub_25DD9AB98(*(unsigned int *)(v0 + 16), *(void *)(v0 + 24), "UIBridgeConnectionListener connection invalidated, client pid = %d", sub_25DDA1488);
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

void sub_25DD9B1CC()
{
  sub_25DD9AB98(*(unsigned int *)(v0 + 16), *(void *)(v0 + 24), "UIBridgeConnectionListener connection interrupted, client pid = %d", sub_25DDA1434);
}

unint64_t sub_25DD9B208()
{
  unint64_t result = qword_26B380590;
  if (!qword_26B380590)
  {
    sub_25DDACB30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B380590);
  }
  return result;
}

unint64_t sub_25DD9B258()
{
  unint64_t result = qword_26B380580;
  if (!qword_26B380580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B380570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B380580);
  }
  return result;
}

void OUTLINED_FUNCTION_2_0()
{
  JUMPOUT(0x2611C6880);
}

id OUTLINED_FUNCTION_3(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_25DD9B2F8(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor) = a1;
  return swift_release();
}

void sub_25DD9B310()
{
  OUTLINED_FUNCTION_4();
  uint64_t v19 = v1;
  uint64_t v20 = v2;
  id v18 = v3;
  uint64_t v17 = sub_25DDACB40();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = v7 - v6;
  sub_25DDACB30();
  OUTLINED_FUNCTION_7();
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_30();
  uint64_t v9 = sub_25DDACA30();
  uint64_t v10 = OUTLINED_FUNCTION_42(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_0();
  *(void *)&v0[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener] = 0;
  sub_25DD9A0C8(0, (unint64_t *)&qword_26B3805A0);
  id v11 = v0;
  sub_25DDACA20();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_25DDA34EC((unint64_t *)&qword_26B380590, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380570);
  sub_25DDA3534((unint64_t *)&qword_26B380580, (uint64_t *)&unk_26B380570);
  sub_25DDACBF0();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F8F130], v17);
  *(void *)&v11[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_queue] = sub_25DDACB60();
  *(void *)&v11[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener] = v18;
  sub_25DD989F0(v19, (uint64_t)&v11[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher]);
  *(void *)&v11[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper] = v20;
  id v12 = v18;
  swift_unknownObjectRetain();

  v21.receiver = v11;
  v21.super_class = (Class)type metadata accessor for UIBridgeService();
  id v13 = objc_msgSendSuper2(&v21, sel_init);
  objc_allocWithZone((Class)type metadata accessor for UIBridgeConnectionListener());
  uint64_t v14 = (char *)v13;
  uint64_t v15 = sub_25DD9A1C4(v13);
  id v16 = *(void **)&v14[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener];
  *(void *)&v14[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener] = v15;

  objc_msgSend(v12, sel_setDelegate_, v14);
  objc_msgSend(v12, sel_resumeConnectionWithBridgeProxy_, v14);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v19);
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9B614()
{
}

uint64_t sub_25DD9B63C(void *a1)
{
  uint64_t v2 = sub_25DDAC410();
  MEMORY[0x270FA5388](v2 - 8);
  sub_25DDAC850();
  sub_25DDAC870();
  sub_25DD989F0((uint64_t)a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher, (uint64_t)v5);
  a1;
  AFDeviceSupportsSAE();
  type metadata accessor for UISessionProcessor();
  swift_allocObject();
  sub_25DDA8548();
  return sub_25DD9B2F8(v3);
}

void sub_25DD9B734()
{
}

void sub_25DD9B75C()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6();
  uint64_t v9 = OUTLINED_FUNCTION_28(OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_queue);
  *(void *)(v9 + 16) = v0;
  *(void *)(v9 + 24) = v6;
  v18[4] = v4;
  v18[5] = v9;
  v18[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v18[2] = sub_25DD9A16C;
  v18[3] = v2;
  uint64_t v10 = _Block_copy(v18);
  id v11 = v0;
  id v12 = v6;
  sub_25DDACA10();
  sub_25DDA34EC((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  sub_25DDACBF0();
  uint64_t v13 = OUTLINED_FUNCTION_48();
  MEMORY[0x2611C6200](v13);
  _Block_release(v10);
  uint64_t v14 = OUTLINED_FUNCTION_26();
  v15(v14);
  uint64_t v16 = OUTLINED_FUNCTION_25();
  v17(v16);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9B934(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25DDAC410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDAC900();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD9DC68(4);
  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F70CD0], v8);
    swift_retain();
    sub_25DDA9300();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_25DD9B2F8(0);
    swift_release();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25DDAC9E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B380680);
    id v22 = a2;
    uint64_t v13 = sub_25DDAC9D0();
    os_log_type_t v14 = sub_25DDACB10();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v24 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      objc_super v21 = v15 + 4;
      sub_25DDAC850();
      sub_25DDA34EC((unint64_t *)&qword_26B380320, MEMORY[0x263F07508]);
      uint64_t v17 = sub_25DDACCA0();
      unint64_t v19 = v18;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v23 = sub_25DDA2008(v17, v19, &v24);
      sub_25DDACBC0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD92000, v13, v14, "SessionHandler not found for session:%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C6880](v16, -1, -1);
      MEMORY[0x2611C6880](v15, -1, -1);
    }
    else
    {

      id v20 = v22;
    }
  }
}

void sub_25DD9BD00()
{
}

void sub_25DD9BD28()
{
}

void sub_25DD9BD50()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_31();
  if (*(void *)(v6 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    swift_retain();
    v2(v4);
    OUTLINED_FUNCTION_3_0();
    swift_release();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25DDAC9E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B380680);
    id v22 = v4;
    uint64_t v13 = sub_25DDAC9D0();
    os_log_type_t v14 = sub_25DDACB10();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_8();
      uint64_t v23 = OUTLINED_FUNCTION_33();
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_25DDAC850();
      sub_25DDA34EC((unint64_t *)&qword_26B380320, MEMORY[0x263F07508]);
      uint64_t v16 = sub_25DDACCA0();
      unint64_t v18 = v17;
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v7);
      uint64_t v19 = sub_25DDA2008(v16, v18, &v23);
      OUTLINED_FUNCTION_9(v19);
      sub_25DDACBC0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD92000, v13, v14, "SessionHandler not found for session:%s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();

      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      OUTLINED_FUNCTION_3_0();
    }
  }
}

void sub_25DD9BFF4()
{
}

void sub_25DD9C01C()
{
}

void sub_25DD9C044()
{
}

void sub_25DD9C06C()
{
}

void sub_25DD9C094()
{
}

void sub_25DD9C0BC()
{
}

void sub_25DD9C0E4()
{
}

void sub_25DD9C10C()
{
}

void sub_25DD9C134()
{
}

void sub_25DD9C15C()
{
}

void sub_25DD9C184()
{
}

void sub_25DD9C1AC()
{
}

void sub_25DD9C1D4()
{
}

void sub_25DD9C1FC()
{
}

void sub_25DD9C224()
{
}

void sub_25DD9C24C()
{
}

void sub_25DD9C294()
{
}

void sub_25DD9C2BC(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    swift_retain();
    sub_25DDA8810();
    swift_release();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_25DDAC9E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B380680);
    oslog = sub_25DDAC9D0();
    os_log_type_t v2 = sub_25DDACB10();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_25DD92000, oslog, v2, "SessionHandler not found in UIBridgeService", v3, 2u);
      MEMORY[0x2611C6880](v3, -1, -1);
    }
  }
}

void sub_25DD9C42C()
{
}

void sub_25DD9C454()
{
  OUTLINED_FUNCTION_4();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v0;
  v19[4] = v6;
  v19[5] = v15;
  v19[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v19[2] = sub_25DD9A16C;
  v19[3] = v4;
  uint64_t v16 = _Block_copy(v19);
  id v17 = v0;
  sub_25DDACA10();
  sub_25DDA34EC((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  OUTLINED_FUNCTION_14();
  uint64_t v18 = OUTLINED_FUNCTION_49();
  MEMORY[0x2611C6200](v18);
  _Block_release(v16);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v11);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9C63C(uint64_t a1)
{
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DDAC9E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B380680);
  uint64_t v3 = sub_25DDAC9D0();
  os_log_type_t v4 = sub_25DDACB10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25DD92000, v3, v4, "Received siriPrompted", v5, 2u);
    MEMORY[0x2611C6880](v5, -1, -1);
  }

  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    swift_retain();
    sub_25DDA8BF8();
    swift_release();
  }
  else
  {
    oslog = sub_25DDAC9D0();
    os_log_type_t v6 = sub_25DDACB10();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25DD92000, oslog, v6, "SessionHandler not found in UIBridgeService", v7, 2u);
      MEMORY[0x2611C6880](v7, -1, -1);
    }
  }
}

void sub_25DD9C838()
{
}

void sub_25DD9C8B4()
{
}

void sub_25DD9C8DC()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_6();
  uint64_t v9 = OUTLINED_FUNCTION_28(OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_queue);
  *(void *)(v9 + 16) = v0;
  *(void *)(v9 + 24) = v6;
  v17[4] = v4;
  v17[5] = v9;
  v17[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v17[2] = sub_25DD9A16C;
  v17[3] = v2;
  uint64_t v10 = _Block_copy(v17);
  id v11 = v0;
  sub_25DDACA10();
  sub_25DDA34EC((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  OUTLINED_FUNCTION_14();
  uint64_t v12 = OUTLINED_FUNCTION_49();
  MEMORY[0x2611C6200](v12);
  _Block_release(v10);
  uint64_t v13 = OUTLINED_FUNCTION_26();
  v14(v13);
  uint64_t v15 = OUTLINED_FUNCTION_25();
  v16(v15);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9CA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDAC900();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = v9 - v8;
  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    type metadata accessor for UIBridgeService();
    swift_retain();
    sub_25DD9CC30(a2, v10);
    sub_25DDA9300();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25DDAC9E0();
    uint64_t v14 = OUTLINED_FUNCTION_22(v11, (uint64_t)qword_26B380680);
    os_log_type_t v12 = sub_25DDACB10();
    if (os_log_type_enabled(v14, v12))
    {
      uint64_t v13 = (uint8_t *)OUTLINED_FUNCTION_10();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_25DD92000, v14, v12, "SessionHandler not found in UIBridgeService", v13, 2u);
      OUTLINED_FUNCTION_2_0();
    }
  }
}

uint64_t sub_25DD9CC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 0:
      goto LABEL_8;
    case 1:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CC0];
      break;
    case 2:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CE0];
      break;
    case 3:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CB8];
      break;
    case 4:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CD0];
      break;
    case 5:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CC8];
      break;
    default:
      if (qword_26B380558 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25DDAC9E0();
      uint64_t v5 = (void *)OUTLINED_FUNCTION_22(v4, (uint64_t)qword_26B380680);
      os_log_type_t v6 = sub_25DDACB20();
      if (OUTLINED_FUNCTION_24(v6))
      {
        *(_WORD *)OUTLINED_FUNCTION_10() = 0;
        OUTLINED_FUNCTION_38(&dword_25DD92000, v7, v8, "Unknown SUIBAttendingStopReason");
        OUTLINED_FUNCTION_2_0();
      }

LABEL_8:
      uint64_t v3 = (unsigned int *)MEMORY[0x263F70CD8];
      break;
  }
  uint64_t v9 = *v3;
  sub_25DDAC900();
  OUTLINED_FUNCTION_7();
  os_log_type_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 104);
  return v12(a2, v9, v10);
}

void sub_25DD9CDF8()
{
}

void sub_25DD9CE04(const char *a1)
{
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25DDAC9E0();
  oslog = OUTLINED_FUNCTION_22(v3, (uint64_t)qword_26B380680);
  os_log_type_t v4 = sub_25DDACB10();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (_WORD *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40(v5);
    _os_log_impl(&dword_25DD92000, oslog, v4, a1, v1, 2u);
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_25DD9CF14()
{
}

void sub_25DD9CF6C()
{
  OUTLINED_FUNCTION_4();
  os_log_type_t v4 = v0;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v34 = v9;
  uint64_t v33 = sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6();
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_25DDAC9E0();
  __swift_project_value_buffer(v16, (uint64_t)qword_26B380680);
  swift_bridgeObjectRetain_n();
  id v17 = sub_25DDAC9D0();
  os_log_type_t v18 = sub_25DDACB10();
  if (OUTLINED_FUNCTION_24(v18))
  {
    uint64_t v32 = v13;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v21 = v34;
    uint64_t v36 = v20;
    v37[0] = v34;
    type metadata accessor for SUIBAttendingStartReason(0);
    uint64_t v22 = sub_25DDACA80();
    uint64_t v24 = sub_25DDA2008(v22, v23, &v36);
    OUTLINED_FUNCTION_50(v24);
    sub_25DDACBC0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v37[0] = v8;
    v37[1] = v6;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7870);
    uint64_t v25 = sub_25DDACA80();
    uint64_t v27 = sub_25DDA2008(v25, v26, &v36);
    OUTLINED_FUNCTION_50(v27);
    sub_25DDACBC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v17, v1, "startAttending reason=%s device=%s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    uint64_t v13 = v32;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v21 = v34;
  }
  id v28 = (void *)swift_allocObject();
  v28[2] = v4;
  v28[3] = v21;
  v28[4] = v8;
  v28[5] = v6;
  v37[4] = sub_25DDA1FFC;
  v37[5] = v28;
  v37[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v37[2] = sub_25DD9A16C;
  v37[3] = &block_descriptor_24;
  uint64_t v29 = _Block_copy(v37);
  swift_bridgeObjectRetain();
  id v30 = v4;
  sub_25DDACA10();
  uint64_t v36 = MEMORY[0x263F8EE78];
  sub_25DDA34EC((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  sub_25DDACBF0();
  uint64_t v31 = OUTLINED_FUNCTION_48();
  MEMORY[0x2611C6200](v31);
  _Block_release(v29);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v33);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v3, v13);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9D364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDAC910();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    type metadata accessor for UIBridgeService();
    swift_retain();
    sub_25DD9D564(a2, (uint64_t)v7);
    sub_25DDA99E0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DDAC9E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
    os_log_t v13 = (os_log_t)sub_25DDAC9D0();
    os_log_type_t v9 = sub_25DDACB10();
    if (os_log_type_enabled(v13, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25DD92000, v13, v9, "SessionHandler not found in UIBridgeService", v10, 2u);
      MEMORY[0x2611C6880](v10, -1, -1);
    }
    os_log_t v11 = v13;
  }
}

uint64_t sub_25DD9D564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 == 1)
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F70CE8];
  }
  else
  {
    if (!a1)
    {
      uint64_t v3 = *MEMORY[0x263F70CF0];
      goto LABEL_11;
    }
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25DDAC9E0();
    uint64_t v6 = (void *)OUTLINED_FUNCTION_22(v5, (uint64_t)qword_26B380680);
    os_log_type_t v7 = sub_25DDACB20();
    if (OUTLINED_FUNCTION_24(v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_10() = 0;
      OUTLINED_FUNCTION_38(&dword_25DD92000, v8, v9, "Unknown SUIBAttendingStartReason");
      OUTLINED_FUNCTION_2_0();
    }

    uint64_t v4 = (unsigned int *)MEMORY[0x263F70CF0];
  }
  uint64_t v3 = *v4;
LABEL_11:
  sub_25DDAC910();
  OUTLINED_FUNCTION_7();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 104);
  return v12(a2, v3, v10);
}

void sub_25DD9D6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  v17[4] = sub_25DDA310C;
  v17[5] = v7;
  v17[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v17[2] = sub_25DD9DA98;
  v17[3] = &block_descriptor_111;
  uint64_t v8 = _Block_copy(v17);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v6, sel_notifyClientWithBlock_, v8, v17[0]);
  _Block_release(v8);
  uint64_t v9 = OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener;
  uint64_t v10 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = (void *)sub_25DD9AD60();

    if (v12)
    {
      if (objc_msgSend(v12, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttending)) {
        objc_msgSend(v12, sel_uiBridgeServiceDidStartAttending);
      }
      swift_unknownObjectRelease();
    }
    os_log_t v13 = *(void **)(v3 + v9);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = (void *)sub_25DD9AD60();

      if (v15)
      {
        if (objc_msgSend(v15, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_))
        {
          uint64_t v16 = (void *)sub_25DDACA60();
          objc_msgSend(v15, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, v16);
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
  }
}

void sub_25DD9D8C8(uint64_t a1)
{
  sub_25DDA2FF4(a1, (uint64_t)v6, (uint64_t *)&unk_26B380270);
  if (!v7)
  {
    sub_25DDA2FA0((uint64_t)v6, (uint64_t *)&unk_26B380270);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805B0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25DDAC9E0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B380680);
    os_log_type_t v1 = sub_25DDAC9D0();
    os_log_type_t v3 = sub_25DDACB00();
    if (os_log_type_enabled(v1, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25DD92000, v1, v3, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v4, 2u);
      MEMORY[0x2611C6880](v4, -1, -1);
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v5, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttending)) {
    objc_msgSend(v5, sel_uiBridgeServiceDidStartAttending);
  }
  if (objc_msgSend(v5, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_))
  {
    swift_unknownObjectRetain();
    os_log_type_t v1 = sub_25DDACA60();
    objc_msgSend(v5, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, v1);
    swift_unknownObjectRelease_n();
LABEL_12:

    return;
  }
  swift_unknownObjectRelease();
}

uint64_t sub_25DD9DA98(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = *(void (**)(long long *))(a1 + 32);
  if (a2)
  {
    *((void *)&v6 + 1) = swift_getObjectType();
    *(void *)&long long v5 = a2;
  }
  else
  {
    long long v5 = 0u;
    long long v6 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v3(&v5);
  swift_release();
  return sub_25DDA2FA0((uint64_t)&v5, (uint64_t *)&unk_26B380270);
}

void sub_25DD9DB20()
{
}

void sub_25DD9DB48(uint64_t a1)
{
}

void sub_25DD9DB54()
{
  os_log_type_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  v6[4] = sub_25DD9DC64;
  v6[5] = 0;
  v6[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v6[2] = sub_25DD9DA98;
  v6[3] = &block_descriptor_102;
  uint64_t v2 = _Block_copy(v6);
  objc_msgSend(v1, sel_notifyClientWithBlock_, v2, v6[0]);
  _Block_release(v2);
  os_log_type_t v3 = *(void **)(v0 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v3)
  {
    id v4 = v3;
    long long v5 = (void *)sub_25DD9AD60();

    if (v5)
    {
      if (objc_msgSend(v5, sel_respondsToSelector_, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_))objc_msgSend(v5, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, 3); {
      swift_unknownObjectRelease();
      }
    }
  }
}

void sub_25DD9DC68(uint64_t a1)
{
  os_log_type_t v3 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  v8[4] = sub_25DD9DC64;
  v8[5] = 0;
  v8[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v8[2] = sub_25DD9DA98;
  v8[3] = &block_descriptor_99;
  id v4 = _Block_copy(v8);
  OUTLINED_FUNCTION_52((uint64_t)v4, sel_notifyClientWithBlock_);
  _Block_release(v4);
  long long v5 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = (void *)OUTLINED_FUNCTION_27();

    if (v7)
    {
      if (objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, v8[0]))objc_msgSend(v7, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, a1); {
      swift_unknownObjectRelease();
      }
    }
  }
}

void sub_25DD9DD70(uint64_t a1)
{
  sub_25DDA2FF4(a1, (uint64_t)v8, (uint64_t *)&unk_26B380270);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805B0);
    if (OUTLINED_FUNCTION_51())
    {
      if (objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_))objc_msgSend(v7, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, 3); {
      swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    sub_25DDA2FA0((uint64_t)v8, (uint64_t *)&unk_26B380270);
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25DDAC9E0();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_22(v1, (uint64_t)qword_26B380680);
  os_log_type_t v3 = sub_25DDACB00();
  if (OUTLINED_FUNCTION_21(v3))
  {
    id v4 = (_WORD *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40(v4);
    OUTLINED_FUNCTION_13(&dword_25DD92000, v5, v6, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate");
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_25DD9DE9C(char a1)
{
  os_log_type_t v3 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  v10[4] = sub_25DDA30D4;
  v10[5] = v4;
  v10[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v10[2] = sub_25DD9DA98;
  v10[3] = &block_descriptor_96;
  uint64_t v5 = _Block_copy(v10);
  uint64_t v6 = swift_release();
  OUTLINED_FUNCTION_52(v6, sel_notifyClientWithBlock_);
  _Block_release(v5);
  id v7 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = (void *)OUTLINED_FUNCTION_27();

    if (v9)
    {
      if (objc_msgSend(v9, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_, v10[0])) {
        objc_msgSend(v9, sel_uiBridgeServiceDetectedSpeechStart_, a1 & 1);
      }
      swift_unknownObjectRelease();
    }
  }
}

void sub_25DD9DFC4(uint64_t a1, char a2)
{
  sub_25DDA2FF4(a1, (uint64_t)v8, (uint64_t *)&unk_26B380270);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805B0);
    if (swift_dynamicCast())
    {
      if (objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_)) {
        objc_msgSend(v7, sel_uiBridgeServiceDetectedSpeechStart_, a2 & 1);
      }
      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    sub_25DDA2FA0((uint64_t)v8, (uint64_t *)&unk_26B380270);
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25DDAC9E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B380680);
  uint64_t v4 = sub_25DDAC9D0();
  os_log_type_t v5 = sub_25DDACB00();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_25DD92000, v4, v5, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v6, 2u);
    MEMORY[0x2611C6880](v6, -1, -1);
  }
}

void sub_25DD9E13C()
{
}

void sub_25DD9E164(uint64_t a1)
{
}

void sub_25DD9E170(uint64_t a1, SEL *a2)
{
  sub_25DDA2FF4(a1, (uint64_t)v10, (uint64_t *)&unk_26B380270);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805B0);
    if (OUTLINED_FUNCTION_51())
    {
      if (objc_msgSend(v9, sel_respondsToSelector_, *a2)) {
        [v9 *a2];
      }
      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    sub_25DDA2FA0((uint64_t)v10, (uint64_t *)&unk_26B380270);
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25DDAC9E0();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_22(v3, (uint64_t)qword_26B380680);
  os_log_type_t v5 = sub_25DDACB00();
  if (OUTLINED_FUNCTION_21(v5))
  {
    uint64_t v6 = (_WORD *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40(v6);
    OUTLINED_FUNCTION_13(&dword_25DD92000, v7, v8, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate");
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_25DD9E298(char a1)
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v3;
  v14[4] = sub_25DDA30B8;
  v14[5] = v4;
  v14[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v14[2] = sub_25DD9DA98;
  v14[3] = &block_descriptor_87;
  os_log_type_t v5 = _Block_copy(v14);
  uint64_t v6 = swift_release();
  OUTLINED_FUNCTION_52(v6, sel_notifyClientWithBlock_);
  _Block_release(v5);
  if (a1)
  {
    uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper);
    if (objc_msgSend(v7, sel_respondsToSelector_, sel_notifySpeechDetectedIsUndirected, v14[0])) {
      objc_msgSend(v7, sel_notifySpeechDetectedIsUndirected);
    }
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = (void *)sub_25DD9AD60();

      if (v10)
      {
        if (objc_msgSend(v10, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_))objc_msgSend(v10, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 1); {
LABEL_12:
        }
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v11)
    {
      id v12 = v11;
      os_log_t v13 = (void *)sub_25DD9AD60();

      if (v13)
      {
        if (objc_msgSend(v13, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_, v14[0]))objc_msgSend(v13, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 3); {
        goto LABEL_12;
        }
      }
    }
  }
}

void sub_25DD9E474(uint64_t a1, char a2, uint64_t a3)
{
  sub_25DDA2FF4(a1, (uint64_t)v16, (uint64_t *)&unk_26B380270);
  if (v17)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3805B0);
    if (swift_dynamicCast())
    {
      if (a2)
      {
        swift_beginAccess();
        uint64_t v5 = MEMORY[0x2611C6920](a3 + 16);
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper);
          if (objc_msgSend(v7, sel_respondsToSelector_, sel_notifySpeechDetectedIsUndirected)) {
            objc_msgSend(v7, sel_notifySpeechDetectedIsUndirected);
          }
          if (objc_msgSend(v15, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_))objc_msgSend(v15, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 1); {
        }
          }
        else
        {
          if (qword_26B380558 != -1) {
            swift_once();
          }
          uint64_t v12 = sub_25DDAC9E0();
          __swift_project_value_buffer(v12, (uint64_t)qword_26B380680);
          uint64_t v6 = sub_25DDAC9D0();
          os_log_type_t v13 = sub_25DDACB20();
          if (os_log_type_enabled(v6, v13))
          {
            id v14 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_25DD92000, v6, v13, "UIBridgeService expired", v14, 2u);
            MEMORY[0x2611C6880](v14, -1, -1);
          }
        }
      }
      else if (objc_msgSend(v15, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_))
      {
        objc_msgSend(v15, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 3);
      }
      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    sub_25DDA2FA0((uint64_t)v16, (uint64_t *)&unk_26B380270);
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25DDAC9E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
  id v9 = sub_25DDAC9D0();
  os_log_type_t v10 = sub_25DDACB00();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25DD92000, v9, v10, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v11, 2u);
    MEMORY[0x2611C6880](v11, -1, -1);
  }
}

void sub_25DD9E73C()
{
}

void sub_25DD9E764(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  v11[4] = a1;
  v11[5] = 0;
  v11[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_17();
  v11[2] = sub_25DD9DA98;
  v11[3] = v6;
  uint64_t v7 = _Block_copy(v11);
  OUTLINED_FUNCTION_52((uint64_t)v7, sel_notifyClientWithBlock_);
  _Block_release(v7);
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v8)
  {
    id v9 = v8;
    os_log_type_t v10 = (void *)OUTLINED_FUNCTION_27();

    if (v10)
    {
      if (objc_msgSend(v10, sel_respondsToSelector_, *a3, v11[0])) {
        [v10 *a3];
      }
      swift_unknownObjectRelease();
    }
  }
}

void sub_25DD9E84C(uint64_t a1)
{
}

void sub_25DD9E858(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = (void *)sub_25DD9AD60();

    if (v6)
    {
      if (objc_msgSend(v6, sel_respondsToSelector_, sel_uiBridgeServiceDidDetectLanguageMismatch_))
      {
        if (a2) {
          uint64_t v7 = sub_25DDACA60();
        }
        else {
          uint64_t v7 = 0;
        }
        id v8 = (id)v7;
        objc_msgSend(v6, sel_uiBridgeServiceDidDetectLanguageMismatch_);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_25DD9E954()
{
  OUTLINED_FUNCTION_4();
  uint64_t v28 = v0;
  uint64_t v2 = sub_25DDAC8F0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_31();
  uint64_t v6 = sub_25DDAC630();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_25DDACC40();
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
    v27[5] = v6;
    uint64_t v9 = v6 + ((v8 + 32) & ~v8);
    uint64_t v10 = *(void *)(v4 + 72);
    do
    {
      uint64_t v11 = v29(v1, v9, v2);
      MEMORY[0x270FA5388](v11);
      v27[2] = v1;
      id v12 = objc_allocWithZone((Class)SUIBOrchestrationTask);
      sub_25DDA1700((uint64_t)sub_25DDA2F94, (uint64_t)v27);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
      sub_25DDACC20();
      sub_25DDACC50();
      sub_25DDACC60();
      sub_25DDACC30();
      v9 += v10;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25DDAC9E0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B380680);
  swift_bridgeObjectRetain_n();
  id v14 = sub_25DDAC9D0();
  os_log_type_t v15 = sub_25DDACB10();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_8();
    uint64_t v30 = OUTLINED_FUNCTION_33();
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v17 = sub_25DD9A0C8(0, (unint64_t *)&qword_26B3802B0);
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = MEMORY[0x2611C6180](v18, v17);
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_25DDA2008(v19, v21, &v30);
    OUTLINED_FUNCTION_9(v22);
    sub_25DDACBC0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v14, v15, "Calling delegate's didReceive with %s", v16, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v23 = *(void **)(v28 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v23 && (id v24 = v23, v25 = (void *)sub_25DD9AD60(), v24, v25))
  {
    if (objc_msgSend(v25, sel_respondsToSelector_, sel_uiBridgeServiceDidReceiveTasks_))
    {
      sub_25DD9A0C8(0, (unint64_t *)&qword_26B3802B0);
      unint64_t v26 = (void *)sub_25DDACAB0();
      objc_msgSend(v25, sel_uiBridgeServiceDidReceiveTasks_, v26);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9ED34(void *a1)
{
  uint64_t v2 = sub_25DDAC410();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC8E0();
  uint64_t v6 = (void *)sub_25DDAC3E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(a1, sel_setTaskId_, v6);
}

void sub_25DD9EE28()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  uint64_t v6 = OUTLINED_FUNCTION_42(v5);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - v10;
  sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v35 = v13;
  uint64_t v36 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_30();
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25DDAC9E0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B380680);
  id v15 = v4;
  uint64_t v16 = sub_25DDAC9D0();
  os_log_type_t v17 = sub_25DDACB10();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v33 = v2;
    uint64_t v18 = OUTLINED_FUNCTION_8();
    uint64_t v34 = v11;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v37 = OUTLINED_FUNCTION_33();
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v31 = v19 + 4;
    sub_25DDAC650();
    sub_25DDA34EC((unint64_t *)&qword_26B380320, MEMORY[0x263F07508]);
    unint64_t v20 = v15;
    uint64_t v21 = v36;
    uint64_t v22 = sub_25DDACCA0();
    uint64_t v32 = v9;
    unint64_t v24 = v23;
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v1, v21);
    uint64_t v25 = sub_25DDA2008(v22, v24, &v37);
    OUTLINED_FUNCTION_9(v25);
    sub_25DDACBC0();

    uint64_t v9 = v32;
    uint64_t v2 = v33;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v16, v17, "Calling delegate's taskDidEnd with %s", v19, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    uint64_t v11 = v34;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  unint64_t v26 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = (void *)sub_25DD9AD60();

    if (v28)
    {
      if (objc_msgSend(v28, sel_respondsToSelector_, sel_uiBridgeServiceTaskDidEnd_))
      {
        sub_25DDAC650();
        uint64_t v29 = v36;
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v36);
        sub_25DDA2FF4((uint64_t)v11, (uint64_t)v9, &qword_26B380330);
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v29) == 1)
        {
          uint64_t v30 = 0;
        }
        else
        {
          uint64_t v30 = (void *)sub_25DDAC3E0();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v29);
        }
        objc_msgSend(v28, sel_uiBridgeServiceTaskDidEnd_, v30);
        swift_unknownObjectRelease();

        sub_25DDA2FA0((uint64_t)v11, &qword_26B380330);
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  OUTLINED_FUNCTION_3_0();
}

void sub_25DD9F1CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v22 = a1;
  id v3 = objc_allocWithZone((Class)SUIBIntelligenceFlowActionSummary);
  uint64_t v4 = (void *)sub_25DDA1938((uint64_t)sub_25DDA2F08, (uint64_t)v21);
  unint64_t v20 = v4;
  id v5 = objc_allocWithZone((Class)SUIBRequestProgress);
  uint64_t v6 = (void *)sub_25DDA1A54((uint64_t)sub_25DDA358C, (uint64_t)v19);
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25DDAC9E0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B380680);
  uint64_t v8 = v4;
  uint64_t v9 = sub_25DDAC9D0();
  os_log_type_t v10 = sub_25DDACB10();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v18 = v6;
    uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_8();
    uint64_t v12 = (void *)OUTLINED_FUNCTION_20();
    *(_DWORD *)uint64_t v11 = 138412290;
    unint64_t v23 = v8;
    uint64_t v13 = v8;
    sub_25DDACBC0();
    *uint64_t v12 = v8;

    _os_log_impl(&dword_25DD92000, v9, v10, "Calling delegate's receivedRequestProgress with %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    uint64_t v6 = v18;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {

    uint64_t v9 = v8;
  }

  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (!v14 || (id v15 = v14, v16 = (void *)sub_25DD9AD60(), v15, !v16))
  {

    goto LABEL_11;
  }
  if (objc_msgSend(v16, sel_respondsToSelector_, sel_uiBridgeServiceReceivedRequestProgress_))
  {
    id v17 = v6;
    objc_msgSend(v16, sel_uiBridgeServiceReceivedRequestProgress_, v17);
    swift_unknownObjectRelease();

LABEL_11:
    return;
  }

  swift_unknownObjectRelease();
}

void sub_25DD9F448(void *a1)
{
  sub_25DDAC790();
  uint64_t v2 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setFormatString_, v2);

  uint64_t v3 = sub_25DDAC7A0();
  sub_25DD9F530(v3);
  swift_bridgeObjectRelease();
  sub_25DD9A0C8(0, &qword_26A6C7980);
  id v4 = (id)sub_25DDACA40();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setParameterSummaries_, v4);
}

uint64_t sub_25DD9F530(uint64_t a1)
{
  uint64_t v2 = sub_25DDAC780();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v69 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7998);
  uint64_t v5 = MEMORY[0x270FA5388](v67);
  v54 = (void *)((char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v68 = (void *)((char *)v52 - v8);
  MEMORY[0x270FA5388](v7);
  v63 = (char *)v52 - v9;
  uint64_t v74 = MEMORY[0x263F8EE80];
  sub_25DDA2B80(a1, v70);
  uint64_t v65 = v70[0];
  uint64_t v56 = v70[1];
  int64_t v66 = v72;
  unint64_t v10 = v73;
  v52[0] = v71;
  int64_t v57 = (unint64_t)(v71 + 64) >> 6;
  uint64_t v62 = v3 + 16;
  uint64_t v61 = v3 + 88;
  int v60 = *MEMORY[0x263F709B8];
  int v55 = *MEMORY[0x263F709C0];
  v58 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
  v59 = (uint64_t (**)(char *, uint64_t))(v3 + 96);
  uint64_t v64 = v3;
  v53 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  for (uint64_t result = swift_bridgeObjectRetain(); ; uint64_t result = (*v58)(v36, v2))
  {
    while (1)
    {
      if (v10)
      {
        unint64_t v12 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v13 = v12 | (v66 << 6);
      }
      else
      {
        int64_t v14 = v66 + 1;
        if (__OFADD__(v66, 1)) {
          goto LABEL_41;
        }
        if (v14 >= v57) {
          goto LABEL_39;
        }
        unint64_t v15 = *(void *)(v56 + 8 * v14);
        int64_t v16 = v66 + 1;
        if (!v15)
        {
          int64_t v16 = v66 + 2;
          if (v66 + 2 >= v57) {
            goto LABEL_39;
          }
          unint64_t v15 = *(void *)(v56 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v66 + 3;
            if (v66 + 3 >= v57) {
              goto LABEL_39;
            }
            unint64_t v15 = *(void *)(v56 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v66 + 4;
              if (v66 + 4 >= v57) {
                goto LABEL_39;
              }
              unint64_t v15 = *(void *)(v56 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v66 + 5;
                if (v66 + 5 >= v57) {
                  goto LABEL_39;
                }
                unint64_t v15 = *(void *)(v56 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v66 + 6;
                  while (v17 < v57)
                  {
                    unint64_t v15 = *(void *)(v56 + 8 * v17++);
                    if (v15)
                    {
                      int64_t v16 = v17 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_39:
                  sub_25DDA2ED8();
                  return v74;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v10 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
        int64_t v66 = v16;
      }
      uint64_t v18 = v64;
      uint64_t v19 = (uint64_t *)(*(void *)(v65 + 48) + 16 * v13);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = v67;
      unint64_t v23 = v63;
      unint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v64 + 16);
      v24(&v63[*(int *)(v67 + 48)], *(void *)(v65 + 56) + *(void *)(v64 + 72) * v13, v2);
      void *v23 = v21;
      v23[1] = v20;
      uint64_t v25 = v68;
      sub_25DDA2F10((uint64_t)v23, (uint64_t)v68, &qword_26A6C7998);
      unint64_t v26 = (char *)v25 + *(int *)(v22 + 48);
      id v27 = v69;
      v24(v69, (unint64_t)v26, v2);
      int v28 = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v27, v2);
      if (v28 == v60)
      {
        uint64_t v29 = 0;
        goto LABEL_24;
      }
      if (v28 == v55) {
        break;
      }
      v46 = *v58;
      swift_bridgeObjectRetain();
      v46(v69, v2);
LABEL_30:
      uint64_t result = sub_25DDA2FA0((uint64_t)v68, &qword_26A6C7998);
    }
    uint64_t v29 = 1;
LABEL_24:
    uint64_t v30 = v69;
    uint64_t v31 = (*v59)(v69, v2);
    uint64_t v32 = *((void *)v30 + 1);
    MEMORY[0x270FA5388](v31);
    v52[-4] = v29;
    v52[-3] = v33;
    v52[-2] = v32;
    objc_allocWithZone((Class)SUIBIntelligenceFlowParameterSummary);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_25DDA181C((uint64_t)sub_25DDA3590, (uint64_t)&v52[-6]);
    swift_bridgeObjectRelease();
    if (!v34) {
      goto LABEL_30;
    }
    uint64_t v35 = v54;
    uint64_t v36 = (char *)v54 + *(int *)(v67 + 48);
    uint64_t v38 = *v68;
    uint64_t v37 = v68[1];
    void *v54 = *v68;
    v35[1] = v37;
    (*v53)(v36, v26, v2);
    uint64_t v39 = v74;
    unint64_t v40 = *(void *)(v74 + 16);
    if (*(void *)(v74 + 24) <= v40)
    {
      sub_25DDA2BD8(v40 + 1, 1);
      uint64_t v39 = v74;
    }
    sub_25DDACCB0();
    sub_25DDACA90();
    uint64_t result = sub_25DDACCC0();
    uint64_t v41 = v39 + 64;
    uint64_t v42 = -1 << *(unsigned char *)(v39 + 32);
    unint64_t v43 = result & ~v42;
    unint64_t v44 = v43 >> 6;
    if (((-1 << v43) & ~*(void *)(v39 + 64 + 8 * (v43 >> 6))) == 0) {
      break;
    }
    unint64_t v45 = __clz(__rbit64((-1 << v43) & ~*(void *)(v39 + 64 + 8 * (v43 >> 6)))) | v43 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)(v41 + ((v45 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v45;
    v51 = (void *)(*(void *)(v39 + 48) + 16 * v45);
    void *v51 = v38;
    v51[1] = v37;
    *(void *)(*(void *)(v39 + 56) + 8 * v45) = v34;
    ++*(void *)(v39 + 16);
  }
  char v47 = 0;
  unint64_t v48 = (unint64_t)(63 - v42) >> 6;
  while (++v44 != v48 || (v47 & 1) == 0)
  {
    BOOL v49 = v44 == v48;
    if (v44 == v48) {
      unint64_t v44 = 0;
    }
    v47 |= v49;
    uint64_t v50 = *(void *)(v41 + 8 * v44);
    if (v50 != -1)
    {
      unint64_t v45 = __clz(__rbit64(~v50)) + (v44 << 6);
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25DD9FBD4(uint64_t a1)
{
  uint64_t v2 = sub_25DDAC720();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v69 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7988);
  uint64_t v5 = MEMORY[0x270FA5388](v67);
  v54 = (void *)((char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v68 = (void *)((char *)v52 - v8);
  MEMORY[0x270FA5388](v7);
  v63 = (char *)v52 - v9;
  uint64_t v74 = MEMORY[0x263F8EE80];
  sub_25DDA2B80(a1, v70);
  uint64_t v65 = v70[0];
  uint64_t v56 = v70[1];
  int64_t v66 = v72;
  unint64_t v10 = v73;
  v52[0] = v71;
  int64_t v57 = (unint64_t)(v71 + 64) >> 6;
  uint64_t v62 = v3 + 16;
  uint64_t v61 = v3 + 88;
  int v60 = *MEMORY[0x263F709A8];
  int v55 = *MEMORY[0x263F709B0];
  v58 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
  v59 = (uint64_t (**)(char *, uint64_t))(v3 + 96);
  uint64_t v64 = v3;
  v53 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  for (uint64_t result = swift_bridgeObjectRetain(); ; uint64_t result = (*v58)(v36, v2))
  {
    while (1)
    {
      if (v10)
      {
        unint64_t v12 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v13 = v12 | (v66 << 6);
      }
      else
      {
        int64_t v14 = v66 + 1;
        if (__OFADD__(v66, 1)) {
          goto LABEL_41;
        }
        if (v14 >= v57) {
          goto LABEL_39;
        }
        unint64_t v15 = *(void *)(v56 + 8 * v14);
        int64_t v16 = v66 + 1;
        if (!v15)
        {
          int64_t v16 = v66 + 2;
          if (v66 + 2 >= v57) {
            goto LABEL_39;
          }
          unint64_t v15 = *(void *)(v56 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v66 + 3;
            if (v66 + 3 >= v57) {
              goto LABEL_39;
            }
            unint64_t v15 = *(void *)(v56 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v66 + 4;
              if (v66 + 4 >= v57) {
                goto LABEL_39;
              }
              unint64_t v15 = *(void *)(v56 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v66 + 5;
                if (v66 + 5 >= v57) {
                  goto LABEL_39;
                }
                unint64_t v15 = *(void *)(v56 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v66 + 6;
                  while (v17 < v57)
                  {
                    unint64_t v15 = *(void *)(v56 + 8 * v17++);
                    if (v15)
                    {
                      int64_t v16 = v17 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_39:
                  sub_25DDA2ED8();
                  return v74;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v10 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
        int64_t v66 = v16;
      }
      uint64_t v18 = v64;
      uint64_t v19 = (uint64_t *)(*(void *)(v65 + 48) + 16 * v13);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = v67;
      unint64_t v23 = v63;
      unint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v64 + 16);
      v24(&v63[*(int *)(v67 + 48)], *(void *)(v65 + 56) + *(void *)(v64 + 72) * v13, v2);
      void *v23 = v21;
      v23[1] = v20;
      uint64_t v25 = v68;
      sub_25DDA2F10((uint64_t)v23, (uint64_t)v68, &qword_26A6C7988);
      unint64_t v26 = (char *)v25 + *(int *)(v22 + 48);
      id v27 = v69;
      v24(v69, (unint64_t)v26, v2);
      int v28 = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v27, v2);
      if (v28 == v60)
      {
        uint64_t v29 = 0;
        goto LABEL_24;
      }
      if (v28 == v55) {
        break;
      }
      v46 = *v58;
      swift_bridgeObjectRetain();
      v46(v69, v2);
LABEL_30:
      uint64_t result = sub_25DDA2FA0((uint64_t)v68, &qword_26A6C7988);
    }
    uint64_t v29 = 1;
LABEL_24:
    uint64_t v30 = v69;
    uint64_t v31 = (*v59)(v69, v2);
    uint64_t v32 = *((void *)v30 + 1);
    MEMORY[0x270FA5388](v31);
    v52[-4] = v29;
    v52[-3] = v33;
    v52[-2] = v32;
    objc_allocWithZone((Class)SUIBIntelligenceFlowParameterSummary);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_25DDA181C((uint64_t)sub_25DDA2BB8, (uint64_t)&v52[-6]);
    swift_bridgeObjectRelease();
    if (!v34) {
      goto LABEL_30;
    }
    uint64_t v35 = v54;
    uint64_t v36 = (char *)v54 + *(int *)(v67 + 48);
    uint64_t v38 = *v68;
    uint64_t v37 = v68[1];
    void *v54 = *v68;
    v35[1] = v37;
    (*v53)(v36, v26, v2);
    uint64_t v39 = v74;
    unint64_t v40 = *(void *)(v74 + 16);
    if (*(void *)(v74 + 24) <= v40)
    {
      sub_25DDA2BD8(v40 + 1, 1);
      uint64_t v39 = v74;
    }
    sub_25DDACCB0();
    sub_25DDACA90();
    uint64_t result = sub_25DDACCC0();
    uint64_t v41 = v39 + 64;
    uint64_t v42 = -1 << *(unsigned char *)(v39 + 32);
    unint64_t v43 = result & ~v42;
    unint64_t v44 = v43 >> 6;
    if (((-1 << v43) & ~*(void *)(v39 + 64 + 8 * (v43 >> 6))) == 0) {
      break;
    }
    unint64_t v45 = __clz(__rbit64((-1 << v43) & ~*(void *)(v39 + 64 + 8 * (v43 >> 6)))) | v43 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)(v41 + ((v45 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v45;
    v51 = (void *)(*(void *)(v39 + 48) + 16 * v45);
    void *v51 = v38;
    v51[1] = v37;
    *(void *)(*(void *)(v39 + 56) + 8 * v45) = v34;
    ++*(void *)(v39 + 16);
  }
  char v47 = 0;
  unint64_t v48 = (unint64_t)(63 - v42) >> 6;
  while (++v44 != v48 || (v47 & 1) == 0)
  {
    BOOL v49 = v44 == v48;
    if (v44 == v48) {
      unint64_t v44 = 0;
    }
    v47 |= v49;
    uint64_t v50 = *(void *)(v41 + 8 * v44);
    if (v50 != -1)
    {
      unint64_t v45 = __clz(__rbit64(~v50)) + (v44 << 6);
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void sub_25DDA0278()
{
  OUTLINED_FUNCTION_4();
  uint64_t v86 = v0;
  uint64_t v2 = v1;
  uint64_t v3 = sub_25DDAC700();
  OUTLINED_FUNCTION_0();
  uint64_t v83 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_47();
  uint64_t v82 = v6;
  uint64_t v7 = sub_25DDAC750();
  OUTLINED_FUNCTION_0();
  uint64_t v85 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_47();
  uint64_t v84 = v10;
  uint64_t v87 = sub_25DDAC710();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_25DDAC9E0();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_26B380680);
  id v18 = v2;
  uint64_t v19 = sub_25DDAC9D0();
  os_log_type_t v20 = sub_25DDACB10();
  BOOL v21 = os_log_type_enabled(v19, v20);
  id v88 = v18;
  if (v21)
  {
    uint64_t v22 = OUTLINED_FUNCTION_8();
    uint64_t v81 = v17;
    unint64_t v23 = (uint8_t *)v22;
    v89 = OUTLINED_FUNCTION_33();
    v80 = v15;
    *(_DWORD *)unint64_t v23 = 136315138;
    uint64_t v24 = sub_25DDAC760();
    uint64_t v79 = v3;
    uint64_t v26 = sub_25DDA2008(v24, v25, (uint64_t *)&v89);
    OUTLINED_FUNCTION_9(v26);
    unint64_t v15 = v80;
    sub_25DDACBC0();

    uint64_t v3 = v79;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD92000, v19, v20, "Received status update message - extending timeout interval for rootRequestId: %s", v23, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
  }
  id v27 = *(void **)(v86 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper);
  int v28 = (SEL *)&_swift_FORCE_LOAD___swiftunistd___SiriUIBridge;
  if (objc_msgSend(v27, sel_respondsToSelector_, sel_extendRequestTimeoutBy_forRequestID_))
  {
    if ((objc_msgSend(v27, sel_respondsToSelector_, sel_extendRequestTimeoutBy_forRequestID_) & 1) == 0) {
      goto LABEL_12;
    }
    swift_unknownObjectRetain();
    sub_25DDAC760();
    uint64_t v29 = (void *)sub_25DDACA60();
    objc_msgSend(v27, sel_extendRequestTimeoutBy_forRequestID_, v29, 20.0);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v29 = (void *)sub_25DDAC9D0();
    os_log_type_t v30 = sub_25DDACB20();
    if (OUTLINED_FUNCTION_21(v30))
    {
      uint64_t v31 = (_WORD *)OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_40(v31);
      OUTLINED_FUNCTION_13(&dword_25DD92000, v32, v33, "Not extending timeout. AFRequestDispatcherServiceHelper instance does not have extendRequestTimeout optional method implemented");
      OUTLINED_FUNCTION_2_0();
    }
  }

LABEL_12:
  id v34 = v88;
  sub_25DDAC6C0();
  int v35 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v15, v87);
  if (v35 == *MEMORY[0x263F709A0])
  {
    uint64_t v36 = OUTLINED_FUNCTION_23();
    v37(v36);
    uint64_t v39 = v84;
    uint64_t v38 = v85;
    (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))(v84, v15, v7);
    OUTLINED_FUNCTION_35();
    MEMORY[0x270FA5388](v40);
    *(&v79 - 2) = v39;
    id v41 = objc_allocWithZone((Class)SUIBIntelligenceFlowActionSummary);
    uint64_t v42 = (void *)sub_25DDA1938((uint64_t)sub_25DDA2B4C, (uint64_t)(&v79 - 4));
    OUTLINED_FUNCTION_35();
    MEMORY[0x270FA5388](v43);
    OUTLINED_FUNCTION_46();
    id v44 = objc_allocWithZone((Class)SUIBRequestProgress);
    unint64_t v45 = (void *)sub_25DDA1A54((uint64_t)sub_25DDA2B54, (uint64_t)(&v79 - 4));

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v7);
  }
  else
  {
    if (v35 != *MEMORY[0x263F70998])
    {
      uint64_t v86 = v12;
      v68 = v34;
      v69 = sub_25DDAC9D0();
      os_log_type_t v70 = sub_25DDACB20();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = (_DWORD *)OUTLINED_FUNCTION_8();
        uint64_t v72 = (void *)OUTLINED_FUNCTION_20();
        *uint64_t v71 = 138412290;
        v89 = v68;
        unint64_t v73 = v68;
        sub_25DDACBC0();
        *uint64_t v72 = v68;

        OUTLINED_FUNCTION_36(&dword_25DD92000, v74, v75, "Failed to parse StatusUpdate message: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();
      }
      else
      {

        v69 = v68;
      }

      (*(void (**)(char *, uint64_t))(v86 + 8))(v15, v87);
      goto LABEL_33;
    }
    uint64_t v46 = OUTLINED_FUNCTION_23();
    v47(v46);
    uint64_t v49 = v82;
    uint64_t v48 = v83;
    (*(void (**)(uint64_t, char *, uint64_t))(v83 + 32))(v82, v15, v3);
    OUTLINED_FUNCTION_35();
    MEMORY[0x270FA5388](v50);
    *(&v79 - 2) = v49;
    id v51 = objc_allocWithZone((Class)SUIBIntelligenceFlowProgressUpdate);
    v52 = (void *)sub_25DDA1B70((uint64_t)sub_25DDA2B1C, (uint64_t)(&v79 - 4));
    OUTLINED_FUNCTION_35();
    MEMORY[0x270FA5388](v53);
    OUTLINED_FUNCTION_46();
    id v54 = objc_allocWithZone((Class)SUIBRequestProgress);
    unint64_t v45 = (void *)sub_25DDA1A54((uint64_t)sub_25DDA2B24, (uint64_t)(&v79 - 4));

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v3);
  }
  if (v45)
  {
    int v55 = v45;
    uint64_t v56 = sub_25DDAC9D0();
    os_log_type_t v57 = sub_25DDACB10();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)OUTLINED_FUNCTION_8();
      v59 = (void *)OUTLINED_FUNCTION_20();
      *(_DWORD *)v58 = 138412290;
      v89 = v55;
      int v60 = v55;
      int v28 = (SEL *)&_swift_FORCE_LOAD___swiftunistd___SiriUIBridge;
      sub_25DDACBC0();
      void *v59 = v45;

      _os_log_impl(&dword_25DD92000, v56, v57, "Calling delegate's receivedRequestProgress with %@", v58, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      uint64_t v56 = v55;
    }

    v76 = *(void **)(v86 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v76)
    {
      id v77 = v76;
      v78 = (void *)sub_25DD9AD60();

      if (v78)
      {
        if ((objc_msgSend(v78, v28[157], sel_uiBridgeServiceReceivedRequestProgress_) & 1) == 0)
        {

          swift_unknownObjectRelease();
          goto LABEL_33;
        }
        objc_msgSend(v78, sel_uiBridgeServiceReceivedRequestProgress_, v55);
        swift_unknownObjectRelease();
      }
    }
    goto LABEL_29;
  }
  int v55 = v88;
  uint64_t v61 = sub_25DDAC9D0();
  os_log_type_t v62 = sub_25DDACB20();
  if (!os_log_type_enabled(v61, v62))
  {

LABEL_29:
    goto LABEL_33;
  }
  v63 = (_DWORD *)OUTLINED_FUNCTION_8();
  uint64_t v64 = (void *)OUTLINED_FUNCTION_20();
  _DWORD *v63 = 138412290;
  v89 = v55;
  uint64_t v65 = v55;
  sub_25DDACBC0();
  *uint64_t v64 = v55;

  OUTLINED_FUNCTION_36(&dword_25DD92000, v66, v67, "Failed to parse StatusUpdate message: %@");
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_0();

LABEL_33:
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA0B34(void *a1)
{
  sub_25DDAC730();
  uint64_t v2 = (void *)sub_25DDACA60();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setFormatString_, v2);

  uint64_t v3 = MEMORY[0x2611C5DF0]();
  sub_25DD9FBD4(v3);
  swift_bridgeObjectRelease();
  sub_25DD9A0C8(0, &qword_26A6C7980);
  id v4 = (id)sub_25DDACA40();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setParameterSummaries_, v4);
}

void sub_25DDA0C1C(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_setValueType_, a2);
  id v3 = (id)sub_25DDACA60();
  objc_msgSend(a1, sel_setValue_, v3);
}

void sub_25DDA0C9C(void *a1)
{
  sub_25DDAC6F0();
  objc_msgSend(a1, sel_setProgress_);
  sub_25DDAC6E0();
  if (v2)
  {
    id v3 = (void *)sub_25DDACA60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_msgSend(a1, sel_setProgressDescription_, v3);

  sub_25DDAC6D0();
  if (v4)
  {
    id v5 = (id)sub_25DDACA60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  objc_msgSend(a1, sel_setAdditionalProgressDescription_, v5);
}

id sub_25DDA0D6C(void *a1, uint64_t a2, uint64_t a3, const char **a4)
{
  objc_msgSend(a1, sel_setProgressType_);
  uint64_t v7 = *a4;
  return objc_msgSend(a1, v7, a2);
}

void sub_25DDA0DC4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7978);
  uint64_t v6 = OUTLINED_FUNCTION_42(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  uint64_t v7 = sub_25DDAC520();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_25DDAC530();
  if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v7) != 1)
  {
    uint64_t v11 = OUTLINED_FUNCTION_16();
    uint64_t v13 = v12(v11);
    uint64_t v14 = (uint64_t)&v33;
    MEMORY[0x270FA5388](v13);
    OUTLINED_FUNCTION_44();
    id v15 = objc_allocWithZone((Class)SUIBSiriInAppResponse);
    uint64_t v16 = v4;
    uint64_t v17 = (uint64_t)v15;
    sub_25DDA1C8C((uint64_t)sub_25DDA2AEC, v16);
    OUTLINED_FUNCTION_34();
    MEMORY[0x270FA5388](v18);
    OUTLINED_FUNCTION_45();
    id v19 = objc_allocWithZone((Class)SUIBSiriResponse);
    os_log_type_t v20 = (void *)sub_25DDA1DA8((uint64_t)sub_25DDA3588, v17);
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25DDAC9E0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B380680);
    uint64_t v22 = v20;
    unint64_t v23 = sub_25DDAC9D0();
    os_log_type_t v24 = sub_25DDACB10();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v14 = 12;
      OUTLINED_FUNCTION_8();
      uint64_t v25 = OUTLINED_FUNCTION_20();
      uint64_t v35 = v9;
      uint64_t v36 = v22;
      id v34 = (void *)v25;
      OUTLINED_FUNCTION_12(5.7779e-34);
      OUTLINED_FUNCTION_11();
      *id v34 = v22;

      OUTLINED_FUNCTION_39(&dword_25DD92000, v26, v27, "Calling delegate's receivedSiriResponse with %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      unint64_t v23 = v22;
    }

    int v28 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v28 && (id v29 = v28, v30 = (void *)OUTLINED_FUNCTION_27(), (id)v14, v30))
    {
      if ((objc_msgSend(v30, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSiriResponse_) & 1) == 0)
      {

        swift_unknownObjectRelease();
        goto LABEL_14;
      }
      OUTLINED_FUNCTION_41((uint64_t)v22);
      swift_unknownObjectRelease();
    }
    else
    {
    }
LABEL_14:
    uint64_t v31 = OUTLINED_FUNCTION_32();
    v32(v31);
    goto LABEL_15;
  }
  sub_25DDA2FA0((uint64_t)v1, &qword_26A6C7978);
LABEL_15:
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA10C4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7968);
  uint64_t v6 = OUTLINED_FUNCTION_42(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  uint64_t v7 = sub_25DDAC460();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_19();
  sub_25DDAC470();
  if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v7) != 1)
  {
    uint64_t v11 = OUTLINED_FUNCTION_16();
    uint64_t v13 = v12(v11);
    uint64_t v14 = (uint64_t)&v33;
    MEMORY[0x270FA5388](v13);
    OUTLINED_FUNCTION_44();
    id v15 = objc_allocWithZone((Class)SUIBSiriInAppResponse);
    uint64_t v16 = v4;
    uint64_t v17 = (uint64_t)v15;
    sub_25DDA1C8C((uint64_t)sub_25DDA2A7C, v16);
    OUTLINED_FUNCTION_34();
    MEMORY[0x270FA5388](v18);
    OUTLINED_FUNCTION_45();
    id v19 = objc_allocWithZone((Class)SUIBSiriResponse);
    os_log_type_t v20 = (void *)sub_25DDA1DA8((uint64_t)sub_25DDA2AAC, v17);
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25DDAC9E0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B380680);
    uint64_t v22 = v20;
    unint64_t v23 = sub_25DDAC9D0();
    os_log_type_t v24 = sub_25DDACB10();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v14 = 12;
      OUTLINED_FUNCTION_8();
      uint64_t v25 = OUTLINED_FUNCTION_20();
      uint64_t v35 = v9;
      uint64_t v36 = v22;
      id v34 = (void *)v25;
      OUTLINED_FUNCTION_12(5.7779e-34);
      OUTLINED_FUNCTION_11();
      *id v34 = v22;

      OUTLINED_FUNCTION_39(&dword_25DD92000, v26, v27, "Calling delegate's receivedSiriResponse with %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      unint64_t v23 = v22;
    }

    int v28 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v28 && (id v29 = v28, v30 = (void *)OUTLINED_FUNCTION_27(), (id)v14, v30))
    {
      if ((objc_msgSend(v30, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSiriResponse_) & 1) == 0)
      {

        swift_unknownObjectRelease();
        goto LABEL_14;
      }
      OUTLINED_FUNCTION_41((uint64_t)v22);
      swift_unknownObjectRelease();
    }
    else
    {
    }
LABEL_14:
    uint64_t v31 = OUTLINED_FUNCTION_32();
    v32(v31);
    goto LABEL_15;
  }
  sub_25DDA2FA0((uint64_t)v1, &qword_26A6C7968);
LABEL_15:
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA13C4(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  id v4 = (id)sub_25DDACA60();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setBundleIdentifier_, v4);
}

void sub_25DDA1434()
{
}

void sub_25DDA1488()
{
}

void sub_25DDA1494(const char *a1)
{
  if (qword_26B380558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25DDAC9E0();
  uint64_t v3 = OUTLINED_FUNCTION_22(v2, (uint64_t)qword_26B380680);
  os_log_type_t v4 = sub_25DDACB10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25DD92000, v3, v4, a1, v5, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  sub_25DD9C838();
  sub_25DD9C8B4();
  sub_25DD9C294();
}

id UIBridgeService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void UIBridgeService.init()()
{
}

id UIBridgeService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25DDA1700(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_75;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA181C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_57;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA1938(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_51;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA1A54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_63;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA1B70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_69;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA1C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA3718;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA3714;
  v9[3] = &block_descriptor_45;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDA1DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v9[4] = sub_25DDA2AC0;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25DDA1EC4;
  v9[3] = &block_descriptor_39;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  id v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v6 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

void sub_25DDA1EC4(uint64_t a1, void *a2)
{
  objc_super v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_25DDA1F10()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25DDA1F48()
{
  sub_25DD9C2BC(*(void *)(v0 + 16));
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

void sub_25DDA1F68()
{
  sub_25DD9C63C(*(void *)(v0 + 16));
}

uint64_t sub_25DDA1F70()
{
  uint64_t v1 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_25DDA1FA0()
{
  sub_25DD9CA94(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25DDA1FBC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25DDA1FFC()
{
  sub_25DD9D364(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25DDA2008(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DDA20DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DDA348C((uint64_t)v12, *a3);
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
      sub_25DDA348C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25DDA20DC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25DDA2234((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25DDACBD0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25DDA230C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25DDACC10();
    if (!v8)
    {
      uint64_t result = sub_25DDACC70();
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

void *sub_25DDA2234(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DDACC90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25DDA230C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DDA23A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25DDA2580(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25DDA2580((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DDA23A4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25DDACAA0();
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
  unint64_t v3 = sub_25DDA2518(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25DDACC00();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25DDACC90();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25DDACC70();
  __break(1u);
  return result;
}

void *sub_25DDA2518(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380318);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25DDA2580(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380318);
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
    sub_25DDA2730(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DDA2658(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DDA2658(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25DDACC90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25DDA2730(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25DDACC90();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for UIBridgeService()
{
  return self;
}

uint64_t method lookup function for UIBridgeService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIBridgeService);
}

uint64_t dispatch thunk of UIBridgeService.preheat()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of UIBridgeService.siriDismissed()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of UIBridgeService.siriPrompted()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of UIBridgeService.stopAttending(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of UIBridgeService.stopAttending(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of UIBridgeService.siriWillPrompt()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of UIBridgeService.startAttending()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of UIBridgeService.startAttending(with:deviceId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of UIBridgeService.connectionInterrupted()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of UIBridgeService.connectionInvalidated()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_25DDA2A7C(void *a1)
{
  sub_25DDA13C4(a1, *(void *)(v1 + 16), MEMORY[0x263F70820]);
}

id sub_25DDA2AAC(void *a1)
{
  return objc_msgSend(a1, sel_setInAppResponse_, *(void *)(v1 + 16));
}

uint64_t sub_25DDA2AC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_25DDA2AEC(void *a1)
{
  sub_25DDA13C4(a1, *(void *)(v1 + 16), MEMORY[0x263F70978]);
}

void sub_25DDA2B1C(void *a1)
{
}

id sub_25DDA2B24(void *a1)
{
  return sub_25DDA0D6C(a1, *(void *)(v1 + 16), 2, (const char **)&selRef_setIntelligenceFlowProgressUpdate_);
}

void sub_25DDA2B4C(void *a1)
{
}

id sub_25DDA2B54(void *a1)
{
  return sub_25DDA0D6C(a1, *(void *)(v1 + 16), 1, (const char **)&selRef_setIntelligenceFlowActionSummary_);
}

uint64_t sub_25DDA2B80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

void sub_25DDA2BB8(void *a1)
{
  sub_25DDA0C1C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25DDA2BD8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7990);
  char v38 = a2;
  uint64_t v6 = sub_25DDACC80();
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
    os_log_type_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    unint64_t v23 = *(void **)(*(void *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v24 = v23;
    }
    sub_25DDACCB0();
    sub_25DDACA90();
    uint64_t result = sub_25DDACCC0();
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
    void *v33 = v22;
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
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
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
      sub_25DDA2EE0(0, (unint64_t)(v34 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v34;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25DDA2ED8()
{
  return swift_release();
}

uint64_t sub_25DDA2EE0(uint64_t result, uint64_t a2, void *a3)
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

void sub_25DDA2F08(void *a1)
{
}

uint64_t sub_25DDA2F10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_25DDA2F94(void *a1)
{
}

uint64_t sub_25DDA2FA0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25DDA2FF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25DDA3050()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DDA3088()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25DDA30B8(uint64_t a1)
{
  sub_25DD9E474(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25DDA30C4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void sub_25DDA30D4(uint64_t a1)
{
  sub_25DD9DFC4(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_25DDA30DC()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25DDA310C(uint64_t a1)
{
}

uint64_t sub_25DDA3114()
{
  uint64_t v1 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_25DDA314C()
{
}

void sub_25DDA317C()
{
}

void sub_25DDA31AC()
{
}

void sub_25DDA31DC()
{
}

void sub_25DDA320C()
{
}

void sub_25DDA323C()
{
}

void sub_25DDA326C()
{
}

void sub_25DDA329C()
{
}

void sub_25DDA32CC()
{
}

void sub_25DDA32FC()
{
}

void sub_25DDA332C()
{
}

void sub_25DDA335C()
{
}

void sub_25DDA338C()
{
}

void sub_25DDA33BC()
{
}

void sub_25DDA33EC()
{
}

void sub_25DDA341C()
{
}

void sub_25DDA344C()
{
}

void sub_25DDA347C()
{
  sub_25DD9B934(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_25DDA3484()
{
  return sub_25DD9B63C(*(void **)(v0 + 16));
}

uint64_t sub_25DDA348C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25DDA34EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDA3534(unint64_t *a1, uint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_1_1()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_25DDACA30();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_25DDACBC0();
}

id OUTLINED_FUNCTION_12(float a1)
{
  *(void *)(v5 - 112) = v4;
  *(void *)(v5 - 104) = v1;
  *uint64_t v3 = a1;
  return v2;
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_25DDACBF0();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_21(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_25DDAC9D0();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_24(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_25DD9AD60();
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 152) = *(void *)(v1 + a1);
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_36(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_38(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_39(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

_WORD *OUTLINED_FUNCTION_40(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

id OUTLINED_FUNCTION_41(uint64_t a1)
{
  uint64_t v4 = *(const char **)(v2 + 1184);
  return objc_msgSend(v1, v4, a1);
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_43(double a1)
{
  *(double *)(v1 - 120) = a1;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_52(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_25DDA3C10(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(void *)&v2[OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue] = a2;
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for UIBridgeServiceDelegateWrapper();
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_25DDA3C94()
{
  return sub_25DDA4264(sub_25DDA4D1C);
}

uint64_t sub_25DDA3CF4()
{
  return sub_25DDA4264(sub_25DDA5068);
}

uint64_t sub_25DDA3D54()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRetain();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return sub_25DDA53B4(v0, v1, v2, v3);
}

void sub_25DDA3DB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x2611C6920](v4);
  if (v5)
  {
    objc_super v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x2611C6920](v5 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v7)
    {
      if (objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_))
      {
        if (a3) {
          a3 = (void *)sub_25DDACA60();
        }
        objc_msgSend(v7, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, a3);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_25DDA3EF4(uint64_t a1)
{
  return sub_25DDA418C(a1, sub_25DDA579C);
}

uint64_t sub_25DDA3F60()
{
  return sub_25DDA4264(sub_25DDA5B14);
}

uint64_t sub_25DDA3FC0(char a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  return sub_25DDA5E60(v1, v3, a1);
}

void sub_25DDA4018(uint64_t a1, char a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611C6920](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_super v6 = (void *)MEMORY[0x2611C6920](v4 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v6)
    {
      if (objc_msgSend(v6, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_)) {
        objc_msgSend(v6, sel_uiBridgeServiceDetectedSpeechStart_, a2 & 1);
      }
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_25DDA4114()
{
  return sub_25DDA4264(sub_25DDA61DC);
}

uint64_t sub_25DDA4174(uint64_t a1)
{
  return sub_25DDA418C(a1, sub_25DDA6528);
}

uint64_t sub_25DDA418C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  return a2(v2, v4, a1);
}

uint64_t sub_25DDA424C()
{
  return sub_25DDA4264(sub_25DDA68A0);
}

uint64_t sub_25DDA4264(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v2 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  return a1(v1, v2);
}

void sub_25DDA42C0(uint64_t a1, SEL *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611C6920](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_super v6 = (void *)MEMORY[0x2611C6920](v4 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v6)
    {
      if (objc_msgSend(v6, sel_respondsToSelector_, *a2)) {
        [v6 *a2];
      }
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_25DDA43A8(void *a1)
{
  return sub_25DDA4A0C(a1, (uint64_t (*)(uint64_t, uint64_t, id))sub_25DDA6BEC);
}

uint64_t sub_25DDA4428(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRetain();
  return sub_25DDA6F90(v1, v3, a1);
}

void sub_25DDA4488(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2611C6920](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void *)MEMORY[0x2611C6920](v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v4)
    {
      if (objc_msgSend(v4, sel_respondsToSelector_, sel_uiBridgeServiceDidReceiveTasks_))
      {
        sub_25DDA81D8();
        uint64_t v5 = (void *)sub_25DDACAB0();
        objc_msgSend(v4, sel_uiBridgeServiceDidReceiveTasks_, v5);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_25DDA45BC(uint64_t a1)
{
  return sub_25DDA4614(a1, (uint64_t)&unk_270AC0E08, (uint64_t (*)(void))sub_25DDA8124);
}

uint64_t sub_25DDA45F4(uint64_t a1)
{
  return sub_25DDA4614(a1, (uint64_t)&unk_270AC0DE0, (uint64_t (*)(void))sub_25DDA7FA8);
}

uint64_t sub_25DDA4614(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_retain();
  sub_25DDA7B08(a3, v13);
  swift_release();
  return swift_release();
}

void sub_25DDA4748(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v20 - v10;
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x2611C6920](a1 + 16);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    unint64_t v14 = (void *)MEMORY[0x2611C6920](v12 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v14)
    {
      if (objc_msgSend(v14, sel_respondsToSelector_, *a3))
      {
        uint64_t v15 = sub_25DDAC410();
        OUTLINED_FUNCTION_0();
        uint64_t v17 = v16;
        (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v11, a2, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v15);
        sub_25DDA7FB4((uint64_t)v11, (uint64_t)v9);
        int64_t v19 = 0;
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v15) != 1)
        {
          int64_t v19 = (void *)sub_25DDAC3E0();
          (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v15);
        }
        objc_msgSend(v14, *a3, v19);
        swift_unknownObjectRelease();

        sub_25DDA801C((uint64_t)v11);
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_25DDA493C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_6();
  sub_25DDAC400();
  id v11 = a1;
  a4(v4);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
}

uint64_t sub_25DDA49F4(void *a1)
{
  return sub_25DDA4A0C(a1, (uint64_t (*)(uint64_t, uint64_t, id))sub_25DDA7378);
}

uint64_t sub_25DDA4A0C(void *a1, uint64_t (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v4 = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  id v5 = a1;
  return a2(v2, v4, v5);
}

void sub_25DDA4A7C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611C6920](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = (void *)MEMORY[0x2611C6920](v6 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v8)
    {
      if (objc_msgSend(v8, sel_respondsToSelector_, *a3)) {
        objc_msgSend(v8, *a3, a2);
      }
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_25DDA4B8C()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRetain();
  uint64_t v0 = OUTLINED_FUNCTION_5_0();
  return sub_25DDA771C(v0, v1, v2, v3);
}

void sub_25DDA4BE8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2611C6920](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void *)MEMORY[0x2611C6920](v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v4)
    {
      if (objc_msgSend(v4, sel_respondsToSelector_, sel_uiBridgeServiceDidDetectLanguageMismatch_))
      {
        uint64_t v5 = (void *)sub_25DDACA60();
        objc_msgSend(v4, sel_uiBridgeServiceDidDetectLanguageMismatch_, v5);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_25DDA4D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDACA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDACA30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v13)
  {
    v21[0] = v10;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DDA8414;
    *(void *)(v14 + 24) = a2;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_143;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain_n();
    id v16 = v13;
    sub_25DDACA10();
    v21[1] = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v12, v21[0]);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  int64_t v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20) {
    return swift_release_n();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceWillStartAttending)) {
    objc_msgSend(v20, sel_uiBridgeServiceWillStartAttending);
  }
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA5068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDACA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDACA30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v13)
  {
    v21[0] = v10;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DDA83F0;
    *(void *)(v14 + 24) = a2;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_135_0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain_n();
    id v16 = v13;
    sub_25DDACA10();
    v21[1] = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v12, v21[0]);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  int64_t v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20) {
    return swift_release_n();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttending)) {
    objc_msgSend(v20, sel_uiBridgeServiceDidStartAttending);
  }
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA53B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25DDACA00();
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25DDACA30();
  uint64_t v11 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_25DDA83E4;
    *(void *)(v16 + 24) = v14;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_127;
    uint64_t v17 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    id v18 = v15;
    uint64_t v25 = a4;
    id v19 = v18;
    swift_retain();
    swift_retain();
    sub_25DDACA10();
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v13, v10, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x2611C6920](a2 + 16);
  if (!v20)
  {
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  uint64_t v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x2611C6920](v20 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_bridgeObjectRetain();
  swift_retain();

  if (!v22)
  {
    swift_release();
    goto LABEL_10;
  }
  if (objc_msgSend(v22, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_))
  {
    if (a4) {
      unint64_t v23 = (void *)sub_25DDACA60();
    }
    else {
      unint64_t v23 = 0;
    }
    objc_msgSend(v22, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, v23);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DDA579C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25DDACA30();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA837C;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_116;
    uint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    id v17 = v14;
    swift_retain();
    sub_25DDACA10();
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_))objc_msgSend(v20, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, a3); {
  swift_release();
  }
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA5B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDACA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDACA30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v13)
  {
    v21[0] = v10;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DDA8328;
    *(void *)(v14 + 24) = a2;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_105_0;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain_n();
    id v16 = v13;
    sub_25DDACA10();
    v21[1] = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v12, v21[0]);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20) {
    return swift_release_n();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart)) {
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSpeechStart);
  }
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA5E60(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25DDACA30();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(unsigned char *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA831C;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_97;
    id v16 = _Block_copy(aBlock);
    swift_retain();
    id v17 = v14;
    swift_retain();
    sub_25DDACA10();
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_)) {
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSpeechStart_, a3 & 1);
  }
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA61DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDACA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDACA30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v13)
  {
    v21[0] = v10;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DDA82C0;
    *(void *)(v14 + 24) = a2;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_86;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain_n();
    id v16 = v13;
    sub_25DDACA10();
    v21[1] = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v12, v21[0]);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20) {
    return swift_release_n();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSiriDirectedSpeech)) {
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSiriDirectedSpeech);
  }
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA6528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25DDACA30();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA829C;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_78_0;
    id v16 = _Block_copy(aBlock);
    swift_retain();
    id v17 = v14;
    swift_retain();
    sub_25DDACA10();
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_)) {
    objc_msgSend(v20, sel_uiBridgeServiceReceivedSpeechMitigationResult_, a3);
  }
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_25DDA68A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDACA00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDACA30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v13)
  {
    v21[0] = v10;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_25DDA8278;
    *(void *)(v14 + 24) = a2;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_67;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain_n();
    id v16 = v13;
    sub_25DDACA10();
    v21[1] = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v12, v21[0]);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x2611C6920](a2 + 16);
  if (!v18) {
    return swift_release();
  }
  id v19 = (void *)v18;
  uint64_t v20 = (void *)MEMORY[0x2611C6920](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20) {
    return swift_release_n();
  }
  if (objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceReceivedShowAssetsDownloadPrompt)) {
    objc_msgSend(v20, sel_uiBridgeServiceReceivedShowAssetsDownloadPrompt);
  }
  swift_release_n();
  return swift_unknownObjectRelease();
}

void sub_25DDA6BEC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25DDACA30();
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA8254;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_59;
    id v16 = _Block_copy(aBlock);
    uint64_t v26 = v10;
    id v17 = v16;
    swift_retain();
    id v18 = a3;
    id v19 = v14;
    uint64_t v27 = a3;
    id v20 = v19;
    swift_retain();
    sub_25DDACA10();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v17);
    _Block_release(v17);

    a3 = v27;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v26);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  swift_beginAccess();
  uint64_t v21 = MEMORY[0x2611C6920](a2 + 16);
  if (!v21)
  {
    swift_retain();
    id v25 = a3;
    goto LABEL_9;
  }
  uint64_t v22 = (void *)v21;
  uint64_t v23 = (void *)MEMORY[0x2611C6920](v21 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  id v24 = a3;

  if (!v23)
  {
LABEL_9:
    swift_release();
    goto LABEL_10;
  }
  if (objc_msgSend(v23, sel_respondsToSelector_, sel_uiBridgeServiceReceivedRequestProgress_)) {
    objc_msgSend(v23, sel_uiBridgeServiceReceivedRequestProgress_, v24);
  }
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
LABEL_11:
}

uint64_t sub_25DDA6F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25DDACA30();
  uint64_t v27 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA81D0;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_48;
    id v16 = _Block_copy(aBlock);
    uint64_t v26 = v10;
    id v17 = v16;
    swift_retain();
    swift_bridgeObjectRetain();
    id v18 = v14;
    uint64_t v25 = a2;
    id v19 = v18;
    swift_retain();
    sub_25DDACA10();
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v26);
    swift_release();
    swift_release();
LABEL_9:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x2611C6920](a2 + 16);
  if (!v20)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  uint64_t v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x2611C6920](v20 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  swift_bridgeObjectRetain();

  if (!v22)
  {
LABEL_8:
    swift_release();
    goto LABEL_9;
  }
  if (objc_msgSend(v22, sel_respondsToSelector_, sel_uiBridgeServiceDidReceiveTasks_))
  {
    sub_25DDA81D8();
    uint64_t v23 = (void *)sub_25DDACAB0();
    objc_msgSend(v22, sel_uiBridgeServiceDidReceiveTasks_, v23);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void sub_25DDA7378(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_25DDACA00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25DDACA30();
  uint64_t v28 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_25DDA7F80;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_29;
    id v16 = _Block_copy(aBlock);
    uint64_t v26 = v10;
    id v17 = v16;
    swift_retain();
    id v18 = a3;
    id v19 = v14;
    uint64_t v27 = a3;
    id v20 = v19;
    swift_retain();
    sub_25DDACA10();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v12, v9, v17);
    _Block_release(v17);

    a3 = v27;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v26);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  swift_beginAccess();
  uint64_t v21 = MEMORY[0x2611C6920](a2 + 16);
  if (!v21)
  {
    swift_retain();
    id v25 = a3;
    goto LABEL_9;
  }
  uint64_t v22 = (void *)v21;
  uint64_t v23 = (void *)MEMORY[0x2611C6920](v21 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  id v24 = a3;

  if (!v23)
  {
LABEL_9:
    swift_release();
    goto LABEL_10;
  }
  if (objc_msgSend(v23, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSiriResponse_)) {
    objc_msgSend(v23, sel_uiBridgeServiceReceivedSiriResponse_, v24);
  }
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
LABEL_11:
}

uint64_t sub_25DDA771C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_25DDACA00();
  uint64_t v27 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25DDACA30();
  uint64_t v11 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_25DDA7F70;
    *(void *)(v16 + 24) = v14;
    aBlock[4] = sub_25DDA8500;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25DD9A16C;
    aBlock[3] = &block_descriptor_18_0;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    id v18 = v15;
    uint64_t v25 = a2;
    id v19 = v18;
    swift_retain();
    sub_25DDACA10();
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_25DDA7E90();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
    sub_25DDA7EE0();
    sub_25DDACBF0();
    MEMORY[0x2611C6200](0, v13, v10, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
    swift_release();
    swift_release();
LABEL_9:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x2611C6920](a2 + 16);
  if (!v20)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  uint64_t v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x2611C6920](v20 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  swift_bridgeObjectRetain();

  if (!v22)
  {
LABEL_8:
    swift_release();
    goto LABEL_9;
  }
  if (objc_msgSend(v22, sel_respondsToSelector_, sel_uiBridgeServiceDidDetectLanguageMismatch_))
  {
    uint64_t v23 = (void *)sub_25DDACA60();
    objc_msgSend(v22, sel_uiBridgeServiceDidDetectLanguageMismatch_, v23);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DDA7B08(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v6 = sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25DDACA30();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6();
  uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (!v16) {
    return a1();
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  aBlock[4] = sub_25DDA7E50;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25DD9A16C;
  aBlock[3] = &block_descriptor_2;
  id v18 = _Block_copy(aBlock);
  id v19 = v16;
  swift_retain();
  sub_25DDACA10();
  v21[1] = MEMORY[0x263F8EE78];
  sub_25DDA7E90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA7EE0();
  sub_25DDACBF0();
  MEMORY[0x2611C6200](0, v3, v11, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v3, v12);
  return swift_release();
}

void sub_25DDA7D3C()
{
}

id sub_25DDA7D7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeServiceDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UIBridgeServiceDelegateWrapper()
{
  return self;
}

uint64_t sub_25DDA7E20()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_25DDA7E50()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_25DDA7E90()
{
  unint64_t result = qword_26B380618;
  if (!qword_26B380618)
  {
    sub_25DDACA00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B380618);
  }
  return result;
}

unint64_t sub_25DDA7EE0()
{
  unint64_t result = qword_26B380628;
  if (!qword_26B380628)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B380620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B380628);
  }
  return result;
}

uint64_t sub_25DDA7F34()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25DDA7F70()
{
  sub_25DDA4BE8(*(void *)(v0 + 16));
}

void sub_25DDA7F80()
{
  sub_25DDA4A7C(*(void *)(v0 + 16), *(void *)(v0 + 24), (SEL *)&selRef_uiBridgeServiceReceivedSiriResponse_);
}

void sub_25DDA7FA8()
{
}

uint64_t sub_25DDA7FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDA801C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroy_32Tm()
{
  uint64_t v1 = sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

void sub_25DDA8124()
{
}

void sub_25DDA8130(SEL *a1)
{
  uint64_t v3 = *(void *)(sub_25DDAC410() - 8);
  sub_25DDA4748(*(void *)(v1 + 16), v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_25DDA8198()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v0 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25DDA81D0()
{
  sub_25DDA4488(*(void *)(v0 + 16));
}

unint64_t sub_25DDA81D8()
{
  unint64_t result = qword_26B3802B0;
  if (!qword_26B3802B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B3802B0);
  }
  return result;
}

uint64_t objectdestroy_21Tm()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_25DDA8254()
{
  sub_25DDA4A7C(*(void *)(v0 + 16), *(void *)(v0 + 24), (SEL *)&selRef_uiBridgeServiceReceivedRequestProgress_);
}

void sub_25DDA8278()
{
  sub_25DDA42C0(v0, (SEL *)&selRef_uiBridgeServiceReceivedShowAssetsDownloadPrompt);
}

void sub_25DDA829C()
{
  sub_25DDA4A7C(*(void *)(v0 + 16), *(void *)(v0 + 24), (SEL *)&selRef_uiBridgeServiceReceivedSpeechMitigationResult_);
}

void sub_25DDA82C0()
{
  sub_25DDA42C0(v0, (SEL *)&selRef_uiBridgeServiceDetectedSiriDirectedSpeech);
}

uint64_t sub_25DDA82E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 25, 7);
}

void sub_25DDA831C()
{
  sub_25DDA4018(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_25DDA8328()
{
  sub_25DDA42C0(v0, (SEL *)&selRef_uiBridgeServiceDetectedSpeechStart);
}

uint64_t sub_25DDA834C()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_15();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_25DDA837C()
{
  sub_25DDA4A7C(*(void *)(v0 + 16), *(void *)(v0 + 24), (SEL *)&selRef_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_);
}

uint64_t objectdestroy_10Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25DDA83E4()
{
  sub_25DDA3DB0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_25DDA83F0()
{
  sub_25DDA42C0(v0, (SEL *)&selRef_uiBridgeServiceDidStartAttending);
}

void sub_25DDA8414()
{
  sub_25DDA42C0(v0, (SEL *)&selRef_uiBridgeServiceWillStartAttending);
}

uint64_t sub_25DDA8438(uint64_t a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

void sub_25DDA8548()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = v0;
  int v30 = v2;
  uint64_t v28 = v3;
  uint64_t v29 = v4;
  uint64_t v26 = v5;
  uint64_t v27 = v6;
  uint64_t v25 = v7;
  uint64_t v24 = sub_25DDACB40();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDACB30();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = sub_25DDACA30();
  MEMORY[0x270FA5388](v14 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v15 = (void *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId);
  *uint64_t v15 = 0;
  v15[1] = 0;
  uint64_t v16 = (void *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_requestId);
  *uint64_t v16 = 0;
  v16[1] = 0;
  uint64_t v17 = (void *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId);
  sub_25DDAC1C4();
  *uint64_t v17 = 0;
  v17[1] = 0;
  sub_25DDACA20();
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_25DDAC204((unint64_t *)&qword_26B380590, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380570);
  sub_25DDA3534((unint64_t *)&qword_26B380580, (uint64_t *)&unk_26B380570);
  sub_25DDACBF0();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F8F130], v24);
  *(void *)(v0 + 16) = sub_25DDACB60();
  uint64_t v18 = v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  sub_25DDAC410();
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v18, v25);
  uint64_t v20 = (void *)(v1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_assistantId);
  uint64_t v22 = v27;
  uint64_t v21 = v28;
  *uint64_t v20 = v26;
  v20[1] = v22;
  sub_25DDAC24C(v21, v1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher);
  uint64_t v23 = v29;
  swift_unknownObjectUnownedInit();

  *(unsigned char *)(v1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) = v30;
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA8810()
{
}

void sub_25DDA8830(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)sub_25DDAC8D0());
  uint64_t v3 = sub_25DDAC8C0();
  if (v3)
  {
    oslog = v3;
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25DDAC9E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B380680);
    uint64_t v5 = sub_25DDAC9D0();
    os_log_type_t v6 = sub_25DDACB10();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25DD92000, v5, v6, "Going to post SiriDismissedMessage", v7, 2u);
      MEMORY[0x2611C6880](v7, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_25DDAC860();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DDAC9E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
    oslog = sub_25DDAC9D0();
    os_log_type_t v9 = sub_25DDACB20();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25DD92000, oslog, v9, "Could not create SiriDismissedMessage", v10, 2u);
      MEMORY[0x2611C6880](v10, -1, -1);
    }
  }
}

uint64_t sub_25DDA8A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380560);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709D8];
  uint64_t v10 = sub_25DDAC880();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  sub_25DDAC830();
  swift_bridgeObjectRetain();
  sub_25DDAC820();
  uint64_t v11 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  uint64_t v12 = sub_25DDAC410();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v5, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v12);
  return sub_25DDAC840();
}

void sub_25DDA8BF8()
{
}

void sub_25DDA8C18()
{
  OUTLINED_FUNCTION_4();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6();
  v17[4] = v6;
  uint64_t v18 = v0;
  v17[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v17[2] = sub_25DD9A16C;
  v17[3] = v4;
  uint64_t v15 = _Block_copy(v17);
  swift_retain();
  sub_25DDACA10();
  sub_25DDAC204((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  OUTLINED_FUNCTION_14();
  uint64_t v16 = OUTLINED_FUNCTION_49();
  MEMORY[0x2611C6200](v16);
  _Block_release(v15);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v7);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v11);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA8DE4(uint64_t a1)
{
  if (*(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId + 8))
  {
    MEMORY[0x270FA5388](a1);
    id v2 = objc_allocWithZone((Class)sub_25DDAC8B0());
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_25DDAC8A0();
    swift_bridgeObjectRelease();
    if (v3)
    {
      if (qword_26B380558 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25DDAC9E0();
      __swift_project_value_buffer(v4, (uint64_t)qword_26B380680);
      uint64_t v5 = sub_25DDAC9D0();
      os_log_type_t v6 = sub_25DDACB10();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_25DD92000, v5, v6, "Going to post SiriPromptedMessage", v7, 2u);
        MEMORY[0x2611C6880](v7, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1((void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
      sub_25DDAC860();
    }
    else
    {
      if (qword_26B380558 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_25DDAC9E0();
      __swift_project_value_buffer(v11, (uint64_t)qword_26B380680);
      uint64_t v12 = sub_25DDAC9D0();
      os_log_type_t v13 = sub_25DDACB20();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_25DD92000, v12, v13, "Could not create SiriPromptedMessage", v14, 2u);
        MEMORY[0x2611C6880](v14, -1, -1);
      }
    }
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DDAC9E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
    uint64_t v15 = sub_25DDAC9D0();
    os_log_type_t v9 = sub_25DDACB20();
    if (os_log_type_enabled(v15, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25DD92000, v15, v9, "RootRequestId not found in UISessionProcessor. Cannot attribute the SiriPromptedMessage to a request in the current session, dropping.", v10, 2u);
      MEMORY[0x2611C6880](v10, -1, -1);
    }
  }
}

uint64_t sub_25DDA9120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380560);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709D8];
  uint64_t v10 = sub_25DDAC880();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  sub_25DDAC7E0();
  swift_bridgeObjectRetain();
  sub_25DDAC7D0();
  uint64_t v11 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  uint64_t v12 = sub_25DDAC410();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v5, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v12);
  sub_25DDAC800();
  swift_bridgeObjectRetain();
  return sub_25DDAC7F0();
}

void sub_25DDA9300()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  v21[4] = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  void v21[2] = v6;
  v21[3] = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_18();
  uint64_t v7 = sub_25DDAC900();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v12);
  v21[1] = *(void *)(v0 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v2, v7);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v22[4] = sub_25DDAC134;
  v22[5] = v14;
  v22[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  void v22[2] = sub_25DD9A16C;
  v22[3] = &block_descriptor_120;
  uint64_t v15 = _Block_copy(v22);
  swift_retain();
  sub_25DDACA10();
  v21[5] = MEMORY[0x263F8EE78];
  sub_25DDAC204((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  OUTLINED_FUNCTION_14();
  uint64_t v16 = OUTLINED_FUNCTION_49();
  MEMORY[0x2611C6200](v16);
  _Block_release(v15);
  uint64_t v17 = OUTLINED_FUNCTION_8_0();
  v18(v17);
  uint64_t v19 = OUTLINED_FUNCTION_12_0();
  v20(v19);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA956C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)sub_25DDAC5B0());
  uint64_t v3 = sub_25DDAC560();
  if (v3)
  {
    uint64_t v4 = v3;
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25DDAC9E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B380680);
    uint64_t v6 = sub_25DDAC9D0();
    os_log_type_t v7 = sub_25DDACB10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25DD92000, v6, v7, "Going to post StopAttendingRequestedMessage", v8, 2u);
      MEMORY[0x2611C6880](v8, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_25DDAC860();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25DDAC9E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B380680);
    uint64_t v4 = sub_25DDAC9D0();
    os_log_type_t v10 = sub_25DDACB20();
    if (os_log_type_enabled(v4, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25DD92000, v4, v10, "Could not create StopAttendingMessage", v11, 2u);
      MEMORY[0x2611C6880](v11, -1, -1);
    }
  }
}

uint64_t sub_25DDA9774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380568);
  MEMORY[0x270FA5388](v5 - 8);
  os_log_type_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  MEMORY[0x270FA5388](v8 - 8);
  os_log_type_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380560);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709D8];
  uint64_t v15 = sub_25DDAC880();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_25DDAC590();
  swift_bridgeObjectRetain();
  sub_25DDAC580();
  uint64_t v16 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  uint64_t v17 = sub_25DDAC410();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
  sub_25DDAC5A0();
  uint64_t v18 = sub_25DDAC900();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v7, a3, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v18);
  return sub_25DDAC570();
}

void sub_25DDA99E0()
{
  OUTLINED_FUNCTION_4();
  uint64_t v28 = v1;
  uint64_t v29 = v2;
  uint64_t v4 = v3;
  sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v31 = v8;
  uint64_t v32 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_18();
  uint64_t v9 = sub_25DDAC910();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *(void *)(v0 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v15, v4, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v16, v15, v9);
  uint64_t v19 = (void *)(v18 + v17);
  uint64_t v20 = v29;
  *uint64_t v19 = v28;
  v19[1] = v20;
  v35[4] = sub_25DDABFBC;
  v35[5] = v18;
  v35[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  v35[2] = sub_25DD9A16C;
  v35[3] = &block_descriptor_114;
  uint64_t v21 = _Block_copy(v35);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25DDACA10();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_25DDAC204((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  sub_25DDACBF0();
  uint64_t v22 = OUTLINED_FUNCTION_48();
  MEMORY[0x2611C6200](v22);
  _Block_release(v21);
  uint64_t v23 = OUTLINED_FUNCTION_8_0();
  v24(v23);
  uint64_t v25 = OUTLINED_FUNCTION_12_0();
  v26(v25);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDA9C8C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)sub_25DDAC620());
  uint64_t v3 = sub_25DDAC5C0();
  if (v3)
  {
    uint64_t v4 = v3;
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25DDAC9E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B380680);
    uint64_t v6 = sub_25DDAC9D0();
    os_log_type_t v7 = sub_25DDACB10();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25DD92000, v6, v7, "Going to post StartAttendingRequestedMessage", v8, 2u);
      MEMORY[0x2611C6880](v8, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(void *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_25DDAC860();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25DDAC9E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B380680);
    uint64_t v4 = sub_25DDAC9D0();
    os_log_type_t v10 = sub_25DDACB20();
    if (os_log_type_enabled(v4, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25DD92000, v4, v10, "Could not create StartAttendingRequestedMessage", v11, 2u);
      MEMORY[0x2611C6880](v11, -1, -1);
    }
  }
}

uint64_t sub_25DDA9E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7A10);
  MEMORY[0x270FA5388](v5 - 8);
  os_log_type_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380330);
  MEMORY[0x270FA5388](v8 - 8);
  os_log_type_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B380560);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709D8];
  uint64_t v15 = sub_25DDAC880();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_25DDAC5F0();
  swift_bridgeObjectRetain();
  sub_25DDAC5E0();
  uint64_t v16 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  uint64_t v17 = sub_25DDAC410();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v10, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
  sub_25DDAC610();
  uint64_t v18 = sub_25DDAC910();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v7, a3, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v18);
  sub_25DDAC5D0();
  swift_bridgeObjectRetain();
  return sub_25DDAC600();
}

void sub_25DDAA128()
{
}

void sub_25DDAA150()
{
  uint64_t v0 = sub_25DDAC410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v4 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4)
  {
    Strong = swift_unknownObjectUnownedLoadStrong();
    char v6 = sub_25DDAC500();
    sub_25DD9DE9C(v6 & 1);
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25DDAC9E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v8 = sub_25DDACB10();
    if (os_log_type_enabled(Strong, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25DD92000, Strong, v8, "SpeechStartDetectedMessage does not belong to current session", v9, 2u);
      MEMORY[0x2611C6880](v9, -1, -1);
    }
  }
}

void sub_25DDAA31C()
{
}

void sub_25DDAA344()
{
  OUTLINED_FUNCTION_4();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  uint64_t v9 = v8;
  uint64_t v10 = sub_25DDACA00();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v21 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_6();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v7;
  *(void *)(v17 + 24) = v9;
  v22[4] = v6;
  v22[5] = v17;
  v22[0] = MEMORY[0x263EF8330];
  OUTLINED_FUNCTION_43(COERCE_DOUBLE(1107296256));
  void v22[2] = sub_25DD9A16C;
  v22[3] = v4;
  uint64_t v18 = _Block_copy(v22);
  swift_retain();
  id v19 = v9;
  sub_25DDACA10();
  sub_25DDAC204((unint64_t *)&qword_26B380618, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B380620);
  sub_25DDA3534((unint64_t *)&qword_26B380628, &qword_26B380620);
  sub_25DDACBF0();
  uint64_t v20 = OUTLINED_FUNCTION_48();
  MEMORY[0x2611C6200](v20);
  _Block_release(v18);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v21);
  swift_release();
  OUTLINED_FUNCTION_3_0();
}

void sub_25DDAA550()
{
}

void sub_25DDAA578(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25DDAC410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v8 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) == 1) {
      uint64_t v9 = OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId;
    }
    else {
      uint64_t v9 = OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_requestId;
    }
    uint64_t v17 = (void *)(a1 + v9);
    *uint64_t v17 = 0;
    v17[1] = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25DDAC9E0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B380680);
    id v11 = a2;
    uint64_t v12 = sub_25DDAC9D0();
    os_log_type_t v13 = sub_25DDACB10();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      v18[1] = v11;
      id v16 = v11;
      sub_25DDACBC0();
      *uint64_t v15 = v11;

      _os_log_impl(&dword_25DD92000, v12, v13, "%@ does not belong to current session", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
      swift_arrayDestroy();
      MEMORY[0x2611C6880](v15, -1, -1);
      MEMORY[0x2611C6880](v14, -1, -1);
    }
    else
    {
    }
  }
}

void sub_25DDAA810()
{
}

void sub_25DDAA838()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_0();
  sub_25DDAC850();
  char v3 = sub_25DDAC3F0();
  uint64_t v4 = OUTLINED_FUNCTION_3_1();
  v5(v4);
  if (v3)
  {
    uint64_t v6 = sub_25DDAC810();
    uint64_t v7 = (uint64_t *)(v1 + *v0);
    *uint64_t v7 = v6;
    v7[1] = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25DDAC9E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B380680);
    uint64_t v10 = sub_25DDAC9D0();
    os_log_type_t v11 = sub_25DDACB10();
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_11_0(&dword_25DD92000);
      OUTLINED_FUNCTION_2_0();
    }
  }
}

void sub_25DDAA990()
{
}

void sub_25DDAA9B8(uint64_t a1)
{
  uint64_t v2 = sub_25DDAC410();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v6 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    uint64_t v7 = sub_25DDAC810();
    uint64_t v8 = (uint64_t *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId);
    uint64_t *v8 = v7;
    v8[1] = v9;
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) == 1)
    {
      uint64_t v10 = v8[1];
      os_log_type_t v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId);
      *os_log_type_t v11 = *v8;
      v11[1] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25DDAC9E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B380680);
    os_log_type_t v13 = sub_25DDAC9D0();
    os_log_type_t v14 = sub_25DDACB10();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_25DD92000, v13, v14, "StartRootSpeechRequestMessage does not belong to current session", v15, 2u);
      MEMORY[0x2611C6880](v15, -1, -1);
    }
  }
}

void sub_25DDAABB8()
{
}

void sub_25DDAABE0()
{
  uint64_t v0 = sub_25DDAC410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v4 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4)
  {
    if ((sub_25DDAC670() & 1) == 0)
    {
      Strong = (void *)swift_unknownObjectUnownedLoadStrong();
      sub_25DD9E13C();
    }
    char v6 = swift_unknownObjectUnownedLoadStrong();
    char v7 = sub_25DDAC670();
    sub_25DD9E298(v7 & 1);
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DDAC9E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
    char v6 = sub_25DDAC9D0();
    os_log_type_t v9 = sub_25DDACB10();
    if (os_log_type_enabled(v6, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25DD92000, v6, v9, "MitigationDecisionFinalizedMessage does not belong to current session", v10, 2u);
      MEMORY[0x2611C6880](v10, -1, -1);
    }
  }
}

void sub_25DDAADE0()
{
}

void sub_25DDAAE08()
{
}

void sub_25DDAAE30()
{
  uint64_t v0 = sub_25DDAC410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v4 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4)
  {
    sub_25DDAC4E0();
    if (v5)
    {
      swift_bridgeObjectRelease();
      Strong = swift_unknownObjectUnownedLoadStrong();
      sub_25DD9DB20();
      goto LABEL_13;
    }
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25DDAC9E0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v8 = sub_25DDACB20();
    if (os_log_type_enabled(Strong, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      uint64_t v10 = "RequestId not found in UISessionProcessor";
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25DDAC9E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v8 = sub_25DDACB10();
    if (os_log_type_enabled(Strong, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      uint64_t v10 = "AttendingWillStartMessage does not belong to current session";
LABEL_12:
      _os_log_impl(&dword_25DD92000, Strong, v8, v10, v9, 2u);
      MEMORY[0x2611C6880](v9, -1, -1);
    }
  }
LABEL_13:
}

void sub_25DDAB090()
{
}

void sub_25DDAB0B8()
{
  uint64_t v0 = sub_25DDAC410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v4 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4)
  {
    uint64_t v5 = sub_25DDAC4C0();
    if (v6)
    {
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      Strong = swift_unknownObjectUnownedLoadStrong();
      sub_25DD9D6FC(v7, v8);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25DDAC9E0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v11 = sub_25DDACB20();
    if (os_log_type_enabled(Strong, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      os_log_type_t v13 = "RequestId not found in UISessionProcessor";
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25DDAC9E0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v11 = sub_25DDACB10();
    if (os_log_type_enabled(Strong, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      os_log_type_t v13 = "AttendingStartedMessage does not belong to current session";
LABEL_12:
      _os_log_impl(&dword_25DD92000, Strong, v11, v13, v12, 2u);
      MEMORY[0x2611C6880](v12, -1, -1);
    }
  }
LABEL_13:
}

void sub_25DDAB328()
{
}

void sub_25DDAB350()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_4_0();
  sub_25DDAC850();
  char v2 = sub_25DDAC3F0();
  uint64_t v3 = OUTLINED_FUNCTION_3_1();
  v4(v3);
  if (v2)
  {
    Strong = swift_unknownObjectUnownedLoadStrong();
    v0();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25DDAC9E0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B380680);
    Strong = sub_25DDAC9D0();
    os_log_type_t v7 = sub_25DDACB10();
    if (os_log_type_enabled(Strong, v7))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_11_0(&dword_25DD92000);
      OUTLINED_FUNCTION_2_0();
    }
  }
}

void sub_25DDAB4A8()
{
}

void sub_25DDAB4D0()
{
  uint64_t v0 = sub_25DDAC410();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDAC850();
  char v4 = sub_25DDAC3F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4)
  {
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    uint64_t v6 = sub_25DDAC690();
    sub_25DD9E858(v6, v7);

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25DDAC9E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B380680);
    os_log_type_t v9 = sub_25DDAC9D0();
    os_log_type_t v10 = sub_25DDACB10();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v11 = 0;
      _os_log_impl(&dword_25DD92000, v9, v10, "UnsupportedLanguageDetectedMessage does not belong to current session", v11, 2u);
      MEMORY[0x2611C6880](v11, -1, -1);
    }
  }
}

void sub_25DDAB6A8()
{
}

void sub_25DDAB6D0()
{
}

void sub_25DDAB6F8()
{
}

void sub_25DDAB720()
{
}

void sub_25DDAB748(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  id Strong = (id)swift_unknownObjectUnownedLoadStrong();
  a3(a2);
}

void sub_25DDAB7B0()
{
}

void sub_25DDAB7D8()
{
}

void sub_25DDAB800()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_25DDAC410();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_0();
  sub_25DDAC850();
  char v5 = sub_25DDAC3F0();
  uint64_t v6 = OUTLINED_FUNCTION_3_1();
  v7(v6);
  if (v5)
  {
    id Strong = swift_unknownObjectUnownedLoadStrong();
    v1(v3);
  }
  else
  {
    if (qword_26B380558 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25DDAC9E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B380680);
    os_log_type_t v10 = v3;
    id Strong = sub_25DDAC9D0();
    os_log_type_t v11 = sub_25DDACB10();
    if (os_log_type_enabled(Strong, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      uint64_t v14 = v10;
      sub_25DDACBC0();
      *os_log_type_t v13 = v10;

      _os_log_impl(&dword_25DD92000, Strong, v11, "%@ does not belong to current session", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7970);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_2_0();
    }
    else
    {

      id Strong = v10;
    }
  }

  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_25DDABA1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  sub_25DDAC410();
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  OUTLINED_FUNCTION_17_0();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher);
  swift_unknownObjectUnownedDestroy();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_17_0();
  return v0;
}

uint64_t sub_25DDABAD0()
{
  sub_25DDABA1C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25DDABB28()
{
  return type metadata accessor for UISessionProcessor();
}

uint64_t type metadata accessor for UISessionProcessor()
{
  uint64_t result = qword_26B380368;
  if (!qword_26B380368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDABB78()
{
  uint64_t result = sub_25DDAC410();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_25DDABC50()
{
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_25DDABC9C()
{
}

void sub_25DDABCD0()
{
  sub_25DDAB748(*(void *)(v0 + 16), *(void *)(v0 + 24), (void (*)(uint64_t))sub_25DDA0278);
}

void sub_25DDABD04()
{
  sub_25DDAB748(*(void *)(v0 + 16), *(void *)(v0 + 24), sub_25DD9F1CC);
}

void sub_25DDABD38()
{
}

void sub_25DDABD6C()
{
}

void sub_25DDABDA0()
{
}

void sub_25DDABDAC()
{
}

void sub_25DDABDE8()
{
}

void sub_25DDABDF4()
{
}

void sub_25DDABE00()
{
}

void sub_25DDABE3C()
{
}

void sub_25DDABE48()
{
  sub_25DDAA9B8(*(void *)(v0 + 16));
}

void sub_25DDABE54()
{
}

void sub_25DDABE84()
{
  sub_25DDAA578(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_25DDABE90()
{
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25DDABF00()
{
}

uint64_t sub_25DDABF08()
{
  sub_25DDAC910();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = ((*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_10_0();
  v9(v8);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v7, v6);
}

void sub_25DDABFBC()
{
  sub_25DDAC910();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25DDA9C8C(v1);
}

uint64_t sub_25DDAC050(uint64_t a1)
{
  return sub_25DDA9E98(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25DDAC0A0()
{
  sub_25DDAC900();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_10_0();
  v9(v8);
  return MEMORY[0x270FA0238](v0, v6, v7);
}

void sub_25DDAC134()
{
  sub_25DDAC900();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25DDA956C(v1);
}

uint64_t sub_25DDAC198(uint64_t a1)
{
  return sub_25DDA9774(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_25DDAC1A0()
{
  sub_25DDA8DE4(v0);
}

uint64_t sub_25DDAC1A8(uint64_t a1)
{
  return sub_25DDA9120(a1, *(void *)(v1 + 16));
}

void sub_25DDAC1B4()
{
  sub_25DDA8830(v0);
}

uint64_t sub_25DDAC1BC(uint64_t a1)
{
  return sub_25DDA8A3C(a1, v1);
}

unint64_t sub_25DDAC1C4()
{
  unint64_t result = qword_26B3805A0;
  if (!qword_26B3805A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B3805A0);
  }
  return result;
}

uint64_t sub_25DDAC204(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDAC24C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0 + v1;
}

void OUTLINED_FUNCTION_11_0(void *a1)
{
  _os_log_impl(a1, v2, v3, v1, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_25DDAC410();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DDAC3E0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25DDAC3F0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25DDAC400()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25DDAC410()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25DDAC420()
{
  return MEMORY[0x270FA1338]();
}

uint64_t sub_25DDAC430()
{
  return MEMORY[0x270F3DD20]();
}

uint64_t sub_25DDAC440()
{
  return MEMORY[0x270F3DD28]();
}

uint64_t sub_25DDAC450()
{
  return MEMORY[0x270F68990]();
}

uint64_t sub_25DDAC460()
{
  return MEMORY[0x270F68998]();
}

uint64_t sub_25DDAC470()
{
  return MEMORY[0x270F689A0]();
}

uint64_t sub_25DDAC480()
{
  return MEMORY[0x270F689A8]();
}

uint64_t sub_25DDAC490()
{
  return MEMORY[0x270F68A18]();
}

uint64_t sub_25DDAC4A0()
{
  return MEMORY[0x270F68A28]();
}

uint64_t sub_25DDAC4B0()
{
  return MEMORY[0x270F68B08]();
}

uint64_t sub_25DDAC4C0()
{
  return MEMORY[0x270F68B18]();
}

uint64_t sub_25DDAC4D0()
{
  return MEMORY[0x270F68B28]();
}

uint64_t sub_25DDAC4E0()
{
  return MEMORY[0x270F68FB8]();
}

uint64_t sub_25DDAC4F0()
{
  return MEMORY[0x270F68FC8]();
}

uint64_t sub_25DDAC500()
{
  return MEMORY[0x270F690E8]();
}

uint64_t sub_25DDAC510()
{
  return MEMORY[0x270F69118]();
}

uint64_t sub_25DDAC520()
{
  return MEMORY[0x270F69288]();
}

uint64_t sub_25DDAC530()
{
  return MEMORY[0x270F69290]();
}

uint64_t sub_25DDAC540()
{
  return MEMORY[0x270F69298]();
}

uint64_t sub_25DDAC550()
{
  return MEMORY[0x270F692E8]();
}

uint64_t sub_25DDAC560()
{
  return MEMORY[0x270F69310]();
}

uint64_t sub_25DDAC570()
{
  return MEMORY[0x270F69318]();
}

uint64_t sub_25DDAC580()
{
  return MEMORY[0x270F69320]();
}

uint64_t sub_25DDAC590()
{
  return MEMORY[0x270F69328]();
}

uint64_t sub_25DDAC5A0()
{
  return MEMORY[0x270F69330]();
}

uint64_t sub_25DDAC5B0()
{
  return MEMORY[0x270F69338]();
}

uint64_t sub_25DDAC5C0()
{
  return MEMORY[0x270F693E8]();
}

uint64_t sub_25DDAC5D0()
{
  return MEMORY[0x270F693F0]();
}

uint64_t sub_25DDAC5E0()
{
  return MEMORY[0x270F693F8]();
}

uint64_t sub_25DDAC5F0()
{
  return MEMORY[0x270F69400]();
}

uint64_t sub_25DDAC600()
{
  return MEMORY[0x270F69408]();
}

uint64_t sub_25DDAC610()
{
  return MEMORY[0x270F69410]();
}

uint64_t sub_25DDAC620()
{
  return MEMORY[0x270F69420]();
}

uint64_t sub_25DDAC630()
{
  return MEMORY[0x270F69470]();
}

uint64_t sub_25DDAC640()
{
  return MEMORY[0x270F69478]();
}

uint64_t sub_25DDAC650()
{
  return MEMORY[0x270F69488]();
}

uint64_t sub_25DDAC660()
{
  return MEMORY[0x270F69490]();
}

uint64_t sub_25DDAC670()
{
  return MEMORY[0x270F69518]();
}

uint64_t sub_25DDAC680()
{
  return MEMORY[0x270F69520]();
}

uint64_t sub_25DDAC690()
{
  return MEMORY[0x270F69568]();
}

uint64_t sub_25DDAC6A0()
{
  return MEMORY[0x270F69570]();
}

uint64_t sub_25DDAC6B0()
{
  return MEMORY[0x270F69580]();
}

uint64_t sub_25DDAC6C0()
{
  return MEMORY[0x270F69588]();
}

uint64_t sub_25DDAC6D0()
{
  return MEMORY[0x270F69590]();
}

uint64_t sub_25DDAC6E0()
{
  return MEMORY[0x270F69598]();
}

uint64_t sub_25DDAC6F0()
{
  return MEMORY[0x270F695A0]();
}

uint64_t sub_25DDAC700()
{
  return MEMORY[0x270F695A8]();
}

uint64_t sub_25DDAC710()
{
  return MEMORY[0x270F695B0]();
}

uint64_t sub_25DDAC720()
{
  return MEMORY[0x270F695B8]();
}

uint64_t sub_25DDAC730()
{
  return MEMORY[0x270F695C0]();
}

uint64_t sub_25DDAC740()
{
  return MEMORY[0x270F695C8]();
}

uint64_t sub_25DDAC750()
{
  return MEMORY[0x270F695D0]();
}

uint64_t sub_25DDAC760()
{
  return MEMORY[0x270F695D8]();
}

uint64_t sub_25DDAC770()
{
  return MEMORY[0x270F695E0]();
}

uint64_t sub_25DDAC780()
{
  return MEMORY[0x270F69688]();
}

uint64_t sub_25DDAC790()
{
  return MEMORY[0x270F69690]();
}

uint64_t sub_25DDAC7A0()
{
  return MEMORY[0x270F69698]();
}

uint64_t sub_25DDAC7B0()
{
  return MEMORY[0x270F696A0]();
}

uint64_t sub_25DDAC7C0()
{
  return MEMORY[0x270F69720]();
}

uint64_t sub_25DDAC7D0()
{
  return MEMORY[0x270F69800]();
}

uint64_t sub_25DDAC7E0()
{
  return MEMORY[0x270F69808]();
}

uint64_t sub_25DDAC7F0()
{
  return MEMORY[0x270F69810]();
}

uint64_t sub_25DDAC800()
{
  return MEMORY[0x270F69818]();
}

uint64_t sub_25DDAC810()
{
  return MEMORY[0x270F69820]();
}

uint64_t sub_25DDAC820()
{
  return MEMORY[0x270F69828]();
}

uint64_t sub_25DDAC830()
{
  return MEMORY[0x270F69830]();
}

uint64_t sub_25DDAC840()
{
  return MEMORY[0x270F69838]();
}

uint64_t sub_25DDAC850()
{
  return MEMORY[0x270F69840]();
}

uint64_t sub_25DDAC860()
{
  return MEMORY[0x270F69848]();
}

uint64_t sub_25DDAC870()
{
  return MEMORY[0x270F69850]();
}

uint64_t sub_25DDAC880()
{
  return MEMORY[0x270F69860]();
}

uint64_t sub_25DDAC890()
{
  return MEMORY[0x270F69870]();
}

uint64_t sub_25DDAC8A0()
{
  return MEMORY[0x270F69880]();
}

uint64_t sub_25DDAC8B0()
{
  return MEMORY[0x270F69888]();
}

uint64_t sub_25DDAC8C0()
{
  return MEMORY[0x270F69890]();
}

uint64_t sub_25DDAC8D0()
{
  return MEMORY[0x270F69898]();
}

uint64_t sub_25DDAC8E0()
{
  return MEMORY[0x270F69AF8]();
}

uint64_t sub_25DDAC8F0()
{
  return MEMORY[0x270F69B00]();
}

uint64_t sub_25DDAC900()
{
  return MEMORY[0x270F69B18]();
}

uint64_t sub_25DDAC910()
{
  return MEMORY[0x270F69B28]();
}

uint64_t sub_25DDAC920()
{
  return MEMORY[0x270FA1398]();
}

uint64_t sub_25DDAC930()
{
  return MEMORY[0x270FA2AB0]();
}

uint64_t sub_25DDAC940()
{
  return MEMORY[0x270FA2AC0]();
}

uint64_t sub_25DDAC950()
{
  return MEMORY[0x270F70FE8]();
}

uint64_t sub_25DDAC960()
{
  return MEMORY[0x270F71028]();
}

uint64_t sub_25DDAC970()
{
  return MEMORY[0x270F71030]();
}

uint64_t sub_25DDAC980()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25DDAC990()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25DDAC9A0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25DDAC9B0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25DDAC9C0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25DDAC9D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DDAC9E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DDAC9F0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25DDACA00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25DDACA10()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25DDACA20()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_25DDACA30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25DDACA40()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25DDACA50()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t sub_25DDACA60()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DDACA70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25DDACA80()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DDACA90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DDACAA0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DDACAB0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25DDACAC0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25DDACAD0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25DDACAE0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25DDACAF0()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_25DDACB00()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25DDACB10()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DDACB20()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DDACB30()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25DDACB40()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25DDACB50()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25DDACB60()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25DDACB70()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25DDACB80()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25DDACB90()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_25DDACBA0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_25DDACBB0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25DDACBC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DDACBD0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DDACBE0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25DDACBF0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25DDACC00()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DDACC10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DDACC20()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25DDACC30()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25DDACC40()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25DDACC50()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25DDACC60()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25DDACC70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DDACC80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25DDACC90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DDACCA0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DDACCB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DDACCC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x270F0ECD8]();
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}