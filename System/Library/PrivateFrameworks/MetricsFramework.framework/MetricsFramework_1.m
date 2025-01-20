uint64_t sub_2562C7280()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;

  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    v2 = sub_2562C7984;
  }
  else
  {
    v2 = sub_2562C739C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

id sub_2562C739C()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 136);

  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = *(void *)(v0 + 32);
    if ((v6 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x25A2A4740](*(void *)(v0 + 168));
    }
    else {
      id result = *(id *)(v6 + 8 * v5 + 32);
    }
    uint64_t v7 = (uint64_t)result;
    *(void *)(v0 + 160) = result;
    *(void *)(v0 + 168) = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = *(void *)(v0 + 144);
      uint64_t v9 = *(void *)(v0 + 16);
      v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v10;
      void *v10 = v0;
      v10[1] = sub_2562C7280;
      return (id)sub_2562492A0(v7, v9 + v8);
    }
  }
  return result;
}

uint64_t sub_2562C74D4()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  BOOL v3 = os_log_type_enabled(v1, v2);
  v4 = *(void **)(v0 + 72);
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "Unable to report execution Event", v5, 2u);
    MEMORY[0x25A2A5190](v5, -1, -1);
  }

  unint64_t v6 = *(void *)(v0 + 24);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2562E3AD0();
    unint64_t v6 = *(void *)(v0 + 24);
    *(void *)(v0 + 80) = v14;
    if (v14) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = v7;
    if (v7)
    {
LABEL_5:
      uint64_t v8 = *(void *)(v0 + 16);
      uint64_t v9 = OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
      *(void *)(v0 + 88) = OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
      *(void *)(v0 + 96) = *(void *)(v8 + 16);
      if ((v6 & 0xC000000000000001) != 0)
      {
        id v10 = (id)MEMORY[0x25A2A4740](0, v6);
        uint64_t v9 = *(void *)(v0 + 88);
        uint64_t v8 = *(void *)(v0 + 16);
      }
      else
      {
        id v10 = *(id *)(v6 + 32);
      }
      *(void *)(v0 + 104) = v10;
      *(void *)(v0 + 112) = 1;
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_2562C6E78;
      uint64_t v12 = v8 + v9;
LABEL_9:
      return sub_2562492A0((uint64_t)v10, v12);
    }
  }
  swift_bridgeObjectRelease();
  if (qword_269F53B28 != -1) {
    swift_once();
  }
  if (objc_msgSend((id)qword_269F5E470, sel_longLivedIdentifierUploadingEnabled))
  {
    unint64_t v15 = *(void *)(v0 + 32);
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2562E3AD0();
      unint64_t v15 = *(void *)(v0 + 32);
      *(void *)(v0 + 136) = v23;
      if (v23) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = v16;
      if (v16)
      {
LABEL_18:
        uint64_t v17 = *(void *)(v0 + 16);
        uint64_t v18 = OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
        *(void *)(v0 + 144) = OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
        *(void *)(v0 + 152) = *(void *)(v17 + 16);
        if ((v15 & 0xC000000000000001) != 0)
        {
          id v10 = (id)MEMORY[0x25A2A4740](0, v15);
          uint64_t v18 = *(void *)(v0 + 144);
          uint64_t v17 = *(void *)(v0 + 16);
        }
        else
        {
          id v10 = *(id *)(v15 + 32);
        }
        *(void *)(v0 + 160) = v10;
        *(void *)(v0 + 168) = 1;
        v22 = (void *)swift_task_alloc();
        *(void *)(v0 + 176) = v22;
        void *v22 = v0;
        v22[1] = sub_2562C7280;
        uint64_t v12 = v17 + v18;
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = sub_2562E3410();
    os_log_type_t v20 = sub_2562E37F0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_256226000, v19, v20, "RPI enabled, skipping ODDSiriAccountInformation upload", v21, 2u);
      MEMORY[0x25A2A5190](v21, -1, -1);
    }
  }
  v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24();
}

uint64_t sub_2562C7898()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "Unable to report devicePropertiesEvent", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  v4 = *(void **)(v0 + 104);
  swift_willThrow();

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2562C7984()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "Unable to report siriAccountInformationEvent", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  v4 = *(void **)(v0 + 160);
  swift_willThrow();

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2562C7A70()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t DevicePropertiesSELFReporter.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DevicePropertiesSELFReporter.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework28DevicePropertiesSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DevicePropertiesReporter()
{
  return self;
}

uint64_t method lookup function for DevicePropertiesReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DevicePropertiesReporter);
}

uint64_t dispatch thunk of DevicePropertiesReporter.report(_:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 80) + **(int **)(*(void *)v1 + 80));
  v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t sub_2562C7D38()
{
  return type metadata accessor for DevicePropertiesSELFReporter();
}

uint64_t type metadata accessor for DevicePropertiesSELFReporter()
{
  uint64_t result = qword_269F55890;
  if (!qword_269F55890) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for DevicePropertiesSELFReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DevicePropertiesSELFReporter);
}

uint64_t dispatch thunk of DevicePropertiesSELFReporter.__allocating_init(logger:reportingService:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t SiriSegmentCohortSELFReporter.__allocating_init(logger:reportingService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents) = MEMORY[0x263F8EE78];
  uint64_t v5 = v4 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v6 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_reportingService) = a2;
  return v4;
}

uint64_t sub_2562C7E64(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  BOOL v3 = (void *)(*a2 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents);
  swift_beginAccess();
  *BOOL v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2562C7ED0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2562C7F1C(uint64_t a1)
{
  BOOL v3 = (void *)(v1 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents);
  swift_beginAccess();
  *BOOL v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2562C7F70())()
{
  return j__swift_endAccess;
}

uint64_t SiriSegmentCohortSELFReporter.init(logger:reportingService:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents) = MEMORY[0x263F8EE78];
  uint64_t v5 = v2 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v6 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v2 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_reportingService) = a2;
  return v2;
}

uint64_t sub_2562C8064(_OWORD *a1)
{
  *(void *)(v2 + 40) = v1;
  *(void *)(v2 + 48) = *(void *)(type metadata accessor for DeviceSegmentsCohorts(0) - 8);
  *(void *)(v2 + 56) = swift_task_alloc();
  long long v4 = a1[1];
  *(_OWORD *)(v2 + 64) = *a1;
  *(_OWORD *)(v2 + 80) = v4;
  return MEMORY[0x270FA2498](sub_2562C812C, 0, 0);
}

uint64_t sub_2562C812C()
{
  uint64_t v36 = v0;
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 96) = v2;
  if (!v2)
  {
LABEL_13:
    uint64_t v17 = *(void *)(v0 + 88);
    uint64_t v18 = *(void *)(v0 + 40);
    long long v33 = *(_OWORD *)(v0 + 64);
    uint64_t v34 = v1;
    uint64_t v35 = v17;
    *(void *)(v0 + 184) = OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
    uint64_t v19 = sub_2562C952C((uint64_t)&v33);
    os_log_type_t v20 = (uint64_t *)(v18 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents);
    swift_beginAccess();
    *os_log_type_t v20 = v19;
    swift_bridgeObjectRelease();
    unint64_t v21 = *v20;
    *(void *)(v0 + 192) = *v20;
    if (!(v21 >> 62))
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 200) = v22;
      if (!v22)
      {
LABEL_27:
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        v32 = *(uint64_t (**)(void))(v0 + 8);
        return v32();
      }
LABEL_15:
      uint64_t v23 = *(void *)(v0 + 40);
      *(void *)(v0 + 208) = *(void *)(v23
                                        + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_reportingService);
      uint64_t v24 = *(void *)(v0 + 192);
      if ((v24 & 0xC000000000000001) != 0)
      {
        id v25 = (id)MEMORY[0x25A2A4740](0);
        uint64_t v23 = *(void *)(v0 + 40);
      }
      else
      {
        id v25 = *(id *)(v24 + 32);
      }
      *(void *)(v0 + 216) = v25;
      *(void *)(v0 + 224) = 1;
      uint64_t v26 = *(void *)(v0 + 184);
      v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v27;
      void *v27 = v0;
      v27[1] = sub_2562C89EC;
      return sub_256249840((uint64_t)v25, v23 + v26);
    }
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2562E3AD0();
    *(void *)(v0 + 200) = v31;
    if (!v31) {
      goto LABEL_27;
    }
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  *(void *)(v0 + 104) = OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_reportingService;
  *(void *)(v0 + 112) = v4;
  *(_DWORD *)(v0 + 248) = *(_DWORD *)(v3 + 80);
  *(void *)(v0 + 120) = 0;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = swift_bridgeObjectRetain();
  if (!v5)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v7 = 0;
  while (1)
  {
    sub_2562C9F50(v6+ ((*(unsigned __int8 *)(v0 + 248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 248))+ *(void *)(*(void *)(v0 + 48) + 72) * v7, *(void *)(v0 + 56), type metadata accessor for DeviceSegmentsCohorts);
    unint64_t v8 = sub_2562C8E5C();
    *(void *)(v0 + 128) = v8;
    if (v8 >> 62) {
      break;
    }
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(void *)(v0 + 136) = v9;
    if (v9) {
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v10 = *(void *)(v0 + 120);
    uint64_t v11 = *(void *)(v0 + 96);
    uint64_t v12 = *(void *)(v0 + 56);
    swift_bridgeObjectRelease();
    sub_25628A6C8(v12, type metadata accessor for DeviceSegmentsCohorts);
    if (v10 + 1 == v11)
    {
      swift_bridgeObjectRelease();
      uint64_t v1 = *(void *)(v0 + 80);
      goto LABEL_13;
    }
    unint64_t v7 = *(void *)(v0 + 120) + 1;
    *(void *)(v0 + 120) = v7;
    uint64_t v6 = *(void *)(v0 + 80);
    if (v7 >= *(void *)(v6 + 16)) {
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2562E3AD0();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 136) = v13;
  if (!v13) {
    goto LABEL_6;
  }
LABEL_10:
  uint64_t v14 = *(void *)(v0 + 40);
  *(void *)(v0 + 144) = *(void *)(v14 + *(void *)(v0 + 104));
  uint64_t v15 = *(void *)(v0 + 128);
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)MEMORY[0x25A2A4740](0);
    uint64_t v14 = *(void *)(v0 + 40);
  }
  else
  {
    id v16 = *(id *)(v15 + 32);
  }
  *(void *)(v0 + 152) = v16;
  *(void *)(v0 + 160) = 1;
  uint64_t v29 = *(void *)(v0 + 112);
  v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v30;
  void *v30 = v0;
  v30[1] = sub_2562C8508;
  return sub_2562492A0((uint64_t)v16, v14 + v29);
}

uint64_t sub_2562C8508()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2562C8C4C;
  }
  else
  {
    uint64_t v2 = sub_2562C8630;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2562C8630()
{
  uint64_t v33 = v0;
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);

  if (v1 != v2)
  {
    uint64_t v11 = *(void *)(v0 + 160);
LABEL_10:
    uint64_t v12 = *(void *)(v0 + 128);
    if ((v12 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x25A2A4740](v11);
    }
    else {
      id v13 = *(id *)(v12 + 8 * v11 + 32);
    }
    uint64_t v14 = (uint64_t)v13;
    *(void *)(v0 + 152) = v13;
    *(void *)(v0 + 160) = v11 + 1;
    if (!__OFADD__(v11, 1))
    {
      uint64_t v15 = *(void *)(v0 + 112);
      uint64_t v16 = *(void *)(v0 + 40);
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 168) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_2562C8508;
      return sub_2562492A0(v14, v16 + v15);
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2562E3AD0();
    *(void *)(v0 + 200) = v30;
    if (v30) {
      goto LABEL_19;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  while (1)
  {
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 56);
    swift_bridgeObjectRelease();
    sub_25628A6C8(v5, type metadata accessor for DeviceSegmentsCohorts);
    if (v3 + 1 == v4) {
      break;
    }
    unint64_t v6 = *(void *)(v0 + 120) + 1;
    *(void *)(v0 + 120) = v6;
    uint64_t v7 = *(void *)(v0 + 80);
    if (v6 >= *(void *)(v7 + 16))
    {
      __break(1u);
      goto LABEL_26;
    }
    sub_2562C9F50(v7+ ((*(unsigned __int8 *)(v0 + 248) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 248))+ *(void *)(*(void *)(v0 + 48) + 72) * v6, *(void *)(v0 + 56), type metadata accessor for DeviceSegmentsCohorts);
    unint64_t v8 = sub_2562C8E5C();
    *(void *)(v0 + 128) = v8;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_2562E3AD0();
      swift_bridgeObjectRelease();
      *(void *)(v0 + 136) = v10;
      if (v10)
      {
LABEL_8:
        uint64_t v11 = 0;
        *(void *)(v0 + 144) = *(void *)(*(void *)(v0 + 40) + *(void *)(v0 + 104));
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      *(void *)(v0 + 136) = v9;
      if (v9) {
        goto LABEL_8;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v0 + 40);
  long long v20 = *(_OWORD *)(v0 + 80);
  v32[0] = *(_OWORD *)(v0 + 64);
  v32[1] = v20;
  *(void *)(v0 + 184) = OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v21 = sub_2562C952C((uint64_t)v32);
  uint64_t v22 = (uint64_t *)(v19 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents);
  swift_beginAccess();
  uint64_t *v22 = v21;
  swift_bridgeObjectRelease();
  unint64_t v23 = *v22;
  *(void *)(v0 + 192) = *v22;
  if (v23 >> 62) {
    goto LABEL_27;
  }
  uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  *(void *)(v0 + 200) = v24;
  if (!v24) {
    goto LABEL_28;
  }
LABEL_19:
  uint64_t v25 = *(void *)(v0 + 40);
  *(void *)(v0 + 208) = *(void *)(v25
                                    + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_reportingService);
  uint64_t v26 = *(void *)(v0 + 192);
  if ((v26 & 0xC000000000000001) != 0)
  {
    id v27 = (id)MEMORY[0x25A2A4740](0);
    uint64_t v25 = *(void *)(v0 + 40);
  }
  else
  {
    id v27 = *(id *)(v26 + 32);
  }
  *(void *)(v0 + 216) = v27;
  *(void *)(v0 + 224) = 1;
  uint64_t v28 = *(void *)(v0 + 184);
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_2562C89EC;
  return sub_256249840((uint64_t)v27, v25 + v28);
}

uint64_t sub_2562C89EC()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2562C8D68;
  }
  else
  {
    uint64_t v2 = sub_2562C8B08;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

id sub_2562C8B08()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 200);

  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 224);
    uint64_t v6 = *(void *)(v0 + 192);
    if ((v6 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x25A2A4740](*(void *)(v0 + 224));
    }
    else {
      id result = *(id *)(v6 + 8 * v5 + 32);
    }
    uint64_t v7 = (uint64_t)result;
    *(void *)(v0 + 216) = result;
    *(void *)(v0 + 224) = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = *(void *)(v0 + 184);
      uint64_t v9 = *(void *)(v0 + 40);
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v10;
      void *v10 = v0;
      v10[1] = sub_2562C89EC;
      return (id)sub_256249840(v7, v9 + v8);
    }
  }
  return result;
}

uint64_t sub_2562C8C4C()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "Unable to report event", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }
  uint64_t v4 = (void *)v0[19];
  uint64_t v5 = v0[7];

  swift_willThrow();
  sub_25628A6C8(v5, type metadata accessor for DeviceSegmentsCohorts);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2562C8D68()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "Unable to report event", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }
  uint64_t v4 = *(void **)(v0 + 216);

  swift_willThrow();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2562C8E5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for EventMetadata(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = MEMORY[0x263F8EE78];
  sub_25622F360(v1, (uint64_t)v4, &qword_269F54398);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_25622F3C4((uint64_t)v4, &qword_269F54398);
    return MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25627C4D0((uint64_t)v4, (uint64_t)v8);
    uint64_t v10 = type metadata accessor for DeviceSegmentsCohorts(0);
    uint64_t v11 = *(void *)(v1 + *(int *)(v10 + 20));
    if (v11)
    {
      id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E770]), sel_init);
      if (v12)
      {
        id v13 = v12;
        id v14 = EventMetadata.transformToODDClientEventMetadata()();
        objc_msgSend(v13, sel_setEventMetadata_, v14);

        id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E6D0]), sel_init);
        uint64_t v16 = *(void *)(v11 + 16);
        if (v16)
        {
          v50[0] = v13;
          v51 = (void *)v10;
          uint64_t v52 = v1;
          v53 = v8;
          swift_bridgeObjectRetain();
          v50[1] = v11;
          uint64_t v17 = (unsigned __int8 *)(v11 + 44);
          do
          {
            unsigned int v18 = *((_DWORD *)v17 - 3);
            int v19 = *(v17 - 8);
            unsigned int v20 = *((_DWORD *)v17 - 1);
            int v21 = *v17;
            id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E6C8]), (SEL)&selRef_initWithSuiteName_);
            if (v22)
            {
              unint64_t v23 = v22;
              if (v19) {
                uint64_t v24 = 0;
              }
              else {
                uint64_t v24 = v18;
              }
              objc_msgSend(v22, sel_setSegmentType_, v24);
              if (v21) {
                uint64_t v25 = 0;
              }
              else {
                uint64_t v25 = v20;
              }
              objc_msgSend(v23, sel_setSegmentDataAvailabilityState_, v25);
              id v26 = v15;
              objc_msgSend(v26, sel_addSegments_, v23);
            }
            v17 += 32;
            --v16;
          }
          while (v16);
          swift_bridgeObjectRelease();
          uint64_t v1 = v52;
          uint64_t v8 = v53;
          uint64_t v10 = (uint64_t)v51;
          id v13 = (void *)v50[0];
        }
        objc_msgSend(v13, sel_setDeviceSegmentsReported_, v15);
        id v27 = v13;
        MEMORY[0x25A2A4400]();
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2562E3730();
        }
        sub_2562E3750();
        sub_2562E3720();
      }
    }
    uint64_t v28 = *(void *)(v1 + *(int *)(v10 + 24));
    if (v28)
    {
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E770]), sel_init);
      if (v29)
      {
        uint64_t v30 = v29;
        id v31 = EventMetadata.transformToODDClientEventMetadata()();
        objc_msgSend(v30, sel_setEventMetadata_, v31);

        id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E6C0]), sel_init);
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)(v28 + 16);
        if (v34)
        {
          v51 = v30;
          uint64_t v35 = v32;
          v53 = v8;
          swift_bridgeObjectRetain();
          uint64_t v52 = v28;
          uint64_t v36 = (void **)(v28 + 48);
          do
          {
            unsigned int v37 = *((_DWORD *)v36 - 4);
            int v38 = *((unsigned __int8 *)v36 - 12);
            unsigned int v39 = *((_DWORD *)v36 - 2);
            int v40 = *((unsigned __int8 *)v36 - 4);
            v41 = *v36;
            id v42 = objc_allocWithZone(MEMORY[0x263F6E6B8]);
            id v43 = v41;
            id v44 = objc_msgSend(v42, (SEL)&selRef_initWithSuiteName_);
            if (v44)
            {
              v45 = v44;
              if (v38) {
                uint64_t v46 = 0;
              }
              else {
                uint64_t v46 = v37;
              }
              objc_msgSend(v44, sel_setCohortType_, v46);
              if (v40) {
                uint64_t v47 = 0;
              }
              else {
                uint64_t v47 = v39;
              }
              objc_msgSend(v45, sel_setCohortDataAvailabilityState_, v47);
              objc_msgSend(v45, sel_setCohortInterval_, v43);
              id v48 = v35;
              objc_msgSend(v48, sel_addCohorts_, v45);

              id v43 = v45;
            }
            v36 += 3;

            --v34;
          }
          while (v34);
          swift_bridgeObjectRelease();
          uint64_t v8 = v53;
          uint64_t v33 = v35;
          uint64_t v30 = v51;
        }
        objc_msgSend(v30, sel_setDeviceCohortsReported_, v33);
        id v49 = v30;
        MEMORY[0x25A2A4400]();
        if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2562E3730();
        }
        sub_2562E3750();
        sub_2562E3720();
      }
    }
    sub_25628A6C8((uint64_t)v8, type metadata accessor for EventMetadata);
    return v54;
  }
}

uint64_t sub_2562C935C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t SiriSegmentCohortSELFReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriSegmentCohortSELFReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_2562C952C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DeviceBatchData(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v63 = (uint64_t)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v51 = v3;
    uint64_t v64 = MEMORY[0x263F8EE78];
    uint64_t v8 = v6 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v9 = *(void *)(v4 + 72);
    v50[1] = v6;
    swift_bridgeObjectRetain();
    unint64_t v10 = 0x263F6E000uLL;
    uint64_t v11 = (SEL *)&_swift_FORCE_LOAD___swift_time___MetricsFramework;
    unint64_t v12 = 0x263F6E000uLL;
    uint64_t v55 = v9;
    while (1)
    {
      sub_2562C9F50(v8, v63, type metadata accessor for DeviceBatchData);
      id v13 = [objc_allocWithZone(*(Class *)(v10 + 1544)) v11[123]];
      if (v13)
      {
        id v14 = v13;
        id v15 = [objc_allocWithZone(*(Class *)(v12 + 1552)) v11[123]];
        if (v15)
        {
          uint64_t v16 = v15;
          id v17 = [objc_allocWithZone(MEMORY[0x263F6E618]) v11[123]];
          if (v17)
          {
            id v57 = v17;
            id v58 = v16;
            uint64_t v18 = sub_2562E2FD0();
            v60 = v50;
            uint64_t v19 = *(void *)(v18 - 8);
            uint64_t v20 = *(void *)(v19 + 64);
            MEMORY[0x270FA5388](v18);
            unint64_t v56 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
            v62 = (char *)v50 - v56;
            uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
            v61 = (char *)v50;
            uint64_t v22 = *(void *)(*(void *)(v21 - 8) + 64);
            MEMORY[0x270FA5388](v21 - 8);
            unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
            sub_25622F360(v63, (uint64_t)v50 - v23, &qword_269F53D68);
            uint64_t v59 = v19;
            uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
            if (v24((char *)v50 - v23, 1, v18) == 1)
            {
              sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);

              sub_25622F3C4((uint64_t)v50 - v23, &qword_269F53D68);
LABEL_14:
              uint64_t v9 = v55;
              unint64_t v10 = 0x263F6E000;
              uint64_t v11 = (SEL *)&_swift_FORCE_LOAD___swift_time___MetricsFramework;
              unint64_t v12 = 0x263F6E000;
              goto LABEL_4;
            }
            uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
            uint64_t v52 = v59 + 32;
            v53 = v25;
            uint64_t v26 = ((uint64_t (*)(char *, char *, uint64_t))v25)(v62, (char *)v50 - v23, v18);
            uint64_t v54 = v50;
            MEMORY[0x270FA5388](v26);
            id v27 = (char *)v50 - v56;
            v61 = (char *)v50;
            uint64_t v28 = v51;
            uint64_t v29 = MEMORY[0x270FA5388](v63 + *(int *)(v51 + 20));
            sub_25622F360(v29, (uint64_t)v50 - v23, &qword_269F53D68);
            if (v24((char *)v50 - v23, 1, v18) == 1)
            {

              (*(void (**)(char *, uint64_t))(v59 + 8))(v62, v18);
              sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
              sub_25622F3C4((uint64_t)v50 - v23, &qword_269F53D68);
              goto LABEL_14;
            }
            v53(v27, (char *)v50 - v23, v18);
            uint64_t v30 = v63 + *(int *)(v28 + 24);
            uint64_t v11 = (SEL *)&_swift_FORCE_LOAD___swift_time___MetricsFramework;
            unint64_t v12 = 0x263F6E000;
            if (*(unsigned char *)(v30 + 4) == 1)
            {

              id v31 = *(void (**)(char *, uint64_t))(v59 + 8);
              v31(v27, v18);
              v31(v62, v18);
            }
            else
            {
              v61 = v27;
              unint64_t v56 = v18;
              uint64_t v32 = v63 + *(int *)(v28 + 28);
              if (*(unsigned char *)(v32 + 4) != 1)
              {
                LODWORD(v52) = *(_DWORD *)v30;
                LODWORD(v53) = *(_DWORD *)v32;
                id v35 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
                uint64_t v36 = (void *)sub_2562E2FB0();
                id v37 = objc_msgSend(v35, sel_initWithNSUUID_, v36);

                id v38 = v58;
                objc_msgSend(v58, sel_setOdbatchId_, v37);

                id v39 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
                int v40 = (void *)sub_2562E2FB0();
                id v41 = objc_msgSend(v39, sel_initWithNSUUID_, v40);

                id v42 = v57;
                objc_msgSend(v57, sel_setOriginalClockId_, v41);

                objc_msgSend(v42, sel_setDaysWithTwoValidAssistantTurnsPerWeek_, v52);
                objc_msgSend(v42, sel_setDaysWithTwoAssistantSpeechRequestsPerWeek_, v53);
                objc_msgSend(v14, sel_setEventMetadata_, v38);
                objc_msgSend(v14, sel_setOdbatchDataReported_, v42);
                id v43 = v14;
                MEMORY[0x25A2A4400]();
                uint64_t v9 = v55;
                if (*(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_2562E3730();
                }
                sub_2562E3750();
                sub_2562E3720();

                id v44 = *(void (**)(char *, unint64_t))(v59 + 8);
                unint64_t v45 = v56;
                v44(v61, v56);
                v44(v62, v45);
                sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
                unint64_t v10 = 0x263F6E000;
                goto LABEL_4;
              }

              uint64_t v33 = *(void (**)(char *, unint64_t))(v59 + 8);
              unint64_t v34 = v56;
              v33(v61, v56);
              v33(v62, v34);
            }
            sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
            uint64_t v9 = v55;
            unint64_t v10 = 0x263F6E000;
          }
          else
          {
            sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
          }
        }
        else
        {
          sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
        }
      }
      else
      {
        sub_25628A6C8(v63, type metadata accessor for DeviceBatchData);
      }
LABEL_4:
      v8 += v9;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        return v64;
      }
    }
  }
  uint64_t v47 = sub_2562E3410();
  os_log_type_t v48 = sub_2562E37E0();
  if (os_log_type_enabled(v47, v48))
  {
    id v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v49 = 0;
    _os_log_impl(&dword_256226000, v47, v48, "No On-Device ODBATCH Data available", v49, 2u);
    MEMORY[0x25A2A5190](v49, -1, -1);
  }

  return MEMORY[0x263F8EE78];
}

uint64_t sub_2562C9D4C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16MetricsFramework29SiriSegmentCohortSELFReporter_odBatchClientEvents);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2562C9DA8()
{
  return type metadata accessor for SiriSegmentCohortSELFReporter();
}

uint64_t type metadata accessor for SiriSegmentCohortSELFReporter()
{
  uint64_t result = qword_269F558B8;
  if (!qword_269F558B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2562C9DFC()
{
  uint64_t result = sub_2562E3430();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriSegmentCohortSELFReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriSegmentCohortSELFReporter);
}

uint64_t dispatch thunk of SiriSegmentCohortSELFReporter.odBatchClientEvents.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SiriSegmentCohortSELFReporter.odBatchClientEvents.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SiriSegmentCohortSELFReporter.odBatchClientEvents.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SiriSegmentCohortSELFReporter.__allocating_init(logger:reportingService:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

ValueMetadata *type metadata accessor for SiriSegmentsCohortsSELFAdapter()
{
  return &type metadata for SiriSegmentsCohortsSELFAdapter;
}

uint64_t sub_2562C9F50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t BootToAssetMetrics.__allocating_init(defaults:logger:fbfBundleId:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v8 = swift_allocObject();
  BootToAssetMetrics.init(defaults:logger:fbfBundleId:)(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_2562CA028@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for BootToAssetCalculator(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_2562E3550();
  uint64_t v5 = (void *)sub_2562E3550();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_2562E2E20();

    uint64_t v7 = sub_2562E2E30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_2562E2E30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }

  return v8(v10, v11, 1, v9);
}

uint64_t BootToAssetMetrics.init(defaults:logger:fbfBundleId:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v80 = a1;
  v77 = a4;
  uint64_t v7 = sub_2562E3430();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v78 = (char *)v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v63 - v11;
  uint64_t v14 = v8 + 16;
  id v13 = *(void (**)(void))(v8 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v13)((char *)v63 - v11, a2, v7);
  type metadata accessor for BootToAssetDataProvider();
  uint64_t v15 = swift_allocObject();
  uint64_t v83 = v8;
  uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v72 = v12;
  v75 = v16;
  uint64_t v76 = v8 + 32;
  v16(v15 + OBJC_IVAR____TtC16MetricsFramework23BootToAssetDataProvider_logger, v12, v7);
  *(void *)(v4 + 24) = v15;
  v74 = (void *)(v4 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_logger);
  uint64_t v17 = a2;
  v13();
  uint64_t v18 = sub_2562E2FD0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v68 = v20;
  unint64_t v67 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2562E2FC0();
  uint64_t v21 = *(void (**)(void))(v19 + 32);
  v81 = (void *)(v4 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_oddId);
  uint64_t v87 = v18;
  v69 = v21;
  uint64_t v70 = v19 + 32;
  v21();
  uint64_t v22 = v4;
  unint64_t v23 = (void *)(v4 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_fbfBundleId);
  v82 = (uint64_t *)(v4 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_fbfBundleId);
  uint64_t v24 = v77;
  *unint64_t v23 = a3;
  v23[1] = v24;
  uint64_t v25 = sub_2562E3340();
  swift_allocObject();
  id v80 = v80;
  uint64_t v26 = sub_2562E3330();
  uint64_t v85 = v25;
  uint64_t v86 = MEMORY[0x263F396B8];
  uint64_t v27 = v17;
  uint64_t v84 = v26;
  uint64_t v71 = v14;
  v77 = v13;
  ((void (*)(char *, uint64_t, uint64_t))v13)(v78, v17, v7);
  sub_2562E3140();
  swift_allocObject();
  uint64_t v28 = v79;
  uint64_t v29 = sub_2562E3120();
  if (v28)
  {

    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
    v30(v17, v7);
    swift_release();
    v30((uint64_t)v74, v7);
    (*(void (**)(void *, uint64_t))(v19 + 8))(v81, v87);
    swift_bridgeObjectRelease();
    type metadata accessor for BootToAssetMetrics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v31 = v29;
    uint64_t v65 = sub_2562E2F80();
    v74 = v63;
    uint64_t v32 = *(void *)(v65 - 8);
    MEMORY[0x270FA5388](v65);
    unint64_t v34 = (char *)v63 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2562E32A0();
    uint64_t v35 = sub_2562E3060();
    uint64_t v64 = v7;
    uint64_t v73 = v27;
    uint64_t v36 = v35;
    v63[1] = v63;
    uint64_t v37 = *(void *)(v35 - 8);
    uint64_t v79 = v4;
    uint64_t v38 = v37;
    MEMORY[0x270FA5388](v35);
    v78 = 0;
    int v40 = (char *)v63 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2562E3020();
    sub_2562E3130();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v36);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v65);
    id v41 = v72;
    uint64_t v42 = v64;
    uint64_t v43 = ((uint64_t (*)(char *, uint64_t, uint64_t))v77)(v72, v73, v64);
    v74 = v63;
    MEMORY[0x270FA5388](v43);
    id v44 = (char *)v63 - v67;
    (*(void (**)(char *, void *, uint64_t))(v19 + 16))((char *)v63 - v67, v81, v87);
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D10);
    v81 = v63;
    MEMORY[0x270FA5388](v45 - 8);
    uint64_t v47 = (char *)v63 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v48 = v80;
    uint64_t v66 = v31;
    swift_retain();
    sub_2562CA028((uint64_t)v47);
    type metadata accessor for BootToAssetCalculator(0);
    uint64_t v49 = swift_allocObject();
    sub_2562E3020();
    v75(v49 + OBJC_IVAR____TtC16MetricsFramework21BootToAssetCalculator_logger, v41, v42);
    sub_25626DA70((uint64_t)v47, v49 + OBJC_IVAR____TtC16MetricsFramework21BootToAssetCalculator_sqlFileURL);
    *(void *)(v49 + OBJC_IVAR____TtC16MetricsFramework21BootToAssetCalculator_bookmarkService) = v31;
    ((void (*)(uint64_t, char *, uint64_t))v69)(v49 + OBJC_IVAR____TtC16MetricsFramework21BootToAssetCalculator_oddId, v44, v87);
    *(void *)(v49 + OBJC_IVAR____TtC16MetricsFramework21BootToAssetCalculator_defaults) = v48;
    uint64_t v50 = v73;
    *(void *)(v79 + 32) = v49;
    ((void (*)(char *, uint64_t, uint64_t))v77)(v41, v50, v42);
    uint64_t v51 = *v82;
    uint64_t v52 = v82[1];
    uint64_t v53 = type metadata accessor for SELFReportingService();
    uint64_t v54 = (void *)swift_allocObject();
    uint64_t v55 = self;
    swift_bridgeObjectRetain();
    v54[3] = objc_msgSend(v55, sel_sharedLoggerWithPersistenceConfiguration_, 1);
    id v56 = objc_msgSend(self, sel_sharedAnalytics);
    id v57 = objc_msgSend(v56, sel_defaultMessageStream);

    v54[2] = v57;
    v54[4] = v51;
    v54[5] = v52;
    type metadata accessor for BootToAssetSELFReporter();
    uint64_t v58 = swift_allocObject();
    uint64_t v59 = (void *)(v58 + OBJC_IVAR____TtC16MetricsFramework23BootToAssetSELFReporter_reportingService);
    v59[3] = v53;
    v59[4] = &protocol witness table for SELFReportingService;
    *uint64_t v59 = v54;
    v75(v58 + OBJC_IVAR____TtC16MetricsFramework23BootToAssetSELFReporter_logger, v41, v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F53EA8);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_2562E4F80;
    *(void *)(v60 + 32) = v58;
    uint64_t v84 = v60;
    sub_2562E3720();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F558E0);
    swift_allocObject();
    swift_retain();
    uint64_t v84 = sub_2562E30E0();
    __swift_instantiateConcreteTypeFromMangledName(qword_269F558E8);
    swift_allocObject();
    uint64_t v61 = sub_2562E3100();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v73, v42);
    uint64_t v22 = v79;
    *(void *)(v79 + 16) = v61;
  }
  return v22;
}

uint64_t type metadata accessor for BootToAssetMetrics()
{
  uint64_t result = qword_269F55938;
  if (!qword_269F55938) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2562CAAAC()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2562CAACC, 0, 0);
}

uint64_t sub_2562CAACC()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E37F0();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "no-op data provider invoked: ODDAssetAvailabilityFromBoodDataProvider", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2562CABB0(uint64_t a1)
{
  *(void *)(v2 + 40) = v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(void *)(v2 + 64) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_2562CABE0, 0, 0);
}

uint64_t sub_2562CABE0()
{
  uint64_t v1 = *(void *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395D0] + MEMORY[0x263F395D0]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25623D940;
  return v4(v0 + 16);
}

uint64_t sub_2562CACA4(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_2562CACC4, 0, 0);
}

uint64_t sub_2562CACC4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2562CAD64;
  return sub_2562BA014(v0 + 16);
}

uint64_t sub_2562CAD64()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2562A5168;
  }
  else {
    uint64_t v2 = sub_2562CAE78;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2562CAE78()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t BootToAssetMetrics.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_oddId;
  uint64_t v4 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BootToAssetMetrics.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework18BootToAssetMetrics_oddId;
  uint64_t v4 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_2562CB084()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2562CAACC, 0, 0);
}

uint64_t sub_2562CB0A8(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v3;
  return MEMORY[0x270FA2498](sub_2562CACC4, 0, 0);
}

uint64_t sub_2562CB0CC(uint64_t a1)
{
  *(void *)(v2 + 40) = *v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(void *)(v2 + 64) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_2562CABE0, 0, 0);
}

uint64_t sub_2562CB100()
{
  return sub_2562CB19C(&qword_269F55908);
}

uint64_t sub_2562CB134()
{
  return sub_2562CB19C(&qword_269F55910);
}

uint64_t sub_2562CB168()
{
  return sub_2562CB19C(qword_269F55918);
}

uint64_t sub_2562CB19C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BootToAssetMetrics();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2562CB1E0()
{
  return type metadata accessor for BootToAssetMetrics();
}

uint64_t sub_2562CB1E8()
{
  uint64_t result = sub_2562E3430();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2562E2FD0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for BootToAssetMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BootToAssetMetrics);
}

