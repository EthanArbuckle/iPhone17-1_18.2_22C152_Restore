void sub_100004BDC(id a1)
{
  exit(-1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

uint64_t variable initialization expression of PrintActivityObject.currentActivity()
{
  return 0;
}

void *variable initialization expression of PrintActivityObject.pendingJobs()
{
  return &_swiftEmptyArrayStorage;
}

Swift::Void __swiftcall PrintActivityObject.startPrintActivity()()
{
  uint64_t v1 = sub_10000A3A0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005488(&qword_1000109A0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005488(&qword_1000109A8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t *)&v0[OBJC_IVAR___PrintActivityObject_currentActivity];
  uint64_t v13 = swift_beginAccess();
  if (!*v12)
  {
    uint64_t v43 = v9;
    uint64_t v44 = v8;
    uint64_t v45 = v2;
    uint64_t v46 = v1;
    v47 = v0;
    nullsub_1(v13);
    sub_100008D10(0, 0xE000000000000000, 0, 0, 0, 0xE000000000000000, v51);
    sub_100005488(&qword_1000109B8);
    uint64_t v14 = sub_10000A350();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(void *)(v15 + 72);
    unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v18 = swift_allocObject();
    v40 = v7;
    *(_OWORD *)(v18 + 16) = xmmword_10000AB30;
    v19 = (void *)(v18 + v17);
    unint64_t v41 = 0x800000010000B660;
    void *v19 = 0xD000000000000015;
    v19[1] = 0x800000010000B660;
    v42 = v4;
    v20 = *(void (**)(void))(v15 + 104);
    ((void (*)(void *, void, uint64_t))v20)(v19, enum case for ActivityContentSource.Request.process(_:), v14);
    v21 = (void *)((char *)v19 + v16);
    void *v21 = 0xD00000000000001ELL;
    v21[1] = 0x800000010000B680;
    v20();
    sub_100005488(&qword_1000109C0);
    long long aBlock = v51[0];
    long long v49 = v51[1];
    long long v50 = v51[2];
    uint64_t v22 = sub_10000A330();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v40, 1, 1, v22);
    sub_1000054CC();
    sub_100005520();
    sub_100005574();
    v23 = v42;
    sub_10000A3B0();
    sub_10000A380();
    sub_10000A390();
    uint64_t v24 = sub_10000A340();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v46);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    uint64_t *v12 = v24;
    swift_release();
    v25 = v47;
    sub_1000055C8();
    v26 = self;
    id v27 = [v26 defaultCenter];
    uint64_t v28 = PKJobListNotification;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v25;
    *(void *)&long long v50 = sub_1000058AC;
    *((void *)&v50 + 1) = v29;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v49 = sub_1000058D0;
    *((void *)&v49 + 1) = &unk_10000C5C0;
    v30 = _Block_copy(&aBlock);
    id v31 = v25;
    swift_release();
    id v32 = [v27 addObserverForName:v28 object:0 queue:0 usingBlock:v30];
    _Block_release(v30);
    swift_unknownObjectRelease();

    id v33 = [v26 defaultCenter];
    uint64_t v34 = PKJobProgressNotification;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v31;
    *(void *)&long long v50 = sub_1000059DC;
    *((void *)&v50 + 1) = v35;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v49 = sub_1000058D0;
    *((void *)&v49 + 1) = &unk_10000C610;
    v36 = _Block_copy(&aBlock);
    id v37 = v31;
    swift_release();
    id v38 = [v33 addObserverForName:v34 object:0 queue:0 usingBlock:v36];
    _Block_release(v36);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_100005488(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000054CC()
{
  unint64_t result = qword_1000109C8;
  if (!qword_1000109C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000109C8);
  }
  return result;
}

unint64_t sub_100005520()
{
  unint64_t result = qword_1000109D0;
  if (!qword_1000109D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000109D0);
  }
  return result;
}

unint64_t sub_100005574()
{
  unint64_t result = qword_1000109D8;
  if (!qword_1000109D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000109D8);
  }
  return result;
}

uint64_t sub_1000055C8()
{
  uint64_t v1 = sub_10000A3E0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000A400();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(void *)&v0[OBJC_IVAR___PrintActivityObject_workQueue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_10000810C;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000073E8;
  aBlock[3] = &unk_10000C770;
  uint64_t v10 = _Block_copy(aBlock);
  v11 = v0;
  sub_10000A3F0();
  v13[1] = &_swiftEmptyArrayStorage;
  sub_100008114(&qword_100010A90, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005488(&qword_100010A98);
  sub_10000815C(&qword_100010AA0, &qword_100010A98);
  sub_10000A4B0();
  sub_10000A480();
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_100005874()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000058AC()
{
  return sub_1000055C8();
}

uint64_t sub_1000058D0(uint64_t a1)
{
  uint64_t v2 = sub_10000A320();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_10000A310();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000059C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000059D4()
{
  return swift_release();
}

uint64_t sub_1000059DC()
{
  return sub_100005A00();
}

uint64_t sub_100005A00()
{
  uint64_t v1 = sub_100005488(&qword_1000109E8);
  __chkstk_darwin(v1 - 8);
  v40 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005488(&qword_1000109A0);
  __chkstk_darwin(v3 - 8);
  v35[0] = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005488(&qword_1000109A8);
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v35[1] = v7;
  v36 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v37 = (char *)v35 - v8;
  unint64_t v9 = *(void *)(v0 + OBJC_IVAR___PrintActivityObject_pendingJobs);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_10000A4E0();
    uint64_t v10 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v10) {
      goto LABEL_10;
    }
  }
  if (v10 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v13 = (id)sub_10000A4D0();
    }
    else {
      id v13 = *(id *)(v9 + 8 * v12 + 32);
    }
    uint64_t v14 = v13;
    ++v12;
    [v13 update];
    sub_100007E58(0, &qword_100010A70);
    sub_100007E94();
    sub_10000A3C0();
    sub_10000A3D0();

    swift_release();
  }
  while (v10 != v12);
LABEL_10:
  swift_bridgeObjectRelease_n();
  uint64_t v15 = (uint64_t *)(v0 + OBJC_IVAR___PrintActivityObject_currentActivity);
  uint64_t result = swift_beginAccess();
  uint64_t v16 = *v15;
  if (*v15)
  {
    swift_retain();
    unint64_t v17 = sub_100006C10();
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_10000A0BC();
      id v20 = v18;
      id v21 = sub_10000A110();

      if (v19 && v21)
      {
        id v22 = v20;
        uint64_t v23 = sub_100009ED0();
        uint64_t v25 = v24;

        sub_100008D10(v23, v25, v19, (uint64_t)v21, 0, 0xE000000000000000, v41);
        uint64_t v26 = sub_10000A330();
        (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v35[0], 1, 1, v26);
        sub_1000054CC();
        sub_100005520();
        sub_100005574();
        id v27 = v37;
        sub_10000A3B0();
        uint64_t v28 = sub_10000A450();
        uint64_t v29 = (uint64_t)v40;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v40, 1, 1, v28);
        uint64_t v31 = v38;
        uint64_t v30 = v39;
        id v32 = v36;
        (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v36, v27, v39);
        unint64_t v33 = (*(unsigned __int8 *)(v31 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
        uint64_t v34 = (char *)swift_allocObject();
        *((void *)v34 + 2) = 0;
        *((void *)v34 + 3) = 0;
        *((void *)v34 + 4) = v16;
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(&v34[v33], v32, v30);
        swift_retain();
        sub_100006868(v29, (uint64_t)&unk_100010A88, (uint64_t)v34);

        swift_release();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v27, v30);
      }
    }
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall PrintActivityObject.stopPrintActivity()()
{
  uint64_t v1 = sub_100005488(&qword_1000109E8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self defaultCenter];
  [v4 removeObserver:v0];

  *(void *)&v0[OBJC_IVAR___PrintActivityObject_pendingJobs] = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_10000A450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  uint64_t v7 = v0;
  sub_100006868((uint64_t)v3, (uint64_t)&unk_100010A00, (uint64_t)v6);
  swift_release();
}

uint64_t sub_100006058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a4;
  uint64_t v5 = sub_10000A370();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  sub_100005488(&qword_100010A68);
  v4[15] = swift_task_alloc();
  sub_100005488(&qword_1000109A0);
  v4[16] = swift_task_alloc();
  uint64_t v6 = sub_100005488(&qword_1000109A8);
  v4[17] = v6;
  v4[18] = *(void *)(v6 - 8);
  v4[19] = swift_task_alloc();
  return _swift_task_switch(sub_1000061D8, 0, 0);
}

uint64_t sub_1000061D8()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[11];
  sub_100008D10(0, 0xE000000000000000, 0, 0, 0, 0xE000000000000000, v0 + 2);
  uint64_t v3 = sub_10000A330();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  sub_1000054CC();
  sub_100005520();
  sub_100005574();
  sub_10000A3B0();
  id v4 = (uint64_t *)(v2 + OBJC_IVAR___PrintActivityObject_currentActivity);
  swift_beginAccess();
  uint64_t v5 = *v4;
  v0[20] = v5;
  uint64_t v7 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v8 = v0[17];
  if (v5)
  {
    uint64_t v9 = v0[15];
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v6, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v8);
    swift_retain();
    sub_10000A360();
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                   + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
    uint64_t v10 = (void *)swift_task_alloc();
    v0[21] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_100006460;
    uint64_t v11 = v0[14];
    uint64_t v12 = v0[15];
    return v15(v12, v11);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 8))(v0[19], v0[17]);
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_100006460()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 120);
  uint64_t v2 = *(void *)(*(void *)v0 + 112);
  uint64_t v3 = *(void *)(*(void *)v0 + 104);
  uint64_t v4 = *(void *)(*(void *)v0 + 96);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_100007DFC(v1, &qword_100010A68);
  return _swift_task_switch(sub_100006600, 0, 0);
}

