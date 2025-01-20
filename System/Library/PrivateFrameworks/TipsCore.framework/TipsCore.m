id TPSAnalyticsChecklistSessionController.init()()
{
  unsigned char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  objc_super v5;

  v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch] = 0;
  v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession] = 0;
  v1 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount];
  *(void *)v1 = 0;
  v1[8] = 1;
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount] = 0;
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted] = 0;
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent] = 0;
  v2 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartTime];
  v3 = sub_19C976560();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer] = 0;
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout] = 0x409C200000000000;
  *(void *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionBackgroundTimeout] = 0x4082C00000000000;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TPSAnalyticsChecklistSessionController();
  return objc_msgSendSuper2(&v5, sel_init);
}

void sub_19C8DE360()
{
  if (!qword_1E9413BB8)
  {
    sub_19C976560();
    unint64_t v0 = sub_19C976C80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9413BB8);
    }
  }
}

id static TPSAnalyticsChecklistSessionController.sharedInstance.getter()
{
  if (qword_1E9413C00 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1E9413BF0;
  return v0;
}

uint64_t sub_19C8DE414()
{
  uint64_t result = sub_19C976620();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_19C8DE4E4()
{
  if (!qword_1EB516E68)
  {
    sub_19C976480();
    unint64_t v0 = sub_19C976C80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB516E68);
    }
  }
}

void sub_19C8DE53C()
{
  if (!qword_1EB516B90)
  {
    sub_19C976710();
    unint64_t v0 = sub_19C976C80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB516B90);
    }
  }
}

uint64_t sub_19C8DE594@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_19C8DE5E4(v4, a2);
}

uint64_t sub_19C8DE5E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_19C8DE64C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSAnalyticsChecklistSessionController()), sel_init);
  qword_1E9413BF0 = (uint64_t)result;
  return result;
}

unint64_t sub_19C8DE6F4()
{
  unint64_t result = qword_1EB516E88;
  if (!qword_1EB516E88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB516E88);
  }
  return result;
}

uint64_t UserGuide.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19C8DE7E4(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_19C8DE838()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  MEMORY[0x1F4188790]();
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_19C976710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8FEEC8((uint64_t)v2, v4);
  swift_endAccess();
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
    sub_19C976AD0();
    swift_release();
  }
  *(void *)(v0 + 112) = 0;
  return swift_release();
}

uint64_t sub_19C8DE978()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x19F39E8A0](v1);
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    v0[6] = v4;
    swift_retain();

    return MEMORY[0x1F4188298](sub_19C8FE5A8, v4, 0);
  }
  else
  {
    v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

void sub_19C8DEAB8(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t type metadata accessor for UserGuideTopic()
{
  return self;
}

Swift::Void __swiftcall NetworkMonitorProxy.stop()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(v1 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_19C8F7118();
  os_unfair_lock_unlock(v2);
  swift_release_n();
}

uint64_t sub_19C8DEBAC()
{
  if (qword_1EB516BD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB516BC0;
  uint64_t v1 = (objc_class *)type metadata accessor for NetworkMonitorProxy();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  uint64_t v3 = OBJC_IVAR___TPSNetworkPathMonitor_serialTasks;
  type metadata accessor for SerialTaskExecutor();
  uint64_t v4 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C08);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(void *)(v4 + 16) = v5;
  *(void *)(v4 + 24) = 0;
  *(void *)&v2[v3] = v4;
  *(void *)&v2[OBJC_IVAR___TPSNetworkPathMonitor_monitor] = v0;
  v8.receiver = v2;
  v8.super_class = v1;
  swift_retain_n();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  uint64_t result = swift_release();
  qword_1EB516BE0 = (uint64_t)v6;
  return result;
}

unint64_t sub_19C8DECB0()
{
  type metadata accessor for NetworkMonitor();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  uint64_t v1 = v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  uint64_t v2 = sub_19C976710();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers;
  unint64_t result = sub_19C8FE0E8(MEMORY[0x1E4FBC860]);
  *(void *)(v0 + v3) = result;
  qword_1EB516BC0 = v0;
  return result;
}

id TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = &v6[OBJC_IVAR___TPSAssetsInfo_videoIdentifier];
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = (uint64_t)&v6[OBJC_IVAR___TPSAssetsInfo_videoURL];
  uint64_t v11 = sub_19C976480();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v13 = &v6[OBJC_IVAR___TPSAssetsInfo_imageIdentifier];
  *(void *)v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = (uint64_t)&v6[OBJC_IVAR___TPSAssetsInfo_imageURL];
  v12((uint64_t)&v6[OBJC_IVAR___TPSAssetsInfo_imageURL], 1, 1, v11);
  swift_beginAccess();
  *(void *)v9 = a1;
  *((void *)v9 + 1) = a2;
  v15 = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_19C8DEF94(a3, v10);
  swift_endAccess();
  swift_beginAccess();
  *(void *)v13 = a4;
  *((void *)v13 + 1) = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_19C8DEF94(a6, v14);
  swift_endAccess();

  v23.receiver = v15;
  v23.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v23, sel_init);
  sub_19C8DEF34(a6);
  sub_19C8DEF34(a3);
  return v16;
}

uint64_t sub_19C8DEF34(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19C8DEF94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_19C8DEFFC()
{
  uint64_t v2 = *(void *)(sub_19C9765A0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  id v6 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  void *v9 = v1;
  v9[1] = sub_19C8E59E4;
  return sub_19C8DF110(v4, v5, v7, v8);
}

uint64_t sub_19C8DF110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9413BA0);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C8DFCB8, 0, 0);
}

uint64_t sub_19C8DF1B8()
{
  id v0 = objc_msgSend(self, sel_clientBundleIdentifier);
  if (v0)
  {
    sub_19C9768B0();

    sub_19C9768F0();
    swift_bridgeObjectRelease();
  }
  int v1 = os_variant_allows_internal_security_policies();
  swift_unknownObjectRelease();
  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  unint64_t v3 = (void *)sub_19C976880();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_19C8F5AE0((uint64_t)v14, (uint64_t)&v15);
  if (!v17)
  {
    sub_19C8F58A0((uint64_t)&v15);
    return 1;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  uint64_t v5 = v13;
  if (qword_1EB516EA8 != -1) {
    swift_once();
  }
  uint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  uint64_t v6 = (id)qword_1EB516EB0;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t v15 = 0xD00000000000002ELL;
  unint64_t v16 = 0x800000019C986900;
  sub_19C976920();
  swift_bridgeObjectRelease();
  uint64_t v8 = v15;
  unint64_t v7 = v16;
  os_log_type_t v9 = sub_19C976BB0();
  if (os_log_type_enabled(v6, v9))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v14[0] = sub_19C8F5F20(v8, v7, &v15);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v6, v9, "%s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v11, -1, -1);
    MEMORY[0x19F39E7F0](v10, -1, -1);
  }

  swift_bridgeObjectRelease();
  return v5;
}

Swift::Void __swiftcall UserGuide.encode(with:)(NSCoder with)
{
  unint64_t v3 = (void *)sub_19C976880();
  id v4 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  uint64_t v5 = v1 + OBJC_IVAR___TPSUserGuide_version;
  swift_beginAccess();
  if (*(void *)(v5 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];
  swift_unknownObjectRelease();

  uint64_t v8 = (void *)sub_19C976880();
  os_log_type_t v9 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];

  uint64_t v10 = (void *)sub_19C976880();
  uint64_t v11 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v10 forKey:v11];

  if (*(void *)(v1 + OBJC_IVAR___TPSUserGuide_platform + 8)) {
    uint64_t v12 = sub_19C976880();
  }
  else {
    uint64_t v12 = 0;
  }
  unsigned __int8 v13 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v12 forKey:v13];
  swift_unknownObjectRelease();

  uint64_t v14 = *(unsigned __int8 *)(v1 + OBJC_IVAR___TPSUserGuide_platformIndependent);
  uint64_t v15 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeBool:v14 forKey:v15];

  unint64_t v16 = (void *)sub_19C9769D0();
  uint64_t v17 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v16 forKey:v17];
}

uint64_t UserGuide.init(coder:)(void *a1)
{
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  uint64_t v2 = sub_19C976C20();
  if (v2)
  {
    unint64_t v3 = (void *)v2;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    sub_19C9768A0();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_19C8DFBA0(uint64_t a1, unint64_t *a2)
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

id sub_19C8DFBDC(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)sub_19C976880();
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
    sub_19C9763E0();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_19C8DFCB8()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x19F39E8A0](v1);
  if (v2)
  {
    unint64_t v3 = (void *)v2;
    uint64_t v4 = v0[8];
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v8 = *(void *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    v0[11] = v8;
    swift_retain();

    uint64_t v9 = sub_19C9765A0();
    v0[12] = v9;
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v5, v6, v9);
    uint64_t v11 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
    v0[13] = v11;
    v0[14] = (v10 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v11(v5, 0, 1, v9);
    uint64_t v12 = swift_allocObject();
    v0[15] = v12;
    *(void *)(v12 + 16) = v7;
    *(void *)(v12 + 24) = v4;
    swift_retain();
    return MEMORY[0x1F4188298](sub_19C8E0108, v8, 0);
  }
  else
  {
    uint64_t v13 = sub_19C9765A0();
    uint64_t v14 = v0[10];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v14, 1, 1, v13);
    sub_19C947374(v14);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_19C8DFEC8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  (*(void (**)(uint64_t, void, uint64_t, void))(v0 + 104))(v1, 0, 1, *(void *)(v0 + 96));
  sub_19C947374(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19C8DFF58()
{
  return sub_19C8DFF78(v0[2], v0[3], v0[4]);
}

uint64_t sub_19C8DFF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516BF0);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_19C976AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = (void *)swift_allocObject();
  id v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  v10[5] = a2;
  v10[6] = a3;
  swift_retain();
  swift_retain();
  *(void *)(a1 + 24) = sub_19C957D08((uint64_t)v7, (uint64_t)&unk_1E9414760, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_19C8E00AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19C8E0108()
{
  uint64_t v1 = v0[9];
  sub_19C8E01B4(v1, (uint64_t)sub_19C94734C, v0[15], v0[10]);
  swift_release();
  swift_release();
  sub_19C947374(v1);
  return MEMORY[0x1F4188298](sub_19C8DFEC8, 0, 0);
}

uint64_t sub_19C8E01B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = sub_19C9765A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9413BA0);
  MEMORY[0x1F4188790]();
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C8E0974(a1, (uint64_t)v14, (uint64_t *)&unk_1E9413BA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
  {
    sub_19C976590();
    sub_19C8E00AC((uint64_t)v14, (uint64_t *)&unk_1E9413BA0);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a4, v14, v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  unint64_t v16 = (uint64_t *)(v4 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *v16;
  *unint64_t v16 = 0x8000000000000000;
  sub_19C8E0414((uint64_t)sub_19C958ED0, v15, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
  *unint64_t v16 = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_endAccess();
}

uint64_t sub_19C8E0414(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v28 = a2;
  uint64_t v9 = sub_19C9765A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_19C8E05CC(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = *v5;
    if (v19)
    {
LABEL_8:
      v22 = (uint64_t *)(v21[7] + 16 * v15);
      uint64_t result = swift_release();
      uint64_t v24 = v28;
      uint64_t *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_19C95CFD8();
    goto LABEL_7;
  }
  sub_19C8E09D8(v18, a4 & 1);
  unint64_t v25 = sub_19C8E05CC(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = sub_19C977010();
    __break(1u);
    return result;
  }
  unint64_t v15 = v25;
  v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_19C8E08B4(v15, (uint64_t)v12, a1, v28, v21);
}

unint64_t sub_19C8E05CC(uint64_t a1)
{
  sub_19C9765A0();
  sub_19C95DBFC(&qword_1E9413BC0, MEMORY[0x1E4F27990]);
  uint64_t v2 = sub_19C976820();
  return sub_19C8E06F4(a1, v2);
}

uint64_t sub_19C8E0664(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_19C8E06AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_19C8E06F4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_19C9765A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_19C95DBFC(&qword_1E9413BC8, MEMORY[0x1E4F27990]);
      char v15 = sub_19C976850();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_19C8E08B4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_19C9765A0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = (void *)(a5[7] + 16 * a1);
  void *v13 = a3;
  v13[1] = a4;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

uint64_t sub_19C8E0974(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_19C8E09D8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_19C9765A0();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C38);
  int v45 = a2;
  uint64_t v9 = sub_19C976ED0();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      uint64_t v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        long long v47 = *(_OWORD *)(*(void *)(v8 + 56) + 16 * v20);
      }
      else
      {
        (*v41)(v43, v26, v44);
        long long v47 = *(_OWORD *)(*(void *)(v8 + 56) + 16 * v20);
        swift_retain();
      }
      sub_19C8E0E04(&qword_1E9413BC0, MEMORY[0x1E4F27990]);
      uint64_t result = sub_19C976820();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v46)(*(void *)(v10 + 48) + v25 * v18, v27, v28);
      *(_OWORD *)(*(void *)(v10 + 56) + 16 * v18) = v47;
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_19C8E0E04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_19C8E0FD0()
{
  return sub_19C976BF0();
}

void sub_19C8E26F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8E3454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8E4F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t type metadata accessor for UserGuide()
{
  uint64_t result = qword_1EB516DE0;
  if (!qword_1EB516DE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for TipsLog()
{
  return &type metadata for TipsLog;
}

id sub_19C8E50D8@<X0>(void *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = *a2;
  *a3 = *a2;
  return v5;
}

id static TipsLog.default.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516EA8, (void **)&qword_1EB516EB0, a1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_19C8E5324(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_19C8E6C34(_Unwind_Exception *a1)
{
}

void sub_19C8E8720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 232), 8);
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}

void sub_19C8E9D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8EA3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t type metadata accessor for TPSAnalyticsChecklistSessionController()
{
  uint64_t result = qword_1E9413C20;
  if (!qword_1E9413C20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_19C8EB5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPPCRedirectClass_block_invoke(uint64_t a1)
{
  if (!PingPongClientLibraryCore_0())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("PPCRedirect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPPCRedirectClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __getPPCRedirectClass_block_invoke_cold_1();
    return (Class)PingPongClientLibraryCore(v4);
  }
  return result;
}

uint64_t PingPongClientLibraryCore()
{
  if (!PingPongClientLibraryCore_frameworkLibrary) {
    PingPongClientLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PingPongClientLibraryCore_frameworkLibrary;
}

uint64_t PingPongClientLibraryCore_0()
{
  if (!PingPongClientLibraryCore_frameworkLibrary_0) {
    PingPongClientLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return PingPongClientLibraryCore_frameworkLibrary_0;
}

void sub_19C8EBFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19C8EC14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8ECBB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_19C8ECC20(void *a1)
{
  sub_19C8ECC28(a1, v1);
}

void sub_19C8ECC28(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x19F39E8A0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (a1) {
      a1 = (void *)sub_19C9763D0();
    }
    objc_msgSend(v5, sel_finishWithError_, a1);
  }
}

id TPSAsyncBlockOperation.init(asyncBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v2[OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock];
  *(void *)uint64_t v3 = a1;
  *((void *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for TPSAsyncBlockOperation()
{
  return self;
}

void sub_19C8ED100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8ED1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8ED278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t sub_19C8ED518(uint64_t a1, uint64_t a2)
{
  return sub_19C8ED520(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_19C8ED520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_19C8ECBB4;
  v7[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(v7);
  objc_super v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
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

void sub_19C8EF318(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19C8EF8E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8EFC88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8EFE10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8EFFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F02CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0510(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F05CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F06B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0EA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F0F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F1040(_Unwind_Exception *a1)
{
}

void sub_19C8F1100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C8F1214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F18B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F19C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C8F1C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F1DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t logInfo(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19C967BB4(a1, a2, a3, MEMORY[0x1E4FBD370]);
}

Swift::Void __swiftcall TipsLog.info(_:)(Swift::String a1)
{
}

id sub_19C8F31D8(uint64_t a1, uint64_t a2, char a3)
{
  sub_19C8F54D8(a3, &v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
    if (swift_dynamicCast())
    {
      uint64_t v3 = (void *)sub_19C9769D0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v5);
  }
  uint64_t v3 = 0;
LABEL_6:
  return v3;
}

void sub_19C8F3E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a63);
  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F42C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19C8F4570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F4728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C8F5308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_19C8F543C(uint64_t a1, uint64_t a2, char a3)
{
  sub_19C8F54D8(a3, &v5);
  if (v6)
  {
    if (swift_dynamicCast())
    {
      uint64_t v3 = (void *)sub_19C976880();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v5);
  }
  uint64_t v3 = 0;
LABEL_6:
  return v3;
}

uint64_t sub_19C8F54D8@<X0>(char a1@<W0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (byte_1EB516E20 == 1)
  {
    id v5 = objc_msgSend(self, sel_standardUserDefaults);
    sub_19C8F5B48(a1);
    uint64_t v6 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_objectForKey_, v6);

    if (v7)
    {
      sub_19C976D10();
      swift_unknownObjectRelease();
      sub_19C8F58A0((uint64_t)a2);
    }
    else
    {
      sub_19C8F58A0((uint64_t)a2);
      long long v15 = 0u;
      long long v16 = 0u;
    }
    sub_19C8F5AE0((uint64_t)&v15, (uint64_t)a2);
    sub_19C8F5A78((uint64_t)a2, (uint64_t)&v15);
    if (*((void *)&v16 + 1))
    {
      sub_19C8DFBA0(0, &qword_1E94148A0);
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        if (qword_1EB516EA8 != -1) {
          swift_once();
        }
        *(void *)&long long v15 = 0;
        *((void *)&v15 + 1) = 0xE000000000000000;
        uint64_t v8 = (id)qword_1EB516EB0;
        sub_19C976E10();
        sub_19C976920();
        sub_19C976E70();
        sub_19C976920();
        id v9 = objc_msgSend(v14, sel_description);
        sub_19C9768B0();

        sub_19C976920();
        swift_bridgeObjectRelease();
        long long v10 = v15;
        os_log_type_t v11 = sub_19C976BB0();
        if (os_log_type_enabled(v8, v11))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          uint64_t v13 = swift_slowAlloc();
          *(void *)&long long v15 = v13;
          *(_DWORD *)uint64_t v12 = 136315138;
          swift_bridgeObjectRetain();
          sub_19C8F5F20(v10, *((unint64_t *)&v10 + 1), (uint64_t *)&v15);
          sub_19C976CB0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19C8DC000, v8, v11, "%s", v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x19F39E7F0](v13, -1, -1);
          MEMORY[0x19F39E7F0](v12, -1, -1);
        }

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      return sub_19C8F58A0((uint64_t)&v15);
    }
  }
  return result;
}

uint64_t sub_19C8F58A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516E30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t logDebug(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19C967BB4(a1, a2, a3, MEMORY[0x1E4FBD378]);
}

uint64_t sub_19C8F5918(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = *v3;
  os_log_type_t v7 = a3();
  uint64_t result = os_log_type_enabled(v6, v7);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(a1, a2, &v11);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v10, -1, -1);
    return MEMORY[0x19F39E7F0](v9, -1, -1);
  }
  return result;
}

Swift::Void __swiftcall TipsLog.debug(_:)(Swift::String a1)
{
}

uint64_t sub_19C8F5A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19C8F5AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_19C8F5B48(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000028;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000033;
      break;
    case 5:
      unint64_t result = 0xD000000000000027;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0x6369766544535054;
      break;
    case 9:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 10:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 12:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 13:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 14:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 15:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 17:
      unint64_t result = 0xD000000000000016;
      break;
    case 18:
      unint64_t result = 0xD000000000000021;
      break;
    case 19:
      unint64_t result = 0xD000000000000026;
      break;
    case 20:
      unint64_t result = 0xD000000000000016;
      break;
    case 21:
      unint64_t result = 0xD000000000000017;
      break;
    case 22:
      unint64_t result = 0xD000000000000017;
      break;
    case 23:
      unint64_t result = 0x726F6E6749535054;
      break;
    case 24:
    case 30:
    case 35:
    case 36:
    case 38:
      unint64_t result = 0xD000000000000024;
      break;
    case 26:
      unint64_t result = 0xD000000000000020;
      break;
    case 27:
      unint64_t result = 0xD000000000000022;
      break;
    case 28:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 29:
      unint64_t result = 0xD000000000000022;
      break;
    case 31:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 32:
      unint64_t result = 0xD000000000000013;
      break;
    case 33:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 34:
      unint64_t result = 0xD000000000000023;
      break;
    case 37:
      unint64_t result = 0xD000000000000021;
      break;
    case 39:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 40:
      unint64_t result = 0xD000000000000023;
      break;
    case 41:
      unint64_t result = 0xD000000000000012;
      break;
    case 43:
      unint64_t result = 0xD000000000000022;
      break;
    case 44:
      unint64_t result = 0xD000000000000015;
      break;
    case 45:
      unint64_t result = 0xD000000000000017;
      break;
    case 46:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 47:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 48:
      unint64_t result = 0xD000000000000022;
      break;
    case 49:
      unint64_t result = 0xD000000000000015;
      break;
    case 50:
      unint64_t result = 0xD000000000000031;
      break;
    case 51:
      unint64_t result = 0x5472657355535054;
      break;
    case 52:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 53:
      unint64_t result = 0xD000000000000021;
      break;
    case 54:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_19C8F5F20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_19C8F6050(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19C8F5FF4((uint64_t)v12, *a3);
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
      sub_19C8F5FF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19C8F5FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19C8F6050(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_19C976CC0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_19C93C0B0(a5, a6);
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
  uint64_t v8 = sub_19C976E50();
  if (!v8)
  {
    sub_19C976E80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_19C976EF0();
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

Swift::Void __swiftcall TipsLog.log(_:)(Swift::String a1)
{
}

id sub_19C8F652C(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  id v5 = *a4;
  return v5;
}

void sub_19C8F68B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19C8F6D90()
{
}

uint64_t NetworkMonitorProxy.addObserver(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_19C9765A0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v11 = *(void *)(v4 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(&v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v9 + 32))(v14 + v13, &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], v8);
  long long v15 = (void *)(v14 + ((v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  void *v15 = a2;
  v15[1] = a3;
  long long v16 = *(os_unfair_lock_s **)(v11 + 16);
  uint64_t v23 = v11;
  uint64_t v24 = &unk_1E9414738;
  uint64_t v25 = v14;
  unint64_t v20 = sub_19C8F7158;
  int64_t v21 = &v22;
  int64_t v17 = v16 + 4;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v17);
  sub_19C8F7118();
  os_unfair_lock_unlock(v17);
  swift_release();
  return swift_release();
}

uint64_t sub_19C8F7118()
{
  return sub_19C8F7130();
}

uint64_t sub_19C8F7130()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_19C8F7158()
{
  return sub_19C8DFF58();
}

id TPSXPCServerInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEDAF768];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_contentWithCompletionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_logAnalyticsEvent_ argumentIndex:0 ofReply:0];

  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_logAnalyticsEvents_ argumentIndex:0 ofReply:0];

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v6 forSelector:sel_contentForVariant_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v7 forSelector:sel_fetchAssetsWithAssetsConfiguration_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:sel_userGuideMapWithCompletionHandler_ argumentIndex:0 ofReply:1];

  +[TPSSearchQueryXPCInterfaceBuilder configure:v0];
  return v0;
}

void sub_19C8F9EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19C8FA420(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_19C8FCA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DataMigrationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DataMigrationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5907C90;
    uint64_t v5 = 0;
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DataMigrationLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_19C8FE08C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

unint64_t sub_19C8FE0E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516B88);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C38);
  uint64_t v6 = sub_19C976EE0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_19C8E0974(v12, (uint64_t)v5, &qword_1EB516B88);
    unint64_t result = sub_19C8E05CC((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_19C9765A0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(_OWORD *)(v7[7] + 16 * v16) = *(_OWORD *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t UserGuide.version.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuide_version);
}

uint64_t UserGuide.platformIndependent.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___TPSUserGuide_platformIndependent);
}

uint64_t log(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19C967BB4(a1, a2, a3, MEMORY[0x1E4FBD390]);
}

void sub_19C8FE364()
{
  sub_19C8DE360();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0xD8))(a1, a2 & 1);
}

uint64_t sub_19C8FE484(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t sub_19C8FE538()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t type metadata accessor for NetworkMonitorProxy()
{
  return self;
}

uint64_t sub_19C8FE5A8()
{
  sub_19C8DE838();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19C8FE614()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C8E59E4;
  v2[5] = v0;
  return MEMORY[0x1F4188298](sub_19C8DE978, 0, 0);
}

uint64_t type metadata accessor for SerialTaskExecutor()
{
  return self;
}

void sub_19C8FE728()
{
  sub_19C8DE53C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for NetworkMonitor()
{
  uint64_t result = qword_1EB516A90;
  if (!qword_1EB516A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_19C8FE824()
{
  sub_19C8DE4E4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for TPSAssetsInfo()
{
  uint64_t result = qword_1EB516E78;
  if (!qword_1EB516E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19C8FE910()
{
  return type metadata accessor for TPSAssetsInfo();
}

uint64_t TPSAssetsInfo.videoURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19C8DE594(&OBJC_IVAR___TPSAssetsInfo_videoURL, a1);
}

uint64_t TPSAssetsInfo.imageURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19C8DE594(&OBJC_IVAR___TPSAssetsInfo_imageURL, a1);
}

uint64_t TPSAssetsInfo.videoIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

uint64_t TPSAssetsInfo.imageIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

uint64_t sub_19C8FE948(uint64_t a1)
{
  return sub_19C93E114(a1, 0x636974796C616E41, 0xE900000000000073, &qword_1EB516E58);
}

id static TipsLog.indexing.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516A40, (void **)&qword_1EB516A38, a1);
}

uint64_t sub_19C8FE990(uint64_t a1)
{
  return sub_19C93E114(a1, 0x746C7561666544, 0xE700000000000000, &qword_1EB516EB0);
}

uint64_t sub_19C8FE9B0(uint64_t a1)
{
  return sub_19C93E114(a1, 1635017028, 0xE400000000000000, &qword_1EB516E98);
}

uint64_t sub_19C8FEC84()
{
  uint64_t result = sub_19C8DF1B8();
  byte_1EB516E20 = result & 1;
  return result;
}

id sub_19C8FECB8(char a1)
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v2 = 0;
  if (byte_1EB516E20 == 1)
  {
    sub_19C8F54D8(a1, &v7);
    if (v8)
    {
      sub_19C93685C(&v7, v9);
      sub_19C8F5FF4((uint64_t)v9, (uint64_t)&v7);
      sub_19C8DFBA0(0, &qword_1E9414898);
      if (swift_dynamicCast())
      {
        id v2 = v6;
LABEL_10:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
        return v2;
      }
      sub_19C8F5FF4((uint64_t)v9, (uint64_t)&v7);
      if (swift_dynamicCast())
      {
        id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
        uint64_t v4 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        id v2 = objc_msgSend(v3, sel_numberFromString_, v4);

        goto LABEL_10;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
    }
    else
    {
      sub_19C8F58A0((uint64_t)&v7);
    }
    return 0;
  }
  return v2;
}

uint64_t sub_19C8FEEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

double OUTLINED_FUNCTION_0(double a1)
{
  return v1 - a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_19C902DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TPSAnalyticsXPCServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEDAD000];
}

id TPSMiniTipContentManagerServiceInterfaceServerInterface()
{
  unint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEDAF708];
  double v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_contentWithContentIdentifiers_bundleID_context_completionHandler_ argumentIndex:0 ofReply:1];
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v0 setClasses:v4 forSelector:sel_validateAndPrepareContentForDisplay_bundleID_context_skipUsageCheck_completionHandler_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v4 forSelector:sel_validateAndPrepareContentForDisplay_bundleID_context_skipUsageCheck_completionHandler_ argumentIndex:1 ofReply:1];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_logAnalyticsEvent_ argumentIndex:0 ofReply:0];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_logAnalyticsEvents_ argumentIndex:0 ofReply:0];

  return v0;
}

void sub_19C90CFFC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19C911444(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91149C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911558(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C9116EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C9117E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C9119CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911D78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911EBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C911FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912270(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91241C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C9127C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912A8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912BC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912D2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C912E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91314C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91323C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C913490(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C913564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C913608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91369C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C91376C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C914DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C91892C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C91ABE4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19C91AC8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19C91B46C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_19C91B718(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19C91BA50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19C91C658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_19C91CCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_19C921170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C92154C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19C921AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_19C92462C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getDMGetPreviousBuildVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataMigrationLibrary();
  uint64_t result = dlsym(v2, "DMGetPreviousBuildVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMGetPreviousBuildVersionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __DataMigrationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataMigrationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDMGetUserDataDispositionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataMigrationLibrary();
  uint64_t result = dlsym(v2, "DMGetUserDataDisposition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMGetUserDataDispositionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_19C92669C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19C926DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19C928728(_Unwind_Exception *a1)
{
}

void sub_19C9294D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C929824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PingPongClientLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PingPongClientLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPPCExtensibleSSOAuthenticatorClass_block_invoke(uint64_t a1)
{
  PingPongClientLibrary();
  Class result = objc_getClass("PPCExtensibleSSOAuthenticator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPPCExtensibleSSOAuthenticatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPPCExtensibleSSOAuthenticatorClass_block_invoke_cold_1();
    return (Class)PingPongClientLibrary();
  }
  return result;
}

uint64_t PingPongClientLibrary()
{
  uint64_t v0 = PingPongClientLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getkExtensibleSSOUsernameKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PingPongClientLibrary();
  Class result = dlsym(v2, "kExtensibleSSOUsernameKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkExtensibleSSOUsernameKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkExtensibleSSOTokenKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PingPongClientLibrary();
  Class result = dlsym(v2, "kExtensibleSSOTokenKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkExtensibleSSOTokenKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PingPongClientLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PingPongClientLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_19C9312B4(_Unwind_Exception *a1)
{
}

void sub_19C9314C4(_Unwind_Exception *a1)
{
}

void sub_19C9316B8(_Unwind_Exception *a1)
{
}

void sub_19C931738(_Unwind_Exception *a1)
{
}

void sub_19C9347B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C93482C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void *TPSAnalyticsChecklistSession.__allocating_init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, float a5)
{
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 69) = 0;
  *(void *)(v10 + 40) = a1;
  *(void *)(v10 + 48) = a2;
  *(void *)(v10 + 56) = a3;
  *(float *)(v10 + 64) = a5;
  *(unsigned char *)(v10 + 68) = a4;
  return TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019C985100);
}

void *TPSAnalyticsChecklistSession.init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, float a5)
{
  *(unsigned char *)(v5 + 69) = 0;
  *(void *)(v5 + 40) = a1;
  *(void *)(v5 + 48) = a2;
  *(void *)(v5 + 56) = a3;
  *(float *)(v5 + 64) = a5;
  *(unsigned char *)(v5 + 68) = a4;
  return TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019C985100);
}

unint64_t sub_19C935570()
{
  unint64_t v0 = sub_19C935954(MEMORY[0x1E4FBC860], (uint64_t *)&unk_1E94144A8);
  uint64_t v1 = sub_19C976B60();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v1, 0xD000000000000012, 0x800000019C984860, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_19C976B60();
  char v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v3, 0xD000000000000010, 0x800000019C984880, v4, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_19C976B60();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v5, 0xD000000000000016, 0x800000019C9848A0, v6, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_19C976B10();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v7, 0x6570735F656D6974, 0xEA0000000000746ELL, v8, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_19C976A40();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v9, 0x69745F7473726966, 0xEF67616C665F656DLL, v10, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  objc_msgSend(self, sel_isSeniorUser);
  uint64_t v11 = sub_19C976A40();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_19C936658(v11, 0x67616C665F353675, 0xE800000000000000, v12, (void (*)(void))sub_19C95CFCC, (uint64_t *)&unk_1E94144A8);
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_19C9357EC(uint64_t a1)
{
  return sub_19C935954(a1, &qword_1E94144A0);
}

unint64_t sub_19C9357F8(uint64_t a1)
{
  return sub_19C935954(a1, &qword_1E9414480);
}

unint64_t sub_19C935804(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414488);
  uint64_t v2 = sub_19C976EE0();
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
    sub_19C8E0974(v6, (uint64_t)&v15, (uint64_t *)&unk_1E9414490);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_19C95C684(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_19C93685C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_19C93593C(uint64_t a1)
{
  return sub_19C935954(a1, &qword_1E9414478);
}

unint64_t sub_19C935948(uint64_t a1)
{
  return sub_19C935954(a1, &qword_1E9414470);
}

unint64_t sub_19C935954(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_19C976EE0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_19C95C684(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

void TPSAnalyticsChecklistSession.__allocating_init(identifier:)()
{
}

void TPSAnalyticsChecklistSession.init(identifier:)()
{
}

uint64_t TPSAnalyticsChecklistSession.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t TPSAnalyticsChecklistSession.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 70, 7);
}

void sub_19C935B38(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_19C935B44()
{
  return *v0;
}

uint64_t sub_19C935B4C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void sub_19C935B54(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_19C935B5C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_19C935B70@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_19C935B84@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_19C935B98(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_19C935BC8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_19C935BF4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_19C935C18(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_19C935C2C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_19C935C40(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_19C935C54@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_19C935C68(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_19C935C7C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_19C935C90(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_19C935CA4()
{
  return *v0 == 0;
}

uint64_t sub_19C935CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_19C935CCC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_19C935CE0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void *sub_19C935CF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_19C935CFC()
{
  return sub_19C9768B0();
}

uint64_t sub_19C935D0C(uint64_t a1)
{
  uint64_t v2 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E44F0](a1, v2);
}

uint64_t sub_19C935D78(uint64_t a1)
{
  uint64_t v2 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E44A8](a1, v2);
}

uint64_t sub_19C935DE4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  id v5 = a1;
  return MEMORY[0x1F40E4498](v5, a2, v4);
}

uint64_t sub_19C935E74()
{
  id v1 = *v0;
  uint64_t v2 = sub_19C976C60();

  return v2;
}

uint64_t sub_19C935EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E44D8](a1, a2, v4);
}

uint64_t sub_19C935F28()
{
  return sub_19C9770C0();
}

BOOL sub_19C935F88(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_19C935F9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_19C936824(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_19C935FDC(uint64_t a1)
{
  uint64_t v2 = sub_19C8E0E04(&qword_1E94144D0, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_19C936048(uint64_t a1)
{
  uint64_t v2 = sub_19C8E0E04(&qword_1E94144D0, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_19C9360B8(uint64_t a1)
{
  uint64_t v2 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E4480](a1, v2);
}

uint64_t sub_19C936124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
  return MEMORY[0x1F40E44B8](a1, a2, a3, v6);
}

uint64_t sub_19C9361A8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_19C976ED0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
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
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    unint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_19C977090();
    sub_19C976910();
    uint64_t result = sub_19C9770C0();
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
          goto LABEL_41;
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
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  uint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t type metadata accessor for TPSAnalyticsChecklistSession()
{
  return self;
}

uint64_t method lookup function for TPSAnalyticsChecklistSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSAnalyticsChecklistSession);
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSession.__allocating_init(sessionStartSuggestedTipCount:sessionEndSuggestedTipCount:sessionTipsCompleted:timeSpent:isFirstLaunch:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

void type metadata accessor for TPSSearchQueryOptions(uint64_t a1)
{
}

uint64_t sub_19C936518()
{
  return sub_19C8E0E04(&qword_1E94143F0, type metadata accessor for TPSSearchQueryOptions);
}

uint64_t sub_19C936560()
{
  return sub_19C8E0E04(&qword_1E94143F8, type metadata accessor for TPSSearchQueryOptions);
}

uint64_t sub_19C9365A8()
{
  return sub_19C8E0E04(&qword_1E9414400, type metadata accessor for TPSSearchQueryOptions);
}

uint64_t sub_19C9365F0()
{
  return sub_19C8E0E04(&qword_1E9414408, type metadata accessor for TPSSearchQueryOptions);
}

void sub_19C936638(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_19C936658(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  uint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_19C95C684(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    int64_t v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];

      *(void *)(v23 + 8 * v16) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_19C9361A8(v19, a4 & 1, a6);
  unint64_t v24 = sub_19C95C684(a2, a3);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_19C977010();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  int64_t v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  char v26 = (uint64_t *)(v22[6] + 16 * v16);
  *char v26 = a2;
  v26[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v27 = v22[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v22[2] = v29;
  swift_bridgeObjectRetain();
}

void sub_19C9367E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_19C936804(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

uint64_t sub_19C936824(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

_OWORD *sub_19C93685C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CSSearchQueryError(uint64_t a1)
{
}

uint64_t sub_19C936880()
{
  return sub_19C8E0E04(&qword_1E94144C0, type metadata accessor for CSSearchQueryError);
}

uint64_t sub_19C9368C8()
{
  return sub_19C8E0E04(&qword_1E94144C8, type metadata accessor for CSSearchQueryError);
}

uint64_t sub_19C936910()
{
  return sub_19C8E0E04(&qword_1E94144D0, type metadata accessor for CSSearchQueryError);
}

uint64_t sub_19C936958()
{
  return sub_19C8E0E04(&qword_1E94144D8, type metadata accessor for CSSearchQueryError);
}

uint64_t sub_19C9369A0()
{
  return sub_19C8E0E04(&qword_1E94144E0, type metadata accessor for CSSearchQueryError);
}

uint64_t sub_19C9369E8()
{
  return sub_19C8E0E04(&qword_1E94144E8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_19C936A44()
{
  return sub_19C8E0E04(&qword_1E94144F0, type metadata accessor for Code);
}

unint64_t sub_19C936A90()
{
  unint64_t result = qword_1E94144F8;
  if (!qword_1E94144F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94144F8);
  }
  return result;
}

uint64_t sub_19C936AE4()
{
  return sub_19C8E0E04(&qword_1E9414500, type metadata accessor for Code);
}

uint64_t sub_19C936B2C()
{
  return sub_19C8E0E04(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  sub_19C936CB8(a1);
  id v9 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithArray_, v10);

  sub_19C976B30();
  id v12 = (id)sub_19C976B20();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v12, a2, a3, a4 & 1);
}

uint64_t sub_19C936CB8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_19C9738F4(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516C80);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19C9738F4(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_19C9738F4(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_19C93685C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_19C936DF0()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t sub_19C936E08(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t (*sub_19C936E14())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19C936E7C()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t sub_19C936E94(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t (*sub_19C936EA0())()
{
  return j__swift_endAccess;
}

uint64_t sub_19C936F0C()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t sub_19C936F24(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t (*sub_19C936F30())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19C936F98()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t sub_19C936FB0(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t (*sub_19C936FBC())()
{
  return j_j__swift_endAccess;
}

id sub_19C937024(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_19C9370AC()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t sub_19C9370C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_19C9768B0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  uint64_t *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19C937140(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t sub_19C93714C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19C9371A8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19C937210())()
{
  return j_j__swift_endAccess;
}

uint64_t static LinkedDocument.supportsSecureCoding.getter()
{
  return 1;
}

id sub_19C937328(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___TPSLinkedDocument_bundleId];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v1[OBJC_IVAR___TPSLinkedDocument_documentId];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v1[OBJC_IVAR___TPSLinkedDocument_platform];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v1[OBJC_IVAR___TPSLinkedDocument_product];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v1[OBJC_IVAR___TPSLinkedDocument_productVersion];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = (void *)sub_19C9767E0();
  v57.receiver = v1;
  v57.super_class = (Class)type metadata accessor for LinkedDocument();
  id v9 = objc_msgSendSuper2(&v57, sel_initWithDictionary_, v8);
  id v10 = v9;

  if (!v10)
  {
    swift_bridgeObjectRelease();
    return 0;
  }

  *(void *)&long long v50 = 0x6449656C646E7562;
  *((void *)&v50 + 1) = 0xE800000000000000;
  id v11 = (char *)v10;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v12 = sub_19C95C6FC((uint64_t)v56), (v13 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v50);
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
  }
  sub_19C938C54((uint64_t)v56);
  if (*((void *)&v51 + 1))
  {
    int v14 = swift_dynamicCast();
    if (v14) {
      uint64_t v15 = v54;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v14) {
      uint64_t v16 = *((void *)&v54 + 1);
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v50);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  uint64_t v17 = &v11[OBJC_IVAR___TPSLinkedDocument_bundleId];
  swift_beginAccess();
  *(void *)uint64_t v17 = v15;
  *((void *)v17 + 1) = v16;
  swift_bridgeObjectRelease();
  *(void *)&long long v50 = 0x746E656D75636F64;
  *((void *)&v50 + 1) = 0xEA00000000006449;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v18 = sub_19C95C6FC((uint64_t)v56), (v19 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_19C938C54((uint64_t)v56);
  if (!*((void *)&v53 + 1))
  {
    *(void *)&long long v54 = 0x64496369706F74;
    *((void *)&v54 + 1) = 0xE700000000000000;
    sub_19C976DC0();
    if (*(void *)(a1 + 16) && (unint64_t v23 = sub_19C95C6FC((uint64_t)&v50), (v24 & 1) != 0))
    {
      sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v23, (uint64_t)&v54);
    }
    else
    {
      long long v55 = 0u;
      long long v54 = 0u;
    }
    sub_19C938C54((uint64_t)&v50);
    sub_19C8F58A0((uint64_t)&v52);
    if (*((void *)&v55 + 1)) {
      goto LABEL_22;
    }
LABEL_33:
    sub_19C8F58A0((uint64_t)&v54);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    goto LABEL_34;
  }
  sub_19C93685C(&v52, &v54);
  if (!*((void *)&v55 + 1)) {
    goto LABEL_33;
  }
LABEL_22:
  int v20 = swift_dynamicCast();
  if (v20) {
    uint64_t v21 = v56[0];
  }
  else {
    uint64_t v21 = 0;
  }
  if (v20) {
    uint64_t v22 = v56[1];
  }
  else {
    uint64_t v22 = 0;
  }
LABEL_34:
  char v25 = &v11[OBJC_IVAR___TPSLinkedDocument_documentId];
  swift_beginAccess();
  *(void *)char v25 = v21;
  *((void *)v25 + 1) = v22;
  swift_bridgeObjectRelease();
  *(void *)&long long v50 = 0x6D726F6674616C70;
  *((void *)&v50 + 1) = 0xE800000000000000;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v26 = sub_19C95C6FC((uint64_t)v56), (v27 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v50);
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
  }
  sub_19C938C54((uint64_t)v56);
  if (*((void *)&v51 + 1))
  {
    int v28 = swift_dynamicCast();
    if (v28) {
      uint64_t v29 = v52;
    }
    else {
      uint64_t v29 = 0;
    }
    if (v28) {
      uint64_t v30 = *((void *)&v52 + 1);
    }
    else {
      uint64_t v30 = 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v50);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v31 = &v11[OBJC_IVAR___TPSLinkedDocument_platform];
  swift_beginAccess();
  *(void *)uint64_t v31 = v29;
  *((void *)v31 + 1) = v30;
  swift_bridgeObjectRelease();
  *(void *)&long long v50 = 0x746375646F7270;
  *((void *)&v50 + 1) = 0xE700000000000000;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v32 = sub_19C95C6FC((uint64_t)v56), (v33 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v32, (uint64_t)&v50);
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
  }
  sub_19C938C54((uint64_t)v56);
  if (*((void *)&v51 + 1))
  {
    int v34 = swift_dynamicCast();
    if (v34) {
      uint64_t v35 = v48;
    }
    else {
      uint64_t v35 = 0;
    }
    if (v34) {
      uint64_t v36 = v49;
    }
    else {
      uint64_t v36 = 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v50);
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  int64_t v37 = &v11[OBJC_IVAR___TPSLinkedDocument_product];
  swift_beginAccess();
  *(void *)int64_t v37 = v35;
  *((void *)v37 + 1) = v36;
  swift_bridgeObjectRelease();
  strcpy((char *)&v50, "productVersion");
  HIBYTE(v50) = -18;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v38 = sub_19C95C6FC((uint64_t)v56), (v39 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v38, (uint64_t)&v50);
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19C938C54((uint64_t)v56);
  if (*((void *)&v51 + 1))
  {
    int v40 = swift_dynamicCast();
    if (v40) {
      uint64_t v41 = v46;
    }
    else {
      uint64_t v41 = 0;
    }
    if (v40) {
      uint64_t v42 = v47;
    }
    else {
      uint64_t v42 = 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v50);
    uint64_t v41 = 0;
    uint64_t v42 = 0;
  }
  v43 = &v11[OBJC_IVAR___TPSLinkedDocument_productVersion];
  swift_beginAccess();
  *(void *)v43 = v41;
  *((void *)v43 + 1) = v42;
  swift_bridgeObjectRelease();
  if (*((void *)v17 + 1) || *((void *)v25 + 1) || *((void *)v31 + 1))
  {

    return v9;
  }
  uint64_t v45 = *((void *)v37 + 1);

  if (v45) {
    return v9;
  }

  return 0;
}

id sub_19C9379CC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = &v2[OBJC_IVAR___TPSLinkedDocument_bundleId];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v2[OBJC_IVAR___TPSLinkedDocument_documentId];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v2[OBJC_IVAR___TPSLinkedDocument_platform];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v2[OBJC_IVAR___TPSLinkedDocument_product];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v2[OBJC_IVAR___TPSLinkedDocument_productVersion];
  id v9 = (objc_class *)type metadata accessor for LinkedDocument();
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  v27.receiver = v2;
  v27.super_class = v9;
  id v10 = objc_msgSendSuper2(&v27, sel_initWithCoder_, a1);
  if (v10)
  {
    sub_19C938C14();
    id v11 = (char *)v10;
    uint64_t v12 = sub_19C976C20();
    if (v12)
    {
      char v13 = (void *)v12;
      sub_19C9768A0();
    }
    int v14 = &v11[OBJC_IVAR___TPSLinkedDocument_bundleId];
    swift_beginAccess();
    *(void *)int v14 = 0;
    *((void *)v14 + 1) = 0;
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_19C976C20();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      sub_19C9768A0();
    }
    uint64_t v17 = &v11[OBJC_IVAR___TPSLinkedDocument_documentId];
    swift_beginAccess();
    *(void *)uint64_t v17 = 0;
    *((void *)v17 + 1) = 0;
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_19C976C20();
    if (v18)
    {
      char v19 = (void *)v18;
      sub_19C9768A0();
    }
    int v20 = &v11[OBJC_IVAR___TPSLinkedDocument_platform];
    swift_beginAccess();
    *(void *)int v20 = 0;
    *((void *)v20 + 1) = 0;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_19C976C20();
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      sub_19C9768A0();
    }
    unint64_t v23 = &v11[OBJC_IVAR___TPSLinkedDocument_product];
    swift_beginAccess();
    *(void *)unint64_t v23 = 0;
    *((void *)v23 + 1) = 0;
    swift_bridgeObjectRelease();
    char v24 = (void *)sub_19C976C20();
    if (v24)
    {
      sub_19C9768A0();
    }
    else
    {
    }
    char v25 = &v11[OBJC_IVAR___TPSLinkedDocument_productVersion];
    swift_beginAccess();
    *(void *)char v25 = 0;
    *((void *)v25 + 1) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v10;
}

void sub_19C937D2C(void *a1)
{
  v18.receiver = v1;
  v18.super_class = (Class)type metadata accessor for LinkedDocument();
  objc_msgSendSuper2(&v18, sel_encodeWithCoder_, a1);
  uint64_t v3 = &v1[OBJC_IVAR___TPSLinkedDocument_bundleId];
  swift_beginAccess();
  if (*((void *)v3 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  swift_unknownObjectRelease();

  uint64_t v6 = &v1[OBJC_IVAR___TPSLinkedDocument_documentId];
  swift_beginAccess();
  if (*((void *)v6 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  id v9 = &v1[OBJC_IVAR___TPSLinkedDocument_platform];
  swift_beginAccess();
  if (*((void *)v9 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  uint64_t v12 = &v1[OBJC_IVAR___TPSLinkedDocument_product];
  swift_beginAccess();
  if (*((void *)v12 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v14 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);
  swift_unknownObjectRelease();

  uint64_t v15 = &v1[OBJC_IVAR___TPSLinkedDocument_productVersion];
  swift_beginAccess();
  if (*((void *)v15 + 1))
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_encodeObject_forKey_, v16, v17);
  swift_unknownObjectRelease();
}

char *sub_19C9380CC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v5 = (objc_class *)type metadata accessor for LinkedDocument();
  v30.receiver = v2;
  v30.super_class = v5;
  objc_msgSendSuper2(&v30, sel_copyWithZone_, a1);
  sub_19C976D10();
  swift_unknownObjectRelease();
  if (swift_dynamicCast())
  {
    uint64_t v6 = v29;
    uint64_t v7 = &v2[OBJC_IVAR___TPSLinkedDocument_bundleId];
    swift_beginAccess();
    uint64_t v9 = *(void *)v7;
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t v10 = (void *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_bundleId);
    swift_beginAccess();
    *uint64_t v10 = v9;
    v10[1] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v11 = &v2[OBJC_IVAR___TPSLinkedDocument_documentId];
    swift_beginAccess();
    uint64_t v13 = *(void *)v11;
    uint64_t v12 = *((void *)v11 + 1);
    int v14 = (void *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_documentId);
    swift_beginAccess();
    *int v14 = v13;
    v14[1] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v15 = &v2[OBJC_IVAR___TPSLinkedDocument_platform];
    swift_beginAccess();
    uint64_t v17 = *(void *)v15;
    uint64_t v16 = *((void *)v15 + 1);
    objc_super v18 = (void *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_platform);
    swift_beginAccess();
    *objc_super v18 = v17;
    v18[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    char v19 = &v2[OBJC_IVAR___TPSLinkedDocument_product];
    swift_beginAccess();
    uint64_t v21 = *(void *)v19;
    uint64_t v20 = *((void *)v19 + 1);
    uint64_t v22 = (void *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_product);
    swift_beginAccess();
    void *v22 = v21;
    v22[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v23 = &v2[OBJC_IVAR___TPSLinkedDocument_productVersion];
    swift_beginAccess();
    uint64_t v25 = *(void *)v23;
    uint64_t v24 = *((void *)v23 + 1);
    unint64_t v26 = (void *)((char *)v29 + OBJC_IVAR___TPSLinkedDocument_productVersion);
    swift_beginAccess();
    *unint64_t v26 = v25;
    v26[1] = v24;
    swift_bridgeObjectRetain();
    unint64_t result = (char *)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v2;
    uint64_t v5 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E94145A8);
    a2[1] = (uint64_t (*)())v28;
    unint64_t result = v2;
    uint64_t v6 = sub_19C93872C;
  }
  a2[3] = (uint64_t (*)())v5;
  *a2 = v6;
  return result;
}

id LinkedDocument.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void LinkedDocument.init()()
{
}

id LinkedDocument.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkedDocument();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s8TipsCore14LinkedDocumentC06linkedD14FromDictionary10dictionarySDys11AnyHashableVypGSgAH_tFZ_0(uint64_t a1)
{
  strcpy((char *)v8, "linkedDocument");
  HIBYTE(v8[1]) = -18;
  sub_19C976DC0();
  if (*(void *)(a1 + 16) && (unint64_t v2 = sub_19C95C6FC((uint64_t)v9), (v3 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_19C938C54((uint64_t)v9);
  if (!*((void *)&v11 + 1)) {
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145B0);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = v8[0];
  v8[0] = 0x7372747461;
  v8[1] = 0xE500000000000000;
  sub_19C976DC0();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_19C95C6FC((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_19C8F5FF4(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_19C938C54((uint64_t)v9);
  if (!*((void *)&v11 + 1))
  {
LABEL_14:
    sub_19C8F58A0((uint64_t)&v10);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v8[0];
  }
  return 0;
}

uint64_t type metadata accessor for LinkedDocument()
{
  return self;
}

uint64_t sub_19C9386F4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C93872C()
{
  objc_msgSend(*(id *)(v0 + 16), sel_copy);
  sub_19C976D10();
  return swift_unknownObjectRelease();
}

uint64_t sub_19C93877C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_bundleId, a2);
}

uint64_t sub_19C938788(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

uint64_t sub_19C9387A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_documentId, a2);
}

uint64_t sub_19C9387B4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

uint64_t sub_19C9387D4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_platform, a2);
}

uint64_t sub_19C9387E0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_platform);
}

uint64_t sub_19C938800@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_product, a2);
}

uint64_t sub_19C93880C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_product);
}

uint64_t sub_19C93882C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSLinkedDocument_productVersion, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C93888C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

uint64_t method lookup function for LinkedDocument(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LinkedDocument);
}

uint64_t dispatch thunk of LinkedDocument.bundleId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of LinkedDocument.bundleId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of LinkedDocument.bundleId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LinkedDocument.documentId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LinkedDocument.platform.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LinkedDocument.platform.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LinkedDocument.platform.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of LinkedDocument.product.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of LinkedDocument.product.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of LinkedDocument.product.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LinkedDocument.productVersion.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_19C938C14()
{
  unint64_t result = qword_1EB516C90;
  if (!qword_1EB516C90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB516C90);
  }
  return result;
}

uint64_t sub_19C938C54(uint64_t a1)
{
  return a1;
}

uint64_t URL.TipSchemeAction.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 40);
  if (!*(unsigned char *)(v0 + 64))
  {
    sub_19C9770A0();
    if (v1)
    {
      sub_19C9770B0();
      swift_bridgeObjectRetain();
      sub_19C976910();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_19C9770B0();
      if (v2)
      {
LABEL_10:
        sub_19C9770B0();
        swift_bridgeObjectRetain();
        sub_19C976910();
        swift_bridgeObjectRelease();
        if (!v3) {
          return sub_19C9770B0();
        }
        goto LABEL_19;
      }
    }
    sub_19C9770B0();
    if (v3) {
      goto LABEL_19;
    }
    return sub_19C9770B0();
  }
  if (*(unsigned char *)(v0 + 64) != 1) {
    return sub_19C9770A0();
  }
  uint64_t v4 = *(void *)(v0 + 56);
  sub_19C9770A0();
  if (v1)
  {
    sub_19C9770B0();
    swift_bridgeObjectRetain();
    sub_19C976910();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_5;
    }
  }
  else
  {
    sub_19C9770B0();
    if (v2)
    {
LABEL_5:
      sub_19C9770B0();
      swift_bridgeObjectRetain();
      sub_19C976910();
      swift_bridgeObjectRelease();
      if (v3) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  sub_19C9770B0();
  if (!v3)
  {
LABEL_15:
    sub_19C9770B0();
    if (v4) {
      goto LABEL_19;
    }
    return sub_19C9770B0();
  }
LABEL_6:
  sub_19C9770B0();
  swift_bridgeObjectRetain();
  sub_19C976910();
  swift_bridgeObjectRelease();
  if (!v4) {
    return sub_19C9770B0();
  }
LABEL_19:
  sub_19C9770B0();
  swift_bridgeObjectRetain();
  sub_19C976910();
  return swift_bridgeObjectRelease();
}

uint64_t URL.TipSchemeAction.hashValue.getter()
{
  return sub_19C9770C0();
}

uint64_t sub_19C938F34()
{
  return sub_19C9770C0();
}

uint64_t sub_19C938F94()
{
  return sub_19C9770C0();
}

uint64_t URL.isTipsScheme.getter()
{
  uint64_t v0 = sub_19C976450();
  uint64_t v2 = v1;
  uint64_t v3 = sub_19C9768B0();
  if (v2)
  {
    if (v0 == v3 && v2 == v4) {
      char v6 = 1;
    }
    else {
      char v6 = sub_19C976FB0();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  swift_bridgeObjectRelease();
  return v6 & 1;
}

double URL.action.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_19C976450();
  uint64_t v4 = v3;
  uint64_t v5 = sub_19C9768B0();
  if (!v4) {
    goto LABEL_18;
  }
  if (v2 == v5 && v4 == v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_19;
    }
  }
  uint64_t v9 = sub_19C976430();
  uint64_t v11 = v10;
  uint64_t v12 = sub_19C9768B0();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    sub_19C9768B0();
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v12 != v9 || v11 != v13)
  {
    char v15 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_22;
    }
    if (sub_19C9768B0() == v9 && v11 == v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v21 = sub_19C976FB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v22 = _s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0();
    if (v22)
    {
      unint64_t v23 = v22;
      uint64_t v25 = *(void *)&v22[OBJC_IVAR___TPSUserGuide_identifier];
      uint64_t v24 = *(void *)&v22[OBJC_IVAR___TPSUserGuide_identifier + 8];
      swift_getKeyPath();
      *(void *)&v35[0] = v23;
      sub_19C939EDC();
      swift_bridgeObjectRetain();
      sub_19C9765E0();
      swift_release();
      unint64_t v26 = &v23[OBJC_IVAR___TPSUserGuide__topicIdentifier];
      swift_beginAccess();
      uint64_t v28 = *(void *)v26;
      uint64_t v27 = *((void *)v26 + 1);
      uint64_t v29 = &v23[OBJC_IVAR___TPSUserGuide_version];
      swift_beginAccess();
      uint64_t v31 = *(void *)v29;
      uint64_t v30 = *((void *)v29 + 1);
      unint64_t v32 = &v23[OBJC_IVAR___TPSUserGuide_referrer];
      swift_beginAccess();
      uint64_t v34 = *(void *)v32;
      uint64_t v33 = *((void *)v32 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();

      *(void *)a1 = v25;
      *(void *)(a1 + 8) = v24;
      *(void *)(a1 + 16) = v28;
      *(void *)(a1 + 24) = v27;
      *(void *)(a1 + 32) = v31;
      *(void *)(a1 + 40) = v30;
      *(void *)(a1 + 48) = v34;
      *(void *)(a1 + 56) = v33;
      char v17 = 1;
      goto LABEL_20;
    }
LABEL_19:
    double result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    char v17 = 2;
LABEL_20:
    *(unsigned char *)(a1 + 64) = v17;
    return result;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  swift_bridgeObjectRelease();
  sub_19C939384((uint64_t *)v35);
  double result = *(double *)v35;
  long long v18 = v35[1];
  long long v19 = v35[2];
  *(_OWORD *)a1 = v35[0];
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = v19;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

void sub_19C939384(uint64_t *a1@<X8>)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145C8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_19C9762D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_19C976450();
  uint64_t v10 = v9;
  uint64_t v11 = sub_19C9768B0();
  if (v10)
  {
    if (v8 == v11 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_19C976FB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
    }
    sub_19C976250();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_19C93A3E4((uint64_t)v3);
LABEL_12:
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      char v17 = 0;
      uint64_t v10 = 0;
      goto LABEL_13;
    }
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_19C976230();
    uint64_t v20 = self;
    sub_19C976210();
    char v21 = (void *)sub_19C9769D0();
    swift_bridgeObjectRelease();
    uint64_t v35 = 0;
    v36[0] = 0;
    uint64_t v34 = 0;
    objc_msgSend(v20, sel_getValuesFromOpenURLSchemeQueryItems_tipIdentifier_collectionIdentifier_referrer_, v21, v36, &v35, &v34);

    uint64_t v22 = v34;
    char v17 = (void *)v36[0];
    id v31 = v35;
    if (v35)
    {
      uint64_t v15 = sub_19C9768B0();
      uint64_t v16 = v23;
      id v32 = v17;
      if (v17) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      id v32 = (id)v36[0];
      if (v36[0])
      {
LABEL_16:
        char v17 = (void *)sub_19C9768B0();
        uint64_t v10 = v24;
        uint64_t v33 = v7;
        if (v22)
        {
LABEL_17:
          uint64_t v18 = sub_19C9768B0();
          uint64_t v19 = v25;
LABEL_21:
          uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
          id v30 = v22;
          id v26 = v31;
          id v27 = v32;
          v29(v33, v4);

          goto LABEL_22;
        }
LABEL_20:
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v10 = 0;
    uint64_t v33 = v7;
    if (v22) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  char v17 = 0;
LABEL_13:
  uint64_t v18 = 0;
  uint64_t v19 = 0;
LABEL_22:
  *a1 = v15;
  a1[1] = v16;
  a1[2] = (uint64_t)v17;
  a1[3] = v10;
  a1[4] = v18;
  a1[5] = v19;
}

uint64_t sub_19C939708@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_19C939EDC();
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (void *)(v3 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a2 = *v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C9397A4()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s10Foundation3URLV8TipsCoreE15TipSchemeActionO2eeoiySbAF_AFtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  int v10 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v11 = *(void *)a2;
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40);
  uint64_t v17 = *(void *)(a2 + 48);
  uint64_t v18 = *(void *)(a2 + 56);
  int v19 = *(unsigned __int8 *)(a2 + 64);
  v87[0] = *(void *)a1;
  v87[1] = v3;
  uint64_t v85 = v6;
  uint64_t v86 = v5;
  v87[2] = v5;
  v87[3] = v4;
  v87[4] = v6;
  v87[5] = v7;
  v87[6] = v8;
  v87[7] = v9;
  uint64_t v83 = v9;
  uint64_t v84 = v8;
  char v88 = v10;
  uint64_t v89 = v11;
  uint64_t v90 = v12;
  uint64_t v91 = v14;
  uint64_t v92 = v13;
  uint64_t v93 = v15;
  uint64_t v94 = v16;
  uint64_t v95 = v17;
  uint64_t v96 = v18;
  char v97 = v19;
  if (!v10)
  {
    if (v19) {
      goto LABEL_19;
    }
    if (v3)
    {
      if (!v12) {
        goto LABEL_56;
      }
      if (v2 != v11 || v3 != v12)
      {
        uint64_t v70 = v2;
        uint64_t v77 = v4;
        uint64_t v22 = v7;
        char v23 = sub_19C976FB0();
        uint64_t v2 = v70;
        uint64_t v4 = v77;
        uint64_t v7 = v22;
        if ((v23 & 1) == 0) {
          goto LABEL_56;
        }
      }
    }
    else if (v12)
    {
      goto LABEL_56;
    }
    if (v4)
    {
      if (v13)
      {
        if (v86 == v14 && v4 == v13
          || (v72 = v2, v79 = v4, v34 = v7, v35 = sub_19C976FB0(), uint64_t v2 = v72, v4 = v79, v7 = v34, (v35 & 1) != 0))
        {
LABEL_38:
          if (v7)
          {
            if (!v16)
            {
              uint64_t v40 = v11;
              uint64_t v41 = v12;
              uint64_t v42 = v14;
              uint64_t v25 = v4;
              uint64_t v43 = v13;
              uint64_t v44 = v15;
              uint64_t v27 = v7;
              uint64_t v45 = 0;
              goto LABEL_57;
            }
            uint64_t v73 = v2;
            uint64_t v80 = v4;
            if (v85 == v15 && v7 == v16)
            {
              uint64_t v36 = v13;
              uint64_t v37 = v7;
              sub_19C939FC0(v11, v12, v14, v36, v85, v7, v17, v18, 0);
              sub_19C939FC0(v73, v3, v86, v80, v85, v37, v84, v83, 0);
              goto LABEL_43;
            }
            uint64_t v68 = v7;
            char v65 = sub_19C976FB0();
            sub_19C939FC0(v11, v12, v14, v13, v15, v16, v17, v18, 0);
            sub_19C939FC0(v73, v3, v86, v80, v85, v68, v84, v83, 0);
            sub_19C93A464((uint64_t)v87);
            if ((v65 & 1) == 0) {
              return 0;
            }
          }
          else
          {
            uint64_t v47 = v11;
            uint64_t v48 = v4;
            uint64_t v49 = v17;
            uint64_t v50 = v2;
            sub_19C939FC0(v47, v12, v14, v13, v15, v16, v49, v18, 0);
            sub_19C939FC0(v50, v3, v86, v48, v85, 0, v84, v83, 0);
            swift_bridgeObjectRetain();
            sub_19C93A464((uint64_t)v87);
            if (v16) {
              goto LABEL_61;
            }
          }
          return 1;
        }
      }
    }
    else if (!v13)
    {
      goto LABEL_38;
    }
LABEL_56:
    uint64_t v40 = v11;
    uint64_t v41 = v12;
    uint64_t v42 = v14;
    uint64_t v25 = v4;
    uint64_t v43 = v13;
    uint64_t v44 = v15;
    uint64_t v27 = v7;
    uint64_t v45 = v16;
LABEL_57:
    uint64_t v46 = v17;
    uint64_t v29 = v2;
    sub_19C939FC0(v40, v41, v42, v43, v44, v45, v46, v18, 0);
    char v64 = 0;
    goto LABEL_21;
  }
  if (v10 != 1)
  {
    if (v19 != 2 || v12 | v11 | v14 | v13 | v15 | v16 | v17 | v18) {
      goto LABEL_19;
    }
LABEL_43:
    sub_19C93A464((uint64_t)v87);
    return 1;
  }
  if (v19 == 1)
  {
    if (v3)
    {
      if (!v12) {
        goto LABEL_59;
      }
      if (v2 != v11 || v3 != v12)
      {
        uint64_t v69 = v2;
        uint64_t v76 = v4;
        uint64_t v20 = v7;
        char v21 = sub_19C976FB0();
        uint64_t v2 = v69;
        uint64_t v4 = v76;
        uint64_t v7 = v20;
        if ((v21 & 1) == 0) {
          goto LABEL_59;
        }
      }
    }
    else if (v12)
    {
      goto LABEL_59;
    }
    if (v4)
    {
      if (!v13) {
        goto LABEL_59;
      }
      if (v86 != v14 || v4 != v13)
      {
        uint64_t v71 = v2;
        uint64_t v78 = v4;
        uint64_t v32 = v7;
        char v33 = sub_19C976FB0();
        uint64_t v2 = v71;
        uint64_t v4 = v78;
        uint64_t v7 = v32;
        if ((v33 & 1) == 0) {
          goto LABEL_59;
        }
      }
    }
    else if (v13)
    {
      goto LABEL_59;
    }
    if (v7)
    {
      if (v16)
      {
        if (v85 == v15 && v7 == v16) {
          goto LABEL_50;
        }
        uint64_t v74 = v2;
        uint64_t v81 = v4;
        uint64_t v38 = v7;
        char v39 = sub_19C976FB0();
        uint64_t v2 = v74;
        uint64_t v4 = v81;
        uint64_t v7 = v38;
        if (v39) {
          goto LABEL_50;
        }
      }
    }
    else if (!v16)
    {
LABEL_50:
      if (v83)
      {
        if (v18)
        {
          uint64_t v67 = v7;
          uint64_t v75 = v2;
          uint64_t v82 = v4;
          if (v84 == v17 && v83 == v18)
          {
            uint64_t v30 = 1;
            sub_19C939FC0(v11, v12, v14, v13, v15, v16, v84, v83, 1);
            sub_19C939FC0(v75, v3, v86, v82, v85, v67, v84, v83, 1);
            sub_19C93A464((uint64_t)v87);
            return v30;
          }
          char v66 = sub_19C976FB0();
          uint64_t v30 = 1;
          sub_19C939FC0(v11, v12, v14, v13, v15, v16, v17, v18, 1);
          sub_19C939FC0(v75, v3, v86, v82, v85, v67, v84, v83, 1);
          sub_19C93A464((uint64_t)v87);
          if (v66) {
            return v30;
          }
          return 0;
        }
        uint64_t v57 = v11;
        uint64_t v58 = v4;
        uint64_t v59 = v13;
        uint64_t v60 = v15;
        uint64_t v61 = v7;
        uint64_t v62 = v2;
        sub_19C939FC0(v57, v12, v14, v59, v60, v16, v17, 0, 1);
        sub_19C939FC0(v62, v3, v86, v58, v85, v61, v84, v83, 1);
        goto LABEL_22;
      }
      uint64_t v30 = 1;
      uint64_t v51 = v11;
      uint64_t v52 = v4;
      uint64_t v53 = v15;
      uint64_t v54 = v7;
      uint64_t v55 = v17;
      uint64_t v56 = v2;
      sub_19C939FC0(v51, v12, v14, v13, v53, v16, v55, v18, 1);
      sub_19C939FC0(v56, v3, v86, v52, v85, v54, v84, 0, 1);
      swift_bridgeObjectRetain();
      sub_19C93A464((uint64_t)v87);
      if (!v18) {
        return v30;
      }
LABEL_61:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_59:
    LOBYTE(v10) = 1;
    char v63 = 1;
    goto LABEL_20;
  }
LABEL_19:
  char v63 = v19;
LABEL_20:
  uint64_t v24 = v11;
  uint64_t v25 = v4;
  uint64_t v26 = v15;
  uint64_t v27 = v7;
  uint64_t v28 = v17;
  uint64_t v29 = v2;
  sub_19C939FC0(v24, v12, v14, v13, v26, v16, v28, v18, v63);
  char v64 = v10;
LABEL_21:
  sub_19C939FC0(v29, v3, v86, v25, v85, v27, v84, v83, v64);
LABEL_22:
  sub_19C93A464((uint64_t)v87);
  return 0;
}

unint64_t sub_19C939EDC()
{
  unint64_t result = qword_1E94145B8;
  if (!qword_1E94145B8)
  {
    type metadata accessor for UserGuide();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94145B8);
  }
  return result;
}

unint64_t sub_19C939F38()
{
  unint64_t result = qword_1E94145C0;
  if (!qword_1E94145C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94145C0);
  }
  return result;
}

uint64_t _s15TipSchemeActionOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_19C939FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a9)
  {
    if (a9 != 1) {
      return result;
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t _s15TipSchemeActionOwxx(uint64_t a1)
{
  return sub_19C93A088(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
}

uint64_t sub_19C93A088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = a2;
  if (a9)
  {
    if (a9 != 1) {
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s15TipSchemeActionOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  sub_19C939FC0(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  return a1;
}

uint64_t _s15TipSchemeActionOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  sub_19C939FC0(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  char v20 = *(unsigned char *)(a1 + 64);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_19C93A088(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s15TipSchemeActionOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  char v12 = *(unsigned char *)(a1 + 64);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(unsigned char *)(a1 + 64) = v3;
  sub_19C93A088(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s15TipSchemeActionOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s15TipSchemeActionOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 64) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_19C93A390(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 64) <= 1u) {
    return *(unsigned __int8 *)(a1 + 64);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_19C93A3A8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(void *)(result + 56) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for URL.TipSchemeAction()
{
  return &type metadata for URL.TipSchemeAction;
}

uint64_t sub_19C93A3E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19C93A444()
{
  return sub_19C948A3C(v0[2], v0[3], v0[4]);
}

uint64_t sub_19C93A464(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 120);
  uint64_t v9 = *(void *)(a1 + 128);
  char v10 = *(unsigned char *)(a1 + 136);
  sub_19C93A088(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  sub_19C93A088(v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return a1;
}

id TPSAnalyticsChecklistSessionController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t sub_19C93A5E4()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19C93A678(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_19C93A6C4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19C93A768()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19C93A7FC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_19C93A848())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_19C93A8A4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19C93A948()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_19C93A9DC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_19C93AA28())()
{
  return j__swift_endAccess;
}

uint64_t sub_19C93AACC()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_19C93AB60(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_19C93ABAC())()
{
  return j_j__swift_endAccess;
}

void sub_19C93AC08()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C976560();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession];
  swift_beginAccess();
  if ((*v6 & 1) == 0)
  {
    type metadata accessor for TipsDefaultsManager();
    sub_19C8F54D8(43, &aBlock);
    if (v28)
    {
      if ((swift_dynamicCast() & 1) != 0 && v25 != 0.0) {
        *(double *)&v0[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout] = v25;
      }
    }
    else
    {
      sub_19C8E00AC((uint64_t)&aBlock, &qword_1EB516E30);
    }
    if (qword_1EB516E50 != -1) {
      swift_once();
    }
    uint64_t v7 = (id)qword_1EB516E58;
    os_log_type_t v8 = sub_19C976BB0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v24 = v2;
      uint64_t v11 = v10;
      *(void *)&long long aBlock = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      double v25 = COERCE_DOUBLE(sub_19C8F5F20(0xD000000000000031, 0x800000019C9853B0, (uint64_t *)&aBlock));
      sub_19C976CB0();
      _os_log_impl(&dword_19C8DC000, v7, v8, "%s", v9, 0xCu);
      swift_arrayDestroy();
      uint64_t v12 = v11;
      uint64_t v2 = v24;
      MEMORY[0x19F39E7F0](v12, -1, -1);
      MEMORY[0x19F39E7F0](v9, -1, -1);
    }

    long long v13 = self;
    sub_19C976550();
    long long v14 = (void *)sub_19C976510();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v15 = (void *)sub_19C976880();
    objc_msgSend(v13, sel_persistObject_forKey_, v14, v15);

    *uint64_t v6 = 1;
    uint64_t v16 = self;
    double v17 = *(double *)&v1[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout];
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v1;
    uint64_t v29 = sub_19C93C0A8;
    uint64_t v30 = v18;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v27 = sub_19C93B228;
    uint64_t v28 = &block_descriptor;
    uint64_t v19 = _Block_copy(&aBlock);
    char v20 = v1;
    swift_release();
    id v21 = objc_msgSend(v16, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v19, v17);
    _Block_release(v19);
    uint64_t v22 = *(void **)&v20[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer];
    *(void *)&v20[OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer] = v21;
  }
}

uint64_t sub_19C93B01C(uint64_t a1, uint64_t a2)
{
  if (qword_1EB516E50 != -1) {
    swift_once();
  }
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  uint64_t v3 = (id)qword_1EB516E58;
  sub_19C976E10();
  sub_19C976920();
  uint64_t v4 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeout;
  sub_19C976B00();
  os_log_type_t v5 = sub_19C976BB0();
  if (os_log_type_enabled(v3, v5))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v9[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(0, 0xE000000000000000, v9);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v3, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v7, -1, -1);
    MEMORY[0x19F39E7F0](v6, -1, -1);
  }

  swift_bridgeObjectRelease();
  *(void *)(a2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = *(void *)(a2 + v4);
  return sub_19C93B788();
}

void sub_19C93B228(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_19C93B2D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C976560();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  os_log_type_t v8 = (char *)&v27 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  long long v14 = (char *)&v27 - v13;
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_19C976880();
  id v17 = objc_msgSend(v15, sel_persistedObjectForKey_, v16);

  if (v17)
  {
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v29, 0, sizeof(v29));
  }
  sub_19C8F5AE0((uint64_t)v29, (uint64_t)v30);
  if (v30[3])
  {
    int v18 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v14, v18 ^ 1u, 1, v2);
  }
  else
  {
    sub_19C8E00AC((uint64_t)v30, &qword_1EB516E30);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v14, 1, 1, v2);
  }
  sub_19C93C410((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
  {
    sub_19C8E00AC((uint64_t)v12, &qword_1EB516C20);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v12, v2);
    sub_19C976550();
    sub_19C976500();
    double v20 = v19;
    id v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v6, v2);
    if (v20 >= 600.0)
    {
      if (qword_1EB516E50 != -1) {
        swift_once();
      }
      uint64_t v22 = (id)qword_1EB516E58;
      os_log_type_t v23 = sub_19C976BB0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        v30[0] = v25;
        uint64_t v28 = v1;
        *(_DWORD *)uint64_t v24 = 136315138;
        uint64_t v27 = v24 + 4;
        *(void *)&v29[0] = sub_19C8F5F20(0xD000000000000033, 0x800000019C985430, v30);
        uint64_t v1 = v28;
        sub_19C976CB0();
        _os_log_impl(&dword_19C8DC000, v22, v23, "%s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F39E7F0](v25, -1, -1);
        MEMORY[0x19F39E7F0](v24, -1, -1);
      }

      *(void *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = 0x4082C00000000000;
      sub_19C93B788();
    }
    v21(v8, v2);
  }
  return sub_19C8E00AC((uint64_t)v14, &qword_1EB516C20);
}

uint64_t sub_19C93B788()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_19C976560();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  os_log_type_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_19C976880();
  id v13 = objc_msgSend(v11, sel_persistedObjectForKey_, v12);

  if (v13)
  {
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v45, 0, sizeof(v45));
  }
  sub_19C8F5AE0((uint64_t)v45, (uint64_t)v46);
  if (!v47)
  {
    sub_19C8E00AC((uint64_t)v46, &qword_1EB516E30);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    return sub_19C8E00AC((uint64_t)v3, &qword_1EB516C20);
  }
  int v14 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, v14 ^ 1u, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_19C8E00AC((uint64_t)v3, &qword_1EB516C20);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
  uint64_t v15 = (unsigned char *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  if (*v15 == 1)
  {
    uint64_t v16 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount);
    swift_beginAccess();
    if (*((unsigned char *)v16 + 8) != 1)
    {
      uint64_t v17 = *v16;
      objc_msgSend(*(id *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTimeoutTimer), sel_invalidate);
      uint64_t v18 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent;
      double v19 = *(double *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent);
      uint64_t v42 = OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent;
      if (v19 == 0.0)
      {
        if (qword_1EB516E50 != -1) {
          swift_once();
        }
        double v20 = (id)qword_1EB516E58;
        os_log_type_t v21 = sub_19C976BB0();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          uint64_t v23 = swift_slowAlloc();
          v44[0] = v23;
          uint64_t v41 = v17;
          *(_DWORD *)uint64_t v22 = 136315138;
          uint64_t v40 = v22 + 4;
          uint64_t v43 = sub_19C8F5F20(0xD000000000000046, 0x800000019C985490, v44);
          uint64_t v17 = v41;
          sub_19C976CB0();
          _os_log_impl(&dword_19C8DC000, v20, v21, "%s", v22, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x19F39E7F0](v23, -1, -1);
          MEMORY[0x19F39E7F0](v22, -1, -1);
        }

        sub_19C976550();
        sub_19C976500();
        uint64_t v25 = v24;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        uint64_t v18 = v42;
        *(void *)(v1 + v42) = v25;
      }
      if (qword_1EB516E50 != -1) {
        swift_once();
      }
      uint64_t v26 = (id)qword_1EB516E58;
      os_log_type_t v27 = sub_19C976BB0();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v41 = v17;
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        v44[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        uint64_t v43 = sub_19C8F5F20(0xD00000000000001FLL, 0x800000019C985470, v44);
        uint64_t v17 = v41;
        sub_19C976CB0();
        _os_log_impl(&dword_19C8DC000, v26, v27, "%s", v28, 0xCu);
        swift_arrayDestroy();
        uint64_t v30 = v29;
        uint64_t v18 = v42;
        MEMORY[0x19F39E7F0](v30, -1, -1);
        MEMORY[0x19F39E7F0](v28, -1, -1);
      }

      id v31 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
      swift_beginAccess();
      uint64_t v32 = *v31;
      char v33 = (uint64_t *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
      swift_beginAccess();
      uint64_t v34 = *v33;
      float v35 = *(double *)(v1 + v18);
      uint64_t v36 = (char *)(v1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
      swift_beginAccess();
      char v37 = *v36;
      type metadata accessor for TPSAnalyticsChecklistSession();
      uint64_t v38 = swift_allocObject();
      *(unsigned char *)(v38 + 69) = 0;
      *(void *)(v38 + 40) = v17;
      *(void *)(v38 + 48) = v32;
      *(void *)(v38 + 56) = v34;
      *(float *)(v38 + 64) = v35;
      *(unsigned char *)(v38 + 68) = v37;
      TipsAnalyticsEvent.init(identifier:)(0xD000000000000020, 0x800000019C985100);
      sub_19C9572A0();
      swift_release();
      sub_19C93BEB8();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

void sub_19C93BEB8()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  swift_beginAccess();
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
  *(void *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_timeSpent) = 0;
  uint64_t v2 = (void *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  *uint64_t v2 = 0;
  uint64_t v3 = (void *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  *uint64_t v3 = 0;
  uint64_t v4 = (unsigned char *)(v0 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
  swift_beginAccess();
  *uint64_t v4 = 0;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_19C976B60();
  uint64_t v7 = (void *)sub_19C976880();
  objc_msgSend(v5, sel_persistObject_forKey_, v6, v7);
}

id TPSAnalyticsChecklistSessionController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAnalyticsChecklistSessionController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19C93C070()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C93C0A8(uint64_t a1)
{
  return sub_19C93B01C(a1, *(void *)(v1 + 16));
}

uint64_t sub_19C93C0B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_19C93C148(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19C93C2C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19C93C2C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19C93C148(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_19C94F2A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_19C976E20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_19C976E80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_19C976930();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_19C976EF0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_19C976E80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

uint64_t sub_19C93C2C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414600);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C93C410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19C93C478@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch, a2);
}

uint64_t sub_19C93C484(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch);
}

uint64_t sub_19C93C490@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession, a2);
}

uint64_t keypath_getTm_0@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_19C93C4EC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession);
}

uint64_t keypath_setTm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  unint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *unint64_t v6 = v5;
  return result;
}

uint64_t sub_19C93C544@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 8);
  *(void *)a2 = *(void *)v3;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_19C93C5A0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2 + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartSuggestedTipCount;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_19C93C600@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount, a2);
}

uint64_t sub_19C93C60C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
}

uint64_t sub_19C93C618@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted, a2);
}

uint64_t keypath_get_7Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_19C93C674(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
}

uint64_t keypath_set_8Tm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  unint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *unint64_t v6 = v5;
  return result;
}

uint64_t sub_19C93C6CC()
{
  return type metadata accessor for TPSAnalyticsChecklistSessionController();
}

uint64_t method lookup function for TPSAnalyticsChecklistSessionController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSAnalyticsChecklistSessionController);
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.isFirstLaunch.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.hasActiveSession.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionStartSuggestedTipCount.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionEndSuggestedTipsCount.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.sessionTipsCompleted.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.startSession()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.continueSession()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of TPSAnalyticsChecklistSessionController.stopSession()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t TPSSavedTipEntry.tipIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
}

uint64_t TPSSavedTipEntry.tipIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
}

uint64_t (*TPSSavedTipEntry.tipIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t TPSSavedTipEntry.savedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  uint64_t v4 = sub_19C976560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TPSSavedTipEntry.savedDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  uint64_t v4 = sub_19C976560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*TPSSavedTipEntry.savedDate.modify())()
{
  return j_j__swift_endAccess;
}

id sub_19C93CE90()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TPSSavedTipEntry.lastUsedVersion.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
}

uint64_t sub_19C93CF20(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_19C9768B0();
  uint64_t v8 = v7;
  int64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  uint64_t *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t TPSSavedTipEntry.lastUsedVersion.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
}

uint64_t (*TPSSavedTipEntry.lastUsedVersion.modify())()
{
  return j_j__swift_endAccess;
}

id TPSSavedTipEntry.__allocating_init(tipIdentifier:savedDate:lastUsedVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = &v11[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  id v13 = &v11[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  uint64_t v14 = sub_19C976560();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  uint64_t v16 = &v11[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
  *(void *)uint64_t v16 = a4;
  *((void *)v16 + 1) = a5;
  v19.receiver = v11;
  v19.super_class = v5;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v17;
}

id TPSSavedTipEntry.init(tipIdentifier:savedDate:lastUsedVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = &v5[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  id v13 = &v5[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  uint64_t v14 = sub_19C976560();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  uint64_t v16 = &v5[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
  *(void *)uint64_t v16 = a4;
  *((void *)v16 + 1) = a5;
  v19.receiver = v5;
  v19.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v17;
}

id TPSSavedTipEntry.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TPSSavedTipEntry.init()()
{
}

id TPSSavedTipEntry.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static TPSSavedTipEntry.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall TPSSavedTipEntry.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_19C976560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  int64_t v9 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];

  uint64_t v10 = v2 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  size_t v11 = (void *)sub_19C976510();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v13 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v13 forKey:v14];
}

id TPSSavedTipEntry.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPSSavedTipEntry.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  int64_t v9 = (char *)&v30 - v8;
  uint64_t v10 = sub_19C976560();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  id v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  uint64_t v14 = sub_19C976C20();
  if (v14 && (uint64_t v15 = (void *)v14, v36 = 0, v37 = 0, sub_19C9768A0(), v15, v37))
  {
    uint64_t v35 = v37;
    uint64_t v33 = v36;
    sub_19C8DFBA0(0, &qword_1E9414618);
    uint64_t v16 = sub_19C976C20();
    if (!v16)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      goto LABEL_9;
    }
    id v17 = (void *)v16;
    uint64_t v32 = v13;
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v34(v7, 1, 1, v10);
    sub_19C93DD28();
    sub_19C976F00();

    uint64_t v18 = v11;
    objc_super v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v19(v7, 1, v10) == 1)
    {
      v34(v9, 1, 1, v10);
LABEL_9:

      swift_bridgeObjectRelease();
      sub_19C93DCC8((uint64_t)v9);
      goto LABEL_10;
    }
    uint64_t v31 = v18;
    double v20 = v7;
    os_log_type_t v21 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v21(v9, v20, v10);
    v34(v9, 0, 1, v10);
    if (v19(v9, 1, v10) == 1) {
      goto LABEL_9;
    }
    uint64_t v24 = v32;
    v21(v32, v9, v10);
    uint64_t v25 = sub_19C976C20();
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      sub_19C9768A0();

      if (v37)
      {
        os_log_type_t v27 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        uint64_t v28 = (void *)sub_19C976510();
        uint64_t v29 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        id v22 = objc_msgSend(v2, sel_initWithTipIdentifier_savedDate_lastUsedVersion_, v27, v28, v29);

        (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v10);
        return v22;
      }
    }

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v10);
  }
  else
  {
  }
LABEL_10:
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_19C93DCC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_19C93DD28()
{
  unint64_t result = qword_1E9414620;
  if (!qword_1E9414620)
  {
    sub_19C976560();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414620);
  }
  return result;
}

uint64_t sub_19C93DD80()
{
  return type metadata accessor for TPSSavedTipEntry();
}

uint64_t type metadata accessor for TPSSavedTipEntry()
{
  uint64_t result = qword_1EB516C40;
  if (!qword_1EB516C40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19C93DDD4()
{
  uint64_t result = sub_19C976560();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TPSSavedTipEntry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSSavedTipEntry);
}

uint64_t dispatch thunk of TPSSavedTipEntry.__allocating_init(tipIdentifier:savedDate:lastUsedVersion:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

Swift::Void __swiftcall TipsLog.error(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall TipsLog.fault(_:)(Swift::String a1)
{
}

id static TipsLog.analytics.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516E50, (void **)&qword_1EB516E58, a1);
}

uint64_t sub_19C93DF18(uint64_t a1)
{
  return sub_19C93E114(a1, 0x6E6F6D656144, 0xE600000000000000, &qword_1EB5168A0);
}

id static TipsLog.daemon.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB5168A8, (void **)&qword_1EB5168A0, a1);
}

id static TipsLog.data.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516E90, (void **)&qword_1EB516E98, a1);
}

uint64_t sub_19C93DF7C(uint64_t a1)
{
  return sub_19C93E114(a1, 0x7265766F63736944, 0xEF7974696C696261, &qword_1EB516880);
}

id static TipsLog.discoverability.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516898, (void **)&qword_1EB516880, a1);
}

uint64_t sub_19C93DFCC(uint64_t a1)
{
  return sub_19C93E114(a1, 0x6E69746567726154, 0xE900000000000067, (uint64_t *)&unk_1EB5168B0);
}

id static TipsLog.targeting.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(qword_1EB5168C0, (void **)&unk_1EB5168B0, a1);
}

uint64_t sub_19C93E014(uint64_t a1)
{
  return sub_19C93E114(a1, 0x74694B706954, 0xE600000000000000, (uint64_t *)&unk_1EB516E38);
}

id static TipsLog.tipkit.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516E48, (void **)&unk_1EB516E38, a1);
}

uint64_t sub_19C93E054(uint64_t a1)
{
  return sub_19C93E114(a1, 0x656D6F636C6557, 0xE700000000000000, (uint64_t *)&unk_1EB516A50);
}

id static TipsLog.welcome.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516A60, (void **)&unk_1EB516A50, a1);
}

uint64_t sub_19C93E098(uint64_t a1)
{
  return sub_19C93E114(a1, 0x746567646957, 0xE600000000000000, (uint64_t *)&unk_1EB516A70);
}

id static TipsLog.widget.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1EB516A68, (void **)&unk_1EB516A70, a1);
}

uint64_t sub_19C93E0D8(uint64_t a1)
{
  return sub_19C93E114(a1, 0x676E697865646E49, 0xE800000000000000, &qword_1EB516A38);
}

uint64_t sub_19C93E0F8(uint64_t a1)
{
  return sub_19C93E114(a1, 0x686372616553, 0xE600000000000000, &qword_1E9414628);
}

uint64_t sub_19C93E114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_19C8DE6F4();
  uint64_t result = sub_19C976C70();
  *a4 = result;
  return result;
}

id static TipsLog.search.getter@<X0>(void **a1@<X8>)
{
  return sub_19C8E50D8(&qword_1E9414348, (void **)&qword_1E9414628, a1);
}

uint64_t Trimmed.wrappedValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19C93E1D8(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_19C9761D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1[1];
  v13[0] = *a1;
  v13[1] = v8;
  swift_bridgeObjectRetain();
  sub_19C9761C0();
  sub_19C93E418();
  uint64_t v9 = sub_19C976CE0();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t Trimmed.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = sub_19C9761D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = a1;
  v14[1] = a2;
  sub_19C9761C0();
  sub_19C93E418();
  uint64_t v10 = sub_19C976CE0();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *id v3 = v10;
  v3[1] = v12;
  return result;
}

unint64_t sub_19C93E418()
{
  unint64_t result = qword_1EB516BE8;
  if (!qword_1EB516BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516BE8);
  }
  return result;
}

void (*Trimmed.wrappedValue.modify(void *a1))(uint64_t **a1, char a2)
{
  id v3 = malloc(0x50uLL);
  *a1 = v3;
  void v3[6] = v1;
  uint64_t v4 = sub_19C9761D0();
  v3[7] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[8] = v5;
  v3[9] = malloc(*(void *)(v5 + 64));
  uint64_t v6 = v1[1];
  *id v3 = *v1;
  v3[1] = v6;
  swift_bridgeObjectRetain();
  return sub_19C93E528;
}

void sub_19C93E528(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  uint64_t v4 = (*a1)[1];
  uint64_t v6 = (*a1)[8];
  uint64_t v5 = (void *)(*a1)[9];
  uint64_t v8 = (uint64_t *)(*a1)[6];
  uint64_t v7 = (*a1)[7];
  uint64_t v9 = *a1;
  if (a2)
  {
    uint64_t v9[2] = v3;
    v9[3] = v4;
    swift_bridgeObjectRetain();
    sub_19C9761C0();
    sub_19C93E418();
    uint64_t v10 = sub_19C976CE0();
    uint64_t v12 = v11;
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v8 = v10;
    v8[1] = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[4] = v3;
    v9[5] = v4;
    sub_19C9761C0();
    sub_19C93E418();
    uint64_t v13 = sub_19C976CE0();
    uint64_t v15 = v14;
    (*(void (**)(void *, uint64_t))(v6 + 8))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v8 = v13;
    v8[1] = v15;
  }
  free(v5);
  free(v2);
}

TipsCore::Trimmed __swiftcall Trimmed.init(wrappedValue:)(Swift::String wrappedValue)
{
  object = wrappedValue._object;
  uint64_t countAndFlagsBits = wrappedValue._countAndFlagsBits;
  uint64_t v4 = v1;
  uint64_t v5 = sub_19C9761D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  v15[0] = countAndFlagsBits;
  v15[1] = object;
  sub_19C9761C0();
  sub_19C93E418();
  uint64_t v9 = sub_19C976CE0();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v12 = swift_bridgeObjectRelease();
  *uint64_t v4 = v9;
  v4[1] = v11;
  result.value._object = v13;
  result.value._uint64_t countAndFlagsBits = v12;
  return result;
}

uint64_t sub_19C93E780@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

void *initializeBufferWithCopyOfBuffer for Trimmed(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Trimmed()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Trimmed(void *a1, void *a2)
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

void *assignWithTake for Trimmed(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Trimmed(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Trimmed(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Trimmed()
{
  return &type metadata for Trimmed;
}

uint64_t sub_19C93E9B0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_19C93EA08(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(void (*)(uint64_t), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_19C93EFE8, v4);
  swift_release();
  return swift_release();
}

void sub_19C93EA9C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_19C9763D0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_19C93EB94@<X0>(void *a1@<X0>, uint64_t (**a2)(uint64_t *a1)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_19C93F05C;
  a2[1] = (uint64_t (*)(uint64_t *))v6;
  return swift_retain();
}

uint64_t sub_19C93EC20(uint64_t *a1, void (*a2)(uint64_t (*)(uint64_t a1), uint64_t))
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  a2(sub_19C93F064, v5);
  return swift_release();
}

uint64_t sub_19C93ECB0(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = (uint64_t (**)(uint64_t, uint64_t))(*a2 + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  *uint64_t v6 = sub_19C93F028;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_19C93ED4C(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v8[0] = sub_19C93F030;
  v8[1] = v6;
  swift_retain();
  a3(v8);
  return swift_release();
}

id TPSAsyncBlockOperation.__allocating_init(asyncBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_19C93EE48()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id TPSAsyncBlockOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TPSAsyncBlockOperation.init()()
{
}

id TPSAsyncBlockOperation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TPSAsyncBlockOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSAsyncBlockOperation);
}

uint64_t dispatch thunk of TPSAsyncBlockOperation.asyncBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TPSAsyncBlockOperation.__allocating_init(asyncBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_19C93EFB0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_19C93EFE8(uint64_t a1)
{
  sub_19C93EA9C(a1, *(void *)(v1 + 16));
}

uint64_t sub_19C93EFF0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C93F028(uint64_t a1, uint64_t a2)
{
  return sub_19C93ED4C(a1, a2, *(void (**)(void *))(v2 + 16));
}

uint64_t sub_19C93F030(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_19C93F05C(uint64_t *a1)
{
  return sub_19C93EC20(a1, *(void (**)(uint64_t (*)(uint64_t), uint64_t))(v1 + 16));
}

uint64_t sub_19C93F064(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t SearchResult.Item.documentIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
}

uint64_t SearchResult.Item.collectionIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_collectionIdentifier);
}

uint64_t SearchResult.Item.correlationIdentifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
}

uint64_t SearchResult.Item.contentType.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_contentType);
}

uint64_t SearchResult.Item.title.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_title);
}

uint64_t SearchResult.Item.body.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchResultItem_body);
}

double SearchResult.Item.relevance.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSSearchResultItem_relevance;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_19C93F278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v9[OBJC_IVAR___TPSSearchResultItem_contentType];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v9[OBJC_IVAR___TPSSearchResultItem_title];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v9[OBJC_IVAR___TPSSearchResultItem_body];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  *(void *)&v9[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
  uint64_t v14 = &v9[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  uint64_t v15 = &v9[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  v17.receiver = v9;
  v17.super_class = v4;
  return objc_msgSendSuper2(&v17, sel_init);
}

id SearchResult.Item.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SearchResult.Item.init()()
{
}

uint64_t SearchResult.items.getter()
{
  return sub_19C93F6E8();
}

uint64_t SearchResult.suggestions.getter()
{
  return sub_19C93F6E8();
}

uint64_t sub_19C93F6E8()
{
  return swift_bridgeObjectRetain();
}

id SearchResult.query.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

id sub_19C93F89C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  objc_super v8 = &v7[OBJC_IVAR___TPSSearchResult_items];
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v7[OBJC_IVAR___TPSSearchResult_items] = MEMORY[0x1E4FBC860];
  uint64_t v10 = &v7[OBJC_IVAR___TPSSearchResult_suggestions];
  *(void *)&v7[OBJC_IVAR___TPSSearchResult_suggestions] = v9;
  *(void *)&v7[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *(void *)objc_super v8 = a2;
  uint64_t v11 = v7;
  id v12 = a1;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v10 = a3;

  swift_bridgeObjectRelease();
  v15.receiver = v11;
  v15.super_class = v3;
  id v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

void SearchResult.init()()
{
}

id _s8TipsCore12SearchResultC4ItemCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static SearchResult.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchResult.encode(with:)(NSCoder with)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  id v4 = *v3;
  uint64_t v5 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];

  swift_beginAccess();
  type metadata accessor for SearchResult.Item();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  objc_super v8 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];
}

uint64_t type metadata accessor for SearchResult.Item()
{
  return self;
}

id SearchResult.init(coder:)(void *a1)
{
  objc_super v2 = v1;
  type metadata accessor for SearchQuery();
  uint64_t v4 = sub_19C976C20();
  if (!v4)
  {

LABEL_14:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v5 = (void *)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A30);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19C9809B0;
  uint64_t v7 = sub_19C8DFBA0(0, (unint64_t *)&unk_1EB516A20);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = type metadata accessor for SearchResult.Item();
  sub_19C976C30();
  swift_bridgeObjectRelease();
  if (!v14)
  {

LABEL_11:
    sub_19C8F58A0((uint64_t)v13);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414698);
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_19C9809B0;
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  sub_19C976C30();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v9 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v2, sel_initWithQuery_items_suggestions_, v5, v9, v10);

  return v11;
}

uint64_t SearchResult.description.getter()
{
  sub_19C976E10();
  sub_19C976920();
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_beginAccess();
  uint64_t v0 = type metadata accessor for SearchResult.Item();
  uint64_t v1 = swift_bridgeObjectRetain();
  MEMORY[0x19F39D590](v1, v0);
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x19F39D590](v2, MEMORY[0x1E4FBB1A0]);
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_beginAccess();
  sub_19C976920();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static SearchResult.Item.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchResult.Item.encode(with:)(NSCoder with)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  uint64_t v7 = v1 + OBJC_IVAR___TPSSearchResultItem_correlationIdentifier;
  swift_beginAccess();
  if (*(void *)(v7 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];
  swift_unknownObjectRelease();

  uint64_t v10 = v1 + OBJC_IVAR___TPSSearchResultItem_contentType;
  swift_beginAccess();
  if (*(void *)(v10 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];
  swift_unknownObjectRelease();

  uint64_t v13 = v1 + OBJC_IVAR___TPSSearchResultItem_title;
  swift_beginAccess();
  if (*(void *)(v13 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  objc_super v15 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v14 forKey:v15];
  swift_unknownObjectRelease();

  uint64_t v16 = v1 + OBJC_IVAR___TPSSearchResultItem_body;
  swift_beginAccess();
  if (*(void *)(v16 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v17 forKey:v18];
  swift_unknownObjectRelease();

  objc_super v19 = (double *)(v1 + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  double v20 = *v19;
  os_log_type_t v21 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeDouble:v21 forKey:v20];
}

id SearchResult.Item.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

char *SearchResult.Item.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  uint64_t v4 = sub_19C976C20();
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = sub_19C976C20();
  if (!v6)
  {

    a1 = v5;
LABEL_6:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v7 = (void *)v6;
  id v8 = objc_msgSend(v2, sel_initWithIdentifier_collectionIdentifier_, v5, v6);

  uint64_t v9 = (char *)v8;
  uint64_t v10 = sub_19C976C20();
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = sub_19C9768B0();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  objc_super v15 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
  swift_beginAccess();
  uint64_t *v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_19C976C20();
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = sub_19C9768B0();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  os_log_type_t v21 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_contentType];
  swift_beginAccess();
  uint64_t *v21 = v18;
  v21[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_19C976C20();
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = sub_19C9768B0();
    uint64_t v26 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v26 = 0;
  }
  os_log_type_t v27 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_title];
  swift_beginAccess();
  *os_log_type_t v27 = v24;
  v27[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_19C976C20();
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = sub_19C9768B0();
    uint64_t v32 = v31;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v32 = 0;
  }
  uint64_t v33 = (uint64_t *)&v9[OBJC_IVAR___TPSSearchResultItem_body];
  swift_beginAccess();
  *uint64_t v33 = v30;
  v33[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = (void *)sub_19C976880();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v34);
  uint64_t v36 = v35;

  uint64_t v37 = &v9[OBJC_IVAR___TPSSearchResultItem_relevance];
  swift_beginAccess();
  *(void *)uint64_t v37 = v36;
  return v9;
}

id sub_19C940AA4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t SearchResult.Item.description.getter()
{
  return 0;
}

uint64_t type metadata accessor for SearchResult()
{
  return self;
}

uint64_t method lookup function for SearchResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchResult);
}

uint64_t method lookup function for SearchResult.Item(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchResult.Item);
}

id sub_19C940DC4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v8 = &v3[OBJC_IVAR___TPSSearchResult_items];
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v3[OBJC_IVAR___TPSSearchResult_items] = MEMORY[0x1E4FBC860];
  uint64_t v10 = &v3[OBJC_IVAR___TPSSearchResult_suggestions];
  *(void *)&v3[OBJC_IVAR___TPSSearchResult_suggestions] = v9;
  *(void *)&v3[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *(void *)id v8 = a2;
  uint64_t v11 = v3;
  id v12 = a1;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v10 = a3;

  swift_bridgeObjectRelease();
  v14.receiver = v11;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

void sub_19C940EC0()
{
  unk_1E9413C67 = -18;
}

uint64_t static TPSTip.uti.getter()
{
  if (qword_1E9413BB0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E9413C58;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_19C940F58()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19C980A00;
  *(void *)(v0 + 32) = sub_19C9768B0();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_19C9768B0();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_19C9768B0();
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = sub_19C9768B0();
  *(void *)(v0 + 88) = v4;
  *(void *)(v0 + 96) = sub_19C9768B0();
  *(void *)(v0 + 104) = v5;
  uint64_t result = sub_19C9768B0();
  *(void *)(v0 + 112) = result;
  *(void *)(v0 + 120) = v7;
  *(void *)(v0 + 128) = 0xD000000000000024;
  *(void *)(v0 + 136) = 0x800000019C985BB0;
  *(void *)(v0 + 144) = 0xD000000000000023;
  *(void *)(v0 + 152) = 0x800000019C985BE0;
  qword_1E94146A0 = v0;
  return result;
}

double sub_19C941050()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 4;
  *(_OWORD *)(v0 + 16) = xmmword_19C980A10;
  *(void *)(v0 + 32) = 39;
  *(void *)(v0 + 40) = 0xE100000000000000;
  *(void *)(v0 + 48) = 34;
  *(void *)(v0 + 56) = 0xE100000000000000;
  *(void *)(v0 + 64) = 92;
  *(void *)(v0 + 72) = 0xE100000000000000;
  *(void *)(v0 + 80) = 42;
  *(void *)(v0 + 88) = 0xE100000000000000;
  off_1E94146A8 = (_UNKNOWN *)v0;
  return result;
}

id sub_19C9410B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C9761D0();
  uint64_t v67 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_19C941864();
  uint64_t v6 = v5;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F23830]), sel_init);
  if (qword_1E9414358 != -1) {
    swift_once();
  }
  uint64_t v78 = qword_1E94146A0;
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_19C942038(v8);
  uint64_t v78 = MEMORY[0x1E4FBC870];
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_19C942190(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setFetchAttributes_, v10);

  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v12 = swift_allocObject();
  long long v70 = xmmword_19C980A20;
  *(_OWORD *)(v12 + 16) = xmmword_19C980A20;
  *(void *)(v12 + 32) = sub_19C9768B0();
  *(void *)(v12 + 40) = v13;
  objc_super v14 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setProtectionClasses_, v14);

  uint64_t v68 = v11;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v70;
  id result = objc_msgSend(self, sel_spotlightBundleIdentifier);
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v18 = v7;
    uint64_t v19 = sub_19C9768B0();
    uint64_t v21 = v20;

    *(void *)(v15 + 32) = v19;
    *(void *)(v15 + 40) = v21;
    uint64_t v22 = (void *)sub_19C9769D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setBundleIDs_, v22);

    uint64_t v23 = (unsigned char *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
    swift_beginAccess();
    uint64_t v24 = v18;
    if ((*v23 & 1) == 0
      || (uint64_t v25 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle), swift_beginAccess(), *v25 != 2))
    {
      uint64_t v26 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
      swift_beginAccess();
      uint64_t v27 = *v26;
      unint64_t v28 = v26[1];
      uint64_t v77 = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_19C9422FC(v27, v28, 1);
      sub_19C942038(v29);
      uint64_t v30 = sub_19C9422FC(v27, v28, 0);
      sub_19C942038(v30);
      uint64_t v31 = *(void *)(v77 + 16);
      swift_bridgeObjectRelease();
      if (v31)
      {
        uint64_t v32 = (void *)sub_19C9769D0();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = 0;
      }
      objc_msgSend(v18, sel_setRankingQueries_, v32);

      uint64_t v24 = v18;
      id v33 = objc_msgSend(v18, sel_rankingQueries);
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = sub_19C9769E0();

        uint64_t v36 = *(void *)(v35 + 16);
        swift_bridgeObjectRelease();
        if (v36)
        {
          uint64_t v37 = swift_allocObject();
          *(void *)(v37 + 16) = v36;
          uint64_t v38 = (long double (**)(double))(v1 + OBJC_IVAR___TPSSearchQuery_rankingModifier);
          uint64_t v39 = *(void *)(v1 + OBJC_IVAR___TPSSearchQuery_rankingModifier);
          uint64_t *v38 = sub_19C942504;
          v38[1] = (long double (*)(double))v37;
          sub_19C94253C(v39);
        }
      }
    }
    if ((*v23 & 2) != 0)
    {
      *(void *)&long long v70 = v24;
      uint64_t v40 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
      swift_beginAccess();
      uint64_t v41 = v40[1];
      uint64_t v75 = *v40;
      uint64_t v76 = v41;
      swift_bridgeObjectRetain();
      sub_19C9761C0();
      sub_19C93E418();
      uint64_t v42 = sub_19C976CE0();
      uint64_t v44 = v43;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v4, v2);
      uint64_t v75 = v42;
      uint64_t v76 = v44;
      uint64_t v45 = sub_19C976D00();
      uint64_t v47 = v46;
      swift_bridgeObjectRelease();
      if (qword_1E9414360 != -1) {
        swift_once();
      }
      uint64_t v48 = *((void *)off_1E94146A8 + 2);
      if (v48)
      {
        uint64_t v66 = v41;
        uint64_t v67 = v6;
        uint64_t v65 = swift_bridgeObjectRetain();
        uint64_t v49 = (uint64_t *)(v65 + 40);
        do
        {
          uint64_t v51 = *(v49 - 1);
          uint64_t v50 = *v49;
          uint64_t v75 = v45;
          uint64_t v76 = v47;
          uint64_t v73 = v51;
          uint64_t v74 = v50;
          uint64_t v71 = 92;
          unint64_t v72 = 0xE100000000000000;
          swift_bridgeObjectRetain();
          sub_19C976920();
          uint64_t v45 = sub_19C976CF0();
          uint64_t v53 = v52;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v47 = v53;
          v49 += 2;
          --v48;
        }
        while (v48);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v75 = v45;
      uint64_t v76 = v47;
      sub_19C976920();
      uint64_t v54 = (void *)sub_19C976880();
      swift_bridgeObjectRelease();
      uint64_t v24 = (void *)v70;
      objc_msgSend((id)v70, sel_setCompletionString_, v54);

      objc_msgSend(v24, sel_setCompletionResultCount_, 10);
      uint64_t v55 = swift_allocObject();
      *(_OWORD *)(v55 + 16) = xmmword_19C980A30;
      *(void *)(v55 + 32) = sub_19C9768B0();
      *(void *)(v55 + 40) = v56;
      *(void *)(v55 + 48) = sub_19C9768B0();
      *(void *)(v55 + 56) = v57;
      *(void *)(v55 + 64) = sub_19C9768B0();
      *(void *)(v55 + 72) = v58;
      uint64_t v59 = (void *)sub_19C9769D0();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_setCompletionAttributes_, v59);
    }
    id v60 = objc_allocWithZone(MEMORY[0x1E4F23828]);
    id v61 = v24;
    uint64_t v62 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v63 = objc_msgSend(v60, sel_initWithQueryString_queryContext_, v62, v61);

    return v63;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_19C941864()
{
  uint64_t v1 = v0;
  uint64_t v2 = (unint64_t *)(v0 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  unint64_t v3 = *v2;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_searchTerm);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  id v7 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  uint64_t v8 = (*v7 >> 2) & 1;
  swift_bridgeObjectRetain();
  sub_19C941AD0(v5, v6, v8, v3);
  swift_bridgeObjectRelease();
  if (*(unsigned char *)v7)
  {
    sub_19C976E10();
    swift_bridgeObjectRelease();
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  sub_19C941E28(*v9);
  if (v10)
  {
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    swift_bridgeObjectRelease();
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  return 40;
}

uint64_t sub_19C941AD0(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  int v27 = a3;
  uint64_t v7 = sub_19C9761D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a1;
  unint64_t v33 = a2;
  sub_19C9761C0();
  sub_19C93E418();
  uint64_t v11 = sub_19C976CE0();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v32 = v11;
  unint64_t v33 = v13;
  uint64_t v14 = sub_19C976D00();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (qword_1E9414360 != -1) {
    swift_once();
  }
  uint64_t v17 = *((void *)off_1E94146A8 + 2);
  if (v17)
  {
    unint64_t v26 = a4;
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v18 = (uint64_t *)(v25 + 40);
    do
    {
      uint64_t v19 = *(v18 - 1);
      uint64_t v20 = *v18;
      uint64_t v32 = v14;
      unint64_t v33 = v16;
      uint64_t v30 = v19;
      uint64_t v31 = v20;
      uint64_t v28 = 92;
      unint64_t v29 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_19C976920();
      uint64_t v14 = sub_19C976CF0();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v16 = v22;
      v18 += 2;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    a4 = v26;
  }
  if (a4 <= 1)
  {
    uint64_t v32 = 39;
    unint64_t v33 = 0xE100000000000000;
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    sub_19C976920();
    swift_bridgeObjectRelease();
    return v32;
  }
  if (a4 == 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = 39;
    unint64_t v33 = 0xE100000000000000;
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    return v32;
  }
  uint64_t v32 = a4;
  uint64_t result = sub_19C976FF0();
  __break(1u);
  return result;
}

uint64_t sub_19C941E28(uint64_t result)
{
  if (result)
  {
    if (result == 2)
    {
      sub_19C976E10();
      swift_bridgeObjectRelease();
      return 0xD000000000000025;
    }
    else if (result == 1)
    {
      sub_19C976E10();
      swift_bridgeObjectRelease();
      if (qword_1E9413BB0 != -1) {
        swift_once();
      }
      return 0xD00000000000001FLL;
    }
    else
    {
      uint64_t result = sub_19C976FF0();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_19C941F9C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19C980A10;
  *(void *)(v0 + 32) = sub_19C9768B0();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_19C9768B0();
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = sub_19C9768B0();
  *(void *)(v0 + 72) = v3;
  uint64_t result = sub_19C9768B0();
  *(void *)(v0 + 80) = result;
  *(void *)(v0 + 88) = v5;
  off_1E94146B0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_19C942038(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_19C949B6C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C942190(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 40;
  uint64_t v4 = -(uint64_t)v1;
  uint64_t v5 = MEMORY[0x1E4FBC860];
  uint64_t v15 = result + 40;
  unint64_t v16 = *(void *)(result + 16);
  do
  {
    if (v2 <= v1) {
      unint64_t v6 = v1;
    }
    else {
      unint64_t v6 = v2;
    }
    uint64_t v7 = -(uint64_t)v6;
    for (i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = *(i - 1);
      uint64_t v9 = *i;
      swift_bridgeObjectRetain_n();
      char v11 = sub_19C965B04(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if (v11) {
        break;
      }
      uint64_t result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1) {
        return v5;
      }
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = v5;
    if ((result & 1) == 0)
    {
      uint64_t result = sub_19C973914(0, *(void *)(v5 + 16) + 1, 1);
      uint64_t v5 = v18;
    }
    unint64_t v13 = *(void *)(v5 + 16);
    unint64_t v12 = *(void *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      uint64_t result = sub_19C973914(v12 > 1, v13 + 1, 1);
      uint64_t v5 = v18;
    }
    *(void *)(v5 + 16) = v13 + 1;
    uint64_t v14 = v5 + 16 * v13;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v9;
    uint64_t v3 = v15;
    unint64_t v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_19C9422FC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3 = 0;
  uint64_t v19 = MEMORY[0x1E4FBC860];
  int v13 = a3 & 1;
  do
  {
    unint64_t v4 = qword_1EED851F8[v3 + 4];
    if (v4 != 2)
    {
      sub_19C941AD0(a1, a2, v13, v4);
      if (qword_1E9414368 != -1) {
        swift_once();
      }
      uint64_t v5 = (char *)off_1E94146B0;
      uint64_t v6 = *((void *)off_1E94146B0 + 2);
      if (v6)
      {
        uint64_t v16 = v3;
        swift_bridgeObjectRetain_n();
        uint64_t v7 = (uint64_t *)(v5 + 40);
        unint64_t v8 = (void *)MEMORY[0x1E4FBC860];
        do
        {
          uint64_t v17 = *(v7 - 1);
          uint64_t v18 = *v7;
          swift_bridgeObjectRetain_n();
          sub_19C976920();
          sub_19C976920();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v8 = sub_19C949B6C(0, v8[2] + 1, 1, v8);
          }
          unint64_t v10 = v8[2];
          unint64_t v9 = v8[3];
          if (v10 >= v9 >> 1) {
            unint64_t v8 = sub_19C949B6C((void *)(v9 > 1), v10 + 1, 1, v8);
          }
          v7 += 2;
          void v8[2] = v10 + 1;
          char v11 = &v8[2 * v10];
          v11[4] = v17;
          v11[5] = v18;
          swift_bridgeObjectRelease();
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v3 = v16;
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v8 = (void *)MEMORY[0x1E4FBC860];
      }
      sub_19C942038((uint64_t)v8);
    }
    ++v3;
  }
  while (v3 != 3);
  return v19;
}

uint64_t sub_19C9424F4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

long double sub_19C942504(double a1)
{
  return a1 / (exp2((double)*(uint64_t *)(v1 + 16)) + -1.0);
}

uint64_t sub_19C94253C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_19C94254C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_19C9761D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  sub_19C9761C0();
  sub_19C93E418();
  uint64_t v8 = sub_19C976CE0();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v27 = v8;
  uint64_t v28 = v10;
  uint64_t v11 = sub_19C976D00();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (qword_1E9414360 != -1) {
    swift_once();
  }
  uint64_t v14 = *((void *)off_1E94146A8 + 2);
  if (v14)
  {
    uint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v15 = (uint64_t *)(v22 + 40);
    do
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(v15 - 1);
      uint64_t v18 = *v15;
      uint64_t v27 = v11;
      uint64_t v28 = v16;
      uint64_t v25 = v17;
      uint64_t v26 = v18;
      uint64_t v23 = 92;
      unint64_t v24 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_19C976920();
      uint64_t v11 = sub_19C976CF0();
      uint64_t v13 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 += 2;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t WorkItemDebouncer.__allocating_init(queue:debounceInterval:)(uint64_t a1, double a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = 0;
  *(double *)(result + 32) = a2;
  return result;
}

uint64_t WorkItemDebouncer.init(queue:debounceInterval:)(uint64_t a1, double a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = 0;
  *(double *)(v2 + 32) = a2;
  return v2;
}

uint64_t WorkItemDebouncer.deinit()
{
  if (*(void *)(v0 + 24))
  {
    swift_retain();
    sub_19C976790();
    swift_release();
  }
  *(void *)(v0 + 24) = 0;
  swift_release();

  swift_release();
  return v0;
}

uint64_t WorkItemDebouncer.__deallocating_deinit()
{
  if (*(void *)(v0 + 24))
  {
    swift_retain();
    sub_19C976790();
    swift_release();
  }
  *(void *)(v0 + 24) = 0;
  swift_release();

  swift_release();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

void sub_19C9428B4(const void *a1)
{
  uint64_t v2 = _Block_copy(a1);
  sub_19C9428F4(v2, *(double *)(v1 + 32));
  _Block_release(v2);
}

uint64_t sub_19C9428F4(const void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_19C976770();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  unint64_t v33 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v34 = (char *)v31 - v10;
  uint64_t v32 = sub_19C976720();
  MEMORY[0x1F4188790](v32);
  v31[1] = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_19C976750();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v31 - v17;
  uint64_t v19 = _Block_copy(a1);
  uint64_t v20 = *(void *)(v2 + 24);
  uint64_t v35 = v7;
  uint64_t v36 = v6;
  if (v20)
  {
    swift_retain();
    sub_19C976790();
    swift_release();
  }
  *(void *)(v3 + 24) = 0;
  swift_release();
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  *(void *)(v22 + 24) = v21;
  aBlock[4] = sub_19C942FC8;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C942FD0;
  aBlock[3] = &block_descriptor_1;
  uint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  sub_19C976740();
  v31[0] = _Block_copy(v23);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  uint64_t v37 = MEMORY[0x1E4FBC860];
  sub_19C943014();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94146C0);
  sub_19C94306C();
  sub_19C976D30();
  sub_19C9767A0();
  swift_allocObject();
  uint64_t v24 = sub_19C976780();
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  swift_release();
  *(void *)(v3 + 24) = v24;
  swift_release();
  uint64_t v25 = v33;
  sub_19C976760();
  uint64_t v26 = v34;
  MEMORY[0x19F39D360](v25, a2);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t))(v35 + 8);
  uint64_t v28 = v25;
  uint64_t v29 = v36;
  uint64_t result = v27(v28, v36);
  if (*(void *)(v3 + 24))
  {
    swift_retain();
    sub_19C976BD0();
    swift_release();
    swift_release();
    return v27(v26, v29);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_19C942D2C(const void *a1, double a2)
{
  uint64_t v3 = _Block_copy(a1);
  sub_19C9428F4(v3, a2);
  _Block_release(v3);
}

uint64_t sub_19C942D78()
{
  if (*(void *)(v0 + 24))
  {
    swift_retain();
    sub_19C976790();
    swift_release();
  }
  *(void *)(v0 + 24) = 0;
  return swift_release();
}

uint64_t sub_19C942DD4()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_19C942DE0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WorkItemDebouncer();
  uint64_t result = sub_19C976640();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for WorkItem()
{
  return &type metadata for WorkItem;
}

uint64_t type metadata accessor for WorkItemDebouncer()
{
  return self;
}

uint64_t method lookup function for WorkItemDebouncer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WorkItemDebouncer);
}

uint64_t dispatch thunk of WorkItemDebouncer.__allocating_init(queue:debounceInterval:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of WorkItemDebouncer.execute(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of WorkItemDebouncer.execute(customDelay:block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of WorkItemDebouncer.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t sub_19C942EE8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C942F20(uint64_t a1)
{
  (*(void (**)(void))(a1 + 16))();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + 24) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_19C942F88()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C942FC8()
{
  return sub_19C942F20(*(void *)(v0 + 16));
}

uint64_t sub_19C942FD0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

unint64_t sub_19C943014()
{
  unint64_t result = qword_1E94146B8;
  if (!qword_1E94146B8)
  {
    sub_19C976720();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94146B8);
  }
  return result;
}

unint64_t sub_19C94306C()
{
  unint64_t result = qword_1E94146C8;
  if (!qword_1E94146C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94146C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94146C8);
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

Swift::Bool __swiftcall TPSAppController.hasLocalVariant(tip:)(TPSTip *tip)
{
  uint64_t v2 = [(TPSDocument *)tip correlationID];
  Swift::Bool result = 0;
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v1, sel_tipForCorrelationIdentifier_, v2);

    if (v4) {
      return 1;
    }
  }
  return result;
}

Swift::Void __swiftcall TPSAppController.logSharedTipDisplayed(tip:isEligible:)(TPSTip *tip, Swift::Bool isEligible)
{
  uint64_t v3 = v2;
  if (isEligible)
  {
    uint64_t v6 = [(TPSDocument *)tip identifier];
    if (!v6)
    {
      sub_19C9768B0();
      uint64_t v6 = (NSString *)sub_19C976880();
      swift_bridgeObjectRelease();
    }
    id v7 = objc_msgSend(v3, sel_collectionIdentifierForTipIdentifier_, v6);

    sub_19C9768B0();
    uint64_t v9 = v8;

LABEL_10:
    unint64_t v16 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = [(TPSDocument *)tip correlationID];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_msgSend(v3, sel_tipForCorrelationIdentifier_, v10);

    if (v12)
    {
      id v13 = objc_msgSend(v12, sel_identifier);
      if (!v13)
      {
        sub_19C9768B0();
        id v13 = (id)sub_19C976880();
        swift_bridgeObjectRelease();
      }
      id v14 = objc_msgSend(v3, sel_collectionIdentifierForTipIdentifier_, v13);

      sub_19C9768B0();
      uint64_t v9 = v15;

      goto LABEL_10;
    }
  }
  uint64_t v9 = [(TPSDocument *)tip availabilityMessage];
  if (v9)
  {
    uint64_t v17 = sub_19C9768B0();
    unint64_t v16 = v18;

    uint64_t v19 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0) {
      uint64_t v19 = v17 & 0xFFFFFFFFFFFFLL;
    }
    if (v19)
    {
      uint64_t v9 = 0;
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
  }
  unint64_t v16 = 0x800000019C985CF0;
LABEL_19:
  uint64_t v20 = [(TPSDocument *)tip identifier];
  if (!v20)
  {
    sub_19C9768B0();
    uint64_t v20 = (NSString *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = [(TPSDocument *)tip correlationID];
  if (v9)
  {
    uint64_t v22 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v23 = [(TPSDocument *)tip variantID];
  if (v23)
  {
    if (v16)
    {
LABEL_26:
      uint64_t v24 = (void *)sub_19C976880();
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
  }
  else
  {
    sub_19C9768B0();
    uint64_t v23 = (NSString *)sub_19C976880();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_26;
    }
  }
  uint64_t v24 = 0;
LABEL_29:
  id v25 = objc_msgSend(self, sel_eventWithTipID_correlationID_collectionID_variantID_message_isEligible_, v20, v21, v22, v23, v24, isEligible);

  [v25 log];
}

void _sSo16TPSAppControllerC8TipsCoreE28logInvalidSharedTipDisplayed3tipySo6TPSTipC_tF_0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_identifier);
  if (!v2)
  {
    sub_19C9768B0();
    id v2 = (id)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  id v3 = objc_msgSend(a1, sel_variantID);
  if (!v3)
  {
    sub_19C9768B0();
    id v3 = (id)sub_19C976880();
    swift_bridgeObjectRelease();
  }
  id v4 = objc_msgSend(self, sel_eventWithTipID_invalidVariantID_, v2, v3);

  [v4 log];
}

void sub_19C94372C()
{
  id v0 = objc_msgSend(self, sel_tps_userLanguageCode);
  uint64_t v1 = sub_19C9768B0();
  uint64_t v3 = v2;

  qword_1E94146D0 = v1;
  *(void *)algn_1E94146D8 = v3;
  qword_1E94146E0 = 0x3FF0000000000000;
}

TipsCore::TipSpotlightViewType::AssetConfiguration __swiftcall TipSpotlightViewType.AssetConfiguration.init(language:heightToWidthRatio:)(Swift::String language, Swift::Double heightToWidthRatio)
{
  *(Swift::String *)uint64_t v2 = language;
  *(Swift::Double *)(v2 + 16) = heightToWidthRatio;
  result.language = language;
  result.heightToWidthRatio = heightToWidthRatio;
  return result;
}

uint64_t static TipSpotlightViewType.AssetConfiguration.default.getter@<X0>(void *a1@<X8>)
{
  if (qword_1E9414370 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_1E94146D8;
  uint64_t v3 = qword_1E94146E0;
  *a1 = qword_1E94146D0;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewType.AssetConfiguration.language.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double TipSpotlightViewType.AssetConfiguration.heightToWidthRatio.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t TipSpotlightViewType.AssetConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19C943ABC();
  sub_19C9770D0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v18 = 0;
  uint64_t v9 = sub_19C976F10();
  uint64_t v12 = v10;
  if (v10)
  {
    uint64_t v13 = v9;
  }
  else
  {
    if (qword_1E9414370 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_1E94146D0;
    uint64_t v12 = *(void *)algn_1E94146D8;
    swift_bridgeObjectRetain();
  }
  char v17 = 1;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_19C976F20();
  if (v15)
  {
    if (qword_1E9414370 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_1E94146E0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v13;
  a2[1] = v12;
  a2[2] = v14;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_19C943ABC()
{
  unint64_t result = qword_1EB516D48;
  if (!qword_1EB516D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D48);
  }
  return result;
}

uint64_t sub_19C943B10(char a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 0x65676175676E616CLL;
  }
}

uint64_t sub_19C943B54()
{
  return sub_19C943B10(*v0);
}

uint64_t sub_19C943B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_19C945C58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19C943B84()
{
  return 0;
}

void sub_19C943B90(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_19C943B9C(uint64_t a1)
{
  unint64_t v2 = sub_19C943ABC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19C943BD8(uint64_t a1)
{
  unint64_t v2 = sub_19C943ABC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TipSpotlightViewType.AssetConfiguration.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19C943ABC();
  sub_19C9770E0();
  char v10 = 0;
  uint64_t v6 = v8;
  sub_19C976F40();
  if (!v6)
  {
    char v9 = 1;
    sub_19C976F50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_19C943D8C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return TipSpotlightViewType.AssetConfiguration.init(from:)(a1, a2);
}

uint64_t sub_19C943DA4(void *a1)
{
  return TipSpotlightViewType.AssetConfiguration.encode(to:)(a1);
}

uint64_t TipSpotlightViewProxy.assetConfiguration.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewProxy.assetConfiguration.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  v1[2] = v4;
  return result;
}

uint64_t (*TipSpotlightViewProxy.assetConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightViewProxy.bodyContent.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightViewProxy.bodyContent.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TipSpotlightViewProxy.bodyContent.modify())()
{
  return nullsub_1;
}

uint64_t TipSpotlightViewProxy.init()@<X0>(void *a1@<X8>)
{
  if (qword_1E9414370 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_1E94146D8;
  uint64_t v3 = qword_1E94146E0;
  *a1 = qword_1E94146D0;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = 0;
  return swift_bridgeObjectRetain();
}

double TipSpotlightViewProxy.init(assetConfiguration:bodyContent:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  double result = *(double *)(a1 + 16);
  *(void *)a3 = *(void *)a1;
  *(void *)(a3 + 8) = v3;
  *(double *)(a3 + 16) = result;
  *(void *)(a3 + 24) = a2;
  return result;
}

uint64_t sub_19C943F1C@<X0>(void *a1@<X8>)
{
  if (qword_1E9414370 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_1E94146D8;
  uint64_t v3 = qword_1E94146E0;
  *a1 = qword_1E94146D0;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C943F98@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C943FAC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  v1[2] = v4;
  return result;
}

uint64_t (*sub_19C943FF0())()
{
  return nullsub_1;
}

uint64_t sub_19C944010()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C944018(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_19C944044())()
{
  return nullsub_1;
}

uint64_t sub_19C944064@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_19C94407C(a1, a2);
}

uint64_t sub_19C94407C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v25 = a2;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CC0);
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9414370 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1E94146D0;
  unint64_t v8 = *(void *)algn_1E94146D8;
  uint64_t v9 = qword_1E94146E0;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19C944934();
  swift_bridgeObjectRetain();
  sub_19C9770D0();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_19C944988();
    sub_19C976F30();
    unint64_t v10 = v29;
    if (v29)
    {
      uint64_t v9 = v30;
      uint64_t v11 = (uint64_t)v28;
      swift_bridgeObjectRelease();
      unint64_t v8 = v10;
    }
    else
    {
      uint64_t v11 = v7;
    }
    LOBYTE(v27) = 1;
    sub_19C9449DC();
    sub_19C976F30();
    unint64_t v13 = v29;
    if (v29 >> 60 == 15)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v24 = v11;
      uint64_t v15 = (uint64_t)v28;
      uint64_t v16 = self;
      uint64_t v23 = v15;
      char v17 = (void *)sub_19C9764E0();
      id v28 = 0;
      id v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, v17, 0, &v28);

      if (v18)
      {
        id v19 = v28;
        sub_19C976D10();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA8);
        if (swift_dynamicCast()) {
          uint64_t v14 = v27;
        }
        else {
          uint64_t v14 = 0;
        }
      }
      else
      {
        id v20 = v28;
        uint64_t v21 = (void *)sub_19C9763E0();

        swift_willThrow();
        uint64_t v14 = 0;
      }
      swift_bridgeObjectRelease();
      sub_19C9452A8(v23, v13);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
      uint64_t v11 = v24;
    }
    uint64_t v22 = v25;
    *id v25 = v11;
    v22[1] = v8;
    void v22[2] = v9;
    v22[3] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t TipSpotlightViewProtocol.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v40 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CC0);
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t v14 = a1[3];
  uint64_t v44 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v14);
  sub_19C944934();
  uint64_t v15 = v43;
  sub_19C9770D0();
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, a2);
  }
  else
  {
    uint64_t v16 = v41;
    uint64_t v43 = v11;
    LOBYTE(v45) = 0;
    sub_19C944988();
    uint64_t v17 = v42;
    sub_19C976F30();
    uint64_t v18 = v47;
    id v19 = v13;
    if (v47)
    {
      uint64_t v20 = v48;
      id v21 = v46;
      uint64_t v22 = v16;
    }
    else
    {
      uint64_t v22 = v16;
      if (qword_1E9414370 != -1) {
        swift_once();
      }
      id v21 = (id)qword_1E94146D0;
      uint64_t v20 = qword_1E94146E0;
      uint64_t v18 = swift_bridgeObjectRetain();
    }
    uint64_t v23 = a2;
    uint64_t v24 = a3;
    id v46 = v21;
    unint64_t v47 = v18;
    uint64_t v48 = v20;
    id v25 = *(void (**)(id *, uint64_t, uint64_t))(a3 + 40);
    uint64_t v26 = v19;
    v25(&v46, a2, v24);
    LOBYTE(v45) = 1;
    sub_19C9449DC();
    uint64_t v27 = v10;
    sub_19C976F30();
    if (v47 >> 60 != 15)
    {
      uint64_t v41 = v23;
      uint64_t v28 = (uint64_t)v46;
      unint64_t v29 = v47;
      uint64_t v30 = self;
      uint64_t v39 = v28;
      unint64_t v31 = v29;
      uint64_t v32 = (void *)sub_19C9764E0();
      id v46 = 0;
      id v33 = objc_msgSend(v30, sel_JSONObjectWithData_options_error_, v32, 0, &v46);

      if (v33)
      {
        id v34 = v46;
        sub_19C976D10();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA8);
        if (swift_dynamicCast()) {
          uint64_t v35 = v45;
        }
        else {
          uint64_t v35 = 0;
        }
      }
      else
      {
        id v36 = v46;
        uint64_t v37 = (void *)sub_19C9763E0();

        swift_willThrow();
        uint64_t v35 = 0;
      }
      uint64_t v23 = v41;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 64))(v35, v41, v24);
      sub_19C9452A8(v39, v31);
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v17);
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v40, v26, v23);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
}

unint64_t sub_19C944934()
{
  unint64_t result = qword_1EB516D30;
  if (!qword_1EB516D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D30);
  }
  return result;
}

unint64_t sub_19C944988()
{
  unint64_t result = qword_1E9413CB8;
  if (!qword_1E9413CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9413CB8);
  }
  return result;
}

unint64_t sub_19C9449DC()
{
  unint64_t result = qword_1E9413CB0;
  if (!qword_1E9413CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9413CB0);
  }
  return result;
}

uint64_t sub_19C944A30(void *a1)
{
  return sub_19C944A54(a1, *(void **)v1, *(void *)(v1 + 8), *(void *)(v1 + 24), *(double *)(v1 + 16));
}

uint64_t sub_19C944A54(void *a1, void *a2, unint64_t a3, uint64_t a4, double a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C68);
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19C944934();
  sub_19C9770E0();
  id v26 = a2;
  unint64_t v27 = a3;
  double v28 = a5;
  char v25 = 0;
  sub_19C945314();
  swift_bridgeObjectRetain();
  sub_19C976F60();
  if (v5) {

  }
  swift_bridgeObjectRelease();
  if (!a4) {
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  }
  uint64_t v14 = self;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C50);
  uint64_t v15 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v26 = 0;
  id v16 = objc_msgSend(v14, sel_dataWithJSONObject_options_error_, v15, 0, &v26);

  id v17 = v26;
  if (v16)
  {
    uint64_t v18 = (void *)sub_19C9764F0();
    unint64_t v20 = v19;

    id v26 = v18;
    unint64_t v27 = v20;
    char v25 = 1;
    sub_19C945368();
    sub_19C976F60();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    return sub_19C9452BC((uint64_t)v18, v20);
  }
  else
  {
    id v21 = v17;
    uint64_t v22 = (void *)sub_19C9763E0();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  }
}

uint64_t TipSpotlightViewProtocol.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C68);
  uint64_t v21 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_19C944934();
  sub_19C9770E0();
  (*(void (**)(id *__return_ptr, uint64_t, uint64_t))(a3 + 32))(&v26, a2, a3);
  id v23 = v26;
  unint64_t v24 = v27;
  uint64_t v25 = v28;
  char v22 = 0;
  sub_19C945314();
  sub_19C976F60();
  if (v3) {

  }
  swift_bridgeObjectRelease();
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3)) {
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v7);
  }
  unint64_t v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C50);
  uint64_t v11 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v26 = 0;
  id v12 = objc_msgSend(v10, sel_dataWithJSONObject_options_error_, v11, 0, &v26);

  id v13 = v26;
  if (v12)
  {
    uint64_t v14 = (void *)sub_19C9764F0();
    unint64_t v16 = v15;

    id v26 = v14;
    unint64_t v27 = v16;
    LOBYTE(v23) = 1;
    sub_19C945368();
    sub_19C976F60();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v7);
    return sub_19C9452BC((uint64_t)v14, v16);
  }
  else
  {
    id v17 = v13;
    uint64_t v18 = (void *)sub_19C9763E0();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v7);
  }
}

uint64_t sub_19C9450E8(char a1)
{
  if (a1) {
    return 0x746E6F4379646F62;
  }
  else {
    return 0xD000000000000012;
  }
}

BOOL sub_19C945130(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_19C945148()
{
  return sub_19C9770C0();
}

uint64_t sub_19C945190()
{
  return sub_19C9770A0();
}

uint64_t sub_19C9451BC()
{
  return sub_19C9770C0();
}

uint64_t sub_19C945200()
{
  return sub_19C9450E8(*v0);
}

uint64_t sub_19C945208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_19C945D40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_19C945230(uint64_t a1)
{
  unint64_t v2 = sub_19C944934();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_19C94526C(uint64_t a1)
{
  unint64_t v2 = sub_19C944934();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_19C9452A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_19C9452BC(a1, a2);
  }
  return a1;
}

uint64_t sub_19C9452BC(uint64_t a1, unint64_t a2)
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

unint64_t sub_19C945314()
{
  unint64_t result = qword_1E9413C48;
  if (!qword_1E9413C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9413C48);
  }
  return result;
}

unint64_t sub_19C945368()
{
  unint64_t result = qword_1E9413C40;
  if (!qword_1E9413C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9413C40);
  }
  return result;
}

unint64_t sub_19C9453BC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_19C9453EC();
  unint64_t result = sub_19C945440();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_19C9453EC()
{
  unint64_t result = qword_1E94146E8;
  if (!qword_1E94146E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94146E8);
  }
  return result;
}

unint64_t sub_19C945440()
{
  unint64_t result = qword_1E94146F0;
  if (!qword_1E94146F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94146F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipSpotlightViewType()
{
  return &type metadata for TipSpotlightViewType;
}

void *sub_19C9454A8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TipSpotlightViewType.AssetConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for TipSpotlightViewType.AssetConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightViewType.AssetConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSpotlightViewType.AssetConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipSpotlightViewType.AssetConfiguration()
{
  return &type metadata for TipSpotlightViewType.AssetConfiguration;
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.assetConfiguration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of TipSpotlightViewProtocol.bodyContent.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t destroy for TipSpotlightViewProxy()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TipSpotlightViewProxy(void *a1, void *a2)
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

void *assignWithCopy for TipSpotlightViewProxy(void *a1, void *a2)
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

void *assignWithTake for TipSpotlightViewProxy(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightViewProxy(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TipSpotlightViewProxy(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipSpotlightViewProxy()
{
  return &type metadata for TipSpotlightViewProxy;
}

unsigned char *sub_19C945898(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodingKeys()
{
  return &type metadata for CodingKeys;
}

uint64_t getEnumTagSinglePayload for AssistantSupportClient.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s8TipsCore10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x19C945A10);
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

ValueMetadata *type metadata accessor for TipSpotlightViewType.AssetConfiguration.CodingKeys()
{
  return &type metadata for TipSpotlightViewType.AssetConfiguration.CodingKeys;
}

unint64_t sub_19C945A4C()
{
  unint64_t result = qword_1E94146F8;
  if (!qword_1E94146F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94146F8);
  }
  return result;
}

unint64_t sub_19C945AA4()
{
  unint64_t result = qword_1E9414700;
  if (!qword_1E9414700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414700);
  }
  return result;
}

unint64_t sub_19C945AFC()
{
  unint64_t result = qword_1EB516D40;
  if (!qword_1EB516D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D40);
  }
  return result;
}

unint64_t sub_19C945B54()
{
  unint64_t result = qword_1EB516D38;
  if (!qword_1EB516D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D38);
  }
  return result;
}

unint64_t sub_19C945BAC()
{
  unint64_t result = qword_1EB516D58;
  if (!qword_1EB516D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D58);
  }
  return result;
}

unint64_t sub_19C945C04()
{
  unint64_t result = qword_1EB516D50;
  if (!qword_1EB516D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516D50);
  }
  return result;
}

uint64_t sub_19C945C58(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65676175676E616CLL && a2 == 0xE800000000000000;
  if (v3 || (sub_19C976FB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000019C985D40)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_19C945D40(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000019C985D60 || (sub_19C976FB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E6F4379646F62 && a2 == 0xEF61746144746E65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id NetworkMonitorProxy.__allocating_init(monitor:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_19C946DE0(a1);
  swift_release();
  return v4;
}

id static NetworkMonitorProxy.shared.getter()
{
  if (qword_1EB516AA8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB516BE0;
  return v0;
}

id NetworkMonitorProxy.init(monitor:)(uint64_t a1)
{
  id v1 = sub_19C946DE0(a1);
  swift_release();
  return v1;
}

Swift::Void __swiftcall NetworkMonitorProxy.start()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  int v2 = (os_unfair_lock_s *)(*(void *)(v1 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_19C8F7130();
  os_unfair_lock_unlock(v2);
  swift_release_n();
}

uint64_t sub_19C945FF0(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516BF0);
  *(void *)(v1 + 48) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C946084, 0, 0);
}

uint64_t sub_19C946084()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x19F39E8A0](v1);
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    v0[7] = v4;
    swift_retain();

    return MEMORY[0x1F4188298](sub_19C946164, v4, 0);
  }
  else
  {
    swift_task_dealloc();
    char v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_19C946164()
{
  uint64_t v1 = v0[7];
  if (!*(void *)(v1 + 112))
  {
    uint64_t v2 = v0[6];
    uint64_t v3 = sub_19C976AC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
    uint64_t v4 = swift_allocObject();
    swift_weakInit();
    char v5 = (void *)swift_allocObject();
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v4;
    *(void *)(v1 + 112) = sub_19C957D08(v2, (uint64_t)&unk_1E9414768, (uint64_t)v5);
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  char v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_19C9462E8(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return MEMORY[0x1F4188298](sub_19C8DE978, 0, 0);
}

uint64_t NetworkMonitorProxy.removeObserver(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_19C9765A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_serialTasks);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(&v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v5 + 32))(v10 + v9, &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v4);
  uint64_t v11 = *(os_unfair_lock_s **)(v7 + 16);
  uint64_t v18 = v7;
  unint64_t v19 = &unk_1E9414748;
  uint64_t v20 = v10;
  unint64_t v15 = sub_19C8F7158;
  unint64_t v16 = &v17;
  id v12 = v11 + 4;
  swift_retain();
  os_unfair_lock_lock(v12);
  sub_19C8F7118();
  os_unfair_lock_unlock(v12);
  swift_release();
  return swift_release();
}

uint64_t sub_19C9464C4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return MEMORY[0x1F4188298](sub_19C9464E4, 0, 0);
}

uint64_t sub_19C9464E4()
{
  uint64_t v1 = v0[8] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x19F39E8A0](v1);
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR___TPSNetworkPathMonitor_monitor);
    v0[10] = v4;
    swift_retain();

    return MEMORY[0x1F4188298](sub_19C9465BC, v4, 0);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_19C9465BC()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_beginAccess();
  uint64_t v2 = sub_19C95C740(v1);
  swift_endAccess();
  if (v2) {
    sub_19C94253C(v2);
  }
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id NetworkMonitorProxy.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void NetworkMonitorProxy.init()()
{
}

id NetworkMonitorProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19C946958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  if (a4)
  {
    uint64_t v8 = (void *)swift_task_alloc();
    v6[6] = v8;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
    *uint64_t v8 = v6;
    v8[1] = sub_19C946AD8;
    uint64_t v10 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v11 = MEMORY[0x1E4FBC0F0];
    return MEMORY[0x1F4187DA0](v6 + 2, a4, v10, v9, v11);
  }
  else
  {
    uint64_t v14 = (uint64_t (*)(void))((char *)a5 + *a5);
    id v12 = (void *)swift_task_alloc();
    v6[7] = v12;
    *id v12 = v6;
    v12[1] = sub_19C946CAC;
    return v14();
  }
}

uint64_t sub_19C946AD8()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C946BD4, 0, 0);
}

uint64_t sub_19C946BD4()
{
  sub_19C8DEAB8(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(v0 + 32) + **(int **)(v0 + 32));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19C946CAC;
  return v3();
}

uint64_t sub_19C946CAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19C946DA0()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

id sub_19C946DE0(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___TPSNetworkPathMonitor_serialTasks;
  type metadata accessor for SerialTaskExecutor();
  uint64_t v5 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C08);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(void *)(v5 + 16) = v6;
  *(void *)(v5 + 24) = 0;
  *(void *)&v1[v4] = v5;
  if (a1)
  {
    uint64_t v7 = v1;
    uint64_t v8 = a1;
  }
  else
  {
    type metadata accessor for NetworkMonitor();
    uint64_t v8 = swift_allocObject();
    uint64_t v9 = v1;
    swift_defaultActor_initialize();
    *(void *)(v8 + 112) = 0;
    uint64_t v10 = v8 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
    uint64_t v11 = sub_19C976710();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    uint64_t v12 = OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers;
    *(void *)(v8 + v12) = sub_19C8FE0E8(MEMORY[0x1E4FBC860]);
  }
  *(void *)&v1[OBJC_IVAR___TPSNetworkPathMonitor_monitor] = v8;
  swift_retain();

  v14.receiver = v1;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_19C946F30()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C946F68()
{
  objc_super v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *objc_super v2 = v1;
  v2[1] = sub_19C8E59E4;
  return sub_19C945FF0(v0);
}

uint64_t sub_19C946FF8()
{
  uint64_t v1 = sub_19C9765A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_19C9470E4()
{
  uint64_t v1 = sub_19C9765A0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_19C9471B0()
{
  uint64_t v2 = *(void *)(sub_19C9765A0() - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_19C8E59E4;
  v5[8] = v3;
  v5[9] = v4;
  return MEMORY[0x1F4188298](sub_19C9464E4, 0, 0);
}

uint64_t method lookup function for NetworkMonitorProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NetworkMonitorProxy);
}

uint64_t dispatch thunk of NetworkMonitorProxy.__allocating_init(monitor:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_19C9472C4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C9472FC(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_19C947314()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C94734C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_19C947374(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9413BA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19C9473D4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_19C94741C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (int *)v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_19C8E59E4;
  return sub_19C946958(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_19C9474E4()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C94751C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_19C94755C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_19C947610;
  return sub_19C95804C(a1, v4, v5, v6);
}

uint64_t sub_19C947610()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t UserGuide.topicIdentifier.getter()
{
  swift_getKeyPath();
  sub_19C939EDC();
  sub_19C9765E0();
  swift_release();
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void sub_19C9477A8()
{
  qword_1E9414770 = 1802465122;
  *(void *)algn_1E9414778 = 0xE400000000000000;
}

void sub_19C9477C4()
{
  qword_1E9414780 = 0x6369706F74;
  *(void *)algn_1E9414788 = 0xE500000000000000;
}

void sub_19C9477E4()
{
  qword_1E9414790 = 0x726F68636E61;
  *(void *)algn_1E9414798 = 0xE600000000000000;
}

void sub_19C947804()
{
  qword_1E94147A0 = 0x6E6F6973726576;
  *(void *)algn_1E94147A8 = 0xE700000000000000;
}

void sub_19C947828()
{
  qword_1E94147B0 = 0x7265727265666572;
  *(void *)algn_1E94147B8 = 0xE800000000000000;
}

id UserGuide.__allocating_init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  id v18 = objc_allocWithZone(v12);
  return UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t UserGuide.topicIdentifier.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t static UserGuide.privateURL(bookIdentifier:topicIdentifier:version:referrer:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  return static UserGuide.url(book:topic:anchor:version:referrer:)(a1, a2, a3, 0, 0, a4, a5, a8, a6, a7);
}

uint64_t static UserGuide.url(book:topic:anchor:version:referrer:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  uint64_t v55 = a7;
  uint64_t v50 = a6;
  uint64_t v51 = a5;
  uint64_t v48 = a2;
  uint64_t v49 = a4;
  uint64_t v53 = a8;
  uint64_t v54 = sub_19C9762D0();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  id v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_19C976210();
  uint64_t v14 = *(void *)(v59 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v59);
  uint64_t v58 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v57 = (char *)&v48 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v56 = (char *)&v48 - v20;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  id v23 = (char *)&v48 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v48 - v24;
  if (!a1)
  {
    id v26 = objc_msgSend(self, sel_deviceGuideIdentifier, v48, v49, v50);
    sub_19C9768B0();
  }
  uint64_t v27 = qword_1E9414380;
  swift_bridgeObjectRetain();
  if (v27 != -1) {
    swift_once();
  }
  sub_19C9761E0();
  swift_bridgeObjectRelease();
  unint64_t v28 = sub_19C949C7C(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v30 = *(void *)(v28 + 16);
  unint64_t v29 = *(void *)(v28 + 24);
  if (v30 >= v29 >> 1) {
    unint64_t v28 = sub_19C949C7C(v29 > 1, v30 + 1, 1, v28);
  }
  *(void *)(v28 + 16) = v30 + 1;
  id v33 = *(void (**)(unint64_t, char *, uint64_t))(v14 + 32);
  uint64_t v32 = v14 + 32;
  unint64_t v31 = v33;
  unint64_t v34 = (*(unsigned __int8 *)(v32 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 48);
  uint64_t v35 = *(void *)(v32 + 40);
  v33(v28 + v34 + v35 * v30, v25, v59);
  if (!a3)
  {
    uint64_t v39 = v55;
    uint64_t v38 = v59;
    if (!v51) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  if (qword_1E9414388 != -1) {
    swift_once();
  }
  sub_19C9761E0();
  unint64_t v37 = *(void *)(v28 + 16);
  unint64_t v36 = *(void *)(v28 + 24);
  uint64_t v38 = v59;
  if (v37 >= v36 >> 1) {
    unint64_t v28 = sub_19C949C7C(v36 > 1, v37 + 1, 1, v28);
  }
  *(void *)(v28 + 16) = v37 + 1;
  v31(v28 + v34 + v37 * v35, v23, v38);
  uint64_t v39 = v55;
  if (v51)
  {
LABEL_15:
    if (qword_1E9414390 != -1) {
      swift_once();
    }
    sub_19C9761E0();
    unint64_t v41 = *(void *)(v28 + 16);
    unint64_t v40 = *(void *)(v28 + 24);
    if (v41 >= v40 >> 1) {
      unint64_t v28 = sub_19C949C7C(v40 > 1, v41 + 1, 1, v28);
    }
    *(void *)(v28 + 16) = v41 + 1;
    v31(v28 + v34 + v41 * v35, v56, v38);
  }
LABEL_20:
  if (v39)
  {
    if (qword_1E9414398 != -1) {
      swift_once();
    }
    sub_19C9761E0();
    unint64_t v43 = *(void *)(v28 + 16);
    unint64_t v42 = *(void *)(v28 + 24);
    if (v43 >= v42 >> 1) {
      unint64_t v28 = sub_19C949C7C(v42 > 1, v43 + 1, 1, v28);
    }
    *(void *)(v28 + 16) = v43 + 1;
    v31(v28 + v34 + v43 * v35, v57, v38);
  }
  if (a10)
  {
    if (qword_1E94143A0 != -1) {
      swift_once();
    }
    sub_19C9761E0();
    unint64_t v45 = *(void *)(v28 + 16);
    unint64_t v44 = *(void *)(v28 + 24);
    if (v45 >= v44 >> 1) {
      unint64_t v28 = sub_19C949C7C(v44 > 1, v45 + 1, 1, v28);
    }
    *(void *)(v28 + 16) = v45 + 1;
    v31(v28 + v34 + v45 * v35, v58, v38);
  }
  sub_19C9762C0();
  sub_19C9768B0();
  sub_19C9762A0();
  uint64_t v46 = sub_19C9768B0();
  MEMORY[0x19F39CE20](v46);
  sub_19C976240();
  sub_19C976260();
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v13, v54);
}

uint64_t UserGuide.text.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_text);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_19C948554()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UserGuide.symbol.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_symbol);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserGuide.gradientColorStrings.getter()
{
  return swift_bridgeObjectRetain();
}

void *UserGuide.gradient.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___TPSUserGuide_gradient);
  id v2 = v1;
  return v1;
}

uint64_t UserGuide.platform.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_platform);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserGuide.referrer.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuide_referrer);
}

uint64_t UserGuide.referrer.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSUserGuide_referrer);
}

uint64_t (*UserGuide.referrer.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t UserGuide.version.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSUserGuide_version);
}

uint64_t (*UserGuide.version.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_19C948A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + OBJC_IVAR___TPSUserGuide__topicIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a2;
  v5[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*UserGuide.topicIdentifier.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR___TPSUserGuide___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_19C939EDC();
  sub_19C9765E0();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_19C976600();
  swift_release();
  swift_beginAccess();
  return sub_19C948BB0;
}

void sub_19C948BB0(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_19C9765F0();
  swift_release();
  free(v1);
}

id UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v19 = &v12[OBJC_IVAR___TPSUserGuide_referrer];
  *(void *)uint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v12[OBJC_IVAR___TPSUserGuide_version];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  uint64_t v21 = &v12[OBJC_IVAR___TPSUserGuide__topicIdentifier];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  uint64_t v22 = v12;
  sub_19C976610();
  id v23 = &v22[OBJC_IVAR___TPSUserGuide_identifier];
  *(void *)id v23 = a1;
  *((void *)v23 + 1) = a2;
  swift_beginAccess();
  *(void *)uint64_t v20 = a3;
  *((void *)v20 + 1) = a4;
  swift_bridgeObjectRelease();
  if (a6) {
    uint64_t v24 = a5;
  }
  else {
    uint64_t v24 = 0;
  }
  unint64_t v25 = 0xE000000000000000;
  if (a6) {
    unint64_t v25 = a6;
  }
  id v26 = &v22[OBJC_IVAR___TPSUserGuide_text];
  *(void *)id v26 = v24;
  *((void *)v26 + 1) = v25;
  uint64_t v27 = &v22[OBJC_IVAR___TPSUserGuide_symbol];
  *(void *)uint64_t v27 = a7;
  *((void *)v27 + 1) = a8;
  unint64_t v28 = &v22[OBJC_IVAR___TPSUserGuide_platform];
  *(void *)unint64_t v28 = a9;
  *((void *)v28 + 1) = a10;
  v22[OBJC_IVAR___TPSUserGuide_platformIndependent] = a11;
  *(void *)&v22[OBJC_IVAR___TPSUserGuide_gradientColorStrings] = a12;
  id v29 = objc_allocWithZone((Class)TPSGradient);
  swift_bridgeObjectRetain();
  unint64_t v30 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v29, sel_initWithColorStrings_, v30);

  *(void *)&v22[OBJC_IVAR___TPSUserGuide_gradient] = v31;
  v36.receiver = v22;
  v36.super_class = ObjectType;
  return objc_msgSendSuper2(&v36, sel_init);
}

uint64_t UserGuide.displayName.getter()
{
  uint64_t v1 = sub_19C9765C0();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v2 = sub_19C976870();
  MEMORY[0x1F4188790](v2 - 8);
  sub_19C976860();
  id v3 = objc_msgSend(self, sel_tipsCoreFrameworkBundle);
  sub_19C9765B0();
  sub_19C9768D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19C980A20;
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_text);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___TPSUserGuide_text + 8);
  *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v4 + 64) = sub_19C94A798();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v5;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_19C976890();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

id sub_19C949130(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t UserGuide.description.getter()
{
  uint64_t v1 = v0;
  strcpy((char *)v9, "(identifier:");
  BYTE5(v9[1]) = 0;
  HIWORD(v9[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  uint64_t v10 = v9[0];
  uint64_t v11 = v9[1];
  uint64_t v2 = v0 + OBJC_IVAR___TPSUserGuide_version;
  swift_beginAccess();
  if (*(void *)(v2 + 8))
  {
    swift_bridgeObjectRetain();
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  uint64_t v8 = v1;
  sub_19C939EDC();
  sub_19C9765E0();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR___TPSUserGuide__topicIdentifier;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    sub_19C976E10();
    swift_bridgeObjectRelease();
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + OBJC_IVAR___TPSUserGuide_platform + 8))
  {
    sub_19C976920();
    sub_19C976920();
    swift_bridgeObjectRelease();
  }
  sub_19C976E10();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_bridgeObjectRelease();
  id v4 = *(void **)(v1 + OBJC_IVAR___TPSUserGuide_gradient);
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v5, sel_description, 0x656964617267202CLL, 0xEB000000003A746ELL, v8);
    sub_19C9768B0();

    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();

    swift_bridgeObjectRelease();
  }
  return v10;
}

id UserGuide.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void UserGuide.init()()
{
}

id UserGuide.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id UserGuide.copy(with:)@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_identifier + 8);
  uint64_t v19 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_identifier);
  id v5 = (uint64_t *)(v1 + OBJC_IVAR___TPSUserGuide_version);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  unint64_t v8 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_text + 8);
  uint64_t v17 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_text);
  uint64_t v18 = v6;
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_symbol);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___TPSUserGuide_symbol + 8);
  uint64_t v16 = v9;
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR___TPSUserGuide_platform);
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR___TPSUserGuide_platform + 8);
  char v13 = *(unsigned char *)(v2 + OBJC_IVAR___TPSUserGuide_platformIndependent);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR___TPSUserGuide_gradientColorStrings);
  objc_allocWithZone(ObjectType);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id result = UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v19, v4, v18, v7, v17, v8, v16, v10, v11, v12, v13, v14);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t static UserGuide.supportsSecureCoding.getter()
{
  return 1;
}

id UserGuide.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t UserGuide.hash.getter()
{
  return sub_19C976990();
}

uint64_t UserGuide.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_19C8F5A78(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_19C8E00AC((uint64_t)v7, &qword_1EB516E30);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v4 = 0;
    return v4 & 1;
  }
  if (*(void *)(v1 + OBJC_IVAR___TPSUserGuide_identifier) == *(void *)&v6[OBJC_IVAR___TPSUserGuide_identifier]
    && *(void *)(v1 + OBJC_IVAR___TPSUserGuide_identifier + 8) == *(void *)&v6[OBJC_IVAR___TPSUserGuide_identifier
                                                                                 + 8])
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_19C976FB0();
  }
  return v4 & 1;
}

void *sub_19C949B6C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      char v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_19C94A840(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_19C949C7C(char a1, int64_t a2, char a3, unint64_t a4)
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
    char v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9413C90);
  uint64_t v10 = *(void *)(sub_19C976210() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_19C976E80();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_19C976210() - 8);
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
    sub_19C94A934(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *_s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0()
{
  uint64_t v0 = sub_19C976210();
  uint64_t v60 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v2 = (char *)v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145C8);
  MEMORY[0x1F4188790]();
  char v4 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19C9762D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976250();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_19C8E00AC((uint64_t)v4, &qword_1E94145C8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  uint64_t v9 = sub_19C976290();
  uint64_t v11 = v10;
  uint64_t v12 = sub_19C9768B0();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  if (v9 == v12 && v11 == v13)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_19C976FB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_51;
    }
  }
  uint64_t v16 = sub_19C976230();
  if (!v16)
  {
LABEL_51:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  uint64_t v51 = v8;
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    swift_bridgeObjectRelease();
    uint64_t v38 = 0;
    uint64_t v37 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v40 = 0;
    uint64_t v39 = 0;
    uint64_t v57 = 0;
LABEL_58:
    id v41 = objc_msgSend(self, sel_deviceGuideIdentifier);
    uint64_t v18 = sub_19C9768B0();
    uint64_t v36 = v42;

    goto LABEL_59;
  }
  uint64_t v47 = v6;
  uint64_t v48 = v5;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v52 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v18 = 0;
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v19 = *(unsigned __int8 *)(v60 + 80);
  v46[1] = v16;
  uint64_t v20 = v16 + ((v19 + 32) & ~v19);
  uint64_t v21 = *(void *)(v60 + 72);
  uint64_t v57 = 0;
  uint64_t v58 = v21;
  v60 += 16;
  uint64_t v61 = 0;
  uint64_t v22 = (void (**)(char *, uint64_t))(v60 - 8);
  do
  {
    uint64_t v23 = v18;
    v59(v2, v20, v0);
    uint64_t v24 = sub_19C976200();
    uint64_t v26 = v25;
    uint64_t v27 = sub_19C9761F0();
    uint64_t v29 = v28;
    if (qword_1E9414380 != -1) {
      swift_once();
    }
    BOOL v30 = qword_1E9414770 == v27 && *(void *)algn_1E9414778 == v29;
    if (v30 || (sub_19C976FB0() & 1) != 0)
    {
      (*v22)(v2, v0);
      swift_bridgeObjectRelease();
      uint64_t v18 = v24;
      uint64_t v61 = v26;
    }
    else
    {
      if (qword_1E9414388 != -1) {
        swift_once();
      }
      if (qword_1E9414780 == v27 && *(void *)algn_1E9414788 == v29 || (sub_19C976FB0() & 1) != 0)
      {
        (*v22)(v2, v0);
        swift_bridgeObjectRelease();
        uint64_t v56 = v24;
        uint64_t v57 = v26;
      }
      else
      {
        if (qword_1E9414390 != -1) {
          swift_once();
        }
        if (qword_1E9414790 == v27 && *(void *)algn_1E9414798 == v29 || (sub_19C976FB0() & 1) != 0)
        {
          (*v22)(v2, v0);
          swift_bridgeObjectRelease();
          uint64_t v52 = v24;
          uint64_t v55 = v26;
        }
        else
        {
          if (qword_1E9414398 != -1) {
            swift_once();
          }
          if (qword_1E94147A0 == v27 && *(void *)algn_1E94147A8 == v29 || (sub_19C976FB0() & 1) != 0)
          {
            (*v22)(v2, v0);
            swift_bridgeObjectRelease();
            uint64_t v53 = v24;
            uint64_t v54 = v26;
          }
          else
          {
            if (qword_1E94143A0 != -1) {
              swift_once();
            }
            if (qword_1E94147B0 == v27 && *(void *)algn_1E94147B8 == v29)
            {
              swift_bridgeObjectRelease();
              (*v22)(v2, v0);
              uint64_t v49 = v24;
              uint64_t v50 = v26;
            }
            else
            {
              char v31 = sub_19C976FB0();
              swift_bridgeObjectRelease();
              (*v22)(v2, v0);
              uint64_t v33 = v49;
              uint64_t v32 = v50;
              if (v31)
              {
                uint64_t v33 = v24;
                uint64_t v32 = v26;
              }
              uint64_t v49 = v33;
              uint64_t v50 = v32;
            }
          }
        }
      }
      uint64_t v18 = v23;
    }
    swift_bridgeObjectRelease();
    v20 += v58;
    --v17;
  }
  while (v17);
  swift_bridgeObjectRelease();
  uint64_t v36 = v61;
  if (!v61)
  {
    uint64_t v6 = v47;
    uint64_t v5 = v48;
    uint64_t v38 = v49;
    uint64_t v37 = v50;
    uint64_t v40 = v55;
    uint64_t v39 = (char *)v56;
    goto LABEL_58;
  }
  uint64_t v6 = v47;
  uint64_t v5 = v48;
  uint64_t v38 = v49;
  uint64_t v37 = v50;
  uint64_t v40 = v55;
  uint64_t v39 = (char *)v56;
LABEL_59:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_19C9809B0;
  *(void *)(v43 + 32) = 0x6C426D6574737973;
  *(void *)(v43 + 40) = 0xEF726F6C6F436575;
  *(void *)(v43 + 48) = 0xD000000000000011;
  *(void *)(v43 + 56) = 0x800000019C986190;
  id v44 = objc_allocWithZone((Class)type metadata accessor for UserGuide());
  unint64_t v34 = (char *)UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v18, v36, v53, v54, 0, 0, 0x6761702E6B6F6F62, 0xEA00000000007365, 0, 0, 0, v43);
  if (v57)
  {
    if (v40)
    {
      uint64_t v62 = v39;
      uint64_t v63 = v57;
      sub_19C976920();
      sub_19C976920();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  MEMORY[0x1F4188790]();
  uint64_t v62 = v34;
  sub_19C939EDC();
  sub_19C9765D0();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v51, v5);
  unint64_t v45 = &v34[OBJC_IVAR___TPSUserGuide_referrer];
  swift_beginAccess();
  *(void *)unint64_t v45 = v38;
  *((void *)v45 + 1) = v37;
  swift_bridgeObjectRelease();
  return v34;
}

unint64_t sub_19C94A798()
{
  unint64_t result = qword_1EB516A48;
  if (!qword_1EB516A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516A48);
  }
  return result;
}

uint64_t sub_19C94A7F4()
{
  return type metadata accessor for UserGuide();
}

uint64_t method lookup function for UserGuide(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UserGuide);
}

uint64_t dispatch thunk of UserGuide.__allocating_init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_19C94A840(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C94A934(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_19C976210() - 8);
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
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C94AA8C()
{
  return sub_19C93A444();
}

uint64_t sub_19C94AAA4()
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  if (*v1)
  {
    id v2 = *v1;
    id v3 = objc_msgSend(v2, sel_identifier);
    sub_19C9768B0();

    MEMORY[0x1F4188790](v4);
    sub_19C976BF0();
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x1F4188790](KeyPath);
    sub_19C9765D0();
  }
  else
  {
    uint64_t v6 = swift_getKeyPath();
    MEMORY[0x1F4188790](v6);
    sub_19C9765D0();
  }
  return swift_release();
}

uint64_t (*sub_19C94AD18(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_19C94AD78;
}

uint64_t sub_19C94AD78(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_19C94AAA4();
  }
  return result;
}

void *sub_19C94AE88()
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_19C94B040(void *a1)
{
}

id sub_19C94B110@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (void **)(v3 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  unint64_t v5 = *v4;
  *a2 = *v4;
  return v5;
}

void sub_19C94B1EC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  id v2 = v1;
  sub_19C9765D0();
  swift_release();
}

uint64_t type metadata accessor for TPSSavedTipsManager()
{
  uint64_t result = qword_1E9413BD8;
  if (!qword_1E9413BD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_19C94B318(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)(a1 + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a2;
  id v5 = a2;

  sub_19C94AAA4();
}

void sub_19C94B3A0()
{
  sub_19C94B318(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void (*sub_19C94B3BC(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  *uint64_t v3 = v1;
  void v3[6] = sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_19C976600();
  swift_release();
  v3[7] = sub_19C94AD18((uint64_t)v3);
  return sub_19C94B4D8;
}

void sub_19C94B4D8(void *a1)
{
}

uint64_t (*sub_19C94B4E4())()
{
  return j__swift_endAccess;
}

uint64_t sub_19C94B614()
{
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_19C94B7BC()
{
  return swift_release();
}

uint64_t sub_19C94B88C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  uint64_t v4 = (unsigned char *)(v3 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  uint64_t result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_19C94B958()
{
  return swift_release();
}

uint64_t sub_19C94BA2C()
{
  return sub_19C951B34();
}

void (*sub_19C94BA44(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  *uint64_t v3 = v1;
  void v3[6] = sub_19C94BFB4(&qword_1E9414870, (void (*)(uint64_t))type metadata accessor for TPSSavedTipsManager);
  sub_19C9765E0();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_19C976600();
  swift_release();
  v3[7] = sub_19C94B4E4();
  return sub_19C94BB60;
}

void sub_19C94BB60(void *a1)
{
}

void sub_19C94BB6C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_19C9765F0();
  swift_release();
  free(v1);
}

id sub_19C94BBF8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSSavedTipsManager()), sel_init);
  qword_1EB516C28 = (uint64_t)result;
  return result;
}

id TPSSavedTipsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static TPSSavedTipsManager.sharedInstance.getter()
{
  if (qword_1EB516C38 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB516C28;
  return v0;
}

void sub_19C94BCBC()
{
  qword_1EB516B98 = 0x6465766153535054;
  unk_1EB516BA0 = 0xEF70614D73706954;
}

id TPSSavedTipsManager.init()()
{
  uint64_t v1 = sub_19C976BC0();
  MEMORY[0x1F4188790](v1);
  uint64_t v2 = sub_19C976750();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_19C976BE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR___TPSSavedTipsManager__currentTip] = 0;
  v0[OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved] = 0;
  uint64_t v7 = OBJC_IVAR___TPSSavedTipsManager_savedTipsMap;
  uint64_t v8 = v0;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v0[v7] = sub_19C9357EC(MEMORY[0x1E4FBC860]);
  uint64_t v13 = OBJC_IVAR___TPSSavedTipsManager_queue;
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C78);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  sub_19C976730();
  uint64_t v15 = v9;
  sub_19C94BFB4((unint64_t *)&qword_1EB516C70, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
  sub_19C94BFFC();
  sub_19C976D30();
  *(void *)&v8[v13] = sub_19C976C10();
  sub_19C976610();

  uint64_t v10 = (objc_class *)type metadata accessor for TPSSavedTipsManager();
  v14.receiver = v8;
  v14.super_class = v10;
  id v11 = objc_msgSendSuper2(&v14, sel_init);
  sub_19C94E838();

  return v11;
}

uint64_t sub_19C94BFB4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_19C94BFFC()
{
  unint64_t result = qword_1EB516C60;
  if (!qword_1EB516C60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB516C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516C60);
  }
  return result;
}

uint64_t sub_19C94C07C()
{
  sub_19C976BF0();
  return v1;
}

uint64_t sub_19C94C0F0@<X0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  uint64_t result = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_19C9515F4(v10, a1, (uint64_t)a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_19C94C330(v11);
    uint64_t v13 = v12;
    a2 = v14;
    swift_release();
    if (v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = &a2[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      uint64_t v16 = sub_19C976560();
      uint64_t v17 = *(void *)(v16 - 8);
      (*(void (**)(unsigned char *, char *, uint64_t))(v17 + 16))(v9, v15, v16);

      LOBYTE(a2) = 1;
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16) != 1) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v18 = sub_19C976560();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
    }
    LOBYTE(a2) = 0;
LABEL_7:
    uint64_t result = sub_19C93DCC8((uint64_t)v9);
  }
  *a3 = (_BYTE)a2;
  return result;
}

void *sub_19C94C330(uint64_t a1)
{
  uint64_t result = (void *)sub_19C9512F4(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_19C95137C(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_19C94C490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_19C95C684(a2, a3);
    if (v10)
    {
      uint64_t v11 = (char *)*(id *)(*(void *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = &v11[OBJC_IVAR___TPSSavedTipEntry_savedDate];
      swift_beginAccess();
      uint64_t v13 = sub_19C976560();
      uint64_t v14 = *(void *)(v13 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(a4, v12, v13);

      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a4, 0, 1, v13);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = sub_19C976560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a4, 1, 1, v16);
}

uint64_t sub_19C94C638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = *(NSObject **)&v4[OBJC_IVAR___TPSSavedTipsManager_queue];
  char v10 = (void *)swift_allocObject();
  id v10[2] = v4;
  v10[3] = a1;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_19C94EB1C;
  *(void *)(v11 + 24) = v10;
  v16[4] = sub_19C94EB3C;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_19C94CBA8;
  v16[3] = &block_descriptor_2;
  uint64_t v12 = _Block_copy(v16);
  uint64_t v13 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_19C94C7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_19C976560();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  if (!*(void *)(*v14 + 16)
    || (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_19C95C684(a2, a3),
        char v16 = v15,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v16 & 1) == 0))
  {
    uint64_t v36 = a5;
    sub_19C976550();
    id v18 = objc_msgSend(self, sel_sharedInstance);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = a4;
      uint64_t v35 = a2;
      id v21 = objc_msgSend(v18, sel_majorVersion);

      if (v21)
      {
        uint64_t v22 = sub_19C9768B0();
        uint64_t v24 = v23;

        uint64_t v25 = (objc_class *)type metadata accessor for TPSSavedTipEntry();
        uint64_t v26 = (char *)objc_allocWithZone(v25);
        uint64_t v27 = &v26[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
        *(void *)uint64_t v27 = v20;
        *((void *)v27 + 1) = v36;
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v26[OBJC_IVAR___TPSSavedTipEntry_savedDate], v13, v10);
        uint64_t v28 = (uint64_t *)&v26[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
        *uint64_t v28 = v22;
        v28[1] = v24;
        v38.receiver = v26;
        v38.super_class = v25;
        swift_bridgeObjectRetain();
        id v29 = objc_msgSendSuper2(&v38, sel_init);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        id v17 = v29;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v37 = *v14;
        *uint64_t v14 = 0x8000000000000000;
        sub_19C936638((uint64_t)v17, v35, a3, isUniquelyReferenced_nonNull_native);
        *uint64_t v14 = v37;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        goto LABEL_7;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v17 = (id)sub_19C95C84C(a2, a3);
  swift_endAccess();
  swift_bridgeObjectRelease();
LABEL_7:

  char v31 = self;
  type metadata accessor for TPSSavedTipEntry();
  swift_bridgeObjectRetain();
  uint64_t v32 = (void *)sub_19C9767E0();
  swift_bridgeObjectRelease();
  if (qword_1EB516BB0 != -1) {
    swift_once();
  }
  uint64_t v33 = (void *)sub_19C976880();
  objc_msgSend(v31, sel_archivedDataWithRootObject_forKey_, v32, v33);
}

uint64_t sub_19C94CB80(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_19C94CBA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_19C94CC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v13 - 8);
  char v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_queue_t v30 = *(dispatch_queue_t *)&v7[OBJC_IVAR___TPSSavedTipsManager_queue];
  sub_19C93C410(a5, (uint64_t)v16);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v18 = (v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v7;
  v19[3] = a1;
  v19[4] = a2;
  sub_19C94ECC8((uint64_t)v16, (uint64_t)v19 + v17);
  uint64_t v20 = (void *)((char *)v19 + v18);
  *uint64_t v20 = a3;
  v20[1] = a4;
  id v21 = (void *)((char *)v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v22 = v29;
  void *v21 = v28;
  v21[1] = v22;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_19C94ED30;
  *(void *)(v23 + 24) = v19;
  aBlock[4] = sub_19C951BAC;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C94CBA8;
  aBlock[3] = &block_descriptor_17;
  uint64_t v24 = _Block_copy(aBlock);
  uint64_t v25 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v30, v24);
  _Block_release(v24);
  LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v24) {
    __break(1u);
  }
  return result;
}

void sub_19C94CEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), void (*a6)(void, void, void), uint64_t a7, uint64_t a8)
{
  uint64_t v90 = a8;
  uint64_t v89 = a7;
  uint64_t v85 = a6;
  uint64_t v84 = a5;
  uint64_t v95 = a3;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v87 = (uint64_t)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  char v88 = (char *)&v80 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v91 = (uint64_t)&v80 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v86 = (uint64_t)&v80 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v80 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v80 - v23;
  uint64_t v25 = sub_19C976560();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v83 = (char *)&v80 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v92 = (char *)&v80 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  uint64_t v33 = (char *)&v80 - v32;
  MEMORY[0x1F4188790](v31);
  uint64_t v35 = (char *)&v80 - v34;
  uint64_t v36 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  uint64_t v93 = v36;
  uint64_t v94 = a2;
  uint64_t v37 = *v36;
  if (*(void *)(v37 + 16))
  {
    uint64_t v38 = v95;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_19C95C684(a2, v38);
    if (v40)
    {
      id v41 = *(char **)(*(void *)(v37 + 56) + 8 * v39);
      uint64_t v42 = v41;
    }
    else
    {
      id v41 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v41 = 0;
  }
  sub_19C93C410(a4, (uint64_t)v24);
  uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v43(v24, 1, v25) == 1)
  {
    sub_19C93DCC8((uint64_t)v24);
    id v44 = v41;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v35, v24, v25);
    if (!v41)
    {
      uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
      v56(v33, v35, v25);
      uint64_t v57 = (objc_class *)type metadata accessor for TPSSavedTipEntry();
      uint64_t v58 = (char *)objc_allocWithZone(v57);
      uint64_t v59 = &v58[OBJC_IVAR___TPSSavedTipEntry_tipIdentifier];
      uint64_t v60 = v85;
      *(void *)uint64_t v59 = v84;
      *((void *)v59 + 1) = v60;
      v56(&v58[OBJC_IVAR___TPSSavedTipEntry_savedDate], v33, v25);
      uint64_t v61 = &v58[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
      uint64_t v62 = v90;
      *(void *)uint64_t v61 = v89;
      *((void *)v61 + 1) = v62;
      v96.receiver = v58;
      v96.super_class = v57;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v44 = (char *)objc_msgSendSuper2(&v96, sel_init);
      uint64_t v63 = *(void (**)(char *, uint64_t))(v26 + 8);
      v63(v33, v25);
      v63(v35, v25);
      uint64_t v64 = v93;
      swift_beginAccess();
      uint64_t v65 = v94;
      if (!v44) {
        goto LABEL_24;
      }
LABEL_26:
      uint64_t v74 = v95;
      swift_bridgeObjectRetain();
      uint64_t v75 = v44;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v97 = *v64;
      *uint64_t v64 = 0x8000000000000000;
      sub_19C936638((uint64_t)v75, v65, v74, isUniquelyReferenced_nonNull_native);
      *uint64_t v64 = v97;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    id v44 = v41;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v35, v25);
  }
  sub_19C93C410(a4, (uint64_t)v22);
  if (v43(v22, 1, v25) == 1)
  {
    sub_19C93DCC8((uint64_t)v22);
    if (!v44) {
      return;
    }
    goto LABEL_23;
  }
  unint64_t v45 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v46 = v92;
  v45(v92, v22, v25);
  if (!v44)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v46, v25);
    return;
  }
  uint64_t v82 = v26 + 32;
  uint64_t v84 = (void (*)(uint64_t, uint64_t, uint64_t))v45;
  uint64_t v47 = v44;
  uint64_t v85 = *(void (**)(void, void, void))(v26 + 16);
  uint64_t v48 = v91;
  v85(v91, v46, v25);
  uint64_t v49 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56);
  v49(v48, 0, 1, v25);
  uint64_t v81 = v47;
  uint64_t v50 = &v47[OBJC_IVAR___TPSSavedTipEntry_savedDate];
  swift_beginAccess();
  uint64_t v51 = (uint64_t)v88;
  uint64_t v80 = v50;
  v85(v88, v50, v25);
  uint64_t v85 = (void (*)(void, void, void))v49;
  v49(v51, 0, 1, v25);
  uint64_t v52 = v87;
  sub_19C93C410(v48, v87);
  if (v43((char *)v52, 1, v25) == 1)
  {
    uint64_t v53 = v81;
    uint64_t v54 = v81;
    sub_19C93DCC8(v52);
    uint64_t v55 = v86;
    sub_19C93C410(v51, v86);
    id v44 = v53;
  }
  else
  {
    uint64_t v55 = v86;
    v84(v86, v52, v25);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v85)(v55, 0, 1, v25);
    id v44 = v81;
    uint64_t v66 = v81;
  }
  sub_19C93DCC8(v51);
  sub_19C93DCC8(v91);
  uint64_t v67 = *(void (**)(char *, uint64_t))(v26 + 8);
  v67(v92, v25);
  if (v43((char *)v55, 1, v25) != 1)
  {
    long long v70 = v83;
    v84((uint64_t)v83, v55, v25);
    uint64_t v71 = v80;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v71, v70, v25);
    swift_endAccess();
    v67(v70, v25);
    unint64_t v72 = &v44[OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion];
    swift_beginAccess();
    uint64_t v73 = v90;
    *(void *)unint64_t v72 = v89;
    *((void *)v72 + 1) = v73;
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    uint64_t v64 = v93;
    swift_beginAccess();
    uint64_t v65 = v94;
    goto LABEL_26;
  }

  sub_19C93DCC8(v55);
LABEL_23:
  uint64_t v65 = v94;

  swift_beginAccess();
LABEL_24:
  uint64_t v68 = v95;
  swift_bridgeObjectRetain();
  uint64_t v69 = (void *)sub_19C95C84C(v65, v68);
  swift_bridgeObjectRelease();

  id v44 = 0;
LABEL_27:
  swift_endAccess();
  uint64_t v77 = self;
  type metadata accessor for TPSSavedTipEntry();
  swift_bridgeObjectRetain();
  uint64_t v78 = (void *)sub_19C9767E0();
  swift_bridgeObjectRelease();
  if (qword_1EB516BB0 != -1) {
    swift_once();
  }
  uint64_t v79 = (void *)sub_19C976880();
  objc_msgSend(v77, sel_archivedDataWithRootObject_forKey_, v78, v79);
}

uint64_t sub_19C94D9A8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
  sub_19C976BF0();
  return v1;
}

uint64_t sub_19C94DA20@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v4 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_19C9682B0(v5);
  swift_bridgeObjectRelease();
  uint64_t v19 = v6;
  sub_19C94F5A4(&v19);
  if (v2)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v19;
    int64_t v8 = v19[2];
    if (v8)
    {
      uint64_t v18 = a2;
      uint64_t v20 = MEMORY[0x1E4FBC860];
      sub_19C973914(0, v8, 0);
      uint64_t v9 = 6;
      uint64_t v10 = v20;
      do
      {
        uint64_t v11 = (uint64_t *)(v7[v9] + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
        swift_beginAccess();
        uint64_t v12 = *v11;
        uint64_t v13 = v11[1];
        uint64_t v20 = v10;
        unint64_t v14 = *(void *)(v10 + 16);
        unint64_t v15 = *(void *)(v10 + 24);
        swift_bridgeObjectRetain();
        if (v14 >= v15 >> 1)
        {
          sub_19C973914(v15 > 1, v14 + 1, 1);
          uint64_t v10 = v20;
        }
        *(void *)(v10 + 16) = v14 + 1;
        uint64_t v16 = v10 + 16 * v14;
        *(void *)(v16 + 32) = v12;
        *(void *)(v16 + 40) = v13;
        v9 += 3;
        --v8;
      }
      while (v8);
      uint64_t result = swift_release();
      a2 = v18;
    }
    else
    {
      uint64_t result = swift_release();
      uint64_t v10 = MEMORY[0x1E4FBC860];
    }
    *a2 = v10;
  }
  return result;
}

uint64_t sub_19C94DC70()
{
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR___TPSSavedTipsManager_queue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_19C94EE40;
  *(void *)(v3 + 24) = v2;
  v8[4] = sub_19C951BAC;
  v8[5] = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  void v8[2] = sub_19C94CBA8;
  v8[3] = &block_descriptor_27;
  char v4 = _Block_copy(v8);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_19C94DDC4(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  if (!v2)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_majorVersion);

  if (!v4)
  {
LABEL_104:
    __break(1u);
    return;
  }
  unint64_t v5 = 0;
  uint64_t v6 = sub_19C9768B0();
  unint64_t v8 = v7;

  uint64_t v9 = HIBYTE(v8) & 0xF;
  uint64_t v10 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v8) & 0xF;
  }
  else {
    uint64_t v11 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    if ((v8 & 0x1000000000000000) != 0)
    {
      unint64_t v63 = 0;
      uint64_t v13 = (uint64_t)sub_19C950A9C(v6, v8, 10);
      LOBYTE(v6) = v60;
LABEL_37:
      swift_bridgeObjectRelease();
      char v19 = v6 & 1;
      if (v6) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v13;
      }
      goto LABEL_40;
    }
    if ((v8 & 0x2000000000000000) == 0)
    {
      if ((v6 & 0x1000000000000000) != 0) {
        uint64_t v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v12 = (unsigned __int8 *)sub_19C976E50();
      }
      uint64_t v13 = (uint64_t)sub_19C950B8C(v12, v10, 10);
      LOBYTE(v6) = v14 & 1;
      goto LABEL_36;
    }
    v69[0] = v6;
    v69[1] = v8 & 0xFFFFFFFFFFFFFFLL;
    if (v6 == 43)
    {
      if (v9)
      {
        if (v9 != 1 && (BYTE1(v6) - 48) <= 9u)
        {
          uint64_t v13 = (BYTE1(v6) - 48);
          if (v9 == 2) {
            goto LABEL_35;
          }
          if ((BYTE2(v6) - 48) <= 9u)
          {
            uint64_t v13 = 10 * (BYTE1(v6) - 48) + (BYTE2(v6) - 48);
            uint64_t v15 = v9 - 3;
            if (v15)
            {
              uint64_t v16 = (unsigned __int8 *)v69 + 3;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_33;
                }
                uint64_t v18 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v13 = v18 + v17;
                if (__OFADD__(v18, v17)) {
                  goto LABEL_33;
                }
                LOBYTE(v6) = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_36;
                }
              }
            }
            goto LABEL_35;
          }
        }
        goto LABEL_33;
      }
    }
    else
    {
      if (v6 != 45)
      {
        if (v9 && (v6 - 48) <= 9u)
        {
          uint64_t v13 = (v6 - 48);
          if (v9 == 1) {
            goto LABEL_35;
          }
          if ((BYTE1(v6) - 48) <= 9u)
          {
            uint64_t v13 = 10 * (v6 - 48) + (BYTE1(v6) - 48);
            uint64_t v52 = v9 - 2;
            if (v52)
            {
              uint64_t v53 = (unsigned __int8 *)v69 + 2;
              while (1)
              {
                unsigned int v54 = *v53 - 48;
                if (v54 > 9) {
                  goto LABEL_33;
                }
                uint64_t v55 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v13 = v55 + v54;
                if (__OFADD__(v55, v54)) {
                  goto LABEL_33;
                }
                LOBYTE(v6) = 0;
                ++v53;
                if (!--v52) {
                  goto LABEL_36;
                }
              }
            }
            goto LABEL_35;
          }
        }
LABEL_33:
        uint64_t v13 = 0;
        LOBYTE(v6) = 1;
        goto LABEL_36;
      }
      if (v9)
      {
        if (v9 != 1 && (BYTE1(v6) - 48) <= 9u)
        {
          if (v9 == 2)
          {
            LOBYTE(v6) = 0;
            uint64_t v13 = -(uint64_t)(BYTE1(v6) - 48);
LABEL_36:
            unint64_t v63 = 0;
            goto LABEL_37;
          }
          if ((BYTE2(v6) - 48) <= 9u)
          {
            uint64_t v13 = -10 * (BYTE1(v6) - 48) - (BYTE2(v6) - 48);
            uint64_t v56 = v9 - 3;
            if (v56)
            {
              uint64_t v57 = (unsigned __int8 *)v69 + 3;
              while (1)
              {
                unsigned int v58 = *v57 - 48;
                if (v58 > 9) {
                  goto LABEL_33;
                }
                uint64_t v59 = 10 * v13;
                if ((unsigned __int128)(v13 * (__int128)10) >> 64 != (10 * v13) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v13 = v59 - v58;
                if (__OFSUB__(v59, v58)) {
                  goto LABEL_33;
                }
                LOBYTE(v6) = 0;
                ++v57;
                if (!--v56) {
                  goto LABEL_36;
                }
              }
            }
LABEL_35:
            LOBYTE(v6) = 0;
            goto LABEL_36;
          }
        }
        goto LABEL_33;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_103;
  }
LABEL_98:
  unint64_t v63 = v5;
  swift_bridgeObjectRelease();
  uint64_t v20 = 0;
  char v19 = 1;
LABEL_40:
  uint64_t v64 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v70 = MEMORY[0x1E4FBC860];
  uint64_t v21 = a1 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap;
  a1 = 1;
  swift_beginAccess();
  uint64_t v62 = (uint64_t *)v21;
  uint64_t v22 = *(void *)v21;
  uint64_t v23 = *(void *)(*(void *)v21 + 64);
  uint64_t v67 = *(void *)v21 + 64;
  uint64_t v24 = 1 << *(unsigned char *)(v22 + 32);
  uint64_t v25 = -1;
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  unint64_t v5 = v25 & v23;
  int64_t v68 = (unint64_t)(v24 + 63) >> 6;
  uint64_t v65 = v20 - 2;
  BOOL v26 = __OFSUB__(v20, 2);
  BOOL v66 = v26;
  swift_bridgeObjectRetain();
  int64_t v27 = 0;
  while (1)
  {
    while (v5)
    {
      unint64_t v28 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v29 = v28 | (v27 << 6);
      if ((v19 & 1) == 0)
      {
LABEL_61:
        uint64_t v33 = (uint64_t *)(*(void *)(v22 + 48) + 16 * v29);
        uint64_t v35 = *v33;
        uint64_t v34 = v33[1];
        a1 = *(void *)(*(void *)(v22 + 56) + 8 * v29);
        uint64_t v36 = (uint64_t *)(a1 + OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
        swift_beginAccess();
        uint64_t v37 = *v36;
        unint64_t v38 = v36[1];
        swift_bridgeObjectRetain();
        id v39 = (id)a1;
        swift_bridgeObjectRetain();
        uint64_t v40 = sub_19C94E4D0(v37, v38);
        if (v41) {
          goto LABEL_46;
        }
        if (v66) {
          goto LABEL_96;
        }
        if (v65 < v40)
        {
LABEL_46:

          swift_bridgeObjectRelease();
        }
        else
        {
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v42 = v64;
          }
          else {
            uint64_t v42 = sub_19C949B6C(0, v64[2] + 1, 1, v64);
          }
          unint64_t v44 = v42[2];
          unint64_t v43 = v42[3];
          if (v44 >= v43 >> 1) {
            uint64_t v42 = sub_19C949B6C((void *)(v43 > 1), v44 + 1, 1, v42);
          }
          v42[2] = v44 + 1;
          unint64_t v45 = &v42[2 * v44];
          v45[4] = v35;
          v45[5] = v34;
          a1 = (uint64_t)v42;

          uint64_t v64 = (void *)a1;
          uint64_t v70 = a1;
        }
      }
    }
    if (__OFADD__(v27++, 1))
    {
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
      goto LABEL_98;
    }
    if (v27 >= v68) {
      goto LABEL_74;
    }
    unint64_t v31 = *(void *)(v67 + 8 * v27);
    if (!v31) {
      break;
    }
LABEL_60:
    unint64_t v5 = (v31 - 1) & v31;
    unint64_t v29 = __clz(__rbit64(v31)) + (v27 << 6);
    if ((v19 & 1) == 0) {
      goto LABEL_61;
    }
  }
  int64_t v32 = v27 + 1;
  if (v27 + 1 >= v68) {
    goto LABEL_74;
  }
  unint64_t v31 = *(void *)(v67 + 8 * v32);
  if (v31) {
    goto LABEL_59;
  }
  int64_t v32 = v27 + 2;
  if (v27 + 2 >= v68) {
    goto LABEL_74;
  }
  unint64_t v31 = *(void *)(v67 + 8 * v32);
  if (v31)
  {
LABEL_59:
    int64_t v27 = v32;
    goto LABEL_60;
  }
  int64_t v32 = v27 + 3;
  if (v27 + 3 < v68)
  {
    unint64_t v31 = *(void *)(v67 + 8 * v32);
    if (!v31)
    {
      while (1)
      {
        int64_t v27 = v32 + 1;
        if (__OFADD__(v32, 1)) {
          goto LABEL_97;
        }
        if (v27 >= v68) {
          goto LABEL_74;
        }
        unint64_t v31 = *(void *)(v67 + 8 * v27);
        ++v32;
        if (v31) {
          goto LABEL_60;
        }
      }
    }
    goto LABEL_59;
  }
LABEL_74:
  swift_release();
  if (v64[2])
  {
    uint64_t v46 = v62;
    MEMORY[0x1F4188790](v64);
    v61[2] = &v70;
    uint64_t v47 = swift_bridgeObjectRetain();
    uint64_t v48 = sub_19C9519BC(v47, (uint64_t (*)(uint64_t, uint64_t, id))sub_19C950B84, (uint64_t)v61);
    swift_bridgeObjectRelease();
    *uint64_t v46 = v48;
    swift_bridgeObjectRelease();
    uint64_t v49 = self;
    type metadata accessor for TPSSavedTipEntry();
    swift_bridgeObjectRetain();
    uint64_t v50 = (void *)sub_19C9767E0();
    swift_bridgeObjectRelease();
    if (qword_1EB516BB0 != -1) {
      swift_once();
    }
    uint64_t v51 = (void *)sub_19C976880();
    objc_msgSend(v49, sel_archivedDataWithRootObject_forKey_, v50, v51);
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_19C94E4D0(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_19C976E50();
      }
      uint64_t v7 = (uint64_t)sub_19C950B8C(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        char v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_19C950A9C(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_19C94E720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)a4;
  uint64_t v5 = *(void *)(*(void *)a4 + 16);
  if (!v5) {
    return 1;
  }
  if (v4[4] == a1 && v4[5] == a2) {
    return 0;
  }
  char v9 = sub_19C976FB0();
  uint64_t result = 0;
  if ((v9 & 1) == 0)
  {
    if (v5 == 1) {
      return 1;
    }
    uint64_t v11 = v4 + 7;
    for (uint64_t i = 1; ; ++i)
    {
      uint64_t v13 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      BOOL v14 = *(v11 - 1) == a1 && *v11 == a2;
      if (v14 || (sub_19C976FB0() & 1) != 0) {
        return 0;
      }
      v11 += 2;
      uint64_t result = 1;
      if (v13 == v5) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_19C94E838()
{
  sub_19C96DF9C();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19C980A30;
  *(void *)(inited + 32) = sub_19C8DFBA0(0, &qword_1EB516C68);
  *(void *)(inited + 40) = sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  *(void *)(inited + 48) = type metadata accessor for TPSSavedTipEntry();
  sub_19C936CB8(inited);
  swift_setDeallocating();
  id v2 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithArray_, v3);

  sub_19C976B30();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_19C976B20();
  swift_bridgeObjectRelease();
  if (qword_1EB516BB0 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)sub_19C976880();
  id v8 = objc_msgSend(v5, sel_unarchivedObjectOfClasses_forKey_, v6, v7);

  sub_19C976D10();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C50);
  if (swift_dynamicCast()) {
    unint64_t v9 = v12;
  }
  else {
    unint64_t v9 = sub_19C9357EC(MEMORY[0x1E4FBC860]);
  }
  uint64_t v10 = (unint64_t *)(v0 + OBJC_IVAR___TPSSavedTipsManager_savedTipsMap);
  swift_beginAccess();
  *uint64_t v10 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_19C94EA94@<X0>(unsigned char *a1@<X8>)
{
  return sub_19C94C0F0(*(void *)(v1 + 16), *(char **)(v1 + 24), a1);
}

uint64_t sub_19C94EAB4@<X0>(uint64_t a1@<X8>)
{
  return sub_19C94C490(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_19C94EAD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_19C94EB1C()
{
  sub_19C94C7BC(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_19C94EB2C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C94EB3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_19C94EB64()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  swift_bridgeObjectRelease();
  uint64_t v5 = sub_19C976560();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_19C94ECC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_19C94ED30()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = (uint64_t)v0 + v2;
  id v8 = *(void (**)(uint64_t, uint64_t, uint64_t))((char *)v0 + v3);
  unint64_t v9 = *(void (**)(void, void, void))((char *)v0 + v3 + 8);
  uint64_t v10 = (void *)((char *)v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  sub_19C94CEC0(v4, v5, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_19C94EDDC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C94EDEC@<X0>(void *a1@<X8>)
{
  return sub_19C94DA20(*(void *)(v1 + 16), a1);
}

uint64_t sub_19C94EE08()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_19C94EE40()
{
  sub_19C94DDC4(*(void *)(v0 + 16));
}

uint64_t sub_19C94EE48()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id TPSSavedTipsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSSavedTipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19C94EF30()
{
  return type metadata accessor for TPSSavedTipsManager();
}

uint64_t sub_19C94EF38()
{
  uint64_t result = sub_19C976620();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TPSSavedTipsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSSavedTipsManager);
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.currentTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isCurrentTipSaved.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.isSavedWithTipIdentifier(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.savedDate(correlationId:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.toggleSavedTip(correlationId:tipIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.updateSavedTips(correlationId:tipIdentifier:savedDate:lastUsedVersion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.identifiers()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPSSavedTipsManager.removeInvalidEntries()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

void *sub_19C94F2A0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414600);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19C94F308(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94144A0);
  uint64_t result = sub_19C976EE0();
  uint64_t v9 = result;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v34) {
        return v9;
      }
      unint64_t v16 = v33[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v34) {
          return v9;
        }
        unint64_t v16 = v33[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v34) {
            return v9;
          }
          unint64_t v16 = v33[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v34) {
              return v9;
            }
            unint64_t v16 = v33[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v34) {
                  return v9;
                }
                unint64_t v16 = v33[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = *(void **)(*(void *)(v4 + 56) + 8 * v14);
    sub_19C977090();
    swift_bridgeObjectRetain();
    id v22 = v21;
    sub_19C976910();
    uint64_t result = sub_19C9770C0();
    uint64_t v23 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    unint64_t v31 = (void *)(*(void *)(v9 + 48) + 16 * v26);
    *unint64_t v31 = v20;
    v31[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v26) = v22;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_19C94F5A4(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_19C96A6DC(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_19C94F610(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_19C94F610(uint64_t *a1)
{
  uint64_t v168 = sub_19C976560();
  uint64_t v3 = *(void *)(v168 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v168);
  v167 = (char *)&v149 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v166 = (char *)&v149 - v6;
  uint64_t v7 = a1[1];
  uint64_t result = sub_19C976F80();
  uint64_t v158 = v7;
  if (result >= v7)
  {
    if (v7 < 0) {
      goto LABEL_140;
    }
    if ((unint64_t)v7 >= 2)
    {
      uint64_t v161 = v1;
      unint64_t v13 = (void *)*a1;
      v164 = (void (**)(char *, char *, uint64_t))(v3 + 16);
      v163 = (void (**)(char *, uint64_t))(v3 + 8);
      v165 = v13;
      unint64_t v14 = (void (**)(char *, uint64_t))(v13 + 3);
      uint64_t v15 = -1;
      uint64_t v16 = 1;
      uint64_t v17 = v166;
      uint64_t v18 = v168;
      do
      {
        v159 = (char *)v16;
        uint64_t v19 = (void (*)(char *, uint64_t))v165[3 * v16 + 2];
        uint64_t v160 = v15;
        v169 = (char *)v15;
        v162 = v14;
        do
        {
          uint64_t v20 = (char *)*(v14 - 1);
          v172 = (void (*)(char *, char *, uint64_t))*(v14 - 2);
          id v170 = v20;
          uint64_t v21 = (char *)v19 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
          swift_beginAccess();
          id v22 = *v164;
          (*v164)(v17, v21, v18);
          uint64_t v23 = &v20[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          unint64_t v24 = v167;
          v22(v167, v23, v18);
          swift_bridgeObjectRetain();
          v171 = v19;
          swift_bridgeObjectRetain();
          id v170 = v170;
          uint64_t v25 = sub_19C976540();
          unint64_t v26 = *v163;
          (*v163)(v24, v18);
          v26(v17, v18);

          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v25 != 1) {
            break;
          }
          if (!v165) {
            goto LABEL_144;
          }
          char v27 = *v14;
          unint64_t v28 = v14[1];
          uint64_t v19 = v14[2];
          *(_OWORD *)unint64_t v14 = *(_OWORD *)(v14 - 3);
          void v14[2] = *(v14 - 1);
          *(v14 - 2) = v28;
          *(v14 - 1) = v19;
          *(v14 - 3) = v27;
          v14 -= 3;
        }
        while (!__CFADD__(v169++, 1));
        uint64_t v16 = (uint64_t)(v159 + 1);
        unint64_t v14 = v162 + 3;
        uint64_t v15 = v160 - 1;
      }
      while (v159 + 1 != (char *)v158);
    }
    return result;
  }
  if (v7 >= 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 + 1;
  }
  if (v7 < -1) {
    goto LABEL_149;
  }
  uint64_t v153 = result;
  uint64_t v161 = v1;
  v150 = a1;
  if (v7 < 2)
  {
    uint64_t v30 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v152 = MEMORY[0x1E4FBC860];
    if (v7 != 1)
    {
      unint64_t v33 = *(void *)(MEMORY[0x1E4FBC860] + 16);
      uint64_t v12 = (char *)(MEMORY[0x1E4FBC860] + 32);
LABEL_106:
      if (v33 >= 2)
      {
        uint64_t v141 = *v150;
        do
        {
          unint64_t v142 = v33 - 2;
          if (v33 < 2) {
            goto LABEL_135;
          }
          if (!v141) {
            goto LABEL_148;
          }
          v143 = v30;
          uint64_t v144 = *(void *)&v30[16 * v142 + 32];
          uint64_t v145 = *(void *)&v30[16 * v33 + 24];
          uint64_t v146 = v161;
          sub_19C950470((char *)(v141 + 24 * v144), (char *)(v141 + 24 * *(void *)&v30[16 * v33 + 16]), v141 + 24 * v145, v12);
          uint64_t v161 = v146;
          if (v146) {
            break;
          }
          if (v145 < v144) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v143 = sub_19C969C8C((uint64_t)v143);
          }
          if (v142 >= *((void *)v143 + 2)) {
            goto LABEL_137;
          }
          v147 = &v143[16 * v142 + 32];
          *(void *)v147 = v144;
          *((void *)v147 + 1) = v145;
          unint64_t v148 = *((void *)v143 + 2);
          if (v33 > v148) {
            goto LABEL_138;
          }
          memmove(&v143[16 * v33 + 16], &v143[16 * v33 + 32], 16 * (v148 - v33));
          uint64_t v30 = v143;
          *((void *)v143 + 2) = v148 - 1;
          unint64_t v33 = v148 - 1;
        }
        while (v148 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v152 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v12 = (char *)(MEMORY[0x1E4FBC860] + 32);
  }
  else
  {
    uint64_t v10 = v9 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C30);
    uint64_t v11 = sub_19C976A20();
    *(void *)(v11 + 16) = v10;
    uint64_t v152 = v11;
    uint64_t v12 = (char *)(v11 + 32);
  }
  uint64_t v31 = 0;
  int64_t v32 = (void (**)(char *, char *, uint64_t))*a1;
  v163 = (void (**)(char *, uint64_t))(v3 + 16);
  v162 = (void (**)(char *, uint64_t))(v3 + 8);
  v151 = (void (**)(void, void, void))(v32 + 8);
  uint64_t v30 = (char *)MEMORY[0x1E4FBC860];
  v164 = v32;
  v154 = v12;
  while (1)
  {
    uint64_t v34 = v31;
    uint64_t v35 = v31 + 1;
    v159 = (char *)v31;
    if (v31 + 1 < v7)
    {
      v155 = v30;
      uint64_t v36 = v32[3 * v35 + 2];
      uint64_t v37 = &v32[3 * v31];
      unint64_t v38 = v37[2];
      v172 = v37[1];
      id v39 = (char *)v36 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
      swift_beginAccess();
      uint64_t v40 = (char *)*v163;
      char v41 = v166;
      uint64_t v42 = v168;
      ((void (*)(char *, char *, uint64_t))*v163)(v166, v39, v168);
      unint64_t v43 = (char *)v38 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
      swift_beginAccess();
      unint64_t v44 = v167;
      v157 = v40;
      ((void (*)(char *, char *, uint64_t))v40)(v167, v43, v42);
      swift_bridgeObjectRetain();
      unint64_t v45 = v36;
      swift_bridgeObjectRetain();
      uint64_t v46 = v38;
      uint64_t v160 = sub_19C976540();
      uint64_t v47 = *v162;
      uint64_t v48 = v44;
      uint64_t v7 = v158;
      (*v162)(v48, v42);
      uint64_t v49 = v42;
      uint64_t v34 = (uint64_t)v159;
      v156 = v47;
      v47(v41, v49);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v35 = v34 + 2;
      if (v34 + 2 < v7)
      {
        uint64_t v50 = (void **)&v151[3 * v34];
        while (1)
        {
          v165 = (void *)v35;
          LODWORD(v172) = v160 == 1;
          uint64_t v51 = (char *)*v50;
          uint64_t v52 = (char *)*(v50 - 4);
          uint64_t v53 = (char *)*(v50 - 3);
          id v170 = *(v50 - 1);
          v171 = v52;
          unsigned int v54 = &v51[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          uint64_t v55 = v166;
          uint64_t v56 = v168;
          uint64_t v57 = v157;
          ((void (*)(char *, char *, uint64_t))v157)(v166, v54, v168);
          unsigned int v58 = &v53[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          uint64_t v59 = v167;
          ((void (*)(char *, char *, uint64_t))v57)(v167, v58, v56);
          swift_bridgeObjectRetain();
          v169 = v51;
          swift_bridgeObjectRetain();
          char v60 = v53;
          uint64_t v61 = sub_19C976540();
          uint64_t v62 = v156;
          v156(v59, v56);
          v62(v55, v56);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v172 == (v61 != 1)) {
            break;
          }
          uint64_t v35 = (uint64_t)v165 + 1;
          v50 += 3;
          uint64_t v7 = v158;
          if ((void *)v158 == (void *)((char *)v165 + 1))
          {
            uint64_t v35 = v158;
            goto LABEL_30;
          }
        }
        uint64_t v7 = v158;
        uint64_t v35 = (uint64_t)v165;
LABEL_30:
        uint64_t v34 = (uint64_t)v159;
      }
      uint64_t v12 = v154;
      uint64_t v30 = v155;
      int64_t v32 = v164;
      if (v160 == 1)
      {
        if (v35 < v34) {
          goto LABEL_141;
        }
        if (v34 < v35)
        {
          uint64_t v63 = 3 * v35;
          uint64_t v64 = 3 * v34;
          uint64_t v65 = v35;
          uint64_t v66 = v34;
          do
          {
            if (v66 != --v65)
            {
              if (!v32) {
                goto LABEL_147;
              }
              uint64_t v67 = &v32[v64];
              int64_t v68 = &v32[v63];
              uint64_t v69 = v32[v64];
              long long v70 = *(_OWORD *)&v32[v64 + 1];
              long long v71 = *(_OWORD *)&v32[v63 - 3];
              v67[2] = v32[v63 - 1];
              *(_OWORD *)uint64_t v67 = v71;
              *(v68 - 3) = v69;
              *((_OWORD *)v68 - 1) = v70;
            }
            ++v66;
            v63 -= 3;
            v64 += 3;
          }
          while (v66 < v65);
        }
      }
    }
    if (v35 < v7)
    {
      if (__OFSUB__(v35, v34)) {
        goto LABEL_139;
      }
      if (v35 - v34 < v153) {
        break;
      }
    }
LABEL_57:
    if (v35 < v34) {
      goto LABEL_134;
    }
    v165 = (void *)v35;
    uint64_t v87 = v30;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v30 = v87;
    }
    else {
      uint64_t v30 = sub_19C969A04(0, *((void *)v87 + 2) + 1, 1, v87);
    }
    unint64_t v89 = *((void *)v30 + 2);
    unint64_t v88 = *((void *)v30 + 3);
    unint64_t v33 = v89 + 1;
    int64_t v32 = v164;
    if (v89 >= v88 >> 1)
    {
      v140 = sub_19C969A04((char *)(v88 > 1), v89 + 1, 1, v30);
      int64_t v32 = v164;
      uint64_t v30 = v140;
    }
    *((void *)v30 + 2) = v33;
    uint64_t v90 = v30 + 32;
    uint64_t v91 = &v30[16 * v89 + 32];
    uint64_t v92 = v165;
    *(void *)uint64_t v91 = v34;
    *((void *)v91 + 1) = v92;
    if (v89)
    {
      while (1)
      {
        unint64_t v93 = v33 - 1;
        if (v33 >= 4)
        {
          v98 = &v90[16 * v33];
          uint64_t v99 = *((void *)v98 - 8);
          uint64_t v100 = *((void *)v98 - 7);
          BOOL v104 = __OFSUB__(v100, v99);
          uint64_t v101 = v100 - v99;
          if (v104) {
            goto LABEL_123;
          }
          uint64_t v103 = *((void *)v98 - 6);
          uint64_t v102 = *((void *)v98 - 5);
          BOOL v104 = __OFSUB__(v102, v103);
          uint64_t v96 = v102 - v103;
          char v97 = v104;
          if (v104) {
            goto LABEL_124;
          }
          unint64_t v105 = v33 - 2;
          v106 = &v90[16 * v33 - 32];
          uint64_t v108 = *(void *)v106;
          uint64_t v107 = *((void *)v106 + 1);
          BOOL v104 = __OFSUB__(v107, v108);
          uint64_t v109 = v107 - v108;
          if (v104) {
            goto LABEL_126;
          }
          BOOL v104 = __OFADD__(v96, v109);
          uint64_t v110 = v96 + v109;
          if (v104) {
            goto LABEL_129;
          }
          if (v110 >= v101)
          {
            v128 = &v90[16 * v93];
            uint64_t v130 = *(void *)v128;
            uint64_t v129 = *((void *)v128 + 1);
            BOOL v104 = __OFSUB__(v129, v130);
            uint64_t v131 = v129 - v130;
            if (v104) {
              goto LABEL_133;
            }
            BOOL v121 = v96 < v131;
            goto LABEL_94;
          }
        }
        else
        {
          if (v33 != 3)
          {
            uint64_t v122 = *((void *)v30 + 4);
            uint64_t v123 = *((void *)v30 + 5);
            BOOL v104 = __OFSUB__(v123, v122);
            uint64_t v115 = v123 - v122;
            char v116 = v104;
            goto LABEL_88;
          }
          uint64_t v95 = *((void *)v30 + 4);
          uint64_t v94 = *((void *)v30 + 5);
          BOOL v104 = __OFSUB__(v94, v95);
          uint64_t v96 = v94 - v95;
          char v97 = v104;
        }
        if (v97) {
          goto LABEL_125;
        }
        unint64_t v105 = v33 - 2;
        v111 = &v90[16 * v33 - 32];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v114 = __OFSUB__(v112, v113);
        uint64_t v115 = v112 - v113;
        char v116 = v114;
        if (v114) {
          goto LABEL_128;
        }
        v117 = &v90[16 * v93];
        uint64_t v119 = *(void *)v117;
        uint64_t v118 = *((void *)v117 + 1);
        BOOL v104 = __OFSUB__(v118, v119);
        uint64_t v120 = v118 - v119;
        if (v104) {
          goto LABEL_131;
        }
        if (__OFADD__(v115, v120)) {
          goto LABEL_132;
        }
        if (v115 + v120 >= v96)
        {
          BOOL v121 = v96 < v120;
LABEL_94:
          if (v121) {
            unint64_t v93 = v105;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v116) {
          goto LABEL_127;
        }
        v124 = &v90[16 * v93];
        uint64_t v126 = *(void *)v124;
        uint64_t v125 = *((void *)v124 + 1);
        BOOL v104 = __OFSUB__(v125, v126);
        uint64_t v127 = v125 - v126;
        if (v104) {
          goto LABEL_130;
        }
        if (v127 < v115) {
          goto LABEL_22;
        }
LABEL_96:
        unint64_t v132 = v93 - 1;
        if (v93 - 1 >= v33)
        {
          __break(1u);
LABEL_120:
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
          goto LABEL_143;
        }
        if (!v32) {
          goto LABEL_146;
        }
        v133 = v30;
        v134 = &v90[16 * v132];
        uint64_t v135 = *(void *)v134;
        v136 = &v90[16 * v93];
        uint64_t v137 = *((void *)v136 + 1);
        uint64_t v138 = v161;
        sub_19C950470((char *)&v32[3 * *(void *)v134], (char *)&v32[3 * *(void *)v136], (unint64_t)&v32[3 * v137], v12);
        uint64_t v161 = v138;
        if (v138) {
          goto LABEL_117;
        }
        if (v137 < v135) {
          goto LABEL_120;
        }
        if (v93 > *((void *)v133 + 2)) {
          goto LABEL_121;
        }
        *(void *)v134 = v135;
        *(void *)&v90[16 * v132 + 8] = v137;
        unint64_t v139 = *((void *)v133 + 2);
        if (v93 >= v139) {
          goto LABEL_122;
        }
        unint64_t v33 = v139 - 1;
        memmove(&v90[16 * v93], v136 + 16, 16 * (v139 - 1 - v93));
        uint64_t v30 = v133;
        *((void *)v133 + 2) = v139 - 1;
        int64_t v32 = v164;
        if (v139 <= 2) {
          goto LABEL_22;
        }
      }
    }
    unint64_t v33 = 1;
LABEL_22:
    uint64_t v7 = v158;
    uint64_t v31 = (uint64_t)v165;
    if ((uint64_t)v165 >= v158) {
      goto LABEL_106;
    }
  }
  if (__OFADD__(v34, v153)) {
    goto LABEL_142;
  }
  if (v34 + v153 >= v7) {
    unint64_t v72 = (char *)v7;
  }
  else {
    unint64_t v72 = (char *)(v34 + v153);
  }
  if ((uint64_t)v72 >= v34)
  {
    if ((char *)v35 != v72)
    {
      v155 = v30;
      uint64_t v73 = (uint64_t *)&v32[3 * v35];
      v157 = v72;
      do
      {
        uint64_t v75 = v32[3 * v35 + 2];
        uint64_t v160 = (uint64_t)v73;
        v165 = (void *)v35;
        while (1)
        {
          uint64_t v76 = (char *)*(v73 - 1);
          v172 = (void (*)(char *, char *, uint64_t))*(v73 - 2);
          v169 = (char *)v34;
          id v170 = v76;
          uint64_t v77 = (char *)v75 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
          swift_beginAccess();
          uint64_t v78 = *v163;
          uint64_t v79 = v166;
          uint64_t v80 = v168;
          ((void (*)(char *, char *, uint64_t))*v163)(v166, v77, v168);
          uint64_t v81 = &v76[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          uint64_t v82 = v167;
          ((void (*)(char *, char *, uint64_t))v78)(v167, v81, v80);
          swift_bridgeObjectRetain();
          v171 = v75;
          swift_bridgeObjectRetain();
          id v83 = v170;
          id v170 = (id)sub_19C976540();
          uint64_t v84 = *v162;
          (*v162)(v82, v80);
          v84(v79, v80);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v170 != (id)1) {
            break;
          }
          int64_t v32 = v164;
          uint64_t v74 = (char *)v165;
          if (!v164) {
            goto LABEL_145;
          }
          uint64_t v85 = *v73;
          uint64_t v86 = v73[1];
          uint64_t v75 = (void (*)(char *, char *, uint64_t))v73[2];
          *(_OWORD *)uint64_t v73 = *(_OWORD *)(v73 - 3);
          v73[2] = *(v73 - 1);
          *(v73 - 2) = v86;
          *(v73 - 1) = (uint64_t)v75;
          *(v73 - 3) = v85;
          v73 -= 3;
          uint64_t v34 = (uint64_t)(v169 + 1);
          if (v74 == v169 + 1) {
            goto LABEL_50;
          }
        }
        int64_t v32 = v164;
        uint64_t v74 = (char *)v165;
LABEL_50:
        uint64_t v35 = (uint64_t)(v74 + 1);
        uint64_t v73 = (uint64_t *)(v160 + 24);
        uint64_t v34 = (uint64_t)v159;
      }
      while ((char *)v35 != v157);
      uint64_t v35 = (uint64_t)v157;
      uint64_t v12 = v154;
      uint64_t v30 = v155;
    }
    goto LABEL_57;
  }
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
  uint64_t result = sub_19C976E80();
  __break(1u);
  return result;
}

uint64_t sub_19C950470(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v66 = sub_19C976560();
  uint64_t v8 = *(void *)(v66 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v66);
  uint64_t v65 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v64 = (char *)&v54 - v11;
  uint64_t v12 = a2 - a1;
  uint64_t v13 = (a2 - a1) / 24;
  unint64_t v59 = a3;
  uint64_t v14 = a3 - (void)a2;
  uint64_t v15 = v14 / 24;
  long long v71 = a1;
  long long v70 = a4;
  if (v13 >= v14 / 24)
  {
    if (v14 >= -23)
    {
      if (a4 != a2 || &a2[24 * v15] <= a4) {
        memmove(a4, a2, 24 * v15);
      }
      uint64_t v31 = &a4[24 * v15];
      uint64_t v69 = v31;
      long long v71 = a2;
      if (v14 >= 24 && a1 < a2)
      {
        uint64_t v56 = (void (**)(char *, uint64_t))(v8 + 16);
        uint64_t v55 = (void (**)(char *, uint64_t))(v8 + 8);
        unint64_t v32 = v59 - 24;
        uint64_t v67 = a4;
        int64_t v68 = a1;
        unint64_t v33 = v64;
        uint64_t v34 = v66;
        while (1)
        {
          uint64_t v61 = a2;
          uint64_t v62 = v31;
          uint64_t v63 = (char *)(v32 + 24);
          unint64_t v38 = (char *)*((void *)v31 - 1);
          id v39 = (void *)*((void *)a2 - 2);
          uint64_t v40 = (void (**)(char *, char *, uint64_t))*((void *)a2 - 1);
          unint64_t v59 = *((void *)v31 - 2);
          id v60 = v39;
          uint64_t v57 = v40;
          char v41 = &v38[OBJC_IVAR___TPSSavedTipEntry_savedDate];
          swift_beginAccess();
          uint64_t v42 = *v56;
          ((void (*)(char *, char *, uint64_t))*v56)(v33, v41, v34);
          unint64_t v43 = (char *)v40 + OBJC_IVAR___TPSSavedTipEntry_savedDate;
          swift_beginAccess();
          unint64_t v44 = v65;
          ((void (*)(char *, char *, uint64_t))v42)(v65, v43, v34);
          swift_bridgeObjectRetain();
          unsigned int v58 = v38;
          swift_bridgeObjectRetain();
          unint64_t v45 = v57;
          uint64_t v46 = sub_19C976540();
          uint64_t v47 = *v55;
          (*v55)(v44, v34);
          v47(v33, v34);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v46 == 1)
          {
            uint64_t v48 = v62;
            uint64_t v36 = v61 - 24;
            if (v63 != v61 || v32 >= (unint64_t)v61)
            {
              long long v49 = *(_OWORD *)v36;
              *(void *)(v32 + 16) = *((void *)v61 - 1);
              *(_OWORD *)unint64_t v32 = v49;
            }
            long long v71 = v36;
            unint64_t v37 = (unint64_t)v68;
            uint64_t v31 = v48;
            if (v48 <= v67) {
              goto LABEL_41;
            }
          }
          else
          {
            uint64_t v50 = v61;
            uint64_t v31 = v62 - 24;
            uint64_t v69 = v62 - 24;
            if (v63 < v62 || v32 >= (unint64_t)v62)
            {
              long long v35 = *(_OWORD *)v31;
              *(void *)(v32 + 16) = *((void *)v62 - 1);
              *(_OWORD *)unint64_t v32 = v35;
              uint64_t v36 = v50;
              unint64_t v37 = (unint64_t)v68;
              if (v31 <= v67) {
                goto LABEL_41;
              }
            }
            else
            {
              unint64_t v51 = (unint64_t)v67;
              unint64_t v37 = (unint64_t)v68;
              if (v63 != v62)
              {
                long long v52 = *(_OWORD *)v31;
                *(void *)(v32 + 16) = *((void *)v62 - 1);
                *(_OWORD *)unint64_t v32 = v52;
              }
              uint64_t v36 = v50;
              if ((unint64_t)v31 <= v51) {
                goto LABEL_41;
              }
            }
          }
          v32 -= 24;
          a2 = v36;
          if ((unint64_t)v36 <= v37) {
            goto LABEL_41;
          }
        }
      }
      goto LABEL_41;
    }
  }
  else if (v12 >= -23)
  {
    if (a4 != a1 || &a1[24 * v13] <= a4) {
      memmove(a4, a1, 24 * v13);
    }
    unsigned int v58 = &a4[24 * v13];
    uint64_t v69 = v58;
    if (v12 >= 24 && (unint64_t)a2 < v59)
    {
      uint64_t v56 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v57 = (void (**)(char *, char *, uint64_t))(v8 + 16);
      uint64_t v16 = v64;
      uint64_t v17 = v66;
      do
      {
        uint64_t v67 = a4;
        int64_t v68 = a1;
        uint64_t v18 = (char *)*((void *)a2 + 2);
        uint64_t v19 = (char *)*((void *)a4 + 1);
        uint64_t v20 = (char *)*((void *)a4 + 2);
        uint64_t v62 = (char *)*((void *)a2 + 1);
        uint64_t v63 = v19;
        id v60 = v20;
        uint64_t v21 = &v18[OBJC_IVAR___TPSSavedTipEntry_savedDate];
        swift_beginAccess();
        id v22 = *v57;
        (*v57)(v16, v21, v17);
        uint64_t v23 = &v20[OBJC_IVAR___TPSSavedTipEntry_savedDate];
        swift_beginAccess();
        unint64_t v24 = v65;
        v22(v65, v23, v17);
        swift_bridgeObjectRetain();
        uint64_t v61 = v18;
        swift_bridgeObjectRetain();
        id v60 = v60;
        uint64_t v25 = sub_19C976540();
        unint64_t v26 = *v56;
        (*v56)(v24, v17);
        v26(v16, v17);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v25 == 1)
        {
          char v27 = a2 + 24;
          a4 = v67;
          unint64_t v28 = v68;
          if (v68 < a2 || v68 >= v27 || v68 != a2)
          {
            long long v29 = *(_OWORD *)a2;
            *((void *)v68 + 2) = *((void *)a2 + 2);
            *unint64_t v28 = v29;
          }
        }
        else
        {
          unint64_t v28 = v68;
          a4 = v67 + 24;
          if (v68 != v67 || v68 >= a4)
          {
            long long v30 = *(_OWORD *)v67;
            *((void *)v68 + 2) = *((void *)v67 + 2);
            *unint64_t v28 = v30;
          }
          long long v70 = a4;
          char v27 = a2;
        }
        a1 = (char *)v28 + 24;
        long long v71 = a1;
        if (a4 >= v58) {
          break;
        }
        a2 = v27;
      }
      while ((unint64_t)v27 < v59);
    }
LABEL_41:
    sub_19C969B00((void **)&v71, (const void **)&v70, &v69);
    return 1;
  }
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

unsigned __int8 *sub_19C950A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_19C9769A0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_19C950E08();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_19C976E50();
  }
LABEL_7:
  uint64_t v11 = sub_19C950B8C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_19C950B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_19C94E720(a1, a2, a3, *(void *)(v3 + 16));
}

unsigned __int8 *sub_19C950B8C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_19C950E08()
{
  unint64_t v0 = sub_19C9769B0();
  uint64_t v4 = sub_19C950E88(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_19C950E88(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_19C950FE0(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_19C94F2A0(v9, 0);
      unint64_t v12 = sub_19C9510E0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_19C976E50();
LABEL_4:
        JUMPOUT(0x19F39D4A0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x19F39D4A0](v11 + 4, v11[2]);
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
    return MEMORY[0x19F39D4A0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_19C950FE0(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_19C970D34(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_19C970D34(v6, v5, v4);
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
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_19C9510E0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
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
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_19C970D34(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_19C976970();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_19C976E50();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_19C970D34(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_19C976940();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_19C9512F4(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *sub_19C95137C(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    unsigned int v6 = *(void **)(*(void *)(a5 + 56) + 8 * a2);
    *uint64_t result = v6;
    swift_bridgeObjectRetain();
    id v7 = v6;
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_19C95140C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v23 = (unint64_t *)result;
  uint64_t v8 = 0;
  int64_t v9 = 0;
  uint64_t v10 = a3 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (2)
  {
    uint64_t v24 = v8;
    do
    {
      if (v13)
      {
        unint64_t v15 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v16 = v15 | (v9 << 6);
      }
      else
      {
        int64_t v17 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
        if (v17 >= v14) {
          return sub_19C94F308(v23, a2, v24, a3);
        }
        unint64_t v18 = *(void *)(v10 + 8 * v17);
        ++v9;
        if (!v18)
        {
          int64_t v9 = v17 + 1;
          if (v17 + 1 >= v14) {
            return sub_19C94F308(v23, a2, v24, a3);
          }
          unint64_t v18 = *(void *)(v10 + 8 * v9);
          if (!v18)
          {
            int64_t v9 = v17 + 2;
            if (v17 + 2 >= v14) {
              return sub_19C94F308(v23, a2, v24, a3);
            }
            unint64_t v18 = *(void *)(v10 + 8 * v9);
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v14) {
                return sub_19C94F308(v23, a2, v24, a3);
              }
              unint64_t v18 = *(void *)(v10 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v9 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_30;
                  }
                  if (v9 >= v14) {
                    return sub_19C94F308(v23, a2, v24, a3);
                  }
                  unint64_t v18 = *(void *)(v10 + 8 * v9);
                  ++v19;
                  if (v18) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v9 = v19;
            }
          }
        }
LABEL_21:
        unint64_t v13 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
      }
      char v20 = (uint64_t *)(*(void *)(*(void *)(a3 + 56) + 8 * v16) + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
      swift_beginAccess();
      uint64_t result = *v20;
      if (*v20 == a4 && v20[1] == a5) {
        break;
      }
      uint64_t result = sub_19C976FB0();
    }
    while ((result & 1) == 0);
    *(unint64_t *)((char *)v23 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    uint64_t v8 = v24 + 1;
    if (!__OFADD__(v24, 1)) {
      continue;
    }
    break;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_19C9515F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_19C95140C((uint64_t)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_19C95140C((uint64_t)v13, v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    MEMORY[0x19F39E7F0](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v12;
}

void sub_19C9517BC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, id))
{
  uint64_t v23 = 0;
  int64_t v6 = 0;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v25) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v25) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v24 + 8 * v6);
      if (!v18)
      {
        int64_t v6 = v17 + 2;
        if (v17 + 2 >= v25) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v24 + 8 * v6);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    unint64_t v15 = *(void **)(*(void *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v16 = v15;
    LOBYTE(v13) = a4(v13, v14, v16);
    swift_bridgeObjectRelease();

    if (v13)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
LABEL_24:
        sub_19C94F308(a1, a2, v23, a3);
        return;
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v25) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v24 + 8 * v19);
  if (v18)
  {
    int64_t v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v6 >= v25) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v24 + 8 * v6);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_19C9519BC(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, id), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v14[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_19C9517BC((void *)((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    sub_19C9517BC((unint64_t *)v11, v8, v6, a2);
    a3 = v12;
    MEMORY[0x19F39E7F0](v11, -1, -1);
  }
  return a3;
}

uint64_t sub_19C951B34()
{
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = (unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved);
  uint64_t result = swift_beginAccess();
  *uint64_t v2 = v1;
  return result;
}

uint64_t sub_19C951B94@<X0>(void *a1@<X8>)
{
  return sub_19C94EDEC(a1);
}

void sub_19C951BC0()
{
}

uint64_t sub_19C951BD8@<X0>(uint64_t a1@<X8>)
{
  return sub_19C94EAB4(a1);
}

uint64_t sub_19C951BF0@<X0>(unsigned char *a1@<X8>)
{
  return sub_19C94EA94(a1);
}

uint64_t sub_19C951CE4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_19C8F5B48(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_19C8F5B48(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_19C976FB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_19C951D70()
{
  char v1 = *v0;
  sub_19C977090();
  sub_19C8F5B48(v1);
  sub_19C976910();
  swift_bridgeObjectRelease();
  return sub_19C9770C0();
}

uint64_t sub_19C951DD4()
{
  sub_19C8F5B48(*v0);
  sub_19C976910();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19C951E28()
{
  char v1 = *v0;
  sub_19C977090();
  sub_19C8F5B48(v1);
  sub_19C976910();
  swift_bridgeObjectRelease();
  return sub_19C9770C0();
}

uint64_t sub_19C951E88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_19C952DB0();
  *a1 = result;
  return result;
}

unint64_t sub_19C951EB8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_19C8F5B48(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19C951F34()
{
  sub_19C8F54D8(6, &v2);
  uint64_t v0 = v3;
  sub_19C8F58A0((uint64_t)&v2);
  if (v0) {
    return sub_19C952E04(6);
  }
  else {
    return sub_19C9761B0();
  }
}

uint64_t sub_19C951F8C()
{
  return sub_19C952E04(9);
}

uint64_t sub_19C951F9C()
{
  return sub_19C952E04(50);
}

uint64_t sub_19C951FA4()
{
  sub_19C8F54D8(27, &v2);
  uint64_t v0 = v3;
  sub_19C8F58A0((uint64_t)&v2);
  if (v0) {
    return sub_19C952E04(27);
  }
  else {
    return 0;
  }
}

uint64_t static TipsDefaultsManager.isInternalDevice.getter()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return byte_1EB516E20;
}

uint64_t static TipsDefaultsManager.isInternalDevice.setter(char a1)
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_1EB516E20 = a1 & 1;
  return result;
}

uint64_t (*static TipsDefaultsManager.isInternalDevice.modify())()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_19C9522C0()
{
  return sub_19C9523E0(1);
}

uint64_t sub_19C9522C8()
{
  return sub_19C9523E0(0);
}

uint64_t sub_19C9522D0()
{
  return sub_19C9523E0(2);
}

uint64_t sub_19C9522D8()
{
  return sub_19C9523E0(8);
}

uint64_t sub_19C9522E8()
{
  return sub_19C9523E0(12);
}

uint64_t sub_19C9522F0()
{
  return sub_19C9523E0(13);
}

uint64_t sub_19C952300()
{
  return sub_19C9523E0(15);
}

uint64_t sub_19C952310()
{
  return sub_19C9523E0(16);
}

uint64_t sub_19C952320()
{
  return sub_19C9523E0(17);
}

uint64_t sub_19C952330()
{
  return sub_19C9523E0(20);
}

uint64_t sub_19C952340()
{
  return sub_19C9523E0(21);
}

uint64_t sub_19C952350()
{
  return sub_19C9523E0(30);
}

uint64_t sub_19C952358()
{
  return sub_19C9523E0(31);
}

uint64_t sub_19C952368()
{
  return sub_19C9523E0(32);
}

uint64_t sub_19C952378()
{
  return sub_19C9523E0(34);
}

uint64_t sub_19C952380()
{
  return sub_19C9523E0(36);
}

uint64_t sub_19C952390()
{
  return sub_19C9523E0(37);
}

uint64_t sub_19C9523A0()
{
  return sub_19C9523E0(38);
}

uint64_t sub_19C9523B0()
{
  return sub_19C9523E0(33);
}

uint64_t sub_19C9523B8()
{
  return sub_19C9523E0(39);
}

uint64_t sub_19C9523C8()
{
  return sub_19C9523E0(40);
}

uint64_t sub_19C9523D8()
{
  return sub_19C9523E0(54);
}

uint64_t sub_19C9523E0(char a1)
{
  sub_19C8F54D8(a1, &v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v3);
    return 0;
  }
}

id sub_19C952490()
{
  return sub_19C8FECB8(3);
}

id sub_19C9524D4()
{
  return sub_19C8FECB8(4);
}

id sub_19C952518()
{
  return sub_19C8FECB8(18);
}

id sub_19C95255C()
{
  return sub_19C8FECB8(22);
}

id sub_19C9525A0()
{
  return sub_19C8FECB8(35);
}

id sub_19C9525A8()
{
  return sub_19C8FECB8(47);
}

id sub_19C9525EC()
{
  return sub_19C8FECB8(51);
}

double sub_19C952660()
{
  sub_19C8F54D8(5, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C952738()
{
  sub_19C8F54D8(10, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C952810()
{
  sub_19C8F54D8(14, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C9528E8()
{
  sub_19C8F54D8(19, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C9529C0()
{
  sub_19C8F54D8(52, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C952A98()
{
  sub_19C8F54D8(53, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

double sub_19C952B04()
{
  sub_19C8F54D8(43, &v2);
  if (v3)
  {
    if (swift_dynamicCast()) {
      return v1;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v2);
  }
  return 0.0;
}

uint64_t sub_19C952B70@<X0>(uint64_t a1@<X8>)
{
  sub_19C8F54D8(26, &v6);
  if (v7)
  {
    uint64_t v2 = sub_19C976560();
    int v3 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, v3 ^ 1u, 1, v2);
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v6);
    uint64_t v5 = sub_19C976560();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
}

uint64_t sub_19C952C50()
{
  return sub_19C952C60(29);
}

uint64_t sub_19C952C58()
{
  return sub_19C952C60(28);
}

uint64_t sub_19C952C60(char a1)
{
  sub_19C8F54D8(a1, &v3);
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)&v3);
    return 0;
  }
}

id TipsDefaultsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TipsDefaultsManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipsDefaultsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19C952DB0()
{
  unint64_t v0 = sub_19C976FD0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x37) {
    return 55;
  }
  else {
    return v0;
  }
}

uint64_t sub_19C952E04(char a1)
{
  uint64_t v2 = sub_19C9761B0();
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 == 1)
  {
    id v3 = objc_msgSend(self, sel_standardUserDefaults);
    sub_19C8F5B48(a1);
    uint64_t v4 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    uint64_t v2 = (uint64_t)objc_msgSend(v3, sel_integerForKey_, v4);

    if (v2 >= 1)
    {
      if (qword_1EB516EA8 != -1) {
        swift_once();
      }
      v10[0] = 0;
      v10[1] = 0xE000000000000000;
      uint64_t v5 = (id)qword_1EB516EB0;
      sub_19C976E10();
      sub_19C976920();
      sub_19C976E70();
      sub_19C976920();
      sub_19C976F90();
      sub_19C976920();
      swift_bridgeObjectRelease();
      os_log_type_t v6 = sub_19C976BB0();
      if (os_log_type_enabled(v5, v6))
      {
        swift_bridgeObjectRetain_n();
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = swift_slowAlloc();
        v10[0] = v8;
        *(_DWORD *)uint64_t v7 = 136315138;
        swift_bridgeObjectRetain();
        sub_19C8F5F20(0, 0xE000000000000000, v10);
        sub_19C976CB0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19C8DC000, v5, v6, "%s", v7, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F39E7F0](v8, -1, -1);
        MEMORY[0x19F39E7F0](v7, -1, -1);
      }

      swift_bridgeObjectRelease();
    }
  }
  return v2;
}

uint64_t sub_19C953114()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C953424()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C953734()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C953A48()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C953D58()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954068()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954378()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954684()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954994()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954CA4()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_19C954FB4()
{
  if (qword_1EB516E28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (byte_1EB516E20 != 1) {
    return 0;
  }
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_19C976880();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_BOOLForKey_, v1);

  if (v2)
  {
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    v8[1] = 0xE000000000000000;
    id v3 = (id)qword_1EB516EB0;
    sub_19C976E10();
    sub_19C976920();
    sub_19C976E70();
    sub_19C976920();
    sub_19C976920();
    os_log_type_t v4 = sub_19C976BB0();
    if (os_log_type_enabled(v3, v4))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v8[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      swift_bridgeObjectRetain();
      sub_19C8F5F20(0, 0xE000000000000000, v8);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v3, v4, "%s", v5, 0xCu);
      uint64_t v2 = 1;
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v6, -1, -1);
      MEMORY[0x19F39E7F0](v5, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return v2;
}

uint64_t type metadata accessor for TipsDefaultsManager()
{
  return self;
}

uint64_t method lookup function for TipsDefaultsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TipsDefaultsManager);
}

uint64_t dispatch thunk of static TipsDefaultsManager.crunchingIntervalInDays.getter()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.discoverabilityOverrideMaxDisplayCount.getter()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.triggerMinObservationCount.getter()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredTopicCycleTimeInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.debugActiveIAPs.getter()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.displayAllFeaturedTopics.getter()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.ignoreCloud.getter()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.ignoreTargetingValidator.getter()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.resetDaemonData.getter()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.resetDataCache.getter()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showAllCollections.getter()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showCollectionIntro.getter()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.showPagingLabelOnLongPress.getter()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.suppressNotifications.getter()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.suppressTipKitContent.getter()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetRequestHostURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetRatioIdentifier.getter()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.assetURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.deviceModel.getter()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.displayContentForContext.getter()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredCollection.getter()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintActionText.getter()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintActionURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintBody.getter()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintMonitoringEvents.getter()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintTitle.getter()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.minVersionForSpatialAudio.getter()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.notificationDocument.getter()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.platform.getter()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestHostURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestLanguage.getter()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestModel.getter()
{
  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestPlatform.getter()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.releaseType.getter()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestURL.getter()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestVersion.getter()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.widgetDocument.getter()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contentUpdatedDarwinNotificationInSeconds.getter()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contextualEventDaysSinceLastMajorUpdateInSeconds.getter()
{
  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintCustomizationID.getter()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.holdoutGroup.getter()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.requestInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.standardNotificationInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.userType.getter()
{
  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.contextualEventLookBackDaysInSeconds.getter()
{
  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.discoverabilitySuppressionInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.featuredDocumentInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 448))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.hintMaxDurationTimeInterval.getter()
{
  return (*(uint64_t (**)(void))(v0 + 456))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.welcomeNotificationDelay.getter()
{
  return (*(uint64_t (**)(void))(v0 + 464))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.welcomeNotificationGracePeriod.getter()
{
  return (*(uint64_t (**)(void))(v0 + 472))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.sessionTimeoutIntervalInSeconds.getter()
{
  return (*(uint64_t (**)(void))(v0 + 480))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.lastMajorVersionUpdateDate.getter()
{
  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.matchedClientConditions.getter()
{
  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of static TipsDefaultsManager.matchedClientConditionTargeting.getter()
{
  return (*(uint64_t (**)(void))(v0 + 504))();
}

uint64_t getEnumTagSinglePayload for TipsDefaultsManager.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xCA) {
    goto LABEL_17;
  }
  if (a2 + 54 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 54) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 54;
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
      return (*a1 | (v4 << 8)) - 54;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 54;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x37;
  int v8 = v6 - 55;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TipsDefaultsManager.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 54 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 54) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xCA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xC9)
  {
    unsigned int v6 = ((a2 - 202) >> 8) + 1;
    *uint64_t result = a2 + 54;
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
        JUMPOUT(0x19C9558B0);
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
          *uint64_t result = a2 + 54;
        break;
    }
  }
  return result;
}

unsigned char *sub_19C9558D8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TipsDefaultsManager.Key()
{
  return &type metadata for TipsDefaultsManager.Key;
}

unint64_t sub_19C9558F4()
{
  unint64_t result = qword_1E94148A8;
  if (!qword_1E94148A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94148A8);
  }
  return result;
}

id TPSAssetsInfo.__allocating_init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  return TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)(a1, a2, a3, a4, a5, a6);
}

uint64_t TPSAssetsInfo.videoIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

uint64_t (*TPSAssetsInfo.videoIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TPSAssetsInfo.videoURL.setter(uint64_t a1)
{
  return sub_19C956054(a1, &OBJC_IVAR___TPSAssetsInfo_videoURL);
}

uint64_t sub_19C955C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TPSAssetsInfo.videoURL.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TPSAssetsInfo.imageIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

uint64_t (*TPSAssetsInfo.imageIdentifier.modify())()
{
  return j__swift_endAccess;
}

id sub_19C955DC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v5 - 8);
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1 + *a3;
  swift_beginAccess();
  sub_19C8DE5E4(v8, (uint64_t)v7);
  uint64_t v9 = sub_19C976480();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    unint64_t v11 = (void *)sub_19C976410();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

void sub_19C955F08(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_19C976420();
    uint64_t v10 = sub_19C976480();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_19C976480();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  uint64_t v12 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  id v13 = a1;
  sub_19C955C70((uint64_t)v9, v12);
  swift_endAccess();
}

uint64_t TPSAssetsInfo.imageURL.setter(uint64_t a1)
{
  return sub_19C956054(a1, &OBJC_IVAR___TPSAssetsInfo_imageURL);
}

uint64_t sub_19C956054(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  sub_19C955C70(a1, v4);
  return swift_endAccess();
}

uint64_t (*TPSAssetsInfo.imageURL.modify())()
{
  return j_j__swift_endAccess;
}

id TPSAssetsInfo.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TPSAssetsInfo.init()()
{
}

id TPSAssetsInfo.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static TPSAssetsInfo.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall TPSAssetsInfo.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = &v25[-v8];
  uint64_t v10 = v2 + OBJC_IVAR___TPSAssetsInfo_videoIdentifier;
  swift_beginAccess();
  if (*(void *)(v10 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];
  swift_unknownObjectRelease();

  uint64_t v13 = v2 + OBJC_IVAR___TPSAssetsInfo_videoURL;
  swift_beginAccess();
  sub_19C8DE5E4(v13, (uint64_t)v9);
  uint64_t v14 = sub_19C976480();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
  uint64_t v17 = 0;
  if (v16(v9, 1, v14) != 1)
  {
    uint64_t v17 = sub_19C976410();
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v9, v14);
  }
  unint64_t v18 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v17 forKey:v18];
  swift_unknownObjectRelease();

  uint64_t v19 = v2 + OBJC_IVAR___TPSAssetsInfo_imageIdentifier;
  swift_beginAccess();
  if (*(void *)(v19 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_19C976880();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v20 forKey:v21];
  swift_unknownObjectRelease();

  uint64_t v22 = v2 + OBJC_IVAR___TPSAssetsInfo_imageURL;
  swift_beginAccess();
  sub_19C8DE5E4(v22, (uint64_t)v7);
  uint64_t v23 = 0;
  if (v16(v7, 1, v14) != 1)
  {
    uint64_t v23 = sub_19C976410();
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v7, v14);
  }
  uint64_t v24 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v23 forKey:v24];
  swift_unknownObjectRelease();
}

id TPSAssetsInfo.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPSAssetsInfo.init(coder:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v41 - v6;
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v41 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  id v16 = (char *)&v41 - v15;
  MEMORY[0x1F4188790](v14);
  unint64_t v18 = (char *)&v41 - v17;
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  uint64_t v19 = sub_19C976C20();
  sub_19C8DFBA0(0, &qword_1E94148B8);
  uint64_t v20 = sub_19C976C20();
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    sub_19C976420();

    uint64_t v22 = sub_19C976480();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_19C976480();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 1, 1, v23);
  }
  sub_19C956AA4((uint64_t)v16, (uint64_t)v18);
  uint64_t v41 = sub_19C976C20();
  uint64_t v24 = sub_19C976C20();
  uint64_t v42 = (void *)v19;
  if (v24)
  {
    int64_t v25 = (void *)v24;
    sub_19C976420();

    uint64_t v26 = sub_19C976480();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 0, 1, v26);
  }
  else
  {
    uint64_t v26 = sub_19C976480();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 1, 1, v26);
  }
  sub_19C956AA4((uint64_t)v10, (uint64_t)v13);
  unint64_t v27 = v18;
  sub_19C8DE5E4((uint64_t)v18, (uint64_t)v7);
  sub_19C976480();
  uint64_t v28 = *(void *)(v26 - 8);
  long long v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  long long v30 = 0;
  if (v29(v7, 1, v26) != 1)
  {
    long long v30 = (void *)sub_19C976410();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v26);
  }
  uint64_t v31 = v13;
  uint64_t v32 = (uint64_t)v13;
  uint64_t v33 = v44;
  sub_19C8DE5E4(v32, v44);
  if (v29((char *)v33, 1, v26) == 1)
  {
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = (void *)sub_19C976410();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v33, v26);
  }
  uint64_t v35 = (uint64_t)v31;
  uint64_t v36 = (uint64_t)v27;
  unint64_t v37 = v42;
  unint64_t v38 = (void *)v41;
  id v39 = objc_msgSend(v43, sel_initWithVideoIdentifier_videoURL_imageIdentifier_imageURL_, v42, v30, v41, v34);

  sub_19C8DEF34(v35);
  sub_19C8DEF34(v36);
  return v39;
}

uint64_t sub_19C956AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TPSAssetsInfo.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C976480();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_19C976E10();
  uint64_t v13 = v11;
  unint64_t v14 = v12;
  sub_19C976920();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  uint64_t v6 = v0 + OBJC_IVAR___TPSAssetsInfo_videoURL;
  swift_beginAccess();
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v7(v6, 1, v2))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    sub_19C976400();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  uint64_t v8 = v1 + OBJC_IVAR___TPSAssetsInfo_imageURL;
  swift_beginAccess();
  if (!v7(v8, 1, v2))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_19C976400();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t method lookup function for TPSAssetsInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPSAssetsInfo);
}

uint64_t dispatch thunk of TPSAssetsInfo.__allocating_init(videoIdentifier:videoURL:imageIdentifier:imageURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void *TipsAnalyticsEvent.init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  uint64_t v8 = sub_19C976BE0();
  uint64_t v3 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976BC0();
  MEMORY[0x1F4188790]();
  sub_19C976750();
  MEMORY[0x1F4188790]();
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C78);
  sub_19C976740();
  uint64_t v11 = MEMORY[0x1E4FBC860];
  sub_19C8E0664((unint64_t *)&qword_1EB516C70, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
  sub_19C957A2C((unint64_t *)&qword_1EB516C60, &qword_1EB516C58);
  sub_19C976D30();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC58], v8);
  uint64_t v6 = sub_19C976C10();
  v2[2] = v9;
  v2[3] = v10;
  v2[4] = v6;
  return v2;
}

uint64_t TipsAnalyticsEvent.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_19C9571AC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_19C9571F8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_19C95724C())()
{
  return j__swift_endAccess;
}

uint64_t sub_19C9572A0()
{
  uint64_t v1 = sub_19C976720();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19C976750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 32);
  aBlock[4] = sub_19C957988;
  uint64_t v13 = v0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C942FD0;
  aBlock[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_19C976730();
  v11[1] = MEMORY[0x1E4FBC860];
  sub_19C8E0664((unint64_t *)&qword_1E94146B8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94146C0);
  sub_19C957A2C((unint64_t *)&qword_1E94146C8, &qword_1E94146C0);
  sub_19C976D30();
  MEMORY[0x19F39D7A0](0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_19C957530(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t TipsAnalyticsEvent.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TipsAnalyticsEvent.init(identifier:)(a1, a2);
  return v4;
}

void sub_19C9575E0()
{
}

void sub_19C95763C(uint64_t a1)
{
  if (qword_1EB516E50 != -1) {
    swift_once();
  }
  uint64_t v2 = (id)qword_1EB516E58;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD000000000000018;
  unint64_t v10 = 0x800000019C986A70;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_19C976920();
  (*(void (**)(uint64_t))(*(void *)a1 + 128))(v3);
  sub_19C8DFBA0(0, &qword_1E94148A0);
  sub_19C976800();
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v4 = sub_19C976B90();
  if (os_log_type_enabled(v2, v4))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t aBlock = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(0xD000000000000018, 0x800000019C986A70, &aBlock);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v2, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v6, -1, -1);
    MEMORY[0x19F39E7F0](v5, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_19C957C10;
  uint64_t v14 = a1;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v10 = 1107296256;
  uint64_t v11 = sub_19C957990;
  unint64_t v12 = &block_descriptor_5;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);
}

void sub_19C957988()
{
  sub_19C95763C(v0);
}

id sub_19C957990(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_19C8DFBA0(0, &qword_1E94148A0);
    os_log_type_t v4 = (void *)sub_19C9767E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v4 = 0;
  }
  return v4;
}

uint64_t sub_19C957A2C(unint64_t *a1, uint64_t *a2)
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

uint64_t TipsAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_19C957ABC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TipsAnalyticsEvent()
{
  return self;
}

uint64_t method lookup function for TipsAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TipsAnalyticsEvent);
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.identifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.__allocating_init(identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.eventRepresentation()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TipsAnalyticsEvent.log()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_19C957C10()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

BOOL static NetworkMonitor.isNetworkError(_:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_domain);
  uint64_t v3 = sub_19C9768B0();
  uint64_t v5 = v4;

  if (v3 == sub_19C9768B0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    return objc_msgSend(a1, sel_code) == (id)-1009;
  }
  char v8 = sub_19C976FB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if (v8) {
    return objc_msgSend(a1, sel_code) == (id)-1009;
  }
  return result;
}

uint64_t sub_19C957D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_19C976AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19C976AB0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_19C8E00AC(a1, (uint64_t *)&unk_1EB516BF0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19C976A50();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t static NetworkMonitor.shared.getter()
{
  if (qword_1EB516BD0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_19C957EEC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516BF0);
  uint64_t result = MEMORY[0x1F4188790](v1 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(v0 + 112))
  {
    uint64_t v5 = sub_19C976AC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = v6;
    *(void *)(v0 + 112) = sub_19C957D08((uint64_t)v4, (uint64_t)&unk_1E9414768, (uint64_t)v7);
    return swift_release();
  }
  return result;
}

uint64_t sub_19C958014()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C95804C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  uint64_t v5 = sub_19C976710();
  v4[16] = v5;
  v4[17] = *(void *)(v5 - 8);
  v4[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_19C976680();
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C9581A8, 0, 0);
}

uint64_t sub_19C9581A8()
{
  sub_19C9766A0();
  swift_allocObject();
  sub_19C976690();
  sub_19C976660();
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v1 = sub_19C95DBFC(&qword_1E9414948, MEMORY[0x1E4F38A60]);
  id v2 = (void *)swift_task_alloc();
  v0[24] = v2;
  *id v2 = v0;
  v2[1] = sub_19C9582F4;
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[21];
  return MEMORY[0x1F4187C78](v3, v4, v1);
}

uint64_t sub_19C9582F4()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_19C958784;
  }
  else {
    id v2 = sub_19C958408;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19C958408()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    v0[26] = Strong;
    if (Strong)
    {
      uint64_t v5 = Strong;
      uint64_t v6 = sub_19C958808;
LABEL_4:
      return MEMORY[0x1F4188298](v6, v5, 0);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v10 = (uint64_t (*)(void))v0[1];
    goto LABEL_14;
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[18], v1, v2);
  uint64_t v7 = swift_weakLoadStrong();
  v0[27] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)swift_task_alloc();
    v0[28] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_19C9588AC;
    uint64_t v9 = v0[18];
    return sub_19C95B450(v9);
  }
  else
  {
    uint64_t v11 = v0[25];
    sub_19C976AF0();
    if (v11)
    {
      uint64_t v13 = v0[22];
      uint64_t v12 = v0[23];
      uint64_t v14 = v0[21];
      (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v10 = (uint64_t (*)(void))v0[1];
LABEL_14:
      return v10();
    }
    uint64_t v15 = swift_weakLoadStrong();
    v0[29] = v15;
    if (v15)
    {
      uint64_t v5 = v15;
      uint64_t v6 = sub_19C958BCC;
      goto LABEL_4;
    }
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v16 = sub_19C95DBFC(&qword_1E9414948, MEMORY[0x1E4F38A60]);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[24] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_19C9582F4;
    uint64_t v18 = v0[20];
    uint64_t v19 = v0[21];
    return MEMORY[0x1F4187C78](v18, v19, v16);
  }
}

uint64_t sub_19C958784()
{
  *(void *)(v0 + 112) = *(void *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
  uint64_t v1 = MEMORY[0x1E4FBC248];
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = MEMORY[0x1E4FBC278];
  return MEMORY[0x1F41868E8](v2, v1, v3);
}

uint64_t sub_19C958808()
{
  *(void *)(*(void *)(v0 + 208) + 112) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19C9588AC()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19C9589C4, 0, 0);
}

uint64_t sub_19C9589C4()
{
  uint64_t v1 = v0[25];
  sub_19C976AF0();
  if (v1)
  {
    uint64_t v3 = v0[22];
    uint64_t v2 = v0[23];
    uint64_t v4 = v0[21];
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    v0[29] = Strong;
    if (Strong)
    {
      return MEMORY[0x1F4188298](sub_19C958BCC, Strong, 0);
    }
    else
    {
      (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
      uint64_t v8 = sub_19C95DBFC(&qword_1E9414948, MEMORY[0x1E4F38A60]);
      uint64_t v9 = (void *)swift_task_alloc();
      v0[24] = v9;
      void *v9 = v0;
      v9[1] = sub_19C9582F4;
      uint64_t v10 = v0[20];
      uint64_t v11 = v0[21];
      return MEMORY[0x1F4187C78](v10, v11, v8);
    }
  }
}

uint64_t sub_19C958BCC()
{
  uint64_t v1 = v0[29];
  if (*(void *)(v1 + 112))
  {
    (*(void (**)(void, void, void))(v0[17] + 16))(v0[19], v0[18], v0[16]);
    uint64_t v2 = 0;
    uint64_t v1 = v0[29];
  }
  else
  {
    uint64_t v2 = 1;
  }
  uint64_t v3 = v0[19];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[17] + 56))(v3, v2, 1, v0[16]);
  uint64_t v4 = v1 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8FEEC8(v3, v4);
  swift_endAccess();
  swift_release();
  return MEMORY[0x1F4188298](sub_19C958CC8, 0, 0);
}

uint64_t sub_19C958CC8()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  uint64_t v1 = sub_19C95DBFC(&qword_1E9414948, MEMORY[0x1E4F38A60]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[24] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_19C9582F4;
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[21];
  return MEMORY[0x1F4187C78](v3, v4, v1);
}

uint64_t sub_19C958DB8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

BOOL static NetworkMonitor.isContentError(_:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_domain);
  uint64_t v3 = sub_19C9768B0();
  uint64_t v5 = v4;

  if (v3 == sub_19C9768B0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    return objc_msgSend(a1, sel_code) == (id)404;
  }
  char v8 = sub_19C976FB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if (v8) {
    return objc_msgSend(a1, sel_code) == (id)404;
  }
  return result;
}

uint64_t sub_19C958ED0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_19C958EFC(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_19C8E05CC(a1);
  char v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    return swift_endAccess();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_19C95CFD8();
    uint64_t v8 = v12;
  }
  uint64_t v9 = *(void *)(v8 + 48);
  uint64_t v10 = sub_19C9765A0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v4, v10);
  sub_19C95C950(v4, v12);
  *uint64_t v3 = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_19C959024()
{
  v1[5] = v0;
  uint64_t v2 = sub_19C9766F0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94148D0);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_19C976680();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94148D8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C959200, v0, 0);
}

uint64_t sub_19C959200()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[5] + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v2, v1, &qword_1EB516A88);
  uint64_t v3 = sub_19C976710();
  v0[19] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[20] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[21] = v5;
  v0[22] = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  if (v6 == 1)
  {
    sub_19C9766A0();
    swift_allocObject();
    sub_19C976690();
    sub_19C976660();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[23] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_19C959768;
    uint64_t v8 = v0[15];
    return MEMORY[0x1F40F23B0](v8);
  }
  sub_19C8E0974(v2, v0[15], &qword_1EB516A88);
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[15];
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[21])(v10, 1, v9) == 1)
  {
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[6];
    uint64_t v13 = v0[7];
    sub_19C8E00AC(v10, &qword_1EB516A88);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v14(v11, 1, 1, v12);
  }
  else
  {
    uint64_t v15 = v0[20];
    uint64_t v16 = v0[18];
    uint64_t v17 = v0[6];
    uint64_t v18 = v0[7];
    sub_19C976700();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v10, v9);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v14(v16, 0, 1, v17);
  }
  uint64_t v20 = v0[17];
  uint64_t v19 = v0[18];
  uint64_t v22 = v0[9];
  uint64_t v21 = v0[10];
  uint64_t v23 = v0[6];
  uint64_t v24 = v0[7];
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v20, *MEMORY[0x1E4F38B20], v23);
  v14(v20, 0, 1, v23);
  uint64_t v25 = v21 + *(int *)(v22 + 48);
  sub_19C8E0974(v19, v21, &qword_1E94148D8);
  sub_19C8E0974(v20, v25, &qword_1E94148D8);
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  if (v26(v21, 1, v23) != 1)
  {
    uint64_t v30 = v0[6];
    sub_19C8E0974(v0[10], v0[16], &qword_1E94148D8);
    int v31 = v26(v25, 1, v30);
    uint64_t v33 = v0[17];
    uint64_t v32 = v0[18];
    uint64_t v34 = v0[16];
    if (v31 != 1)
    {
      uint64_t v37 = v0[10];
      uint64_t v39 = v0[7];
      uint64_t v38 = v0[8];
      uint64_t v40 = v0[6];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v38, v25, v40);
      sub_19C95DBFC(qword_1E94148E0, MEMORY[0x1E4F38B28]);
      char v29 = sub_19C976850();
      uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v41(v38, v40);
      sub_19C8E00AC(v33, &qword_1E94148D8);
      sub_19C8E00AC(v32, &qword_1E94148D8);
      v41(v34, v40);
      sub_19C8E00AC(v37, &qword_1E94148D8);
      goto LABEL_15;
    }
    uint64_t v35 = v0[6];
    uint64_t v36 = v0[7];
    sub_19C8E00AC(v0[17], &qword_1E94148D8);
    sub_19C8E00AC(v32, &qword_1E94148D8);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    goto LABEL_13;
  }
  uint64_t v27 = v0[18];
  uint64_t v28 = v0[6];
  sub_19C8E00AC(v0[17], &qword_1E94148D8);
  sub_19C8E00AC(v27, &qword_1E94148D8);
  if (v26(v25, 1, v28) != 1)
  {
LABEL_13:
    sub_19C8E00AC(v0[10], &qword_1E94148D0);
    char v29 = 0;
    goto LABEL_15;
  }
  sub_19C8E00AC(v0[10], &qword_1E94148D8);
  char v29 = 1;
LABEL_15:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = (uint64_t (*)(void))v0[1];
  return v42(v29 & 1);
}

uint64_t sub_19C959768()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C959878, v1, 0);
}

uint64_t sub_19C959878()
{
  (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 120);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 168))(v2, 1, v1) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 144);
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v5 = *(void *)(v0 + 56);
    sub_19C8E00AC(v2, &qword_1EB516A88);
    int v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v6(v3, 1, 1, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v8 = *(void *)(v0 + 144);
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 56);
    sub_19C976700();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v1);
    int v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v6(v8, 0, 1, v9);
  }
  uint64_t v12 = *(void *)(v0 + 136);
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 72);
  uint64_t v13 = *(void *)(v0 + 80);
  uint64_t v15 = *(void *)(v0 + 48);
  uint64_t v16 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v12, *MEMORY[0x1E4F38B20], v15);
  v6(v12, 0, 1, v15);
  uint64_t v17 = v13 + *(int *)(v14 + 48);
  sub_19C8E0974(v11, v13, &qword_1E94148D8);
  sub_19C8E0974(v12, v17, &qword_1E94148D8);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v18(v13, 1, v15) == 1)
  {
    uint64_t v19 = *(void *)(v0 + 144);
    uint64_t v20 = *(void *)(v0 + 48);
    sub_19C8E00AC(*(void *)(v0 + 136), &qword_1E94148D8);
    sub_19C8E00AC(v19, &qword_1E94148D8);
    if (v18(v17, 1, v20) == 1)
    {
      sub_19C8E00AC(*(void *)(v0 + 80), &qword_1E94148D8);
      char v21 = 1;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v22 = *(void *)(v0 + 48);
  sub_19C8E0974(*(void *)(v0 + 80), *(void *)(v0 + 128), &qword_1E94148D8);
  unsigned int v23 = v18(v17, 1, v22);
  uint64_t v25 = *(void *)(v0 + 136);
  uint64_t v24 = *(void *)(v0 + 144);
  uint64_t v26 = *(void *)(v0 + 128);
  if (v23 == 1)
  {
    uint64_t v27 = *(void *)(v0 + 48);
    uint64_t v28 = *(void *)(v0 + 56);
    sub_19C8E00AC(*(void *)(v0 + 136), &qword_1E94148D8);
    sub_19C8E00AC(v24, &qword_1E94148D8);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
LABEL_9:
    sub_19C8E00AC(*(void *)(v0 + 80), &qword_1E94148D0);
    char v21 = 0;
    goto LABEL_11;
  }
  uint64_t v29 = *(void *)(v0 + 80);
  uint64_t v31 = *(void *)(v0 + 56);
  uint64_t v30 = *(void *)(v0 + 64);
  uint64_t v32 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v30, v17, v32);
  sub_19C95DBFC(qword_1E94148E0, MEMORY[0x1E4F38B28]);
  char v21 = sub_19C976850();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v33(v30, v32);
  sub_19C8E00AC(v25, &qword_1E94148D8);
  sub_19C8E00AC(v24, &qword_1E94148D8);
  v33(v26, v32);
  sub_19C8E00AC(v29, &qword_1E94148D8);
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34(v21 & 1);
}

uint64_t sub_19C959C78()
{
  v1[5] = v0;
  uint64_t v2 = sub_19C976680();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C959D78, v0, 0);
}

uint64_t sub_19C959D78()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[5] + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v2, v1, &qword_1EB516A88);
  uint64_t v3 = sub_19C976710();
  v0[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[12] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[13] = v5;
  v0[14] = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  if (v6 == 1)
  {
    sub_19C9766A0();
    swift_allocObject();
    sub_19C976690();
    sub_19C976660();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[15] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_19C959FCC;
    uint64_t v8 = v0[10];
    return MEMORY[0x1F40F23B0](v8);
  }
  else
  {
    sub_19C8E0974(v2, v0[10], &qword_1EB516A88);
    uint64_t v10 = v0[10];
    uint64_t v9 = v0[11];
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[13])(v10, 1, v9) == 1)
    {
      sub_19C8E00AC(v10, &qword_1EB516A88);
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v12 = v0[12];
      char v13 = sub_19C9766C0();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      uint64_t v11 = v13 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v11);
  }
}

uint64_t sub_19C959FCC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C95A0DC, v1, 0);
}

uint64_t sub_19C95A0DC()
{
  (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_19C8E00AC(v2, &qword_1EB516A88);
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 96);
    char v5 = sub_19C9766C0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    uint64_t v3 = v5 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v3);
}

uint64_t sub_19C95A1D4()
{
  v1[5] = v0;
  uint64_t v2 = sub_19C976680();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C95A2D4, v0, 0);
}

uint64_t sub_19C95A2D4()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[5] + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v2, v1, &qword_1EB516A88);
  uint64_t v3 = sub_19C976710();
  v0[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[12] = v4;
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[13] = v5;
  v0[14] = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  if (v6 == 1)
  {
    sub_19C9766A0();
    swift_allocObject();
    sub_19C976690();
    sub_19C976660();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[15] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_19C95A528;
    uint64_t v8 = v0[10];
    return MEMORY[0x1F40F23B0](v8);
  }
  else
  {
    sub_19C8E0974(v2, v0[10], &qword_1EB516A88);
    uint64_t v10 = v0[10];
    uint64_t v9 = v0[11];
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[13])(v10, 1, v9) == 1)
    {
      sub_19C8E00AC(v10, &qword_1EB516A88);
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v12 = v0[12];
      char v13 = sub_19C9766B0();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      uint64_t v11 = v13 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v11);
  }
}

uint64_t sub_19C95A528()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C95A638, v1, 0);
}

uint64_t sub_19C95A638()
{
  (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_19C8E00AC(v2, &qword_1EB516A88);
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 96);
    char v5 = sub_19C9766B0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    uint64_t v3 = v5 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v3);
}

uint64_t sub_19C95A730()
{
  v1[5] = v0;
  uint64_t v2 = sub_19C976650();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_19C976680();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C95A88C, v0, 0);
}

uint64_t sub_19C95A88C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[5] + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v2, v1, &qword_1EB516A88);
  uint64_t v3 = sub_19C976710();
  v0[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[15] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[16] = v5;
  v0[17] = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  if (v6 == 1)
  {
    sub_19C9766A0();
    swift_allocObject();
    sub_19C976690();
    sub_19C976660();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[18] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_19C95AB50;
    uint64_t v8 = v0[13];
    return MEMORY[0x1F40F23B0](v8);
  }
  else
  {
    sub_19C8E0974(v2, v0[13], &qword_1EB516A88);
    uint64_t v10 = v0[13];
    uint64_t v9 = v0[14];
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[16])(v10, 1, v9) == 1)
    {
      sub_19C8E00AC(v10, &qword_1EB516A88);
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v12 = v0[15];
      uint64_t v14 = v0[7];
      uint64_t v13 = v0[8];
      uint64_t v15 = v0[6];
      (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x1E4F389B8], v15);
      char v16 = sub_19C9766D0();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      uint64_t v11 = v16 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    return v17(v11);
  }
}

uint64_t sub_19C95AB50()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C95AC60, v1, 0);
}

uint64_t sub_19C95AC60()
{
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v2, 1, v1) == 1)
  {
    sub_19C8E00AC(v2, &qword_1EB516A88);
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 48);
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E4F389B8], v7);
    char v8 = sub_19C9766D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    uint64_t v3 = v8 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v3);
}

uint64_t sub_19C95ADC0()
{
  v1[5] = v0;
  uint64_t v2 = sub_19C976650();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_19C976680();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C95AF1C, v0, 0);
}

uint64_t sub_19C95AF1C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[5] + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v2, v1, &qword_1EB516A88);
  uint64_t v3 = sub_19C976710();
  v0[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[15] = v4;
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[16] = v5;
  v0[17] = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  if (v6 == 1)
  {
    sub_19C9766A0();
    swift_allocObject();
    sub_19C976690();
    sub_19C976660();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[18] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_19C95B1E0;
    uint64_t v8 = v0[13];
    return MEMORY[0x1F40F23B0](v8);
  }
  else
  {
    sub_19C8E0974(v2, v0[13], &qword_1EB516A88);
    uint64_t v10 = v0[13];
    uint64_t v9 = v0[14];
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[16])(v10, 1, v9) == 1)
    {
      sub_19C8E00AC(v10, &qword_1EB516A88);
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v12 = v0[15];
      uint64_t v14 = v0[7];
      uint64_t v13 = v0[8];
      uint64_t v15 = v0[6];
      (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x1E4F389A0], v15);
      char v16 = sub_19C9766D0();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v9);
      uint64_t v11 = v16 & 1;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    return v17(v11);
  }
}

uint64_t sub_19C95B1E0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19C95B2F0, v1, 0);
}

uint64_t sub_19C95B2F0()
{
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 128))(v2, 1, v1) == 1)
  {
    sub_19C8E00AC(v2, &qword_1EB516A88);
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 48);
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E4F389A0], v7);
    char v8 = sub_19C9766D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    uint64_t v3 = v8 & 1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v3);
}

uint64_t sub_19C95B450(uint64_t a1)
{
  v2[11] = a1;
  v2[12] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414938);
  v2[13] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[14] = v4;
  v2[15] = v4;
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414940);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  uint64_t v5 = sub_19C9766F0();
  v2[20] = v5;
  v2[21] = *(void *)(v5 - 8);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v6 = sub_19C976710();
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A88);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19C95B668, v1, 0);
}

uint64_t sub_19C95B668()
{
  uint64_t v75 = v0;
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 200);
  os_log_t log = *(os_log_t *)(v0 + 208);
  uint64_t v73 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 96) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath;
  swift_beginAccess();
  sub_19C8E0974(v4, v1, &qword_1EB516A88);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  int v6 = v5(v1, 1, v3);
  sub_19C8E00AC(v1, &qword_1EB516A88);
  (*(void (**)(os_log_t, uint64_t, uint64_t))(v2 + 16))(log, v73, v3);
  uint64_t v7 = *(void *)(v0 + 192);
  if (v6 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(v0 + 216);
  sub_19C8E0974(v4, v8, &qword_1EB516A88);
  uint64_t v9 = (uint64_t (*)())v5(v8, 1, v7);
  if (v9 == 1)
  {
    __break(1u);
    return MEMORY[0x1F4188298](v9, v10, v11);
  }
  uint64_t v12 = *(void *)(v0 + 216);
  uint64_t v13 = *(void *)(v0 + 192);
  uint64_t v14 = *(void *)(v0 + 200);
  os_log_t loga = *(os_log_t *)(v0 + 208);
  uint64_t v15 = *(void *)(v0 + 176);
  uint64_t v69 = *(void *)(v0 + 184);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 168);
  sub_19C976700();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v18(v12, v13);
  sub_19C976700();
  sub_19C95DBFC(qword_1E94148E0, MEMORY[0x1E4F38B28]);
  LOBYTE(v12) = sub_19C976850();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v19(v15, v16);
  v19(v69, v16);
  v18((uint64_t)loga, v13);
  if ((v12 & 1) == 0)
  {
LABEL_5:
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    uint64_t v20 = *(void *)(v0 + 184);
    uint64_t v22 = *(void *)(v0 + 160);
    uint64_t v21 = *(void *)(v0 + 168);
    v74[0] = 0;
    v74[1] = 0xE000000000000000;
    unsigned int v23 = (id)qword_1EB516EB0;
    sub_19C976E10();
    *(void *)(v0 + 64) = 0;
    *(void *)(v0 + 72) = 0xE000000000000000;
    sub_19C976920();
    sub_19C976700();
    sub_19C976E70();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    *(void *)(v0 + 232) = v24;
    *(void *)(v0 + 240) = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v24(v20, v22);
    uint64_t v26 = *(void *)(v0 + 64);
    unint64_t v25 = *(void *)(v0 + 72);
    os_log_type_t v27 = sub_19C976BB0();
    if (os_log_type_enabled(v23, v27))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      logb = v23;
      uint64_t v29 = swift_slowAlloc();
      v74[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 80) = sub_19C8F5F20(v26, v25, v74);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, logb, v27, "%s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v29, -1, -1);
      MEMORY[0x19F39E7F0](v28, -1, -1);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v30 = (uint64_t *)(*(void *)(v0 + 96) + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_observers);
    swift_beginAccess();
    uint64_t v31 = *v30;
    *(void *)(v0 + 248) = v31;
    char v32 = *(unsigned char *)(v31 + 32);
    *(unsigned char *)(v0 + 300) = v32;
    uint64_t v33 = -1;
    uint64_t v34 = -1 << v32;
    if (-(-1 << v32) < 64) {
      uint64_t v33 = ~(-1 << -(char)(-1 << v32));
    }
    unint64_t v35 = v33 & *(void *)(v31 + 64);
    *(_DWORD *)(v0 + 296) = *MEMORY[0x1E4F38B20];
    swift_bridgeObjectRetain();
    if (v35)
    {
      uint64_t v36 = 0;
      unint64_t v37 = __clz(__rbit64(v35));
      uint64_t v38 = (v35 - 1) & v35;
LABEL_14:
      uint64_t v39 = *(void *)(v0 + 136);
      uint64_t v41 = *(void *)(v0 + 104);
      uint64_t v40 = *(void *)(v0 + 112);
      uint64_t v42 = *(void *)(v31 + 48);
      uint64_t v43 = sub_19C9765A0();
      (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v39, v42 + *(void *)(*(void *)(v43 - 8) + 72) * v37, v43);
      *(_OWORD *)(v39 + *(int *)(v41 + 48)) = *(_OWORD *)(*(void *)(v31 + 56) + 16 * v37);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v39, 0, 1, v41);
      swift_retain();
LABEL_21:
      *(void *)(v0 + 256) = v36;
      *(void *)(v0 + 264) = v38;
      uint64_t v46 = *(void *)(v0 + 136);
      uint64_t v47 = *(void *)(v0 + 104);
      uint64_t v48 = 1;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 112) + 48))(v46, 1, v47) != 1)
      {
        uint64_t v49 = *(void *)(v0 + 144);
        uint64_t v50 = *(void *)(v0 + 128);
        uint64_t v51 = *(int *)(v47 + 48);
        uint64_t v52 = sub_19C9765A0();
        uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 32);
        v53(v50, v46, v52);
        uint64_t v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = *(_OWORD *)(v46 + v51);
        uint64_t v55 = (uint64_t (**)(char))(v49 + *(int *)(v47 + 48));
        v53(v49, v50, v52);
        uint64_t v48 = 0;
        *uint64_t v55 = sub_19C95DB68;
        v55[1] = (uint64_t (*)(char))v54;
        uint64_t v47 = *(void *)(v0 + 104);
      }
      uint64_t v57 = *(void *)(v0 + 144);
      uint64_t v56 = *(void *)(v0 + 152);
      uint64_t v58 = *(void *)(v0 + 120);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v57, v48, 1, v47);
      sub_19C95DAC8(v57, v56);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v56, 1, v47) == 1)
      {
        swift_release();
        goto LABEL_25;
      }
      uint64_t v61 = (void *)(*(void *)(v0 + 152) + *(int *)(*(void *)(v0 + 104) + 48));
      *(void *)(v0 + 272) = *v61;
      *(void *)(v0 + 280) = v61[1];
      sub_19C976AA0();
      *(void *)(v0 + 288) = sub_19C976A90();
      uint64_t v62 = sub_19C976A50();
      uint64_t v64 = v63;
      uint64_t v9 = sub_19C95BF44;
      uint64_t v10 = v62;
      uint64_t v11 = v64;
      return MEMORY[0x1F4188298](v9, v10, v11);
    }
    unint64_t v44 = 63 - v34;
    if ((unint64_t)(63 - v34) <= 0x7F)
    {
      uint64_t v36 = 0;
    }
    else
    {
      unint64_t v45 = *(void *)(v31 + 72);
      if (v45)
      {
        uint64_t v36 = 1;
LABEL_18:
        uint64_t v38 = (v45 - 1) & v45;
        unint64_t v37 = __clz(__rbit64(v45)) + (v36 << 6);
        goto LABEL_14;
      }
      if (v44 < 0xC0)
      {
        uint64_t v36 = 1;
      }
      else
      {
        unint64_t v45 = *(void *)(v31 + 80);
        if (v45)
        {
          uint64_t v36 = 2;
          goto LABEL_18;
        }
        if (v44 < 0x100)
        {
          uint64_t v36 = 2;
        }
        else
        {
          unint64_t v45 = *(void *)(v31 + 88);
          if (v45)
          {
            uint64_t v36 = 3;
            goto LABEL_18;
          }
          if (v44 < 0x140)
          {
            uint64_t v36 = 3;
          }
          else
          {
            unint64_t v45 = *(void *)(v31 + 96);
            if (v45)
            {
              uint64_t v36 = 4;
              goto LABEL_18;
            }
            uint64_t v65 = 0;
            uint64_t v66 = v44 >> 6;
            uint64_t v67 = 5;
            if (v66 > 5) {
              uint64_t v67 = v66;
            }
            uint64_t v68 = v67 - 5;
            while (v68 != v65)
            {
              unint64_t v45 = *(void *)(v31 + 104 + 8 * v65++);
              if (v45)
              {
                uint64_t v36 = v65 + 4;
                goto LABEL_18;
              }
            }
            uint64_t v36 = v66 - 1;
          }
        }
      }
    }
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 112) + 56))(*(void *)(v0 + 136), 1, 1);
    uint64_t v38 = 0;
    goto LABEL_21;
  }
LABEL_25:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
  return v59();
}

uint64_t sub_19C95BF44()
{
  uint64_t v10 = *(void (**)(void))(v0 + 272);
  uint64_t v1 = *(unsigned int *)(v0 + 296);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v7 = *(void *)(v0 + 96);
  swift_release();
  sub_19C976700();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104))(v4, v1, v6);
  char v8 = sub_19C9766E0();
  v2(v4, v6);
  v2(v3, v6);
  v10(v8 & 1);
  return MEMORY[0x1F4188298](sub_19C95C044, v7, 0);
}

uint64_t sub_19C95C044()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = sub_19C9765A0();
  uint64_t v37 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v1, v2);
  uint64_t v3 = (uint64_t (*)())swift_release();
  int64_t v7 = *(void *)(v0 + 256);
  unint64_t v6 = *(void *)(v0 + 264);
  if (v6)
  {
    uint64_t v8 = (v6 - 1) & v6;
    unint64_t v9 = __clz(__rbit64(v6)) | (v7 << 6);
    uint64_t v10 = *(void *)(v0 + 248);
LABEL_3:
    uint64_t v11 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v37 + 16))(v11, *(void *)(v10 + 48) + *(void *)(v37 + 72) * v9, v2);
    *(_OWORD *)(v11 + *(int *)(v13 + 48)) = *(_OWORD *)(*(void *)(v10 + 56) + 16 * v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v11, 0, 1, v13);
    swift_retain();
    goto LABEL_22;
  }
  int64_t v14 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  int64_t v15 = (unint64_t)((1 << *(unsigned char *)(v0 + 300)) + 63) >> 6;
  if (v14 < v15)
  {
    uint64_t v10 = *(void *)(v0 + 248);
    uint64_t v16 = v10 + 64;
    unint64_t v17 = *(void *)(v10 + 64 + 8 * v14);
    if (v17)
    {
LABEL_7:
      uint64_t v8 = (v17 - 1) & v17;
      unint64_t v9 = __clz(__rbit64(v17)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v18 = v7 + 2;
    ++v7;
    if (v14 + 1 < v15)
    {
      unint64_t v17 = *(void *)(v16 + 8 * v18);
      if (v17)
      {
LABEL_10:
        int64_t v14 = v18;
        goto LABEL_7;
      }
      int64_t v7 = v14 + 1;
      if (v14 + 2 < v15)
      {
        unint64_t v17 = *(void *)(v16 + 8 * (v14 + 2));
        if (v17)
        {
          v14 += 2;
          goto LABEL_7;
        }
        int64_t v18 = v14 + 3;
        int64_t v7 = v14 + 2;
        if (v14 + 3 < v15)
        {
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (v17) {
            goto LABEL_10;
          }
          while (1)
          {
            int64_t v14 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              break;
            }
            if (v14 >= v15)
            {
              int64_t v7 = v15 - 1;
              goto LABEL_21;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v14);
            ++v18;
            if (v17) {
              goto LABEL_7;
            }
          }
LABEL_32:
          __break(1u);
          return MEMORY[0x1F4188298](v3, v4, v5);
        }
      }
    }
  }
LABEL_21:
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 112) + 56))(*(void *)(v0 + 136), 1, 1);
  uint64_t v8 = 0;
LABEL_22:
  *(void *)(v0 + 256) = v7;
  *(void *)(v0 + 264) = v8;
  uint64_t v19 = *(void *)(v0 + 136);
  uint64_t v20 = *(void *)(v0 + 104);
  uint64_t v21 = 1;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 112) + 48))(v19, 1, v20) != 1)
  {
    uint64_t v22 = *(void *)(v0 + 144);
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v24 = *(int *)(v20 + 48);
    unint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
    v25(v23, v19, v2);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = *(_OWORD *)(v19 + v24);
    os_log_type_t v27 = (uint64_t (**)(char))(v22 + *(int *)(v20 + 48));
    v25(v22, v23, v2);
    uint64_t v21 = 0;
    *os_log_type_t v27 = sub_19C95DB68;
    v27[1] = (uint64_t (*)(char))v26;
    uint64_t v20 = *(void *)(v0 + 104);
  }
  uint64_t v29 = *(void *)(v0 + 144);
  uint64_t v28 = *(void *)(v0 + 152);
  uint64_t v30 = *(void *)(v0 + 120);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v29, v21, 1, v20);
  sub_19C95DAC8(v29, v28);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v20) != 1)
  {
    uint64_t v33 = (void *)(*(void *)(v0 + 152) + *(int *)(*(void *)(v0 + 104) + 48));
    *(void *)(v0 + 272) = *v33;
    *(void *)(v0 + 280) = v33[1];
    sub_19C976AA0();
    *(void *)(v0 + 288) = sub_19C976A90();
    uint64_t v34 = sub_19C976A50();
    uint64_t v36 = v35;
    uint64_t v3 = sub_19C95BF44;
    uint64_t v4 = v34;
    uint64_t v5 = v36;
    return MEMORY[0x1F4188298](v3, v4, v5);
  }
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
  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t NetworkMonitor.deinit()
{
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
    sub_19C976AD0();
    swift_release();
  }
  swift_release();
  sub_19C8E00AC(v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath, &qword_1EB516A88);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t NetworkMonitor.__deallocating_deinit()
{
  if (*(void *)(v0 + 112))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
    sub_19C976AD0();
    swift_release();
  }
  swift_release();
  sub_19C8E00AC(v0 + OBJC_IVAR____TtC8TipsCore14NetworkMonitor_lastNetworkPath, &qword_1EB516A88);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t NetworkMonitor.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_19C95C678()
{
  return v0;
}

unint64_t sub_19C95C684(uint64_t a1, uint64_t a2)
{
  sub_19C977090();
  sub_19C976910();
  uint64_t v4 = sub_19C9770C0();
  return sub_19C95CE20(a1, a2, v4);
}

unint64_t sub_19C95C6FC(uint64_t a1)
{
  uint64_t v2 = sub_19C976DA0();
  return sub_19C95CF04(a1, v2);
}

uint64_t sub_19C95C740(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_19C8E05CC(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19C95CFD8();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_19C9765A0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_19C95C950(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_19C95C84C(uint64_t a1, uint64_t a2)
{
  return sub_19C95C864(a1, a2, &qword_1E94144A0);
}

uint64_t sub_19C95C858(uint64_t a1, uint64_t a2)
{
  return sub_19C95C864(a1, a2, &qword_1E9414480);
}

uint64_t sub_19C95C864(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  char v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_19C95C684(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  *char v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_19C95D91C(a3);
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_19C95CC48(v8, v11);
  *char v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_19C95C944(uint64_t a1, uint64_t a2)
{
  return sub_19C95C864(a1, a2, &qword_1E9414470);
}

unint64_t sub_19C95C950(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_19C9765A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_19C976D40();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      char v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_19C95DBFC(&qword_1E9413BC0, MEMORY[0x1E4F27990]);
        uint64_t v17 = sub_19C976820();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (_OWORD *)(v22 + 16 * a1);
            uint64_t v24 = (_OWORD *)(v22 + 16 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    unint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *unint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_19C95CC48(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_19C976D40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_19C977090();
        swift_bridgeObjectRetain();
        sub_19C976910();
        uint64_t v9 = sub_19C9770C0();
        unint64_t result = swift_bridgeObjectRelease();
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

unint64_t sub_19C95CE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_19C976FB0() & 1) == 0)
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
      while (!v14 && (sub_19C976FB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_19C95CF04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_19C95DBA0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x19F39D950](v9, a1);
      sub_19C938C54((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_19C95CFCC()
{
  return sub_19C95D91C((uint64_t *)&unk_1E94144A8);
}

void *sub_19C95CFD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C9765A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C38);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_19C976EC0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v24 = v1;
  unint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    unint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v25 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 16 * v16;
    unint64_t v19 = *(void *)(v8 + 48) + v17;
    uint64_t v20 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    long long v28 = *(_OWORD *)(*(void *)(v6 + 56) + v18);
    v20(v19, v5, v2);
    *(_OWORD *)(*(void *)(v8 + 56) + v18) = v28;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_19C95D280()
{
  return type metadata accessor for NetworkMonitor();
}

uint64_t method lookup function for NetworkMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NetworkMonitor);
}

uint64_t dispatch thunk of NetworkMonitor.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of NetworkMonitor.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of NetworkMonitor.addObserver(for:using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of NetworkMonitor.removeObserver(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkReachable.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 224) + **(int **)(*(void *)v0 + 224));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95D424;
  return v4();
}

uint64_t sub_19C95D424(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkConstrained.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 232) + **(int **)(*(void *)v0 + 232));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95D424;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.isNetworkExpensive.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 240) + **(int **)(*(void *)v0 + 240));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95DC44;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.usesCellularConnection.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 248) + **(int **)(*(void *)v0 + 248));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95DC44;
  return v4();
}

uint64_t dispatch thunk of NetworkMonitor.usesWifiConnection.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 256) + **(int **)(*(void *)v0 + 256));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95DC44;
  return v4();
}

id sub_19C95D8F8()
{
  return sub_19C95D91C(&qword_1E94144A0);
}

id sub_19C95D904()
{
  return sub_19C95D91C(&qword_1E9414480);
}

id sub_19C95D910()
{
  return sub_19C95D91C(&qword_1E9414470);
}

id sub_19C95D91C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_19C976EC0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    int64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_19C95DAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_19C95DB30()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C95DB68(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t sub_19C95DBA0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_19C95DBFC(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL static AssistantSupportClient.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AssistantSupportClient.Error.hash(into:)()
{
  return sub_19C9770A0();
}

uint64_t AssistantSupportClient.Error.hashValue.getter()
{
  return sub_19C9770C0();
}

uint64_t AssistantSupportClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AssistantSupportClient.init()();
  return v0;
}

uint64_t AssistantSupportClient.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_19C976BC0();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_19C976750();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = sub_19C976BE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C95E1BC();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC68], v4);
  sub_19C976730();
  v14[1] = MEMORY[0x1E4FBC860];
  sub_19C95E1FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
  sub_19C94BFFC();
  sub_19C976D30();
  *(void *)(v0 + 16) = sub_19C976C10();
  id v8 = objc_allocWithZone((Class)TPSServiceConnection);
  uint64_t v9 = (void *)sub_19C976880();
  id v10 = objc_msgSend(v8, sel_initWithServiceName_, v9);

  *(void *)(v1 + 24) = v10;
  id v11 = v10;
  id v12 = _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0();
  objc_msgSend(v11, sel_setRemoteInterfaceInstance_, v12);

  return v1;
}

unint64_t sub_19C95E1BC()
{
  unint64_t result = qword_1EB516C78;
  if (!qword_1EB516C78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB516C78);
  }
  return result;
}

unint64_t sub_19C95E1FC()
{
  unint64_t result = qword_1EB516C70;
  if (!qword_1EB516C70)
  {
    sub_19C976BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516C70);
  }
  return result;
}

uint64_t AssistantSupportClient.findMatchingResultId(from:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_19C95E274, 0, 0);
}

uint64_t sub_19C95E274()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_19C95E368;
  uint64_t v4 = v0[3];
  v3[7] = v2;
  v3[8] = v4;
  v3[5] = 0x800000019C986B80;
  void v3[6] = sub_19C95FE70;
  v3[4] = 0xD00000000000001BLL;
  return MEMORY[0x1F4188298](sub_19C95E83C, 0, 0);
}

uint64_t sub_19C95E368(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 48) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x1F4188298](sub_19C95E4D4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(a1, a2);
  }
}

uint64_t sub_19C95E4D4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_19C95E538(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  type metadata accessor for ResultContext();
  uint64_t v7 = (void *)sub_19C9769D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19C9603C8;
  void aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C95E77C;
  aBlock[3] = &block_descriptor_48;
  id v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_findMatchingResultIdFromContexts_reply_, v7, v10);
  _Block_release(v10);
}

uint64_t sub_19C95E704(int a1, int a2, id a3)
{
  if (a3)
  {
    id v3 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B8);
    return sub_19C976A60();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B8);
    return sub_19C976A70();
  }
}

uint64_t sub_19C95E77C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_19C9768B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_19C95E814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return MEMORY[0x1F4188298](sub_19C95E83C, 0, 0);
}

uint64_t sub_19C95E83C()
{
  if (objc_msgSend(self, sel_allowsDE))
  {
    uint64_t v1 = *(void *)(v0 + 64);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    long long v3 = *(_OWORD *)(v0 + 48);
    *(void *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B0);
    *uint64_t v4 = v0;
    v4[1] = sub_19C95E9B0;
    uint64_t v6 = *(void *)(v0 + 32);
    uint64_t v7 = *(void *)(v0 + 40);
    return MEMORY[0x1F4188160](v0 + 16, 0, 0, v6, v7, sub_19C9602CC, v2, v5);
  }
  else
  {
    sub_19C96002C();
    swift_allocError();
    *id v8 = 0;
    swift_willThrow();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_19C95E9B0()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19C95EAF0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = v2[2];
    uint64_t v4 = v2[3];
    uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))v2[1];
    return v5(v3, v4);
  }
}

uint64_t sub_19C95EAF0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19C95EB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return MEMORY[0x1F4188298](sub_19C95EB7C, 0, 0);
}

uint64_t sub_19C95EB7C()
{
  if (objc_msgSend(self, sel_allowsDE))
  {
    uint64_t v1 = *(void *)(v0 + 56);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    long long v3 = *(_OWORD *)(v0 + 40);
    *(void *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
    *uint64_t v4 = v0;
    v4[1] = sub_19C95ECF0;
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = *(void *)(v0 + 32);
    return MEMORY[0x1F4188160](v0 + 16, 0, 0, v6, v7, sub_19C960174, v2, v5);
  }
  else
  {
    sub_19C96002C();
    swift_allocError();
    *id v8 = 0;
    swift_willThrow();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_19C95ECF0()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19C95EE30, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = v2[2];
    uint64_t v4 = (uint64_t (*)(uint64_t))v2[1];
    return v4(v3);
  }
}

uint64_t sub_19C95EE30()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19C95EE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return MEMORY[0x1F4188298](sub_19C95EEBC, 0, 0);
}

uint64_t sub_19C95EEBC()
{
  if (objc_msgSend(self, sel_allowsDE))
  {
    uint64_t v1 = *(void *)(v0 + 56);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    long long v3 = *(_OWORD *)(v0 + 40);
    *(void *)(v2 + 16) = v1;
    *(_OWORD *)(v2 + 24) = v3;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414990);
    *uint64_t v4 = v0;
    v4[1] = sub_19C95F030;
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = *(void *)(v0 + 32);
    return MEMORY[0x1F4188160](v0 + 16, 0, 0, v6, v7, sub_19C960080, v2, v5);
  }
  else
  {
    sub_19C96002C();
    swift_allocError();
    *id v8 = 0;
    swift_willThrow();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_19C95F030()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19C960454, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = v2[2];
    uint64_t v4 = (uint64_t (*)(uint64_t))v2[1];
    return v4(v3);
  }
}

uint64_t AssistantSupportClient.availableUserGuideIdentifiers()()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19C95F248;
  v2[6] = 0;
  v2[7] = v0;
  v2[4] = 0x800000019C986BA0;
  v2[5] = sub_19C95F348;
  v2[3] = 0xD00000000000001FLL;
  return MEMORY[0x1F4188298](sub_19C95EB7C, 0, 0);
}

uint64_t sub_19C95F248(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

void sub_19C95F348(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149A8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19C960258;
  void aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C9624F0;
  aBlock[3] = &block_descriptor_34;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_availableUserGuideIdentifiersWithReply_, v9);
  _Block_release(v9);
}

uint64_t sub_19C95F4F0()
{
  return sub_19C976A70();
}

uint64_t AssistantSupportClient.fetchDocument(identifier:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_19C95F55C, 0, 0);
}

uint64_t sub_19C95F55C()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19C95F658;
  uint64_t v5 = v0[4];
  v4[6] = v3;
  v4[7] = v5;
  v4[4] = 0x800000019C986BC0;
  v4[5] = sub_19C95FE78;
  v4[3] = 0xD00000000000001ALL;
  return MEMORY[0x1F4188298](sub_19C95EEBC, 0, 0);
}

uint64_t sub_19C95F658(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_19C95F7B0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_19C95F7B0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_19C95F814(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414998);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (void *)sub_19C976880();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_19C9600F0;
  void aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C95FA50;
  aBlock[3] = &block_descriptor_20;
  id v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_fetchDocumentWithIdentifier_reply_, v7, v10);
  _Block_release(v10);
}

uint64_t sub_19C95F9DC(void *a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414998);
    return sub_19C976A60();
  }
  else
  {
    id v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414998);
    return sub_19C976A70();
  }
}

void sub_19C95FA50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t AssistantSupportClient.deinit()
{
  return v0;
}

uint64_t AssistantSupportClient.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t sub_19C95FB44(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v23[1] = a4;
  unint64_t v24 = a3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  id v15 = objc_msgSend(*(id *)(a2 + 24), sel_connection);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v17 + v16, (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = a7;
  void aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C95FE08;
  aBlock[3] = a8;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  id v19 = objc_msgSend(v15, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);

  sub_19C976D10();
  swift_unknownObjectRelease();
  sub_19C8F5FF4((uint64_t)aBlock, (uint64_t)v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149A0);
  if (swift_dynamicCast())
  {
    v24(v25, a1);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_19C96002C();
    uint64_t v20 = swift_allocError();
    unsigned char *v21 = 1;
    v26[0] = v20;
    sub_19C976A60();
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
}

uint64_t sub_19C95FDC0(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_19C976A60();
}

void sub_19C95FE08(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_19C95FE70(void *a1, uint64_t a2)
{
}

void sub_19C95FE78(void *a1, uint64_t a2)
{
}

unint64_t sub_19C95FE84()
{
  unint64_t result = qword_1E9414980;
  if (!qword_1E9414980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414980);
  }
  return result;
}

uint64_t type metadata accessor for AssistantSupportClient()
{
  return self;
}

uint64_t method lookup function for AssistantSupportClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssistantSupportClient);
}

uint64_t dispatch thunk of AssistantSupportClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for AssistantSupportClient.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x19C95FFF4);
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

ValueMetadata *type metadata accessor for AssistantSupportClient.Error()
{
  return &type metadata for AssistantSupportClient.Error;
}

unint64_t sub_19C96002C()
{
  unint64_t result = qword_1E9414988;
  if (!qword_1E9414988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414988);
  }
  return result;
}

uint64_t sub_19C960080(uint64_t a1)
{
  return sub_19C95FB44(a1, *(void *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_1E9414998, (uint64_t)&unk_1EED86450, (uint64_t)sub_19C9600D8, (uint64_t)&block_descriptor_4);
}

uint64_t sub_19C9600CC()
{
  return objectdestroyTm(&qword_1E9414998);
}

uint64_t sub_19C9600D8(void *a1)
{
  return sub_19C9601D8(a1, &qword_1E9414998);
}

uint64_t sub_19C9600E4()
{
  return objectdestroyTm(&qword_1E9414998);
}

uint64_t sub_19C9600F0(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414998);
  return sub_19C95F9DC(a1, a2);
}

uint64_t sub_19C960174(uint64_t a1)
{
  return sub_19C95FB44(a1, *(void *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_1E94149A8, (uint64_t)&unk_1EED864F0, (uint64_t)sub_19C9601CC, (uint64_t)&block_descriptor_28);
}

uint64_t sub_19C9601C0()
{
  return objectdestroyTm(&qword_1E94149A8);
}

uint64_t sub_19C9601CC(void *a1)
{
  return sub_19C9601D8(a1, &qword_1E94149A8);
}

uint64_t sub_19C9601D8(void *a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_19C95FDC0(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_19C96024C()
{
  return objectdestroyTm(&qword_1E94149A8);
}

uint64_t sub_19C960258()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149A8);
  return sub_19C95F4F0();
}

uint64_t sub_19C9602CC(uint64_t a1)
{
  return sub_19C95FB44(a1, *(void *)(v1 + 16), *(void (**)(uint64_t, uint64_t))(v1 + 24), *(void *)(v1 + 32), &qword_1E94149B8, (uint64_t)&unk_1EED86590, (uint64_t)sub_19C960324, (uint64_t)&block_descriptor_42);
}

uint64_t sub_19C960318()
{
  return objectdestroyTm(&qword_1E94149B8);
}

uint64_t sub_19C960324(void *a1)
{
  return sub_19C9601D8(a1, &qword_1E94149B8);
}

uint64_t sub_19C960330()
{
  return objectdestroyTm(&qword_1E94149B8);
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
  return MEMORY[0x1F4186498](v1, v6, v7);
}

uint64_t sub_19C9603C8(int a1, int a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B8);
  return sub_19C95E704(a1, a2, a3);
}

uint64_t sub_19C9604FC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_19C9605C0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19C960638()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuideTopic_topicId);
}

uint64_t sub_19C96065C()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuideTopic_version);
}

void sub_19C960674()
{
  qword_1E9413C78 = 0x32766470682D78;
  unk_1E9413C80 = 0xE700000000000000;
}

unint64_t static UserGuideTopic.uti.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_19C96084C()
{
  uint64_t v1 = sub_19C9765A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR___TPSUserGuideTopic_topicId);
  swift_beginAccess();
  if (v5[1])
  {
    uint64_t v6 = *v5;
  }
  else
  {
    sub_19C976590();
    uint64_t v6 = sub_19C976570();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_19C960978()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t sub_19C960990(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t (*sub_19C96099C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_19C960A04()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t sub_19C960A1C(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t (*sub_19C960A28())()
{
  return j__swift_endAccess;
}

BOOL static UserGuideTopic.isValidIdentifier(_:)()
{
  objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
  swift_bridgeObjectRetain();
  id v0 = UserGuideTopic.init(searchableItemUniqueIdentifier:)();
  id v1 = v0;
  if (v0) {

  }
  return v1 != 0;
}

id UserGuideTopic.__allocating_init(searchableItemUniqueIdentifier:)()
{
  id v1 = objc_allocWithZone(v0);
  return UserGuideTopic.init(searchableItemUniqueIdentifier:)();
}

uint64_t sub_19C960B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v40 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_19C976210();
  uint64_t v7 = *(void *)(v42 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v42);
  uint64_t v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v41 = (char *)&v38 - v10;
  uint64_t v43 = sub_19C9762D0();
  uint64_t v11 = *(void *)(v43 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v43);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  unint64_t v16 = (char *)&v38 - v15;
  sub_19C9762C0();
  if (qword_1E9413C88 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_19C9762A0();
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  swift_bridgeObjectRetain();
  sub_19C976920();
  uint64_t v17 = v44;
  uint64_t v18 = v45;
  swift_beginAccess();
  uint64_t v44 = v17;
  uint64_t v45 = v18;
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  MEMORY[0x19F39CE20](v44, v45);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9413C90);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v38 = *(void *)(v7 + 72);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_19C980A20;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_19C9761E0();
  swift_bridgeObjectRelease();
  sub_19C976240();
  uint64_t v20 = v2 + OBJC_IVAR___TPSUserGuideTopic_version;
  swift_beginAccess();
  uint64_t v21 = v43;
  if (*(void *)(v20 + 8))
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = v41;
    sub_19C9761E0();
    swift_bridgeObjectRelease();
    unint64_t v24 = (void (*)(uint64_t *, void))sub_19C976220();
    if (*v23)
    {
      uint64_t v25 = v23;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v39, v22, v42);
      unint64_t v26 = *v25;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v25 = v26;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v26 = sub_19C949C7C(0, *(void *)(v26 + 16) + 1, 1, v26);
        *uint64_t v25 = v26;
      }
      unint64_t v29 = *(void *)(v26 + 16);
      unint64_t v28 = *(void *)(v26 + 24);
      if (v29 >= v28 >> 1)
      {
        unint64_t v26 = sub_19C949C7C(v28 > 1, v29 + 1, 1, v26);
        *uint64_t v25 = v26;
      }
      *(void *)(v26 + 16) = v29 + 1;
      unint64_t v30 = v26 + v19 + v29 * v38;
      uint64_t v31 = v42;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v30, v39, v42);
      v24(&v44, 0);
      uint64_t v21 = v43;
      unint64_t v22 = v41;
    }
    else
    {
      v24(&v44, 0);
      uint64_t v31 = v42;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v31);
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v21);
  uint64_t v32 = (uint64_t)v40;
  sub_19C976260();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
  v33(v14, v21);
  uint64_t v34 = sub_19C976480();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v34) == 1)
  {
    v33(v16, v21);
    sub_19C8E00AC(v32, &qword_1EB516C18);
    return 0;
  }
  else
  {
    uint64_t v36 = sub_19C976400();
    v33(v16, v21);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v32, v34);
  }
  return v36;
}

id UserGuideTopic.__allocating_init(productIdentifier:topicIdentifier:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR___TPSUserGuideTopic_topicId];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v13[OBJC_IVAR___TPSUserGuideTopic_version];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  unint64_t v16 = &v13[OBJC_IVAR___TPSUserGuideTopic_title];
  *(void *)unint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = &v13[OBJC_IVAR___TPSUserGuideTopic_body];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = &v13[OBJC_IVAR___TPSUserGuideTopic_productId];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  swift_beginAccess();
  *(void *)uint64_t v14 = a3;
  *((void *)v14 + 1) = a4;
  unint64_t v19 = v13;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v15 = a5;
  *((void *)v15 + 1) = a6;

  swift_bridgeObjectRelease();
  v21.receiver = v19;
  v21.super_class = v6;
  return objc_msgSendSuper2(&v21, sel_init);
}

id UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = &v6[OBJC_IVAR___TPSUserGuideTopic_topicId];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v6[OBJC_IVAR___TPSUserGuideTopic_version];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v6[OBJC_IVAR___TPSUserGuideTopic_title];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = &v6[OBJC_IVAR___TPSUserGuideTopic_body];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v6[OBJC_IVAR___TPSUserGuideTopic_productId];
  *(void *)uint64_t v15 = a1;
  *((void *)v15 + 1) = a2;
  swift_beginAccess();
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  unint64_t v16 = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v12 = a5;
  *((void *)v12 + 1) = a6;

  swift_bridgeObjectRelease();
  v18.receiver = v16;
  v18.super_class = (Class)type metadata accessor for UserGuideTopic();
  return objc_msgSendSuper2(&v18, sel_init);
}

id UserGuideTopic.init(searchableItemUniqueIdentifier:)()
{
  uint64_t v54 = sub_19C976210();
  uint64_t v50 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  uint64_t v52 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145C8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19C9762D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t *)&v0[OBJC_IVAR___TPSUserGuideTopic_topicId];
  uint64_t *v9 = 0;
  v9[1] = 0;
  uint64_t v53 = v9;
  uint64_t v10 = (uint64_t *)&v0[OBJC_IVAR___TPSUserGuideTopic_version];
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = v10;
  uint64_t v12 = &v0[OBJC_IVAR___TPSUserGuideTopic_title];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v0[OBJC_IVAR___TPSUserGuideTopic_body];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = v0;
  sub_19C9762B0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    uint64_t v51 = v14;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v16 = sub_19C976290();
    uint64_t v17 = v15;
    if (qword_1E9413C88 == -1)
    {
      objc_super v18 = v52;
      if (!v15) {
        goto LABEL_31;
      }
    }
    else
    {
      swift_once();
      objc_super v18 = v52;
      if (!v17) {
        goto LABEL_31;
      }
    }
    if (v16 == qword_1E9413C78 && v17 == unk_1E9413C80)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = sub_19C976FB0();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0) {
        goto LABEL_31;
      }
    }
    uint64_t v20 = sub_19C976270();
    if (v21)
    {
      uint64_t v57 = v20;
      uint64_t v58 = v21;
      uint64_t v55 = 46;
      unint64_t v56 = 0xE100000000000000;
      sub_19C93E418();
      unint64_t v22 = (void *)sub_19C976CD0();
      swift_bridgeObjectRelease();
      if (v22[2] > 1uLL)
      {
        uint64_t v24 = v22[6];
        uint64_t v23 = v22[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v25 = &v51[OBJC_IVAR___TPSUserGuideTopic_productId];
        *(void *)uint64_t v25 = v24;
        *((void *)v25 + 1) = v23;
        uint64_t v26 = sub_19C976230();
        if (v26)
        {
          uint64_t v47 = v8;
          uint64_t v48 = v6;
          uint64_t v27 = v5;
          uint64_t v28 = *(void *)(v26 + 16);
          if (v28)
          {
            uint64_t v29 = v50;
            unint64_t v30 = v26 + ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80));
            swift_beginAccess();
            swift_beginAccess();
            uint64_t v31 = *(void *)(v29 + 16);
            v29 += 16;
            uint64_t v49 = *(void *)(v29 + 56);
            uint64_t v50 = v31;
            uint64_t v32 = (void (**)(char *, uint64_t))(v29 - 8);
            do
            {
              ((void (*)(char *, unint64_t, uint64_t))v50)(v18, v30, v54);
              uint64_t v34 = sub_19C9761F0();
              uint64_t v35 = v33;
              if (v34 == 0x64496369706F74 && v33 == 0xE700000000000000 || (sub_19C976FB0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                uint64_t v36 = sub_19C976200();
                uint64_t v38 = v37;
                (*v32)(v18, v54);
                uint64_t v39 = v53;
                *uint64_t v53 = v36;
                v39[1] = v38;
              }
              else
              {
                if (v34 == 0x6E6F6973726576 && v35 == 0xE700000000000000)
                {
                  swift_bridgeObjectRelease();
                }
                else
                {
                  char v40 = sub_19C976FB0();
                  swift_bridgeObjectRelease();
                  if ((v40 & 1) == 0)
                  {
                    (*v32)(v18, v54);
                    goto LABEL_19;
                  }
                }
                uint64_t v41 = sub_19C976200();
                uint64_t v43 = v42;
                (*v32)(v18, v54);
                *uint64_t v11 = v41;
                v11[1] = v43;
              }
              swift_bridgeObjectRelease();
LABEL_19:
              v30 += v49;
              --v28;
            }
            while (v28);
          }
          swift_bridgeObjectRelease();
          uint64_t v5 = v27;
          uint64_t v8 = v47;
          uint64_t v6 = v48;
        }
        id v44 = v51;

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        uint64_t v45 = (objc_class *)type metadata accessor for UserGuideTopic();
        v59.receiver = v44;
        v59.super_class = v45;
        return objc_msgSendSuper2(&v59, sel_init);
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_bridgeObjectRelease();
LABEL_32:
      uint64_t v14 = v51;
      goto LABEL_33;
    }
LABEL_31:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_32;
  }
  sub_19C8E00AC((uint64_t)v4, &qword_1E94145C8);
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  type metadata accessor for UserGuideTopic();
  swift_deallocPartialClassInstance();
  return 0;
}

id UserGuideTopic.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void UserGuideTopic.init()()
{
}

id UserGuideTopic.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserGuideTopic();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UserGuideTopic.supportSiteURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_19C9763F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976460();
  uint64_t v11 = sub_19C976480();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(void, void, void))(v12 + 48);
  if (v13(v10, 1, v11) == 1)
  {
    sub_19C8E00AC((uint64_t)v10, &qword_1EB516C18);
    uint64_t v14 = 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
    uint64_t v15 = swift_allocObject();
    uint64_t v25 = v13;
    uint64_t v16 = v15;
    *(_OWORD *)(v15 + 16) = xmmword_19C9809B0;
    *(void *)(v15 + 32) = 0x6564697567;
    *(void *)(v15 + 40) = 0xE500000000000000;
    uint64_t v27 = a1;
    uint64_t v17 = (uint64_t *)(v2 + OBJC_IVAR___TPSUserGuideTopic_productId);
    swift_beginAccess();
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    *(void *)(v16 + 48) = v18;
    *(void *)(v16 + 56) = v19;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F276C0], v4);
    sub_19C93E418();
    uint64_t v26 = v12 + 48;
    a1 = v27;
    swift_bridgeObjectRetain();
    sub_19C976470();
    uint64_t v13 = v25;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    uint64_t v14 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a1, v14, 1, v11);
  uint64_t v20 = (uint64_t *)(v2 + OBJC_IVAR___TPSUserGuideTopic_topicId);
  uint64_t result = swift_beginAccess();
  uint64_t v22 = v20[1];
  if (v22)
  {
    uint64_t v23 = *v20;
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a1, 1, v11);
    if (!result)
    {
      uint64_t v28 = v23;
      uint64_t v29 = v22;
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F276C0], v4);
      sub_19C93E418();
      swift_bridgeObjectRetain();
      sub_19C976440();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_19C962168@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_19C9621C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_topicId, a2);
}

uint64_t sub_19C9621D0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_topicId);
}

uint64_t sub_19C9621F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_version, a2);
}

uint64_t sub_19C9621FC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_version);
}

uint64_t sub_19C96221C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_title, a2);
}

uint64_t sub_19C962228(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_title);
}

uint64_t sub_19C962248@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPSUserGuideTopic_body, a2);
}

uint64_t sub_19C962254(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19C9371A8(a1, a2, a3, a4, &OBJC_IVAR___TPSUserGuideTopic_body);
}

uint64_t method lookup function for UserGuideTopic(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for UserGuideTopic);
}

uint64_t dispatch thunk of UserGuideTopic.productId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of UserGuideTopic.topicId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of UserGuideTopic.version.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of UserGuideTopic.identifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of UserGuideTopic.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of UserGuideTopic.title.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of UserGuideTopic.title.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of UserGuideTopic.body.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of UserGuideTopic.body.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of UserGuideTopic.body.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of UserGuideTopic.searchableItemUniqueIdentifier(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of UserGuideTopic.__allocating_init(productIdentifier:topicIdentifier:version:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of UserGuideTopic.__allocating_init(searchableItemUniqueIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t sub_19C9624F0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_19C9769E0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_19C962560()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SearchQueryManager()), sel_init);
  qword_1E94149E8 = (uint64_t)result;
  return result;
}

id SearchQueryManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static SearchQueryManager.shared.getter()
{
  if (qword_1E94143B0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E94149E8;
  return v0;
}

id SearchQueryManager.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_19C976BE0();
  uint64_t v1 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_19C976BC0();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_19C976750();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v10 = OBJC_IVAR___TPSSearchQueryManager_syncQueue;
  v9[1] = sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C78);
  uint64_t v6 = v0;
  sub_19C976730();
  uint64_t v14 = MEMORY[0x1E4FBC860];
  sub_19C8E06AC((unint64_t *)&qword_1EB516C70, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
  sub_19C957A2C((unint64_t *)&qword_1EB516C60, &qword_1EB516C58);
  sub_19C976D30();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v11);
  *(void *)&v0[v10] = sub_19C976C10();
  uint64_t v7 = OBJC_IVAR___TPSSearchQueryManager_pendingQueries;
  *(void *)&v6[v7] = sub_19C9357F8(MEMORY[0x1E4FBC860]);

  v13.receiver = v6;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t sub_19C962948(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v21[0] = a2;
  uint64_t v7 = sub_19C976720();
  uint64_t v23 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_19C976750();
  uint64_t v10 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v13 = &a1[OBJC_IVAR___TPSSearchQuery_identifier];
  swift_beginAccess();
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  v21[1] = *(void *)(v4 + OBJC_IVAR___TPSSearchQueryManager_syncQueue);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = v15;
  v17[4] = v14;
  v17[5] = a1;
  v17[6] = v21[0];
  v17[7] = a3;
  aBlock[4] = sub_19C965A9C;
  void aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C942FD0;
  aBlock[3] = &block_descriptor_19;
  uint64_t v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v19 = a1;
  swift_retain();
  sub_19C976730();
  uint64_t v24 = MEMORY[0x1E4FBC860];
  sub_19C8E06AC((unint64_t *)&qword_1E94146B8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94146C0);
  sub_19C957A2C((unint64_t *)&qword_1E94146C8, &qword_1E94146C0);
  sub_19C976D30();
  MEMORY[0x19F39D7A0](0, v12, v9, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  swift_release();
  return swift_release();
}

void sub_19C962C84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a1 + 16;
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x19F39E8A0](v11);
  if (v12)
  {
    objc_super v13 = (char *)v12;
    uint64_t v14 = (uint64_t *)(v12 + OBJC_IVAR___TPSSearchQueryManager_pendingQueries);
    swift_beginAccess();
    uint64_t v15 = (void *)sub_19C95C858(a2, a3);
    swift_endAccess();
    if (v15)
    {
      sub_19C962E74();
    }
    uint64_t v16 = *(void **)&v13[OBJC_IVAR___TPSSearchQueryManager_syncQueue];
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = v13;
    v17[3] = a2;
    v17[4] = a3;
    v17[5] = a5;
    v17[6] = a6;
    id v18 = objc_allocWithZone((Class)type metadata accessor for CoreSpotlightQuery());
    id v19 = a4;
    id v20 = v16;
    uint64_t v21 = v13;
    swift_bridgeObjectRetain();
    swift_retain();
    id v22 = sub_19C96760C(v19, v20, (uint64_t)sub_19C965AF4, (uint64_t)v17);

    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v23 = v22;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *v14;
    *uint64_t v14 = 0x8000000000000000;
    sub_19C9367E4((uint64_t)v23, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v14 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_19C963198();
  }
}

id sub_19C962E74()
{
  uint64_t v1 = sub_19C9767B0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (uint64_t *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_19C9767D0();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    if (qword_1E9414348 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v7 = (id)qword_1E9414628;
  os_log_type_t v8 = sub_19C976B90();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v12 = sub_19C8F5F20(0xD000000000000021, 0x800000019C986E90, &v13);
    sub_19C976CB0();
    _os_log_impl(&dword_19C8DC000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v10, -1, -1);
    MEMORY[0x19F39E7F0](v9, -1, -1);
  }

  id result = *(id *)(v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query);
  if (result) {
    return objc_msgSend(result, sel_cancel);
  }
  return result;
}

void sub_19C9630DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  if (a1)
  {
    id v10 = a1;
    ((void (*)(void *, void))a6)(a1, 0);
  }
  else
  {
    a6();
  }
  swift_beginAccess();
  uint64_t v11 = (void *)sub_19C95C858(a4, a5);
  swift_endAccess();
}

void sub_19C963198()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19C9767B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  os_log_type_t v8 = (uint64_t *)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
  *os_log_type_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4FBCBF0], v5);
  id v10 = v9;
  LOBYTE(v9) = sub_19C9767D0();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  os_log_type_t v8 = (void *)0xD000000000000015;
  uint64_t v11 = OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query;
  if (*(void *)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query))
  {
    if (qword_1E9414348 == -1)
    {
LABEL_4:
      uint64_t aBlock = 0;
      unint64_t v54 = 0xE000000000000000;
      uint64_t v12 = (id)qword_1E9414628;
      sub_19C976E10();
      swift_bridgeObjectRelease();
      uint64_t v59 = (uint64_t)v8 + 2;
      unint64_t v60 = 0x800000019C986EC0;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_19C976920();
      swift_bridgeObjectRelease();
      uint64_t v14 = v59;
      unint64_t v13 = v60;
      os_log_type_t v15 = sub_19C976BA0();
      if (os_log_type_enabled(v12, v15))
      {
        swift_bridgeObjectRetain_n();
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v59 = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v61 = sub_19C8F5F20(v14, v13, &v59);
        sub_19C976CB0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19C8DC000, v12, v15, "%s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F39E7F0](v17, -1, -1);
        MEMORY[0x19F39E7F0](v16, -1, -1);
      }

      swift_bridgeObjectRelease();
      return;
    }
LABEL_17:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v18 = *(void *)(v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery);
  id v19 = sub_19C9410B4();
  id v20 = *(void **)(v1 + v11);
  *(void *)(v1 + v11) = v19;
  id v21 = v19;

  if (qword_1E9414348 != -1) {
    swift_once();
  }
  id v22 = (id)qword_1E9414628;
  os_log_type_t v23 = sub_19C976B80();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v52 = v4;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t aBlock = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v59 = sub_19C8F5F20(0xD000000000000022, 0x800000019C986EE0, &aBlock);
    sub_19C976CB0();
    _os_log_impl(&dword_19C8DC000, v22, v23, "%s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v26, -1, -1);
    MEMORY[0x19F39E7F0](v25, -1, -1);
  }

  uint64_t aBlock = 0;
  unint64_t v54 = 0xE000000000000000;
  uint64_t v27 = (id)qword_1E9414628;
  sub_19C976E10();
  sub_19C976920();
  id v28 = objc_msgSend(v21, sel_queryString);
  if (v28)
  {
    uint64_t v29 = v28;
    sub_19C9768B0();
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  unint64_t v30 = (uint64_t *)(v18 + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  uint64_t v61 = *v30;
  sub_19C976F90();
  sub_19C976920();
  swift_bridgeObjectRelease();
  uint64_t v32 = aBlock;
  unint64_t v31 = v54;
  os_log_type_t v33 = sub_19C976B90();
  if (os_log_type_enabled(v27, v33))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t aBlock = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_19C8F5F20(v32, v31, &aBlock);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v27, v33, "%s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v35, -1, -1);
    MEMORY[0x19F39E7F0](v34, -1, -1);
  }

  swift_bridgeObjectRelease();
  uint64_t v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v37 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v36;
  *(void *)(v38 + 24) = v37;
  uint64_t v57 = sub_19C96777C;
  uint64_t v58 = v38;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v54 = 1107296256;
  uint64_t v55 = sub_19C9624F0;
  unint64_t v56 = &block_descriptor_34_0;
  uint64_t v39 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setCompletionsHandler_, v39);
  _Block_release(v39);
  uint64_t v40 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v40;
  *(void *)(v42 + 24) = v41;
  uint64_t v57 = sub_19C967788;
  uint64_t v58 = v42;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v54 = 1107296256;
  uint64_t v55 = sub_19C964A10;
  unint64_t v56 = &block_descriptor_42_0;
  uint64_t v43 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setFoundItemsHandler_, v43);
  _Block_release(v43);
  uint64_t v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v45 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = v44;
  *(void *)(v46 + 24) = v45;
  uint64_t v57 = sub_19C9677D4;
  uint64_t v58 = v46;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  unint64_t v54 = 1107296256;
  uint64_t v55 = sub_19C8ECBB4;
  unint64_t v56 = &block_descriptor_50;
  uint64_t v47 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setCompletionHandler_, v47);
  _Block_release(v47);
  uint64_t v48 = (uint64_t)v52;
  sub_19C976550();
  uint64_t v49 = sub_19C976560();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
  uint64_t v50 = v1 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate;
  swift_beginAccess();
  sub_19C9677DC(v48, v50);
  swift_endAccess();
  objc_msgSend(v21, sel_start);
}

void sub_19C963C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_19C9763D0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_19C963CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_19C976720();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_19C976750();
  uint64_t v10 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *(void *)(v3 + OBJC_IVAR___TPSSearchQueryManager_syncQueue);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = v13;
  void v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_19C965344;
  void aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C942FD0;
  aBlock[3] = &block_descriptor_5;
  os_log_type_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_19C976730();
  uint64_t v19 = MEMORY[0x1E4FBC860];
  sub_19C8E06AC((unint64_t *)&qword_1E94146B8, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94146C0);
  sub_19C957A2C((unint64_t *)&qword_1E94146C8, &qword_1E94146C0);
  sub_19C976D30();
  MEMORY[0x19F39D7A0](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v18);
  swift_release();
  return swift_release();
}

void sub_19C963FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x19F39E8A0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = (uint64_t *)(v6 + OBJC_IVAR___TPSSearchQueryManager_pendingQueries);
    swift_beginAccess();
    uint64_t v9 = *v8;
    if (*(void *)(v9 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v10 = sub_19C95C684(a2, a3);
      if (v11)
      {
        uint64_t v12 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
        swift_endAccess();
        id v13 = v12;
        swift_bridgeObjectRelease();
        sub_19C962E74();

        uint64_t v7 = v13;
LABEL_7:

        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    goto LABEL_7;
  }
}

uint64_t type metadata accessor for SearchQueryManager()
{
  return self;
}

uint64_t sub_19C96416C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_19C976560();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  unint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = v0 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate;
  swift_beginAccess();
  sub_19C93C410(v11, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_19C93DCC8((uint64_t)v3);
    return 0x6E776F6E6B6E75;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A80);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_19C980A20;
    sub_19C976550();
    sub_19C976500();
    uint64_t v15 = v14;
    uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    uint64_t v17 = MEMORY[0x1E4FBB460];
    *(void *)(v13 + 56) = MEMORY[0x1E4FBB3D0];
    *(void *)(v13 + 64) = v17;
    *(void *)(v13 + 32) = v15;
    uint64_t v12 = sub_19C9768C0();
    v16(v10, v4);
  }
  return v12;
}

void sub_19C9643CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 + 16;
  if (qword_1E9414348 != -1) {
    swift_once();
  }
  uint64_t v5 = (id)qword_1E9414628;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  v19[0] = 0xD000000000000013;
  v19[1] = 0x800000019C986F70;
  sub_19C976F90();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  os_log_type_t v6 = sub_19C976B80();
  if (os_log_type_enabled(v5, v6))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v18 = a3;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v19[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(0xD000000000000013, 0x800000019C986F70, v19);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v8, -1, -1);
    uint64_t v9 = v7;
    a3 = v18;
    MEMORY[0x19F39E7F0](v9, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x19F39E8A0](v4);
  if (v10)
  {
    uint64_t v11 = (char *)v10;
    swift_beginAccess();
    uint64_t v12 = (void *)MEMORY[0x19F39E8A0](a3 + 16);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void **)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v14)
      {
        if (v12 == v14)
        {
          uint64_t v15 = v12;
          uint64_t v16 = swift_bridgeObjectRetain();
          uint64_t v17 = sub_19C967898(v16);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_19C965350(v17);
          swift_endAccess();

          uint64_t v11 = v15;
        }
      }
    }
    else
    {
      uint64_t v13 = v11;
    }
  }
}

void sub_19C9646D4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9414348 != -1) {
    swift_once();
  }
  uint64_t v6 = a2 + 16;
  uint64_t v7 = (id)qword_1E9414628;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t v22 = 0xD000000000000013;
  unint64_t v23 = 0x800000019C986F70;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_19C976EA0();
    swift_bridgeObjectRelease();
  }
  sub_19C976F90();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  uint64_t v9 = v22;
  unint64_t v8 = v23;
  os_log_type_t v10 = sub_19C976B80();
  if (os_log_type_enabled(v7, v10))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v21 = a3;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(v9, v8, &v22);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v7, v10, "%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v12, -1, -1);
    uint64_t v13 = v11;
    a3 = v21;
    MEMORY[0x19F39E7F0](v13, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x19F39E8A0](v6);
  if (v14)
  {
    uint64_t v15 = (char *)v14;
    swift_beginAccess();
    uint64_t v16 = MEMORY[0x19F39E8A0](a3 + 16);
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      uint64_t v18 = *(void *)&v15[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v18)
      {
        if (v16 == v18)
        {
          swift_bridgeObjectRetain();
          uint64_t v19 = v17;
          unint64_t v20 = sub_19C967930(a1);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          sub_19C9654D0(v20);
          swift_endAccess();

          uint64_t v15 = v19;
        }
      }
    }
    else
    {
      uint64_t v17 = v15;
    }
  }
}

uint64_t sub_19C964A10(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
  uint64_t v2 = sub_19C9769E0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_19C964A94(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x19F39E8A0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (qword_1E9414348 != -1) {
      swift_once();
    }
    uint64_t v8 = a3 + 16;
    uint64_t v9 = (id)qword_1E9414628;
    sub_19C976E10();
    swift_bridgeObjectRelease();
    uint64_t v18 = 0xD000000000000017;
    unint64_t v19 = 0x800000019C986F50;
    sub_19C96416C();
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    if (a1)
    {
      swift_getErrorValue();
      uint64_t v10 = sub_19C977040();
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    uint64_t v20 = v10;
    uint64_t v21 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94149B0);
    sub_19C9768E0();
    sub_19C976920();
    swift_bridgeObjectRelease();
    uint64_t v13 = v18;
    unint64_t v12 = v19;
    os_log_type_t v14 = sub_19C976B80();
    if (os_log_type_enabled(v9, v14))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_19C8F5F20(v13, v12, &v18);
      sub_19C976CB0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19C8DC000, v9, v14, "%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v16, -1, -1);
      MEMORY[0x19F39E7F0](v15, -1, -1);
    }

    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v17 = (void *)MEMORY[0x19F39E8A0](v8);
    sub_19C964D7C(v17, a1);
  }
}

uint64_t sub_19C964D7C(void *a1, void *a2)
{
  uint64_t v5 = sub_19C976720();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_19C976750();
  uint64_t result = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    os_log_type_t v14 = *(void **)(v2 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query);
    if (v14) {
      BOOL v15 = v14 == a1;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      uint64_t v25 = *(void *)(v2 + OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue);
      uint64_t v26 = v11;
      uint64_t v16 = swift_allocObject();
      uint64_t v24 = v6;
      uint64_t v17 = v16;
      swift_unknownObjectWeakInit();
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      unint64_t v19 = (void *)swift_allocObject();
      v19[2] = v17;
      uint64_t v19[3] = v18;
      v19[4] = a2;
      aBlock[4] = sub_19C96788C;
      void aBlock[5] = v19;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_19C942FD0;
      aBlock[3] = &block_descriptor_58;
      uint64_t v20 = _Block_copy(aBlock);
      id v23 = a1;
      swift_retain();
      swift_retain();
      id v21 = a2;
      sub_19C976730();
      uint64_t v27 = MEMORY[0x1E4FBC860];
      sub_19C8E06AC((unint64_t *)&qword_1E94146B8, MEMORY[0x1E4FBCB00]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E94146C0);
      sub_19C957A2C((unint64_t *)&qword_1E94146C8, &qword_1E94146C0);
      sub_19C976D30();
      MEMORY[0x19F39D7A0](0, v13, v8, v20);
      _Block_release(v20);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v5);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v9);
      swift_release();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_19C9651B0()
{
  return type metadata accessor for CoreSpotlightQuery();
}

uint64_t type metadata accessor for CoreSpotlightQuery()
{
  uint64_t result = qword_1E9414A38;
  if (!qword_1E9414A38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_19C965204()
{
  sub_19C8DE360();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_19C9652CC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C965304()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_19C965344()
{
  sub_19C963FAC(v0[2], v0[3], v0[4]);
}

uint64_t sub_19C965350(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_19C965B04(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

void sub_19C9654D0(unint64_t a1)
{
  unint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_19C976D60();
    sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
    sub_19C967A84();
    sub_19C976B50();
    unint64_t v1 = (unint64_t)v17[1];
    uint64_t v16 = v17[2];
    uint64_t v2 = (uint64_t)v17[3];
    id v3 = v17[4];
    unint64_t v4 = (unint64_t)v17[5];
  }
  else
  {
    id v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = (void *)(a1 + 56);
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | ((void)v3 << 6);
      uint64_t v11 = (char *)v3;
      goto LABEL_29;
    }
    uint64_t v13 = (uint64_t)v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v8) {
      goto LABEL_32;
    }
    unint64_t v14 = v16[v13];
    uint64_t v11 = (char *)v3 + 1;
    if (!v14)
    {
      uint64_t v11 = (char *)v3 + 2;
      if ((uint64_t)v3 + 2 >= v8) {
        goto LABEL_32;
      }
      unint64_t v14 = v16[(void)v11];
      if (!v14)
      {
        uint64_t v11 = (char *)v3 + 3;
        if ((uint64_t)v3 + 3 >= v8) {
          goto LABEL_32;
        }
        unint64_t v14 = v16[(void)v11];
        if (!v14)
        {
          uint64_t v11 = (char *)v3 + 4;
          if ((uint64_t)v3 + 4 >= v8) {
            goto LABEL_32;
          }
          unint64_t v14 = v16[(void)v11];
          if (!v14)
          {
            uint64_t v11 = (char *)v3 + 5;
            if ((uint64_t)v3 + 5 >= v8) {
              goto LABEL_32;
            }
            unint64_t v14 = v16[(void)v11];
            if (!v14)
            {
              int64_t v15 = (char *)v3 + 6;
              while ((char *)v8 != v15)
              {
                unint64_t v14 = v16[(void)v15++];
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_19C967AEC();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + ((void)v11 << 6);
LABEL_29:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_19C965CB4(v17, v12);

      id v3 = v11;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_19C976D90())
      {
        sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v12 = v17[0];
        swift_unknownObjectRelease();
        uint64_t v11 = (char *)v3;
        uint64_t v9 = v4;
        if (v12) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_19C965770(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x19F39E8A0](v5);
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    swift_beginAccess();
    uint64_t v8 = MEMORY[0x19F39E8A0](a2 + 16);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query;
      uint64_t v11 = *(void *)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query];
      if (v11 && v8 == v11)
      {
        if (a3)
        {
          id v12 = a3;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516AB0);
          type metadata accessor for CSSearchQueryError(0);
          if (swift_dynamicCast())
          {
            sub_19C8E06AC(&qword_1E9414508, type metadata accessor for CSSearchQueryError);
            sub_19C9763A0();

            if (a3 == (void *)-2003)
            {
              uint64_t v13 = (unsigned char *)(*(void *)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery]
                            + OBJC_IVAR___TPSSearchQuery_isCancelled);
              swift_beginAccess();
              unsigned char *v13 = 1;
            }
          }
        }
        unint64_t v14 = *(void **)&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery];
        swift_beginAccess();
        int64_t v15 = v14;
        uint64_t v16 = swift_bridgeObjectRetain();
        uint64_t v17 = sub_19C96870C(v16);
        swift_bridgeObjectRelease();
        swift_beginAccess();
        uint64_t v18 = swift_bridgeObjectRetain();
        unint64_t v19 = sub_19C968624(v18);
        swift_bridgeObjectRelease();
        id v20 = sub_19C96AE38(v15, v17, (uint64_t)v19);

        swift_release();
        swift_release();
        id v21 = *(void (**)(id, void *))&v7[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completion];
        swift_retain();
        id v22 = v20;
        v21(v20, a3);
        swift_release();

        uint64_t v9 = *(void **)&v7[v10];
        *(void *)&v7[v10] = 0;
      }
    }
    else
    {
      uint64_t v9 = v7;
    }
  }
}

uint64_t sub_19C965A0C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_19C965A44(uint64_t a1, uint64_t a2)
{
  sub_19C963C44(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_19C965A4C()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

void sub_19C965A9C()
{
  sub_19C962C84(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_19C965AAC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_19C965AF4(void *a1, uint64_t a2)
{
  sub_19C9630DC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void (**)(void))(v2 + 40));
}

uint64_t sub_19C965B04(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_19C977090();
  swift_bridgeObjectRetain();
  sub_19C976910();
  uint64_t v8 = sub_19C9770C0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_19C976FB0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_19C976FB0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *id v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_19C966738(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *id v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_19C965CB4(void *a1, void *a2)
{
  id v3 = v2;
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
    uint64_t v9 = sub_19C976D80();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_19C976D70();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_19C965F54(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_19C966414();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_19C9666B4((uint64_t)v8, v22);
    *id v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_19C976C40();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_19C976C50();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
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
        char v18 = sub_19C976C50();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_19C9668D4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_19C965F54(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A58);
    uint64_t v2 = sub_19C976DF0();
    uint64_t v14 = v2;
    sub_19C976D60();
    if (sub_19C976D90())
    {
      sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_19C966414();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_19C976C40();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_19C976D90());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC870];
  }
  return v2;
}

uint64_t sub_19C96614C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A60);
  uint64_t v3 = sub_19C976DE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  unint64_t v31 = v0;
  uint64_t v32 = v2 + 56;
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
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8) {
      break;
    }
    id v17 = (void *)(v2 + 56);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_31;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v11);
      if (!v18)
      {
        int64_t v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          unint64_t v1 = v31;
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            int64_t v11 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_39;
            }
            if (v11 >= v8) {
              goto LABEL_31;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v11);
            ++v19;
            if (v18) {
              goto LABEL_21;
            }
          }
        }
        int64_t v11 = v19;
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    id v20 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    sub_19C977090();
    sub_19C976910();
    uint64_t result = sub_19C9770C0();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v21;
    v13[1] = v22;
    ++*(void *)(v4 + 16);
  }
  swift_release();
  unint64_t v1 = v31;
  id v17 = (void *)(v2 + 56);
LABEL_33:
  uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
  if (v30 > 63) {
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v17 = -1 << v30;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_19C966414()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A58);
  uint64_t v3 = sub_19C976DE0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    BOOL v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_19C976C40();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

unint64_t sub_19C9666B4(uint64_t a1, uint64_t a2)
{
  sub_19C976C40();
  unint64_t result = sub_19C976D50();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_19C966738(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_19C96614C();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_19C966A5C();
      goto LABEL_22;
    }
    sub_19C966DA8();
  }
  uint64_t v11 = *v4;
  sub_19C977090();
  sub_19C976910();
  unint64_t result = sub_19C9770C0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_19C976FB0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_19C977000();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_19C976FB0();
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

void sub_19C9668D4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_19C966414();
  }
  else
  {
    if (v7 > v6)
    {
      sub_19C966BFC();
      goto LABEL_14;
    }
    sub_19C967034();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_19C976C40();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_19C976C50();

    if (v12)
    {
LABEL_13:
      sub_19C977000();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_19C976C50();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_19C966A5C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_19C976DD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_19C966BFC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_19C976DD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19C966DA8()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A60);
  uint64_t v3 = sub_19C976DE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    *unint64_t v1 = v4;
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
  uint64_t result = swift_retain_n();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          unint64_t v1 = v0;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v11 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_19C977090();
    swift_bridgeObjectRetain();
    sub_19C976910();
    uint64_t result = sub_19C9770C0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_33;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_19C967034()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A58);
  uint64_t v3 = sub_19C976DE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_19C976C40();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_19C9672B0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_19C976EA0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A58);
      uint64_t v3 = sub_19C976E00();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_19C976EA0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x1E4FBC870];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x19F39D9E0](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_19C976C40();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_19C976C50();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_19C976C50();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_19C976C40();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_19C976C50();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_19C976C50();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

id sub_19C96760C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = v5;
  uint64_t v12 = MEMORY[0x1E4FBC870];
  uint64_t v13 = MEMORY[0x1E4FBC870];
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0)
  {
    if (sub_19C976EA0()) {
      sub_19C9672B0(MEMORY[0x1E4FBC860]);
    }
    else {
      uint64_t v13 = MEMORY[0x1E4FBC870];
    }
  }
  *(void *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchResults] = v13;
  *(void *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completions] = v12;
  *(void *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_query] = 0;
  unint64_t v14 = &v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_startDate];
  uint64_t v15 = sub_19C976560();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_searchQuery] = a1;
  *(void *)&v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_queue] = a2;
  uint64_t v16 = &v11[OBJC_IVAR____TtC8TipsCoreP33_B6E28573636832BA2101918E4F96A4B718CoreSpotlightQuery_completion];
  *(void *)uint64_t v16 = a3;
  *((void *)v16 + 1) = a4;
  id v17 = a1;
  id v18 = a2;
  swift_retain();

  v20.receiver = v11;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_init);
}

void sub_19C96777C(uint64_t a1)
{
  sub_19C9643CC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_19C967788(unint64_t a1)
{
  sub_19C9646D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t objectdestroy_30Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_19C9677D4(void *a1)
{
  sub_19C964A94(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_19C9677DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_19C967844()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_19C96788C()
{
  sub_19C965770(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_19C967898(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_19C976B40();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_19C965B04(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_19C967930(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_19C976EA0();
    swift_bridgeObjectRelease();
  }
  sub_19C8DFBA0(0, (unint64_t *)&qword_1E9414A48);
  sub_19C967A84();
  uint64_t result = sub_19C976B40();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_19C976EA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x19F39D9E0](i, a1);
        sub_19C965CB4(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_19C965CB4(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_19C967A84()
{
  unint64_t result = qword_1E9414A50;
  if (!qword_1E9414A50)
  {
    sub_19C8DFBA0(255, (unint64_t *)&qword_1E9414A48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414A50);
  }
  return result;
}

uint64_t sub_19C967AEC()
{
  return swift_release();
}

uint64_t logError(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19C967BB4(a1, a2, a3, MEMORY[0x1E4FBD380]);
}

uint64_t log(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19C967D14(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD390]);
}

uint64_t logDebug(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19C967D14(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD378]);
}

uint64_t logInfo(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19C967D14(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD370]);
}

uint64_t logError(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19C967D14(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD380]);
}

uint64_t logFault(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_19C967BB4(a1, a2, a3, MEMORY[0x1E4FBD388]);
}

uint64_t sub_19C967BB4(NSObject **a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = *a1;
  os_log_type_t v7 = a4();
  uint64_t result = os_log_type_enabled(v6, v7);
  if (result)
  {
    swift_bridgeObjectRetain_n();
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(a2, a3, &v11);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v10, -1, -1);
    return MEMORY[0x19F39E7F0](v9, -1, -1);
  }
  return result;
}

uint64_t logFault(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_19C967D14(a1, a2, a3, a4, a5, MEMORY[0x1E4FBD388]);
}

uint64_t sub_19C967D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516A80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19C980A20;
  *(void *)(v7 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516888);
  *(void *)(v7 + 64) = sub_19C967DEC();
  *(void *)(v7 + 32) = a5;
  swift_bridgeObjectRetain();
  sub_19C976630();
  return swift_bridgeObjectRelease();
}

unint64_t sub_19C967DEC()
{
  unint64_t result = qword_1EB516890;
  if (!qword_1EB516890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB516888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB516890);
  }
  return result;
}

id static TPSLogger.default.getter()
{
  return sub_19C968088(&qword_1EB516EA8, (void **)&qword_1EB516EB0);
}

id static TPSLogger.analytics.getter()
{
  return sub_19C968088(&qword_1EB516E50, (void **)&qword_1EB516E58);
}

id static TPSLogger.daemon.getter()
{
  return sub_19C968088(&qword_1EB5168A8, (void **)&qword_1EB5168A0);
}

id static TPSLogger.data.getter()
{
  return sub_19C968088(&qword_1EB516E90, (void **)&qword_1EB516E98);
}

id static TPSLogger.discoverability.getter()
{
  return sub_19C968088(&qword_1EB516898, (void **)&qword_1EB516880);
}

id static TPSLogger.targeting.getter()
{
  return sub_19C968088(qword_1EB5168C0, (void **)&unk_1EB5168B0);
}

id static TPSLogger.tipkit.getter()
{
  return sub_19C968088(&qword_1EB516E48, (void **)&unk_1EB516E38);
}

id static TPSLogger.welcome.getter()
{
  return sub_19C968088(&qword_1EB516A60, (void **)&unk_1EB516A50);
}

id static TPSLogger.widget.getter()
{
  return sub_19C968088(&qword_1EB516A68, (void **)&unk_1EB516A70);
}

id static TPSLogger.indexing.getter()
{
  return sub_19C968088(&qword_1EB516A40, (void **)&qword_1EB516A38);
}

id static TPSLogger.search.getter()
{
  return sub_19C968088(&qword_1E9414348, (void **)&qword_1E9414628);
}

id sub_19C968088(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

id TPSLogger.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TPSLogger.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSLogger();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for TPSLogger()
{
  return self;
}

id TPSLogger.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSLogger();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_19C968270()
{
  unint64_t result = qword_1E9414A48;
  if (!qword_1E9414A48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9414A48);
  }
  return result;
}

void *sub_19C9682B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414A80);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_19C969FDC(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_19C967AEC();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_19C9683A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      id v9 = (void *)MEMORY[0x1E4FBC860];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        type metadata accessor for SearchResult.Item();
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A68);
      id v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      void v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

void *sub_19C96852C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A68);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_19C969DD8((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_19C976EA0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

void *sub_19C968624(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_19C96A1F0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_19C967AEC();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_19C96870C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_19C976D70();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A68);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_19C96A3F0(&v8, v3 + 4, v2, a1);
  uint64_t result = sub_19C967AEC();
  if (v6 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_19C968808(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_19C96A6F0();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_19C968884(v6);
  return sub_19C976E60();
}

uint64_t sub_19C968884(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_19C976F80();
  v162 = (char *)v4;
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_211;
    }
    if ((unint64_t)v4 < 2) {
      return result;
    }
    id v9 = (void *)*a1;
    uint64_t v10 = -1;
    uint64_t v11 = 1;
    unint64_t v12 = v9;
    while (1)
    {
      v163 = v12;
      __dsta = (char *)v11;
      uint64_t v13 = v9[v11];
      uint64_t v167 = v10;
      do
      {
        uint64_t v14 = *v12;
        uint64_t v15 = (double *)(v13 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        double v16 = *v15;
        id v17 = (double *)(v14 + OBJC_IVAR___TPSSearchResultItem_relevance);
        uint64_t result = swift_beginAccess();
        if (v16 == *v17)
        {
          id v18 = (uint64_t *)(v13 + OBJC_IVAR___TPSSearchResultItem_title);
          swift_beginAccess();
          uint64_t v19 = v18[1];
          if (v19
            && (uint64_t v20 = *v18,
                id v21 = (void *)(v14 + OBJC_IVAR___TPSSearchResultItem_title),
                uint64_t result = swift_beginAccess(),
                (uint64_t v22 = v21[1]) != 0))
          {
            if (v20 == *v21 && v19 == v22) {
              break;
            }
          }
          else
          {
            uint64_t v24 = (uint64_t *)(v13 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            uint64_t v25 = *v24;
            uint64_t v26 = v24[1];
            uint64_t v27 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            uint64_t result = *v27;
            if (*v27 == v25 && v27[1] == v26) {
              break;
            }
          }
          uint64_t result = sub_19C976FB0();
          if ((result & 1) == 0) {
            break;
          }
        }
        else if (*v17 >= v16)
        {
          break;
        }
        if (!v9) {
          goto LABEL_215;
        }
        uint64_t v29 = *v12;
        uint64_t v13 = v12[1];
        *unint64_t v12 = v13;
        v12[1] = v29;
        --v12;
      }
      while (!__CFADD__(v10++, 1));
      uint64_t v11 = (uint64_t)(__dsta + 1);
      unint64_t v12 = v163 + 1;
      uint64_t v10 = v167 - 1;
      if (__dsta + 1 == v162) {
        return result;
      }
    }
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_220;
  }
  uint64_t v159 = result;
  v157 = a1;
  if (v4 < 2)
  {
    uint64_t v31 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v169 = MEMORY[0x1E4FBC860];
    __dst = (char *)((MEMORY[0x1E4FBC860] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v33 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_176:
      v150 = v31;
      if (v33 >= 2)
      {
        uint64_t v151 = *v157;
        do
        {
          unint64_t v152 = v33 - 2;
          if (v33 < 2) {
            goto LABEL_206;
          }
          if (!v151) {
            goto LABEL_219;
          }
          uint64_t v153 = *(void *)&v150[16 * v152 + 32];
          uint64_t v154 = *(void *)&v150[16 * v33 + 24];
          sub_19C9694E8((char *)(v151 + 8 * v153), (char *)(v151 + 8 * *(void *)&v150[16 * v33 + 16]), v151 + 8 * v154, __dst);
          if (v2) {
            break;
          }
          if (v154 < v153) {
            goto LABEL_207;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v150 = sub_19C969C8C((uint64_t)v150);
          }
          if (v152 >= *((void *)v150 + 2)) {
            goto LABEL_208;
          }
          v155 = &v150[16 * v152 + 32];
          *(void *)v155 = v153;
          *((void *)v155 + 1) = v154;
          unint64_t v156 = *((void *)v150 + 2);
          if (v33 > v156) {
            goto LABEL_209;
          }
          memmove(&v150[16 * v33 + 16], &v150[16 * v33 + 32], 16 * (v156 - v33));
          *((void *)v150 + 2) = v156 - 1;
          unint64_t v33 = v156 - 1;
        }
        while (v156 > 2);
      }
LABEL_187:
      swift_bridgeObjectRelease();
      *(void *)((v169 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_19C976A00();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    type metadata accessor for SearchResult.Item();
    uint64_t v8 = sub_19C976A20();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    __dst = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v169 = v8;
  }
  uint64_t v32 = 0;
  uint64_t v168 = *a1;
  uint64_t v158 = *a1 - 8;
  uint64_t v31 = (char *)MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v34 = v32++;
    uint64_t v161 = v34;
    if (v32 >= v4)
    {
LABEL_53:
      if (v32 < v4) {
        goto LABEL_54;
      }
      goto LABEL_126;
    }
    uint64_t v35 = *(void *)(v168 + 8 * v32);
    uint64_t v36 = *(void *)(v168 + 8 * v34);
    char v37 = (double *)(v35 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    double v38 = *v37;
    uint64_t v39 = (double *)(v36 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    if (v38 == *v39) {
      break;
    }
    int v51 = *v39 < v38;
LABEL_51:
    uint64_t v34 = v161;
    uint64_t v4 = (uint64_t)v162;
    uint64_t v52 = v161 + 2;
    if (v161 + 2 < (uint64_t)v162) {
      goto LABEL_88;
    }
    uint64_t v32 = v161 + 2;
    if ((v51 & 1) == 0) {
      goto LABEL_53;
    }
LABEL_115:
    if (v52 < v34) {
      goto LABEL_214;
    }
LABEL_116:
    if (v34 >= v52)
    {
LABEL_123:
      uint64_t v32 = v52;
      if (v52 < v4) {
        goto LABEL_54;
      }
      goto LABEL_126;
    }
    uint64_t v92 = (uint64_t *)(v158 + 8 * v52);
    uint64_t v93 = v52;
    uint64_t v94 = v34;
    uint64_t v95 = (uint64_t *)(v168 + 8 * v34);
    do
    {
      if (v94 != --v93)
      {
        if (!v168) {
          goto LABEL_218;
        }
        uint64_t v96 = *v95;
        *uint64_t v95 = *v92;
        *uint64_t v92 = v96;
      }
      ++v94;
      --v92;
      ++v95;
    }
    while (v94 < v93);
    uint64_t v32 = v52;
    uint64_t v34 = v161;
    if (v52 < v4)
    {
LABEL_54:
      if (__OFSUB__(v32, v34)) {
        goto LABEL_210;
      }
      uint64_t v53 = v168;
      if (v32 - v34 >= v159)
      {
LABEL_112:
        uint64_t v34 = v161;
      }
      else
      {
        uint64_t v34 = v161;
        if (__OFADD__(v161, v159)) {
          goto LABEL_212;
        }
        if (v161 + v159 >= v4) {
          uint64_t v54 = v4;
        }
        else {
          uint64_t v54 = v161 + v159;
        }
        if (v54 < v161)
        {
LABEL_213:
          __break(1u);
          goto LABEL_214;
        }
        if (v32 != v54)
        {
          uint64_t v55 = (void *)(v158 + 8 * v32);
          uint64_t v160 = v54;
          while (1)
          {
            uint64_t v56 = *(void *)(v53 + 8 * v32);
            uint64_t v57 = v161;
            v164 = v55;
            while (1)
            {
              uint64_t v58 = *v55;
              uint64_t v59 = (double *)(v56 + OBJC_IVAR___TPSSearchResultItem_relevance);
              swift_beginAccess();
              double v60 = *v59;
              uint64_t v61 = (double *)(v58 + OBJC_IVAR___TPSSearchResultItem_relevance);
              swift_beginAccess();
              if (v60 != *v61)
              {
                if (*v61 >= v60) {
                  goto LABEL_64;
                }
                goto LABEL_82;
              }
              uint64_t v62 = (uint64_t *)(v56 + OBJC_IVAR___TPSSearchResultItem_title);
              swift_beginAccess();
              uint64_t v63 = v62[1];
              if (v63)
              {
                uint64_t v64 = *v62;
                uint64_t v65 = (void *)(v58 + OBJC_IVAR___TPSSearchResultItem_title);
                swift_beginAccess();
                uint64_t v66 = v65[1];
                if (v66) {
                  break;
                }
              }
              uint64_t v68 = (uint64_t *)(v56 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
              swift_beginAccess();
              uint64_t v69 = *v68;
              uint64_t v70 = v68[1];
              long long v71 = (void *)(v58 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
              swift_beginAccess();
              if (*v71 == v69 && v71[1] == v70)
              {
                uint64_t v53 = v168;
                goto LABEL_64;
              }
              uint64_t v53 = v168;
              if ((sub_19C976FB0() & 1) == 0) {
                goto LABEL_64;
              }
LABEL_82:
              if (!v53) {
                goto LABEL_216;
              }
              uint64_t v73 = *v55;
              uint64_t v56 = v55[1];
              *uint64_t v55 = v56;
              v55[1] = v73;
              --v55;
              if (v32 == ++v57) {
                goto LABEL_64;
              }
            }
            if (v64 != *v65 || v63 != v66) {
              break;
            }
            uint64_t v53 = v168;
LABEL_64:
            ++v32;
            uint64_t v55 = v164 + 1;
            if (v32 == v160)
            {
              uint64_t v32 = v160;
              goto LABEL_112;
            }
          }
          uint64_t v53 = v168;
          if ((sub_19C976FB0() & 1) == 0) {
            goto LABEL_64;
          }
          goto LABEL_82;
        }
      }
    }
LABEL_126:
    if (v32 < v34) {
      goto LABEL_205;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v31 = sub_19C969A04(0, *((void *)v31 + 2) + 1, 1, v31);
    }
    unint64_t v98 = *((void *)v31 + 2);
    unint64_t v97 = *((void *)v31 + 3);
    unint64_t v33 = v98 + 1;
    if (v98 >= v97 >> 1) {
      uint64_t v31 = sub_19C969A04((char *)(v97 > 1), v98 + 1, 1, v31);
    }
    *((void *)v31 + 2) = v33;
    uint64_t v99 = v31 + 32;
    uint64_t v100 = &v31[16 * v98 + 32];
    *(void *)uint64_t v100 = v161;
    *((void *)v100 + 1) = v32;
    if (v98)
    {
      while (1)
      {
        unint64_t v101 = v33 - 1;
        if (v33 >= 4)
        {
          v106 = &v99[16 * v33];
          uint64_t v107 = *((void *)v106 - 8);
          uint64_t v108 = *((void *)v106 - 7);
          BOOL v112 = __OFSUB__(v108, v107);
          uint64_t v109 = v108 - v107;
          if (v112) {
            goto LABEL_194;
          }
          uint64_t v111 = *((void *)v106 - 6);
          uint64_t v110 = *((void *)v106 - 5);
          BOOL v112 = __OFSUB__(v110, v111);
          uint64_t v104 = v110 - v111;
          char v105 = v112;
          if (v112) {
            goto LABEL_195;
          }
          unint64_t v113 = v33 - 2;
          BOOL v114 = &v99[16 * v33 - 32];
          uint64_t v116 = *(void *)v114;
          uint64_t v115 = *((void *)v114 + 1);
          BOOL v112 = __OFSUB__(v115, v116);
          uint64_t v117 = v115 - v116;
          if (v112) {
            goto LABEL_197;
          }
          BOOL v112 = __OFADD__(v104, v117);
          uint64_t v118 = v104 + v117;
          if (v112) {
            goto LABEL_200;
          }
          if (v118 >= v109)
          {
            v136 = &v99[16 * v101];
            uint64_t v138 = *(void *)v136;
            uint64_t v137 = *((void *)v136 + 1);
            BOOL v112 = __OFSUB__(v137, v138);
            uint64_t v139 = v137 - v138;
            if (v112) {
              goto LABEL_204;
            }
            BOOL v129 = v104 < v139;
            goto LABEL_163;
          }
        }
        else
        {
          if (v33 != 3)
          {
            uint64_t v130 = *((void *)v31 + 4);
            uint64_t v131 = *((void *)v31 + 5);
            BOOL v112 = __OFSUB__(v131, v130);
            uint64_t v123 = v131 - v130;
            char v124 = v112;
            goto LABEL_157;
          }
          uint64_t v103 = *((void *)v31 + 4);
          uint64_t v102 = *((void *)v31 + 5);
          BOOL v112 = __OFSUB__(v102, v103);
          uint64_t v104 = v102 - v103;
          char v105 = v112;
        }
        if (v105) {
          goto LABEL_196;
        }
        unint64_t v113 = v33 - 2;
        uint64_t v119 = &v99[16 * v33 - 32];
        uint64_t v121 = *(void *)v119;
        uint64_t v120 = *((void *)v119 + 1);
        BOOL v122 = __OFSUB__(v120, v121);
        uint64_t v123 = v120 - v121;
        char v124 = v122;
        if (v122) {
          goto LABEL_199;
        }
        uint64_t v125 = &v99[16 * v101];
        uint64_t v127 = *(void *)v125;
        uint64_t v126 = *((void *)v125 + 1);
        BOOL v112 = __OFSUB__(v126, v127);
        uint64_t v128 = v126 - v127;
        if (v112) {
          goto LABEL_202;
        }
        if (__OFADD__(v123, v128)) {
          goto LABEL_203;
        }
        if (v123 + v128 >= v104)
        {
          BOOL v129 = v104 < v128;
LABEL_163:
          if (v129) {
            unint64_t v101 = v113;
          }
          goto LABEL_165;
        }
LABEL_157:
        if (v124) {
          goto LABEL_198;
        }
        unint64_t v132 = &v99[16 * v101];
        uint64_t v134 = *(void *)v132;
        uint64_t v133 = *((void *)v132 + 1);
        BOOL v112 = __OFSUB__(v133, v134);
        uint64_t v135 = v133 - v134;
        if (v112) {
          goto LABEL_201;
        }
        if (v135 < v123) {
          goto LABEL_35;
        }
LABEL_165:
        unint64_t v140 = v101 - 1;
        if (v101 - 1 >= v33)
        {
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          __break(1u);
LABEL_198:
          __break(1u);
LABEL_199:
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
LABEL_207:
          __break(1u);
LABEL_208:
          __break(1u);
LABEL_209:
          __break(1u);
LABEL_210:
          __break(1u);
LABEL_211:
          __break(1u);
LABEL_212:
          __break(1u);
          goto LABEL_213;
        }
        if (!v168) {
          goto LABEL_217;
        }
        uint64_t v141 = v32;
        unint64_t v142 = v31;
        v143 = &v99[16 * v140];
        uint64_t v144 = v99;
        uint64_t v145 = *(void *)v143;
        uint64_t v146 = v144;
        v147 = &v144[16 * v101];
        uint64_t v148 = *((void *)v147 + 1);
        sub_19C9694E8((char *)(v168 + 8 * *(void *)v143), (char *)(v168 + 8 * *(void *)v147), v168 + 8 * v148, __dst);
        if (v1) {
          goto LABEL_187;
        }
        if (v148 < v145) {
          goto LABEL_191;
        }
        if (v101 > *((void *)v142 + 2)) {
          goto LABEL_192;
        }
        *(void *)v143 = v145;
        *(void *)&v146[16 * v140 + 8] = v148;
        unint64_t v149 = *((void *)v142 + 2);
        if (v101 >= v149) {
          goto LABEL_193;
        }
        uint64_t v99 = v146;
        uint64_t v31 = v142;
        unint64_t v33 = v149 - 1;
        memmove(v147, v147 + 16, 16 * (v149 - 1 - v101));
        *((void *)v142 + 2) = v149 - 1;
        uint64_t v32 = v141;
        if (v149 <= 2) {
          goto LABEL_35;
        }
      }
    }
    unint64_t v33 = 1;
LABEL_35:
    uint64_t v4 = (uint64_t)v162;
    if (v32 >= (uint64_t)v162)
    {
      uint64_t v2 = v1;
      goto LABEL_176;
    }
  }
  unint64_t v40 = (uint64_t *)(v35 + OBJC_IVAR___TPSSearchResultItem_title);
  swift_beginAccess();
  uint64_t v41 = v40[1];
  if (v41)
  {
    uint64_t v42 = *v40;
    uint64_t v43 = (void *)(v36 + OBJC_IVAR___TPSSearchResultItem_title);
    swift_beginAccess();
    uint64_t v44 = v43[1];
    if (v44)
    {
      if (v42 == *v43 && v41 == v44) {
        goto LABEL_86;
      }
      goto LABEL_49;
    }
  }
  uint64_t v46 = (uint64_t *)(v35 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  swift_beginAccess();
  uint64_t v47 = *v46;
  uint64_t v48 = v46[1];
  uint64_t v49 = (void *)(v36 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  swift_beginAccess();
  if (*v49 != v47 || v49[1] != v48)
  {
LABEL_49:
    int v51 = sub_19C976FB0();
    goto LABEL_51;
  }
LABEL_86:
  uint64_t v34 = v161;
  uint64_t v4 = (uint64_t)v162;
  uint64_t v52 = v161 + 2;
  if (v161 + 2 >= (uint64_t)v162) {
    goto LABEL_123;
  }
  int v51 = 0;
LABEL_88:
  uint64_t v74 = v52;
  while (2)
  {
    uint64_t v52 = v74;
    uint64_t v75 = *(void *)(v168 + 8 * v74);
    uint64_t v76 = *(void *)(v168 + 8 * v32);
    uint64_t v77 = (double *)(v75 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    double v78 = *v77;
    uint64_t v79 = (double *)(v76 + OBJC_IVAR___TPSSearchResultItem_relevance);
    swift_beginAccess();
    if (v78 != *v79)
    {
      int v91 = *v79 < v78;
LABEL_106:
      uint64_t v4 = (uint64_t)v162;
      if ((v51 ^ v91)) {
        goto LABEL_114;
      }
LABEL_90:
      uint64_t v74 = v52 + 1;
      uint64_t v32 = v52;
      if (v52 + 1 >= v4)
      {
        ++v52;
LABEL_114:
        uint64_t v34 = v161;
        uint64_t v32 = v52;
        if ((v51 & 1) == 0) {
          goto LABEL_53;
        }
        goto LABEL_115;
      }
      continue;
    }
    break;
  }
  uint64_t v80 = (uint64_t *)(v75 + OBJC_IVAR___TPSSearchResultItem_title);
  swift_beginAccess();
  uint64_t v81 = v80[1];
  if (!v81
    || (uint64_t v82 = *v80,
        id v83 = (void *)(v76 + OBJC_IVAR___TPSSearchResultItem_title),
        swift_beginAccess(),
        (uint64_t v84 = v83[1]) == 0))
  {
    uint64_t v86 = (uint64_t *)(v75 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
    swift_beginAccess();
    uint64_t v87 = *v86;
    uint64_t v88 = v86[1];
    unint64_t v89 = (void *)(v76 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
    swift_beginAccess();
    if (*v89 == v87 && v89[1] == v88)
    {
      uint64_t v4 = (uint64_t)v162;
      if (v51) {
        goto LABEL_109;
      }
      goto LABEL_90;
    }
    int v91 = sub_19C976FB0();
    goto LABEL_106;
  }
  BOOL v85 = v82 == *v83 && v81 == v84;
  uint64_t v4 = (uint64_t)v162;
  if (!v85)
  {
    if ((v51 ^ sub_19C976FB0())) {
      goto LABEL_114;
    }
    goto LABEL_90;
  }
  if ((v51 & 1) == 0) {
    goto LABEL_90;
  }
LABEL_109:
  uint64_t v34 = v161;
  if (v52 >= v161) {
    goto LABEL_116;
  }
LABEL_214:
  __break(1u);
LABEL_215:
  __break(1u);
LABEL_216:
  __break(1u);
LABEL_217:
  __break(1u);
LABEL_218:
  __break(1u);
LABEL_219:
  __break(1u);
LABEL_220:
  uint64_t result = sub_19C976E80();
  __break(1u);
  return result;
}

uint64_t sub_19C9694E8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = a2 - __src;
  int64_t v8 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v8 = a2 - __src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v61 = __dst;
  uint64_t v62 = __src;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_69;
    }
    if (__dst != a2 || &a2[8 * v12] <= __dst) {
      memmove(__dst, a2, 8 * v12);
    }
    unint64_t v33 = &v4[8 * v12];
    double v60 = v33;
    uint64_t v62 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_68:
      sub_19C969BD0((void **)&v62, (const void **)&v61, &v60);
      return 1;
    }
    uint64_t v34 = (char *)(a3 - 8);
    uint64_t v35 = v5;
    uint64_t v55 = v6;
    uint64_t v56 = v4;
    while (1)
    {
      uint64_t v58 = v34 + 8;
      uint64_t v36 = *((void *)v33 - 1);
      uint64_t v38 = *((void *)v35 - 1);
      v35 -= 8;
      uint64_t v37 = v38;
      uint64_t v39 = (double *)(v36 + OBJC_IVAR___TPSSearchResultItem_relevance);
      swift_beginAccess();
      double v40 = *v39;
      uint64_t v41 = (double *)(v38 + OBJC_IVAR___TPSSearchResultItem_relevance);
      swift_beginAccess();
      if (v40 == *v41)
      {
        uint64_t v42 = (uint64_t *)(v36 + OBJC_IVAR___TPSSearchResultItem_title);
        swift_beginAccess();
        uint64_t v43 = v42[1];
        if (v43
          && (uint64_t v44 = *v42,
              uint64_t v45 = (void *)(v37 + OBJC_IVAR___TPSSearchResultItem_title),
              swift_beginAccess(),
              (uint64_t v46 = v45[1]) != 0))
        {
          BOOL v47 = v44 == *v45 && v43 == v46;
          uint64_t v6 = v55;
          uint64_t v48 = v56;
          if (v47) {
            goto LABEL_56;
          }
        }
        else
        {
          uint64_t v49 = (uint64_t *)(v36 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
          swift_beginAccess();
          uint64_t v50 = *v49;
          uint64_t v51 = v49[1];
          uint64_t v52 = (void *)(v37 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
          swift_beginAccess();
          BOOL v53 = *v52 == v50 && v52[1] == v51;
          uint64_t v6 = v55;
          uint64_t v48 = v56;
          if (v53)
          {
LABEL_56:
            double v60 = v33 - 8;
            if (v58 < v33 || v34 >= v33 || v58 != v33) {
              *(void *)uint64_t v34 = *((void *)v33 - 1);
            }
            uint64_t v35 = v5;
            v33 -= 8;
            if (v5 <= v6) {
              goto LABEL_68;
            }
            goto LABEL_67;
          }
        }
        if ((sub_19C976FB0() & 1) == 0) {
          goto LABEL_56;
        }
      }
      else
      {
        uint64_t v48 = v56;
        if (*v41 >= v40) {
          goto LABEL_56;
        }
      }
      if (v58 != v5 || v34 >= v5) {
        *(void *)uint64_t v34 = *(void *)v35;
      }
      uint64_t v62 = v35;
      if (v35 <= v6) {
        goto LABEL_68;
      }
LABEL_67:
      v34 -= 8;
      uint64_t v5 = v35;
      if (v33 <= v48) {
        goto LABEL_68;
      }
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[8 * v9] <= __dst) {
      memmove(__dst, __src, 8 * v9);
    }
    uint64_t v57 = &v4[8 * v9];
    double v60 = v57;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      while (1)
      {
        uint64_t v13 = v6;
        uint64_t v14 = *(void *)v5;
        uint64_t v15 = *(void *)v4;
        double v16 = (double *)(*(void *)v5 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        double v17 = *v16;
        id v18 = (double *)(v15 + OBJC_IVAR___TPSSearchResultItem_relevance);
        swift_beginAccess();
        if (v17 == *v18)
        {
          uint64_t v19 = v5;
          uint64_t v20 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_title);
          swift_beginAccess();
          uint64_t v21 = v20[1];
          if (v21
            && (uint64_t v22 = *v20,
                uint64_t v23 = (void *)(v15 + OBJC_IVAR___TPSSearchResultItem_title),
                swift_beginAccess(),
                (uint64_t v24 = v23[1]) != 0))
          {
            BOOL v25 = v22 == *v23 && v21 == v24;
            uint64_t v5 = v19;
            if (v25) {
              goto LABEL_25;
            }
          }
          else
          {
            uint64_t v26 = (uint64_t *)(v14 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            uint64_t v27 = *v26;
            uint64_t v28 = v26[1];
            uint64_t v29 = (void *)(v15 + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
            swift_beginAccess();
            BOOL v30 = *v29 == v27 && v29[1] == v28;
            uint64_t v5 = v19;
            if (v30) {
              goto LABEL_25;
            }
          }
          if (sub_19C976FB0()) {
            goto LABEL_29;
          }
        }
        else if (*v18 < v17)
        {
LABEL_29:
          uint64_t v32 = v5 + 8;
          uint64_t v31 = v13;
          if (v13 < v5 || v13 >= v32 || v13 != v5) {
            *(void *)uint64_t v13 = *(void *)v5;
          }
          goto LABEL_33;
        }
LABEL_25:
        uint64_t v31 = v13;
        if (v13 != v4) {
          *(void *)uint64_t v13 = *(void *)v4;
        }
        v4 += 8;
        uint64_t v61 = v4;
        uint64_t v32 = v5;
LABEL_33:
        uint64_t v6 = v31 + 8;
        if (v4 < v57)
        {
          uint64_t v5 = v32;
          if ((unint64_t)v32 < a3) {
            continue;
          }
        }
        uint64_t v62 = v6;
        goto LABEL_68;
      }
    }
    goto LABEL_68;
  }
LABEL_69:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

char *sub_19C969A04(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414A78);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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

char *sub_19C969B00(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_19C976EF0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_19C969BD0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_19C976EF0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_19C969C8C(uint64_t a1)
{
  return sub_19C969A04(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_19C969CA0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_19C969D50(v6, a2, a3);
  return sub_19C969D08;
}

void sub_19C969D08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_19C969D50(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x19F39D9E0](a2, a3);
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
    return sub_19C969DD0;
  }
  __break(1u);
  return result;
}

void sub_19C969DD0(id *a1)
{
}

uint64_t sub_19C969DD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_19C976EA0();
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
    uint64_t v10 = sub_19C976EA0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_19C96B308();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414698);
          uint64_t v12 = sub_19C969CA0(v16, i, a3);
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
    type metadata accessor for SearchResult.Item();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

void *sub_19C969FDC(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v24 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v22 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *int64_t v11 = *v20;
    v11[1] = v21;
    void v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      id v23 = v22;
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = v22;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_19C96A1F0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v5[2] = ~v7;
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
    uint64_t result = swift_bridgeObjectRetain();
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

void *sub_19C96A3F0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_19C976D60();
    sub_19C968270();
    sub_19C967A84();
    uint64_t result = (void *)sub_19C976B50();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_19C976D90()) {
        goto LABEL_45;
      }
      sub_19C968270();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    unint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_19C96A6DC(void *a1)
{
  return sub_19C973C10(0, a1[2], 0, a1);
}

void sub_19C96A6F0()
{
}

char *sub_19C96A704(void *a1)
{
  id v2 = objc_msgSend(a1, sel_attributeSet);
  id v3 = objc_msgSend(v2, sel_contentType);

  if (v3)
  {
    uint64_t v4 = sub_19C9768B0();
    uint64_t v6 = v5;

    if (v4 == 0xD000000000000014 && v6 == 0x800000019C986C90 || (sub_19C976FB0() & 1) != 0)
    {
      id v7 = objc_msgSend(a1, sel_uniqueIdentifier);
      sub_19C9768B0();

      id v8 = objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
      uint64_t v9 = (char *)UserGuideTopic.init(searchableItemUniqueIdentifier:)();
      if (v9)
      {
        int64_t v10 = v9;
        unint64_t v11 = &v9[OBJC_IVAR___TPSUserGuideTopic_topicId];
        swift_beginAccess();
        uint64_t v12 = (char *)*((void *)v11 + 1);
        if (!v12)
        {

LABEL_28:
          swift_bridgeObjectRelease();
          return v12;
        }
        uint64_t v13 = *(void *)v11;
        unint64_t v14 = &v10[OBJC_IVAR___TPSUserGuideTopic_productId];
        swift_beginAccess();
        uint64_t v16 = *(void *)v14;
        uint64_t v15 = *((void *)v14 + 1);
        unint64_t v17 = (objc_class *)type metadata accessor for SearchResult.Item();
        int64_t v18 = (char *)objc_allocWithZone(v17);
        int64_t v19 = &v18[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
        *(void *)int64_t v19 = 0;
        *((void *)v19 + 1) = 0;
        uint64_t v20 = &v18[OBJC_IVAR___TPSSearchResultItem_contentType];
        *(void *)uint64_t v20 = 0;
        *((void *)v20 + 1) = 0;
        uint64_t v21 = &v18[OBJC_IVAR___TPSSearchResultItem_title];
        *(void *)uint64_t v21 = 0;
        *((void *)v21 + 1) = 0;
        uint64_t v22 = &v18[OBJC_IVAR___TPSSearchResultItem_body];
        *(void *)uint64_t v22 = 0;
        *((void *)v22 + 1) = 0;
        *(void *)&v18[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
        uint64_t v23 = &v18[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
        *(void *)uint64_t v23 = v13;
        *((void *)v23 + 1) = v12;
        uint64_t v24 = &v18[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
        *(void *)uint64_t v24 = v16;
        *((void *)v24 + 1) = v15;
        v61.receiver = v18;
        v61.super_class = v17;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v12 = (char *)objc_msgSendSuper2(&v61, sel_init);

LABEL_21:
        id v47 = objc_msgSend(a1, sel_attributeSet, v61.receiver, v61.super_class);
        id v48 = objc_msgSend(v47, sel_displayName);

        if (v48)
        {
          uint64_t v49 = sub_19C9768B0();
          uint64_t v51 = v50;
        }
        else
        {
          uint64_t v49 = 0;
          uint64_t v51 = 0;
        }
        uint64_t v52 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_title];
        swift_beginAccess();
        *uint64_t v52 = v49;
        v52[1] = v51;
        swift_bridgeObjectRelease();
        id v53 = objc_msgSend(a1, sel_attributeSet);
        id v54 = objc_msgSend(v53, sel_contentDescription);

        if (v54)
        {
          uint64_t v55 = sub_19C9768B0();
          uint64_t v57 = v56;
        }
        else
        {
          uint64_t v55 = 0;
          uint64_t v57 = 0;
        }
        uint64_t v58 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_body];
        swift_beginAccess();
        *uint64_t v58 = v55;
        v58[1] = v57;
        swift_bridgeObjectRelease();
        uint64_t v59 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_contentType];
        swift_beginAccess();
        *uint64_t v59 = v4;
        v59[1] = v6;
        goto LABEL_28;
      }
LABEL_16:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  if (qword_1E9413BB0 != -1)
  {
    swift_once();
    if (!v6) {
      return 0;
    }
    goto LABEL_11;
  }
  if (v6)
  {
LABEL_11:
    if (qword_1E9413C58 == v4 && v6 == unk_1E9413C60 || (sub_19C976FB0() & 1) != 0)
    {
      id v25 = objc_msgSend(a1, sel_uniqueIdentifier);
      uint64_t v26 = sub_19C9768B0();
      uint64_t v28 = v27;

      id v29 = objc_msgSend(a1, sel_domainIdentifier);
      if (v29)
      {
        int64_t v30 = v29;
        uint64_t v31 = sub_19C9768B0();
        unint64_t v33 = v32;
      }
      else
      {
        uint64_t v31 = 0;
        unint64_t v33 = 0xE000000000000000;
      }
      uint64_t v34 = (objc_class *)type metadata accessor for SearchResult.Item();
      uint64_t v35 = (char *)objc_allocWithZone(v34);
      uint64_t v36 = &v35[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
      *(void *)uint64_t v36 = 0;
      *((void *)v36 + 1) = 0;
      uint64_t v37 = &v35[OBJC_IVAR___TPSSearchResultItem_contentType];
      *(void *)uint64_t v37 = 0;
      *((void *)v37 + 1) = 0;
      uint64_t v38 = &v35[OBJC_IVAR___TPSSearchResultItem_title];
      *(void *)uint64_t v38 = 0;
      *((void *)v38 + 1) = 0;
      uint64_t v39 = &v35[OBJC_IVAR___TPSSearchResultItem_body];
      *(void *)uint64_t v39 = 0;
      *((void *)v39 + 1) = 0;
      *(void *)&v35[OBJC_IVAR___TPSSearchResultItem_relevance] = 0x3FF0000000000000;
      double v40 = (uint64_t *)&v35[OBJC_IVAR___TPSSearchResultItem_documentIdentifier];
      uint64_t *v40 = v26;
      v40[1] = v28;
      uint64_t v41 = (uint64_t *)&v35[OBJC_IVAR___TPSSearchResultItem_collectionIdentifier];
      *uint64_t v41 = v31;
      v41[1] = v33;
      v62.receiver = v35;
      v62.super_class = v34;
      uint64_t v12 = (char *)objc_msgSendSuper2(&v62, sel_init);
      id v42 = objc_msgSend(a1, sel_attributeSet);
      uint64_t v43 = CSSearchableItemAttributeSet.correlationIdentifier.getter();
      uint64_t v45 = v44;

      uint64_t v46 = (uint64_t *)&v12[OBJC_IVAR___TPSSearchResultItem_correlationIdentifier];
      swift_beginAccess();
      *uint64_t v46 = v43;
      v46[1] = v45;

      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  return 0;
}

uint64_t sub_19C96ACA4(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_19C976EA0();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_19C976EA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_19C976EA0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    type metadata accessor for SearchResult.Item();
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10 + 1;
      sub_19C976E30();
      uint64_t v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_19C976EB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

id sub_19C96AE38(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  uint64_t v45 = MEMORY[0x1E4FBC860];
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_19C976EA0();
    if (v9) {
      goto LABEL_3;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  unint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_30;
  }
LABEL_3:
  if ((uint64_t)v9 < 1)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v40 = a3;
  uint64_t v10 = 0;
  uint64_t v41 = &a1[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  uint64_t v11 = *MEMORY[0x1E4F23778];
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v12 = (id)MEMORY[0x19F39D9E0](v10, v6);
    }
    else {
      id v12 = *(id *)(v6 + 8 * v10 + 32);
    }
    uint64_t v13 = v12;
    unint64_t v14 = sub_19C96A704(v12);
    if (!v14)
    {

      goto LABEL_6;
    }
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v13, sel_attributeSet);
    if (objc_msgSend(v16, sel_attributeForKey_, v11))
    {
      sub_19C976D10();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v42, 0, sizeof(v42));
    }
    sub_19C8F5AE0((uint64_t)v42, (uint64_t)v43);
    if (v43[3])
    {
      if (swift_dynamicCast())
      {

        unint64_t v17 = *(double (**)(uint64_t))v41;
        if (*(void *)v41)
        {
          uint64_t v18 = swift_retain();
          double v19 = v17(v18);
          sub_19C94253C((uint64_t)v17);
          uint64_t v20 = (double *)&v15[OBJC_IVAR___TPSSearchResultItem_relevance];
          swift_beginAccess();
          *uint64_t v20 = v19;
        }

        goto LABEL_21;
      }
    }
    else
    {
      sub_19C8F58A0((uint64_t)v43);
    }

LABEL_21:
    MEMORY[0x19F39D560]();
    if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_19C976A10();
    }
    sub_19C976A30();
    sub_19C976A00();
LABEL_6:
    ++v10;
  }
  while (v9 != v10);
  swift_bridgeObjectRelease();
  uint64_t v21 = v45;
  a3 = v40;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (v45 < 0)
  {
LABEL_42:
    unint64_t v39 = swift_bridgeObjectRetain();
    uint64_t v22 = (uint64_t)sub_19C96852C(v39);
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
LABEL_31:
  if ((v21 & 0x4000000000000000) != 0) {
    goto LABEL_42;
  }
  uint64_t v22 = v21 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
LABEL_33:
  v43[0] = v22;
  sub_19C968808(v43);
  swift_bridgeObjectRelease();
  unint64_t v23 = v43[0];
  uint64_t v24 = (uint64_t *)&a1[OBJC_IVAR___TPSSearchQuery_maxCount];
  swift_beginAccess();
  uint64_t v3 = sub_19C96ACA4(*v24, v23);
  uint64_t v4 = v25;
  uint64_t v6 = v26;
  unint64_t v9 = v27;
  swift_release();
  if ((v9 & 1) == 0)
  {
LABEL_34:
    uint64_t v28 = sub_19C9683A8(v3, v4, v6, v9);
    goto LABEL_41;
  }
  sub_19C976FC0();
  swift_unknownObjectRetain_n();
  uint64_t v29 = swift_dynamicCastClass();
  if (!v29)
  {
    swift_unknownObjectRelease();
    uint64_t v29 = MEMORY[0x1E4FBC860];
  }
  uint64_t v30 = *(void *)(v29 + 16);
  swift_release();
  if (__OFSUB__(v9 >> 1, v6)) {
    goto LABEL_44;
  }
  if (v30 != (v9 >> 1) - v6)
  {
LABEL_45:
    swift_unknownObjectRelease();
    goto LABEL_34;
  }
  uint64_t v28 = swift_dynamicCastClass();
  if (!v28)
  {
    swift_unknownObjectRelease();
    uint64_t v28 = MEMORY[0x1E4FBC860];
  }
LABEL_41:
  swift_unknownObjectRelease();
  uint64_t v31 = (objc_class *)type metadata accessor for SearchResult();
  unint64_t v32 = (char *)objc_allocWithZone(v31);
  unint64_t v33 = (uint64_t *)&v32[OBJC_IVAR___TPSSearchResult_items];
  *(void *)&v32[OBJC_IVAR___TPSSearchResult_items] = v8;
  uint64_t v34 = &v32[OBJC_IVAR___TPSSearchResult_suggestions];
  *(void *)&v32[OBJC_IVAR___TPSSearchResult_suggestions] = v8;
  *(void *)&v32[OBJC_IVAR___TPSSearchResult_query] = a1;
  swift_beginAccess();
  *unint64_t v33 = v28;
  uint64_t v35 = a1;
  swift_bridgeObjectRetain();
  uint64_t v36 = v32;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v34 = a3;

  swift_bridgeObjectRelease();
  v44.receiver = v36;
  v44.super_class = v31;
  id v37 = objc_msgSendSuper2(&v44, sel_init);

  return v37;
}

unint64_t sub_19C96B308()
{
  unint64_t result = qword_1E9414A70;
  if (!qword_1E9414A70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9414698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414A70);
  }
  return result;
}

uint64_t CSSearchableItemAttributeSet.relevanceScore.getter()
{
  if (objc_msgSend(v0, sel_attributeForKey_, *MEMORY[0x1E4F23778]))
  {
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_19C8F5AE0((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)v4);
    return 0;
  }
}

uint64_t CSSearchableItemAttributeSet.correlationIdentifier.getter()
{
  return sub_19C96B4E4();
}

void CSSearchableItemAttributeSet.correlationIdentifier.setter(uint64_t a1, uint64_t a2)
{
}

void (*CSSearchableItemAttributeSet.correlationIdentifier.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = CSSearchableItemAttributeSet.correlationIdentifier.getter();
  a1[1] = v3;
  return sub_19C96B4B0;
}

void sub_19C96B4B0(uint64_t a1, char a2)
{
}

uint64_t CSSearchableItemAttributeSet.collectionIdentifier.getter()
{
  return sub_19C96B4E4();
}

uint64_t sub_19C96B4E4()
{
  uint64_t v1 = (void *)sub_19C976880();
  id v2 = objc_msgSend(v0, sel_attributeForKey_, v1);

  if (v2)
  {
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_19C8F5AE0((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_19C8F58A0((uint64_t)v6);
    return 0;
  }
}

void sub_19C96B5BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  if (*(void *)(a1 + 8))
  {
    uint64_t v6 = *a2;
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v8 = v7;
    id v9 = (id)a5();
    objc_msgSend(v6, sel_setValue_forCustomKey_, v8, v9);
  }
}

void CSSearchableItemAttributeSet.collectionIdentifier.setter(uint64_t a1, uint64_t a2)
{
}

void sub_19C96B690(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v6 = v5;
    id v7 = (id)a3();
    objc_msgSend(v3, sel_setValue_forCustomKey_, v6, v7);
  }
}

void (*CSSearchableItemAttributeSet.collectionIdentifier.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = CSSearchableItemAttributeSet.collectionIdentifier.getter();
  a1[1] = v3;
  return sub_19C96B770;
}

void sub_19C96B770(uint64_t a1, char a2)
{
}

void sub_19C96B788(uint64_t a1, char a2, uint64_t (*a3)(void))
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2)
  {
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 16);
      swift_bridgeObjectRetain();
      id v6 = (void *)sub_19C976880();
      swift_bridgeObjectRelease();
      id v7 = v6;
      id v8 = (void *)a3();
      objc_msgSend(v5, sel_setValue_forCustomKey_, v7, v8);
    }
    swift_bridgeObjectRelease();
  }
  else if (v4)
  {
    id v9 = *(void **)(a1 + 16);
    uint64_t v10 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v12 = v10;
    uint64_t v11 = (void *)a3();
    objc_msgSend(v9, sel_setValue_forCustomKey_, v12, v11);
  }
}

unint64_t static CSCustomAttributeKey.correlationIDAttributeKeyName.getter()
{
  return 0xD000000000000024;
}

unint64_t static CSCustomAttributeKey.collectionIDAttributeKeyName.getter()
{
  return 0xD000000000000023;
}

uint64_t _sSo20CSCustomAttributeKeyC8TipsCoreE022correlationIDAttributeC0ABvgZ_0()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F237C0]);
  uint64_t v1 = (void *)sub_19C976880();
  id v2 = objc_msgSend(v0, sel_initWithKeyName_searchable_searchableByDefault_unique_multiValued_, v1, 0, 0, 0, 0);

  if (v2) {
    return (uint64_t)v2;
  }
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t result = sub_19C976E90();
  __break(1u);
  return result;
}

uint64_t _sSo20CSCustomAttributeKeyC8TipsCoreE021collectionIDAttributeC0ABvgZ_0()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F237C0]);
  uint64_t v1 = (void *)sub_19C976880();
  id v2 = objc_msgSend(v0, sel_initWithKeyName_searchable_searchableByDefault_unique_multiValued_, v1, 1, 0, 0, 0);

  if (v2) {
    return (uint64_t)v2;
  }
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t result = sub_19C976E90();
  __break(1u);
  return result;
}

uint64_t sub_19C96BAFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CSSearchableItemAttributeSet.correlationIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_19C96BB28(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_19C96BB54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CSSearchableItemAttributeSet.collectionIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_19C96BB80(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void *static SearchQuery.MatchingStyle.allCases.getter()
{
  return &unk_1EED85230;
}

unint64_t SearchQuery.MatchingStyle.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t sub_19C96BBD0()
{
  return sub_19C9770A0();
}

uint64_t *sub_19C96BC00@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

void sub_19C96BC1C(void *a1@<X8>)
{
  *a1 = &unk_1EED857B0;
}

void *static SearchQuery.ContentTypeFilter.allCases.getter()
{
  return &unk_1EED857E8;
}

uint64_t sub_19C96BC3C()
{
  return sub_19C9770C0();
}

uint64_t sub_19C96BC84()
{
  return sub_19C9770C0();
}

void sub_19C96BCC8(void *a1@<X8>)
{
  *a1 = &unk_1EED85820;
}

BOOL static SearchQuery.QueryError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SearchQuery.QueryError.hash(into:)()
{
  return sub_19C9770A0();
}

uint64_t SearchQuery.QueryError.hashValue.getter()
{
  return sub_19C9770C0();
}

uint64_t SearchQuery.identifier.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchQuery_identifier);
}

uint64_t SearchQuery.identifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSSearchQuery_identifier);
}

uint64_t (*SearchQuery.identifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t SearchQuery.searchTerm.getter()
{
  return sub_19C8DE7E4(&OBJC_IVAR___TPSSearchQuery_searchTerm);
}

uint64_t SearchQuery.searchTerm.setter(uint64_t a1, uint64_t a2)
{
  return sub_19C93714C(a1, a2, &OBJC_IVAR___TPSSearchQuery_searchTerm);
}

uint64_t (*SearchQuery.searchTerm.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.options.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSSearchQuery_options;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SearchQuery.options.setter(uint64_t a1)
{
  BOOL v3 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_options);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = a1;
  return result;
}

uint64_t (*SearchQuery.options.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.matchingStyle.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSSearchQuery_matchingStyle;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SearchQuery.matchingStyle.setter(uint64_t a1)
{
  BOOL v3 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = a1;
  return result;
}

uint64_t (*SearchQuery.matchingStyle.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.contentTypeFilter.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SearchQuery.contentTypeFilter.setter(uint64_t a1)
{
  BOOL v3 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = a1;
  return result;
}

uint64_t (*SearchQuery.contentTypeFilter.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.maxCount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TPSSearchQuery_maxCount;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SearchQuery.maxCount.setter(uint64_t a1)
{
  BOOL v3 = (void *)(v1 + OBJC_IVAR___TPSSearchQuery_maxCount);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = a1;
  return result;
}

uint64_t (*SearchQuery.maxCount.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SearchQuery.isCancelled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSSearchQuery_isCancelled);
  swift_beginAccess();
  return *v1;
}

double sub_19C96C630(uint64_t a1, double a2)
{
  BOOL v3 = *(double (**)(uint64_t, double))(a1 + 32);
  uint64_t v4 = swift_retain();
  double v5 = v3(v4, a2);
  swift_release();
  return v5;
}

id SearchQuery.__allocating_init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  uint64_t v32 = a6;
  uint64_t v33 = a7;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v29 = a3;
  uint64_t v11 = sub_19C9765A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (char *)objc_allocWithZone(v8);
  id v16 = (uint64_t *)&v15[OBJC_IVAR___TPSSearchQuery_identifier];
  unint64_t v17 = v15;
  sub_19C976590();
  uint64_t v18 = sub_19C976570();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *id v16 = v18;
  v16[1] = v20;
  uint64_t v21 = &v17[OBJC_IVAR___TPSSearchQuery_searchTerm];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0xE000000000000000;
  uint64_t v22 = &v17[OBJC_IVAR___TPSSearchQuery_options];
  *(void *)&v17[OBJC_IVAR___TPSSearchQuery_options] = 0;
  unint64_t v23 = &v17[OBJC_IVAR___TPSSearchQuery_matchingStyle];
  *(void *)&v17[OBJC_IVAR___TPSSearchQuery_matchingStyle] = 0;
  uint64_t v24 = &v17[OBJC_IVAR___TPSSearchQuery_contentTypeFilter];
  *(void *)&v17[OBJC_IVAR___TPSSearchQuery_contentTypeFilter] = 0;
  *(void *)&v17[OBJC_IVAR___TPSSearchQuery_maxCount] = 50;
  v17[OBJC_IVAR___TPSSearchQuery_isCancelled] = 0;
  uint64_t v25 = &v17[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  swift_beginAccess();
  *id v16 = a1;
  v16[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v26 = v30;
  *(void *)uint64_t v21 = v29;
  *((void *)v21 + 1) = v26;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v22 = v31;
  swift_beginAccess();
  *(void *)unint64_t v23 = v32;
  swift_beginAccess();
  *(void *)uint64_t v24 = v33;

  v34.receiver = v17;
  v34.super_class = v8;
  return objc_msgSendSuper2(&v34, sel_init);
}

id SearchQuery.init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v32 = a7;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_19C9765A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t *)&v7[OBJC_IVAR___TPSSearchQuery_identifier];
  id v16 = v7;
  sub_19C976590();
  uint64_t v17 = sub_19C976570();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t *v15 = v17;
  v15[1] = v19;
  uint64_t v20 = &v16[OBJC_IVAR___TPSSearchQuery_searchTerm];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0xE000000000000000;
  uint64_t v21 = &v16[OBJC_IVAR___TPSSearchQuery_options];
  *(void *)&v16[OBJC_IVAR___TPSSearchQuery_options] = 0;
  uint64_t v22 = &v16[OBJC_IVAR___TPSSearchQuery_matchingStyle];
  *(void *)&v16[OBJC_IVAR___TPSSearchQuery_matchingStyle] = 0;
  unint64_t v23 = &v16[OBJC_IVAR___TPSSearchQuery_contentTypeFilter];
  *(void *)&v16[OBJC_IVAR___TPSSearchQuery_contentTypeFilter] = 0;
  *(void *)&v16[OBJC_IVAR___TPSSearchQuery_maxCount] = 50;
  v16[OBJC_IVAR___TPSSearchQuery_isCancelled] = 0;
  uint64_t v24 = &v16[OBJC_IVAR___TPSSearchQuery_rankingModifier];
  *(void *)uint64_t v24 = 0;
  *((void *)v24 + 1) = 0;
  swift_beginAccess();
  uint64_t *v15 = a1;
  v15[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v25 = v28;
  *(void *)uint64_t v20 = a3;
  *((void *)v20 + 1) = v25;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v21 = v29;
  swift_beginAccess();
  *(void *)uint64_t v22 = v30;
  swift_beginAccess();
  *(void *)unint64_t v23 = v32;

  v33.receiver = v16;
  v33.super_class = ObjectType;
  return objc_msgSendSuper2(&v33, sel_init);
}

id SearchQuery.__allocating_init(identifier:searchTerm:)()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v2, v3, 0, 0, 0);

  return v4;
}

id SearchQuery.init(identifier:searchTerm:)()
{
  id v1 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v1, v2, 0, 0, 0);

  return v3;
}

uint64_t SearchQuery.description.getter()
{
  return 0;
}

id SearchQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SearchQuery.init()()
{
}

id SearchQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static SearchQuery.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SearchQuery.encode(with:)(NSCoder with)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v3 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  swift_beginAccess();
  swift_bridgeObjectRetain();
  double v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  swift_beginAccess();
  id v7 = (void *)sub_19C976C90();
  id v8 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v7 forKey:v8];

  id v9 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeInteger:v10 forKey:v11];

  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  uint64_t v13 = *v12;
  unint64_t v14 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeInteger:v13 forKey:v14];

  uint64_t v15 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  uint64_t v16 = *v15;
  uint64_t v17 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeInteger:v16 forKey:v17];

  uint64_t v18 = (unsigned __int8 *)(v1 + OBJC_IVAR___TPSSearchQuery_isCancelled);
  swift_beginAccess();
  uint64_t v19 = *v18;
  uint64_t v20 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeBool:v19 forKey:v20];
}

id SearchQuery.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

char *SearchQuery.init(coder:)(void *a1)
{
  objc_super v2 = v1;
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  uint64_t v4 = sub_19C976C20();
  if (!v4) {
    goto LABEL_12;
  }
  double v5 = (void *)v4;
  uint64_t v6 = sub_19C976C20();
  if (!v6)
  {

    a1 = v5;
LABEL_12:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  id v7 = (void *)v6;
  sub_19C8DFBA0(0, &qword_1E9414898);
  id v8 = (void *)sub_19C976C20();
  if (v8)
  {
    sub_19C976CA0();

    id v8 = 0;
  }
  id v9 = (void *)sub_19C976880();
  id v10 = objc_msgSend(a1, sel_decodeIntegerForKey_, v9);

  if (v10 == (id)2) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = v10 == (id)1;
  }
  uint64_t v12 = (void *)sub_19C976880();
  unint64_t v13 = (unint64_t)objc_msgSend(a1, sel_decodeIntegerForKey_, v12);

  if (v13 != 2) {
    unint64_t v13 = v13 == 1;
  }
  unint64_t v14 = (void *)sub_19C976880();
  id v15 = objc_msgSend(a1, sel_decodeIntegerForKey_, v14);

  uint64_t v16 = (void *)sub_19C976880();
  unsigned __int8 v17 = objc_msgSend(a1, sel_decodeBoolForKey_, v16);

  uint64_t v18 = (char *)objc_msgSend(v2, sel_initWithIdentifier_searchTerm_options_matchingStyle_contentTypeFilter_, v5, v7, v8, v11, v13);
  uint64_t v19 = &v18[OBJC_IVAR___TPSSearchQuery_maxCount];
  swift_beginAccess();
  *(void *)uint64_t v19 = v15;
  uint64_t v20 = (unsigned __int8 *)&v18[OBJC_IVAR___TPSSearchQuery_isCancelled];
  swift_beginAccess();
  *uint64_t v20 = v17;
  return v18;
}

uint64_t SearchQuery.hash.getter()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_19C976990();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SearchQuery.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_19C8F5A78(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_19C8F58A0((uint64_t)v11);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v8 = 0;
    return v8 & 1;
  }
  id v3 = (uint64_t *)(v1 + OBJC_IVAR___TPSSearchQuery_identifier);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = &v10[OBJC_IVAR___TPSSearchQuery_identifier];
  swift_beginAccess();
  if (v4 == *(void *)v6 && v5 == *((void *)v6 + 1))
  {

    char v8 = 1;
  }
  else
  {
    char v8 = sub_19C976FB0();
  }
  return v8 & 1;
}

unint64_t sub_19C96DC04()
{
  unint64_t result = qword_1E9414AD8;
  if (!qword_1E9414AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414AD8);
  }
  return result;
}

uint64_t sub_19C96DC58()
{
  return sub_19C96DD00(&qword_1E9414AE0, &qword_1E9414AE8);
}

unint64_t sub_19C96DC84()
{
  unint64_t result = qword_1E9414AF0;
  if (!qword_1E9414AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414AF0);
  }
  return result;
}

uint64_t sub_19C96DCD8()
{
  return sub_19C96DD00(&qword_1E9414AF8, &qword_1E9414B00);
}

uint64_t sub_19C96DD00(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_19C96DD54()
{
  unint64_t result = qword_1E9414B08;
  if (!qword_1E9414B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414B08);
  }
  return result;
}

uint64_t type metadata accessor for SearchQuery()
{
  return self;
}

uint64_t method lookup function for SearchQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchQuery);
}

uint64_t dispatch thunk of SearchQuery.__allocating_init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

ValueMetadata *type metadata accessor for SearchQuery.MatchingStyle()
{
  return &type metadata for SearchQuery.MatchingStyle;
}

ValueMetadata *type metadata accessor for SearchQuery.ContentTypeFilter()
{
  return &type metadata for SearchQuery.ContentTypeFilter;
}

unsigned char *storeEnumTagSinglePayload for SearchQuery.QueryError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x19C96DEE4);
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

ValueMetadata *type metadata accessor for SearchQuery.QueryError()
{
  return &type metadata for SearchQuery.QueryError;
}

uint64_t sub_19C96DF1C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C96DF54()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

id sub_19C96DF74()
{
  id v0 = _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0();
  return v0;
}

uint64_t sub_19C96DF9C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516C80);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    objc_super v2 = (uint64_t *)&unk_1E9414A68;
  }
  else {
    objc_super v2 = (uint64_t *)&unk_1EB516C98;
  }
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

id _sSo14NSXPCInterfaceC8TipsCoreE25assistantSupportInterfaceABvgZ_0()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1EEDAF7C8);
  sub_19C96DF9C();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19C9809B0;
  *(void *)(inited + 32) = type metadata accessor for ResultContext();
  uint64_t v2 = sub_19C8DFBA0(0, (unint64_t *)&unk_1EB516A20);
  *(void *)(inited + 40) = v2;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited, (uint64_t)sel_findMatchingResultIdFromContexts_reply_, 0, 0);
  swift_setDeallocating();
  sub_19C96DF9C();
  uint64_t v3 = swift_initStackObject();
  *(_OWORD *)(v3 + 16) = xmmword_19C9809B0;
  *(void *)(v3 + 32) = sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  *(void *)(v3 + 40) = v2;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v3, (uint64_t)sel_availableUserGuideIdentifiersWithReply_, 0, 1);
  swift_setDeallocating();
  sub_19C96DF9C();
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_19C980A20;
  *(void *)(v4 + 32) = sub_19C8DFBA0(0, &qword_1E9414B10);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v4, (uint64_t)sel_fetchDocumentWithIdentifier_reply_, 0, 1);
  swift_setDeallocating();
  return v0;
}

void sub_19C96E174()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F50410]);
  uint64_t v1 = @"FeatureDiscoverability";
  id v2 = objc_msgSend(v0, sel_initWithUseCase_, v1);

  qword_1E9414B18 = (uint64_t)v2;
}

void sub_19C96E1D8()
{
  qword_1E9414B20 = 0x292A28746E756F63;
  *(void *)algn_1E9414B28 = 0xE800000000000000;
}

id TipsBiomeSQLQueryManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TipsBiomeSQLQueryManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeSQLQueryManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipsBiomeSQLQueryManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeSQLQueryManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19C96E334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v23 = a5 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a5 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a5 + 64);
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v10 << 6);
LABEL_9:
      uint64_t v13 = *(void *)(a5 + 56);
      unint64_t v14 = (void *)(*(void *)(a5 + 48) + 16 * v12);
      uint64_t v15 = v14[1];
      *(void *)&long long v27 = *v14;
      *((void *)&v27 + 1) = v15;
      sub_19C8F5FF4(v13 + 32 * v12, (uint64_t)v28);
      swift_bridgeObjectRetain();
      goto LABEL_28;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v16 < v24)
    {
      unint64_t v17 = *(void *)(v23 + 8 * v16);
      if (v17) {
        goto LABEL_13;
      }
      int64_t v18 = v10 + 2;
      ++v10;
      if (v16 + 1 < v24)
      {
        unint64_t v17 = *(void *)(v23 + 8 * v18);
        if (v17) {
          goto LABEL_16;
        }
        int64_t v10 = v16 + 1;
        if (v16 + 2 < v24)
        {
          unint64_t v17 = *(void *)(v23 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_13;
          }
          int64_t v18 = v16 + 3;
          int64_t v10 = v16 + 2;
          if (v16 + 3 < v24) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v8 = 0;
    memset(v28, 0, sizeof(v28));
    long long v27 = 0u;
LABEL_28:
    sub_19C96F818((uint64_t)&v27, (uint64_t)v29);
    if (!v29[1])
    {
      swift_release();
      return v31;
    }
    sub_19C93685C(&v30, &v27);
    sub_19C8F5FF4((uint64_t)&v27, (uint64_t)v26);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_19C976E10();
      sub_19C976920();
      sub_19C976920();
      sub_19C976920();
      sub_19C976920();
      swift_bridgeObjectRelease();
      sub_19C976920();
      sub_19C976E70();
      sub_19C976920();
LABEL_5:
      sub_19C976920();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    if (swift_dynamicCast())
    {
      v25[0] = 0;
      v25[1] = 0xE000000000000000;
      sub_19C976E10();
      sub_19C976920();
      sub_19C976920();
      sub_19C976920();
      sub_19C976920();
      swift_bridgeObjectRelease();
      sub_19C976920();
      sub_19C976E70();
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    if (qword_1EB516EA8 != -1) {
      swift_once();
    }
    uint64_t v19 = (id)qword_1EB516EB0;
    os_log_type_t v20 = sub_19C976BB0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v25[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v21 + 4) = sub_19C8F5F20(0xD00000000000002BLL, 0x800000019C9873E0, v25);
      _os_log_impl(&dword_19C8DC000, v19, v20, "%s", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19F39E7F0](v22, -1, -1);
      MEMORY[0x19F39E7F0](v21, -1, -1);
    }

LABEL_6:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v27);
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  unint64_t v17 = *(void *)(v23 + 8 * v18);
  if (v17)
  {
LABEL_16:
    int64_t v16 = v18;
LABEL_13:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v12 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v24)
    {
      int64_t v10 = v24 - 1;
      goto LABEL_27;
    }
    unint64_t v17 = *(void *)(v23 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_13;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_19C96E898(void *a1, void *a2)
{
  uint64_t v4 = sub_19C976560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    return;
  }
  id v8 = a2;
  id v9 = objc_msgSend(v8, sel_startDate);
  sub_19C976530();

  sub_19C976520();
  int64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v7, v4);
  id v11 = objc_msgSend(v8, sel_endDate);
  sub_19C976530();

  sub_19C976520();
  v10(v7, v4);
  uint64_t v66 = 0;
  unint64_t v67 = 0xE000000000000000;
  sub_19C976E10();
  sub_19C976920();
  id v12 = objc_msgSend(a1, sel_stream);
  sub_19C9768B0();

  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  sub_19C976B00();
  sub_19C976920();
  sub_19C976B00();
  sub_19C976920();
  uint64_t v69 = v66;
  uint64_t v70 = v67;
  id v13 = objc_msgSend(a1, sel_filterParametersForBiomeQuery);
  if (!v13)
  {

    return;
  }
  unint64_t v14 = v13;
  uint64_t v15 = sub_19C9767F0();

  int64_t v56 = 0;
  uint64_t v17 = *(void *)(v15 + 64);
  uint64_t v52 = v15 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(v15 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  int64_t v21 = (unint64_t)(v18 + 63) >> 6;
  uint64_t v22 = v65;
  uint64_t v55 = &v68;
  int64_t v47 = v21 - 1;
  *(void *)&long long v16 = 136315138;
  long long v49 = v16;
  unint64_t v48 = 0x800000019C9873B0;
  id v51 = v8;
  uint64_t v50 = v15;
  int64_t v54 = v21;
  id v53 = v65;
  while (1)
  {
    if (v20)
    {
      unint64_t v26 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v27 = v26 | (v56 << 6);
LABEL_10:
      uint64_t v28 = *(void *)(v15 + 56);
      uint64_t v29 = (void *)(*(void *)(v15 + 48) + 16 * v27);
      uint64_t v30 = v29[1];
      *(void *)&long long v64 = *v29;
      *((void *)&v64 + 1) = v30;
      sub_19C8F5FF4(v28 + 32 * v27, (uint64_t)v22);
      swift_bridgeObjectRetain();
      goto LABEL_29;
    }
    int64_t v31 = v56 + 1;
    if (__OFADD__(v56, 1))
    {
      __break(1u);
      goto LABEL_61;
    }
    if (v31 < v21)
    {
      unint64_t v32 = *(void *)(v52 + 8 * v31);
      if (v32) {
        goto LABEL_14;
      }
      int64_t v33 = v56 + 2;
      ++v56;
      if (v31 + 1 < v21)
      {
        unint64_t v32 = *(void *)(v52 + 8 * v33);
        if (v32) {
          goto LABEL_17;
        }
        int64_t v56 = v31 + 1;
        if (v31 + 2 < v21)
        {
          unint64_t v32 = *(void *)(v52 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_14;
          }
          int64_t v33 = v31 + 3;
          int64_t v56 = v31 + 2;
          if (v31 + 3 < v21) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v20 = 0;
    memset(v65, 0, sizeof(v65));
    long long v64 = 0u;
LABEL_29:
    sub_19C96F818((uint64_t)&v64, (uint64_t)&v66);
    uint64_t v34 = v67;
    if (!v67)
    {

      swift_release();
      return;
    }
    uint64_t v57 = v66;
    sub_19C93685C(v55, &v64);
    sub_19C8F5FF4((uint64_t)&v64, (uint64_t)v63);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414B30);
    if (!swift_dynamicCast())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414B50);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_19C8F5FF4((uint64_t)&v64, (uint64_t)&v58);
        if (swift_dynamicCast())
        {
          uint64_t v23 = sub_19C96E334(v69, v70, v57, v34, v62);
          uint64_t v25 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
          uint64_t v69 = v23;
          uint64_t v70 = v25;
          goto LABEL_7;
        }
LABEL_48:
        swift_bridgeObjectRelease();
LABEL_49:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
        goto LABEL_7;
      }
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        uint64_t v60 = 0;
        unint64_t v61 = 0xE000000000000000;
        sub_19C976920();
        sub_19C976920();
        swift_bridgeObjectRelease();
        sub_19C976920();
        sub_19C976E70();
        sub_19C976920();
      }
      else
      {
        if (!swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          if (qword_1EB516EA8 != -1) {
            swift_once();
          }
          uint64_t v43 = (id)qword_1EB516EB0;
          os_log_type_t v44 = sub_19C976BB0();
          if (os_log_type_enabled(v43, v44))
          {
            uint64_t v45 = swift_slowAlloc();
            uint64_t v46 = swift_slowAlloc();
            uint64_t v58 = v46;
            *(_DWORD *)uint64_t v45 = v49;
            *(void *)(v45 + 4) = sub_19C8F5F20(0xD000000000000024, v48, &v58);
            _os_log_impl(&dword_19C8DC000, v43, v44, "%s", (uint8_t *)v45, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x19F39E7F0](v46, -1, -1);
            MEMORY[0x19F39E7F0](v45, -1, -1);
          }

          goto LABEL_49;
        }
        uint64_t v58 = 0;
        unint64_t v59 = 0xE000000000000000;
        sub_19C976920();
        sub_19C976920();
        swift_bridgeObjectRelease();
        sub_19C976920();
        sub_19C976E70();
      }
      sub_19C976920();
      goto LABEL_48;
    }
    swift_bridgeObjectRelease();
    sub_19C8F5FF4((uint64_t)&v64, (uint64_t)&v58);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v35 = *(void *)(v60 + 16);
    if (v35)
    {
      uint64_t v36 = v60 + 32;
      swift_bridgeObjectRetain();
      id v37 = (void *)MEMORY[0x1E4FBC860];
      do
      {
        sub_19C8F5FF4(v36, (uint64_t)&v58);
        uint64_t v60 = 0;
        unint64_t v61 = 0xE000000000000000;
        sub_19C976E70();
        uint64_t v38 = v60;
        unint64_t v39 = v61;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v58);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v37 = sub_19C949B6C(0, v37[2] + 1, 1, v37);
        }
        unint64_t v41 = v37[2];
        unint64_t v40 = v37[3];
        if (v41 >= v40 >> 1) {
          id v37 = sub_19C949B6C((void *)(v40 > 1), v41 + 1, 1, v37);
        }
        v37[2] = v41 + 1;
        id v42 = &v37[2 * v41];
        v42[4] = v38;
        v42[5] = v39;
        v36 += 32;
        --v35;
      }
      while (v35);
      swift_bridgeObjectRelease_n();
      id v8 = v51;
      uint64_t v15 = v50;
    }
    else
    {
      swift_bridgeObjectRelease();
      id v37 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v58 = (uint64_t)v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
    sub_19C96F880();
    sub_19C976840();
    swift_bridgeObjectRelease();
    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
    sub_19C976E10();
    swift_bridgeObjectRelease();
    uint64_t v58 = 0x20444E41200ALL;
    unint64_t v59 = 0xE600000000000000;
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    sub_19C976920();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v64);
    int64_t v21 = v54;
    uint64_t v22 = v53;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
  }
  unint64_t v32 = *(void *)(v52 + 8 * v33);
  if (v32)
  {
LABEL_17:
    int64_t v31 = v33;
LABEL_14:
    unint64_t v20 = (v32 - 1) & v32;
    unint64_t v27 = __clz(__rbit64(v32)) + (v31 << 6);
    int64_t v56 = v31;
    goto LABEL_10;
  }
  while (1)
  {
    int64_t v31 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v31 >= v21)
    {
      int64_t v56 = v47;
      goto LABEL_28;
    }
    unint64_t v32 = *(void *)(v52 + 8 * v31);
    ++v33;
    if (v32) {
      goto LABEL_14;
    }
  }
LABEL_61:
  __break(1u);
}

uint64_t _s8TipsCore0A20BiomeSQLQueryManagerC14countsForEvent_8intervalSuSo013TPSContextualcH0C_So14NSDateIntervalCtFZ_0(void *a1, void *a2)
{
  sub_19C96E898(a1, a2);
  if (!v2) {
    return 0;
  }
  if (qword_1E94143B8 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)sub_19C976B70();
  swift_bridgeObjectRelease();
  uint64_t v4 = &selRef_joinType;
  uint64_t v5 = 0;
  if (objc_msgSend(v3, sel_next))
  {
    uint64_t v6 = &selRef_absoluteString;
    p_vtable = &OBJC_METACLASS___TPSFeatureFlags.vtable;
    id v8 = (void **)(&OBJC_METACLASS___TPSFeatureFlags + 24);
    unint64_t v32 = v3;
    while (1)
    {
      for (id i = objc_msgSend(v3, v6[315], v5); ; id i = objc_msgSend(v3, v6[315], v31))
      {
        id v10 = i;
        if (!v10) {
          break;
        }
        id v11 = v10;
        if (p_vtable[469] != (void *)-1) {
          swift_once();
        }
        id v12 = v8[470];
        uint64_t v34 = 0;
        unint64_t v35 = 0xE000000000000000;
        id v13 = v12;
        sub_19C976E10();
        swift_bridgeObjectRelease();
        uint64_t v34 = 0xD000000000000024;
        unint64_t v35 = 0x800000019C987320;
        swift_getErrorValue();
        sub_19C977040();
        sub_19C976920();
        swift_bridgeObjectRelease();
        uint64_t v15 = v34;
        unint64_t v14 = v35;
        os_log_type_t v16 = sub_19C976BB0();
        if (os_log_type_enabled(v13, v16))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v17 = swift_slowAlloc();
          uint64_t v18 = p_vtable;
          uint64_t v19 = v4;
          unint64_t v20 = v6;
          uint64_t v21 = swift_slowAlloc();
          uint64_t v34 = v21;
          *(_DWORD *)uint64_t v17 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v17 + 4) = sub_19C8F5F20(v15, v14, &v34);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_19C8DC000, v13, v16, "%s", (uint8_t *)v17, 0xCu);
          swift_arrayDestroy();
          uint64_t v22 = v21;
          uint64_t v6 = v20;
          uint64_t v4 = v19;
          p_vtable = v18;
          uint64_t v3 = v32;
          MEMORY[0x19F39E7F0](v22, -1, -1);
          uint64_t v23 = v17;
          id v8 = &OBJC_METACLASS___TPSFeatureFlags.vtable;
          MEMORY[0x19F39E7F0](v23, -1, -1);
        }

        swift_bridgeObjectRelease();
LABEL_8:
        if (([v3 v4[214]] & 1) == 0)
        {
          uint64_t v5 = v31;
          goto LABEL_30;
        }
      }
      id v24 = objc_msgSend(v3, sel_row);
      if (!v24) {
        goto LABEL_8;
      }
      uint64_t v25 = v24;
      uint64_t v26 = sub_19C9767F0();

      if (qword_1E94143C0 != -1) {
        swift_once();
      }
      uint64_t v33 = qword_1E9414B20;
      swift_bridgeObjectRetain();
      sub_19C976DC0();
      if (*(void *)(v26 + 16) && (unint64_t v27 = sub_19C95C6FC((uint64_t)&v34), (v28 & 1) != 0))
      {
        sub_19C8F5FF4(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v36);
      }
      else
      {
        long long v36 = 0u;
        long long v37 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_19C938C54((uint64_t)&v34);
      if (!*((void *)&v37 + 1)) {
        break;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v5 = v33;
      unsigned __int8 v29 = [v3 v4[214]];
      if ((v29 & 1) == 0) {
        goto LABEL_30;
      }
    }
    sub_19C8F58A0((uint64_t)&v36);
    goto LABEL_8;
  }
LABEL_30:

  return v5;
}

uint64_t type metadata accessor for TipsBiomeSQLQueryManager()
{
  return self;
}

uint64_t sub_19C96F818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_19C96F880()
{
  unint64_t result = qword_1E9414B38;
  if (!qword_1E9414B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EB516A10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9414B38);
  }
  return result;
}

uint64_t ResultContext.resultId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_resultId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResultContext.contextData.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  sub_19C96F958(v1, *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8));
  return v1;
}

uint64_t sub_19C96F958(uint64_t a1, unint64_t a2)
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

id ResultContext.__allocating_init(resultId:contextData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (char *)objc_allocWithZone(v4);
  id v10 = &v9[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *(void *)id v10 = a1;
  *((void *)v10 + 1) = a2;
  id v11 = &v9[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *(void *)id v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ResultContext.init(resultId:contextData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v10 = &v4[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *(void *)id v10 = a1;
  *((void *)v10 + 1) = a2;
  id v11 = &v4[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *(void *)id v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t ResultContext.conditions.getter()
{
  v7[4] = *(id *)MEMORY[0x1E4F143B8];
  if ((ResultContext.hasConditions.getter() & 1) == 0) {
    return sub_19C935804(MEMORY[0x1E4FBC860]);
  }
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_19C9764E0();
  v7[0] = 0;
  id v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, v7);

  if (v2)
  {
    id v3 = v7[0];
    sub_19C976D10();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414B50);
    if (swift_dynamicCast()) {
      return v6;
    }
    return sub_19C935804(MEMORY[0x1E4FBC860]);
  }
  id v5 = v7[0];
  sub_19C9763E0();

  return swift_willThrow();
}

uint64_t ResultContext.hasConditions.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8);
  char v3 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      if ((int)v1 == v1 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 2uLL:
      if (*(void *)(v1 + 16) == *(void *)(v1 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 3uLL:
      return v3 & 1;
    default:
      if ((v2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        uint64_t v4 = sub_19C96FCD8(0x6C6C756EuLL, 0xE400000000000000);
        unint64_t v6 = v5;
        char v7 = sub_19C97146C(v1, v2, v4, v5);
        sub_19C9452BC(v4, v6);
        char v3 = v7 ^ 1;
      }
      else
      {
LABEL_7:
        char v3 = 0;
      }
      return v3 & 1;
  }
}

uint64_t sub_19C96FCD8(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414B78);
  if (swift_dynamicCast())
  {
    sub_19C971AE8(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_0(&v41, v43);
    sub_19C976350();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_19C971754((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      char v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_19C976E50();
      }
      if (v4) {
        unint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        unint64_t v6 = 0;
      }
      char v7 = (uint64_t *)v4;
    }
    id v8 = sub_19C971978(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_19C976930();
    goto LABEL_17;
  }
LABEL_69:
  id v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_19C9719DC(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x1F4188790](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_19C970DB0((void *(*)(uint64_t *__return_ptr, char *, char *))sub_19C971A7C);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_19C9764C0();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_19C970D34(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_19C976970();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_19C976E50();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_19C970D34(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_19C976940();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_19C9764D0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  id v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_19C9764D0();
    sub_19C9452A8(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_19C9452A8((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t ResultContext.description.getter()
{
  sub_19C976E10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8);
  sub_19C96F958(v1, v2);
  sub_19C9764A0();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C9452BC(v1, v2);
  return 0x6449746C75736572;
}

id sub_19C970338(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t ResultContext.debugDescription.getter()
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  v12[0] = 0;
  v12[1] = (id)0xE000000000000000;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData);
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC8TipsCore13ResultContext_contextData + 8);
  sub_19C96F958(v1, v2);
  sub_19C9764A0();
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C9452BC(v1, v2);
  sub_19C976920();
  if ((ResultContext.hasConditions.getter() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v3 = self;
  id v4 = (void *)sub_19C9764E0();
  v12[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 0, v12);

  if (!v5)
  {
    id v8 = v12[0];
    unint64_t v9 = (void *)sub_19C9763E0();

    swift_willThrow();
    char v7 = 0;
    goto LABEL_7;
  }
  id v6 = v12[0];
  sub_19C976D10();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414B50);
  if (swift_dynamicCast()) {
    char v7 = v11;
  }
  else {
LABEL_5:
  }
    char v7 = (void *)sub_19C935804(MEMORY[0x1E4FBC860]);
LABEL_7:
  v12[0] = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414B58);
  sub_19C9768E0();
  sub_19C976920();
  swift_bridgeObjectRelease();
  return 0x6449746C75736572;
}

id ResultContext.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ResultContext.init()()
{
}

id ResultContext.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ResultContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ResultContext.encode(with:)(NSCoder with)
{
  objc_super v2 = (void *)sub_19C976880();
  unint64_t v3 = (void *)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v2 forKey:v3];

  id v4 = (void *)sub_19C9764E0();
  id v5 = (id)sub_19C976880();
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];
}

id ResultContext.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ResultContext.init(coder:)(void *a1)
{
  objc_super v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_19C8DFBA0(0, (unint64_t *)&qword_1EB516C90);
  id v5 = v2;
  uint64_t v6 = sub_19C976C20();
  if (!v6) {
    goto LABEL_5;
  }
  char v7 = (void *)v6;
  uint64_t v8 = sub_19C9768B0();
  uint64_t v10 = v9;

  sub_19C8DFBA0(0, (unint64_t *)&unk_1E9414B68);
  uint64_t v11 = sub_19C976C20();
  if (!v11)
  {
    swift_bridgeObjectRelease();
LABEL_5:

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = sub_19C9764F0();
  uint64_t v15 = v14;

  uint64_t v16 = (char *)objc_allocWithZone(ObjectType);
  uint64_t v17 = (uint64_t *)&v16[OBJC_IVAR____TtC8TipsCore13ResultContext_resultId];
  *uint64_t v17 = v8;
  v17[1] = v10;
  uint64_t v18 = (uint64_t *)&v16[OBJC_IVAR____TtC8TipsCore13ResultContext_contextData];
  *uint64_t v18 = v13;
  v18[1] = v15;
  v21.receiver = v16;
  v21.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v21, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v19;
}

uint64_t sub_19C970AC0@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_19C96F958(a2, a3);
      uint64_t v10 = (char *)sub_19C976300();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_19C976330();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_19C976320();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x19C970D24);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_19C9452BC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_19C976300();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_19C976330();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_19C976320();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_19C970D34(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_19C976980();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x19F39D4F0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_19C970DB0(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)id v1 = xmmword_19C981720;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_19C976300() && __OFSUB__((int)v4, sub_19C976330())) {
        goto LABEL_24;
      }
      sub_19C976340();
      swift_allocObject();
      uint64_t v13 = sub_19C9762E0();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_19C97119C((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_19C976490();
      uint64_t result = sub_19C97119C(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *id v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *id v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *id v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_19C9710B4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (unsigned char *)sub_19C9717B4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_19C971878((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_19C9718F4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_19C97112C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_19C97119C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_19C976300();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_19C976330();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_19C976320();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_19C971250@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_19C976E20();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_19C9712DC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_19C970AC0((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_19C9713B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_19C976300();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_19C976330();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_19C976320();
  sub_19C970AC0(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_19C97146C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x19C9716D4);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_19C96F958(a3, a4);
                  sub_19C96F958(a1, a2);
                  char v17 = sub_19C9713B4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_19C9452BC(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_19C96F958(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_19C9713B4(v21, v22, v20, a3, a4);
                  sub_19C9452BC(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_19C96F958(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_19C96F958(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_19C9712DC(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_19C9452BC(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t type metadata accessor for ResultContext()
{
  return self;
}

uint64_t method lookup function for ResultContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ResultContext);
}

uint64_t dispatch thunk of ResultContext.__allocating_init(resultId:contextData:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_19C971754(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414B80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19C9717B4(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_19C971878(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_19C976340();
  swift_allocObject();
  uint64_t result = sub_19C9762F0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_19C9764B0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_19C9718F4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_19C976340();
  swift_allocObject();
  uint64_t result = sub_19C9762F0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_19C971978(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_19C9717B4(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_19C971878((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_19C9718F4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_19C9719DC(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_19C976340();
      swift_allocObject();
      sub_19C976310();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_19C9764B0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_19C971A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_19C97112C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_19C971B00, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_19C971AE8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_19C971B00@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_19C971250(a1, a2);
}

void *sub_19C971B20()
{
  uint64_t result = (void *)sub_19C971B40();
  off_1E9414B90 = result;
  return result;
}

unint64_t sub_19C971B40()
{
  id v0 = (id)BiomeLibrary();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414BE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19C980A10;
  *(void *)(inited + 32) = sub_19C9768B0();
  *(void *)(inited + 40) = v2;
  id v3 = objc_msgSend(objc_msgSend(v0, sel_App), sel_InFocus);
  swift_unknownObjectRelease();
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = sub_19C9768B0();
  *(void *)(inited + 64) = v4;
  id v5 = objc_msgSend(objc_msgSend(v0, sel_Device), sel_Wireless);
  swift_unknownObjectRelease();
  id v6 = objc_msgSend(v5, sel_Bluetooth);
  swift_unknownObjectRelease();
  *(void *)(inited + 72) = v6;
  *(void *)(inited + 80) = sub_19C9768B0();
  *(void *)(inited + 88) = v7;
  id v8 = objc_msgSend(objc_msgSend(v0, sel_Discoverability), sel_Signals);
  swift_unknownObjectRelease();
  *(void *)(inited + 96) = v8;
  *(void *)(inited + 104) = sub_19C9768B0();
  *(void *)(inited + 112) = v9;
  id v10 = objc_msgSend(objc_msgSend(v0, sel_UserFocus), sel_ComputedMode);
  swift_unknownObjectRelease();
  *(void *)(inited + 120) = v10;
  unint64_t v11 = sub_19C93593C(inited);
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_19C971D2C()
{
  if (qword_1EB516E90 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB516E98;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  v5[1] = 0xE900000000000020;
  sub_19C976920();
  sub_19C976920();
  os_log_type_t v1 = sub_19C976BB0();
  if (os_log_type_enabled(v0, v1))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    v5[0] = v3;
    *(_DWORD *)uint64_t v2 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(0x726F66206B6E6953, 0xE900000000000020, v5);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v0, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v3, -1, -1);
    MEMORY[0x19F39E7F0](v2, -1, -1);

    return swift_bridgeObjectRelease();
  }
  else
  {

    return swift_bridgeObjectRelease();
  }
}

void sub_19C971F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v8 = a2 + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x19F39E8A0](v8);
  if (v9)
  {
    id v10 = (void *)v9;
    unint64_t v11 = *(NSObject **)(v9 + OBJC_IVAR___TPSBiomeDataProvider_registrationQueue);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = v10;
    uint64_t v12[3] = a3;
    void v12[4] = a4;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_19C974A84;
    *(void *)(v13 + 24) = v12;
    aBlock[4] = sub_19C974A58;
    void aBlock[5] = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_19C94CBA8;
    aBlock[3] = &block_descriptor_58_0;
    uint64_t v14 = _Block_copy(aBlock);
    id v15 = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v11, v14);
    _Block_release(v14);
    LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (v11)
    {
      __break(1u);
    }
    else
    {
      a5(a3, a4);
    }
  }
}

uint64_t sub_19C972118(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_19C972178(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v8 = a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v7;
  *uint64_t v7 = 0x8000000000000000;
  sub_19C936804((uint64_t)v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v7 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_19C97232C()
{
  os_log_type_t v1 = v0;
  if (qword_1EB516E90 != -1) {
LABEL_31:
  }
    swift_once();
  uint64_t aBlock = 0;
  unint64_t v33 = 0xE000000000000000;
  uint64_t v2 = (id)qword_1EB516E98;
  sub_19C976E10();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD00000000000001FLL;
  unint64_t v33 = 0x800000019C9875D0;
  uint64_t v3 = &v1[OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414BD8);
  sub_19C976810();
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = aBlock;
  unint64_t v4 = v33;
  os_log_type_t v6 = sub_19C976BB0();
  if (os_log_type_enabled(v2, v6))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t aBlock = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_19C8F5F20(v5, v4, &aBlock);
    sub_19C976CB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19C8DC000, v2, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F39E7F0](v8, -1, -1);
    MEMORY[0x19F39E7F0](v7, -1, -1);
  }

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)v3;
  uint64_t v29 = *(void *)v3 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(*(void *)v3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(*(void *)v3 + 64);
  int64_t v30 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v31 = OBJC_IVAR___TPSBiomeDataProvider_registrationQueue;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  int64_t v15 = 0;
  while (v12)
  {
    unint64_t v16 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v17 = v16 | (v15 << 6);
LABEL_8:
    uint64_t v18 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v17);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = *(NSObject **)&v1[v31];
    uint64_t v22 = (void *)swift_allocObject();
    void v22[2] = v1;
    v22[3] = v19;
    v22[4] = v20;
    swift_bridgeObjectRetain();
    int v23 = v1;
    sub_19C94253C((uint64_t)v14);
    uint64_t v24 = swift_allocObject();
    uint64_t v14 = sub_19C974030;
    *(void *)(v24 + 16) = sub_19C974030;
    *(void *)(v24 + 24) = v22;
    long long v36 = sub_19C974A58;
    uint64_t v37 = v24;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v33 = 1107296256;
    uint64_t v34 = sub_19C94CBA8;
    uint64_t v35 = &block_descriptor_19_0;
    unint64_t v25 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    dispatch_sync(v21, v25);
    _Block_release(v25);
    LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (v19)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
  int64_t v26 = v15 + 1;
  if (__OFADD__(v15, 1)) {
    goto LABEL_30;
  }
  if (v26 >= v30)
  {
LABEL_28:
    swift_release();
    return sub_19C94253C((uint64_t)v14);
  }
  unint64_t v27 = *(void *)(v29 + 8 * v26);
  ++v15;
  if (v27) {
    goto LABEL_27;
  }
  int64_t v15 = v26 + 1;
  if (v26 + 1 >= v30) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v29 + 8 * v15);
  if (v27) {
    goto LABEL_27;
  }
  int64_t v15 = v26 + 2;
  if (v26 + 2 >= v30) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v29 + 8 * v15);
  if (v27) {
    goto LABEL_27;
  }
  int64_t v15 = v26 + 3;
  if (v26 + 3 >= v30) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v29 + 8 * v15);
  if (v27) {
    goto LABEL_27;
  }
  int64_t v15 = v26 + 4;
  if (v26 + 4 >= v30) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v29 + 8 * v15);
  if (v27)
  {
LABEL_27:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v17 = __clz(__rbit64(v27)) + (v15 << 6);
    goto LABEL_8;
  }
  int64_t v28 = v26 + 5;
  if (v28 >= v30) {
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v29 + 8 * v28);
  if (v27)
  {
    int64_t v15 = v28;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v15 >= v30) {
      goto LABEL_28;
    }
    unint64_t v27 = *(void *)(v29 + 8 * v15);
    ++v28;
    if (v27) {
      goto LABEL_27;
    }
  }
  __break(1u);
  return result;
}

void sub_19C972840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_19C95C684(a2, a3);
    if (v8)
    {
      id v9 = *(id *)(*(void *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_cancel);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v10 = (void *)sub_19C95C944(a2, a3);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_19C97299C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR___TPSBiomeDataProvider_registrationQueue];
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_19C974008;
  *(void *)(v7 + 24) = v6;
  void v12[4] = sub_19C974024;
  id v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_19C94CBA8;
  uint64_t v12[3] = &block_descriptor_7;
  char v8 = _Block_copy(v12);
  id v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_19C972B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_19C95C684(a2, a3);
    if (v8)
    {
      id v9 = *(id *)(*(void *)(v6 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1EB516E90 != -1) {
        swift_once();
      }
      uint64_t v10 = (id)qword_1EB516E98;
      sub_19C976E10();
      swift_bridgeObjectRelease();
      v17[0] = 0xD00000000000001CLL;
      v17[1] = 0x800000019C9875B0;
      sub_19C976920();
      os_log_type_t v11 = sub_19C976BB0();
      if (os_log_type_enabled(v10, v11))
      {
        swift_bridgeObjectRetain_n();
        id v16 = v9;
        unint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        v17[0] = v13;
        *(_DWORD *)unint64_t v12 = 136315138;
        swift_bridgeObjectRetain();
        sub_19C8F5F20(0xD00000000000001CLL, 0x800000019C9875B0, v17);
        sub_19C976CB0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19C8DC000, v10, v11, "%s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19F39E7F0](v13, -1, -1);
        uint64_t v14 = v12;
        id v9 = v16;
        MEMORY[0x19F39E7F0](v14, -1, -1);
      }
      else
      {
      }
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_cancel);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      int64_t v15 = (void *)sub_19C95C944(a2, a3);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_19C972E44(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = (void **)result;
  if (!a2) {
    return result;
  }
  uint64_t v3 = a3;
  uint64_t v43 = a2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  unint64_t v8 = (unint64_t)(v5 + 63) >> 6;
  id v9 = (void *)MEMORY[0x1E4FBC860];
  if (a3) {
    id v9 = (void *)a3;
  }
  int64_t v44 = v8;
  uint64_t v45 = v9;
  unint64_t v41 = v8 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v10 << 6);
LABEL_12:
      uint64_t v16 = *(void *)(a2 + 56);
      unint64_t v17 = (void *)(*(void *)(a2 + 48) + 16 * v15);
      uint64_t v18 = v17[1];
      *(void *)&long long v51 = *v17;
      *((void *)&v51 + 1) = v18;
      sub_19C8F5FF4(v16 + 32 * v15, (uint64_t)v52);
      swift_bridgeObjectRetain();
      goto LABEL_31;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_55;
    }
    if (v19 < v44)
    {
      unint64_t v20 = *(void *)(v43 + 8 * v19);
      if (v20) {
        goto LABEL_16;
      }
      int64_t v21 = v10 + 2;
      ++v10;
      if (v19 + 1 < v44)
      {
        unint64_t v20 = *(void *)(v43 + 8 * v21);
        if (v20) {
          goto LABEL_19;
        }
        unint64_t v10 = v19 + 1;
        if (v19 + 2 < v44)
        {
          unint64_t v20 = *(void *)(v43 + 8 * (v19 + 2));
          if (v20)
          {
            v19 += 2;
            goto LABEL_16;
          }
          int64_t v21 = v19 + 3;
          unint64_t v10 = v19 + 2;
          if (v19 + 3 < v44) {
            break;
          }
        }
      }
    }
LABEL_30:
    unint64_t v7 = 0;
    memset(v52, 0, sizeof(v52));
    long long v51 = 0u;
LABEL_31:
    sub_19C96F818((uint64_t)&v51, (uint64_t)&v53);
    uint64_t v22 = v54;
    if (!v54) {
      return swift_release();
    }
    uint64_t v23 = v53;
    sub_19C93685C(&v55, &v51);
    sub_19C8F5FF4((uint64_t)&v51, (uint64_t)v50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94145B0);
    if (!swift_dynamicCast())
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9414BC0);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_19C973DB8(v3);
        swift_bridgeObjectRelease();
        sub_19C8F5FF4((uint64_t)&v51, (uint64_t)&v48);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414BC8);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_51;
        }
        os_log_type_t v11 = *v46;
        unint64_t v12 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        id v13 = objc_msgSend(v11, sel_filterWithKeyPath_comparison_value_, v12, 3, v47);
        swift_unknownObjectRelease();

        goto LABEL_8;
      }
      if (swift_dynamicCast())
      {
        sub_19C973DB8(v3);
        swift_bridgeObjectRelease();
        uint64_t v29 = *v46;
        int64_t v30 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        uint64_t v31 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        id v32 = objc_msgSend(v29, sel_filterWithKeyPath_value_, v30, v31);
      }
      else
      {
        if (!swift_dynamicCast())
        {
          if (qword_1EB516E90 != -1) {
            swift_once();
          }
          uint64_t v48 = 0;
          unint64_t v49 = 0xE000000000000000;
          uint64_t v34 = (id)qword_1EB516E98;
          sub_19C976E10();
          sub_19C976920();
          swift_bridgeObjectRelease();
          sub_19C976920();
          __swift_project_boxed_opaque_existential_0(&v51, *((uint64_t *)&v52[0] + 1));
          swift_getDynamicType();
          sub_19C977110();
          sub_19C976920();
          swift_bridgeObjectRelease();
          uint64_t v36 = v48;
          unint64_t v35 = v49;
          os_log_type_t v37 = sub_19C976BB0();
          if (os_log_type_enabled(v34, v37))
          {
            swift_bridgeObjectRetain_n();
            uint64_t v38 = swift_slowAlloc();
            uint64_t v42 = v3;
            uint64_t v39 = swift_slowAlloc();
            uint64_t v48 = v39;
            *(_DWORD *)uint64_t v38 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)(v38 + 4) = sub_19C8F5F20(v36, v35, &v48);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_19C8DC000, v34, v37, "%s", (uint8_t *)v38, 0xCu);
            swift_arrayDestroy();
            uint64_t v40 = v39;
            uint64_t v3 = v42;
            MEMORY[0x19F39E7F0](v40, -1, -1);
            MEMORY[0x19F39E7F0](v38, -1, -1);
          }

LABEL_51:
          swift_bridgeObjectRelease();
LABEL_8:
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v51);
          goto LABEL_9;
        }
        sub_19C973DB8(v3);
        swift_bridgeObjectRelease();
        unint64_t v33 = *v46;
        int64_t v30 = (void *)sub_19C976880();
        swift_bridgeObjectRelease();
        uint64_t v31 = (void *)sub_19C976B60();
        id v32 = objc_msgSend(v33, sel_filterWithKeyPath_value_, v30, v31);
      }

      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    uint64_t v24 = v3;
    swift_bridgeObjectRetain();
    unint64_t v25 = v45;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v25 = sub_19C949B6C(0, v45[2] + 1, 1, v45);
    }
    unint64_t v27 = v25[2];
    unint64_t v26 = v25[3];
    if (v27 >= v26 >> 1) {
      unint64_t v25 = sub_19C949B6C((void *)(v26 > 1), v27 + 1, 1, v25);
    }
    uint64_t v25[2] = v27 + 1;
    int64_t v28 = &v25[2 * v27];
    v28[4] = v23;
    v28[5] = v22;
    sub_19C972E44(v46, a2, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v51);
    uint64_t v3 = v24;
LABEL_9:
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
  }
  unint64_t v20 = *(void *)(v43 + 8 * v21);
  if (v20)
  {
LABEL_19:
    int64_t v19 = v21;
LABEL_16:
    unint64_t v7 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v19 << 6);
    unint64_t v10 = v19;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v19 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v19 >= v44)
    {
      unint64_t v10 = v41;
      goto LABEL_30;
    }
    unint64_t v20 = *(void *)(v43 + 8 * v19);
    ++v21;
    if (v20) {
      goto LABEL_16;
    }
  }
LABEL_55:
  __break(1u);
  return result;
}

id TipsBiomeDataProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TipsBiomeDataProvider.init()()
{
  uint64_t v1 = sub_19C976BC0();
  MEMORY[0x1F4188790](v1);
  uint64_t v2 = sub_19C976750();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_19C976BE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR___TPSBiomeDataProvider_biomeRegistrations;
  unint64_t v8 = v0;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v0[v7] = sub_19C935948(MEMORY[0x1E4FBC860]);
  uint64_t v12 = OBJC_IVAR___TPSBiomeDataProvider_registrationQueue;
  sub_19C95E1BC();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  sub_19C976730();
  uint64_t v14 = v9;
  sub_19C95E1FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
  sub_19C973FC0((unint64_t *)&qword_1EB516C60, &qword_1EB516C58);
  sub_19C976D30();
  *(void *)&v8[v12] = sub_19C976C10();

  unint64_t v10 = (objc_class *)type metadata accessor for TipsBiomeDataProvider();
  v13.receiver = v8;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for TipsBiomeDataProvider()
{
  return self;
}

id TipsBiomeDataProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsBiomeDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TipsBiomeDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TipsBiomeDataProvider);
}

uint64_t sub_19C9738F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19C973934(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19C973914(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19C973AA4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19C973934(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516CA8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  objc_super v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C973AA4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413CA0);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  objc_super v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C973C10(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9414A80);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9413C30);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_19C976EF0();
  __break(1u);
  return result;
}

uint64_t sub_19C973DB8(uint64_t a1)
{
  if (a1)
  {
    int64_t v2 = *(void *)(a1 + 16);
    if (v2)
    {
      uint64_t v8 = MEMORY[0x1E4FBC860];
      sub_19C973914(0, v2, 0);
      uint64_t v3 = a1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_19C976920();
        swift_bridgeObjectRelease();
        unint64_t v5 = *(void *)(v8 + 16);
        unint64_t v4 = *(void *)(v8 + 24);
        if (v5 >= v4 >> 1) {
          sub_19C973914(v4 > 1, v5 + 1, 1);
        }
        v3 += 16;
        *(void *)(v8 + 16) = v5 + 1;
        uint64_t v6 = v8 + 16 * v5;
        *(void *)(v6 + 32) = 46;
        *(void *)(v6 + 40) = 0xE100000000000000;
        --v2;
      }
      while (v2);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB516A10);
      sub_19C973FC0((unint64_t *)&qword_1E9414B38, (uint64_t *)&unk_1EB516A10);
      sub_19C976840();
      swift_release();
    }
  }
  sub_19C976920();
  swift_bridgeObjectRelease();
  sub_19C976920();
  swift_bridgeObjectRetain();
  sub_19C976920();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x646F42746E657665;
}

uint64_t sub_19C973FC0(unint64_t *a1, uint64_t *a2)
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

void sub_19C974008()
{
  sub_19C972B0C(v0[2], v0[3], v0[4]);
}

uint64_t sub_19C974014()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C974024()
{
  return sub_19C94CB80(*(uint64_t (**)(void))(v0 + 16));
}

void sub_19C974030()
{
  sub_19C972840(v0[2], v0[3], v0[4]);
}

uint64_t sub_19C97403C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C97404C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_19C974084()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_19C976880();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t sub_19C9740DC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  id v58 = a4;
  uint64_t v59 = a5;
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  uint64_t v8 = (void *)sub_19C976BE0();
  int64_t v56 = (void (**)(void, void, void))*(v8 - 1);
  id v57 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_19C976BC0();
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = sub_19C976750();
  MEMORY[0x1F4188790](v12 - 8);
  if (qword_1E94143C8 != -1) {
    swift_once();
  }
  unint64_t v13 = a1;
  id v14 = objc_msgSend(a1, sel_stream);
  uint64_t v15 = sub_19C9768B0();
  uint64_t v17 = v16;

  swift_beginAccess();
  uint64_t v18 = off_1E9414B90;
  if (*((void *)off_1E9414B90 + 2) && (unint64_t v19 = sub_19C95C684(v15, v17), (v20 & 1) != 0))
  {
    uint64_t v54 = v6;
    int64_t v21 = *(void **)(v18[7] + 8 * v19);
    swift_endAccess();
    id v55 = v21;
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0;
    unint64_t v63 = 0xE000000000000000;
    sub_19C976E10();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0x6C7070612E6D6F63;
    unint64_t v63 = 0xEF2E737069742E65;
    id v53 = v13;
    id v22 = objc_msgSend(v13, sel_stream);
    sub_19C9768B0();

    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C976920();
    sub_19C976920();
    v51[0] = v63;
    v51[1] = aBlock;
    unint64_t aBlock = 0;
    unint64_t v63 = 0xE000000000000000;
    sub_19C976E10();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD000000000000010;
    unint64_t v63 = 0x800000019C9875F0;
    uint64_t v52 = @"FeatureDiscoverability";
    sub_19C9768B0();
    sub_19C976920();
    swift_bridgeObjectRelease();
    sub_19C95E1BC();
    sub_19C976920();
    sub_19C976920();
    sub_19C976730();
    unint64_t aBlock = MEMORY[0x1E4FBC860];
    sub_19C95E1FC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C58);
    sub_19C973FC0((unint64_t *)&qword_1EB516C60, &qword_1EB516C58);
    sub_19C976D30();
    ((void (**)(char *, void, id))v56)[13](v10, *MEMORY[0x1E4FBCC58], v57);
    uint64_t v23 = (void *)sub_19C976C10();
    id v24 = objc_allocWithZone(MEMORY[0x1E4F502E8]);
    id v25 = v23;
    unint64_t v26 = (void *)sub_19C976880();
    swift_bridgeObjectRelease();
    id v27 = objc_msgSend(v24, sel_initWithIdentifier_targetQueue_waking_, v26, v25, 1);

    id v57 = v25;
    id v28 = objc_msgSend(v55, sel_DSLPublisherWithUseCase_, v52);
    v68[0] = v28;
    id v29 = objc_msgSend(v53, sel_filterParametersForBiomeQuery);
    if (v29)
    {
      int64_t v30 = v29;
      uint64_t v31 = sub_19C9767F0();
    }
    else
    {
      uint64_t v31 = 0;
    }
    unint64_t v33 = v54;
    sub_19C972E44((uint64_t)v68, v31, 0);
    swift_bridgeObjectRelease();
    id v34 = objc_msgSend(v28, sel_subscribeOn_, v27);
    uint64_t v35 = swift_allocObject();
    uint64_t v36 = v60;
    uint64_t v37 = v61;
    *(void *)(v35 + 16) = v60;
    *(void *)(v35 + 24) = v37;
    uint64_t v66 = sub_19C974908;
    unint64_t v67 = (void *)v35;
    unint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v63 = 1107296256;
    long long v64 = sub_19C93B228;
    uint64_t v65 = &block_descriptor_28_0;
    uint64_t v38 = _Block_copy(&aBlock);
    int64_t v56 = (void (**)(void, void, void))v28;
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v40 = (void *)swift_allocObject();
    v40[2] = v39;
    v40[3] = v36;
    id v41 = v58;
    uint64_t v42 = v59;
    v40[4] = v37;
    v40[5] = v41;
    v40[6] = v42;
    uint64_t v66 = (uint64_t (*)())sub_19C974990;
    unint64_t v67 = v40;
    unint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v63 = 1107296256;
    long long v64 = sub_19C972118;
    uint64_t v65 = &block_descriptor_37;
    uint64_t v43 = _Block_copy(&aBlock);
    id v58 = v27;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    id v44 = objc_msgSend(v34, sel_sinkWithCompletion_receiveInput_, v38, v43);
    _Block_release(v43);
    _Block_release(v38);

    uint64_t v45 = *(NSObject **)&v33[OBJC_IVAR___TPSBiomeDataProvider_registrationQueue];
    uint64_t v46 = (void *)swift_allocObject();
    void v46[2] = v33;
    v46[3] = v36;
    v46[4] = v37;
    v46[5] = v44;
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = sub_19C9749E8;
    *(void *)(v47 + 24) = v46;
    uint64_t v66 = sub_19C974A58;
    unint64_t v67 = (void *)v47;
    unint64_t aBlock = MEMORY[0x1E4F143A8];
    unint64_t v63 = 1107296256;
    long long v64 = sub_19C94CBA8;
    uint64_t v65 = &block_descriptor_47;
    uint64_t v48 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    unint64_t v49 = v33;
    id v50 = v44;
    swift_retain();
    swift_release();
    dispatch_sync(v45, v48);
    _Block_release(v48);

    LOBYTE(v45) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v45) {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_19C9748D0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19C974908()
{
  return sub_19C971D2C();
}

uint64_t sub_19C974910()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_19C974948()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_19C974990(uint64_t a1)
{
  sub_19C971F58(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(uint64_t, uint64_t))(v1 + 40));
}

uint64_t sub_19C9749A0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_19C9749E8()
{
  return sub_19C972178(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_19C9749F4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_19C974A48()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t __getPPCExtensibleSSOAuthenticatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSStringCacheController formattedDataWithData:](v0);
}

uint64_t __getPPCRedirectClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded](v0);
}

uint64_t sub_19C9761B0()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_19C9761C0()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_19C9761D0()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_19C9761E0()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_19C9761F0()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_19C976200()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_19C976210()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_19C976220()
{
  return MEMORY[0x1F40E3660]();
}

uint64_t sub_19C976230()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_19C976240()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_19C976250()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_19C976260()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_19C976270()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_19C976280()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_19C976290()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_19C9762A0()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_19C9762B0()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_19C9762C0()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_19C9762D0()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_19C9762E0()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_19C9762F0()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_19C976300()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_19C976310()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_19C976320()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_19C976330()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_19C976340()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_19C976350()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_19C9763A0()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_19C9763D0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_19C9763E0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_19C9763F0()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_19C976400()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_19C976410()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_19C976420()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_19C976430()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_19C976440()
{
  return MEMORY[0x1F40E4AF8]();
}

uint64_t sub_19C976450()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_19C976460()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_19C976470()
{
  return MEMORY[0x1F40E4B48]();
}

uint64_t sub_19C976480()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_19C976490()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_19C9764A0()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_19C9764B0()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_19C9764C0()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_19C9764D0()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_19C9764E0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_19C9764F0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_19C976500()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_19C976510()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_19C976520()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_19C976530()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_19C976540()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_19C976550()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_19C976560()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_19C976570()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_19C976580()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_19C976590()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_19C9765A0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_19C9765B0()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_19C9765C0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_19C9765D0()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_19C9765E0()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_19C9765F0()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_19C976600()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_19C976610()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_19C976620()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_19C976630()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_19C976640()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_19C976650()
{
  return MEMORY[0x1F40F1FF0]();
}

uint64_t sub_19C976660()
{
  return MEMORY[0x1F40F2390]();
}

uint64_t sub_19C976680()
{
  return MEMORY[0x1F40F23B8]();
}

uint64_t sub_19C976690()
{
  return MEMORY[0x1F40F23C0]();
}

uint64_t sub_19C9766A0()
{
  return MEMORY[0x1F40F23C8]();
}

uint64_t sub_19C9766B0()
{
  return MEMORY[0x1F40F2690]();
}

uint64_t sub_19C9766C0()
{
  return MEMORY[0x1F40F26B0]();
}

uint64_t sub_19C9766D0()
{
  return MEMORY[0x1F40F26E0]();
}

uint64_t sub_19C9766E0()
{
  return MEMORY[0x1F40F26F8]();
}

uint64_t sub_19C9766F0()
{
  return MEMORY[0x1F40F2700]();
}

uint64_t sub_19C976700()
{
  return MEMORY[0x1F40F2708]();
}

uint64_t sub_19C976710()
{
  return MEMORY[0x1F40F2718]();
}

uint64_t sub_19C976720()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_19C976730()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_19C976740()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_19C976750()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_19C976760()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_19C976770()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_19C976780()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_19C976790()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_19C9767A0()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_19C9767B0()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_19C9767C0()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_19C9767D0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_19C9767E0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_19C9767F0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_19C976800()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_19C976810()
{
  return MEMORY[0x1F4183370]();
}

uint64_t sub_19C976820()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_19C976830()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_19C976840()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_19C976850()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_19C976860()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_19C976870()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_19C976880()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_19C976890()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_19C9768A0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_19C9768B0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_19C9768C0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_19C9768D0()
{
  return MEMORY[0x1F40E62C8]();
}

uint64_t sub_19C9768E0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_19C9768F0()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_19C976900()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_19C976910()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_19C976920()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_19C976930()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_19C976940()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_19C976950()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_19C976970()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_19C976980()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_19C976990()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_19C9769A0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_19C9769B0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_19C9769C0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_19C9769D0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_19C9769E0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_19C9769F0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_19C976A00()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_19C976A10()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_19C976A20()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_19C976A30()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_19C976A40()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_19C976A50()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_19C976A60()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_19C976A70()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_19C976A90()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_19C976AA0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_19C976AB0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_19C976AC0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_19C976AD0()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_19C976AF0()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_19C976B00()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_19C976B10()
{
  return MEMORY[0x1F40E63F0]();
}

uint64_t sub_19C976B20()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_19C976B30()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_19C976B40()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_19C976B50()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_19C976B60()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_19C976B70()
{
  return MEMORY[0x1F410CA10]();
}

uint64_t sub_19C976B80()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_19C976B90()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_19C976BA0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_19C976BB0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_19C976BC0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_19C976BD0()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_19C976BE0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_19C976BF0()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_19C976C00()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_19C976C10()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_19C976C20()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_19C976C30()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_19C976C40()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_19C976C50()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_19C976C60()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_19C976C70()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_19C976C80()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_19C976C90()
{
  return MEMORY[0x1F40E6B80]();
}

uint64_t sub_19C976CA0()
{
  return MEMORY[0x1F40E6B90]();
}

uint64_t sub_19C976CB0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_19C976CC0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_19C976CD0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_19C976CE0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_19C976CF0()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_19C976D00()
{
  return MEMORY[0x1F40E6D00]();
}

uint64_t sub_19C976D10()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_19C976D30()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_19C976D40()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_19C976D50()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_19C976D60()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_19C976D70()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_19C976D80()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_19C976D90()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_19C976DA0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_19C976DB0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_19C976DC0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_19C976DD0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_19C976DE0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_19C976DF0()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_19C976E00()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_19C976E10()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_19C976E20()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_19C976E30()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_19C976E40()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_19C976E50()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_19C976E60()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_19C976E70()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_19C976E80()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_19C976E90()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_19C976EA0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_19C976EB0()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_19C976EC0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_19C976ED0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_19C976EE0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_19C976EF0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_19C976F00()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_19C976F10()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_19C976F20()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_19C976F30()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_19C976F40()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_19C976F50()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_19C976F60()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_19C976F70()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_19C976F80()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_19C976F90()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_19C976FA0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_19C976FB0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_19C976FC0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_19C976FD0()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_19C976FF0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_19C977000()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_19C977010()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_19C977040()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_19C977050()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_19C977060()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_19C977070()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_19C977080()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_19C977090()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_19C9770A0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_19C9770B0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_19C9770C0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_19C9770D0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_19C9770E0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_19C977110()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecPKCS12Import(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef *items)
{
  return MEMORY[0x1F40F6F90](pkcs12_data, options, items);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1F40CD598]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}