uint64_t dispatch thunk of BootToAssetMetrics.__allocating_init(defaults:logger:fbfBundleId:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BootToAssetMetrics.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25623E4D4;
  return v6(a1);
}

uint64_t dispatch thunk of BootToAssetMetrics.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 144) + **(int **)(*(void *)v1 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25623E4D4;
  return v6(a1);
}

uint64_t dispatch thunk of BootToAssetMetrics.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 152) + **(int **)(*(void *)v2 + 152));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_25622844C;
  return v8(a1, a2);
}

uint64_t SpeakerIdSelectionSELFReporter.__allocating_init(logger:reportingService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v6 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v4 + 16) = a2;
  return v4;
}

uint64_t SpeakerIdSelectionReporter.deinit()
{
  return v0;
}

uint64_t SpeakerIdSelectionReporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2562CB6D4(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 80) + **(int **)(**(void **)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t SpeakerIdSelectionSELFReporter.init(logger:reportingService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v6 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  *(void *)(v2 + 16) = a2;
  return v2;
}

uint64_t sub_2562CB858(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 1);
  return MEMORY[0x270FA2498](sub_2562CB8F4, 0, 0);
}

uint64_t sub_2562CB8F4()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  v0[8] = OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v3 = v1 + v2;
  uint64_t v4 = sub_2562E3410();
  os_log_type_t v5 = sub_2562E37F0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_256226000, v4, v5, "#SpeakerIdSelectionSELFReporter: Reporter invoked", v6, 2u);
    MEMORY[0x25A2A5190](v6, -1, -1);
  }
  uint64_t v7 = (void *)v0[5];

  id v8 = v7;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v9 = v8;
  uint64_t v10 = sub_2562E3410();
  os_log_type_t v11 = sub_2562E37F0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v42 = v3;
    uint64_t v12 = v0[5];
    id v13 = (uint8_t *)swift_slowAlloc();
    id v41 = (void *)swift_slowAlloc();
    *(_DWORD *)id v13 = 138412290;
    if (v12)
    {
      v0[3] = v9;
      id v14 = v9;
    }
    else
    {
      v0[2] = 0;
    }
    sub_2562E38F0();
    void *v41 = v0[5];

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_256226000, v10, v11, "#SpeakerIdSelectionSELFReporter: result.speakerIdSelectionEvents %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
    swift_arrayDestroy();
    MEMORY[0x25A2A5190](v41, -1, -1);
    MEMORY[0x25A2A5190](v13, -1, -1);

    uint64_t v3 = v42;
    if (!v0[5]) {
      goto LABEL_13;
    }
LABEL_7:
    id v15 = v9;
    uint64_t v16 = (void *)swift_task_alloc();
    v0[9] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_2562CBEDC;
    uint64_t v17 = (uint64_t)v15;
    uint64_t v18 = v3;
    goto LABEL_8;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  if (v0[5]) {
    goto LABEL_7;
  }
LABEL_13:
  uint64_t v20 = sub_2562E3410();
  os_log_type_t v21 = sub_2562E37E0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_256226000, v20, v21, "#SpeakerIdSelectionSELFReporter: DeviceSelectionEvent is nil", v22, 2u);
    MEMORY[0x25A2A5190](v22, -1, -1);
  }

  uint64_t v23 = *(void *)(v0[6] + 16);
  v0[11] = v23;
  if (!v23)
  {
LABEL_23:
    uint64_t v36 = (uint64_t (*)(void))v0[1];
    return v36();
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = 0;
  while (1)
  {
    v0[12] = v24;
    uint64_t v25 = (void *)v0[5];
    uint64_t v26 = *(void **)(v0[6] + 8 * v24 + 32);
    v0[13] = v26;
    id v27 = v26;
    id v28 = v25;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v29 = v28;
    uint64_t v30 = sub_2562E3410();
    os_log_type_t v31 = sub_2562E37F0();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = (void *)v0[5];
    if (!v32) {
      break;
    }
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 138412290;
    *(void *)(v34 + 4) = v33;
    *uint64_t v35 = v33;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    _os_log_impl(&dword_256226000, v30, v31, "#SpeakerIdSelectionSELFReporter: result.speakerIdDonationEvents %@", (uint8_t *)v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
    swift_arrayDestroy();
    MEMORY[0x25A2A5190](v35, -1, -1);
    MEMORY[0x25A2A5190](v34, -1, -1);

    if (v26) {
      goto LABEL_26;
    }
LABEL_21:
    uint64_t v24 = v0[12] + 1;
    if (v24 == v0[11])
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();

  if (!v26) {
    goto LABEL_21;
  }
LABEL_26:
  uint64_t v37 = v0[8];
  uint64_t v38 = v0[4];
  id v39 = v27;
  int v40 = (void *)swift_task_alloc();
  v0[14] = v40;
  *int v40 = v0;
  v40[1] = sub_2562CC308;
  uint64_t v18 = v38 + v37;
  uint64_t v17 = (uint64_t)v39;
LABEL_8:
  return sub_256249DE0(v17, v18);
}

uint64_t sub_2562CBEDC()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2562CC730;
  }
  else {
    uint64_t v2 = sub_2562CC01C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2562CC01C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 48) + 16);
  *(void *)(v0 + 88) = v1;
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    while (1)
    {
      *(void *)(v0 + 96) = v2;
      uint64_t v3 = *(void **)(v0 + 40);
      uint64_t v4 = *(void **)(*(void *)(v0 + 48) + 8 * v2 + 32);
      *(void *)(v0 + 104) = v4;
      id v5 = v4;
      id v6 = v3;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v7 = v6;
      id v8 = sub_2562E3410();
      os_log_type_t v9 = sub_2562E37F0();
      BOOL v10 = os_log_type_enabled(v8, v9);
      os_log_type_t v11 = *(void **)(v0 + 40);
      if (v10)
      {
        uint64_t v12 = swift_slowAlloc();
        id v13 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v12 = 138412290;
        *(void *)(v12 + 4) = v11;
        *id v13 = v11;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        _os_log_impl(&dword_256226000, v8, v9, "#SpeakerIdSelectionSELFReporter: result.speakerIdDonationEvents %@", (uint8_t *)v12, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
        swift_arrayDestroy();
        MEMORY[0x25A2A5190](v13, -1, -1);
        MEMORY[0x25A2A5190](v12, -1, -1);

        if (v4) {
          goto LABEL_12;
        }
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        if (v4)
        {
LABEL_12:
          uint64_t v16 = *(void *)(v0 + 64);
          uint64_t v17 = *(void *)(v0 + 32);
          id v18 = v5;
          uint64_t v19 = (void *)swift_task_alloc();
          *(void *)(v0 + 112) = v19;
          void *v19 = v0;
          v19[1] = sub_2562CC308;
          return sub_256249DE0((uint64_t)v18, v17 + v16);
        }
      }
      uint64_t v2 = *(void *)(v0 + 96) + 1;
      if (v2 == *(void *)(v0 + 88))
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  id v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_2562CC308()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2562CC844;
  }
  else
  {
    uint64_t v2 = sub_2562CC458;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2562CC458()
{
  uint64_t v1 = (void *)v0[13];

  while (1)
  {
    uint64_t v2 = v0[12] + 1;
    if (v2 == v0[11]) {
      break;
    }
    v0[12] = v2;
    uint64_t v3 = (void *)v0[5];
    uint64_t v4 = *(void **)(v0[6] + 8 * v2 + 32);
    v0[13] = v4;
    id v5 = v4;
    id v6 = v3;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v7 = v6;
    id v8 = sub_2562E3410();
    os_log_type_t v9 = sub_2562E37F0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    os_log_type_t v11 = (void *)v0[5];
    if (v10)
    {
      uint64_t v12 = swift_slowAlloc();
      id v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      *(void *)(v12 + 4) = v11;
      *id v13 = v11;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      _os_log_impl(&dword_256226000, v8, v9, "#SpeakerIdSelectionSELFReporter: result.speakerIdDonationEvents %@", (uint8_t *)v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
      swift_arrayDestroy();
      MEMORY[0x25A2A5190](v13, -1, -1);
      MEMORY[0x25A2A5190](v12, -1, -1);

      if (v4)
      {
LABEL_6:
        uint64_t v14 = v0[8];
        uint64_t v15 = v0[4];
        id v16 = v5;
        uint64_t v17 = (void *)swift_task_alloc();
        v0[14] = v17;
        *uint64_t v17 = v0;
        v17[1] = sub_2562CC308;
        return sub_256249DE0((uint64_t)v16, v15 + v14);
      }
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      if (v4) {
        goto LABEL_6;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_2562CC730()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "#SpeakerIdSelectionSELFReporter: Unable to report SpeakerId Selection Events", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  swift_willThrow();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2562CC844()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E3800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "#SpeakerIdSelectionSELFReporter: Unable to report SpeakerId Donation Events", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }
  uint64_t v4 = *(void **)(v0 + 104);

  swift_willThrow();
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2562CC964()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t SpeakerIdSelectionSELFReporter.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SpeakerIdSelectionSELFReporter.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework30SpeakerIdSelectionSELFReporter_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SpeakerIdSelectionReporter()
{
  return self;
}

uint64_t method lookup function for SpeakerIdSelectionReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpeakerIdSelectionReporter);
}

uint64_t dispatch thunk of SpeakerIdSelectionReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 80) + **(int **)(*(void *)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t sub_2562CCC2C()
{
  return type metadata accessor for SpeakerIdSelectionSELFReporter();
}

uint64_t type metadata accessor for SpeakerIdSelectionSELFReporter()
{
  uint64_t result = qword_269F55988;
  if (!qword_269F55988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for SpeakerIdSelectionSELFReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpeakerIdSelectionSELFReporter);
}

uint64_t dispatch thunk of SpeakerIdSelectionSELFReporter.__allocating_init(logger:reportingService:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t SiriDeviceExperimentMetricsReporter.deinit()
{
  return v0;
}

uint64_t sub_2562CCCB4()
{
  return MEMORY[0x270FA2498](sub_2562CCCD0, 0, 0);
}

uint64_t sub_2562CCCD0()
{
  return sub_2562E3AC0();
}

uint64_t SiriDeviceExperimentMetricsReporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2562CCD60(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 80) + **(int **)(**(void **)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t type metadata accessor for SiriDeviceExperimentMetricsReporter()
{
  return self;
}

uint64_t method lookup function for SiriDeviceExperimentMetricsReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriDeviceExperimentMetricsReporter);
}

uint64_t dispatch thunk of SiriDeviceExperimentMetricsReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 80) + **(int **)(*(void *)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t AssetPenetrationCalculator.__allocating_init(logger:sqlFileURL:bookmarkService:oddId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_2562E3020();
  uint64_t v9 = v8 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_logger;
  uint64_t v10 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a1, v10);
  sub_25626DA70(a2, v8 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_sqlFileURL);
  *(void *)(v8 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_bookmarkService) = a3;
  uint64_t v11 = v8 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_oddId;
  uint64_t v12 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a4, v12);
  return v8;
}

uint64_t AssetPenetrationResults.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssetPenetrationResults.eventStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*AssetPenetrationResults.eventStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t AssetPenetrationResults.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssetPenetrationResults.conversationStreamMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AssetPenetrationResults.conversationStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t AssetPenetrationResults.assetPenetrationData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AssetPenetrationResults.assetPenetrationData.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*AssetPenetrationResults.assetPenetrationData.modify())()
{
  return nullsub_1;
}

uint64_t AssetPenetrationCalculator.init(logger:sqlFileURL:bookmarkService:oddId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2562E3020();
  uint64_t v9 = v4 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_logger;
  uint64_t v10 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a1, v10);
  sub_25626DA70(a2, v4 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_sqlFileURL);
  *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_bookmarkService) = a3;
  uint64_t v11 = v4 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_oddId;
  uint64_t v12 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a4, v12);
  return v4;
}

uint64_t sub_2562CD2B8(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_2562CD2D8, 0, 0);
}

uint64_t sub_2562CD2D8()
{
  id v28 = v0;
  uint64_t v1 = v0[4] + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_logger;
  swift_retain_n();
  uint64_t v2 = sub_2562E3410();
  os_log_type_t v3 = sub_2562E37F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v27 = v5;
    sub_2562E2FD0();
    sub_2562CDFE0();
    uint64_t v6 = sub_2562E3C80();
    v0[2] = sub_256229738(v6, v7, &v27);
    sub_2562E38F0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_256226000, v2, v3, "SQL calculator invoked: AssetPenetrationCalculator %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A5190](v5, -1, -1);
    MEMORY[0x25A2A5190](v4, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v8 = v0[4];
  uint64_t v9 = sub_2562E2E30();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = v8 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_sqlFileURL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D10);
  uint64_t v13 = swift_task_alloc();
  sub_2562BDAE4(v12, v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v9) == 1)
  {
    sub_2562CD834(v13);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_25622CE3C();
    swift_allocError();
    *uint64_t v14 = 9;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v11, v13, v9);
    swift_task_dealloc();
    id v15 = (id)sub_2562E3110();
    id v18 = sub_2562CD894(v11, v15);
    uint64_t v19 = v0[4];
    uint64_t v26 = (uint64_t *)v0[3];

    unint64_t v25 = sub_2562B4060((uint64_t)v18, v19 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_oddId, v1);
    uint64_t v20 = sub_2562E2F80();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = swift_task_alloc();
    sub_2562E30A0();
    uint64_t v23 = sub_2562E30B0();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v20);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v9);
    uint64_t v24 = MEMORY[0x263F8EE78];
    *uint64_t v26 = v23;
    v26[1] = v24;
    v26[2] = v25;
    swift_task_dealloc();
    swift_task_dealloc();
  }
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_2562CD834(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint8_t *sub_2562CD894(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_2562E35A0();
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (uint8_t *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2562E3590();
  sub_2562E3530();
  if (v3)
  {
    uint64_t v8 = sub_2562E3410();
    os_log_type_t v9 = sub_2562E3800();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_256226000, v8, v9, "SQL file could not be loaded", v7, 2u);
      MEMORY[0x25A2A5190](v7, -1, -1);
    }

    sub_25622CE3C();
    swift_allocError();
    unsigned char *v10 = 10;
    swift_willThrow();
  }
  else
  {
    uint64_t v35 = v2;
    uint64_t v12 = a2;
    uint64_t v13 = sub_2562E3310();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D40);
    sub_2562E3300();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_2562E4C90;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v13;
    *(void *)(v16 + 24) = v15;
    swift_retain();
    sub_2562E32F0();
    id v17 = objc_allocWithZone((Class)sub_2562E3260());
    id v18 = v12;
    uint64_t v19 = (void *)sub_2562E3230();
    unint64_t v7 = (uint8_t *)sub_2562E3250();
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_2562E3290();
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = v20;
      id v23 = v21;
      uint64_t v24 = sub_2562E3410();
      os_log_type_t v25 = sub_2562E3800();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v35 = v15;
        uint64_t v26 = swift_slowAlloc();
        os_log_t v34 = v24;
        uint64_t v27 = (uint8_t *)v26;
        uint64_t v33 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 138412290;
        id v28 = v21;
        uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v36 = v29;
        sub_2562E38F0();
        uint64_t v30 = v33;
        *uint64_t v33 = v29;

        os_log_t v31 = v34;
        _os_log_impl(&dword_256226000, v34, v25, "%@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
        swift_arrayDestroy();
        MEMORY[0x25A2A5190](v30, -1, -1);
        MEMORY[0x25A2A5190](v27, -1, -1);
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {

      swift_release();
    }
  }
  return v7;
}

uint64_t AssetPenetrationCalculator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2562CD834(v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_sqlFileURL);
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_calendar;
  uint64_t v4 = sub_2562E3060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_oddId;
  uint64_t v6 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t AssetPenetrationCalculator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2562CD834(v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_sqlFileURL);
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_calendar;
  uint64_t v4 = sub_2562E3060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16MetricsFramework26AssetPenetrationCalculator_oddId;
  uint64_t v6 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_deallocClassInstance();
}

uint64_t sub_2562CDF30(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25622844C;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_2562CD2D8, 0, 0);
}

unint64_t sub_2562CDFE0()
{
  unint64_t result = qword_269F53D50;
  if (!qword_269F53D50)
  {
    sub_2562E2FD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F53D50);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetPenetrationResults()
{
  return &type metadata for AssetPenetrationResults;
}

uint64_t sub_2562CE03C()
{
  return type metadata accessor for AssetPenetrationCalculator();
}

uint64_t type metadata accessor for AssetPenetrationCalculator()
{
  uint64_t result = qword_269F559E8;
  if (!qword_269F559E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2562CE090()
{
  sub_2562E3430();
  if (v0 <= 0x3F)
  {
    sub_25622F25C();
    if (v1 <= 0x3F)
    {
      sub_2562E3060();
      if (v2 <= 0x3F)
      {
        sub_2562E2FD0();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for AssetPenetrationCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AssetPenetrationCalculator);
}

uint64_t dispatch thunk of AssetPenetrationCalculator.__allocating_init(logger:sqlFileURL:bookmarkService:oddId:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of AssetPenetrationCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_25622844C;
  return v8(a1, a2);
}

uint64_t sub_2562CE318()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t SiriDeviceExperimentMetricsDataProvider.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC16MetricsFramework39SiriDeviceExperimentMetricsDataProvider_logger;
  uint64_t v4 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SiriDeviceExperimentMetricsDataProvider.init(logger:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16MetricsFramework39SiriDeviceExperimentMetricsDataProvider_logger;
  uint64_t v4 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t sub_2562CE44C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2562CE46C, 0, 0);
}

uint64_t sub_2562CE46C()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E37F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "no-op data provider invoked: SiriDeviceExperimentMetricsDataProvider", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t SiriDeviceExperimentMetricsDataProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework39SiriDeviceExperimentMetricsDataProvider_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SiriDeviceExperimentMetricsDataProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework39SiriDeviceExperimentMetricsDataProvider_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2562CE650()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2562CE46C, 0, 0);
}

ValueMetadata *type metadata accessor for SiriDeviceExperimentMetricsDataRecord()
{
  return &type metadata for SiriDeviceExperimentMetricsDataRecord;
}

uint64_t sub_2562CE684()
{
  return type metadata accessor for SiriDeviceExperimentMetricsDataProvider();
}

uint64_t type metadata accessor for SiriDeviceExperimentMetricsDataProvider()
{
  uint64_t result = qword_269F55A18;
  if (!qword_269F55A18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for SiriDeviceExperimentMetricsDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriDeviceExperimentMetricsDataProvider);
}

uint64_t dispatch thunk of SiriDeviceExperimentMetricsDataProvider.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SiriDeviceExperimentMetricsDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 96) + **(int **)(*(void *)v1 + 96));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

uint64_t SpeakerIdManifestDataProvider.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC16MetricsFramework29SpeakerIdManifestDataProvider_logger;
  uint64_t v4 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SpeakerIdManifestDataProvider.init(logger:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16MetricsFramework29SpeakerIdManifestDataProvider_logger;
  uint64_t v4 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t sub_2562CE908()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2562CE928, 0, 0);
}

uint64_t sub_2562CE928()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E37F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "no-op data provider invoked: SpeakerIdManifestDataRecord", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t SpeakerIdManifestDataProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29SpeakerIdManifestDataProvider_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SpeakerIdManifestDataProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29SpeakerIdManifestDataProvider_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2562CEB0C()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2562CE928, 0, 0);
}

ValueMetadata *type metadata accessor for SpeakerIdManifestDataRecord()
{
  return &type metadata for SpeakerIdManifestDataRecord;
}

uint64_t sub_2562CEB40()
{
  return type metadata accessor for SpeakerIdManifestDataProvider();
}

uint64_t type metadata accessor for SpeakerIdManifestDataProvider()
{
  uint64_t result = qword_269F55A48;
  if (!qword_269F55A48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for SpeakerIdManifestDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpeakerIdManifestDataProvider);
}

uint64_t dispatch thunk of SpeakerIdManifestDataProvider.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SpeakerIdManifestDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 96) + **(int **)(*(void *)v1 + 96));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25622844C;
  return v6(a1);
}

ValueMetadata *type metadata accessor for RequestWithNoAssetDataRecord()
{
  return &type metadata for RequestWithNoAssetDataRecord;
}

uint64_t sub_2562CECD8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework30RequestWithNoAssetDataProvider_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2562CED78()
{
  return type metadata accessor for RequestWithNoAssetDataProvider();
}

uint64_t type metadata accessor for RequestWithNoAssetDataProvider()
{
  uint64_t result = qword_269F55A68;
  if (!qword_269F55A68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2562CEDCC()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2562CEDF0, 0, 0);
}

uint64_t sub_2562CEDF0()
{
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E37F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "no-op data provider invoked: RequestWithNoAssetDataProvider", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id EventMetadata.transformToODDClientEventMetadata()()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E6B0]), sel_init);
  if (!v2) {
    return 0;
  }
  id v32 = v2;
  uint64_t v3 = sub_2562E2FD0();
  os_log_t v31 = &v30;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
  MEMORY[0x270FA5388](v6 - 8);
  sub_25622F360(v0, (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  if (v33((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v3) == 1)
  {
    uint64_t v8 = sub_25622F3C4((uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
    id v9 = v32;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    id v10 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
    uint64_t v11 = (void *)sub_2562E2FB0();
    id v12 = objc_msgSend(v10, sel_initWithNSUUID_, v11);

    id v9 = v32;
    objc_msgSend(v32, sel_setOddId_, v12);

    uint64_t v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  }
  os_log_t v31 = &v30;
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v15 = MEMORY[0x270FA5388](v1 + v14[5]);
  sub_25622F360(v15, (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  if (v33((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v3) == 1)
  {
    sub_25622F3C4((uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
    sub_2562E37F0();
    sub_256231B4C(0, (unint64_t *)&qword_269F55788);
    uint64_t v16 = (void *)sub_2562E38B0();
    sub_2562E3350();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    id v17 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
    id v18 = (void *)sub_2562E2FB0();
    id v19 = objc_msgSend(v17, sel_initWithNSUUID_, v18);

    id v9 = v32;
    objc_msgSend(v32, sel_setDeviceAggregationId_, v19);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
  }
  uint64_t v20 = MEMORY[0x270FA5388](v1 + v14[6]);
  uint64_t v21 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25622F360(v20, (uint64_t)v21, &qword_269F53D68);
  unsigned int v22 = v33(v21, 1, v3);
  sub_25622F3C4((uint64_t)v21, &qword_269F53D68);
  if (v22 == 1)
  {
    sub_2562E37F0();
    sub_256231B4C(0, (unint64_t *)&qword_269F55788);
    id v23 = (void *)sub_2562E38B0();
    sub_2562E3350();
  }
  uint64_t v24 = v1 + v14[10];
  if (*(unsigned char *)(v24 + 8))
  {
    sub_2562E37F0();
    sub_256231B4C(0, (unint64_t *)&qword_269F55788);
    os_log_type_t v25 = (void *)sub_2562E38B0();
    sub_2562E3350();
  }
  else
  {
    objc_msgSend(v9, sel_setUserAggregationIdExpirationTimestampMs_, *(void *)v24);
  }
  uint64_t v26 = v1 + v14[9];
  if (*(unsigned char *)(v26 + 8))
  {
    sub_2562E37F0();
    sub_256231B4C(0, (unint64_t *)&qword_269F55788);
    uint64_t v27 = (void *)sub_2562E38B0();
    sub_2562E3350();
  }
  else
  {
    objc_msgSend(v9, sel_setUserAggregationIdRotationTimestampMs_, *(void *)v26);
  }
  uint64_t v28 = v1 + v14[7];
  if ((*(unsigned char *)(v28 + 8) & 1) == 0) {
    objc_msgSend(v9, sel_setEventTimestampInMsSince1970_, *(void *)v28);
  }
  if (*(void *)(v1 + v14[8])) {
    objc_msgSend(v9, sel_setAggregationInterval_);
  }
  return v9;
}

uint64_t type metadata accessor for EventMetadata(uint64_t a1)
{
  return sub_25622EF90(a1, (uint64_t *)&unk_269F55AF8);
}

id static ODDSiriSchemaODDTimeInterval.toBiomeEvent(timeInterval:)(id a1)
{
  id v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, sel_startTimestampInSecondsSince1970);
    objc_msgSend(v1, sel_numberOfSeconds);
    id v1 = (id)sub_2562E3DB0();
    id v2 = (void *)sub_2562E3DA0();
  }
  else
  {
    id v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A458]), sel_initWithStartTimestampInSecondsSince1970_numberOfSeconds_, v1, v2);

  return v3;
}

uint64_t ProductId.rawValue.getter()
{
  return *v0;
}

id static SISchemaISOLocale.toBiomeEvent(isoLocale:)(id a1)
{
  id v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, sel_languageCode);
    id v2 = (void *)sub_2562E3D30();
    objc_msgSend(v1, sel_countryCode);
    id v1 = (id)sub_2562E3D30();
  }
  else
  {
    id v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A478]), sel_initWithLanguageCode_countryCode_, v2, v1);

  return v3;
}

uint64_t static ProductId.fromString(productIdString:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  if (!a2) {
    goto LABEL_10;
  }
  uint64_t v5 = result;
  if (result != 0x4E41545349535341 || a2 != 0xE900000000000054)
  {
    uint64_t result = sub_2562E3C90();
    if ((result & 1) == 0)
    {
      if (v5 == 0x4F49544154434944 && a2 == 0xE90000000000004ELL || (uint64_t result = sub_2562E3C90(), (result & 1) != 0))
      {
        char v6 = 2;
        goto LABEL_11;
      }
LABEL_10:
      char v6 = 0;
      goto LABEL_11;
    }
  }
  char v6 = 1;
LABEL_11:
  *a3 = v6;
  return result;
}

void EventMetadata.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25622F360(v0, (uint64_t)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  uint64_t v4 = sub_2562E2FD0();
  uint64_t v5 = *(void *)(v4 - 8);
  char v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v7 = v6((char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v4);
  if (v7 == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    MEMORY[0x270FA5388](v7);
    id v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    sub_2562E3D70();
    sub_2562B63C8(&qword_269F55A80);
    sub_2562E34D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  id v10 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v11 = MEMORY[0x270FA5388](v0 + v10[5]);
  sub_25622F360(v11, (uint64_t)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  uint64_t v12 = v6((char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v4);
  if (v12 == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    v22[0] = v22;
    MEMORY[0x270FA5388](v12);
    v22[1] = v22;
    uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    sub_2562E3D70();
    sub_2562B63C8(&qword_269F55A80);
    sub_2562E34D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  }
  uint64_t v15 = MEMORY[0x270FA5388](v0 + v10[6]);
  uint64_t v16 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25622F360(v15, (uint64_t)v16, &qword_269F53D68);
  uint64_t v17 = v6(v16, 1, v4);
  if (v17 == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    MEMORY[0x270FA5388](v17);
    id v19 = (char *)v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v19, v16, v4);
    sub_2562E3D70();
    sub_2562B63C8(&qword_269F55A80);
    sub_2562E34D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v19, v4);
  }
  if (*(unsigned char *)(v1 + v10[9] + 8) == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    sub_2562E3D70();
    sub_2562E3D80();
  }
  if (*(unsigned char *)(v1 + v10[10] + 8) == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    sub_2562E3D70();
    sub_2562E3D80();
  }
  if (*(unsigned char *)(v1 + v10[7] + 8) == 1)
  {
    sub_2562E3D70();
  }
  else
  {
    sub_2562E3D70();
    sub_2562E3D80();
  }
  uint64_t v20 = *(void **)(v1 + v10[8]);
  sub_2562E3D70();
  if (v20)
  {
    id v21 = v20;
    sub_2562E3880();
  }
}

uint64_t EventMetadata.hashValue.getter()
{
  return sub_2562E3D90();
}

uint64_t sub_2562CFC78()
{
  return sub_2562E3D90();
}

uint64_t sub_2562CFCBC()
{
  return sub_2562E3D90();
}

MetricsFramework::ProductId_optional __swiftcall ProductId.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (MetricsFramework::ProductId_optional)rawValue;
}

uint64_t sub_2562CFD10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11, int a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19, int a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,char a27,int a28,char a29,int a30,char a31,int a32,char a33,int a34,char a35,int a36,char a37,int a38,char a39,int a40,char a41,int a42,char a43,int a44,char a45,int a46,char a47,int a48,char a49,int a50,char a51,int a52,char a53,uint64_t a54,uint64_t a55,int a56,char a57,uint64_t a58,char a59,uint64_t a60,int a61,char a62)
{
  char v65 = *a6;
  sub_25622F514(a1, a9, &qword_269F54398);
  uint64_t v66 = (int *)type metadata accessor for DeviceUsageMetrics(0);
  uint64_t result = sub_25622F514(a2, a9 + v66[5], &qword_269F53D68);
  uint64_t v68 = (void *)(a9 + v66[6]);
  *uint64_t v68 = a3;
  v68[1] = a4;
  uint64_t v69 = a9 + v66[7];
  *(_DWORD *)uint64_t v69 = a5;
  *(unsigned char *)(v69 + 4) = BYTE4(a5) & 1;
  *(unsigned char *)(a9 + v66[8]) = v65;
  uint64_t v70 = (void *)(a9 + v66[9]);
  *uint64_t v70 = a7;
  v70[1] = a8;
  uint64_t v71 = a9 + v66[10];
  *(_DWORD *)uint64_t v71 = a10;
  *(unsigned char *)(v71 + 4) = a11 & 1;
  uint64_t v72 = a9 + v66[11];
  *(_DWORD *)uint64_t v72 = a12;
  *(unsigned char *)(v72 + 4) = a13 & 1;
  uint64_t v73 = (void *)(a9 + v66[12]);
  *uint64_t v73 = a14;
  v73[1] = a15;
  v74 = (void *)(a9 + v66[13]);
  void *v74 = a16;
  v74[1] = a17;
  uint64_t v75 = a9 + v66[14];
  *(_DWORD *)uint64_t v75 = a18;
  *(unsigned char *)(v75 + 4) = a19 & 1;
  uint64_t v76 = a9 + v66[15];
  *(_DWORD *)uint64_t v76 = a20;
  *(unsigned char *)(v76 + 4) = a21 & 1;
  *(void *)(a9 + v66[16]) = a22;
  *(void *)(a9 + v66[17]) = a23;
  v77 = (void *)(a9 + v66[18]);
  void *v77 = a24;
  v77[1] = a25;
  uint64_t v78 = a9 + v66[19];
  *(_DWORD *)uint64_t v78 = a26;
  *(unsigned char *)(v78 + 4) = a27 & 1;
  uint64_t v79 = a9 + v66[20];
  *(_DWORD *)uint64_t v79 = a28;
  *(unsigned char *)(v79 + 4) = a29 & 1;
  uint64_t v80 = a9 + v66[21];
  *(_DWORD *)uint64_t v80 = a30;
  *(unsigned char *)(v80 + 4) = a31 & 1;
  uint64_t v81 = a9 + v66[22];
  *(_DWORD *)uint64_t v81 = a32;
  *(unsigned char *)(v81 + 4) = a33 & 1;
  uint64_t v82 = a9 + v66[23];
  *(_DWORD *)uint64_t v82 = a34;
  *(unsigned char *)(v82 + 4) = a35 & 1;
  uint64_t v83 = a9 + v66[24];
  *(_DWORD *)uint64_t v83 = a36;
  *(unsigned char *)(v83 + 4) = a37 & 1;
  uint64_t v84 = a9 + v66[25];
  *(_DWORD *)uint64_t v84 = a38;
  *(unsigned char *)(v84 + 4) = a39 & 1;
  uint64_t v85 = a9 + v66[26];
  *(_DWORD *)uint64_t v85 = a40;
  *(unsigned char *)(v85 + 4) = a41 & 1;
  uint64_t v86 = a9 + v66[27];
  *(_DWORD *)uint64_t v86 = a42;
  *(unsigned char *)(v86 + 4) = a43 & 1;
  uint64_t v87 = a9 + v66[28];
  *(_DWORD *)uint64_t v87 = a44;
  *(unsigned char *)(v87 + 4) = a45 & 1;
  uint64_t v88 = a9 + v66[29];
  *(_DWORD *)uint64_t v88 = a46;
  *(unsigned char *)(v88 + 4) = a47 & 1;
  uint64_t v89 = a9 + v66[30];
  *(_DWORD *)uint64_t v89 = a48;
  *(unsigned char *)(v89 + 4) = a49 & 1;
  uint64_t v90 = a9 + v66[31];
  *(_DWORD *)uint64_t v90 = a50;
  *(unsigned char *)(v90 + 4) = a51 & 1;
  uint64_t v91 = a9 + v66[32];
  *(_DWORD *)uint64_t v91 = a52;
  *(unsigned char *)(v91 + 4) = a53 & 1;
  v92 = (void *)(a9 + v66[33]);
  void *v92 = a54;
  v92[1] = a55;
  uint64_t v93 = a9 + v66[34];
  *(_DWORD *)uint64_t v93 = a56;
  *(unsigned char *)(v93 + 4) = a57 & 1;
  *(void *)(a9 + v66[35]) = a58;
  *(unsigned char *)(a9 + v66[36]) = a59;
  *(void *)(a9 + v66[37]) = a60;
  uint64_t v94 = a9 + v66[38];
  *(_DWORD *)uint64_t v94 = a61;
  *(unsigned char *)(v94 + 4) = a62 & 1;
  return result;
}

MetricsFramework::ProductId_optional sub_2562D011C(Swift::Int *a1)
{
  return ProductId.init(rawValue:)(*a1);
}

void sub_2562D0124(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2562D0130@<X0>(uint64_t a1@<X8>)
{
  uint64_t v74 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = v4;
  uint64_t v5 = v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_eventMetadata;
  swift_beginAccess();
  sub_25622F360(v5, (uint64_t)v4, &qword_269F54398);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = v8;
  uint64_t v9 = v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_assistantId;
  swift_beginAccess();
  sub_25622F360(v9, (uint64_t)v8, &qword_269F53D68);
  id v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_deviceType);
  uint64_t v11 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_programCode);
  char v76 = *(unsigned char *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_productId);
  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_systemBuild);
  uint64_t v13 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_dataSharingOptInStatus);
  uint64_t v14 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_viewInterface);
  uint64_t v69 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_audioInterfaceVendorId);
  uint64_t v68 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_audioInterfaceProductId);
  uint64_t v15 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_asrLocation);
  uint64_t v16 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_nlLocation);
  uint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriInputLocale);
  uint64_t v70 = *(void **)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_dictationLocale);
  uint64_t v71 = (void *)v17;
  unint64_t v67 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_subDomain);
  uint64_t v18 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_totalTurnCount);
  id v19 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_validTurnCount);
  uint64_t v20 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriTasksStarted);
  id v21 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriTasksCompleted);
  unsigned int v22 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_flowTasksStarted);
  id v23 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_flowTasksCompleted);
  uint64_t v24 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_reliabilityRequestCount);
  os_log_type_t v25 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_reliabilityTurnCount);
  uint64_t v26 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_clientErrorCount);
  uint64_t v27 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_undesiredResponseCount);
  uint64_t v28 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_fatalResponseCount);
  uint64_t v29 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_failureResponseCount);
  uint64_t v30 = (unsigned int *)(v1
                       + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriUnavailableResponseCount);
  os_log_t v31 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_asrTurnCount);
  id v32 = (uint64_t *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriResponseId);
  uint64_t v33 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_responseCategory);
  uint64_t v66 = *(void *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_turnIds);
  int v62 = *(unsigned __int8 *)(v1
                           + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_isIntelligenceEngineRequest);
  uint64_t v61 = *(void *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_ieRouting);
  os_log_t v34 = (unsigned int *)(v1 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_invocationSource);
  unsigned __int8 v75 = *((unsigned char *)v11 + 4);
  unint64_t v35 = *v11 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v13 + 4);
  unint64_t v64 = *v13 | ((unint64_t)v75 << 32);
  unint64_t v65 = v35;
  unsigned __int8 v75 = *((unsigned char *)v14 + 4);
  unint64_t v63 = *v14 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v15 + 4);
  unint64_t v60 = *v15 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v16 + 4);
  unint64_t v59 = *v16 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v18 + 4);
  unint64_t v36 = *v18 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v19 + 4);
  unint64_t v37 = *v19 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v20 + 4);
  unint64_t v38 = *v20 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v21 + 4);
  unint64_t v39 = *v21 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v22 + 4);
  unint64_t v40 = *v22 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v23 + 4);
  unint64_t v41 = *v23 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v24 + 4);
  unint64_t v42 = *v24 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v25 + 4);
  unint64_t v43 = *v25 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v26 + 4);
  unint64_t v44 = *v26 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v27 + 4);
  unint64_t v45 = *v27 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v28 + 4);
  unint64_t v46 = *v28 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v29 + 4);
  unint64_t v47 = *v29 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v30 + 4);
  unint64_t v48 = *v30 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v31 + 4);
  unint64_t v49 = *v31 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v33 + 4);
  unint64_t v50 = *v33 | ((unint64_t)v75 << 32);
  unsigned __int8 v75 = *((unsigned char *)v34 + 4);
  unint64_t v51 = *v34 | ((unint64_t)v75 << 32);
  unint64_t v58 = v50;
  unint64_t v57 = v48;
  uint64_t v52 = v70;
  uint64_t v53 = v71;
  sub_2562CFD10((uint64_t)v73, (uint64_t)v72, *v10, v10[1], v65, &v76, *v12, v12[1], v74, v64, SBYTE4(v64), v63, SBYTE4(v63), *v69, v69[1], *v68, v68[1], v60, SBYTE4(v60),
    v59,
    SBYTE4(v59),
    (uint64_t)v71,
    (uint64_t)v70,
    *v67,
    v67[1],
    v36,
    SBYTE4(v36),
    v37,
    SBYTE4(v37),
    v38,
    SBYTE4(v38),
    v39,
    SBYTE4(v39),
    v40,
    SBYTE4(v40),
    v41,
    SBYTE4(v41),
    v42,
    SBYTE4(v42),
    v43,
    SBYTE4(v43),
    v44,
    SBYTE4(v44),
    v45,
    SBYTE4(v45),
    v46,
    SBYTE4(v46),
    v47,
    SBYTE4(v47),
    v57,
    SBYTE4(v57),
    v49,
    SBYTE4(v49),
    *v32,
    v32[1],
    v58,
    SBYTE4(v58),
    v66,
    v62,
    v61,
    v51,
    SBYTE4(v51));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v54 = v53;
  id v55 = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceUsageMetricsBuilderImpl.deinit()
{
  sub_25622F3C4(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_eventMetadata, &qword_269F54398);
  sub_25622F3C4(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_assistantId, &qword_269F53D68);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DeviceUsageMetricsBuilderImpl.__deallocating_deinit()
{
  DeviceUsageMetricsBuilderImpl.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_2562D085C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_eventMetadata;
  uint64_t v2 = type metadata accessor for EventMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_assistantId;
  uint64_t v4 = sub_2562E2FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_deviceType);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_programCode;
  *(_DWORD *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 4) = 1;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_productId) = 3;
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_systemBuild);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_dataSharingOptInStatus;
  *(_DWORD *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 4) = 1;
  uint64_t v9 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_viewInterface;
  *(_DWORD *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 4) = 1;
  id v10 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_audioInterfaceVendorId);
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_audioInterfaceProductId);
  *uint64_t v11 = 0;
  v11[1] = 0;
  uint64_t v12 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_asrLocation;
  *(_DWORD *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 4) = 1;
  uint64_t v13 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_nlLocation;
  *(_DWORD *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 4) = 1;
  *(void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriInputLocale) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_dictationLocale) = 0;
  uint64_t v14 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_subDomain);
  *uint64_t v14 = 0;
  v14[1] = 0;
  uint64_t v15 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_totalTurnCount;
  *(_DWORD *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 4) = 1;
  uint64_t v16 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_validTurnCount;
  *(_DWORD *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 4) = 1;
  uint64_t v17 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriTasksStarted;
  *(_DWORD *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 4) = 1;
  uint64_t v18 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriTasksCompleted;
  *(_DWORD *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 4) = 1;
  uint64_t v19 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_flowTasksStarted;
  *(_DWORD *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 4) = 1;
  uint64_t v20 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_flowTasksCompleted;
  *(_DWORD *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 4) = 1;
  uint64_t v21 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_reliabilityRequestCount;
  *(_DWORD *)uint64_t v21 = 0;
  *(unsigned char *)(v21 + 4) = 1;
  uint64_t v22 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_reliabilityTurnCount;
  *(_DWORD *)uint64_t v22 = 0;
  *(unsigned char *)(v22 + 4) = 1;
  uint64_t v23 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_clientErrorCount;
  *(_DWORD *)uint64_t v23 = 0;
  *(unsigned char *)(v23 + 4) = 1;
  uint64_t v24 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_undesiredResponseCount;
  *(_DWORD *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 4) = 1;
  uint64_t v25 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_fatalResponseCount;
  *(_DWORD *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 4) = 1;
  uint64_t v26 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_failureResponseCount;
  *(_DWORD *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 4) = 1;
  uint64_t v27 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriUnavailableResponseCount;
  *(_DWORD *)uint64_t v27 = 0;
  *(unsigned char *)(v27 + 4) = 1;
  uint64_t v28 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_asrTurnCount;
  *(_DWORD *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 4) = 1;
  uint64_t v29 = (void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_siriResponseId);
  *uint64_t v29 = 0;
  v29[1] = 0;
  uint64_t v30 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_responseCategory;
  *(_DWORD *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 4) = 1;
  *(void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_turnIds) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_isIntelligenceEngineRequest) = 2;
  *(void *)(v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_ieRouting) = 0;
  uint64_t v31 = v0 + OBJC_IVAR____TtC16MetricsFramework29DeviceUsageMetricsBuilderImpl_invocationSource;
  *(_DWORD *)uint64_t v31 = 0;
  *(unsigned char *)(v31 + 4) = 1;
  return v0;
}

