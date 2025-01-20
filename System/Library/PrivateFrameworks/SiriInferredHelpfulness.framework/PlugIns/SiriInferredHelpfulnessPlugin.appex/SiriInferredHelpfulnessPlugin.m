intptr_t sub_100004960(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t vars8;

  NSLog(@"IH plugin perform task: graded %ld conversations", a2);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  return dispatch_semaphore_signal(v3);
}

uint64_t sub_100004B54()
{
  uint64_t v0 = sub_100006E30();
  sub_100006CC8(v0, qword_10000C7F8);
  sub_1000052B0(v0, (uint64_t)qword_10000C7F8);
  return sub_100006E20();
}

id GradeConversation.__allocating_init(trialClient:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  if (a1)
  {
    sub_100006DA0();
    id v4 = a1;
    sub_100006D80();
    sub_100006D90();

    swift_release();
  }
  v7.receiver = v3;
  v7.super_class = v1;
  id v5 = objc_msgSendSuper2(&v7, "init");

  return v5;
}

id GradeConversation.init(trialClient:)(void *a1)
{
  if (a1)
  {
    sub_100006DA0();
    id v3 = a1;
    sub_100006D80();
    sub_100006D90();

    swift_release();
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for GradeConversation();
  id v4 = objc_msgSendSuper2(&v6, "init");

  return v4;
}

uint64_t type metadata accessor for GradeConversation()
{
  return self;
}

void GradeConversation.run@Sendable (_:)(void (*a1)(void), uint64_t a2)
{
  id v3 = v2;
  sub_10000526C(&qword_10000C790);
  __chkstk_darwin();
  objc_super v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006D60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for FeatureFlag.inferredHelpfulness(_:), v8);
  BOOL v12 = sub_100006D50();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (!v12)
  {
    a1(0);
    if (qword_10000C7F0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_100006E30();
    sub_1000052B0(v27, (uint64_t)qword_10000C7F8);
    v28 = sub_100006E10();
    os_log_type_t v29 = sub_100006E80();
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_19;
    }
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Not running since SiriInferredHelpfulness flag is not enabled.";
    goto LABEL_18;
  }
  if (qword_10000C7F0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100006E30();
  sub_1000052B0(v13, (uint64_t)qword_10000C7F8);
  v14 = sub_100006E10();
  os_log_type_t v15 = sub_100006E70();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "SiriInferredHelpfulness flag is enabled.", v16, 2u);
    swift_slowDealloc();
  }

  sub_100006DA0();
  sub_100006D80();
  char v17 = sub_100006D70();
  swift_release();
  if ((v17 & 1) == 0)
  {
    a1(0);
    v28 = sub_100006E10();
    os_log_type_t v29 = sub_100006E80();
    if (!os_log_type_enabled(v28, v29))
    {
LABEL_19:

      return;
    }
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Not running since Trial flag isIHPluginEnabled is not enabled.";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v28, v29, v31, v30, 2u);
    swift_slowDealloc();
    goto LABEL_19;
  }
  v18 = sub_100006E10();
  os_log_type_t v19 = sub_100006E70();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Trial flag isIHPluginEnabled is on.", v20, 2u);
    swift_slowDealloc();
  }

  v21 = sub_100006E10();
  os_log_type_t v22 = sub_100006E70();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Running SiriInferredHelpfulnessPlugin...", v23, 2u);
    swift_slowDealloc();
  }

  uint64_t v24 = sub_100006E60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 1, 1, v24);
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = v3;
  v25[5] = a1;
  v25[6] = a2;
  id v26 = v3;
  swift_retain();
  sub_1000054F4((uint64_t)v7, (uint64_t)&unk_10000C7A0, (uint64_t)v25);
  swift_release();
}

uint64_t sub_10000526C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000052B0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000052E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v9 = (uint64_t (__cdecl *)())((char *)&dword_10000C7E8 + dword_10000C7E8);
  objc_super v7 = (void *)swift_task_alloc();
  v6[4] = v7;
  *objc_super v7 = v6;
  v7[1] = sub_10000538C;
  return v9();
}

uint64_t sub_10000538C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000548C, 0, 0);
}