uint64_t sub_100006600()
{
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000066A0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000066E0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100006774;
  return sub_100006058((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100006774()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A450();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000A440();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007DFC(a1, &qword_1000109E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000A430();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100006A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A450();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000A440();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007DFC(a1, &qword_1000109E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000A430();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_100005488(&qword_100010AC8);
  return swift_task_create();
}

void *sub_100006C10()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR___PrintActivityObject_pendingJobs);
  if (v1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (v2)
  {
    while (1)
    {
      id v3 = (v1 & 0xC000000000000001) != 0 ? (id)sub_10000A4D0() : *(id *)(v1 + 32);
      uint64_t v4 = v3;
      if (sub_100009EA4()) {
        break;
      }

      if (v2 != 1)
      {
        uint64_t v5 = 5;
        while (1)
        {
          id v6 = (v1 & 0xC000000000000001) != 0 ? (id)sub_10000A4D0() : *(id *)(v1 + 8 * v5);
          uint64_t v4 = v6;
          uint64_t v7 = v5 - 3;
          if (__OFADD__(v5 - 4, 1)) {
            break;
          }
          if (sub_100009EA4()) {
            goto LABEL_6;
          }

          ++v5;
          if (v7 == v2) {
            goto LABEL_15;
          }
        }
        __break(1u);
LABEL_18:
        swift_bridgeObjectRetain_n();
        uint64_t v2 = sub_10000A4E0();
        if (v2) {
          continue;
        }
      }
      goto LABEL_15;
    }
LABEL_6:
    swift_bridgeObjectRelease_n();
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  return v4;
}

void sub_100006D3C(char *a1)
{
  sub_100005488(&qword_1000109E8);
  ((void (*)(void))__chkstk_darwin)();
  id v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005488(&qword_1000109A0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (void *)sub_100005488(&qword_1000109A8);
  uint64_t v7 = *(v6 - 1);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - v11;
  id v13 = [self jobs];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_100007E58(0, &qword_100010A70);
    uint64_t v15 = (void *)sub_10000A420();
  }
  else
  {
    uint64_t v15 = &_swiftEmptyArrayStorage;
  }
  *(void *)&a1[OBJC_IVAR___PrintActivityObject_pendingJobs] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_100006C10();
  if (v16)
  {
    unint64_t v17 = v16;
    uint64_t v36 = v7;
    uint64_t v18 = sub_10000A0BC();
    id v37 = v17;
    id v19 = sub_10000A110();

    if (v18)
    {
      id v20 = v37;
      if (v19)
      {
        id v21 = v37;
        id v37 = v6;
        id v22 = v21;
        uint64_t v23 = sub_100009ED0();
        uint64_t v35 = v3;
        uint64_t v25 = v24;

        sub_100008D10(v23, v25, v18, (uint64_t)v19, 0, 0xE000000000000000, v38);
        uint64_t v26 = sub_10000A330();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v5, 1, 1, v26);
        sub_1000054CC();
        sub_100005520();
        sub_100005574();
        sub_10000A3B0();
        uint64_t v27 = sub_10000A450();
        uint64_t v28 = (uint64_t)v35;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v35, 1, 1, v27);
        uint64_t v29 = v36;
        id v30 = v37;
        (*(void (**)(char *, char *, id))(v36 + 16))(v10, v12, v37);
        unint64_t v31 = (*(unsigned __int8 *)(v29 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
        id v32 = (char *)swift_allocObject();
        *((void *)v32 + 2) = 0;
        *((void *)v32 + 3) = 0;
        *((void *)v32 + 4) = a1;
        (*(void (**)(char *, char *, id))(v29 + 32))(&v32[v31], v10, v30);
        unint64_t v33 = a1;
        sub_100006A14(v28, (uint64_t)&unk_100010AB0, (uint64_t)v32);

        swift_release();
        (*(void (**)(char *, id))(v29 + 8))(v12, v30);
        return;
      }
    }
    else
    {
      id v20 = v37;
    }
  }
}

uint64_t sub_10000715C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return _swift_task_switch(sub_100007180, 0, 0);
}

uint64_t sub_100007180()
{
  unint64_t v1 = (uint64_t *)(*(void *)(v0 + 48) + OBJC_IVAR___PrintActivityObject_currentActivity);
  swift_beginAccess();
  uint64_t v2 = *v1;
  *(void *)(v0 + 64) = v2;
  if (v2)
  {
    uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of Activity.update(_:)
                                         + async function pointer to dispatch thunk of Activity.update(_:));
    swift_retain();
    id v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v3;
    void *v3 = v0;
    v3[1] = sub_1000072A8;
    uint64_t v4 = *(void *)(v0 + 56);
    return v7(v4);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    id v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_1000072A8()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1000073C0, 0, 0);
}

uint64_t sub_1000073C0()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 64) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000073E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000742C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of Activity.update(_:)
                                       + async function pointer to dispatch thunk of Activity.update(_:));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_10000862C;
  return v9(a5);
}