id sub_2562D0B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10)
{
  uint64_t v11 = v10;
  if (a2)
  {
    uint64_t v16 = (void *)sub_2562E3550();
    swift_bridgeObjectRelease();
    uint64_t v17 = a9;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0;
    uint64_t v19 = a10;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v20 = 0;
    goto LABEL_8;
  }
  uint64_t v16 = 0;
  uint64_t v17 = a9;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = (void *)sub_2562E3550();
  swift_bridgeObjectRelease();
  uint64_t v19 = a10;
  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v20 = (void *)sub_2562E3550();
  swift_bridgeObjectRelease();
LABEL_8:
  id v21 = objc_msgSend(v11, sel_initWithOddIdUUID_deviceAggregationId_userAggregationId_eventTimestampInMSSince1970_timeInterval_userAggregationIdRotationTimestampInMs_userAggregationIdExpirationTimestampInMs_, v16, v18, v20, a7, a8, v17, v19);

  return v21;
}

uint64_t _s16MetricsFramework13EventMetadataV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  v135 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v4 = MEMORY[0x270FA5388](v135);
  v150 = &v127[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v149 = &v127[-v7];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v142 = &v127[-v9];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v141 = &v127[-v11];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v138 = &v127[-v13];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v137 = &v127[-v15];
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v140 = &v127[-v17];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v143 = &v127[-v19];
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v144 = &v127[-v21];
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v145 = &v127[-v23];
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v147 = &v127[-v25];
  MEMORY[0x270FA5388](v24);
  v139 = &v127[-v26];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v28 = *(void *)(*(void *)(v27 - 8) + 64);
  MEMORY[0x270FA5388](v27 - 8);
  unint64_t v29 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v30 = &v127[-v29];
  uint64_t v148 = a1;
  uint64_t v31 = sub_25622F360(a1, (uint64_t)&v127[-v29], &qword_269F53D68);
  MEMORY[0x270FA5388](v31);
  id v32 = &v127[-v29];
  uint64_t v146 = a2;
  sub_25622F360(a2, (uint64_t)&v127[-v29], &qword_269F53D68);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F55BE0);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v132 = v35;
  uint64_t v133 = v34;
  unint64_t v36 = &v127[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v37 = (uint64_t)&v36[*(int *)(v34 + 48)];
  sub_25622F360((uint64_t)&v127[-v29], (uint64_t)v36, &qword_269F53D68);
  sub_25622F360((uint64_t)&v127[-v29], v37, &qword_269F53D68);
  uint64_t v38 = sub_2562E2FD0();
  uint64_t v136 = *(void *)(v38 - 8);
  unint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v136 + 48);
  uint64_t v40 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v39)(v36, 1, v38);
  v134 = v39;
  if (v40 == 1)
  {
    sub_25622F3C4((uint64_t)&v127[-v29], &qword_269F53D68);
    sub_25622F3C4((uint64_t)&v127[-v29], &qword_269F53D68);
    if (v39(v37, 1, v38) == 1)
    {
      sub_25622F3C4((uint64_t)v36, &qword_269F53D68);
      uint64_t v41 = (uint64_t)v139;
      sub_25622AD3C(v148, (uint64_t)v139);
      uint64_t v43 = v146;
      uint64_t v42 = (uint64_t)v147;
      sub_25622AD3C(v146, (uint64_t)v147);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v131 = v127;
  MEMORY[0x270FA5388](v40);
  unint64_t v44 = &v127[-v29];
  sub_25622F360((uint64_t)v36, (uint64_t)&v127[-v29], &qword_269F53D68);
  uint64_t v45 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v39)(v37, 1, v38);
  if (v45 == 1)
  {
    sub_25622F3C4((uint64_t)&v127[-v29], &qword_269F53D68);
    sub_25622F3C4((uint64_t)&v127[-v29], &qword_269F53D68);
    (*(void (**)(unsigned char *, uint64_t))(v136 + 8))(&v127[-v29], v38);
LABEL_6:
    sub_25622F3C4((uint64_t)v36, &qword_269F55BE0);
    uint64_t v46 = v148;
    uint64_t v41 = (uint64_t)v139;
    sub_25622AD3C(v148, (uint64_t)v139);
    uint64_t v43 = v146;
    uint64_t v42 = (uint64_t)v147;
    sub_25622AD3C(v146, (uint64_t)v147);
LABEL_11:
    sub_2562DD858(v42, type metadata accessor for EventMetadata);
    sub_2562DD858(v41, type metadata accessor for EventMetadata);
LABEL_15:
    unint64_t v63 = v143;
    unint64_t v59 = v145;
    sub_25622AD3C(v46, (uint64_t)v145);
    unint64_t v60 = v144;
    sub_25622AD3C(v43, (uint64_t)v144);
LABEL_16:
    sub_2562DD858((uint64_t)v60, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v59, type metadata accessor for EventMetadata);
LABEL_17:
    unint64_t v64 = v140;
    sub_25622AD3C(v46, (uint64_t)v63);
    sub_25622AD3C(v43, (uint64_t)v64);
LABEL_18:
    sub_2562DD858((uint64_t)v64, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v63, type metadata accessor for EventMetadata);
    goto LABEL_19;
  }
  v129 = v127;
  uint64_t v130 = v28;
  uint64_t v47 = v136;
  MEMORY[0x270FA5388](v45);
  unint64_t v49 = &v127[-((v48 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v47 + 32))(v49, v37, v38);
  sub_2562B63C8(&qword_269F55BE8);
  int v128 = sub_2562E3520();
  unint64_t v50 = *(void (**)(unsigned char *, uint64_t))(v47 + 8);
  v50(v49, v38);
  sub_25622F3C4((uint64_t)v32, &qword_269F53D68);
  sub_25622F3C4((uint64_t)v30, &qword_269F53D68);
  v50(v44, v38);
  uint64_t v28 = v130;
  sub_25622F3C4((uint64_t)v36, &qword_269F53D68);
  uint64_t v46 = v148;
  uint64_t v41 = (uint64_t)v139;
  sub_25622AD3C(v148, (uint64_t)v139);
  uint64_t v43 = v146;
  uint64_t v42 = (uint64_t)v147;
  sub_25622AD3C(v146, (uint64_t)v147);
  if ((v128 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  v139 = v127;
  uint64_t v51 = v135[5];
  uint64_t v52 = v42 + v51;
  uint64_t v53 = MEMORY[0x270FA5388](v41 + v51);
  id v55 = &v127[-((v54 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v56 = (uint64_t)&v55[*(int *)(v133 + 48)];
  sub_25622F360(v53, (uint64_t)v55, &qword_269F53D68);
  sub_25622F360(v52, v56, &qword_269F53D68);
  unint64_t v57 = v134;
  uint64_t v58 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v134)(v55, 1, v38);
  if (v58 == 1)
  {
    sub_2562DD858(v42, type metadata accessor for EventMetadata);
    sub_2562DD858(v41, type metadata accessor for EventMetadata);
    if (v57(v56, 1, v38) == 1)
    {
      sub_25622F3C4((uint64_t)v55, &qword_269F53D68);
      unint64_t v59 = v145;
      sub_25622AD3C(v148, (uint64_t)v145);
      unint64_t v60 = v144;
      sub_25622AD3C(v43, (uint64_t)v144);
      goto LABEL_28;
    }
    goto LABEL_14;
  }
  MEMORY[0x270FA5388](v58);
  uint64_t v61 = &v127[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25622F360((uint64_t)v55, (uint64_t)v61, &qword_269F53D68);
  uint64_t v62 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v57)(v56, 1, v38);
  if (v62 == 1)
  {
    sub_2562DD858((uint64_t)v147, type metadata accessor for EventMetadata);
    sub_2562DD858(v41, type metadata accessor for EventMetadata);
    (*(void (**)(unsigned char *, uint64_t))(v136 + 8))(&v127[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)], v38);
LABEL_14:
    sub_25622F3C4((uint64_t)v55, &qword_269F55BE0);
    uint64_t v46 = v148;
    goto LABEL_15;
  }
  uint64_t v130 = v28;
  v131 = v127;
  uint64_t v71 = v136;
  MEMORY[0x270FA5388](v62);
  uint64_t v73 = &v127[-((v72 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v71 + 32))(v73, v56, v38);
  sub_2562B63C8(&qword_269F55BE8);
  LODWORD(v129) = sub_2562E3520();
  uint64_t v74 = v41;
  uint64_t v75 = v71;
  uint64_t v28 = v130;
  char v76 = *(void (**)(unsigned char *, uint64_t))(v75 + 8);
  v76(v73, v38);
  sub_2562DD858((uint64_t)v147, type metadata accessor for EventMetadata);
  sub_2562DD858(v74, type metadata accessor for EventMetadata);
  v76(v61, v38);
  uint64_t v43 = v146;
  sub_25622F3C4((uint64_t)v55, &qword_269F53D68);
  uint64_t v46 = v148;
  unint64_t v59 = v145;
  sub_25622AD3C(v148, (uint64_t)v145);
  unint64_t v60 = v144;
  sub_25622AD3C(v43, (uint64_t)v144);
  unint64_t v63 = v143;
  if ((v129 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_28:
  uint64_t v77 = v135[6];
  uint64_t v78 = &v59[v77];
  uint64_t v79 = (uint64_t)&v60[v77];
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  uint64_t v82 = &v127[-((v81 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v83 = (uint64_t)&v82[*(int *)(v133 + 48)];
  sub_25622F360(v80, (uint64_t)v82, &qword_269F53D68);
  sub_25622F360(v79, v83, &qword_269F53D68);
  uint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v134;
  uint64_t v85 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v134)(v82, 1, v38);
  if (v85 == 1)
  {
    sub_2562DD858((uint64_t)v60, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v145, type metadata accessor for EventMetadata);
    int v86 = v84(v83, 1, v38);
    unint64_t v63 = v143;
    if (v86 == 1)
    {
      sub_25622F3C4((uint64_t)v82, &qword_269F53D68);
      uint64_t v46 = v148;
      sub_25622AD3C(v148, (uint64_t)v63);
      unint64_t v64 = v140;
      sub_25622AD3C(v43, (uint64_t)v140);
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  v147 = v127;
  MEMORY[0x270FA5388](v85);
  uint64_t v87 = &v127[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25622F360((uint64_t)v82, (uint64_t)v87, &qword_269F53D68);
  uint64_t v88 = v84(v83, 1, v38);
  if (v88 == 1)
  {
    sub_2562DD858((uint64_t)v144, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v145, type metadata accessor for EventMetadata);
    (*(void (**)(unsigned char *, uint64_t))(v136 + 8))(&v127[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)], v38);
    uint64_t v43 = v146;
    unint64_t v63 = v143;
LABEL_33:
    sub_25622F3C4((uint64_t)v82, &qword_269F55BE0);
    uint64_t v46 = v148;
    goto LABEL_17;
  }
  uint64_t v89 = v136;
  MEMORY[0x270FA5388](v88);
  uint64_t v91 = &v127[-((v90 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v89 + 32))(v91, v83, v38);
  sub_2562B63C8(&qword_269F55BE8);
  char v92 = sub_2562E3520();
  uint64_t v93 = *(void (**)(unsigned char *, uint64_t))(v89 + 8);
  v93(v91, v38);
  sub_2562DD858((uint64_t)v144, type metadata accessor for EventMetadata);
  sub_2562DD858((uint64_t)v145, type metadata accessor for EventMetadata);
  v93(v87, v38);
  sub_25622F3C4((uint64_t)v82, &qword_269F53D68);
  uint64_t v46 = v148;
  unint64_t v63 = v143;
  sub_25622AD3C(v148, (uint64_t)v143);
  uint64_t v43 = v146;
  unint64_t v64 = v140;
  sub_25622AD3C(v146, (uint64_t)v140);
  if ((v92 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_35:
  uint64_t v94 = v135;
  v95 = &v63[v135[9]];
  uint64_t v96 = *(void *)v95;
  uint64_t v97 = (uint64_t)v63;
  char v98 = v95[8];
  sub_2562DD858(v97, type metadata accessor for EventMetadata);
  v99 = &v64[v94[9]];
  uint64_t v100 = *(void *)v99;
  char v101 = v99[8];
  sub_2562DD858((uint64_t)v64, type metadata accessor for EventMetadata);
  if (v98)
  {
    if (v101)
    {
      unint64_t v65 = v137;
      sub_25622AD3C(v46, (uint64_t)v137);
      uint64_t v66 = v138;
      sub_25622AD3C(v43, (uint64_t)v138);
      goto LABEL_41;
    }
    goto LABEL_19;
  }
  if (v101)
  {
LABEL_19:
    unint64_t v65 = v137;
    sub_25622AD3C(v46, (uint64_t)v137);
    uint64_t v66 = v138;
    sub_25622AD3C(v43, (uint64_t)v138);
LABEL_20:
    sub_2562DD858((uint64_t)v66, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v65, type metadata accessor for EventMetadata);
    goto LABEL_21;
  }
  v102 = v137;
  sub_25622AD3C(v46, (uint64_t)v137);
  uint64_t v66 = v138;
  sub_25622AD3C(v43, (uint64_t)v138);
  BOOL v103 = v96 == v100;
  unint64_t v65 = v102;
  if (!v103) {
    goto LABEL_20;
  }
LABEL_41:
  v104 = v135;
  v105 = &v65[v135[10]];
  uint64_t v106 = *(void *)v105;
  char v107 = v105[8];
  sub_2562DD858((uint64_t)v65, type metadata accessor for EventMetadata);
  v108 = &v66[v104[10]];
  uint64_t v109 = *(void *)v108;
  uint64_t v110 = (uint64_t)v66;
  char v111 = v108[8];
  sub_2562DD858(v110, type metadata accessor for EventMetadata);
  if (v107)
  {
    if (v111)
    {
      unint64_t v67 = v141;
      sub_25622AD3C(v46, (uint64_t)v141);
      uint64_t v68 = v142;
      sub_25622AD3C(v43, (uint64_t)v142);
      goto LABEL_47;
    }
    goto LABEL_21;
  }
  if (v111)
  {
LABEL_21:
    unint64_t v67 = v141;
    sub_25622AD3C(v46, (uint64_t)v141);
    uint64_t v68 = v142;
    sub_25622AD3C(v43, (uint64_t)v142);
LABEL_22:
    sub_2562DD858((uint64_t)v68, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v67, type metadata accessor for EventMetadata);
    goto LABEL_23;
  }
  v112 = v141;
  sub_25622AD3C(v46, (uint64_t)v141);
  uint64_t v68 = v142;
  sub_25622AD3C(v43, (uint64_t)v142);
  BOOL v103 = v106 == v109;
  unint64_t v67 = v112;
  if (!v103) {
    goto LABEL_22;
  }
LABEL_47:
  v113 = v135;
  v114 = &v67[v135[7]];
  uint64_t v115 = *(void *)v114;
  char v116 = v114[8];
  sub_2562DD858((uint64_t)v67, type metadata accessor for EventMetadata);
  v117 = &v68[v113[7]];
  uint64_t v118 = *(void *)v117;
  uint64_t v119 = (uint64_t)v68;
  char v120 = v117[8];
  sub_2562DD858(v119, type metadata accessor for EventMetadata);
  if ((v116 & 1) == 0)
  {
    if ((v120 & 1) == 0)
    {
      sub_25622AD3C(v46, (uint64_t)v149);
      sub_25622AD3C(v43, (uint64_t)v150);
      if (v115 == v118) {
        goto LABEL_52;
      }
LABEL_24:
      sub_2562DD858((uint64_t)v150, type metadata accessor for EventMetadata);
      sub_2562DD858((uint64_t)v149, type metadata accessor for EventMetadata);
      goto LABEL_25;
    }
LABEL_23:
    sub_25622AD3C(v46, (uint64_t)v149);
    sub_25622AD3C(v43, (uint64_t)v150);
    goto LABEL_24;
  }
  if ((v120 & 1) == 0) {
    goto LABEL_23;
  }
  sub_25622AD3C(v46, (uint64_t)v149);
  sub_25622AD3C(v43, (uint64_t)v150);
LABEL_52:
  uint64_t v121 = v135[8];
  v122 = *(void **)&v149[v121];
  v123 = *(void **)&v150[v121];
  if (v122)
  {
    if (v123)
    {
      sub_256231B4C(0, (unint64_t *)&qword_269F54528);
      id v124 = v123;
      id v125 = v122;
      char v69 = sub_2562E3870();
      sub_2562DD858((uint64_t)v150, type metadata accessor for EventMetadata);
      sub_2562DD858((uint64_t)v149, type metadata accessor for EventMetadata);

      return v69 & 1;
    }
    id v126 = v122;
    sub_2562DD858((uint64_t)v150, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v149, type metadata accessor for EventMetadata);
  }
  else
  {
    id v126 = v123;
    sub_2562DD858((uint64_t)v150, type metadata accessor for EventMetadata);
    sub_2562DD858((uint64_t)v149, type metadata accessor for EventMetadata);
    if (!v123)
    {
      char v69 = 1;
      return v69 & 1;
    }
  }

LABEL_25:
  char v69 = 0;
  return v69 & 1;
}

id _s16MetricsFramework13EventMetadataV07toBiomeC021deviceSegmentsCohortsSo020BMSiriOnDeviceDigesthicD0CAA0lhI0VSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F556A8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v117 = (char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  char v116 = (char *)&v104 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v118 = (char *)&v104 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v114 = (uint64_t)&v104 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v104 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v104 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v104 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v107 = (uint64_t)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v115 = (char *)&v104 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v106 = (uint64_t)&v104 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v105 = (uint64_t)&v104 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v113 = (uint64_t)&v104 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  id v32 = (char *)&v104 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v104 - v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v36 = *(void *)(*(void *)(v35 - 8) + 64);
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v119 = a1;
  sub_25622F360(a1, (uint64_t)v18, &qword_269F556A8);
  uint64_t v37 = type metadata accessor for DeviceSegmentsCohorts(0);
  uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 48);
  if (v38(v18, 1, v37) == 1)
  {
    unint64_t v39 = &qword_269F556A8;
    uint64_t v40 = v18;
LABEL_7:
    uint64_t v44 = sub_25622F3C4((uint64_t)v40, v39);
    uint64_t v110 = 0;
    uint64_t v111 = 0;
    goto LABEL_8;
  }
  sub_25622F360((uint64_t)v18, (uint64_t)v34, &qword_269F54398);
  sub_2562DD858((uint64_t)v18, type metadata accessor for DeviceSegmentsCohorts);
  uint64_t v41 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v34, 1, v41) == 1)
  {
    unint64_t v39 = &qword_269F54398;
    uint64_t v40 = v34;
    goto LABEL_7;
  }
  sub_25622F360((uint64_t)v34, (uint64_t)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v34, type metadata accessor for EventMetadata);
  uint64_t v42 = sub_2562E2FD0();
  uint64_t v43 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))((char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v42) == 1)
  {
    unint64_t v39 = &qword_269F53D68;
    uint64_t v40 = (char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_7;
  }
  uint64_t v60 = sub_2562E2FA0();
  uint64_t v110 = v61;
  uint64_t v111 = v60;
  uint64_t v44 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))((char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v42);
LABEL_8:
  MEMORY[0x270FA5388](v44);
  sub_25622F360(v119, (uint64_t)v16, &qword_269F556A8);
  if (v38(v16, 1, v37) == 1)
  {
    uint64_t v45 = &qword_269F556A8;
    uint64_t v46 = v16;
LABEL_14:
    uint64_t v50 = sub_25622F3C4((uint64_t)v46, v45);
    uint64_t v108 = 0;
    uint64_t v109 = 0;
    goto LABEL_15;
  }
  sub_25622F360((uint64_t)v16, (uint64_t)v32, &qword_269F54398);
  sub_2562DD858((uint64_t)v16, type metadata accessor for DeviceSegmentsCohorts);
  uint64_t v47 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 48))(v32, 1, v47) == 1)
  {
    uint64_t v45 = &qword_269F54398;
    uint64_t v46 = v32;
    goto LABEL_14;
  }
  sub_25622F360((uint64_t)&v32[*(int *)(v47 + 20)], (uint64_t)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v32, type metadata accessor for EventMetadata);
  uint64_t v48 = sub_2562E2FD0();
  uint64_t v49 = *(void *)(v48 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))((char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v48) == 1)
  {
    uint64_t v45 = &qword_269F53D68;
    uint64_t v46 = (char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_14;
  }
  uint64_t v62 = sub_2562E2FA0();
  uint64_t v108 = v63;
  uint64_t v109 = v62;
  uint64_t v50 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))((char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v48);
LABEL_15:
  uint64_t v51 = (uint64_t)v118;
  uint64_t v52 = v119;
  uint64_t v53 = v113;
  MEMORY[0x270FA5388](v50);
  uint64_t v54 = (char *)&v104 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25622F360(v52, (uint64_t)v13, &qword_269F556A8);
  if (v38(v13, 1, v37) == 1)
  {
    sub_25622F3C4((uint64_t)v13, &qword_269F556A8);
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    uint64_t v55 = (uint64_t)v117;
  }
  else
  {
    sub_25622F360((uint64_t)v13, v53, &qword_269F54398);
    sub_2562DD858((uint64_t)v13, type metadata accessor for DeviceSegmentsCohorts);
    uint64_t v56 = type metadata accessor for EventMetadata(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 48))(v53, 1, v56) == 1)
    {
      sub_25622F3C4(v53, &qword_269F54398);
      uint64_t v112 = 0;
      uint64_t v113 = 0;
      uint64_t v55 = (uint64_t)v117;
    }
    else
    {
      sub_25622F360(v53 + *(int *)(v56 + 24), (uint64_t)v54, &qword_269F53D68);
      sub_2562DD858(v53, type metadata accessor for EventMetadata);
      uint64_t v57 = sub_2562E2FD0();
      uint64_t v58 = *(void *)(v57 - 8);
      int v59 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48))(v54, 1, v57);
      uint64_t v55 = (uint64_t)v117;
      if (v59 == 1)
      {
        sub_25622F3C4((uint64_t)v54, &qword_269F53D68);
        uint64_t v112 = 0;
        uint64_t v113 = 0;
      }
      else
      {
        uint64_t v112 = sub_2562E2FA0();
        uint64_t v113 = v64;
        (*(void (**)(char *, uint64_t))(v58 + 8))(v54, v57);
      }
      uint64_t v52 = v119;
    }
    uint64_t v51 = (uint64_t)v118;
  }
  uint64_t v65 = v114;
  sub_25622F360(v52, v114, &qword_269F556A8);
  if (v38((char *)v65, 1, v37) == 1)
  {
    uint64_t v66 = &qword_269F556A8;
    uint64_t v67 = v65;
LABEL_30:
    sub_25622F3C4(v67, v66);
    uint64_t v119 = 0;
    char v70 = 1;
    goto LABEL_32;
  }
  uint64_t v68 = v105;
  sub_25622F360(v65, v105, &qword_269F54398);
  sub_2562DD858(v65, type metadata accessor for DeviceSegmentsCohorts);
  uint64_t v69 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 48))(v68, 1, v69) == 1)
  {
    uint64_t v66 = &qword_269F54398;
    uint64_t v67 = v68;
    goto LABEL_30;
  }
  uint64_t v71 = v68 + *(int *)(v69 + 36);
  uint64_t v119 = *(void *)v71;
  char v70 = *(unsigned char *)(v71 + 8);
  sub_2562DD858(v68, type metadata accessor for EventMetadata);
LABEL_32:
  uint64_t v73 = (uint64_t)v115;
  uint64_t v72 = (uint64_t)v116;
  sub_25622F360(v52, v51, &qword_269F556A8);
  if (v38((char *)v51, 1, v37) == 1)
  {
    uint64_t v74 = &qword_269F556A8;
LABEL_36:
    sub_25622F3C4(v51, v74);
    char v78 = 1;
    goto LABEL_38;
  }
  uint64_t v75 = v106;
  sub_25622F360(v51, v106, &qword_269F54398);
  uint64_t v76 = v51;
  uint64_t v51 = v75;
  sub_2562DD858(v76, type metadata accessor for DeviceSegmentsCohorts);
  uint64_t v77 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 48))(v51, 1, v77) == 1)
  {
    uint64_t v74 = &qword_269F54398;
    goto LABEL_36;
  }
  uint64_t v79 = v51;
  char v78 = *(unsigned char *)(v51 + *(int *)(v77 + 40) + 8);
  sub_2562DD858(v79, type metadata accessor for EventMetadata);
LABEL_38:
  sub_25622F360(v52, v72, &qword_269F556A8);
  if (v38((char *)v72, 1, v37) == 1)
  {
    uint64_t v80 = &qword_269F556A8;
    uint64_t v81 = v72;
LABEL_42:
    sub_25622F3C4(v81, v80);
    char v83 = 1;
    goto LABEL_44;
  }
  sub_25622F360(v72, v73, &qword_269F54398);
  sub_2562DD858(v72, type metadata accessor for DeviceSegmentsCohorts);
  uint64_t v82 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 48))(v73, 1, v82) == 1)
  {
    uint64_t v80 = &qword_269F54398;
    uint64_t v81 = v73;
    goto LABEL_42;
  }
  uint64_t v84 = v73;
  char v83 = *(unsigned char *)(v73 + *(int *)(v82 + 28) + 8);
  sub_2562DD858(v84, type metadata accessor for EventMetadata);
LABEL_44:
  sub_25622F360(v52, v55, &qword_269F556A8);
  if (v38((char *)v55, 1, v37) == 1)
  {
    uint64_t v85 = &qword_269F556A8;
    uint64_t v86 = v55;
  }
  else
  {
    uint64_t v87 = v107;
    sub_25622F360(v55, v107, &qword_269F54398);
    sub_2562DD858(v55, type metadata accessor for DeviceSegmentsCohorts);
    uint64_t v88 = type metadata accessor for EventMetadata(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 48))(v87, 1, v88) != 1)
    {
      BOOL v103 = *(void **)(v87 + *(int *)(v88 + 32));
      id v91 = v103;
      sub_2562DD858(v87, type metadata accessor for EventMetadata);
      uint64_t v92 = v112;
      if (v103)
      {
        objc_msgSend(v91, sel_startTimestampInSecondsSince1970);
        objc_msgSend(v91, sel_numberOfSeconds);
        uint64_t v90 = (void *)sub_2562E3DB0();
        uint64_t v89 = (void *)sub_2562E3DA0();
      }
      else
      {
        uint64_t v89 = 0;
        uint64_t v90 = 0;
        id v91 = 0;
      }
      goto LABEL_49;
    }
    uint64_t v85 = &qword_269F54398;
    uint64_t v86 = v87;
  }
  sub_25622F3C4(v86, v85);
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  id v91 = 0;
  uint64_t v92 = v112;
LABEL_49:
  id v93 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A458]), sel_initWithStartTimestampInSecondsSince1970_numberOfSeconds_, v90, v89);

  if (v83) {
    uint64_t v94 = 0;
  }
  else {
    uint64_t v94 = (void *)sub_2562E3DB0();
  }
  uint64_t v96 = v109;
  uint64_t v95 = v110;
  uint64_t v97 = v108;
  if ((v70 & 1) == 0)
  {
    char v98 = (void *)sub_2562E3DB0();
    if ((v78 & 1) == 0) {
      goto LABEL_54;
    }
LABEL_56:
    v99 = 0;
    goto LABEL_57;
  }
  char v98 = 0;
  if (v78) {
    goto LABEL_56;
  }
LABEL_54:
  v99 = (void *)sub_2562E3DB0();
LABEL_57:
  uint64_t v100 = v111;
  id v101 = objc_allocWithZone(MEMORY[0x263F2A450]);
  return sub_2562D0B78(v100, v95, v96, v97, v92, v113, v94, v93, v98, v99);
}

