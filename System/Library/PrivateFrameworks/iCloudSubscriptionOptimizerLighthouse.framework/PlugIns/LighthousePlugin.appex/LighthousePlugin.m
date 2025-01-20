uint64_t sub_100004F3C()
{
  uint64_t v0;

  v0 = sub_1000070B8();
  sub_100006C64(v0, qword_10000C6A8);
  sub_100006C2C(v0, (uint64_t)qword_10000C6A8);
  type metadata accessor for Plugin();
  sub_100005188(&qword_10000C610);
  return sub_1000070C8();
}

id Plugin.perform(_:)(void *a1)
{
  v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  sub_100005188(&qword_10000C560);
  __chkstk_darwin();
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007148();
  uint64_t v7 = sub_100007088();
  swift_allocObject();
  uint64_t v8 = sub_100007078();
  v17[4] = v7;
  v17[5] = &protocol witness table for CoreAnalyticsEventSink;
  v17[1] = v8;
  swift_allocObject();
  sub_100007138();
  sub_100007128();
  swift_release();
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = sub_1000071D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = a1;
  v11[6] = v9;
  v11[7] = ObjectType;
  id v12 = v2;
  id v13 = a1;
  v14 = v9;
  sub_100005790((uint64_t)v6, (uint64_t)&unk_10000C570, (uint64_t)v11);
  swift_release();
  sub_1000071E8();
  id v15 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

  return v15;
}

uint64_t sub_100005188(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000051CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a6;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_10000C580 + dword_10000C580);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 48) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_100005278;
  return v10(a5);
}

uint64_t sub_100005278(void *a1)
{
  *(void *)(*(void *)v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    v4 = sub_1000053F4;
  }
  else
  {

    v4 = sub_100005394;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100005394()
{
  sub_1000071F8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000053F4()
{
  if (qword_10000C6A0 != -1) {
    swift_once();
  }
  object = v0[3]._object;
  uint64_t v2 = sub_1000070B8();
  sub_100006C2C(v2, (uint64_t)qword_10000C6A8);
  sub_100007218(49);
  v0[1]._countAndFlagsBits = 0;
  v0[1]._object = (void *)0xE000000000000000;
  v6._object = (void *)0x8000000100007AE0;
  v6._countAndFlagsBits = 0xD00000000000002ELL;
  sub_1000071A8(v6);
  v0[2]._countAndFlagsBits = (uint64_t)object;
  sub_100005188((uint64_t *)&unk_10000C630);
  sub_100007228();
  v7._countAndFlagsBits = 46;
  v7._object = (void *)0xE100000000000000;
  sub_1000071A8(v7);
  sub_1000070A8(v0[1]);
  swift_bridgeObjectRelease();
  swift_errorRelease();
  sub_1000071F8();
  uint64_t v3 = (uint64_t (*)(void))v0->_object;
  return v3();
}

uint64_t sub_100005554()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000055A4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000569C;
  v4[5] = v3;
  Swift::String v7 = (uint64_t (*)(uint64_t))((char *)&dword_10000C580 + dword_10000C580);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[6] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100005278;
  return v7(v2);
}

uint64_t sub_10000569C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000071D8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000071C8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006F18(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000071B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t Plugin.performAsync(_:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C580 + dword_10000C580);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005A44;
  return v5(a1);
}

uint64_t sub_100005A44(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

id Plugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id Plugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, "init");
}

id Plugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005C2C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100005D08;
  return v6(a1);
}

uint64_t sub_100005D08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005E00(uint64_t a1)
{
  v1[2] = a1;
  v1[3] = sub_100007108();
  v1[4] = swift_task_alloc();
  v1[5] = swift_task_alloc();
  v1[6] = sub_1000070B8();
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_100005ED4, 0, 0);
}