uint64_t variable initialization expression of PrintActivityObject.workQueue()
{
  uint64_t v0 = sub_10000A470();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A460();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10000A400();
  __chkstk_darwin(v5 - 8);
  sub_100007E58(0, &qword_100010A08);
  sub_10000A3F0();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_100008114(&qword_100010A10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005488(&qword_100010A18);
  sub_10000815C(&qword_100010A20, &qword_100010A18);
  sub_10000A4B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return sub_10000A490();
}

uint64_t sub_100007730(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id PrintActivityObject.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id PrintActivityObject.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_10000A470();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A460();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10000A400();
  __chkstk_darwin(v5 - 8);
  *(void *)&v0[OBJC_IVAR___PrintActivityObject_currentActivity] = 0;
  *(void *)&v0[OBJC_IVAR___PrintActivityObject_pendingJobs] = &_swiftEmptyArrayStorage;
  uint64_t v9 = OBJC_IVAR___PrintActivityObject_workQueue;
  v8[1] = sub_100007E58(0, &qword_100010A08);
  id v6 = v0;
  sub_10000A3F0();
  id v13 = &_swiftEmptyArrayStorage;
  sub_100008114(&qword_100010A10, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005488(&qword_100010A18);
  sub_10000815C(&qword_100010A20, &qword_100010A18);
  sub_10000A4B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v10);
  *(void *)&v0[v9] = sub_10000A490();

  v12.receiver = v6;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, "init");
}