id _sSo17SISchemaISOLocaleC16MetricsFrameworkE10fromStringyABSgSSFZ_0(uint64_t a1, uint64_t a2)
{
  sub_25624F610();
  uint64_t v2 = (void *)sub_2562E3910();
  uint64_t v3 = v2;
  uint64_t v4 = v2[2];
  if (v4 == 2)
  {
    sub_2562E35C0();
    uint64_t v10 = (void *)sub_2562E3550();
    swift_bridgeObjectRelease();
    id v7 = v10;
    if (objc_msgSend(v7, "isEqualToString:", @"ISOLANGUAGECODE_UNKNOWN", 95, 0xE100000000000000, a1, a2))
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"AB"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"AA"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"AF"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"AK"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"SQ"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"AM"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"AR"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"AN"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"HY"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"AS"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"AV"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"AE"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"AY"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"AZ"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"BM"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"BA"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"EU"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"BE"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"BN"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"BI"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"BS"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"BR"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"BG"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"MY"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"CA"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"CH"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"CE"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"NY"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"ZH"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"CV"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"KW"])
    {
      uint64_t v8 = 31;
    }
    else if ([v7 isEqualToString:@"CO"])
    {
      uint64_t v8 = 32;
    }
    else if ([v7 isEqualToString:@"CR"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"HR"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"CS"])
    {
      uint64_t v8 = 35;
    }
    else if ([v7 isEqualToString:@"DA"])
    {
      uint64_t v8 = 36;
    }
    else if ([v7 isEqualToString:@"DV"])
    {
      uint64_t v8 = 37;
    }
    else if ([v7 isEqualToString:@"NL"])
    {
      uint64_t v8 = 38;
    }
    else if ([v7 isEqualToString:@"DZ"])
    {
      uint64_t v8 = 39;
    }
    else if ([v7 isEqualToString:@"EN"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"EO"])
    {
      uint64_t v8 = 41;
    }
    else if ([v7 isEqualToString:@"ET"])
    {
      uint64_t v8 = 42;
    }
    else if ([v7 isEqualToString:@"EE"])
    {
      uint64_t v8 = 43;
    }
    else if ([v7 isEqualToString:@"FO"])
    {
      uint64_t v8 = 44;
    }
    else if ([v7 isEqualToString:@"FJ"])
    {
      uint64_t v8 = 45;
    }
    else if ([v7 isEqualToString:@"FI"])
    {
      uint64_t v8 = 46;
    }
    else if ([v7 isEqualToString:@"FR"])
    {
      uint64_t v8 = 47;
    }
    else if ([v7 isEqualToString:@"FF"])
    {
      uint64_t v8 = 48;
    }
    else if ([v7 isEqualToString:@"GL"])
    {
      uint64_t v8 = 49;
    }
    else if ([v7 isEqualToString:@"KA"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"DE"])
    {
      uint64_t v8 = 51;
    }
    else if ([v7 isEqualToString:@"EL"])
    {
      uint64_t v8 = 52;
    }
    else if ([v7 isEqualToString:@"GN"])
    {
      uint64_t v8 = 53;
    }
    else if ([v7 isEqualToString:@"GU"])
    {
      uint64_t v8 = 54;
    }
    else if ([v7 isEqualToString:@"HT"])
    {
      uint64_t v8 = 55;
    }
    else if ([v7 isEqualToString:@"HA"])
    {
      uint64_t v8 = 56;
    }
    else if ([v7 isEqualToString:@"HE"])
    {
      uint64_t v8 = 57;
    }
    else if ([v7 isEqualToString:@"HZ"])
    {
      uint64_t v8 = 58;
    }
    else if ([v7 isEqualToString:@"HI"])
    {
      uint64_t v8 = 59;
    }
    else if ([v7 isEqualToString:@"HO"])
    {
      uint64_t v8 = 60;
    }
    else if ([v7 isEqualToString:@"HU"])
    {
      uint64_t v8 = 61;
    }
    else if ([v7 isEqualToString:@"IA"])
    {
      uint64_t v8 = 62;
    }
    else if ([v7 isEqualToString:@"ID"])
    {
      uint64_t v8 = 63;
    }
    else if ([v7 isEqualToString:@"IE"])
    {
      uint64_t v8 = 64;
    }
    else if ([v7 isEqualToString:@"GA"])
    {
      uint64_t v8 = 65;
    }
    else if ([v7 isEqualToString:@"IG"])
    {
      uint64_t v8 = 66;
    }
    else if ([v7 isEqualToString:@"IK"])
    {
      uint64_t v8 = 67;
    }
    else if ([v7 isEqualToString:@"IO"])
    {
      uint64_t v8 = 68;
    }
    else if ([v7 isEqualToString:@"IS"])
    {
      uint64_t v8 = 69;
    }
    else if ([v7 isEqualToString:@"IT"])
    {
      uint64_t v8 = 70;
    }
    else if ([v7 isEqualToString:@"IU"])
    {
      uint64_t v8 = 71;
    }
    else if ([v7 isEqualToString:@"JA"])
    {
      uint64_t v8 = 72;
    }
    else if ([v7 isEqualToString:@"JV"])
    {
      uint64_t v8 = 73;
    }
    else if ([v7 isEqualToString:@"KL"])
    {
      uint64_t v8 = 74;
    }
    else if ([v7 isEqualToString:@"KN"])
    {
      uint64_t v8 = 75;
    }
    else if ([v7 isEqualToString:@"KR"])
    {
      uint64_t v8 = 76;
    }
    else if ([v7 isEqualToString:@"KS"])
    {
      uint64_t v8 = 77;
    }
    else if ([v7 isEqualToString:@"KK"])
    {
      uint64_t v8 = 78;
    }
    else if ([v7 isEqualToString:@"KM"])
    {
      uint64_t v8 = 79;
    }
    else if ([v7 isEqualToString:@"KI"])
    {
      uint64_t v8 = 80;
    }
    else if ([v7 isEqualToString:@"RW"])
    {
      uint64_t v8 = 81;
    }
    else if ([v7 isEqualToString:@"KY"])
    {
      uint64_t v8 = 82;
    }
    else if ([v7 isEqualToString:@"KV"])
    {
      uint64_t v8 = 83;
    }
    else if ([v7 isEqualToString:@"KG"])
    {
      uint64_t v8 = 84;
    }
    else if ([v7 isEqualToString:@"KO"])
    {
      uint64_t v8 = 85;
    }
    else if ([v7 isEqualToString:@"KU"])
    {
      uint64_t v8 = 86;
    }
    else if ([v7 isEqualToString:@"KJ"])
    {
      uint64_t v8 = 87;
    }
    else if ([v7 isEqualToString:@"LA"])
    {
      uint64_t v8 = 88;
    }
    else if ([v7 isEqualToString:@"LB"])
    {
      uint64_t v8 = 89;
    }
    else if ([v7 isEqualToString:@"LG"])
    {
      uint64_t v8 = 90;
    }
    else if ([v7 isEqualToString:@"LI"])
    {
      uint64_t v8 = 91;
    }
    else if ([v7 isEqualToString:@"LN"])
    {
      uint64_t v8 = 92;
    }
    else if ([v7 isEqualToString:@"LO"])
    {
      uint64_t v8 = 93;
    }
    else if ([v7 isEqualToString:@"LT"])
    {
      uint64_t v8 = 94;
    }
    else if ([v7 isEqualToString:@"LU"])
    {
      uint64_t v8 = 95;
    }
    else if ([v7 isEqualToString:@"LV"])
    {
      uint64_t v8 = 96;
    }
    else if ([v7 isEqualToString:@"GV"])
    {
      uint64_t v8 = 97;
    }
    else if ([v7 isEqualToString:@"MK"])
    {
      uint64_t v8 = 98;
    }
    else if ([v7 isEqualToString:@"MG"])
    {
      uint64_t v8 = 99;
    }
    else if ([v7 isEqualToString:@"MS"])
    {
      uint64_t v8 = 100;
    }
    else if ([v7 isEqualToString:@"ML"])
    {
      uint64_t v8 = 101;
    }
    else if ([v7 isEqualToString:@"MT"])
    {
      uint64_t v8 = 102;
    }
    else if ([v7 isEqualToString:@"MI"])
    {
      uint64_t v8 = 103;
    }
    else if ([v7 isEqualToString:@"MR"])
    {
      uint64_t v8 = 104;
    }
    else if ([v7 isEqualToString:@"MH"])
    {
      uint64_t v8 = 105;
    }
    else if ([v7 isEqualToString:@"MN"])
    {
      uint64_t v8 = 106;
    }
    else if ([v7 isEqualToString:@"NA"])
    {
      uint64_t v8 = 107;
    }
    else if ([v7 isEqualToString:@"NV"])
    {
      uint64_t v8 = 108;
    }
    else if ([v7 isEqualToString:@"ND"])
    {
      uint64_t v8 = 109;
    }
    else if ([v7 isEqualToString:@"NE"])
    {
      uint64_t v8 = 110;
    }
    else if ([v7 isEqualToString:@"NG"])
    {
      uint64_t v8 = 111;
    }
    else if ([v7 isEqualToString:@"NB"])
    {
      uint64_t v8 = 112;
    }
    else if ([v7 isEqualToString:@"NN"])
    {
      uint64_t v8 = 113;
    }
    else if ([v7 isEqualToString:@"NO"])
    {
      uint64_t v8 = 114;
    }
    else if ([v7 isEqualToString:@"II"])
    {
      uint64_t v8 = 115;
    }
    else if ([v7 isEqualToString:@"NR"])
    {
      uint64_t v8 = 116;
    }
    else if ([v7 isEqualToString:@"OC"])
    {
      uint64_t v8 = 117;
    }
    else if ([v7 isEqualToString:@"OJ"])
    {
      uint64_t v8 = 118;
    }
    else if ([v7 isEqualToString:@"CU"])
    {
      uint64_t v8 = 119;
    }
    else if ([v7 isEqualToString:@"OM"])
    {
      uint64_t v8 = 120;
    }
    else if ([v7 isEqualToString:@"OR"])
    {
      uint64_t v8 = 121;
    }
    else if ([v7 isEqualToString:@"OS"])
    {
      uint64_t v8 = 122;
    }
    else if ([v7 isEqualToString:@"PA"])
    {
      uint64_t v8 = 123;
    }
    else if ([v7 isEqualToString:@"PI"])
    {
      uint64_t v8 = 124;
    }
    else if ([v7 isEqualToString:@"FA"])
    {
      uint64_t v8 = 125;
    }
    else if ([v7 isEqualToString:@"PL"])
    {
      uint64_t v8 = 126;
    }
    else if ([v7 isEqualToString:@"PS"])
    {
      uint64_t v8 = 127;
    }
    else if ([v7 isEqualToString:@"PT"])
    {
      uint64_t v8 = 128;
    }
    else if ([v7 isEqualToString:@"QU"])
    {
      uint64_t v8 = 129;
    }
    else if ([v7 isEqualToString:@"RM"])
    {
      uint64_t v8 = 130;
    }
    else if ([v7 isEqualToString:@"RN"])
    {
      uint64_t v8 = 131;
    }
    else if ([v7 isEqualToString:@"RO"])
    {
      uint64_t v8 = 132;
    }
    else if ([v7 isEqualToString:@"RU"])
    {
      uint64_t v8 = 133;
    }
    else if ([v7 isEqualToString:@"SA"])
    {
      uint64_t v8 = 134;
    }
    else if ([v7 isEqualToString:@"SC"])
    {
      uint64_t v8 = 135;
    }
    else if ([v7 isEqualToString:@"SD"])
    {
      uint64_t v8 = 136;
    }
    else if ([v7 isEqualToString:@"SE"])
    {
      uint64_t v8 = 137;
    }
    else if ([v7 isEqualToString:@"SM"])
    {
      uint64_t v8 = 138;
    }
    else if ([v7 isEqualToString:@"SG"])
    {
      uint64_t v8 = 139;
    }
    else if ([v7 isEqualToString:@"SR"])
    {
      uint64_t v8 = 140;
    }
    else if ([v7 isEqualToString:@"GD"])
    {
      uint64_t v8 = 141;
    }
    else if ([v7 isEqualToString:@"SN"])
    {
      uint64_t v8 = 142;
    }
    else if ([v7 isEqualToString:@"SI"])
    {
      uint64_t v8 = 143;
    }
    else if ([v7 isEqualToString:@"SK"])
    {
      uint64_t v8 = 144;
    }
    else if ([v7 isEqualToString:@"SL"])
    {
      uint64_t v8 = 145;
    }
    else if ([v7 isEqualToString:@"SO"])
    {
      uint64_t v8 = 146;
    }
    else if ([v7 isEqualToString:@"ST"])
    {
      uint64_t v8 = 147;
    }
    else if ([v7 isEqualToString:@"ES"])
    {
      uint64_t v8 = 148;
    }
    else if ([v7 isEqualToString:@"SU"])
    {
      uint64_t v8 = 149;
    }
    else if ([v7 isEqualToString:@"SW"])
    {
      uint64_t v8 = 150;
    }
    else if ([v7 isEqualToString:@"SS"])
    {
      uint64_t v8 = 151;
    }
    else if ([v7 isEqualToString:@"SV"])
    {
      uint64_t v8 = 152;
    }
    else if ([v7 isEqualToString:@"TA"])
    {
      uint64_t v8 = 153;
    }
    else if ([v7 isEqualToString:@"TE"])
    {
      uint64_t v8 = 154;
    }
    else if ([v7 isEqualToString:@"TG"])
    {
      uint64_t v8 = 155;
    }
    else if ([v7 isEqualToString:@"TH"])
    {
      uint64_t v8 = 156;
    }
    else if ([v7 isEqualToString:@"TI"])
    {
      uint64_t v8 = 157;
    }
    else if ([v7 isEqualToString:@"BO"])
    {
      uint64_t v8 = 158;
    }
    else if ([v7 isEqualToString:@"TK"])
    {
      uint64_t v8 = 159;
    }
    else if ([v7 isEqualToString:@"TL"])
    {
      uint64_t v8 = 160;
    }
    else if ([v7 isEqualToString:@"TN"])
    {
      uint64_t v8 = 161;
    }
    else if ([v7 isEqualToString:@"TO"])
    {
      uint64_t v8 = 162;
    }
    else if ([v7 isEqualToString:@"TR"])
    {
      uint64_t v8 = 163;
    }
    else if ([v7 isEqualToString:@"TS"])
    {
      uint64_t v8 = 164;
    }
    else if ([v7 isEqualToString:@"TT"])
    {
      uint64_t v8 = 165;
    }
    else if ([v7 isEqualToString:@"TW"])
    {
      uint64_t v8 = 166;
    }
    else if ([v7 isEqualToString:@"TY"])
    {
      uint64_t v8 = 167;
    }
    else if ([v7 isEqualToString:@"UG"])
    {
      uint64_t v8 = 168;
    }
    else if ([v7 isEqualToString:@"UK"])
    {
      uint64_t v8 = 169;
    }
    else if ([v7 isEqualToString:@"UR"])
    {
      uint64_t v8 = 170;
    }
    else if ([v7 isEqualToString:@"UZ"])
    {
      uint64_t v8 = 171;
    }
    else if ([v7 isEqualToString:@"VE"])
    {
      uint64_t v8 = 172;
    }
    else if ([v7 isEqualToString:@"VI"])
    {
      uint64_t v8 = 173;
    }
    else if ([v7 isEqualToString:@"VO"])
    {
      uint64_t v8 = 174;
    }
    else if ([v7 isEqualToString:@"WA"])
    {
      uint64_t v8 = 175;
    }
    else if ([v7 isEqualToString:@"CY"])
    {
      uint64_t v8 = 176;
    }
    else if ([v7 isEqualToString:@"WO"])
    {
      uint64_t v8 = 177;
    }
    else if ([v7 isEqualToString:@"FY"])
    {
      uint64_t v8 = 178;
    }
    else if ([v7 isEqualToString:@"XH"])
    {
      uint64_t v8 = 179;
    }
    else if ([v7 isEqualToString:@"YI"])
    {
      uint64_t v8 = 180;
    }
    else if ([v7 isEqualToString:@"YO"])
    {
      uint64_t v8 = 181;
    }
    else if ([v7 isEqualToString:@"ZA"])
    {
      uint64_t v8 = 182;
    }
    else if ([v7 isEqualToString:@"ZU"])
    {
      uint64_t v8 = 183;
    }
    else if ([v7 isEqualToString:@"WUU"])
    {
      uint64_t v8 = 184;
    }
    else if ([v7 isEqualToString:@"YUE"])
    {
      uint64_t v8 = 185;
    }
    else
    {
      uint64_t v8 = 0;
    }

    uint64_t v12 = self;
    if (v3[2] >= 2uLL)
    {
      uint64_t v13 = (void *)v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2562E35C0();
      swift_bridgeObjectRelease();
      uint64_t v3 = (void *)sub_2562E3550();
LABEL_1131:
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v13, sel_convertCountryCodeToSchemaCountryCode_, v3);
LABEL_1137:

      goto LABEL_1138;
    }
    __break(1u);
    goto LABEL_1126;
  }
  if (v4 == 3)
  {
    BOOL v5 = v2[4] == 0x454C41434F4CLL && v2[5] == 0xE600000000000000;
    if (v5 || (sub_2562E3C90() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = (void *)sub_2562E3550();
      swift_bridgeObjectRelease();
      id v7 = v6;
      if (objc_msgSend(v7, "isEqualToString:", @"ISOLANGUAGECODE_UNKNOWN", 95, 0xE100000000000000, a1, a2))
      {
        uint64_t v8 = 0;
LABEL_1129:

        uint64_t v14 = self;
        if (v3[2] >= 3uLL)
        {
          uint64_t v13 = (void *)v14;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v3 = (void *)sub_2562E3550();
          goto LABEL_1131;
        }
        __break(1u);
        goto LABEL_1133;
      }
      if ([v7 isEqualToString:@"AB"])
      {
        uint64_t v8 = 1;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AA"])
      {
        uint64_t v8 = 2;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AF"])
      {
        uint64_t v8 = 3;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AK"])
      {
        uint64_t v8 = 4;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SQ"])
      {
        uint64_t v8 = 5;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AM"])
      {
        uint64_t v8 = 6;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AR"])
      {
        uint64_t v8 = 7;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AN"])
      {
        uint64_t v8 = 8;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HY"])
      {
        uint64_t v8 = 9;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AS"])
      {
        uint64_t v8 = 10;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AV"])
      {
        uint64_t v8 = 11;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AE"])
      {
        uint64_t v8 = 12;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AY"])
      {
        uint64_t v8 = 13;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"AZ"])
      {
        uint64_t v8 = 14;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BM"])
      {
        uint64_t v8 = 15;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BA"])
      {
        uint64_t v8 = 16;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"EU"])
      {
        uint64_t v8 = 17;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BE"])
      {
        uint64_t v8 = 18;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BN"])
      {
        uint64_t v8 = 19;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BI"])
      {
        uint64_t v8 = 20;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BS"])
      {
        uint64_t v8 = 21;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BR"])
      {
        uint64_t v8 = 22;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BG"])
      {
        uint64_t v8 = 23;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MY"])
      {
        uint64_t v8 = 24;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CA"])
      {
        uint64_t v8 = 25;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CH"])
      {
        uint64_t v8 = 26;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CE"])
      {
        uint64_t v8 = 27;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NY"])
      {
        uint64_t v8 = 28;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ZH"])
      {
        uint64_t v8 = 29;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CV"])
      {
        uint64_t v8 = 30;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KW"])
      {
        uint64_t v8 = 31;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CO"])
      {
        uint64_t v8 = 32;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CR"])
      {
        uint64_t v8 = 33;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HR"])
      {
        uint64_t v8 = 34;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CS"])
      {
        uint64_t v8 = 35;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"DA"])
      {
        uint64_t v8 = 36;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"DV"])
      {
        uint64_t v8 = 37;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NL"])
      {
        uint64_t v8 = 38;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"DZ"])
      {
        uint64_t v8 = 39;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"EN"])
      {
        uint64_t v8 = 40;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"EO"])
      {
        uint64_t v8 = 41;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ET"])
      {
        uint64_t v8 = 42;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"EE"])
      {
        uint64_t v8 = 43;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FO"])
      {
        uint64_t v8 = 44;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FJ"])
      {
        uint64_t v8 = 45;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FI"])
      {
        uint64_t v8 = 46;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FR"])
      {
        uint64_t v8 = 47;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FF"])
      {
        uint64_t v8 = 48;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GL"])
      {
        uint64_t v8 = 49;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KA"])
      {
        uint64_t v8 = 50;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"DE"])
      {
        uint64_t v8 = 51;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"EL"])
      {
        uint64_t v8 = 52;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GN"])
      {
        uint64_t v8 = 53;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GU"])
      {
        uint64_t v8 = 54;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HT"])
      {
        uint64_t v8 = 55;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HA"])
      {
        uint64_t v8 = 56;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HE"])
      {
        uint64_t v8 = 57;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HZ"])
      {
        uint64_t v8 = 58;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HI"])
      {
        uint64_t v8 = 59;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HO"])
      {
        uint64_t v8 = 60;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"HU"])
      {
        uint64_t v8 = 61;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IA"])
      {
        uint64_t v8 = 62;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ID"])
      {
        uint64_t v8 = 63;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IE"])
      {
        uint64_t v8 = 64;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GA"])
      {
        uint64_t v8 = 65;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IG"])
      {
        uint64_t v8 = 66;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IK"])
      {
        uint64_t v8 = 67;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IO"])
      {
        uint64_t v8 = 68;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IS"])
      {
        uint64_t v8 = 69;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IT"])
      {
        uint64_t v8 = 70;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"IU"])
      {
        uint64_t v8 = 71;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"JA"])
      {
        uint64_t v8 = 72;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"JV"])
      {
        uint64_t v8 = 73;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KL"])
      {
        uint64_t v8 = 74;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KN"])
      {
        uint64_t v8 = 75;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KR"])
      {
        uint64_t v8 = 76;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KS"])
      {
        uint64_t v8 = 77;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KK"])
      {
        uint64_t v8 = 78;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KM"])
      {
        uint64_t v8 = 79;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KI"])
      {
        uint64_t v8 = 80;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"RW"])
      {
        uint64_t v8 = 81;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KY"])
      {
        uint64_t v8 = 82;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KV"])
      {
        uint64_t v8 = 83;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KG"])
      {
        uint64_t v8 = 84;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KO"])
      {
        uint64_t v8 = 85;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KU"])
      {
        uint64_t v8 = 86;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"KJ"])
      {
        uint64_t v8 = 87;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LA"])
      {
        uint64_t v8 = 88;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LB"])
      {
        uint64_t v8 = 89;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LG"])
      {
        uint64_t v8 = 90;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LI"])
      {
        uint64_t v8 = 91;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LN"])
      {
        uint64_t v8 = 92;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LO"])
      {
        uint64_t v8 = 93;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LT"])
      {
        uint64_t v8 = 94;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LU"])
      {
        uint64_t v8 = 95;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"LV"])
      {
        uint64_t v8 = 96;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GV"])
      {
        uint64_t v8 = 97;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MK"])
      {
        uint64_t v8 = 98;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MG"])
      {
        uint64_t v8 = 99;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MS"])
      {
        uint64_t v8 = 100;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ML"])
      {
        uint64_t v8 = 101;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MT"])
      {
        uint64_t v8 = 102;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MI"])
      {
        uint64_t v8 = 103;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MR"])
      {
        uint64_t v8 = 104;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MH"])
      {
        uint64_t v8 = 105;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"MN"])
      {
        uint64_t v8 = 106;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NA"])
      {
        uint64_t v8 = 107;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NV"])
      {
        uint64_t v8 = 108;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ND"])
      {
        uint64_t v8 = 109;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NE"])
      {
        uint64_t v8 = 110;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NG"])
      {
        uint64_t v8 = 111;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NB"])
      {
        uint64_t v8 = 112;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NN"])
      {
        uint64_t v8 = 113;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NO"])
      {
        uint64_t v8 = 114;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"II"])
      {
        uint64_t v8 = 115;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"NR"])
      {
        uint64_t v8 = 116;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"OC"])
      {
        uint64_t v8 = 117;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"OJ"])
      {
        uint64_t v8 = 118;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CU"])
      {
        uint64_t v8 = 119;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"OM"])
      {
        uint64_t v8 = 120;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"OR"])
      {
        uint64_t v8 = 121;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"OS"])
      {
        uint64_t v8 = 122;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"PA"])
      {
        uint64_t v8 = 123;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"PI"])
      {
        uint64_t v8 = 124;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FA"])
      {
        uint64_t v8 = 125;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"PL"])
      {
        uint64_t v8 = 126;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"PS"])
      {
        uint64_t v8 = 127;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"PT"])
      {
        uint64_t v8 = 128;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"QU"])
      {
        uint64_t v8 = 129;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"RM"])
      {
        uint64_t v8 = 130;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"RN"])
      {
        uint64_t v8 = 131;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"RO"])
      {
        uint64_t v8 = 132;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"RU"])
      {
        uint64_t v8 = 133;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SA"])
      {
        uint64_t v8 = 134;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SC"])
      {
        uint64_t v8 = 135;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SD"])
      {
        uint64_t v8 = 136;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SE"])
      {
        uint64_t v8 = 137;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SM"])
      {
        uint64_t v8 = 138;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SG"])
      {
        uint64_t v8 = 139;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SR"])
      {
        uint64_t v8 = 140;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"GD"])
      {
        uint64_t v8 = 141;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SN"])
      {
        uint64_t v8 = 142;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SI"])
      {
        uint64_t v8 = 143;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SK"])
      {
        uint64_t v8 = 144;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SL"])
      {
        uint64_t v8 = 145;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SO"])
      {
        uint64_t v8 = 146;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ST"])
      {
        uint64_t v8 = 147;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ES"])
      {
        uint64_t v8 = 148;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SU"])
      {
        uint64_t v8 = 149;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SW"])
      {
        uint64_t v8 = 150;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SS"])
      {
        uint64_t v8 = 151;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"SV"])
      {
        uint64_t v8 = 152;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TA"])
      {
        uint64_t v8 = 153;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TE"])
      {
        uint64_t v8 = 154;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TG"])
      {
        uint64_t v8 = 155;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TH"])
      {
        uint64_t v8 = 156;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TI"])
      {
        uint64_t v8 = 157;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"BO"])
      {
        uint64_t v8 = 158;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TK"])
      {
        uint64_t v8 = 159;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TL"])
      {
        uint64_t v8 = 160;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TN"])
      {
        uint64_t v8 = 161;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TO"])
      {
        uint64_t v8 = 162;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TR"])
      {
        uint64_t v8 = 163;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TS"])
      {
        uint64_t v8 = 164;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TT"])
      {
        uint64_t v8 = 165;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TW"])
      {
        uint64_t v8 = 166;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"TY"])
      {
        uint64_t v8 = 167;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"UG"])
      {
        uint64_t v8 = 168;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"UK"])
      {
        uint64_t v8 = 169;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"UR"])
      {
        uint64_t v8 = 170;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"UZ"])
      {
        uint64_t v8 = 171;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"VE"])
      {
        uint64_t v8 = 172;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"VI"])
      {
        uint64_t v8 = 173;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"VO"])
      {
        uint64_t v8 = 174;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"WA"])
      {
        uint64_t v8 = 175;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"CY"])
      {
        uint64_t v8 = 176;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"WO"])
      {
        uint64_t v8 = 177;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"FY"])
      {
        uint64_t v8 = 178;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"XH"])
      {
        uint64_t v8 = 179;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"YI"])
      {
        uint64_t v8 = 180;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"YO"])
      {
        uint64_t v8 = 181;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ZA"])
      {
        uint64_t v8 = 182;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"ZU"])
      {
        uint64_t v8 = 183;
        goto LABEL_1129;
      }
      if ([v7 isEqualToString:@"WUU"])
      {
        uint64_t v8 = 184;
        goto LABEL_1129;
      }
LABEL_1126:
      if ([v7 isEqualToString:@"YUE"]) {
        uint64_t v8 = 185;
      }
      else {
        uint64_t v8 = 0;
      }
      goto LABEL_1129;
    }
  }
  swift_bridgeObjectRelease();
  if (sub_2562E3610() == 2)
  {
    sub_2562E35C0();
    uint64_t v9 = (void *)sub_2562E3550();
    swift_bridgeObjectRelease();
    uint64_t v3 = v9;
    if (objc_msgSend(v3, "isEqualToString:", @"ISOLANGUAGECODE_UNKNOWN", 95, 0xE100000000000000, a1, a2))
    {
      uint64_t v8 = 0;
    }
    else if ([v3 isEqualToString:@"AB"])
    {
      uint64_t v8 = 1;
    }
    else if ([v3 isEqualToString:@"AA"])
    {
      uint64_t v8 = 2;
    }
    else if ([v3 isEqualToString:@"AF"])
    {
      uint64_t v8 = 3;
    }
    else if ([v3 isEqualToString:@"AK"])
    {
      uint64_t v8 = 4;
    }
    else if ([v3 isEqualToString:@"SQ"])
    {
      uint64_t v8 = 5;
    }
    else if ([v3 isEqualToString:@"AM"])
    {
      uint64_t v8 = 6;
    }
    else if ([v3 isEqualToString:@"AR"])
    {
      uint64_t v8 = 7;
    }
    else if ([v3 isEqualToString:@"AN"])
    {
      uint64_t v8 = 8;
    }
    else if ([v3 isEqualToString:@"HY"])
    {
      uint64_t v8 = 9;
    }
    else if ([v3 isEqualToString:@"AS"])
    {
      uint64_t v8 = 10;
    }
    else if ([v3 isEqualToString:@"AV"])
    {
      uint64_t v8 = 11;
    }
    else if ([v3 isEqualToString:@"AE"])
    {
      uint64_t v8 = 12;
    }
    else if ([v3 isEqualToString:@"AY"])
    {
      uint64_t v8 = 13;
    }
    else if ([v3 isEqualToString:@"AZ"])
    {
      uint64_t v8 = 14;
    }
    else if ([v3 isEqualToString:@"BM"])
    {
      uint64_t v8 = 15;
    }
    else if ([v3 isEqualToString:@"BA"])
    {
      uint64_t v8 = 16;
    }
    else if ([v3 isEqualToString:@"EU"])
    {
      uint64_t v8 = 17;
    }
    else if ([v3 isEqualToString:@"BE"])
    {
      uint64_t v8 = 18;
    }
    else if ([v3 isEqualToString:@"BN"])
    {
      uint64_t v8 = 19;
    }
    else if ([v3 isEqualToString:@"BI"])
    {
      uint64_t v8 = 20;
    }
    else if ([v3 isEqualToString:@"BS"])
    {
      uint64_t v8 = 21;
    }
    else if ([v3 isEqualToString:@"BR"])
    {
      uint64_t v8 = 22;
    }
    else if ([v3 isEqualToString:@"BG"])
    {
      uint64_t v8 = 23;
    }
    else if ([v3 isEqualToString:@"MY"])
    {
      uint64_t v8 = 24;
    }
    else if ([v3 isEqualToString:@"CA"])
    {
      uint64_t v8 = 25;
    }
    else if ([v3 isEqualToString:@"CH"])
    {
      uint64_t v8 = 26;
    }
    else if ([v3 isEqualToString:@"CE"])
    {
      uint64_t v8 = 27;
    }
    else if ([v3 isEqualToString:@"NY"])
    {
      uint64_t v8 = 28;
    }
    else if ([v3 isEqualToString:@"ZH"])
    {
      uint64_t v8 = 29;
    }
    else if ([v3 isEqualToString:@"CV"])
    {
      uint64_t v8 = 30;
    }
    else if ([v3 isEqualToString:@"KW"])
    {
      uint64_t v8 = 31;
    }
    else if ([v3 isEqualToString:@"CO"])
    {
      uint64_t v8 = 32;
    }
    else if ([v3 isEqualToString:@"CR"])
    {
      uint64_t v8 = 33;
    }
    else if ([v3 isEqualToString:@"HR"])
    {
      uint64_t v8 = 34;
    }
    else if ([v3 isEqualToString:@"CS"])
    {
      uint64_t v8 = 35;
    }
    else if ([v3 isEqualToString:@"DA"])
    {
      uint64_t v8 = 36;
    }
    else if ([v3 isEqualToString:@"DV"])
    {
      uint64_t v8 = 37;
    }
    else if ([v3 isEqualToString:@"NL"])
    {
      uint64_t v8 = 38;
    }
    else if ([v3 isEqualToString:@"DZ"])
    {
      uint64_t v8 = 39;
    }
    else if ([v3 isEqualToString:@"EN"])
    {
      uint64_t v8 = 40;
    }
    else if ([v3 isEqualToString:@"EO"])
    {
      uint64_t v8 = 41;
    }
    else if ([v3 isEqualToString:@"ET"])
    {
      uint64_t v8 = 42;
    }
    else if ([v3 isEqualToString:@"EE"])
    {
      uint64_t v8 = 43;
    }
    else if ([v3 isEqualToString:@"FO"])
    {
      uint64_t v8 = 44;
    }
    else if ([v3 isEqualToString:@"FJ"])
    {
      uint64_t v8 = 45;
    }
    else if ([v3 isEqualToString:@"FI"])
    {
      uint64_t v8 = 46;
    }
    else if ([v3 isEqualToString:@"FR"])
    {
      uint64_t v8 = 47;
    }
    else if ([v3 isEqualToString:@"FF"])
    {
      uint64_t v8 = 48;
    }
    else if ([v3 isEqualToString:@"GL"])
    {
      uint64_t v8 = 49;
    }
    else if ([v3 isEqualToString:@"KA"])
    {
      uint64_t v8 = 50;
    }
    else if ([v3 isEqualToString:@"DE"])
    {
      uint64_t v8 = 51;
    }
    else if ([v3 isEqualToString:@"EL"])
    {
      uint64_t v8 = 52;
    }
    else if ([v3 isEqualToString:@"GN"])
    {
      uint64_t v8 = 53;
    }
    else if ([v3 isEqualToString:@"GU"])
    {
      uint64_t v8 = 54;
    }
    else if ([v3 isEqualToString:@"HT"])
    {
      uint64_t v8 = 55;
    }
    else if ([v3 isEqualToString:@"HA"])
    {
      uint64_t v8 = 56;
    }
    else if ([v3 isEqualToString:@"HE"])
    {
      uint64_t v8 = 57;
    }
    else if ([v3 isEqualToString:@"HZ"])
    {
      uint64_t v8 = 58;
    }
    else if ([v3 isEqualToString:@"HI"])
    {
      uint64_t v8 = 59;
    }
    else if ([v3 isEqualToString:@"HO"])
    {
      uint64_t v8 = 60;
    }
    else if ([v3 isEqualToString:@"HU"])
    {
      uint64_t v8 = 61;
    }
    else if ([v3 isEqualToString:@"IA"])
    {
      uint64_t v8 = 62;
    }
    else if ([v3 isEqualToString:@"ID"])
    {
      uint64_t v8 = 63;
    }
    else if ([v3 isEqualToString:@"IE"])
    {
      uint64_t v8 = 64;
    }
    else if ([v3 isEqualToString:@"GA"])
    {
      uint64_t v8 = 65;
    }
    else if ([v3 isEqualToString:@"IG"])
    {
      uint64_t v8 = 66;
    }
    else if ([v3 isEqualToString:@"IK"])
    {
      uint64_t v8 = 67;
    }
    else if ([v3 isEqualToString:@"IO"])
    {
      uint64_t v8 = 68;
    }
    else if ([v3 isEqualToString:@"IS"])
    {
      uint64_t v8 = 69;
    }
    else if ([v3 isEqualToString:@"IT"])
    {
      uint64_t v8 = 70;
    }
    else if ([v3 isEqualToString:@"IU"])
    {
      uint64_t v8 = 71;
    }
    else if ([v3 isEqualToString:@"JA"])
    {
      uint64_t v8 = 72;
    }
    else if ([v3 isEqualToString:@"JV"])
    {
      uint64_t v8 = 73;
    }
    else if ([v3 isEqualToString:@"KL"])
    {
      uint64_t v8 = 74;
    }
    else if ([v3 isEqualToString:@"KN"])
    {
      uint64_t v8 = 75;
    }
    else if ([v3 isEqualToString:@"KR"])
    {
      uint64_t v8 = 76;
    }
    else if ([v3 isEqualToString:@"KS"])
    {
      uint64_t v8 = 77;
    }
    else if ([v3 isEqualToString:@"KK"])
    {
      uint64_t v8 = 78;
    }
    else if ([v3 isEqualToString:@"KM"])
    {
      uint64_t v8 = 79;
    }
    else if ([v3 isEqualToString:@"KI"])
    {
      uint64_t v8 = 80;
    }
    else if ([v3 isEqualToString:@"RW"])
    {
      uint64_t v8 = 81;
    }
    else if ([v3 isEqualToString:@"KY"])
    {
      uint64_t v8 = 82;
    }
    else if ([v3 isEqualToString:@"KV"])
    {
      uint64_t v8 = 83;
    }
    else if ([v3 isEqualToString:@"KG"])
    {
      uint64_t v8 = 84;
    }
    else if ([v3 isEqualToString:@"KO"])
    {
      uint64_t v8 = 85;
    }
    else if ([v3 isEqualToString:@"KU"])
    {
      uint64_t v8 = 86;
    }
    else if ([v3 isEqualToString:@"KJ"])
    {
      uint64_t v8 = 87;
    }
    else if ([v3 isEqualToString:@"LA"])
    {
      uint64_t v8 = 88;
    }
    else if ([v3 isEqualToString:@"LB"])
    {
      uint64_t v8 = 89;
    }
    else if ([v3 isEqualToString:@"LG"])
    {
      uint64_t v8 = 90;
    }
    else if ([v3 isEqualToString:@"LI"])
    {
      uint64_t v8 = 91;
    }
    else if ([v3 isEqualToString:@"LN"])
    {
      uint64_t v8 = 92;
    }
    else if ([v3 isEqualToString:@"LO"])
    {
      uint64_t v8 = 93;
    }
    else if ([v3 isEqualToString:@"LT"])
    {
      uint64_t v8 = 94;
    }
    else if ([v3 isEqualToString:@"LU"])
    {
      uint64_t v8 = 95;
    }
    else if ([v3 isEqualToString:@"LV"])
    {
      uint64_t v8 = 96;
    }
    else if ([v3 isEqualToString:@"GV"])
    {
      uint64_t v8 = 97;
    }
    else if ([v3 isEqualToString:@"MK"])
    {
      uint64_t v8 = 98;
    }
    else if ([v3 isEqualToString:@"MG"])
    {
      uint64_t v8 = 99;
    }
    else if ([v3 isEqualToString:@"MS"])
    {
      uint64_t v8 = 100;
    }
    else if ([v3 isEqualToString:@"ML"])
    {
      uint64_t v8 = 101;
    }
    else if ([v3 isEqualToString:@"MT"])
    {
      uint64_t v8 = 102;
    }
    else if ([v3 isEqualToString:@"MI"])
    {
      uint64_t v8 = 103;
    }
    else if ([v3 isEqualToString:@"MR"])
    {
      uint64_t v8 = 104;
    }
    else if ([v3 isEqualToString:@"MH"])
    {
      uint64_t v8 = 105;
    }
    else if ([v3 isEqualToString:@"MN"])
    {
      uint64_t v8 = 106;
    }
    else if ([v3 isEqualToString:@"NA"])
    {
      uint64_t v8 = 107;
    }
    else if ([v3 isEqualToString:@"NV"])
    {
      uint64_t v8 = 108;
    }
    else if ([v3 isEqualToString:@"ND"])
    {
      uint64_t v8 = 109;
    }
    else if ([v3 isEqualToString:@"NE"])
    {
      uint64_t v8 = 110;
    }
    else if ([v3 isEqualToString:@"NG"])
    {
      uint64_t v8 = 111;
    }
    else if ([v3 isEqualToString:@"NB"])
    {
      uint64_t v8 = 112;
    }
    else if ([v3 isEqualToString:@"NN"])
    {
      uint64_t v8 = 113;
    }
    else if ([v3 isEqualToString:@"NO"])
    {
      uint64_t v8 = 114;
    }
    else if ([v3 isEqualToString:@"II"])
    {
      uint64_t v8 = 115;
    }
    else if ([v3 isEqualToString:@"NR"])
    {
      uint64_t v8 = 116;
    }
    else if ([v3 isEqualToString:@"OC"])
    {
      uint64_t v8 = 117;
    }
    else if ([v3 isEqualToString:@"OJ"])
    {
      uint64_t v8 = 118;
    }
    else if ([v3 isEqualToString:@"CU"])
    {
      uint64_t v8 = 119;
    }
    else if ([v3 isEqualToString:@"OM"])
    {
      uint64_t v8 = 120;
    }
    else if ([v3 isEqualToString:@"OR"])
    {
      uint64_t v8 = 121;
    }
    else if ([v3 isEqualToString:@"OS"])
    {
      uint64_t v8 = 122;
    }
    else if ([v3 isEqualToString:@"PA"])
    {
      uint64_t v8 = 123;
    }
    else if ([v3 isEqualToString:@"PI"])
    {
      uint64_t v8 = 124;
    }
    else if ([v3 isEqualToString:@"FA"])
    {
      uint64_t v8 = 125;
    }
    else if ([v3 isEqualToString:@"PL"])
    {
      uint64_t v8 = 126;
    }
    else if ([v3 isEqualToString:@"PS"])
    {
      uint64_t v8 = 127;
    }
    else if ([v3 isEqualToString:@"PT"])
    {
      uint64_t v8 = 128;
    }
    else if ([v3 isEqualToString:@"QU"])
    {
      uint64_t v8 = 129;
    }
    else if ([v3 isEqualToString:@"RM"])
    {
      uint64_t v8 = 130;
    }
    else if ([v3 isEqualToString:@"RN"])
    {
      uint64_t v8 = 131;
    }
    else if ([v3 isEqualToString:@"RO"])
    {
      uint64_t v8 = 132;
    }
    else if ([v3 isEqualToString:@"RU"])
    {
      uint64_t v8 = 133;
    }
    else if ([v3 isEqualToString:@"SA"])
    {
      uint64_t v8 = 134;
    }
    else if ([v3 isEqualToString:@"SC"])
    {
      uint64_t v8 = 135;
    }
    else if ([v3 isEqualToString:@"SD"])
    {
      uint64_t v8 = 136;
    }
    else if ([v3 isEqualToString:@"SE"])
    {
      uint64_t v8 = 137;
    }
    else if ([v3 isEqualToString:@"SM"])
    {
      uint64_t v8 = 138;
    }
    else if ([v3 isEqualToString:@"SG"])
    {
      uint64_t v8 = 139;
    }
    else if ([v3 isEqualToString:@"SR"])
    {
      uint64_t v8 = 140;
    }
    else if ([v3 isEqualToString:@"GD"])
    {
      uint64_t v8 = 141;
    }
    else if ([v3 isEqualToString:@"SN"])
    {
      uint64_t v8 = 142;
    }
    else if ([v3 isEqualToString:@"SI"])
    {
      uint64_t v8 = 143;
    }
    else if ([v3 isEqualToString:@"SK"])
    {
      uint64_t v8 = 144;
    }
    else if ([v3 isEqualToString:@"SL"])
    {
      uint64_t v8 = 145;
    }
    else if ([v3 isEqualToString:@"SO"])
    {
      uint64_t v8 = 146;
    }
    else if ([v3 isEqualToString:@"ST"])
    {
      uint64_t v8 = 147;
    }
    else if ([v3 isEqualToString:@"ES"])
    {
      uint64_t v8 = 148;
    }
    else if ([v3 isEqualToString:@"SU"])
    {
      uint64_t v8 = 149;
    }
    else if ([v3 isEqualToString:@"SW"])
    {
      uint64_t v8 = 150;
    }
    else if ([v3 isEqualToString:@"SS"])
    {
      uint64_t v8 = 151;
    }
    else if ([v3 isEqualToString:@"SV"])
    {
      uint64_t v8 = 152;
    }
    else if ([v3 isEqualToString:@"TA"])
    {
      uint64_t v8 = 153;
    }
    else if ([v3 isEqualToString:@"TE"])
    {
      uint64_t v8 = 154;
    }
    else if ([v3 isEqualToString:@"TG"])
    {
      uint64_t v8 = 155;
    }
    else if ([v3 isEqualToString:@"TH"])
    {
      uint64_t v8 = 156;
    }
    else if ([v3 isEqualToString:@"TI"])
    {
      uint64_t v8 = 157;
    }
    else if ([v3 isEqualToString:@"BO"])
    {
      uint64_t v8 = 158;
    }
    else if ([v3 isEqualToString:@"TK"])
    {
      uint64_t v8 = 159;
    }
    else if ([v3 isEqualToString:@"TL"])
    {
      uint64_t v8 = 160;
    }
    else if ([v3 isEqualToString:@"TN"])
    {
      uint64_t v8 = 161;
    }
    else if ([v3 isEqualToString:@"TO"])
    {
      uint64_t v8 = 162;
    }
    else if ([v3 isEqualToString:@"TR"])
    {
      uint64_t v8 = 163;
    }
    else if ([v3 isEqualToString:@"TS"])
    {
      uint64_t v8 = 164;
    }
    else if ([v3 isEqualToString:@"TT"])
    {
      uint64_t v8 = 165;
    }
    else if ([v3 isEqualToString:@"TW"])
    {
      uint64_t v8 = 166;
    }
    else if ([v3 isEqualToString:@"TY"])
    {
      uint64_t v8 = 167;
    }
    else if ([v3 isEqualToString:@"UG"])
    {
      uint64_t v8 = 168;
    }
    else if ([v3 isEqualToString:@"UK"])
    {
      uint64_t v8 = 169;
    }
    else if ([v3 isEqualToString:@"UR"])
    {
      uint64_t v8 = 170;
    }
    else if ([v3 isEqualToString:@"UZ"])
    {
      uint64_t v8 = 171;
    }
    else if ([v3 isEqualToString:@"VE"])
    {
      uint64_t v8 = 172;
    }
    else if ([v3 isEqualToString:@"VI"])
    {
      uint64_t v8 = 173;
    }
    else if ([v3 isEqualToString:@"VO"])
    {
      uint64_t v8 = 174;
    }
    else if ([v3 isEqualToString:@"WA"])
    {
      uint64_t v8 = 175;
    }
    else if ([v3 isEqualToString:@"CY"])
    {
      uint64_t v8 = 176;
    }
    else if ([v3 isEqualToString:@"WO"])
    {
      uint64_t v8 = 177;
    }
    else if ([v3 isEqualToString:@"FY"])
    {
      uint64_t v8 = 178;
    }
    else if ([v3 isEqualToString:@"XH"])
    {
      uint64_t v8 = 179;
    }
    else if ([v3 isEqualToString:@"YI"])
    {
      uint64_t v8 = 180;
    }
    else if ([v3 isEqualToString:@"YO"])
    {
      uint64_t v8 = 181;
    }
    else if ([v3 isEqualToString:@"ZA"])
    {
      uint64_t v8 = 182;
    }
    else if ([v3 isEqualToString:@"ZU"])
    {
      uint64_t v8 = 183;
    }
    else
    {
      if (([v3 isEqualToString:@"WUU"] & 1) == 0)
      {
LABEL_1133:
        if ([v3 isEqualToString:@"YUE"]) {
          uint64_t v8 = 185;
        }
        else {
          uint64_t v8 = 0;
        }
        goto LABEL_1136;
      }
      uint64_t v8 = 184;
    }
LABEL_1136:

    id v11 = 0;
    goto LABEL_1137;
  }
  id v11 = 0;
  uint64_t v8 = 0;
LABEL_1138:
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED60]), sel_init);
  objc_msgSend(v15, sel_setLanguageCode_, v8);
  objc_msgSend(v15, sel_setCountryCode_, v11);
  return v15;
}

id _sSo17SISchemaISOLocaleC16MetricsFrameworkE22toExperimentBiomeEvent16experimentDigestSo014BMSiriOnDevicejfcB0CAC0fJ0VSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54F80);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  BOOL v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v18 - v6;
  sub_25622F360(a1, (uint64_t)&v18 - v6, &qword_269F54F80);
  uint64_t v8 = type metadata accessor for ExperimentDigest(0);
  uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
  if (v9(v7, 1, v8) == 1)
  {
    sub_25622F3C4((uint64_t)v7, &qword_269F54F80);
  }
  else
  {
    uint64_t v10 = (void *)*((void *)v7 + 12);
    id v11 = v10;
    sub_2562DD858((uint64_t)v7, type metadata accessor for ExperimentDigest);
    if (v10)
    {
      objc_msgSend(v11, sel_languageCode);

      uint64_t v12 = (void *)sub_2562E3D30();
      goto LABEL_6;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  sub_25622F360(a1, (uint64_t)v5, &qword_269F54F80);
  if (v9(v5, 1, v8) == 1)
  {
    sub_25622F3C4((uint64_t)v5, &qword_269F54F80);
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  uint64_t v13 = (void *)*((void *)v5 + 12);
  id v14 = v13;
  sub_2562DD858((uint64_t)v5, type metadata accessor for ExperimentDigest);
  if (!v13) {
    goto LABEL_10;
  }
  objc_msgSend(v14, sel_countryCode);

  id v15 = (void *)sub_2562E3D30();
LABEL_11:
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A430]), sel_initWithLanguageCode_countryCode_, v12, v15);

  return v16;
}

id _s16MetricsFramework13EventMetadataV07toBiomeC0016deviceExperimentA0So020BMSiriOnDeviceDigesthacD0CAA0khA0VSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53F60);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v130 = (uint64_t)&v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v129 = (char *)&v116 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  int v128 = (char *)&v116 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v127 = (char *)&v116 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v126 = (uint64_t)&v116 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v116 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v116 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v116 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v121 = (uint64_t)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v120 = (uint64_t)&v116 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v119 = (uint64_t)&v116 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v118 = (uint64_t)&v116 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v117 = (uint64_t)&v116 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v116 = (uint64_t)&v116 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v116 - v35;
  MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v116 - v37;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v40 = *(void *)(*(void *)(v39 - 8) + 64);
  MEMORY[0x270FA5388](v39 - 8);
  uint64_t v131 = a1;
  sub_25622F360(a1, (uint64_t)v20, &qword_269F53F60);
  uint64_t v41 = type metadata accessor for DeviceExperimentMetrics(0);
  uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48);
  if (v42(v20, 1, v41) == 1)
  {
    uint64_t v43 = &qword_269F53F60;
    uint64_t v44 = v20;
LABEL_7:
    uint64_t v48 = sub_25622F3C4((uint64_t)v44, v43);
    uint64_t v123 = 0;
    uint64_t v125 = 0;
    goto LABEL_8;
  }
  sub_25622F360((uint64_t)v20, (uint64_t)v38, &qword_269F54398);
  sub_2562DD858((uint64_t)v20, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v45 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 48))(v38, 1, v45) == 1)
  {
    uint64_t v43 = &qword_269F54398;
    uint64_t v44 = v38;
    goto LABEL_7;
  }
  sub_25622F360((uint64_t)v38, (uint64_t)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v38, type metadata accessor for EventMetadata);
  uint64_t v46 = sub_2562E2FD0();
  uint64_t v47 = *(void *)(v46 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))((char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v46) == 1)
  {
    uint64_t v43 = &qword_269F53D68;
    uint64_t v44 = (char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_7;
  }
  uint64_t v123 = sub_2562E2FA0();
  uint64_t v125 = v65;
  uint64_t v48 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))((char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), v46);
LABEL_8:
  MEMORY[0x270FA5388](v48);
  sub_25622F360(v131, (uint64_t)v18, &qword_269F53F60);
  if (v42(v18, 1, v41) == 1)
  {
    uint64_t v49 = &qword_269F53F60;
    uint64_t v50 = v18;
LABEL_14:
    uint64_t v54 = sub_25622F3C4((uint64_t)v50, v49);
    uint64_t v122 = 0;
    uint64_t v124 = 0;
    goto LABEL_15;
  }
  sub_25622F360((uint64_t)v18, (uint64_t)v36, &qword_269F54398);
  sub_2562DD858((uint64_t)v18, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v51 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v36, 1, v51) == 1)
  {
    uint64_t v49 = &qword_269F54398;
    uint64_t v50 = v36;
    goto LABEL_14;
  }
  sub_25622F360((uint64_t)&v36[*(int *)(v51 + 20)], (uint64_t)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v36, type metadata accessor for EventMetadata);
  uint64_t v52 = sub_2562E2FD0();
  uint64_t v53 = *(void *)(v52 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))((char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v52) == 1)
  {
    uint64_t v49 = &qword_269F53D68;
    uint64_t v50 = (char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_14;
  }
  uint64_t v122 = sub_2562E2FA0();
  uint64_t v124 = v66;
  uint64_t v54 = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))((char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0), v52);
LABEL_15:
  uint64_t v55 = v131;
  uint64_t v56 = (uint64_t)v127;
  MEMORY[0x270FA5388](v54);
  uint64_t v57 = (char *)&v116 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25622F360(v55, (uint64_t)v15, &qword_269F53F60);
  if (v42(v15, 1, v41) == 1)
  {
    uint64_t v58 = &qword_269F53F60;
    uint64_t v59 = (uint64_t)v15;
LABEL_19:
    sub_25622F3C4(v59, v58);
    uint64_t v62 = 0;
    v127 = 0;
    goto LABEL_26;
  }
  uint64_t v60 = v116;
  sub_25622F360((uint64_t)v15, v116, &qword_269F54398);
  sub_2562DD858((uint64_t)v15, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v61 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 48))(v60, 1, v61) == 1)
  {
    uint64_t v58 = &qword_269F54398;
    uint64_t v59 = v60;
    goto LABEL_19;
  }
  sub_25622F360(v60 + *(int *)(v61 + 24), (uint64_t)v57, &qword_269F53D68);
  sub_2562DD858(v60, type metadata accessor for EventMetadata);
  uint64_t v63 = sub_2562E2FD0();
  uint64_t v64 = *(void *)(v63 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v57, 1, v63) == 1)
  {
    sub_25622F3C4((uint64_t)v57, &qword_269F53D68);
    uint64_t v62 = 0;
    v127 = 0;
  }
  else
  {
    uint64_t v62 = sub_2562E2FA0();
    v127 = v67;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v57, v63);
  }
  uint64_t v55 = v131;
LABEL_26:
  uint64_t v68 = (uint64_t)v128;
  uint64_t v69 = v126;
  sub_25622F360(v55, v126, &qword_269F53F60);
  if (v42((char *)v69, 1, v41) == 1)
  {
    char v70 = &qword_269F53F60;
    uint64_t v71 = v69;
LABEL_30:
    sub_25622F3C4(v71, v70);
    int v128 = 0;
    char v74 = 1;
    goto LABEL_32;
  }
  uint64_t v72 = v117;
  sub_25622F360(v69, v117, &qword_269F54398);
  sub_2562DD858(v69, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v73 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 48))(v72, 1, v73) == 1)
  {
    char v70 = &qword_269F54398;
    uint64_t v71 = v72;
    goto LABEL_30;
  }
  uint64_t v75 = (char **)(v72 + *(int *)(v73 + 28));
  int v128 = *v75;
  char v74 = *((unsigned char *)v75 + 8);
  sub_2562DD858(v72, type metadata accessor for EventMetadata);
LABEL_32:
  sub_25622F360(v55, v56, &qword_269F53F60);
  if (v42((char *)v56, 1, v41) == 1)
  {
    uint64_t v76 = &qword_269F53F60;
LABEL_36:
    sub_25622F3C4(v56, v76);
LABEL_37:
    char v80 = 1;
    goto LABEL_38;
  }
  uint64_t v77 = v118;
  sub_25622F360(v56, v118, &qword_269F54398);
  uint64_t v78 = v56;
  uint64_t v56 = v77;
  sub_2562DD858(v78, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v79 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 48))(v56, 1, v79) == 1)
  {
    uint64_t v76 = &qword_269F54398;
    goto LABEL_36;
  }
  uint64_t v89 = *(void **)(v56 + *(int *)(v79 + 32));
  id v90 = v89;
  sub_2562DD858(v56, type metadata accessor for EventMetadata);
  if (!v89) {
    goto LABEL_37;
  }
  objc_msgSend(v90, sel_startTimestampInSecondsSince1970);

  char v80 = 0;
LABEL_38:
  sub_25622F360(v55, v68, &qword_269F53F60);
  if (v42((char *)v68, 1, v41) == 1)
  {
    uint64_t v81 = &qword_269F53F60;
    uint64_t v82 = v68;
LABEL_42:
    sub_25622F3C4(v82, v81);
    goto LABEL_43;
  }
  uint64_t v83 = v119;
  sub_25622F360(v68, v119, &qword_269F54398);
  sub_2562DD858(v68, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v84 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 48))(v83, 1, v84) == 1)
  {
    uint64_t v81 = &qword_269F54398;
    uint64_t v82 = v83;
    goto LABEL_42;
  }
  id v91 = *(void **)(v83 + *(int *)(v84 + 32));
  id v92 = v91;
  sub_2562DD858(v83, type metadata accessor for EventMetadata);
  if (!v91)
  {
LABEL_43:
    char v85 = 1;
    if (v80) {
      goto LABEL_44;
    }
LABEL_50:
    uint64_t v86 = (void *)sub_2562E3DB0();
    uint64_t v87 = (uint64_t)v129;
    if ((v85 & 1) == 0) {
      goto LABEL_45;
    }
    goto LABEL_51;
  }
  objc_msgSend(v92, sel_numberOfSeconds);

  char v85 = 0;
  if ((v80 & 1) == 0) {
    goto LABEL_50;
  }
LABEL_44:
  uint64_t v86 = 0;
  uint64_t v87 = (uint64_t)v129;
  if ((v85 & 1) == 0)
  {
LABEL_45:
    uint64_t v88 = (void *)sub_2562E3DA0();
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v88 = 0;
LABEL_52:
  uint64_t v93 = v131;
  id v94 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A418]), sel_initWithStartTimestampInSecondsSince1970_numberOfSeconds_, v86, v88);

  sub_25622F360(v93, v87, &qword_269F53F60);
  if (v42((char *)v87, 1, v41) == 1)
  {
    uint64_t v95 = &qword_269F53F60;
    uint64_t v96 = v87;
LABEL_56:
    sub_25622F3C4(v96, v95);
    char v99 = 1;
    goto LABEL_58;
  }
  uint64_t v97 = v120;
  sub_25622F360(v87, v120, &qword_269F54398);
  sub_2562DD858(v87, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v98 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 48))(v97, 1, v98) == 1)
  {
    uint64_t v95 = &qword_269F54398;
    uint64_t v96 = v97;
    goto LABEL_56;
  }
  char v99 = *(unsigned char *)(v97 + *(int *)(v98 + 36) + 8);
  sub_2562DD858(v97, type metadata accessor for EventMetadata);
LABEL_58:
  uint64_t v100 = v130;
  sub_25622F360(v93, v130, &qword_269F53F60);
  if (v42((char *)v100, 1, v41) == 1)
  {
    id v101 = &qword_269F53F60;
    uint64_t v102 = v100;
    goto LABEL_62;
  }
  uint64_t v103 = v121;
  sub_25622F360(v100, v121, &qword_269F54398);
  sub_2562DD858(v100, type metadata accessor for DeviceExperimentMetrics);
  uint64_t v104 = type metadata accessor for EventMetadata(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 48))(v103, 1, v104) == 1)
  {
    id v101 = &qword_269F54398;
    uint64_t v102 = v103;
LABEL_62:
    sub_25622F3C4(v102, v101);
    char v105 = 1;
    uint64_t v107 = v124;
    uint64_t v106 = v125;
    if (v74) {
      goto LABEL_63;
    }
    goto LABEL_67;
  }
  char v105 = *(unsigned char *)(v103 + *(int *)(v104 + 40) + 8);
  sub_2562DD858(v103, type metadata accessor for EventMetadata);
  uint64_t v107 = v124;
  uint64_t v106 = v125;
  if (v74)
  {
LABEL_63:
    uint64_t v108 = 0;
    uint64_t v109 = v122;
    if ((v99 & 1) == 0) {
      goto LABEL_64;
    }
LABEL_68:
    uint64_t v110 = 0;
    uint64_t v111 = (uint64_t)v127;
    if ((v105 & 1) == 0) {
      goto LABEL_65;
    }
LABEL_69:
    uint64_t v112 = 0;
    goto LABEL_70;
  }
LABEL_67:
  uint64_t v108 = (void *)sub_2562E3DB0();
  uint64_t v109 = v122;
  if (v99) {
    goto LABEL_68;
  }
LABEL_64:
  uint64_t v110 = (void *)sub_2562E3DB0();
  uint64_t v111 = (uint64_t)v127;
  if (v105) {
    goto LABEL_69;
  }
LABEL_65:
  uint64_t v112 = (void *)sub_2562E3DB0();
LABEL_70:
  uint64_t v113 = v123;
  id v114 = objc_allocWithZone(MEMORY[0x263F2A410]);
  return sub_2562D0B78(v113, v106, v109, v107, v62, v111, v108, v94, v110, v112);
}

id _sSo28ODDSiriSchemaODDTimeIntervalC16MetricsFrameworkE12toBiomeEvent13eventMetadataSo025BMSiriOnDeviceDigestUsageeik4TimeD0CAC0iK0VSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v20 - v6;
  sub_25622F360(a1, (uint64_t)&v20 - v6, &qword_269F54398);
  uint64_t v8 = type metadata accessor for EventMetadata(0);
  uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
  if (v9(v7, 1, v8) == 1)
  {
    sub_25622F3C4((uint64_t)v7, &qword_269F54398);
  }
  else
  {
    uint64_t v10 = *(void **)&v7[*(int *)(v8 + 32)];
    id v11 = v10;
    sub_2562DD858((uint64_t)v7, type metadata accessor for EventMetadata);
    if (v10)
    {
      objc_msgSend(v11, sel_startTimestampInSecondsSince1970);

      char v12 = 0;
      goto LABEL_6;
    }
  }
  char v12 = 1;
LABEL_6:
  sub_25622F360(a1, (uint64_t)v5, &qword_269F54398);
  if (v9(v5, 1, v8) == 1)
  {
    sub_25622F3C4((uint64_t)v5, &qword_269F54398);
  }
  else
  {
    uint64_t v13 = *(void **)&v5[*(int *)(v8 + 32)];
    id v14 = v13;
    sub_2562DD858((uint64_t)v5, type metadata accessor for EventMetadata);
    if (v13)
    {
      objc_msgSend(v14, sel_numberOfSeconds);

      char v15 = 0;
      if (v12) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  char v15 = 1;
  if (v12)
  {
LABEL_13:
    uint64_t v16 = 0;
    if (v15) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v16 = (void *)sub_2562E3DB0();
  if (v15)
  {
LABEL_14:
    uint64_t v17 = 0;
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v17 = (void *)sub_2562E3DA0();
LABEL_15:
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A470]), sel_initWithStartTimestampInSecondsSince1970_numberOfSeconds_, v16, v17);

  return v18;
}

id _s16MetricsFramework13EventMetadataV07toBiomeC005usagecD0So025BMSiriOnDeviceDigestUsageacD0CACSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v62 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v63 = (char *)&v56 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v59 = (uint64_t)&v56 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v56 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v18 = *(void *)(*(void *)(v17 - 8) + 64);
  MEMORY[0x270FA5388](v17 - 8);
  sub_25622F360(a1, (uint64_t)v16, &qword_269F54398);
  uint64_t v19 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, int *))(*((void *)v19 - 1) + 48);
  if (v20(v16, 1, v19) == 1)
  {
    uint64_t v21 = &qword_269F54398;
    uint64_t v22 = v16;
LABEL_5:
    uint64_t v25 = sub_25622F3C4((uint64_t)v22, v21);
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    goto LABEL_7;
  }
  sub_25622F360((uint64_t)v16, (uint64_t)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v16, type metadata accessor for EventMetadata);
  uint64_t v23 = sub_2562E2FD0();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))((char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v23) == 1)
  {
    uint64_t v21 = &qword_269F53D68;
    uint64_t v22 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_5;
  }
  uint64_t v26 = sub_2562E2FA0();
  uint64_t v60 = v27;
  uint64_t v61 = v26;
  uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))((char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
LABEL_7:
  MEMORY[0x270FA5388](v25);
  sub_25622F360(a1, (uint64_t)v14, &qword_269F54398);
  if (v20(v14, 1, v19) == 1)
  {
    uint64_t v28 = &qword_269F54398;
    uint64_t v29 = v14;
LABEL_11:
    uint64_t v32 = sub_25622F3C4((uint64_t)v29, v28);
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    goto LABEL_13;
  }
  sub_25622F360((uint64_t)&v14[v19[5]], (uint64_t)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269F53D68);
  sub_2562DD858((uint64_t)v14, type metadata accessor for EventMetadata);
  uint64_t v30 = sub_2562E2FD0();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))((char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v30) == 1)
  {
    uint64_t v28 = &qword_269F53D68;
    uint64_t v29 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    goto LABEL_11;
  }
  uint64_t v33 = sub_2562E2FA0();
  uint64_t v57 = v34;
  uint64_t v58 = v33;
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))((char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
LABEL_13:
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25622F360(a1, (uint64_t)v11, &qword_269F54398);
  unsigned int v36 = v20(v11, 1, v19);
  uint64_t v37 = (uint64_t)v63;
  if (v36 == 1)
  {
    uint64_t v38 = &qword_269F54398;
    uint64_t v39 = (uint64_t)v11;
LABEL_17:
    sub_25622F3C4(v39, v38);
    uint64_t v56 = 0;
    uint64_t v42 = 0;
    goto LABEL_19;
  }
  sub_25622F360((uint64_t)&v11[v19[6]], (uint64_t)v35, &qword_269F53D68);
  sub_2562DD858((uint64_t)v11, type metadata accessor for EventMetadata);
  uint64_t v40 = sub_2562E2FD0();
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v35, 1, v40) == 1)
  {
    uint64_t v38 = &qword_269F53D68;
    uint64_t v39 = (uint64_t)v35;
    goto LABEL_17;
  }
  uint64_t v43 = sub_2562E2FA0();
  uint64_t v37 = (uint64_t)v63;
  uint64_t v56 = v43;
  uint64_t v42 = v44;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v40);
LABEL_19:
  uint64_t v45 = v59;
  sub_25622F360(a1, v59, &qword_269F54398);
  if (v20((char *)v45, 1, v19) == 1)
  {
    sub_25622F3C4(v45, &qword_269F54398);
    char v46 = 1;
  }
  else
  {
    char v46 = *(unsigned char *)(v45 + v19[9] + 8);
    sub_2562DD858(v45, type metadata accessor for EventMetadata);
  }
  sub_25622F360(a1, v37, &qword_269F54398);
  if (v20((char *)v37, 1, v19) == 1)
  {
    sub_25622F3C4(v37, &qword_269F54398);
    char v47 = 1;
  }
  else
  {
    char v47 = *(unsigned char *)(v37 + v19[10] + 8);
    sub_2562DD858(v37, type metadata accessor for EventMetadata);
  }
  uint64_t v48 = v62;
  sub_25622F360(a1, v62, &qword_269F54398);
  if (v20((char *)v48, 1, v19) == 1)
  {
    sub_25622F3C4(v48, &qword_269F54398);
    id v49 = _sSo28ODDSiriSchemaODDTimeIntervalC16MetricsFrameworkE12toBiomeEvent13eventMetadataSo025BMSiriOnDeviceDigestUsageeik4TimeD0CAC0iK0VSg_tFZ_0(a1);
    uint64_t v50 = 0;
    if (v46)
    {
LABEL_33:
      uint64_t v52 = 0;
      if (v47) {
        goto LABEL_34;
      }
      goto LABEL_31;
    }
  }
  else
  {
    char v51 = *(unsigned char *)(v48 + v19[7] + 8);
    sub_2562DD858(v48, type metadata accessor for EventMetadata);
    id v49 = _sSo28ODDSiriSchemaODDTimeIntervalC16MetricsFrameworkE12toBiomeEvent13eventMetadataSo025BMSiriOnDeviceDigestUsageeik4TimeD0CAC0iK0VSg_tFZ_0(a1);
    if (v51)
    {
      uint64_t v50 = 0;
      if (v46) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v50 = (void *)sub_2562E3DB0();
      if (v46) {
        goto LABEL_33;
      }
    }
  }
  uint64_t v52 = (void *)sub_2562E3DB0();
  if (v47)
  {
LABEL_34:
    uint64_t v53 = 0;
    goto LABEL_35;
  }
LABEL_31:
  uint64_t v53 = (void *)sub_2562E3DB0();
LABEL_35:
  id v54 = objc_allocWithZone(MEMORY[0x263F2A468]);
  return sub_2562D0B78(v61, v60, v58, v57, v56, v42, v50, v49, v52, v53);
}

unint64_t sub_2562D85D4()
{
  unint64_t result = qword_269F55AE8;
  if (!qword_269F55AE8)
  {
    type metadata accessor for EventMetadata(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F55AE8);
  }
  return result;
}

unint64_t sub_2562D8630()
{
  unint64_t result = qword_269F55AF0;
  if (!qword_269F55AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F55AF0);
  }
  return result;
}

uint64_t sub_2562D8684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_2562D8698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_2562D86AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_2562D86C0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 32))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D86E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_2562D86FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_2562D8710(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 56))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8738(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 64))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t sub_2562D8774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t sub_2562D8788(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 88))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D87B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 96))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D87D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t sub_2562D87EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t sub_2562D8800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t sub_2562D8814(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 128))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D883C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 136))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8864(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 144))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D888C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 152))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D88B4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 160))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D88DC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 168))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8904(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 176))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D892C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 184))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8954(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 192))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D897C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 200))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D89A4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 208))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D89CC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 216))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D89F4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 224))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8A1C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 232))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 240))();
}