id sub_100005ED4()
{
  uint64_t v58 = v0;
  id v1 = [*(id *)(v0 + 16) triClient];
  if (qword_10000C6A0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v4 = sub_100006C2C(*(void *)(v0 + 48), (uint64_t)qword_10000C6A8);
  sub_100006E70(v4, v2, (uint64_t (*)(void))&type metadata accessor for Logger);
  sub_100007218(41);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 0xD000000000000027;
  v55._object = (void *)0x8000000100007890;
  id v5 = [v3 triClient];
  id v6 = [v5 description];
  uint64_t v7 = sub_100007198();
  dispatch_semaphore_t v9 = v8;

  v60._countAndFlagsBits = v7;
  v60._object = v9;
  sub_1000071A8(v60);

  swift_bridgeObjectRelease();
  v61._countAndFlagsBits = 0xD000000000000027;
  v61._object = (void *)0x8000000100007890;
  sub_100007098(v61);
  swift_bridgeObjectRelease();
  sub_100006E10(v2, (uint64_t (*)(void))&type metadata accessor for Logger);
  [v1 refresh];
  NSString v10 = sub_100007188();
  id v11 = [v1 experimentIdentifiersWithNamespaceName:v10];

  sub_100006E70(v4, v2, (uint64_t (*)(void))&type metadata accessor for Logger);
  uint64_t v12 = *(void *)(v0 + 56);
  if (v11)
  {
    sub_100007218(23);
    swift_bridgeObjectRelease();
    id v54 = v11;
    id v13 = [v11 experimentId];
    uint64_t v14 = sub_100007198();
    v53 = v1;
    v16 = v15;

    v62._countAndFlagsBits = v14;
    v62._object = v16;
    sub_1000071A8(v62);
    swift_bridgeObjectRelease();
    v63._countAndFlagsBits = 0xD000000000000015;
    v63._object = (void *)0x8000000100007940;
    sub_100007098(v63);
    swift_bridgeObjectRelease();
    sub_100006E10(v12, (uint64_t (*)(void))&type metadata accessor for Logger);
    sub_100006E70(v4, v12, (uint64_t (*)(void))&type metadata accessor for Logger);
    sub_100007218(22);
    swift_bridgeObjectRelease();
    id v17 = [v11 treatmentId];
    uint64_t v18 = sub_100007198();
    v20 = v19;

    v64._countAndFlagsBits = v18;
    v64._object = v20;
    sub_1000071A8(v64);
    swift_bridgeObjectRelease();
    v65._countAndFlagsBits = 0xD000000000000014;
    v65._object = (void *)0x8000000100007960;
    sub_100007098(v65);
    swift_bridgeObjectRelease();
    sub_100006E10(v12, (uint64_t (*)(void))&type metadata accessor for Logger);
    sub_100006E70(v4, v12, (uint64_t (*)(void))&type metadata accessor for Logger);
    sub_100007218(23);
    swift_bridgeObjectRelease();
    v55._countAndFlagsBits = 0xD000000000000015;
    v55._object = (void *)0x8000000100007980;
    *(_DWORD *)(v0 + 64) = [v54 deploymentId];
    v66._countAndFlagsBits = sub_100007238();
    sub_1000071A8(v66);
    swift_bridgeObjectRelease();
    sub_100007098(v55);
    swift_bridgeObjectRelease();
    sub_100006E10(v12, (uint64_t (*)(void))&type metadata accessor for Logger);
    *(void *)(swift_task_alloc() + 16) = v54;
    sub_100006DB8();
    sub_100007068();
    swift_task_dealloc();
    NSString v21 = sub_100007188();
    NSString v22 = sub_100007188();
    id v23 = [v53 levelForFactor:v21 withNamespaceName:v22];

    if (v23)
    {
      id result = [v23 fileValue];
      if (result)
      {
        v25 = result;
        id v26 = [result path];

        if (!v26)
        {
          uint64_t v43 = *(void *)(v0 + 56);
          uint64_t v42 = *(void *)(v0 + 40);
          sub_100006E70(v4, v43, (uint64_t (*)(void))&type metadata accessor for Logger);
          v55._countAndFlagsBits = 0;
          v55._object = (void *)0xE000000000000000;
          sub_100007218(33);
          swift_bridgeObjectRelease();
          v71._countAndFlagsBits = 0xD000000000000042;
          v71._object = (void *)0x80000001000079F0;
          sub_1000070A8(v71);
          sub_100006E10(v43, (uint64_t (*)(void))&type metadata accessor for Logger);
          id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

          goto LABEL_16;
        }
        uint64_t v27 = sub_100007198();
        v29 = v28;

        strcpy((char *)&v55, "Recipe path: ");
        HIWORD(v55._object) = -4864;
        v67._countAndFlagsBits = v27;
        v67._object = v29;
        sub_1000071A8(v67);
        sub_100007098(v55);
        swift_bridgeObjectRelease();
        NSString v30 = sub_100007188();
        NSString v31 = sub_100007188();
        id v32 = [v53 levelForFactor:v30 withNamespaceName:v31];

        if (!v32)
        {
          uint64_t v44 = *(void *)(v0 + 56);
          uint64_t v42 = *(void *)(v0 + 40);
          swift_bridgeObjectRelease();
          sub_100006E70(v4, v44, (uint64_t (*)(void))&type metadata accessor for Logger);
          v55._countAndFlagsBits = 0;
          v55._object = (void *)0xE000000000000000;
          sub_100007218(38);
          swift_bridgeObjectRelease();
          v72._countAndFlagsBits = 0xD000000000000047;
          v72._object = (void *)0x8000000100007A40;
          sub_1000070A8(v72);
          sub_100006E10(v44, (uint64_t (*)(void))&type metadata accessor for Logger);
          id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

          goto LABEL_16;
        }
        id result = [v32 directoryValue];
        if (result)
        {
          v33 = result;
          id v34 = [result path];

          if (v34)
          {
            v52 = v32;
            uint64_t v36 = *(void *)(v0 + 32);
            uint64_t v35 = *(void *)(v0 + 40);
            uint64_t v51 = sub_100007198();
            v38 = v37;

            strcpy((char *)&v55, "Models path: ");
            HIWORD(v55._object) = -4864;
            v68._countAndFlagsBits = v51;
            v68._object = v38;
            sub_1000071A8(v68);
            sub_100007098(v55);
            swift_bridgeObjectRelease();
            sub_100006E70(v35, v36, (uint64_t (*)(void))&type metadata accessor for TrialSet);
            uint64_t v56 = sub_100007158();
            v57 = &protocol witness table for RealBiomeManager;
            v55._countAndFlagsBits = swift_allocObject();
            id v39 = [self defaultManager];
            sub_100007178();
            swift_allocObject();
            uint64_t v40 = sub_100007168();
            uint64_t v47 = *(void *)(v0 + 40);
            uint64_t v48 = (*(uint64_t (**)(void))(*(void *)v40 + 216))();
            sub_100006ED8(v48);
            id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

            swift_release();
            uint64_t v50 = v47;
LABEL_17:
            sub_100006E10(v50, (uint64_t (*)(void))&type metadata accessor for TrialSet);
            goto LABEL_18;
          }
          uint64_t v45 = *(void *)(v0 + 56);
          uint64_t v42 = *(void *)(v0 + 40);
          swift_bridgeObjectRelease();
          sub_100006E70(v4, v45, (uint64_t (*)(void))&type metadata accessor for Logger);
          v55._countAndFlagsBits = 0;
          v55._object = (void *)0xE000000000000000;
          sub_100007218(32);
          swift_bridgeObjectRelease();
          v73._countAndFlagsBits = 0xD000000000000041;
          v73._object = (void *)0x8000000100007A90;
          sub_1000070A8(v73);
          sub_100006E10(v45, (uint64_t (*)(void))&type metadata accessor for Logger);
          id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

LABEL_16:
          uint64_t v50 = v42;
          goto LABEL_17;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return result;
    }
    uint64_t v41 = *(void *)(v0 + 56);
    uint64_t v42 = *(void *)(v0 + 40);
    sub_100006E70(v4, v41, (uint64_t (*)(void))&type metadata accessor for Logger);
    v55._countAndFlagsBits = 0;
    v55._object = (void *)0xE000000000000000;
    sub_100007218(34);
    swift_bridgeObjectRelease();
    v70._countAndFlagsBits = 0xD000000000000043;
    v70._object = (void *)0x80000001000079A0;
    sub_1000070A8(v70);
    sub_100006E10(v41, (uint64_t (*)(void))&type metadata accessor for Logger);
    id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

    goto LABEL_16;
  }
  v55._countAndFlagsBits = 0;
  v55._object = (void *)0xE000000000000000;
  sub_100007218(37);
  swift_bridgeObjectRelease();
  v69._countAndFlagsBits = 0xD000000000000046;
  v69._object = (void *)0x80000001000078F0;
  sub_1000070A8(v69);
  sub_100006E10(v12, (uint64_t (*)(void))&type metadata accessor for Logger);
  id v49 = [objc_allocWithZone((Class)MLRTrialTaskResult) init];

LABEL_18:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v46 = *(uint64_t (**)(id))(v0 + 8);
  return (id)v46(v49);
}

void _s16LighthousePlugin0B0C4stopyyF_0()
{
  sub_100007118();
  id v0 = [self mainRunLoop];
  sub_100007208();

  if (qword_10000C6A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000070B8();
  sub_100006C2C(v1, (uint64_t)qword_10000C6A8);
  sub_100007218(62);
  v2._object = (void *)0x8000000100007850;
  v2._countAndFlagsBits = 0xD000000000000035;
  sub_1000071A8(v2);
  sub_100007228();
  v3._countAndFlagsBits = 0x2E5D7363657320;
  v3._object = (void *)0xE700000000000000;
  sub_1000071A8(v3);
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_1000070A8(v4);
  swift_bridgeObjectRelease();
  exit(1);
}

uint64_t type metadata accessor for Plugin()
{
  return self;
}

uint64_t sub_100006C2C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006C64(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006CC8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = [v1 experimentId];
  sub_100007198();

  sub_1000070F8();
  id v3 = [v1 treatmentId];
  sub_100007198();

  sub_1000070D8();
  [v1 deploymentId];
  sub_100007238();
  return sub_1000070E8();
}

unint64_t sub_100006DB8()
{
  unint64_t result = qword_10000C618;
  if (!qword_10000C618)
  {
    sub_100007108();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C618);
  }
  return result;
}

uint64_t sub_100006E10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006E70(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006ED8(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006F18(uint64_t a1)
{
  uint64_t v2 = sub_100005188(&qword_10000C560);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006F78()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006FB0(uint64_t a1)
{
  Swift::String v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000569C;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C620 + dword_10000C620);
  return v6(a1, v4);
}

uint64_t sub_100007068()
{
  return static Message.with(_:)();
}

uint64_t sub_100007078()
{
  return CoreAnalyticsEventSink.init()();
}

uint64_t sub_100007088()
{
  return type metadata accessor for CoreAnalyticsEventSink();
}

void sub_100007098(Swift::String a1)
{
}

void sub_1000070A8(Swift::String a1)
{
}

uint64_t sub_1000070B8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000070C8()
{
  return Logger.init<A>(_:)();
}

uint64_t sub_1000070D8()
{
  return TrialSet.treatmentID.setter();
}

uint64_t sub_1000070E8()
{
  return TrialSet.deploymentID.setter();
}

uint64_t sub_1000070F8()
{
  return TrialSet.experimentID.setter();
}

uint64_t sub_100007108()
{
  return type metadata accessor for TrialSet();
}

uint64_t sub_100007118()
{
  return TimeDelta.init(millis:secs:mins:hours:days:weeks:)();
}

uint64_t sub_100007128()
{
  return static DaemonEvents.initSharedInstance(_:)();
}

uint64_t sub_100007138()
{
  return DaemonEvents.init(withSink:)();
}

uint64_t sub_100007148()
{
  return type metadata accessor for DaemonEvents();
}

uint64_t sub_100007158()
{
  return type metadata accessor for RealBiomeManager();
}

uint64_t sub_100007168()
{
  return ShadowModeMain.init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)();
}

uint64_t sub_100007178()
{
  return type metadata accessor for ShadowModeMain();
}

NSString sub_100007188()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007198()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_1000071A8(Swift::String a1)
{
}

uint64_t sub_1000071B8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000071C8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000071D8()
{
  return type metadata accessor for TaskPriority();
}

void sub_1000071E8()
{
}

Swift::Int sub_1000071F8()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100007208()
{
  return NSRunLoop.runFor(_:)();
}

void sub_100007218(Swift::Int a1)
{
}

uint64_t sub_100007228()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100007238()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void exit(int a1)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
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