uint64_t sub_10000548C()
{
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 40));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000054F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006E60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006E50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006B1C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006E40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id GradeConversation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void GradeConversation.init()()
{
}

id GradeConversation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradeConversation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000057D0()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100006D2C;
  *(_OWORD *)(v2 + 16) = v3;
  uint64_t v6 = (uint64_t (*)(void))((char *)&dword_10000C7E8 + dword_10000C7E8);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v4;
  *id v4 = v2;
  v4[1] = sub_10000538C;
  return v6();
}

uint64_t sub_1000058C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_10000599C;
  return v6(a1);
}

uint64_t sub_10000599C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_100005A94(uint64_t a1)
{
  if (qword_10000C7F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006E30();
  sub_1000052B0(v2, (uint64_t)qword_10000C7F8);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100006E10();
  os_log_type_t v4 = sub_100006E70();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v5 = 134217984;
    sub_100006EA0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Persisting %ld graded conversations", v5, 0xCu);
    swift_slowDealloc();

    uint64_t v6 = *(void *)(a1 + 16);
    if (!v6) {
      return;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v6 = *(void *)(a1 + 16);
    if (!v6) {
      return;
    }
  }
  uint64_t v7 = *(void *)(sub_100006DD0() - 8);
  uint64_t v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v9 = *(void *)(v7 + 72);
  swift_bridgeObjectRetain();
  do
  {
    uint64_t v11 = sub_100006DC0();
    BOOL v12 = sub_100006E10();
    os_log_type_t v13 = sub_100006E70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 134217984;
      *(void *)(v14 + 4) = *(void *)(v11 + 16);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Persisting %ld graded interactions", (uint8_t *)v14, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v10 = (void *)sub_100006DB0();
    __chkstk_darwin();
    sub_100006E90();
    swift_bridgeObjectRelease();

    v8 += v9;
    --v6;
  }
  while (v6);
  swift_bridgeObjectRelease();
}

uint64_t sub_100005D90()
{
  uint64_t v1 = sub_100006D60();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_100005E4C, 0, 0);
}

uint64_t sub_100005E4C()
{
  sub_100006DA0();
  sub_100006D80();
  sub_100006D40();
  swift_allocObject();
  *(void *)(v0 + 40) = sub_100006D30();
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of InferredHelpfulnessInference.gradeConversations()
                         + async function pointer to dispatch thunk of InferredHelpfulnessInference.gradeConversations());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_100006060;
  return v3();
}

uint64_t sub_100006060(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100006254;
  }
  else {
    uint64_t v4 = sub_100006174;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006174()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for FeatureFlag.persistence(_:), v3);
  BOOL v4 = sub_100006D50();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4) {
    sub_100005A94(v0[7]);
  }
  uint64_t v5 = v0[7];
  swift_release();
  uint64_t v6 = *(void *)(v5 + 16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

uint64_t sub_100006254()
{
  swift_release();
  if (qword_10000C7F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100006E30();
  sub_1000052B0(v1, (uint64_t)qword_10000C7F8);
  uint64_t v2 = sub_100006E10();
  os_log_type_t v3 = sub_100006E80();
  if (os_log_type_enabled(v2, v3))
  {
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Not able to grade conversations", v4, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5(0);
}

void sub_100006388(void *a1, void (**a2)(void, void))
{
  sub_10000526C(&qword_10000C790);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006D60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for FeatureFlag.inferredHelpfulness(_:), v6);
  _Block_copy(a2);
  BOOL v11 = sub_100006D50();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!v11)
  {
    a2[2](a2, 0);
    if (qword_10000C7F0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100006E30();
    sub_1000052B0(v26, (uint64_t)qword_10000C7F8);
    uint64_t v27 = sub_100006E10();
    os_log_type_t v28 = sub_100006E80();
    if (!os_log_type_enabled(v27, v28)) {
      goto LABEL_19;
    }
    os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v29 = 0;
    v30 = "Not running since SiriInferredHelpfulness flag is not enabled.";
    goto LABEL_18;
  }
  if (qword_10000C7F0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100006E30();
  sub_1000052B0(v12, (uint64_t)qword_10000C7F8);
  os_log_type_t v13 = sub_100006E10();
  os_log_type_t v14 = sub_100006E70();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "SiriInferredHelpfulness flag is enabled.", v15, 2u);
    swift_slowDealloc();
  }

  sub_100006DA0();
  sub_100006D80();
  char v16 = sub_100006D70();
  swift_release();
  if ((v16 & 1) == 0)
  {
    a2[2](a2, 0);
    uint64_t v27 = sub_100006E10();
    os_log_type_t v28 = sub_100006E80();
    if (!os_log_type_enabled(v27, v28))
    {
LABEL_19:
      swift_release();

      return;
    }
    os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v29 = 0;
    v30 = "Not running since Trial flag isIHPluginEnabled is not enabled.";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v27, v28, v30, v29, 2u);
    swift_slowDealloc();
    goto LABEL_19;
  }
  char v17 = sub_100006E10();
  os_log_type_t v18 = sub_100006E70();
  if (os_log_type_enabled(v17, v18))
  {
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Trial flag isIHPluginEnabled is on.", v19, 2u);
    swift_slowDealloc();
  }

  v20 = sub_100006E10();
  os_log_type_t v21 = sub_100006E70();
  if (os_log_type_enabled(v20, v21))
  {
    os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Running SiriInferredHelpfulnessPlugin...", v22, 2u);
    swift_slowDealloc();
  }

  uint64_t v23 = sub_100006E60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = a1;
  v24[5] = sub_1000068D8;
  v24[6] = v10;
  id v25 = a1;
  swift_retain();
  sub_1000054F4((uint64_t)v5, (uint64_t)&unk_10000C7D0, (uint64_t)v24);
  swift_release();
  swift_release();
}