uint64_t sub_2562D8A58(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 248))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 256))();
}

uint64_t sub_2562D8A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 264))();
}

uint64_t sub_2562D8AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 272))();
}

uint64_t sub_2562D8ABC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(unint64_t))(a3 + 280))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2562D8AE4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t *initializeBufferWithCopyOfBuffer for EventMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2562E2FD0();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = a3[5];
    uint64_t v13 = (char *)a1 + v12;
    id v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    if (v9((uint64_t *)((char *)a2 + v16), 1, v7))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v17, v18, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v20;
    uint64_t v23 = (char *)a2 + v20;
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    uint64_t v24 = *(void **)((char *)a2 + v21);
    *(uint64_t *)((char *)a1 + v21) = (uint64_t)v24;
    uint64_t v25 = a3[9];
    uint64_t v26 = a3[10];
    uint64_t v27 = (char *)a1 + v25;
    uint64_t v28 = (char *)a2 + v25;
    v27[8] = v28[8];
    *(void *)uint64_t v27 = *(void *)v28;
    uint64_t v29 = (char *)a1 + v26;
    uint64_t v30 = (char *)a2 + v26;
    *(void *)uint64_t v29 = *(void *)v30;
    v29[8] = v30[8];
    id v31 = v24;
  }
  return a1;
}

void destroy for EventMetadata(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2562E2FD0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v7 = a1 + a2[5];
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v8 = a1 + a2[6];
  if (!v6(v8, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  }
  uint64_t v9 = *(void **)(a1 + a2[8]);
}

char *initializeWithCopy for EventMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2562E2FD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  if (v8(&a2[v14], 1, v6))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v18];
  uint64_t v21 = &a2[v18];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = *(void **)&a2[v19];
  *(void *)&a1[v19] = v22;
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v25 = &a1[v23];
  uint64_t v26 = &a2[v23];
  v25[8] = v26[8];
  *(void *)uint64_t v25 = *(void *)v26;
  uint64_t v27 = &a1[v24];
  uint64_t v28 = &a2[v24];
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v28[8];
  id v29 = v22;
  return a1;
}

char *assignWithCopy for EventMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2562E2FD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = v8(&a1[v18], 1, v6);
  int v22 = v8(v20, 1, v6);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v19, v20, v6);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
    goto LABEL_18;
  }
  if (v22)
  {
LABEL_18:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v19, v20, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
LABEL_19:
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = a3[8];
  id v29 = *(void **)&a1[v28];
  uint64_t v30 = *(void **)&a2[v28];
  *(void *)&a1[v28] = v30;
  id v31 = v30;

  uint64_t v32 = a3[9];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  uint64_t v36 = a3[10];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = *(void *)v38;
  v37[8] = v38[8];
  *(void *)uint64_t v37 = v39;
  return a1;
}

char *initializeWithTake for EventMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2562E2FD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = a3[6];
  int v15 = &a1[v14];
  int v16 = &a2[v14];
  if (v8(&a2[v14], 1, v6))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v18];
  int v21 = &a2[v18];
  *(void *)uint64_t v20 = *(void *)v21;
  uint64_t v22 = *(void *)&a2[v19];
  v20[8] = v21[8];
  *(void *)&a1[v19] = v22;
  uint64_t v23 = a3[9];
  uint64_t v24 = a3[10];
  uint64_t v25 = &a1[v23];
  uint64_t v26 = &a2[v23];
  v25[8] = v26[8];
  *(void *)uint64_t v25 = *(void *)v26;
  uint64_t v27 = &a1[v24];
  uint64_t v28 = &a2[v24];
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v28[8];
  return a1;
}

char *assignWithTake for EventMetadata(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2562E2FD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
LABEL_13:
  uint64_t v18 = a3[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = v8(&a1[v18], 1, v6);
  int v22 = v8(v20, 1, v6);
  if (!v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v19, v20, v6);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
    goto LABEL_18;
  }
  if (v22)
  {
LABEL_18:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v19, v20, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
LABEL_19:
  uint64_t v24 = a3[7];
  uint64_t v25 = a3[8];
  uint64_t v26 = &a1[v24];
  uint64_t v27 = &a2[v24];
  *(void *)uint64_t v26 = *(void *)v27;
  v26[8] = v27[8];
  uint64_t v28 = *(void **)&a1[v25];
  *(void *)&a1[v25] = *(void *)&a2[v25];

  uint64_t v29 = a3[9];
  uint64_t v30 = a3[10];
  id v31 = &a1[v29];
  uint64_t v32 = &a2[v29];
  *(void *)id v31 = *(void *)v32;
  v31[8] = v32[8];
  uint64_t v33 = &a1[v30];
  uint64_t v34 = &a2[v30];
  *(void *)uint64_t v33 = *(void *)v34;
  v33[8] = v34[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for EventMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2562D9CC0);
}

uint64_t sub_2562D9CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for EventMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2562D9DA4);
}

uint64_t sub_2562D9DA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = a2;
  }
  return result;
}