id PrintActivityObject.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PrintActivityObject()
{
  return self;
}

uint64_t sub_100007B38(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100007C14;
  return v6(a1);
}

uint64_t sub_100007C14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007D0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007D44(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000862C;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010A58 + dword_100010A58);
  return v6(a1, v4);
}

uint64_t sub_100007DFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005488(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007E58(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100007E94()
{
  unint64_t result = qword_100010A78;
  if (!qword_100010A78)
  {
    sub_100007E58(255, &qword_100010A70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100010A78);
  }
  return result;
}

uint64_t sub_100007EFC()
{
  uint64_t v1 = sub_100005488(&qword_1000109A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100007FD4()
{
  uint64_t v2 = *(void *)(sub_100005488(&qword_1000109A8) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000862C;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of Activity.update(_:)
                                       + async function pointer to dispatch thunk of Activity.update(_:));
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000862C;
  return v7(v3);
}

void sub_10000810C()
{
  sub_100006D3C(*(char **)(v0 + 16));
}

uint64_t sub_100008114(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000815C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007730(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000081AC()
{
  uint64_t v1 = sub_100005488(&qword_1000109A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100008284(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100005488(&qword_1000109A8) - 8);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000862C;
  v7[6] = v5;
  v7[7] = v6;
  v7[5] = a1;
  return _swift_task_switch(sub_100007180, 0, 0);
}

uint64_t sub_100008380(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_100008460;
  return v5(v2 + 32);
}

uint64_t sub_100008460()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100008574(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100006774;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010AB8 + dword_100010AB8);
  return v6(a1, v4);
}

uint64_t sub_10000864C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000867C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1000086B4())()
{
  return nullsub_1;
}

uint64_t sub_1000086D8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000086E0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_1000086E8())()
{
  return nullsub_1;
}

uint64_t sub_100008708()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_100008710(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*sub_100008718())()
{
  return nullsub_1;
}

uint64_t sub_100008738()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100008768(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_1000087A0())()
{
  return nullsub_1;
}

uint64_t sub_1000087C0()
{
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  sub_10000A570(*(void *)(v0 + 16));
  sub_10000A570(*(void *)(v0 + 24));
  swift_bridgeObjectRetain();
  sub_10000A410();

  return swift_bridgeObjectRelease();
}

BOOL sub_100008854(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008868()
{
  Swift::UInt v1 = *v0;
  sub_10000A560();
  sub_10000A570(v1);
  return sub_10000A580();
}

void sub_1000088B0()
{
  sub_10000A570(*v0);
}

Swift::Int sub_1000088DC()
{
  Swift::UInt v1 = *v0;
  sub_10000A560();
  sub_10000A570(v1);
  return sub_10000A580();
}

uint64_t sub_100008920()
{
  uint64_t result = 0x656C746954626F6ALL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73656761506D756ELL;
      break;
    case 2:
      uint64_t result = 0x50746E6572727563;
      break;
    case 3:
      uint64_t result = 0x617453726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000089BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000092CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000089E4()
{
  return 0;
}

void sub_1000089F0(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000089FC(uint64_t a1)
{
  unint64_t v2 = sub_100009278();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008A38(uint64_t a1)
{
  unint64_t v2 = sub_100009278();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008A74(void *a1)
{
  uint64_t v3 = sub_100005488(&qword_100010AD0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100009234(a1, a1[3]);
  sub_100009278();
  sub_10000A5A0();
  v8[15] = 0;
  sub_10000A510();
  if (!v1)
  {
    v8[14] = 1;
    sub_10000A520();
    v8[13] = 2;
    sub_10000A520();
    v8[12] = 3;
    sub_10000A510();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int sub_100008C24()
{
  sub_10000A560();
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  sub_10000A570(*(void *)(v0 + 16));
  sub_10000A570(*(void *)(v0 + 24));
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  return sub_10000A580();
}

double sub_100008CCC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1000094B8(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100008D10@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t sub_100008D20(void *a1)
{
  return sub_100008A74(a1);
}

Swift::Int sub_100008D38()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  sub_10000A560();
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  sub_10000A570(v1);
  sub_10000A570(v2);
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  return sub_10000A580();
}

uint64_t sub_100008DEC()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  sub_10000A570(v1);
  sub_10000A570(v2);
  swift_bridgeObjectRetain();
  sub_10000A410();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100008E90()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  sub_10000A560();
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  sub_10000A570(v1);
  sub_10000A570(v2);
  swift_bridgeObjectRetain();
  sub_10000A410();
  swift_bridgeObjectRelease();
  return sub_10000A580();
}

uint64_t sub_100008F40(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  void v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  void v8[2] = v5;
  return sub_100009180(v7, v8) & 1;
}

uint64_t sub_100008F88()
{
  return 0;
}

uint64_t sub_100008F94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_100008FC4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100008FD0(uint64_t a1)
{
  unint64_t v2 = sub_100009720();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000900C(uint64_t a1)
{
  unint64_t v2 = sub_100009720();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100009048(void *a1)
{
  uint64_t v2 = sub_100005488(&qword_100010AD8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009234(a1, a1[3]);
  sub_100009720();
  sub_10000A5A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100009158(uint64_t a1)
{
  return sub_100009774(a1);
}

uint64_t sub_100009180(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_10000A530(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3])
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
      {
        return 1;
      }
      else
      {
        return sub_10000A530();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *sub_100009234(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009278()
{
  unint64_t result = qword_100010B10;
  if (!qword_100010B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B10);
  }
  return result;
}

uint64_t sub_1000092CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000;
  if (v2 || (sub_10000A530() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656761506D756ELL && a2 == 0xE800000000000000 || (sub_10000A530() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x50746E6572727563 && a2 == 0xEB00000000656761 || (sub_10000A530() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617453726F727265 && a2 == 0xEB00000000737574)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10000A530();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000094B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005488(&qword_100010AF8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009234(a1, a1[3]);
  sub_100009278();
  sub_10000A590();
  if (v2) {
    return sub_100009774((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = sub_10000A4F0();
  uint64_t v11 = v10;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_10000A500();
  char v23 = 2;
  uint64_t v20 = sub_10000A500();
  char v22 = 3;
  uint64_t v12 = sub_10000A4F0();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  sub_100009774((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  uint64_t v17 = v20;
  a2[2] = v21;
  a2[3] = v17;
  a2[4] = v19;
  a2[5] = v14;
  return result;
}

unint64_t sub_100009720()
{
  unint64_t result = qword_100010B18[0];
  if (!qword_100010B18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010B18);
  }
  return result;
}

uint64_t sub_100009774(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000097C8()
{
  unint64_t result = qword_100010AE0;
  if (!qword_100010AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AE0);
  }
  return result;
}

unint64_t sub_100009820()
{
  unint64_t result = qword_100010AE8;
  if (!qword_100010AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AE8);
  }
  return result;
}

unint64_t sub_100009878()
{
  unint64_t result = qword_100010AF0;
  if (!qword_100010AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes()
{
  return &type metadata for PrintActivityAttributes;
}

uint64_t initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PrintActivityAttributes.ContentState()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PrintActivityAttributes.ContentState(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState()
{
  return &type metadata for PrintActivityAttributes.ContentState;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.CodingKeys;
}

unsigned char *initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x100009CA4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_100009CCC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009CD4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.ContentState.CodingKeys;
}

unint64_t sub_100009CF0()
{
  unint64_t result = qword_100010FA0[0];
  if (!qword_100010FA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010FA0);
  }
  return result;
}

unint64_t sub_100009D48()
{
  unint64_t result = qword_1000111B0;
  if (!qword_1000111B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111B0);
  }
  return result;
}

unint64_t sub_100009DA0()
{
  unint64_t result = qword_1000111B8[0];
  if (!qword_1000111B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000111B8);
  }
  return result;
}

unint64_t sub_100009DF8()
{
  unint64_t result = qword_100011240;
  if (!qword_100011240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011240);
  }
  return result;
}

unint64_t sub_100009E50()
{
  unint64_t result = qword_100011248[0];
  if (!qword_100011248[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100011248);
  }
  return result;
}

BOOL sub_100009EA4()
{
  return [v0 state] == (id)5;
}

uint64_t sub_100009ED0()
{
  id v1 = [v0 settings];
  id v2 = [v1 objectForKey:PKJobNameKey];

  if (v2)
  {
    sub_10000A4A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_10000A230((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_10000A298((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_100009FB0()
{
  id v1 = [v0 settings];
  id v2 = [v1 objectForKey:PKCopiesKey];

  if (v2)
  {
    sub_10000A4A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000A230((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_10000A298((uint64_t)v7);
    return 1;
  }
  sub_100007E58(0, &qword_100010B08);
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  id v3 = [v5 integerValue];

  return (uint64_t)v3;
}

uint64_t sub_10000A0BC()
{
  uint64_t v1 = (uint64_t)[v0 mediaSheets];
  uint64_t result = sub_100009FB0();
  if (result)
  {
    if (v1 != 0x8000000000000000 || result != -1) {
      return v1 / result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_10000A110()
{
  id result = [v0 mediaSheetsCompleted];
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)result + 1 <= 1) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = (uint64_t)result + 1;
    }
    if ((uint64_t)[v0 mediaSheets] < 1)
    {
      return (id)v2;
    }
    else
    {
      id result = [v0 mediaSheets];
      if ((uint64_t)result >= v2) {
        return (id)v2;
      }
    }
  }
  return result;
}

uint64_t sub_10000A18C@<X0>(uint64_t *a1@<X8>)
{
  sub_100007E58(0, &qword_100010A70);
  uint64_t result = sub_10000A3C0();
  *a1 = result;
  return result;
}

uint64_t sub_10000A1DC@<X0>(uint64_t *a1@<X8>)
{
  sub_100007E58(0, &qword_100010A70);
  uint64_t result = sub_10000A4C0();
  *a1 = result;
  return result;
}

uint64_t sub_10000A230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005488(&qword_100010B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A298(uint64_t a1)
{
  uint64_t v2 = sub_100005488(&qword_100010B00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10000A2F8()
{
  return &protocol witness table for ObservableObjectPublisher;
}

void *sub_10000A304()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_10000A310()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A320()
{
  return type metadata accessor for Notification();
}

uint64_t sub_10000A330()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A340()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t sub_10000A350()
{
  return type metadata accessor for ActivityContentSource.Request();
}

uint64_t sub_10000A360()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t sub_10000A370()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t sub_10000A380()
{
  return static ActivityPresentationOptions.ActivityPresentationDestination.allCases.getter();
}

uint64_t sub_10000A390()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t sub_10000A3A0()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t sub_10000A3B0()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t sub_10000A3C0()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_10000A3D0()
{
}

uint64_t sub_10000A3E0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000A3F0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000A400()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10000A410()
{
  return String.hash(into:)();
}

uint64_t sub_10000A420()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A430()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A440()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000A450()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000A460()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10000A470()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10000A480()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10000A490()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10000A4A0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000A4B0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10000A4C0()
{
  return Identifiable<>.id.getter();
}

uint64_t sub_10000A4D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A4E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A4F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000A500()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000A510()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000A520()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000A530()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A540()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A550()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10000A560()
{
  return Hasher.init(_seed:)();
}

void sub_10000A570(Swift::UInt a1)
{
}

Swift::Int sub_10000A580()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A590()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000A5A0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void exit(int a1)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_printActivityObject(void *a1, const char *a2, ...)
{
  return _[a1 printActivityObject];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setPrintActivityObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintActivityObject:");
}

id objc_msgSend_startPrintActivity(void *a1, const char *a2, ...)
{
  return _[a1 startPrintActivity];
}

id objc_msgSend_stopPrintActivity(void *a1, const char *a2, ...)
{
  return _[a1 stopPrintActivity];
}