uint64_t sub_1000068A0()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000068D8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000068F0()
{
  swift_unknownObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100006938()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100006A28;
  *(_OWORD *)(v2 + 16) = v3;
  uint64_t v6 = (uint64_t (*)(void))((char *)&dword_10000C7E8 + dword_10000C7E8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000538C;
  return v6();
}

uint64_t sub_100006A28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006B1C(uint64_t a1)
{
  uint64_t v2 = sub_10000526C(&qword_10000C790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006B7C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006BB4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100006A28;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C7D8 + dword_10000C7D8);
  return v6(a1, v4);
}

uint64_t sub_100006C6C()
{
  sub_100006E00();
  swift_allocObject();
  sub_100006DF0();
  sub_100006DE0();
  return swift_release();
}

uint64_t *sub_100006CC8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006D30()
{
  return InferredHelpfulnessInference.init(streamBookmarkName:emitSelfLogs:trialProvider:)();
}

uint64_t sub_100006D40()
{
  return type metadata accessor for InferredHelpfulnessInference();
}

BOOL sub_100006D50()
{
  return FeatureFlag.isOn()();
}

uint64_t sub_100006D60()
{
  return type metadata accessor for FeatureFlag();
}

uint64_t sub_100006D70()
{
  return dispatch thunk of TrialProvider.isIHPluginEnabled()();
}

uint64_t sub_100006D80()
{
  return static TrialProvider.shared.getter();
}

uint64_t sub_100006D90()
{
  return dispatch thunk of TrialProvider.setClient(client:)();
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for TrialProvider();
}

uint64_t sub_100006DB0()
{
  return signpostLogger.getter();
}

uint64_t sub_100006DC0()
{
  return GradedConversation.interactions.getter();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for GradedConversation();
}

uint64_t sub_100006DE0()
{
  return dispatch thunk of BiomeGradedInteractionWriter.write(gradedInteractions:)();
}

uint64_t sub_100006DF0()
{
  return BiomeGradedInteractionWriter.init()();
}

uint64_t sub_100006E00()
{
  return type metadata accessor for BiomeGradedInteractionWriter();
}

uint64_t sub_100006E10()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006E20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006E30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006E40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006E50()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006E70()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006E80()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006E90()
{
  return OS_os_log.os_signpostSimpleInterval(object:name:begin:end:closure:)();
}

uint64_t sub_100006EA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantIsEnabled];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_initWithTrialClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrialClient:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_performTaskWithTrialClient_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithTrialClient:outError:");
}

id objc_msgSend_run_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run:");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return _[a1 triClient];
}