void sub_2562D9E64()
{
  sub_256281D7C(319, (unint64_t *)&qword_269F53EF8, MEMORY[0x270FA94D8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *__swift_memcpy13_4(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ISOLocale(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 13)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ISOLocale(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 13) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ISOLocale()
{
  return &type metadata for ISOLocale;
}

unsigned char *storeEnumTagSinglePayload for ProductId(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2562DA05CLL);
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

ValueMetadata *type metadata accessor for ProductId()
{
  return &type metadata for ProductId;
}

uint64_t *initializeBufferWithCopyOfBuffer for DeviceUsageMetrics(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for EventMetadata(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_2562E2FD0();
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48);
      uint64_t v137 = v8;
      if (v13(a2, 1, v11))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v12 + 16))(a1, a2, v11);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
      uint64_t v15 = v7[5];
      int v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      if (v13((uint64_t *)((char *)a2 + v15), 1, v11))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v17, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
      }
      uint64_t v19 = v7[6];
      uint64_t v20 = (char *)a1 + v19;
      int v21 = (char *)a2 + v19;
      if (v13((uint64_t *)((char *)a2 + v19), 1, v11))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v20, v21, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
      }
      uint64_t v23 = v7[7];
      uint64_t v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      *(void *)uint64_t v24 = *(void *)v25;
      v24[8] = v25[8];
      uint64_t v26 = v7[8];
      uint64_t v27 = *(void **)((char *)a2 + v26);
      *(uint64_t *)((char *)a1 + v26) = (uint64_t)v27;
      uint64_t v28 = v7[9];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      v29[8] = v30[8];
      *(void *)uint64_t v29 = *(void *)v30;
      uint64_t v31 = v7[10];
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      v32[8] = v33[8];
      *(void *)uint64_t v32 = *(void *)v33;
      uint64_t v34 = *(void (**)(uint64_t *, void, uint64_t, int *))(v137 + 56);
      id v35 = v27;
      v34(a1, 0, 1, v7);
    }
    uint64_t v36 = a3[5];
    uint64_t v37 = (char *)a1 + v36;
    uint64_t v38 = (char *)a2 + v36;
    uint64_t v39 = sub_2562E2FD0();
    uint64_t v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
    uint64_t v42 = a3[6];
    uint64_t v43 = a3[7];
    uint64_t v44 = (uint64_t *)((char *)a1 + v42);
    uint64_t v45 = (uint64_t *)((char *)a2 + v42);
    uint64_t v46 = v45[1];
    *uint64_t v44 = *v45;
    v44[1] = v46;
    char v47 = (char *)a1 + v43;
    uint64_t v48 = (char *)a2 + v43;
    v47[4] = v48[4];
    *(_DWORD *)char v47 = *(_DWORD *)v48;
    uint64_t v49 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v50 = (uint64_t *)((char *)a1 + v49);
    char v51 = (uint64_t *)((char *)a2 + v49);
    uint64_t v138 = v51[1];
    *uint64_t v50 = *v51;
    v50[1] = v138;
    uint64_t v52 = a3[10];
    uint64_t v53 = a3[11];
    id v54 = (char *)a1 + v52;
    uint64_t v55 = (char *)a2 + v52;
    *(_DWORD *)id v54 = *(_DWORD *)v55;
    v54[4] = v55[4];
    uint64_t v56 = (char *)a1 + v53;
    uint64_t v57 = (char *)a2 + v53;
    *(_DWORD *)uint64_t v56 = *(_DWORD *)v57;
    v56[4] = v57[4];
    uint64_t v58 = a3[12];
    uint64_t v59 = a3[13];
    uint64_t v60 = (uint64_t *)((char *)a1 + v58);
    uint64_t v61 = (uint64_t *)((char *)a2 + v58);
    uint64_t v62 = v61[1];
    void *v60 = *v61;
    v60[1] = v62;
    uint64_t v63 = (uint64_t *)((char *)a1 + v59);
    uint64_t v64 = (uint64_t *)((char *)a2 + v59);
    uint64_t v136 = v64[1];
    *uint64_t v63 = *v64;
    v63[1] = v136;
    uint64_t v65 = a3[14];
    uint64_t v66 = a3[15];
    uint64_t v67 = (char *)a1 + v65;
    uint64_t v68 = (char *)a2 + v65;
    *(_DWORD *)uint64_t v67 = *(_DWORD *)v68;
    v67[4] = v68[4];
    uint64_t v69 = (char *)a1 + v66;
    char v70 = (char *)a2 + v66;
    *(_DWORD *)uint64_t v69 = *(_DWORD *)v70;
    v69[4] = v70[4];
    uint64_t v71 = a3[16];
    uint64_t v72 = a3[17];
    uint64_t v73 = *(void **)((char *)a2 + v71);
    *(uint64_t *)((char *)a1 + v71) = (uint64_t)v73;
    char v74 = *(void **)((char *)a2 + v72);
    *(uint64_t *)((char *)a1 + v72) = (uint64_t)v74;
    uint64_t v75 = a3[18];
    uint64_t v76 = a3[19];
    uint64_t v77 = (uint64_t *)((char *)a1 + v75);
    uint64_t v78 = (uint64_t *)((char *)a2 + v75);
    uint64_t v79 = v78[1];
    void *v77 = *v78;
    v77[1] = v79;
    char v80 = (char *)a1 + v76;
    uint64_t v81 = (char *)a2 + v76;
    *(_DWORD *)char v80 = *(_DWORD *)v81;
    v80[4] = v81[4];
    uint64_t v82 = a3[20];
    uint64_t v83 = a3[21];
    uint64_t v84 = (char *)a1 + v82;
    char v85 = (char *)a2 + v82;
    *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
    v84[4] = v85[4];
    uint64_t v86 = (char *)a1 + v83;
    uint64_t v87 = (char *)a2 + v83;
    *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
    v86[4] = v87[4];
    uint64_t v88 = a3[22];
    uint64_t v89 = a3[23];
    id v90 = (char *)a1 + v88;
    id v91 = (char *)a2 + v88;
    *(_DWORD *)id v90 = *(_DWORD *)v91;
    v90[4] = v91[4];
    id v92 = (char *)a1 + v89;
    uint64_t v93 = (char *)a2 + v89;
    LODWORD(v90) = *(_DWORD *)v93;
    v92[4] = v93[4];
    *(_DWORD *)id v92 = v90;
    uint64_t v94 = a3[24];
    uint64_t v95 = a3[25];
    uint64_t v96 = (char *)a1 + v94;
    uint64_t v97 = (char *)a2 + v94;
    *(_DWORD *)uint64_t v96 = *(_DWORD *)v97;
    v96[4] = v97[4];
    uint64_t v98 = (char *)a1 + v95;
    char v99 = (char *)a2 + v95;
    *(_DWORD *)uint64_t v98 = *(_DWORD *)v99;
    v98[4] = v99[4];
    uint64_t v100 = a3[26];
    uint64_t v101 = a3[27];
    uint64_t v102 = (char *)a1 + v100;
    uint64_t v103 = (char *)a2 + v100;
    *(_DWORD *)uint64_t v102 = *(_DWORD *)v103;
    v102[4] = v103[4];
    uint64_t v104 = (char *)a1 + v101;
    char v105 = (char *)a2 + v101;
    *(_DWORD *)uint64_t v104 = *(_DWORD *)v105;
    v104[4] = v105[4];
    uint64_t v106 = a3[28];
    uint64_t v107 = a3[29];
    uint64_t v108 = (char *)a1 + v106;
    uint64_t v109 = (char *)a2 + v106;
    *(_DWORD *)uint64_t v108 = *(_DWORD *)v109;
    v108[4] = v109[4];
    uint64_t v110 = (char *)a1 + v107;
    uint64_t v111 = (char *)a2 + v107;
    *(_DWORD *)uint64_t v110 = *(_DWORD *)v111;
    v110[4] = v111[4];
    uint64_t v112 = a3[30];
    uint64_t v113 = a3[31];
    id v114 = (char *)a1 + v112;
    uint64_t v115 = (char *)a2 + v112;
    *(_DWORD *)id v114 = *(_DWORD *)v115;
    v114[4] = v115[4];
    uint64_t v116 = (char *)a1 + v113;
    uint64_t v117 = (char *)a2 + v113;
    *(_DWORD *)uint64_t v116 = *(_DWORD *)v117;
    v116[4] = v117[4];
    uint64_t v118 = a3[32];
    uint64_t v119 = a3[33];
    uint64_t v120 = (char *)a1 + v118;
    uint64_t v121 = (char *)a2 + v118;
    *(_DWORD *)uint64_t v120 = *(_DWORD *)v121;
    v120[4] = v121[4];
    uint64_t v122 = (uint64_t *)((char *)a1 + v119);
    uint64_t v123 = (uint64_t *)((char *)a2 + v119);
    uint64_t v124 = v123[1];
    void *v122 = *v123;
    v122[1] = v124;
    uint64_t v125 = a3[34];
    uint64_t v126 = a3[35];
    v127 = (char *)a1 + v125;
    int v128 = (char *)a2 + v125;
    *(_DWORD *)v127 = *(_DWORD *)v128;
    unsigned char v127[4] = v128[4];
    *(uint64_t *)((char *)a1 + v126) = *(uint64_t *)((char *)a2 + v126);
    uint64_t v129 = a3[37];
    *((unsigned char *)a1 + a3[36]) = *((unsigned char *)a2 + a3[36]);
    *(uint64_t *)((char *)a1 + v129) = *(uint64_t *)((char *)a2 + v129);
    uint64_t v130 = a3[38];
    uint64_t v131 = (char *)a1 + v130;
    uint64_t v132 = (char *)a2 + v130;
    v131[4] = v132[4];
    *(_DWORD *)uint64_t v131 = *(_DWORD *)v132;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v133 = v73;
    id v134 = v74;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DeviceUsageMetrics(uint64_t a1, int *a2)
{
  unsigned int v4 = (int *)type metadata accessor for EventMetadata(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v4 - 1) + 48))(a1, 1, v4))
  {
    uint64_t v5 = sub_2562E2FD0();
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    if (!v7(a1, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    }
    uint64_t v8 = a1 + v4[5];
    if (!v7(v8, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
    }
    uint64_t v9 = a1 + v4[6];
    if (!v7(v9, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  uint64_t v10 = a1 + a2[5];
  uint64_t v11 = sub_2562E2FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for DeviceUsageMetrics(char *a1, char *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2562E2FD0();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v135 = v7;
    if (v11(a2, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(a1, a2, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    uint64_t v13 = v6[5];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    if (v11(&a2[v13], 1, v9))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
    }
    uint64_t v17 = v6[6];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    if (v11(&a2[v17], 1, v9))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
    }
    uint64_t v21 = v6[7];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = &a2[v21];
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    uint64_t v24 = v6[8];
    uint64_t v25 = *(void **)&a2[v24];
    *(void *)&a1[v24] = v25;
    uint64_t v26 = v6[9];
    uint64_t v27 = &a1[v26];
    uint64_t v28 = &a2[v26];
    v27[8] = v28[8];
    *(void *)uint64_t v27 = *(void *)v28;
    uint64_t v29 = v6[10];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    v30[8] = v31[8];
    *(void *)uint64_t v30 = *(void *)v31;
    uint64_t v32 = *(void (**)(char *, void, uint64_t, int *))(v135 + 56);
    id v33 = v25;
    v32(a1, 0, 1, v6);
  }
  uint64_t v34 = a3[5];
  id v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = sub_2562E2FD0();
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
  {
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  uint64_t v40 = a3[6];
  uint64_t v41 = a3[7];
  uint64_t v42 = &a1[v40];
  uint64_t v43 = &a2[v40];
  uint64_t v44 = *((void *)v43 + 1);
  *(void *)uint64_t v42 = *(void *)v43;
  *((void *)v42 + 1) = v44;
  uint64_t v45 = &a1[v41];
  uint64_t v46 = &a2[v41];
  v45[4] = v46[4];
  *(_DWORD *)uint64_t v45 = *(_DWORD *)v46;
  uint64_t v47 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  uint64_t v136 = *((void *)v49 + 1);
  *(void *)uint64_t v48 = *(void *)v49;
  *((void *)v48 + 1) = v136;
  uint64_t v50 = a3[10];
  uint64_t v51 = a3[11];
  uint64_t v52 = &a1[v50];
  uint64_t v53 = &a2[v50];
  *(_DWORD *)uint64_t v52 = *(_DWORD *)v53;
  v52[4] = v53[4];
  id v54 = &a1[v51];
  uint64_t v55 = &a2[v51];
  *(_DWORD *)id v54 = *(_DWORD *)v55;
  v54[4] = v55[4];
  uint64_t v56 = a3[12];
  uint64_t v57 = a3[13];
  uint64_t v58 = &a1[v56];
  uint64_t v59 = &a2[v56];
  uint64_t v60 = *((void *)v59 + 1);
  *(void *)uint64_t v58 = *(void *)v59;
  *((void *)v58 + 1) = v60;
  uint64_t v61 = &a1[v57];
  uint64_t v62 = &a2[v57];
  uint64_t v134 = *((void *)v62 + 1);
  *(void *)uint64_t v61 = *(void *)v62;
  *((void *)v61 + 1) = v134;
  uint64_t v63 = a3[14];
  uint64_t v64 = a3[15];
  uint64_t v65 = &a1[v63];
  uint64_t v66 = &a2[v63];
  *(_DWORD *)uint64_t v65 = *(_DWORD *)v66;
  v65[4] = v66[4];
  uint64_t v67 = &a1[v64];
  uint64_t v68 = &a2[v64];
  *(_DWORD *)uint64_t v67 = *(_DWORD *)v68;
  v67[4] = v68[4];
  uint64_t v69 = a3[16];
  uint64_t v70 = a3[17];
  uint64_t v71 = *(void **)&a2[v69];
  *(void *)&a1[v69] = v71;
  uint64_t v72 = *(void **)&a2[v70];
  *(void *)&a1[v70] = v72;
  uint64_t v73 = a3[18];
  uint64_t v74 = a3[19];
  uint64_t v75 = &a1[v73];
  uint64_t v76 = &a2[v73];
  uint64_t v77 = *((void *)v76 + 1);
  *(void *)uint64_t v75 = *(void *)v76;
  *((void *)v75 + 1) = v77;
  uint64_t v78 = &a1[v74];
  uint64_t v79 = &a2[v74];
  *(_DWORD *)uint64_t v78 = *(_DWORD *)v79;
  v78[4] = v79[4];
  uint64_t v80 = a3[20];
  uint64_t v81 = a3[21];
  uint64_t v82 = &a1[v80];
  uint64_t v83 = &a2[v80];
  *(_DWORD *)uint64_t v82 = *(_DWORD *)v83;
  v82[4] = v83[4];
  uint64_t v84 = &a1[v81];
  char v85 = &a2[v81];
  *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
  v84[4] = v85[4];
  uint64_t v86 = a3[22];
  uint64_t v87 = a3[23];
  uint64_t v88 = &a1[v86];
  uint64_t v89 = &a2[v86];
  *(_DWORD *)uint64_t v88 = *(_DWORD *)v89;
  v88[4] = v89[4];
  id v90 = &a1[v87];
  id v91 = &a2[v87];
  LODWORD(v88) = *(_DWORD *)v91;
  v90[4] = v91[4];
  *(_DWORD *)id v90 = v88;
  uint64_t v92 = a3[24];
  uint64_t v93 = a3[25];
  uint64_t v94 = &a1[v92];
  uint64_t v95 = &a2[v92];
  *(_DWORD *)uint64_t v94 = *(_DWORD *)v95;
  v94[4] = v95[4];
  uint64_t v96 = &a1[v93];
  uint64_t v97 = &a2[v93];
  *(_DWORD *)uint64_t v96 = *(_DWORD *)v97;
  v96[4] = v97[4];
  uint64_t v98 = a3[26];
  uint64_t v99 = a3[27];
  uint64_t v100 = &a1[v98];
  uint64_t v101 = &a2[v98];
  *(_DWORD *)uint64_t v100 = *(_DWORD *)v101;
  v100[4] = v101[4];
  uint64_t v102 = &a1[v99];
  uint64_t v103 = &a2[v99];
  *(_DWORD *)uint64_t v102 = *(_DWORD *)v103;
  v102[4] = v103[4];
  uint64_t v104 = a3[28];
  uint64_t v105 = a3[29];
  uint64_t v106 = &a1[v104];
  uint64_t v107 = &a2[v104];
  *(_DWORD *)uint64_t v106 = *(_DWORD *)v107;
  v106[4] = v107[4];
  uint64_t v108 = &a1[v105];
  uint64_t v109 = &a2[v105];
  *(_DWORD *)uint64_t v108 = *(_DWORD *)v109;
  v108[4] = v109[4];
  uint64_t v110 = a3[30];
  uint64_t v111 = a3[31];
  uint64_t v112 = &a1[v110];
  uint64_t v113 = &a2[v110];
  *(_DWORD *)uint64_t v112 = *(_DWORD *)v113;
  v112[4] = v113[4];
  id v114 = &a1[v111];
  uint64_t v115 = &a2[v111];
  *(_DWORD *)id v114 = *(_DWORD *)v115;
  v114[4] = v115[4];
  uint64_t v116 = a3[32];
  uint64_t v117 = a3[33];
  uint64_t v118 = &a1[v116];
  uint64_t v119 = &a2[v116];
  *(_DWORD *)uint64_t v118 = *(_DWORD *)v119;
  v118[4] = v119[4];
  uint64_t v120 = &a1[v117];
  uint64_t v121 = &a2[v117];
  uint64_t v122 = *((void *)v121 + 1);
  *(void *)uint64_t v120 = *(void *)v121;
  *((void *)v120 + 1) = v122;
  uint64_t v123 = a3[34];
  uint64_t v124 = a3[35];
  uint64_t v125 = &a1[v123];
  uint64_t v126 = &a2[v123];
  *(_DWORD *)uint64_t v125 = *(_DWORD *)v126;
  v125[4] = v126[4];
  *(void *)&a1[v124] = *(void *)&a2[v124];
  uint64_t v127 = a3[37];
  a1[a3[36]] = a2[a3[36]];
  *(void *)&a1[v127] = *(void *)&a2[v127];
  uint64_t v128 = a3[38];
  uint64_t v129 = &a1[v128];
  uint64_t v130 = &a2[v128];
  v129[4] = v130[4];
  *(_DWORD *)uint64_t v129 = *(_DWORD *)v130;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v131 = v71;
  id v132 = v72;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for DeviceUsageMetrics(char *a1, char *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_2562DD858((uint64_t)a1, type metadata accessor for EventMetadata);
      goto LABEL_7;
    }
    uint64_t v16 = sub_2562E2FD0();
    uint64_t v194 = *(void *)(v16 - 8);
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v194 + 48);
    int v18 = v17(a1, 1, v16);
    int v19 = v17(a2, 1, v16);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v194 + 16))(a1, a2, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v194 + 56))(a1, 0, 1, v16);
        goto LABEL_22;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v194 + 24))(a1, a2, v16);
LABEL_22:
        uint64_t v45 = v6[5];
        uint64_t v46 = &a1[v45];
        uint64_t v47 = &a2[v45];
        int v48 = v17(&a1[v45], 1, v16);
        int v49 = v17(v47, 1, v16);
        if (v48)
        {
          if (!v49)
          {
            (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v46, v47, v16);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v194 + 56))(v46, 0, 1, v16);
            goto LABEL_28;
          }
        }
        else
        {
          if (!v49)
          {
            (*(void (**)(char *, char *, uint64_t))(v194 + 24))(v46, v47, v16);
LABEL_28:
            uint64_t v51 = v6[6];
            uint64_t v52 = &a1[v51];
            uint64_t v53 = &a2[v51];
            int v54 = v17(&a1[v51], 1, v16);
            int v55 = v17(v53, 1, v16);
            if (v54)
            {
              if (!v55)
              {
                (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v52, v53, v16);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v194 + 56))(v52, 0, 1, v16);
LABEL_34:
                uint64_t v57 = v6[7];
                uint64_t v58 = &a1[v57];
                uint64_t v59 = &a2[v57];
                uint64_t v60 = *(void *)v59;
                v58[8] = v59[8];
                *(void *)uint64_t v58 = v60;
                uint64_t v61 = v6[8];
                uint64_t v62 = *(void **)&a1[v61];
                uint64_t v63 = *(void **)&a2[v61];
                *(void *)&a1[v61] = v63;
                id v64 = v63;

                uint64_t v65 = v6[9];
                uint64_t v66 = &a1[v65];
                uint64_t v67 = &a2[v65];
                uint64_t v68 = *(void *)v67;
                v66[8] = v67[8];
                *(void *)uint64_t v66 = v68;
                uint64_t v69 = v6[10];
                uint64_t v70 = &a1[v69];
                uint64_t v71 = &a2[v69];
                uint64_t v72 = *(void *)v71;
                v70[8] = v71[8];
                *(void *)uint64_t v70 = v72;
                goto LABEL_35;
              }
            }
            else
            {
              if (!v55)
              {
                (*(void (**)(char *, char *, uint64_t))(v194 + 24))(v52, v53, v16);
                goto LABEL_34;
              }
              (*(void (**)(char *, uint64_t))(v194 + 8))(v52, v16);
            }
            uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
            memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
            goto LABEL_34;
          }
          (*(void (**)(char *, uint64_t))(v194 + 8))(v46, v16);
        }
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v194 + 8))(a1, v16);
    }
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_22;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_35;
  }
  uint64_t v11 = sub_2562E2FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v193 = v12;
  if (v13(a2, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(a1, a2, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  uint64_t v20 = v6[5];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  if (v13(&a2[v20], 1, v11))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v193 + 16))(v21, v22, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v193 + 56))(v21, 0, 1, v11);
  }
  uint64_t v24 = v6[6];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  if (v13(&a2[v24], 1, v11))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v193 + 16))(v25, v26, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v193 + 56))(v25, 0, 1, v11);
  }
  uint64_t v28 = v6[7];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = v6[8];
  id v33 = *(void **)&a2[v32];
  *(void *)&a1[v32] = v33;
  uint64_t v34 = v6[9];
  id v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = *(void *)v36;
  v35[8] = v36[8];
  *(void *)id v35 = v37;
  uint64_t v38 = v6[10];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  uint64_t v41 = *(void *)v40;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = v41;
  uint64_t v42 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
  id v43 = v33;
  v42(a1, 0, 1, v6);
LABEL_35:
  uint64_t v73 = a3[5];
  uint64_t v74 = &a1[v73];
  uint64_t v75 = &a2[v73];
  uint64_t v76 = sub_2562E2FD0();
  uint64_t v77 = *(void *)(v76 - 8);
  uint64_t v78 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v77 + 48);
  int v79 = v78(v74, 1, v76);
  int v80 = v78(v75, 1, v76);
  if (!v79)
  {
    if (!v80)
    {
      (*(void (**)(char *, char *, uint64_t))(v77 + 24))(v74, v75, v76);
      goto LABEL_41;
    }
    (*(void (**)(char *, uint64_t))(v77 + 8))(v74, v76);
    goto LABEL_40;
  }
  if (v80)
  {
LABEL_40:
    uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v74, v75, *(void *)(*(void *)(v81 - 8) + 64));
    goto LABEL_41;
  }
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v74, v75, v76);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v77 + 56))(v74, 0, 1, v76);
LABEL_41:
  uint64_t v82 = a3[6];
  uint64_t v83 = &a1[v82];
  uint64_t v84 = &a2[v82];
  *(void *)uint64_t v83 = *(void *)v84;
  *((void *)v83 + 1) = *((void *)v84 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v85 = a3[7];
  uint64_t v86 = &a1[v85];
  uint64_t v87 = &a2[v85];
  int v88 = *(_DWORD *)v87;
  v86[4] = v87[4];
  *(_DWORD *)uint64_t v86 = v88;
  a1[a3[8]] = a2[a3[8]];
  uint64_t v89 = a3[9];
  id v90 = &a1[v89];
  id v91 = &a2[v89];
  *(void *)id v90 = *(void *)v91;
  *((void *)v90 + 1) = *((void *)v91 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v92 = a3[10];
  uint64_t v93 = &a1[v92];
  uint64_t v94 = &a2[v92];
  int v95 = *(_DWORD *)v94;
  v93[4] = v94[4];
  *(_DWORD *)uint64_t v93 = v95;
  uint64_t v96 = a3[11];
  uint64_t v97 = &a1[v96];
  uint64_t v98 = &a2[v96];
  int v99 = *(_DWORD *)v98;
  v97[4] = v98[4];
  *(_DWORD *)uint64_t v97 = v99;
  uint64_t v100 = a3[12];
  uint64_t v101 = &a1[v100];
  uint64_t v102 = &a2[v100];
  *(void *)uint64_t v101 = *(void *)v102;
  *((void *)v101 + 1) = *((void *)v102 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v103 = a3[13];
  uint64_t v104 = &a1[v103];
  uint64_t v105 = &a2[v103];
  *(void *)uint64_t v104 = *(void *)v105;
  *((void *)v104 + 1) = *((void *)v105 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v106 = a3[14];
  uint64_t v107 = &a1[v106];
  uint64_t v108 = &a2[v106];
  int v109 = *(_DWORD *)v108;
  v107[4] = v108[4];
  *(_DWORD *)uint64_t v107 = v109;
  uint64_t v110 = a3[15];
  uint64_t v111 = &a1[v110];
  uint64_t v112 = &a2[v110];
  int v113 = *(_DWORD *)v112;
  v111[4] = v112[4];
  *(_DWORD *)uint64_t v111 = v113;
  uint64_t v114 = a3[16];
  uint64_t v115 = *(void **)&a1[v114];
  uint64_t v116 = *(void **)&a2[v114];
  *(void *)&a1[v114] = v116;
  id v117 = v116;

  uint64_t v118 = a3[17];
  uint64_t v119 = *(void **)&a1[v118];
  uint64_t v120 = *(void **)&a2[v118];
  *(void *)&a1[v118] = v120;
  id v121 = v120;

  uint64_t v122 = a3[18];
  uint64_t v123 = &a1[v122];
  uint64_t v124 = &a2[v122];
  *(void *)uint64_t v123 = *(void *)v124;
  *((void *)v123 + 1) = *((void *)v124 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v125 = a3[19];
  uint64_t v126 = &a1[v125];
  uint64_t v127 = &a2[v125];
  int v128 = *(_DWORD *)v127;
  v126[4] = v127[4];
  *(_DWORD *)uint64_t v126 = v128;
  uint64_t v129 = a3[20];
  uint64_t v130 = &a1[v129];
  id v131 = &a2[v129];
  int v132 = *(_DWORD *)v131;
  v130[4] = v131[4];
  *(_DWORD *)uint64_t v130 = v132;
  uint64_t v133 = a3[21];
  uint64_t v134 = &a1[v133];
  uint64_t v135 = &a2[v133];
  int v136 = *(_DWORD *)v135;
  v134[4] = v135[4];
  *(_DWORD *)uint64_t v134 = v136;
  uint64_t v137 = a3[22];
  uint64_t v138 = &a1[v137];
  v139 = &a2[v137];
  int v140 = *(_DWORD *)v139;
  v138[4] = v139[4];
  *(_DWORD *)uint64_t v138 = v140;
  uint64_t v141 = a3[23];
  v142 = &a1[v141];
  v143 = &a2[v141];
  int v144 = *(_DWORD *)v143;
  v142[4] = v143[4];
  *(_DWORD *)v142 = v144;
  uint64_t v145 = a3[24];
  uint64_t v146 = &a1[v145];
  v147 = &a2[v145];
  int v148 = *(_DWORD *)v147;
  v146[4] = v147[4];
  *(_DWORD *)uint64_t v146 = v148;
  uint64_t v149 = a3[25];
  v150 = &a1[v149];
  v151 = &a2[v149];
  int v152 = *(_DWORD *)v151;
  v150[4] = v151[4];
  *(_DWORD *)v150 = v152;
  uint64_t v153 = a3[26];
  v154 = &a1[v153];
  v155 = &a2[v153];
  int v156 = *(_DWORD *)v155;
  v154[4] = v155[4];
  *(_DWORD *)v154 = v156;
  uint64_t v157 = a3[27];
  v158 = &a1[v157];
  v159 = &a2[v157];
  int v160 = *(_DWORD *)v159;
  v158[4] = v159[4];
  *(_DWORD *)v158 = v160;
  uint64_t v161 = a3[28];
  v162 = &a1[v161];
  v163 = &a2[v161];
  int v164 = *(_DWORD *)v163;
  v162[4] = v163[4];
  *(_DWORD *)v162 = v164;
  uint64_t v165 = a3[29];
  v166 = &a1[v165];
  v167 = &a2[v165];
  int v168 = *(_DWORD *)v167;
  v166[4] = v167[4];
  *(_DWORD *)v166 = v168;
  uint64_t v169 = a3[30];
  v170 = &a1[v169];
  v171 = &a2[v169];
  int v172 = *(_DWORD *)v171;
  v170[4] = v171[4];
  *(_DWORD *)v170 = v172;
  uint64_t v173 = a3[31];
  v174 = &a1[v173];
  v175 = &a2[v173];
  int v176 = *(_DWORD *)v175;
  v174[4] = v175[4];
  *(_DWORD *)v174 = v176;
  uint64_t v177 = a3[32];
  v178 = &a1[v177];
  v179 = &a2[v177];
  int v180 = *(_DWORD *)v179;
  v178[4] = v179[4];
  *(_DWORD *)v178 = v180;
  uint64_t v181 = a3[33];
  v182 = &a1[v181];
  v183 = &a2[v181];
  *(void *)v182 = *(void *)v183;
  *((void *)v182 + 1) = *((void *)v183 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v184 = a3[34];
  v185 = &a1[v184];
  v186 = &a2[v184];
  int v187 = *(_DWORD *)v186;
  v185[4] = v186[4];
  *(_DWORD *)v185 = v187;
  *(void *)&a1[a3[35]] = *(void *)&a2[a3[35]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[36]] = a2[a3[36]];
  *(void *)&a1[a3[37]] = *(void *)&a2[a3[37]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v188 = a3[38];
  v189 = &a1[v188];
  v190 = &a2[v188];
  int v191 = *(_DWORD *)v190;
  v189[4] = v190[4];
  *(_DWORD *)v189 = v191;
  return a1;
}

char *initializeWithTake for DeviceUsageMetrics(char *a1, char *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v107 = v7;
    uint64_t v9 = sub_2562E2FD0();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    if (v11(a2, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a1, a2, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
    }
    uint64_t v13 = v6[5];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    if (v11(&a2[v13], 1, v9))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
    }
    uint64_t v17 = v6[6];
    int v18 = &a1[v17];
    int v19 = &a2[v17];
    if (v11(&a2[v17], 1, v9))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v19, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
    }
    uint64_t v21 = v6[7];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = &a2[v21];
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = v23[8];
    *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
    uint64_t v24 = v6[9];
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    v25[8] = v26[8];
    *(void *)uint64_t v25 = *(void *)v26;
    uint64_t v27 = v6[10];
    uint64_t v28 = &a1[v27];
    uint64_t v29 = &a2[v27];
    v28[8] = v29[8];
    *(void *)uint64_t v28 = *(void *)v29;
    (*(void (**)(char *, void, uint64_t, int *))(v107 + 56))(a1, 0, 1, v6);
  }
  uint64_t v30 = a3[5];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v33 = sub_2562E2FD0();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  uint64_t v36 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  *(_DWORD *)uint64_t v37 = *(_DWORD *)v38;
  v37[4] = v38[4];
  uint64_t v39 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(_OWORD *)&a1[v39] = *(_OWORD *)&a2[v39];
  uint64_t v40 = a3[10];
  uint64_t v41 = a3[11];
  uint64_t v42 = &a1[v40];
  id v43 = &a2[v40];
  *(_DWORD *)uint64_t v42 = *(_DWORD *)v43;
  v42[4] = v43[4];
  uint64_t v44 = &a1[v41];
  uint64_t v45 = &a2[v41];
  *(_DWORD *)uint64_t v44 = *(_DWORD *)v45;
  v44[4] = v45[4];
  uint64_t v46 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v46] = *(_OWORD *)&a2[v46];
  uint64_t v47 = a3[14];
  uint64_t v48 = a3[15];
  int v49 = &a1[v47];
  uint64_t v50 = &a2[v47];
  int v51 = *(_DWORD *)v50;
  v49[4] = v50[4];
  *(_DWORD *)int v49 = v51;
  uint64_t v52 = &a1[v48];
  uint64_t v53 = &a2[v48];
  *(_DWORD *)uint64_t v52 = *(_DWORD *)v53;
  v52[4] = v53[4];
  uint64_t v54 = a3[17];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  *(void *)&a1[v54] = *(void *)&a2[v54];
  uint64_t v55 = a3[19];
  *(_OWORD *)&a1[a3[18]] = *(_OWORD *)&a2[a3[18]];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = &a2[v55];
  *(_DWORD *)uint64_t v56 = *(_DWORD *)v57;
  v56[4] = v57[4];
  uint64_t v58 = a3[20];
  uint64_t v59 = a3[21];
  uint64_t v60 = &a1[v58];
  uint64_t v61 = &a2[v58];
  *(_DWORD *)uint64_t v60 = *(_DWORD *)v61;
  v60[4] = v61[4];
  uint64_t v62 = &a1[v59];
  uint64_t v63 = &a2[v59];
  *(_DWORD *)uint64_t v62 = *(_DWORD *)v63;
  v62[4] = v63[4];
  uint64_t v64 = a3[22];
  uint64_t v65 = a3[23];
  uint64_t v66 = &a1[v64];
  uint64_t v67 = &a2[v64];
  *(_DWORD *)uint64_t v66 = *(_DWORD *)v67;
  v66[4] = v67[4];
  uint64_t v68 = &a1[v65];
  uint64_t v69 = &a2[v65];
  LODWORD(v66) = *(_DWORD *)v69;
  v68[4] = v69[4];
  *(_DWORD *)uint64_t v68 = v66;
  uint64_t v70 = a3[24];
  uint64_t v71 = a3[25];
  uint64_t v72 = &a1[v70];
  uint64_t v73 = &a2[v70];
  *(_DWORD *)uint64_t v72 = *(_DWORD *)v73;
  v72[4] = v73[4];
  uint64_t v74 = &a1[v71];
  uint64_t v75 = &a2[v71];
  *(_DWORD *)uint64_t v74 = *(_DWORD *)v75;
  v74[4] = v75[4];
  uint64_t v76 = a3[26];
  uint64_t v77 = a3[27];
  uint64_t v78 = &a1[v76];
  int v79 = &a2[v76];
  *(_DWORD *)uint64_t v78 = *(_DWORD *)v79;
  v78[4] = v79[4];
  int v80 = &a1[v77];
  uint64_t v81 = &a2[v77];
  *(_DWORD *)int v80 = *(_DWORD *)v81;
  v80[4] = v81[4];
  uint64_t v82 = a3[28];
  uint64_t v83 = a3[29];
  uint64_t v84 = &a1[v82];
  uint64_t v85 = &a2[v82];
  *(_DWORD *)uint64_t v84 = *(_DWORD *)v85;
  v84[4] = v85[4];
  uint64_t v86 = &a1[v83];
  uint64_t v87 = &a2[v83];
  *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
  v86[4] = v87[4];
  uint64_t v88 = a3[30];
  uint64_t v89 = a3[31];
  id v90 = &a1[v88];
  id v91 = &a2[v88];
  *(_DWORD *)id v90 = *(_DWORD *)v91;
  v90[4] = v91[4];
  uint64_t v92 = &a1[v89];
  uint64_t v93 = &a2[v89];
  *(_DWORD *)uint64_t v92 = *(_DWORD *)v93;
  v92[4] = v93[4];
  uint64_t v94 = a3[32];
  uint64_t v95 = a3[33];
  uint64_t v96 = &a1[v94];
  uint64_t v97 = &a2[v94];
  *(_DWORD *)uint64_t v96 = *(_DWORD *)v97;
  v96[4] = v97[4];
  *(_OWORD *)&a1[v95] = *(_OWORD *)&a2[v95];
  uint64_t v98 = a3[34];
  uint64_t v99 = a3[35];
  uint64_t v100 = &a1[v98];
  uint64_t v101 = &a2[v98];
  *(_DWORD *)uint64_t v100 = *(_DWORD *)v101;
  v100[4] = v101[4];
  *(void *)&a1[v99] = *(void *)&a2[v99];
  uint64_t v102 = a3[37];
  a1[a3[36]] = a2[a3[36]];
  *(void *)&a1[v102] = *(void *)&a2[v102];
  uint64_t v103 = a3[38];
  uint64_t v104 = &a1[v103];
  uint64_t v105 = &a2[v103];
  v104[4] = v105[4];
  *(_DWORD *)uint64_t v104 = *(_DWORD *)v105;
  return a1;
}

char *assignWithTake for DeviceUsageMetrics(char *a1, char *a2, int *a3)
{
  uint64_t v6 = (int *)type metadata accessor for EventMetadata(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_2562DD858((uint64_t)a1, type metadata accessor for EventMetadata);
      goto LABEL_7;
    }
    uint64_t v16 = sub_2562E2FD0();
    uint64_t v172 = *(void *)(v16 - 8);
    uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v172 + 48);
    int v18 = v17(a1, 1, v16);
    int v19 = v17(a2, 1, v16);
    if (v18)
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v172 + 32))(a1, a2, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v172 + 56))(a1, 0, 1, v16);
        goto LABEL_22;
      }
    }
    else
    {
      if (!v19)
      {
        (*(void (**)(char *, char *, uint64_t))(v172 + 40))(a1, a2, v16);
LABEL_22:
        uint64_t v38 = v6[5];
        uint64_t v39 = &a1[v38];
        uint64_t v40 = &a2[v38];
        int v41 = v17(&a1[v38], 1, v16);
        int v42 = v17(v40, 1, v16);
        if (v41)
        {
          if (!v42)
          {
            (*(void (**)(char *, char *, uint64_t))(v172 + 32))(v39, v40, v16);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v172 + 56))(v39, 0, 1, v16);
            goto LABEL_28;
          }
        }
        else
        {
          if (!v42)
          {
            (*(void (**)(char *, char *, uint64_t))(v172 + 40))(v39, v40, v16);
LABEL_28:
            uint64_t v44 = v6[6];
            uint64_t v45 = &a1[v44];
            uint64_t v46 = &a2[v44];
            int v47 = v17(&a1[v44], 1, v16);
            int v48 = v17(v46, 1, v16);
            if (v47)
            {
              if (!v48)
              {
                (*(void (**)(char *, char *, uint64_t))(v172 + 32))(v45, v46, v16);
                (*(void (**)(char *, void, uint64_t, uint64_t))(v172 + 56))(v45, 0, 1, v16);
LABEL_34:
                uint64_t v50 = v6[7];
                int v51 = &a1[v50];
                uint64_t v52 = &a2[v50];
                *(void *)int v51 = *(void *)v52;
                v51[8] = v52[8];
                uint64_t v53 = v6[8];
                uint64_t v54 = *(void **)&a1[v53];
                *(void *)&a1[v53] = *(void *)&a2[v53];

                uint64_t v55 = v6[9];
                uint64_t v56 = &a1[v55];
                uint64_t v57 = &a2[v55];
                *(void *)uint64_t v56 = *(void *)v57;
                v56[8] = v57[8];
                uint64_t v58 = v6[10];
                uint64_t v59 = &a1[v58];
                uint64_t v60 = &a2[v58];
                v59[8] = v60[8];
                *(void *)uint64_t v59 = *(void *)v60;
                goto LABEL_35;
              }
            }
            else
            {
              if (!v48)
              {
                (*(void (**)(char *, char *, uint64_t))(v172 + 40))(v45, v46, v16);
                goto LABEL_34;
              }
              (*(void (**)(char *, uint64_t))(v172 + 8))(v45, v16);
            }
            uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
            memcpy(v45, v46, *(void *)(*(void *)(v49 - 8) + 64));
            goto LABEL_34;
          }
          (*(void (**)(char *, uint64_t))(v172 + 8))(v39, v16);
        }
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v172 + 8))(a1, v16);
    }
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_22;
  }
  if (v10)
  {
LABEL_7:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_35;
  }
  uint64_t v11 = sub_2562E2FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v171 = v12;
  if (v13(a2, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a1, a2, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  uint64_t v20 = v6[5];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  if (v13(&a2[v20], 1, v11))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v171 + 32))(v21, v22, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v171 + 56))(v21, 0, 1, v11);
  }
  uint64_t v24 = v6[6];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  if (v13(&a2[v24], 1, v11))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v171 + 32))(v25, v26, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v171 + 56))(v25, 0, 1, v11);
  }
  uint64_t v28 = v6[7];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  *(void *)uint64_t v29 = *(void *)v30;
  v29[8] = v30[8];
  *(void *)&a1[v6[8]] = *(void *)&a2[v6[8]];
  uint64_t v31 = v6[9];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  v32[8] = v33[8];
  *(void *)uint64_t v32 = *(void *)v33;
  uint64_t v34 = v6[10];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  v35[8] = v36[8];
  *(void *)uint64_t v35 = *(void *)v36;
  (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_35:
  uint64_t v61 = a3[5];
  uint64_t v62 = &a1[v61];
  uint64_t v63 = &a2[v61];
  uint64_t v64 = sub_2562E2FD0();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 48);
  int v67 = v66(v62, 1, v64);
  int v68 = v66(v63, 1, v64);
  if (!v67)
  {
    if (!v68)
    {
      (*(void (**)(char *, char *, uint64_t))(v65 + 40))(v62, v63, v64);
      goto LABEL_41;
    }
    (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v64);
    goto LABEL_40;
  }
  if (v68)
  {
LABEL_40:
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    memcpy(v62, v63, *(void *)(*(void *)(v69 - 8) + 64));
    goto LABEL_41;
  }
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v62, v63, v64);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v62, 0, 1, v64);
LABEL_41:
  uint64_t v70 = a3[6];
  uint64_t v71 = &a1[v70];
  uint64_t v72 = &a2[v70];
  uint64_t v74 = *(void *)v72;
  uint64_t v73 = *((void *)v72 + 1);
  *(void *)uint64_t v71 = v74;
  *((void *)v71 + 1) = v73;
  swift_bridgeObjectRelease();
  uint64_t v75 = a3[7];
  uint64_t v76 = a3[8];
  uint64_t v77 = &a1[v75];
  uint64_t v78 = &a2[v75];
  *(_DWORD *)uint64_t v77 = *(_DWORD *)v78;
  v77[4] = v78[4];
  a1[v76] = a2[v76];
  uint64_t v79 = a3[9];
  int v80 = &a1[v79];
  uint64_t v81 = &a2[v79];
  uint64_t v83 = *(void *)v81;
  uint64_t v82 = *((void *)v81 + 1);
  *(void *)int v80 = v83;
  *((void *)v80 + 1) = v82;
  swift_bridgeObjectRelease();
  uint64_t v84 = a3[10];
  uint64_t v85 = a3[11];
  uint64_t v86 = &a1[v84];
  uint64_t v87 = &a2[v84];
  *(_DWORD *)uint64_t v86 = *(_DWORD *)v87;
  v86[4] = v87[4];
  uint64_t v88 = &a1[v85];
  uint64_t v89 = &a2[v85];
  *(_DWORD *)uint64_t v88 = *(_DWORD *)v89;
  v88[4] = v89[4];
  uint64_t v90 = a3[12];
  id v91 = &a1[v90];
  uint64_t v92 = &a2[v90];
  uint64_t v94 = *(void *)v92;
  uint64_t v93 = *((void *)v92 + 1);
  *(void *)id v91 = v94;
  *((void *)v91 + 1) = v93;
  swift_bridgeObjectRelease();
  uint64_t v95 = a3[13];
  uint64_t v96 = &a1[v95];
  uint64_t v97 = &a2[v95];
  uint64_t v99 = *(void *)v97;
  uint64_t v98 = *((void *)v97 + 1);
  *(void *)uint64_t v96 = v99;
  *((void *)v96 + 1) = v98;
  swift_bridgeObjectRelease();
  uint64_t v100 = a3[14];
  uint64_t v101 = a3[15];
  uint64_t v102 = &a1[v100];
  uint64_t v103 = &a2[v100];
  v102[4] = v103[4];
  *(_DWORD *)uint64_t v102 = *(_DWORD *)v103;
  uint64_t v104 = &a1[v101];
  uint64_t v105 = &a2[v101];
  v104[4] = v105[4];
  *(_DWORD *)uint64_t v104 = *(_DWORD *)v105;
  uint64_t v106 = a3[16];
  uint64_t v107 = *(void **)&a1[v106];
  *(void *)&a1[v106] = *(void *)&a2[v106];

  uint64_t v108 = a3[17];
  int v109 = *(void **)&a1[v108];
  *(void *)&a1[v108] = *(void *)&a2[v108];

  uint64_t v110 = a3[18];
  uint64_t v111 = &a1[v110];
  uint64_t v112 = &a2[v110];
  uint64_t v114 = *(void *)v112;
  uint64_t v113 = *((void *)v112 + 1);
  *(void *)uint64_t v111 = v114;
  *((void *)v111 + 1) = v113;
  swift_bridgeObjectRelease();
  uint64_t v115 = a3[19];
  uint64_t v116 = a3[20];
  id v117 = &a1[v115];
  uint64_t v118 = &a2[v115];
  *(_DWORD *)id v117 = *(_DWORD *)v118;
  v117[4] = v118[4];
  uint64_t v119 = &a1[v116];
  uint64_t v120 = &a2[v116];
  *(_DWORD *)uint64_t v119 = *(_DWORD *)v120;
  v119[4] = v120[4];
  uint64_t v121 = a3[21];
  uint64_t v122 = a3[22];
  uint64_t v123 = &a1[v121];
  uint64_t v124 = &a2[v121];
  *(_DWORD *)uint64_t v123 = *(_DWORD *)v124;
  v123[4] = v124[4];
  uint64_t v125 = &a1[v122];
  uint64_t v126 = &a2[v122];
  v125[4] = v126[4];
  *(_DWORD *)uint64_t v125 = *(_DWORD *)v126;
  uint64_t v127 = a3[23];
  uint64_t v128 = a3[24];
  uint64_t v129 = &a1[v127];
  uint64_t v130 = &a2[v127];
  *(_DWORD *)uint64_t v129 = *(_DWORD *)v130;
  v129[4] = v130[4];
  id v131 = &a1[v128];
  int v132 = &a2[v128];
  *(_DWORD *)id v131 = *(_DWORD *)v132;
  v131[4] = v132[4];
  uint64_t v133 = a3[25];
  uint64_t v134 = a3[26];
  uint64_t v135 = &a1[v133];
  int v136 = &a2[v133];
  *(_DWORD *)uint64_t v135 = *(_DWORD *)v136;
  v135[4] = v136[4];
  uint64_t v137 = &a1[v134];
  uint64_t v138 = &a2[v134];
  *(_DWORD *)uint64_t v137 = *(_DWORD *)v138;
  v137[4] = v138[4];
  uint64_t v139 = a3[27];
  uint64_t v140 = a3[28];
  uint64_t v141 = &a1[v139];
  v142 = &a2[v139];
  *(_DWORD *)uint64_t v141 = *(_DWORD *)v142;
  v141[4] = v142[4];
  v143 = &a1[v140];
  int v144 = &a2[v140];
  *(_DWORD *)v143 = *(_DWORD *)v144;
  v143[4] = v144[4];
  uint64_t v145 = a3[29];
  uint64_t v146 = a3[30];
  v147 = &a1[v145];
  int v148 = &a2[v145];
  *(_DWORD *)v147 = *(_DWORD *)v148;
  v147[4] = v148[4];
  uint64_t v149 = &a1[v146];
  v150 = &a2[v146];
  *(_DWORD *)uint64_t v149 = *(_DWORD *)v150;
  v149[4] = v150[4];
  uint64_t v151 = a3[31];
  uint64_t v152 = a3[32];
  uint64_t v153 = &a1[v151];
  v154 = &a2[v151];
  *(_DWORD *)uint64_t v153 = *(_DWORD *)v154;
  v153[4] = v154[4];
  v155 = &a1[v152];
  int v156 = &a2[v152];
  *(_DWORD *)v155 = *(_DWORD *)v156;
  v155[4] = v156[4];
  uint64_t v157 = a3[33];
  v158 = &a1[v157];
  v159 = &a2[v157];
  uint64_t v161 = *(void *)v159;
  uint64_t v160 = *((void *)v159 + 1);
  *(void *)v158 = v161;
  *((void *)v158 + 1) = v160;
  swift_bridgeObjectRelease();
  uint64_t v162 = a3[34];
  uint64_t v163 = a3[35];
  int v164 = &a1[v162];
  uint64_t v165 = &a2[v162];
  *(_DWORD *)int v164 = *(_DWORD *)v165;
  v164[4] = v165[4];
  *(void *)&a1[v163] = *(void *)&a2[v163];
  swift_bridgeObjectRelease();
  uint64_t v166 = a3[37];
  a1[a3[36]] = a2[a3[36]];
  *(void *)&a1[v166] = *(void *)&a2[v166];
  swift_bridgeObjectRelease();
  uint64_t v167 = a3[38];
  int v168 = &a1[v167];
  uint64_t v169 = &a2[v167];
  *(_DWORD *)int v168 = *(_DWORD *)v169;
  v168[4] = v169[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceUsageMetrics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2562DD2E4);
}

uint64_t sub_2562DD2E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceUsageMetrics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2562DD424);
}

uint64_t sub_2562DD424(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F54398);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for DeviceUsageMetrics(uint64_t a1)
{
  return sub_25622EF90(a1, (uint64_t *)&unk_269F55B08);
}

void sub_2562DD560()
{
  sub_256281D7C(319, (unint64_t *)&qword_269F54510, (void (*)(uint64_t))type metadata accessor for EventMetadata);
  if (v0 <= 0x3F)
  {
    sub_256281D7C(319, (unint64_t *)&qword_269F53EF8, MEMORY[0x270FA94D8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_2562DD6BC()
{
  return type metadata accessor for DeviceUsageMetricsBuilderImpl(0);
}

uint64_t type metadata accessor for DeviceUsageMetricsBuilderImpl(uint64_t a1)
{
  return sub_25622EF90(a1, (uint64_t *)&unk_269F55BD0);
}

void sub_2562DD6E4()
{
  sub_256281D7C(319, (unint64_t *)&qword_269F54510, (void (*)(uint64_t))type metadata accessor for EventMetadata);
  if (v0 <= 0x3F)
  {
    sub_256281D7C(319, (unint64_t *)&qword_269F53EF8, MEMORY[0x270FA94D8]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for DeviceUsageMetricsBuilderImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceUsageMetricsBuilderImpl);
}

uint64_t sub_2562DD858(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t SpeakerIdManifestCalculator.__allocating_init(defaults:logger:samplingUtils:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_2562E3020();
  *(void *)(v8 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_defaults) = a1;
  uint64_t v9 = v8 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger;
  uint64_t v10 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a2, v10);
  uint64_t v11 = (void *)(v8 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_samplingUtils);
  *uint64_t v11 = a3;
  v11[1] = a4;
  return v8;
}

uint64_t SpeakerIdManifestResult.speakerIdManifestEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SpeakerIdManifestResult.speakerIdManifestEvents.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*SpeakerIdManifestResult.speakerIdManifestEvents.modify())()
{
  return nullsub_1;
}

uint64_t SpeakerIdManifestCalculator.init(defaults:logger:samplingUtils:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2562E3020();
  *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_defaults) = a1;
  uint64_t v9 = v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger;
  uint64_t v10 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a2, v10);
  uint64_t v11 = (void *)(v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_samplingUtils);
  *uint64_t v11 = a3;
  v11[1] = a4;
  return v4;
}

uint64_t sub_2562DDA88(uint64_t a1)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = v1;
  return MEMORY[0x270FA2498](sub_2562DDAA8, 0, 0);
}

uint64_t sub_2562DDAA8()
{
  uint64_t v89 = v0;
  uint64_t v1 = sub_2562E3410();
  os_log_type_t v2 = sub_2562E37F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_256226000, v1, v2, "#SpeakerIdManifestCalculator: Sampling Calculator invoked", v3, 2u);
    MEMORY[0x25A2A5190](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 152);

  uint64_t v5 = *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_samplingUtils);
  uint64_t v6 = *(void *)(v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_samplingUtils + 8);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 64))(v5, v6);
  if (!v8)
  {
    uint64_t v17 = sub_2562E3410();
    os_log_type_t v18 = sub_2562E3800();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_25;
    }
    int v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v19 = 0;
    uint64_t v20 = "SpeakerIdSelectionCalculator: Unable to retrieve the siri language.";
LABEL_24:
    _os_log_impl(&dword_256226000, v17, v18, v20, v19, 2u);
    MEMORY[0x25A2A5190](v19, -1, -1);
    goto LABEL_25;
  }
  uint64_t v9 = v7;
  unint64_t v10 = v8;
  uint64_t v85 = v5;
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_2562E3410();
  os_log_type_t v12 = sub_2562E37F0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v82 = v6;
    uint64_t v13 = v9;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v87 = (uint8_t *)v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 136) = sub_256229738(v13, v10, (uint64_t *)&v87);
    sub_2562E38F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_256226000, v11, v12, "#SpeakerIdManifestCalculator: locale: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A5190](v15, -1, -1);
    uint64_t v16 = v14;
    uint64_t v9 = v13;
    uint64_t v6 = v82;
    MEMORY[0x25A2A5190](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 8))(v9, v10, v85, v6) != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_2562E3410();
    os_log_type_t v18 = sub_2562E37F0();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_25;
    }
    int v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v19 = 0;
    uint64_t v20 = "#SpeakerIdManifestCalculator: SSREnrollmentSelectionStatus is not samplingSelectionCollecting";
    goto LABEL_24;
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 16))(v9, v10, v85, v6);
  if (v22)
  {
    uint64_t v23 = v21;
    unint64_t v24 = v22;
    uint64_t v74 = v9;
    unint64_t v75 = v10;
    uint64_t v83 = (uint64_t *)(v0 + 112);
    uint64_t v87 = (uint8_t *)v21;
    unint64_t v88 = v22;
    swift_bridgeObjectRetain();
    sub_2562E3640();
    swift_bridgeObjectRetain();
    sub_2562E3640();
    swift_bridgeObjectRelease();
    buf = v87;
    unint64_t v78 = v88;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2562DE8EC(v23, v24);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 112) = v25;
    uint64_t v26 = sub_2562E3410();
    os_log_type_t v27 = sub_2562E37F0();
    uint64_t v81 = v23;
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 134217984;
      swift_beginAccess();
      uint64_t v25 = (void *)*v83;
      *(void *)(v0 + 128) = *(void *)(*v83 + 16);
      sub_2562E38F0();
      _os_log_impl(&dword_256226000, v26, v27, "#SpeakerIdManifestCalculator: Current Sample Count: %ld", v28, 0xCu);
      MEMORY[0x25A2A5190](v28, -1, -1);
    }
    uint64_t v84 = v0;
    uint64_t v29 = *(void *)(v0 + 152);

    uint64_t v87 = (uint8_t *)v23;
    unint64_t v88 = v24;
    unint64_t v80 = v24;
    swift_bridgeObjectRetain();
    sub_2562E3640();
    swift_bridgeObjectRetain();
    sub_2562E3640();
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void **)(v29 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_defaults);
    uint64_t v31 = (*(uint64_t (**)(uint8_t *, unint64_t, void *, uint64_t, uint64_t))(v6 + 120))(v87, v88, v30, v85, v6);
    swift_bridgeObjectRelease();
    uint64_t v76 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 104))(v30, v85, v6);
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 112))(v30, v85, v6);
    uint64_t v33 = v25[2];
    uint64_t v72 = v31;
    BOOL v34 = __OFADD__(v31, v33);
    uint64_t v35 = v31 + v33;
    if (v34)
    {
      __break(1u);
    }
    else
    {
      uint64_t v36 = result;
      if ((*(uint64_t (**)(uint8_t *, unint64_t, void *, uint64_t, uint64_t))(v6 + 96))(buf, v78, v30, v85, v6))
      {
        uint64_t result = swift_bridgeObjectRelease();
        if (v35 < v76)
        {
          swift_bridgeObjectRelease();
          if (v25[2] < v36)
          {
            swift_bridgeObjectRelease();
            uint64_t v37 = sub_2562E3410();
            os_log_type_t v38 = sub_2562E37F0();
            if (os_log_type_enabled(v37, v38))
            {
              uint64_t v39 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v39 = 0;
              _os_log_impl(&dword_256226000, v37, v38, "#SpeakerIdManifestCalculator: Not uploading until we have the privacy approved minimal count.", v39, 2u);
              MEMORY[0x25A2A5190](v39, -1, -1);
            }

            uint64_t v40 = 0;
            goto LABEL_39;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v86 = sub_2562DF66C(v23, v24, (uint64_t)v25, 1u);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v57 = sub_2562E3410();
          os_log_type_t v58 = sub_2562E37F0();
          if (os_log_type_enabled(v57, v58))
          {
            uint64_t v59 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v59 = 0;
            _os_log_impl(&dword_256226000, v57, v58, "#SpeakerIdManifestCalculator: Created ODSAMPLECOLLECTIONSTATUS_INTERMEDIATE_RESULT event", v59, 2u);
            MEMORY[0x25A2A5190](v59, -1, -1);
          }

          uint64_t v87 = (uint8_t *)v23;
          unint64_t v88 = v24;
          swift_bridgeObjectRetain();
          sub_2562E3640();
          swift_bridgeObjectRetain();
          sub_2562E3640();
          swift_bridgeObjectRelease();
          uint64_t v61 = (uint64_t)v87;
          uint64_t v60 = v88;
          uint64_t result = swift_beginAccess();
          uint64_t v62 = *(void *)(*v83 + 16);
          if (!__OFADD__(v72, v62))
          {
            _s16MetricsFramework13SamplingUtilsC23setManifestCurrentLimit6forKey_2inySS_SiSo14NSUserDefaultsCtFZ_0(v61, v60, v72 + v62, v30);
            swift_bridgeObjectRelease();
            sub_2562DFF84(v23, v24);
            swift_bridgeObjectRelease();
            uint64_t v40 = v86;
            goto LABEL_39;
          }
LABEL_48:
          __break(1u);
          return result;
        }
        if (!__OFSUB__(v35, v76))
        {
          swift_beginAccess();
          uint64_t v40 = sub_2562E05CC(v23, v24, v83, v35 - v76);
          swift_endAccess();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 48))(v74, v75, v85, v6);
          swift_bridgeObjectRelease();
LABEL_39:
          uint64_t v63 = sub_2562E3410();
          os_log_type_t v64 = sub_2562E37F0();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v65 = 0;
            _os_log_impl(&dword_256226000, v63, v64, "#SpeakerIdManifestCalculator: Sampling Calculator Completed", v65, 2u);
            MEMORY[0x25A2A5190](v65, -1, -1);
          }

          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269F55C18);
          uint64_t v66 = swift_allocObject();
          *(_OWORD *)(v66 + 16) = xmmword_2562E4C90;
          *(void *)(v66 + 32) = v40;
          uint64_t v87 = (uint8_t *)v66;
          sub_2562E3720();
          uint64_t v42 = (uint64_t)v87;
          swift_bridgeObjectRelease();
          uint64_t v0 = v84;
          goto LABEL_26;
        }
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      uint64_t v73 = v35;
      uint64_t v44 = sub_2562E2F80();
      uint64_t v45 = *(void *)(v44 - 8);
      uint64_t v46 = swift_task_alloc();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F53DB0);
      uint64_t v47 = swift_task_alloc();
      type metadata accessor for SamplingUtils();
      uint64_t v48 = v44;
      static SamplingUtils.getDeviceSelectionDate(forKey:defaults:)(v30, v47);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v47, 1, v44) == 1)
      {
        sub_25622F3C4(v47, &qword_269F53DB0);
        swift_task_dealloc();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v46, v47, v44);
        swift_task_dealloc();
        uint64_t v49 = v46;
        uint64_t v50 = swift_task_alloc();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v50, v49, v44);
        int v51 = sub_2562E3410();
        os_log_type_t v52 = sub_2562E37F0();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = (uint8_t *)swift_slowAlloc();
          uint64_t v79 = swift_slowAlloc();
          uint64_t v87 = (uint8_t *)v79;
          *(_DWORD *)uint64_t v53 = 136315138;
          sub_2562E2D08((unint64_t *)&qword_269F53E00, MEMORY[0x270FA92B8]);
          uint64_t v54 = sub_2562E3C80();
          *(void *)(v84 + 120) = sub_256229738(v54, v55, (uint64_t *)&v87);
          sub_2562E38F0();
          swift_bridgeObjectRelease();
          uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
          v56(v50, v48);
          _os_log_impl(&dword_256226000, v51, v52, "#SpeakerIdManifestCalculator: Sampling Period completed. Device Selection Date: %s", v53, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25A2A5190](v79, -1, -1);
          MEMORY[0x25A2A5190](v53, -1, -1);

          v56(v49, v48);
          swift_task_dealloc();
        }
        else
        {
          int v67 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
          v67(v50, v44);

          swift_task_dealloc();
          v67(v49, v44);
        }
      }
      uint64_t result = swift_task_dealloc();
      if (!__OFSUB__(v73, v76))
      {
        swift_beginAccess();
        int v68 = sub_2562E05CC(v81, v80, v83, v73 - v76);
        swift_endAccess();
        swift_bridgeObjectRelease();
        uint64_t v69 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v6 + 48);
        id v70 = v68;
        v69(v74, v75, v85, v6);
        uint64_t v0 = v84;
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269F55C18);
        uint64_t v71 = swift_allocObject();
        *(_OWORD *)(v71 + 16) = xmmword_2562E4C90;
        *(void *)(v71 + 32) = v68;
        uint64_t v87 = (uint8_t *)v71;
        sub_2562E3720();
        uint64_t v42 = (uint64_t)v87;

        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
    __break(1u);
    goto LABEL_47;
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_2562E3410();
  os_log_type_t v18 = sub_2562E3800();
  if (os_log_type_enabled(v17, v18))
  {
    int v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v19 = 0;
    uint64_t v20 = "SpeakerIdSelectionCalculator: Unable to retrieve the enrollmentId.";
    goto LABEL_24;
  }
LABEL_25:

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269F55C18);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_2562E4C90;
  *(void *)(v41 + 32) = 0;
  uint64_t v87 = (uint8_t *)v41;
  sub_2562E3720();
  uint64_t v42 = (uint64_t)v87;
LABEL_26:
  **(void **)(v0 + 144) = v42;
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

void *sub_2562DE8EC(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE88];
  }
  id v5 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  id v6 = objc_msgSend(v5, sel_OnDeviceAnalytics);
  swift_unknownObjectRelease();
  id v7 = objc_msgSend(v6, sel_SpeakerIdSampling);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_publisher);

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x263F8EE78];
  uint64_t v25 = (void (*)(void *))nullsub_1;
  uint64_t v26 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_2562DED5C;
  unint64_t v24 = &block_descriptor_14;
  unint64_t v10 = _Block_copy(&aBlock);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v2;
  uint64_t v25 = sub_2562E2DC8;
  uint64_t v26 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_2562DED5C;
  unint64_t v24 = &block_descriptor_20;
  os_log_type_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v13 = objc_msgSend(v8, sel_sinkWithCompletion_receiveInput_, v10, v12);
  _Block_release(v12);
  _Block_release(v10);

  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v14 = sub_2562E3410();
  os_log_type_t v15 = sub_2562E37F0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t aBlock = v17;
    *(_DWORD *)uint64_t v16 = 134218242;
    swift_beginAccess();
    if (*(void *)(v9 + 16) >> 62)
    {
      swift_bridgeObjectRetain();
      sub_2562E3AD0();
      swift_bridgeObjectRelease();
    }
    sub_2562E38F0();
    swift_release();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_256229738(a1, a2, &aBlock);
    sub_2562E38F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_256226000, v14, v15, "#SpeakerIdManifestCalculator: Fetched %ld samples with enrollmentId: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2A5190](v17, -1, -1);
    MEMORY[0x25A2A5190](v16, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  swift_beginAccess();
  unint64_t v19 = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log_type_t v18 = sub_2562E26D0(MEMORY[0x263F8EE88], v19, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v18;
}

void sub_2562DED60(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    uint64_t v4 = v3;
    swift_beginAccess();
    id v5 = v4;
    MEMORY[0x25A2A4400]();
    if (*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_2562E3730();
    sub_2562E3750();
    sub_2562E3720();
    swift_endAccess();
    id v6 = v5;
    id v7 = sub_2562E3410();
    os_log_type_t v8 = sub_2562E37F0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      unint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      uint64_t v11 = v6;
      sub_2562E38F0();
      void *v10 = v4;

      _os_log_impl(&dword_256226000, v7, v8, "#SpeakerIdManifestCalculator: Current eventBody: %@ from BiomeStream", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D48);
      swift_arrayDestroy();
      MEMORY[0x25A2A5190](v10, -1, -1);
      MEMORY[0x25A2A5190](v9, -1, -1);
    }
    else
    {

      id v7 = v6;
    }
  }
}

void sub_2562DEF4C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_2562DEFB4(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = a1;
  id v6 = *a2;
  id result = objc_msgSend(*a2, sel_enrollmentIdentifier);
  if (result)
  {
    os_log_type_t v8 = result;
    uint64_t v9 = sub_2562E3560();
    uint64_t v11 = v10;

    if (v9 == a3 && v11 == a4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v13 = sub_2562E3C90();
      id result = (id)swift_bridgeObjectRelease();
      if ((v13 & 1) == 0) {
        return result;
      }
    }
    id v14 = objc_msgSend(v6, sel_onDeviceSampleIdentifiers);
    uint64_t v15 = sub_2562E3700();

    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v56 = (void *)sub_2562E2FD0();
      uint64_t v17 = *(void *)(*(v56 - 1) + 64);
      os_log_type_t v52 = (char *)*(v56 - 1);
      uint64_t v54 = (uint64_t (**)(char *, char *, uint64_t))(v52 + 32);
      unint64_t v55 = (unsigned int (**)(char *, uint64_t, void *))(v52 + 48);
      uint64_t v18 = swift_bridgeObjectRetain();
      uint64_t v50 = v15;
      uint64_t v19 = v15 + 40;
      unint64_t v57 = MEMORY[0x263F8EE78];
      uint64_t v51 = v17;
      do
      {
        uint64_t v58 = v16;
        uint64_t v60 = (void (*)(char *, unint64_t, uint64_t))v49;
        MEMORY[0x270FA5388](v18);
        unint64_t v20 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
        MEMORY[0x270FA5388](v21 - 8);
        uint64_t v23 = (char *)v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
        swift_bridgeObjectRetain();
        sub_2562E2F90();
        swift_bridgeObjectRelease();
        unint64_t v24 = v56;
        if ((*v55)(v23, 1, v56) == 1)
        {
          uint64_t v59 = v49;
          uint64_t v18 = sub_25622F3C4((uint64_t)v23, &qword_269F53D68);
        }
        else
        {
          uint64_t v25 = *v54;
          uint64_t v26 = (*v54)((char *)v49 - v20, v23, (uint64_t)v24);
          uint64_t v59 = v49;
          MEMORY[0x270FA5388](v26);
          os_log_type_t v27 = (char *)v49 - v20;
          v25((char *)v49 - v20, (char *)v49 - v20, (uint64_t)v24);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v28 = v57;
          }
          else {
            unint64_t v28 = sub_25626BCB4(0, *(void *)(v57 + 16) + 1, 1, v57);
          }
          unint64_t v30 = *(void *)(v28 + 16);
          unint64_t v29 = *(void *)(v28 + 24);
          uint64_t v17 = v51;
          if (v30 >= v29 >> 1) {
            unint64_t v28 = sub_25626BCB4(v29 > 1, v30 + 1, 1, v28);
          }
          *(void *)(v28 + 16) = v30 + 1;
          unint64_t v31 = (v52[80] + 32) & ~(unint64_t)v52[80];
          unint64_t v57 = v28;
          uint64_t v18 = v25((char *)(v28 + v31 + *((void *)v52 + 9) * v30), v27, (uint64_t)v24);
        }
        v19 += 16;
        uint64_t v16 = v58 - 1;
      }
      while (v58 != 1);
      swift_bridgeObjectRelease_n();
      unint64_t v32 = v57;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v32 = MEMORY[0x263F8EE78];
    }
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    v49[0] = v49;
    MEMORY[0x270FA5388](v33 - 8);
    uint64_t v35 = (char *)v49 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = *(void *)(v32 + 16);
    unint64_t v57 = v32;
    if (v36)
    {
      uint64_t v37 = sub_2562E2FD0();
      uint64_t v38 = *(void *)(v37 - 8);
      unint64_t v39 = v32 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
      uint64_t v50 = *(void *)(v38 + 72);
      unint64_t v55 = (unsigned int (**)(char *, uint64_t, void *))(v38 + 56);
      uint64_t v60 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      uint64_t v59 = (void *)(v38 + 16);
      uint64_t v54 = (uint64_t (**)(char *, char *, uint64_t))(v38 + 48);
      uint64_t v51 = v38;
      v49[2] = v38 + 8;
      v49[3] = v38 + 32;
      swift_bridgeObjectRetain();
      os_log_type_t v52 = v35;
      while (1)
      {
        v60(v35, v39, v37);
        ((void (*)(char *, void, uint64_t, uint64_t))*v55)(v35, 0, 1, v37);
        uint64_t v40 = (*v54)(v35, (char *)1, v37);
        if (v40 == 1) {
          break;
        }
        uint64_t v56 = v49;
        uint64_t v41 = v51;
        uint64_t v42 = *(void *)(v51 + 64);
        MEMORY[0x270FA5388](v40);
        uint64_t v58 = v36;
        uint64_t v43 = (char *)v49 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v44 = (*(uint64_t (**)(char *, char *, uint64_t))(v41 + 32))(v43, v35, v37);
        uint64_t v45 = MEMORY[0x270FA5388](v44);
        MEMORY[0x270FA5388](v45);
        v60(v43, (unint64_t)v43, v37);
        sub_2562E0A24(v43, v43);
        uint64_t v46 = v58;
        uint64_t v47 = *(void (**)(char *, uint64_t))(v41 + 8);
        v47(v43, v37);
        uint64_t v35 = v52;
        v47(v43, v37);
        v39 += v50;
        uint64_t v36 = v46 - 1;
        if (!v36) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_28:
      uint64_t v48 = sub_2562E2FD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v35, 1, 1, v48);
    }
    return (id)swift_bridgeObjectRelease_n();
  }
  return result;
}

void *sub_2562DF66C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v9 = sub_2562E3430();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E800]), sel_init);
  if (v13)
  {
    id v14 = v13;
    v27[1] = sub_256231B4C(0, &qword_269F55C40);
    uint64_t v15 = v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger;
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v16(v12, v4 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger, v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2562DF934(a1, a2, a3, a4, (uint64_t)v12);
    uint64_t v18 = v17;
    objc_msgSend(v14, sel_setSpeakerIdModelSampleManifestReported_, v17);

    sub_256231B4C(0, (unint64_t *)&unk_269F53E40);
    v16(v12, v15, v9);
    id v19 = sub_2562365E0((uint64_t)v12);
    objc_msgSend(v14, sel_setEventMetadata_, v19);

    unint64_t v20 = sub_2562E3410();
    os_log_type_t v21 = sub_2562E37F0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_256226000, v20, v21, "#SpeakerIdManifestCalculator: Created ODSAMPLESiriSchemaODSAMPLEClientEvent for the device", v22, 2u);
      MEMORY[0x25A2A5190](v22, -1, -1);
    }
  }
  else
  {
    uint64_t v23 = sub_2562E3410();
    os_log_type_t v24 = sub_2562E3800();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_256226000, v23, v24, "#SpeakerIdManifestCalculator: Failed to generate event", v25, 2u);
      MEMORY[0x25A2A5190](v25, -1, -1);
    }

    return 0;
  }
  return v14;
}

void sub_2562DF934(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v46 = a5;
  unsigned int v47 = a4;
  uint64_t v48 = a2;
  v45[2] = a1;
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (!v6)
  {
LABEL_32:
    __break(1u);
    return;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)(a3 + 56);
  uint64_t v49 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
  v45[3] = v45;
  MEMORY[0x270FA5388](v12 - 8);
  v45[1] = v13;
  id v14 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v50 = (unint64_t)(v9 + 63) >> 6;
  id v15 = v7;
  int64_t v16 = 0;
  id v51 = v15;
  if (!v11) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v17 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = *(void *)(a3 + 48);
    uint64_t v23 = sub_2562E2FD0();
    uint64_t v24 = *(void *)(v23 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v24 + 16))(v14, v22 + *(void *)(v24 + 72) * i, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v14, 0, 1, v23);
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v14, 1, v23);
    if (v25 == 1)
    {
      swift_release();
      id v15 = v51;
      goto LABEL_25;
    }
    MEMORY[0x270FA5388](v25);
    os_log_type_t v27 = (char *)v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v27, v14, v23);
    id v28 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
    unint64_t v29 = (void *)sub_2562E2FB0();
    id v30 = objc_msgSend(v28, sel_initWithNSUUID_, v29);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    id v15 = v51;
    objc_msgSend(v51, sel_addOdsampleIds_, v30);

    if (v11) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v50) {
      goto LABEL_24;
    }
    unint64_t v20 = *(void *)(v49 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v50) {
        goto LABEL_24;
      }
      unint64_t v20 = *(void *)(v49 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v50) {
          goto LABEL_24;
        }
        unint64_t v20 = *(void *)(v49 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v11 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 < v50)
  {
    unint64_t v20 = *(void *)(v49 + 8 * v21);
    if (!v20)
    {
      while (1)
      {
        int64_t v16 = v21 + 1;
        if (__OFADD__(v21, 1)) {
          goto LABEL_31;
        }
        if (v16 >= v50) {
          goto LABEL_24;
        }
        unint64_t v20 = *(void *)(v49 + 8 * v16);
        ++v21;
        if (v20) {
          goto LABEL_19;
        }
      }
    }
    int64_t v16 = v21;
    goto LABEL_19;
  }
LABEL_24:
  uint64_t v31 = sub_2562E2FD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v14, 1, 1, v31);
  swift_release();
LABEL_25:
  objc_msgSend(v15, sel_setCollectionStatus_, v47);
  if (v48)
  {
    uint64_t v32 = sub_2562E2FD0();
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = MEMORY[0x270FA5388](v32);
    uint64_t v36 = (char *)v45 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x270FA5388](v34);
    uint64_t v38 = (char *)v45 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2562E2F90();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v38, 1, v32) == 1)
    {
      uint64_t v39 = sub_2562E3430();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v46, v39);

      sub_25622F3C4((uint64_t)v38, &qword_269F53D68);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v36, v38, v32);
      id v41 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v42 = (void *)sub_2562E2FB0();
      id v43 = objc_msgSend(v41, sel_initWithNSUUID_, v42);

      objc_msgSend(v15, sel_setUserSamplingId_, v43);
      uint64_t v44 = sub_2562E3430();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8))(v46, v44);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
    }
  }
  else
  {
    uint64_t v40 = sub_2562E3430();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v46, v40);
  }
}

void sub_2562DFF84(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_2562E3410();
    os_log_type_t v5 = sub_2562E37F0();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      aBlock[0] = v7;
      *(_DWORD *)id v6 = 136315138;
      swift_bridgeObjectRetain();
      sub_256229738(a1, a2, aBlock);
      sub_2562E38F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_256226000, v4, v5, "#SpeakerIdManifestCalculator: Pruning the uploaded samples for enrollmentId %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A5190](v7, -1, -1);
      MEMORY[0x25A2A5190](v6, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v10 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
    swift_unknownObjectRelease();
    id v11 = objc_msgSend(v10, sel_OnDeviceAnalytics);
    swift_unknownObjectRelease();
    id v12 = objc_msgSend(v11, sel_SpeakerIdSampling);
    swift_unknownObjectRelease();
    id v13 = objc_msgSend(v12, sel_pruner);
    id v14 = (void *)sub_2562E3550();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a1;
    *(void *)(v15 + 24) = a2;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = sub_2562E2C00;
    *(void *)(v16 + 24) = v15;
    aBlock[4] = (uint64_t)sub_2562E2C18;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2562E0570;
    aBlock[3] = (uint64_t)&block_descriptor_7;
    unint64_t v17 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_deleteWithPolicy_eventsPassingTest_, v14, v17);

    _Block_release(v17);
    LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v13)
    {
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_2562E3410();
      os_log_type_t v19 = sub_2562E37F0();
      if (os_log_type_enabled(v18, v19))
      {
        unint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        aBlock[0] = v21;
        *(_DWORD *)unint64_t v20 = 136315138;
        swift_bridgeObjectRetain();
        sub_256229738(a1, a2, aBlock);
        sub_2562E38F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_256226000, v18, v19, "#SpeakerIdManifestCalculator: Biome Samples Event pruning for enrollmentId %s completed", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2A5190](v21, -1, -1);
        MEMORY[0x25A2A5190](v20, -1, -1);
        swift_release();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    oslog = sub_2562E3410();
    os_log_type_t v8 = sub_2562E3800();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_256226000, oslog, v8, "#SpeakerIdManifestCalculator: Unable to prune the samples for the invalid enrollmentId", v9, 2u);
      MEMORY[0x25A2A5190](v9, -1, -1);
    }
  }
}

uint64_t sub_2562E04A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1
    && (id v6 = objc_msgSend(a1, sel_eventBody)) != 0
    && (uint64_t v7 = v6,
        id v8 = objc_msgSend(v6, sel_enrollmentIdentifier),
        v7,
        v8))
  {
    uint64_t v9 = sub_2562E3560();
    uint64_t v11 = v10;

    if (v9 == a3 && v11 == a4) {
      char v13 = 1;
    }
    else {
      char v13 = sub_2562E3C90();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_2562E0570(uint64_t a1, void *a2, uint64_t a3)
{
  os_log_type_t v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

void *sub_2562E05CC(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    sub_2562E2810(a4, *a3, (uint64_t)&v15);
    sub_2562E19E0((uint64_t)&v15);
    long long v23 = v15;
    char v24 = v16;
    sub_2562E2C5C((uint64_t)&v23);
    long long v21 = v17;
    char v22 = v18;
    sub_2562E2C5C((uint64_t)&v21);
    uint64_t v20 = v19;
    sub_256275D1C((uint64_t)&v20);
    uint64_t v7 = sub_2562E3410();
    os_log_type_t v8 = sub_2562E37F0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 134217984;
      sub_2562E38F0();
      _os_log_impl(&dword_256226000, v7, v8, "#SpeakerIdManifestCalculator: SpeakerIdManifestCalculator we have more than allowed samples, Dropping : %ld samples", v9, 0xCu);
      MEMORY[0x25A2A5190](v9, -1, -1);
    }
  }
  uint64_t v10 = sub_2562DF66C(a1, a2, *a3, 2u);
  sub_2562DFF84(a1, a2);
  uint64_t v11 = sub_2562E3410();
  os_log_type_t v12 = sub_2562E37F0();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v13 = 0;
    _os_log_impl(&dword_256226000, v11, v12, "#SpeakerIdManifestCalculator: Created ODSAMPLECOLLECTIONSTATUS_COMPLETED event", v13, 2u);
    MEMORY[0x25A2A5190](v13, -1, -1);
  }

  return v10;
}

uint64_t SpeakerIdManifestCalculator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_calendar;
  uint64_t v4 = sub_2562E3060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t SpeakerIdManifestCalculator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_logger;
  uint64_t v2 = sub_2562E3430();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MetricsFramework27SpeakerIdManifestCalculator_calendar;
  uint64_t v4 = sub_2562E3060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_2562E0974(uint64_t a1)
{
  uint64_t v4 = *v1;
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_25622844C;
  v5[18] = a1;
  v5[19] = v4;
  return MEMORY[0x270FA2498](sub_2562DDAA8, 0, 0);
}

uint64_t sub_2562E0A24(char *a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_2562E2FD0();
  sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
  swift_bridgeObjectRetain();
  uint64_t v37 = a2;
  uint64_t v8 = sub_2562E34C0();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  uint64_t v34 = v6 + 56;
  uint64_t v11 = v7 - 8;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    id v30 = v2;
    uint64_t v31 = a1;
    uint64_t v32 = ~v9;
    os_log_type_t v12 = *(void **)v11;
    v28[1] = v11 & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    unint64_t v29 = v12;
    char v13 = (void (*)(char *, unint64_t, uint64_t))v12[2];
    uint64_t v35 = v12 + 2;
    uint64_t v36 = v13;
    uint64_t v14 = v12[8];
    uint64_t v33 = v12[9];
    long long v15 = (uint64_t (**)(char *, uint64_t))(v12 + 1);
    while (1)
    {
      MEMORY[0x270FA5388](v8);
      uint64_t v16 = v6;
      uint64_t v17 = *(void *)(v6 + 48);
      unint64_t v18 = v33 * v10;
      v36((char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v33 * v10, v7);
      sub_2562E2D08(&qword_269F55BE8, MEMORY[0x270FA9528]);
      char v19 = sub_2562E3520();
      uint64_t v20 = *v15;
      uint64_t v8 = (*v15)((char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if (v19) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v32;
      uint64_t v6 = v16;
      if (((*(void *)(v34 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v30;
        a1 = v31;
        long long v21 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v20(v37, v7);
    v36(v31, *(void *)(*v30 + 48) + v18, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    long long v21 = *(void **)v11;
LABEL_7:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v23 = isUniquelyReferenced_nonNull_native;
    MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
    uint64_t v25 = (char *)v28 - v24;
    uint64_t v26 = v37;
    ((void (*)(char *, char *, uint64_t))v21[2])((char *)v28 - v24, v37, v7);
    uint64_t v38 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2562E1124((uint64_t)v25, v10, v23);
    *uint64_t v3 = v38;
    swift_bridgeObjectRelease();
    ((void (*)(char *, char *, uint64_t))v21[4])(a1, v26, v7);
    return 1;
  }
}

uint64_t sub_2562E0D5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F55C48);
  uint64_t v3 = sub_2562E39F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v38 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & v6;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        int64_t v40 = v11;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v37) {
          goto LABEL_33;
        }
        unint64_t v16 = v38[v15];
        int64_t v17 = v11 + 1;
        if (!v16)
        {
          int64_t v17 = v11 + 2;
          if (v11 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v16 = v38[v17];
          if (!v16)
          {
            int64_t v17 = v11 + 3;
            if (v11 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v16 = v38[v17];
            if (!v16)
            {
              uint64_t v18 = v11 + 4;
              if (v11 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v36;
                uint64_t v34 = 1 << *(unsigned char *)(v2 + 32);
                if (v34 > 63) {
                  bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v34;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v38[v18];
              if (!v16)
              {
                while (1)
                {
                  int64_t v17 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v17 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v38[v17];
                  ++v18;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v17 = v11 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        int64_t v40 = v17;
        unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      uint64_t v19 = sub_2562E2FD0();
      uint64_t v39 = &v35;
      uint64_t v20 = *(void *)(v19 - 8);
      MEMORY[0x270FA5388](v19);
      char v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = v2;
      uint64_t v24 = *(void *)(v2 + 48);
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 32);
      uint64_t v26 = *(void *)(v20 + 72);
      v25(v22, v24 + v26 * v14, v19);
      sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
      uint64_t result = sub_2562E34C0();
      uint64_t v27 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v33 = *(void *)(v9 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v12 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v4 + 48) + v12 * v26, v22, v19);
      ++*(void *)(v4 + 16);
      int64_t v11 = v40;
      uint64_t v2 = v23;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2562E1124(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  unint64_t v5 = *(void *)(*v3 + 16);
  unint64_t v6 = *(void *)(*v3 + 24);
  if (v6 > v5 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2562E0D5C();
  }
  else
  {
    if (v6 > v5)
    {
      sub_2562E1398();
      goto LABEL_12;
    }
    sub_2562E1640();
  }
  uint64_t v7 = *v3;
  uint64_t v8 = sub_2562E2FD0();
  sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
  uint64_t v9 = sub_2562E34C0();
  uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
  a2 = v9 & ~v10;
  uint64_t v27 = v7 + 56;
  uint64_t v28 = v7;
  if ((*(void *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v26 = ~v10;
    int64_t v11 = *(void **)(v8 - 8);
    unint64_t v12 = (void (*)(char *, unint64_t, uint64_t))v11[2];
    uint64_t v13 = v11[8];
    uint64_t v14 = v11[9];
    int64_t v15 = (uint64_t (**)(char *, uint64_t))(v11 + 1);
    do
    {
      MEMORY[0x270FA5388](v9);
      v12((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(v28 + 48) + v14 * a2, v8);
      sub_2562E2D08(&qword_269F55BE8, MEMORY[0x270FA9528]);
      char v16 = sub_2562E3520();
      uint64_t v9 = (*v15)((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      if (v16) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v26;
    }
    while (((*(void *)(v27 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v17 = *v25;
  *(void *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v18 = *(void *)(v17 + 48);
  uint64_t v19 = sub_2562E2FD0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * a2, v29, v19);
  uint64_t v21 = *(void *)(v17 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (!v22)
  {
    *(void *)(v17 + 16) = v23;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2562E3CC0();
  __break(1u);
  return result;
}

void *sub_2562E1398()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F55C48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2562E39E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v2 + 56);
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v6) {
    uint64_t result = memmove(result, v25, 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v2 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v12) {
      goto LABEL_28;
    }
    unint64_t v22 = *((void *)v25 + v21);
    ++v8;
    if (!v22)
    {
      int64_t v8 = v21 + 1;
      if (v21 + 1 >= v12) {
        goto LABEL_28;
      }
      unint64_t v22 = *((void *)v25 + v8);
      if (!v22)
      {
        int64_t v8 = v21 + 2;
        if (v21 + 2 >= v12) {
          goto LABEL_28;
        }
        unint64_t v22 = *((void *)v25 + v8);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v11 = (v22 - 1) & v22;
    unint64_t v14 = __clz(__rbit64(v22)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = sub_2562E2FD0();
    uint64_t v16 = *(void *)(v15 - 8);
    MEMORY[0x270FA5388](v15);
    uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v20 = *(void *)(v19 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, *(void *)(v2 + 48) + v20, v15);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(void *)(v4 + 48) + v20, v18, v15);
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v12)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v22 = *((void *)v25 + v23);
  if (v22)
  {
    int64_t v8 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v8 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_28;
    }
    unint64_t v22 = *((void *)v25 + v8);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2562E1640()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F55C48);
  uint64_t v3 = sub_2562E39F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = *(void *)(v2 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v6;
  int64_t v36 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v36) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v35 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v35 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v35 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = sub_2562E2FD0();
    int64_t v37 = &v34;
    uint64_t v19 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v18);
    int64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = v22;
    uint64_t v24 = v2;
    uint64_t v25 = *(void *)(v2 + 48);
    uint64_t v26 = *(void *)(v23 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v21, v25 + v26 * v14, v18);
    sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
    uint64_t result = sub_2562E34C0();
    uint64_t v27 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v9 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v12 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v19 + 32))(*(void *)(v4 + 48) + v12 * v26, v21, v18);
    ++*(void *)(v4 + 16);
    uint64_t v2 = v24;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v35 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v36) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v35 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2562E19E0(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 16))
  {
    uint64_t v2 = *(void *)result;
    uint64_t v3 = *(void *)(result + 8);
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v5 = *(void *)(result + 32);
    uint64_t v6 = *(void *)(result + 48);
    char v7 = *(unsigned char *)(result + 16);
    char v8 = *(unsigned char *)(result + 40);
    long long v41 = *(_OWORD *)(result + 24);
    char v42 = *(unsigned char *)(result + 40);
    uint64_t v40 = v6;
    char v39 = v7 & 1;
    char v38 = v8 & 1;
    char v37 = v7 & 1;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F53D68);
    v29[1] = v29;
    MEMORY[0x270FA5388](v9 - 8);
    v29[2] = v10;
    BOOL v32 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2562E2C9C(v2, v3, v7 & 1);
    uint64_t v33 = v3;
    uint64_t v34 = v2;
    sub_2562E2C9C(v2, v3, v7 & 1);
    sub_2562E2CA8((uint64_t)&v41);
    uint64_t result = sub_2562E2CDC((uint64_t)&v40);
    if ((v7 & 1) == 0)
    {
      uint64_t v30 = v5;
      uint64_t v31 = v6 + 56;
      uint64_t v11 = v34;
      uint64_t v35 = v4;
      uint64_t v36 = v33;
      while ((v38 & 1) == 0)
      {
        if (v36 != v5)
        {
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v11 == v4) {
          goto LABEL_18;
        }
        char v12 = v39;
        uint64_t v13 = sub_2562E2FD0();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v15 = *(void *)(v14 + 64);
        uint64_t result = MEMORY[0x270FA5388](v13);
        if (v12) {
          goto LABEL_29;
        }
        if (v11 < v34) {
          goto LABEL_23;
        }
        if (v5 != v33) {
          goto LABEL_24;
        }
        if (v11 >= v35) {
          goto LABEL_25;
        }
        if (v11 < 0 || v11 >= 1 << *(unsigned char *)(v6 + 32)) {
          goto LABEL_26;
        }
        if (((*(void *)(v31 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          goto LABEL_27;
        }
        if (*(_DWORD *)(v6 + 36) != v5) {
          goto LABEL_28;
        }
        (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(v6 + 48) + *(void *)(v14 + 72) * v11, v13);
        unint64_t v16 = *(void (**)(void))(v14 + 32);
        int64_t v17 = v32;
        v16();
        uint64_t v11 = sub_2562E25EC(v11, v36, 0, v6);
        uint64_t v36 = v18;
        char v37 = v19 & 1;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
        uint64_t v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v17, 1, v13);
        if (v20 == 1)
        {
          uint64_t v5 = v30;
          uint64_t v4 = v35;
          goto LABEL_20;
        }
        MEMORY[0x270FA5388](v20);
        int64_t v21 = v17;
        uint64_t v22 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v23 = ((uint64_t (*)(char *, char *, uint64_t))v16)(v22, v21, v13);
        MEMORY[0x270FA5388](v23);
        uint64_t v25 = (char *)v29 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_2562E1E5C((uint64_t)v22, (uint64_t)v25);
        sub_25622F3C4((uint64_t)v25, &qword_269F53D68);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v22, v13);
        uint64_t v5 = v30;
        uint64_t v4 = v35;
        if (v37) {
          break;
        }
      }
    }
    __break(1u);
LABEL_18:
    uint64_t v26 = sub_2562E2FD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v32, 1, 1, v26);
    uint64_t v11 = v4;
LABEL_20:
    char v27 = v38;
    char v28 = v37;
    sub_2562E2C90(v34, v33, v39);
    sub_2562E2C90(v4, v5, v27);
    swift_bridgeObjectRelease();
    return sub_2562E2C90(v11, v36, v28);
  }
  return result;
}

uint64_t sub_2562E1E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_2562E2FD0();
  sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
  swift_bridgeObjectRetain();
  uint64_t v36 = a1;
  uint64_t v7 = sub_2562E34C0();
  uint64_t v8 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v5;
  uint64_t v35 = v5 + 56;
  unint64_t v11 = *(void *)(v5 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8));
  uint64_t v12 = v6 - 8;
  if ((v11 >> v9))
  {
    uint64_t v30 = v2;
    uint64_t v31 = a2;
    uint64_t v32 = ~v8;
    uint64_t v13 = *(void **)v12;
    v27[1] = v12 & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    uint64_t v14 = v13[8];
    uint64_t v34 = v13[9];
    char v28 = v13;
    uint64_t v33 = (void (*)(char *, unint64_t, uint64_t))v13[2];
    unint64_t v29 = v13;
    uint64_t v15 = (void (**)(char *, uint64_t))(v13 + 1);
    while (1)
    {
      uint64_t v16 = MEMORY[0x270FA5388](v10);
      unint64_t v17 = v34 * v9;
      v33((char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(v16 + 48) + v34 * v9, v6);
      sub_2562E2D08(&qword_269F55BE8, MEMORY[0x270FA9528]);
      char v18 = sub_2562E3520();
      (*v15)((char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
      if (v18) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v32;
      uint64_t v10 = v16;
      if (((*(void *)(v35 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a2 = v31;
        char v19 = v28;
        return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19[7])(a2, 1, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    int64_t v21 = v30;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *v21;
    uint64_t v37 = *v21;
    uint64_t *v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2562E1398();
      uint64_t v23 = v37;
    }
    unint64_t v24 = *(void *)(v23 + 48) + v17;
    uint64_t v25 = v29;
    uint64_t v26 = v31;
    ((void (*)(uint64_t, unint64_t, uint64_t))v29[4])(v31, v24, v6);
    sub_2562E218C(v9);
    uint64_t *v21 = v37;
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v25[7])(v26, 0, 1, v6);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v19 = *(void **)v12;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19[7])(a2, 1, 1, v6);
  }
}

unint64_t sub_2562E218C(unint64_t result)
{
  unint64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v33 = v1;
    uint64_t v7 = ~v5;
    swift_retain();
    int64_t v8 = v2;
    uint64_t v9 = sub_2562E3980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v10 = (v9 + 1) & v7;
      unint64_t v11 = sub_2562E2FD0();
      unint64_t v40 = v11;
      uint64_t v12 = *(void **)(v11 - 8);
      uint64_t v13 = (void (*)(char *, unint64_t, unint64_t))v12[2];
      uint64_t v37 = v12 + 2;
      char v38 = v13;
      uint64_t v14 = v12[8];
      uint64_t v15 = v12[9];
      uint64_t v35 = v15;
      uint64_t v36 = v14;
      uint64_t v34 = (uint64_t (**)(char *, unint64_t))(v12 + 1);
      uint64_t v39 = v4;
      unint64_t v16 = v11;
      do
      {
        MEMORY[0x270FA5388](v11);
        uint64_t v18 = v7;
        char v19 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
        int64_t v20 = v15 * v6;
        v38(v19, *(void *)(v3 + 48) + v15 * v6, v16);
        uint64_t v21 = v3;
        sub_2562E2D08(&qword_269F55A80, MEMORY[0x270FA9528]);
        uint64_t v22 = sub_2562E34C0();
        uint64_t v23 = v19;
        uint64_t v7 = v18;
        unint64_t v11 = (*v34)(v23, v16);
        unint64_t v24 = v22 & v18;
        if (v8 >= (uint64_t)v10)
        {
          if (v24 >= v10 && v8 >= (uint64_t)v24)
          {
LABEL_16:
            uint64_t v3 = v21;
            uint64_t v27 = *(void *)(v21 + 48);
            uint64_t v15 = v35;
            int64_t v28 = v35 * v8;
            unint64_t v11 = v27 + v35 * v8;
            if (v35 * v8 < v20 || v11 >= v27 + v20 + v35)
            {
              unint64_t v11 = swift_arrayInitWithTakeFrontToBack();
              int64_t v8 = v6;
            }
            else
            {
              int64_t v8 = v6;
              if (v28 != v20)
              {
                unint64_t v11 = swift_arrayInitWithTakeBackToFront();
                int64_t v8 = v6;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v24 >= v10 || v8 >= (uint64_t)v24)
        {
          goto LABEL_16;
        }
        uint64_t v3 = v21;
        uint64_t v15 = v35;
LABEL_5:
        unint64_t v6 = (v6 + 1) & v18;
        uint64_t v4 = v39;
      }
      while (((*(void *)(v39 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v8) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v33;
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v29 = *v1;
  uint64_t v30 = *(void *)(*v1 + 16);
  BOOL v31 = __OFSUB__(v30, 1);
  uint64_t v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v29 + 16) = v32;
    ++*(_DWORD *)(v29 + 36);
  }
  return result;
}

uint64_t sub_2562E2464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_2562E254C(a2);
  if (v8) {
    goto LABEL_19;
  }
  int v9 = *(_DWORD *)(a2 + 36);
  if (v9 != v7)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v10 = 1 << *(unsigned char *)(a2 + 32);
  if (v10 < result)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 16))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  if (v9 != v11) {
    goto LABEL_15;
  }
  if (*(void *)a1 < result)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 40))
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v9 != v12) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(a1 + 24);
  if (v10 < v13)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *(void *)a3 = *(void *)a1;
  *(void *)(a3 + 8) = v11;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = v12;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = a2;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2562E254C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  int v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_2562E25EC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void *sub_2562E26D0(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = a1;
  unint64_t v8 = a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; uint64_t v9 = sub_2562E3AD0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v11 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2A4740](i - 4, a2) : *(id *)(a2 + 8 * i);
      unint64_t v8 = v11;
      uint64_t v12 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v14 = v11;
      sub_2562DEFB4((uint64_t)&v15, &v14, a3, a4);
      if (v4)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return v8;
      }

      if (v12 == v9)
      {
        swift_bridgeObjectRelease();
        return v15;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2562E2810@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result < 0)
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    uint64_t result = sub_2562E254C(a2);
    int64_t v6 = result;
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    if (v4)
    {
      uint64_t v11 = *(unsigned int *)(a2 + 36);
      uint64_t v12 = 1 << *(unsigned char *)(a2 + 32);
      while ((v10 & 1) == 0)
      {
        if (v11 != v8)
        {
          __break(1u);
          goto LABEL_16;
        }
        if (v6 == v12)
        {
          char v10 = 0;
          int64_t v6 = v12;
          uint64_t v8 = v11;
          goto LABEL_10;
        }
        uint64_t result = sub_2562E25EC(v6, v8, 0, a2);
        int64_t v6 = result;
        uint64_t v8 = v13;
        char v10 = v14 & 1;
        if (!--v4) {
          goto LABEL_10;
        }
      }
      goto LABEL_19;
    }
LABEL_10:
    uint64_t result = sub_2562E254C(a2);
    if (v10 & 1) != 0 || (v16) {
      goto LABEL_20;
    }
    if (v8 == v15)
    {
      if (v6 >= result)
      {
        v20[0] = result;
        v20[1] = v15;
        char v21 = 0;
        int64_t v22 = v6;
        uint64_t v23 = v8;
        char v24 = 0;
        uint64_t result = sub_2562E2464((uint64_t)v20, a2, (uint64_t)v18);
        long long v17 = v18[1];
        *(_OWORD *)a3 = v18[0];
        *(_OWORD *)(a3 + 16) = v17;
        *(_OWORD *)(a3 + 32) = v18[2];
        *(void *)(a3 + 48) = v19;
        return result;
      }
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SpeakerIdManifestResult()
{
  return &type metadata for SpeakerIdManifestResult;
}

uint64_t sub_2562E2954()
{
  return type metadata accessor for SpeakerIdManifestCalculator();
}

uint64_t type metadata accessor for SpeakerIdManifestCalculator()
{
  uint64_t result = qword_269F55C28;
  if (!qword_269F55C28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2562E29A8()
{
  uint64_t result = sub_2562E3430();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2562E3060();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SpeakerIdManifestCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpeakerIdManifestCalculator);
}

uint64_t dispatch thunk of SpeakerIdManifestCalculator.__allocating_init(defaults:logger:samplingUtils:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SpeakerIdManifestCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  int64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *int64_t v6 = v3;
  v6[1] = sub_25622844C;
  return v8(a1, a2);
}

uint64_t sub_2562E2BC8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2562E2C00(void *a1, uint64_t a2)
{
  return sub_2562E04A0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2562E2C08()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2562E2C18()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_2562E2C5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2562E2C90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2562E2C9C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2562E2CA8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2562E2CDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2562E2D08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2562E2D50()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2562E2D88()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2562E2DC8(void *a1)
{
  sub_2562DED60(a1, *(void *)(v1 + 16));
}

uint64_t sub_2562E2DE0()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_2562E2DF0()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_2562E2E00()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_2562E2E10()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2562E2E20()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_2562E2E30()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2562E2E40()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_2562E2E50()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2562E2E60()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_2562E2E70()
{
  return MEMORY[0x270EF02B8]();
}

uint64_t sub_2562E2E80()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_2562E2E90()
{
  return MEMORY[0x270F25428]();
}

uint64_t sub_2562E2EA0()
{
  return MEMORY[0x270F25430]();
}

uint64_t sub_2562E2EB0()
{
  return MEMORY[0x270F25438]();
}

uint64_t sub_2562E2EC0()
{
  return MEMORY[0x270F25440]();
}

uint64_t sub_2562E2ED0()
{
  return MEMORY[0x270EF0708]();
}

uint64_t sub_2562E2EE0()
{
  return MEMORY[0x270EF07C8]();
}

uint64_t sub_2562E2EF0()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_2562E2F00()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_2562E2F10()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_2562E2F20()
{
  return MEMORY[0x270EF09B0]();
}

uint64_t sub_2562E2F30()
{
  return MEMORY[0x270EF0AE8]();
}

uint64_t sub_2562E2F40()
{
  return MEMORY[0x270EF0B00]();
}

uint64_t sub_2562E2F50()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_2562E2F60()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_2562E2F70()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_2562E2F80()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_2562E2F90()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_2562E2FA0()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_2562E2FB0()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_2562E2FC0()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_2562E2FD0()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2562E2FE0()
{
  return MEMORY[0x270EF0D70]();
}

uint64_t sub_2562E2FF0()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_2562E3000()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_2562E3010()
{
  return MEMORY[0x270EF10F8]();
}

uint64_t sub_2562E3020()
{
  return MEMORY[0x270F25450]();
}

uint64_t sub_2562E3030()
{
  return MEMORY[0x270EF1390]();
}

uint64_t sub_2562E3040()
{
  return MEMORY[0x270EF13E0]();
}

uint64_t sub_2562E3050()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_2562E3060()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_2562E3070()
{
  return MEMORY[0x270EF1598]();
}

uint64_t sub_2562E3080()
{
  return MEMORY[0x270EF15C0]();
}

uint64_t sub_2562E3090()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_2562E30A0()
{
  return MEMORY[0x270F25478]();
}

uint64_t sub_2562E30B0()
{
  return MEMORY[0x270F254A0]();
}

uint64_t sub_2562E30C0()
{
  return MEMORY[0x270F254B0]();
}

uint64_t sub_2562E30D0()
{
  return MEMORY[0x270F254B8]();
}

uint64_t sub_2562E30E0()
{
  return MEMORY[0x270F254C8]();
}

uint64_t sub_2562E30F0()
{
  return MEMORY[0x270F254E0]();
}

uint64_t sub_2562E3100()
{
  return MEMORY[0x270F254F8]();
}

uint64_t sub_2562E3110()
{
  return MEMORY[0x270F25530]();
}

uint64_t sub_2562E3120()
{
  return MEMORY[0x270F25548]();
}

uint64_t sub_2562E3130()
{
  return MEMORY[0x270F25568]();
}

uint64_t sub_2562E3140()
{
  return MEMORY[0x270F25580]();
}

uint64_t sub_2562E3150()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2562E3160()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_2562E3170()
{
  return MEMORY[0x270F8C5C8]();
}

uint64_t sub_2562E3180()
{
  return MEMORY[0x270F8C5E0]();
}

uint64_t sub_2562E3190()
{
  return MEMORY[0x270F8C5E8]();
}

uint64_t sub_2562E31A0()
{
  return MEMORY[0x270F8C5F0]();
}

uint64_t sub_2562E31C0()
{
  return MEMORY[0x270F8C600]();
}

uint64_t sub_2562E31D0()
{
  return MEMORY[0x270F8C608]();
}

uint64_t sub_2562E31E0()
{
  return MEMORY[0x270F8C610]();
}

uint64_t sub_2562E31F0()
{
  return MEMORY[0x270F47298]();
}

uint64_t sub_2562E3200()
{
  return MEMORY[0x270F472A0]();
}

uint64_t sub_2562E3210()
{
  return MEMORY[0x270F472A8]();
}

uint64_t sub_2562E3220()
{
  return MEMORY[0x270F472B0]();
}

uint64_t sub_2562E3230()
{
  return MEMORY[0x270F255C8]();
}

uint64_t sub_2562E3240()
{
  return MEMORY[0x270F255D0]();
}

uint64_t sub_2562E3250()
{
  return MEMORY[0x270F255D8]();
}

uint64_t sub_2562E3260()
{
  return MEMORY[0x270F255E0]();
}

uint64_t sub_2562E3270()
{
  return MEMORY[0x270F25618]();
}

uint64_t sub_2562E3280()
{
  return MEMORY[0x270F25620]();
}

uint64_t sub_2562E3290()
{
  return MEMORY[0x270F25628]();
}

uint64_t sub_2562E32A0()
{
  return MEMORY[0x270F25630]();
}

uint64_t sub_2562E32B0()
{
  return MEMORY[0x270F25760]();
}

uint64_t sub_2562E32C0()
{
  return MEMORY[0x270F25778]();
}

uint64_t sub_2562E32D0()
{
  return MEMORY[0x270F25798]();
}

uint64_t sub_2562E32E0()
{
  return MEMORY[0x270F257B0]();
}

uint64_t sub_2562E32F0()
{
  return MEMORY[0x270F257B8]();
}

uint64_t sub_2562E3300()
{
  return MEMORY[0x270F257C0]();
}

uint64_t sub_2562E3310()
{
  return MEMORY[0x270F257F0]();
}

uint64_t sub_2562E3320()
{
  return MEMORY[0x270F25808]();
}

uint64_t sub_2562E3330()
{
  return MEMORY[0x270F25818]();
}

uint64_t sub_2562E3340()
{
  return MEMORY[0x270F25820]();
}

uint64_t sub_2562E3350()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2562E3360()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2562E3370()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_2562E3380()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2562E3390()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_2562E33A0()
{
  return MEMORY[0x270FA2D78]();
}

uint64_t sub_2562E33B0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_2562E33C0()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_2562E33D0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_2562E33E0()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_2562E33F0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_2562E3400()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_2562E3410()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2562E3420()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2562E3430()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2562E3440()
{
  return MEMORY[0x270FA0980]();
}

uint64_t sub_2562E3450()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_2562E3460()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_2562E3470()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_2562E3480()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2562E3490()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_2562E34A0()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_2562E34B0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2562E34C0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2562E34D0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2562E34E0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_2562E34F0()
{
  return MEMORY[0x270FA2B80]();
}

uint64_t sub_2562E3500()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2562E3510()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2562E3520()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2562E3530()
{
  return MEMORY[0x270EF1878]();
}

uint64_t sub_2562E3540()
{
  return MEMORY[0x270EF1880]();
}

uint64_t sub_2562E3550()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2562E3560()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2562E3570()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_2562E3580()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_2562E3590()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_2562E35A0()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_2562E35B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2562E35C0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2562E35E0()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_2562E35F0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2562E3600()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2562E3610()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2562E3620()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2562E3630()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2562E3640()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2562E3650()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2562E3660()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2562E3670()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2562E3690()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2562E36A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2562E36B0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2562E36C0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2562E36D0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2562E36E0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2562E36F0()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2562E3700()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2562E3710()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2562E3720()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2562E3730()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2562E3740()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2562E3750()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2562E3760()
{
  return MEMORY[0x270EF1BD0]();
}

uint64_t sub_2562E3770()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2562E3780()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2562E3790()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2562E37A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2562E37B0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2562E37C0()
{
  return MEMORY[0x270EF1C50]();
}

uint64_t sub_2562E37D0()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_2562E37E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2562E37F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2562E3800()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2562E3810()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2562E3820()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2562E3830()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2562E3840()
{
  return MEMORY[0x270FA0F08]();
}

uint64_t sub_2562E3850()
{
  return MEMORY[0x270F66280]();
}

uint64_t sub_2562E3860()
{
  return MEMORY[0x270F66288]();
}

uint64_t sub_2562E3870()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_2562E3880()
{
  return MEMORY[0x270FA1198]();
}

uint64_t sub_2562E3890()
{
  return MEMORY[0x270EF21B0]();
}

uint64_t sub_2562E38A0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2562E38B0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_2562E38C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2562E38D0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2562E38E0()
{
  return MEMORY[0x270EF23C0]();
}

uint64_t sub_2562E38F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2562E3900()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2562E3910()
{
  return MEMORY[0x270EF23E0]();
}

uint64_t sub_2562E3920()
{
  return MEMORY[0x270EF24A8]();
}

uint64_t sub_2562E3930()
{
  return MEMORY[0x270EF2558]();
}

uint64_t sub_2562E3940()
{
  return MEMORY[0x270EF2588]();
}

uint64_t sub_2562E3950()
{
  return MEMORY[0x270EF25A8]();
}

uint64_t sub_2562E3960()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_2562E3970()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2562E3980()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2562E3990()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2562E39A0()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_2562E39B0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2562E39C0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2562E39D0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2562E39E0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2562E39F0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2562E3A00()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2562E3A10()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2562E3A20()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2562E3A30()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2562E3A40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2562E3A50()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2562E3A60()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2562E3A70()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2562E3A80()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2562E3A90()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2562E3AA0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2562E3AB0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2562E3AC0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2562E3AD0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2562E3AE0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2562E3AF0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2562E3B00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2562E3B10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2562E3B20()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2562E3B30()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2562E3B40()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2562E3B50()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_2562E3B60()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2562E3B70()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_2562E3B80()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_2562E3B90()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2562E3BA0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2562E3BB0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2562E3BC0()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_2562E3BD0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_2562E3BE0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2562E3BF0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_2562E3C00()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2562E3C10()
{
  return MEMORY[0x270F9F410]();
}

uint64_t sub_2562E3C20()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_2562E3C30()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2562E3C40()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2562E3C50()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2562E3C60()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_2562E3C70()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_2562E3C80()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2562E3C90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2562E3CA0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2562E3CB0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2562E3CC0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2562E3CD0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2562E3CE0()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_2562E3CF0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2562E3D00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2562E3D10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2562E3D20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2562E3D30()
{
  return MEMORY[0x270EF26B0]();
}

uint64_t sub_2562E3D40()
{
  return MEMORY[0x270EF26E8]();
}

uint64_t sub_2562E3D50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2562E3D60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2562E3D70()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2562E3D80()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2562E3D90()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2562E3DA0()
{
  return MEMORY[0x270EF2768]();
}

uint64_t sub_2562E3DB0()
{
  return MEMORY[0x270EF2798]();
}

uint64_t sub_2562E3DC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2562E3DD0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2562E3E00()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD8](key, applicationID, keyExistsAndHasValidFormat);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}