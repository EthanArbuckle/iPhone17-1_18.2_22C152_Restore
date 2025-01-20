uint64_t sub_1000BA0BC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *(void **)(*(void *)v0 + 128);
  v2 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();

  return _swift_task_switch(sub_1000BA1E4, v2, 0);
}

uint64_t sub_1000BA1E4()
{
  v1 = (void *)(v0[9] + v0[15]);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_10002BCF8(v1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
  v0[18] = v4;
  v7 = (uint64_t (*)(void *))(*(void *)(*(void *)v4 + 360) + **(int **)(*(void *)v4 + 360));
  v5 = (void *)swift_task_alloc();
  v0[19] = v5;
  void *v5 = v0;
  v5[1] = sub_1000BA33C;
  return v7(v0 + 2);
}

uint64_t sub_1000BA33C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v4 = sub_1000BA4F0;
  }
  else {
    uint64_t v4 = sub_1000BA484;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000BA484()
{
  sub_100028A4C(v0 + 16);
  swift_task_dealloc();
  v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(9);
}

uint64_t sub_1000BA4F0()
{
  sub_100028A4C(v0 + 16);
  Logger.init()();
  swift_errorRetain();
  swift_errorRetain();
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "reload config threw error: %@", v3, 0xCu);
    sub_100020378(&qword_1001590C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  type metadata accessor for ReachabilityTracker(0);
  v9 = (void *)_convertErrorToNSError(_:)();
  sub_100025484(v9);
  char v11 = v10;

  if (v11)
  {
    v16 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)(v0 + 64) + 216)
                                          + **(int **)(**(void **)(v0 + 64) + 216));
    v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v12;
    void *v12 = v0;
    v12[1] = sub_1000BA7F4;
    uint64_t v13 = 1;
    v14 = v16;
  }
  else
  {
    swift_errorRelease();
    swift_task_dealloc();
    v14 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v13 = 9;
  }
  return v14(v13);
}

uint64_t sub_1000BA7F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BA904, v1, 0);
}

uint64_t sub_1000BA904()
{
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(9);
}

uint64_t sub_1000BA970()
{
  return sub_1000BA984(&OBJC_IVAR____TtC15swtransparencyd20ReloadPublicKeyState_priority, &OBJC_IVAR____TtC15swtransparencyd20ReloadPublicKeyState_deps);
}

uint64_t sub_1000BA984(void *a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_100028C8C(v2 + *a1, &qword_100157030);
  sub_100028A4C(v2 + *a2);
  swift_defaultActor_destroy();
  return v2;
}

uint64_t sub_1000BA9E4()
{
  return sub_1000BA9F8(&OBJC_IVAR____TtC15swtransparencyd20ReloadPublicKeyState_priority, &OBJC_IVAR____TtC15swtransparencyd20ReloadPublicKeyState_deps);
}

uint64_t sub_1000BA9F8(void *a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_100028C8C(v2 + *a1, &qword_100157030);
  sub_100028A4C(v2 + *a2);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v2);
}

uint64_t sub_1000BAA68(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BAB6C(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BAC70@<X0>(uint64_t a1@<X8>)
{
  return sub_100029208(v1 + OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_priority, a1, &qword_100157030);
}

uint64_t sub_1000BACA0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003863C(v1 + OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps, a1);
}

uint64_t sub_1000BACC8(long long *a1)
{
  return sub_1000BC4DC(a1, 5, &OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_priority, &OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps);
}

uint64_t sub_1000BACE0(uint64_t a1)
{
  *(void *)(v2 + 264) = a1;
  *(void *)(v2 + 272) = v1;
  return _swift_task_switch(sub_1000BAD00, v1, 0);
}

uint64_t sub_1000BAD00()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps;
  v0[35] = OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps;
  uint64_t v3 = *(void *)(v1 + v2 + 24);
  uint64_t v4 = *(void *)(v1 + v2 + 32);
  sub_10002BCF8((void *)(v1 + v2), v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 56))(v3, v4);
  v0[36] = v5;
  uint64_t v6 = (*(void *)v5 + 160) & 0xFFFFFFFFFFFFLL | 0x445F000000000000;
  v0[37] = *(void *)(*(void *)v5 + 160);
  v0[38] = v6;
  return _swift_task_switch(sub_1000BADC8, v5, 0);
}

uint64_t sub_1000BADC8()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 296))();
  *(void *)(v0 + 312) = v1;
  swift_release();
  uint64_t v2 = *(void *)(v0 + 264);
  if (v1)
  {
    uint64_t v3 = (*(void *)v2 + 200) & 0xFFFFFFFFFFFFLL | 0x5D5C000000000000;
    *(void *)(v0 + 320) = *(void *)(*(void *)v2 + 200);
    *(void *)(v0 + 328) = v3;
    uint64_t v4 = sub_1000BAE90;
  }
  else
  {
    uint64_t v5 = (*(void *)v2 + 184) & 0xFFFFFFFFFFFFLL | 0x62BB000000000000;
    *(void *)(v0 + 352) = *(void *)(*(void *)v2 + 184);
    *(void *)(v0 + 360) = v5;
    uint64_t v4 = sub_1000BB5D8;
  }
  return _swift_task_switch(v4, v2, 0);
}

uint64_t sub_1000BAE90()
{
  uint64_t v1 = *(void *)(v0 + 272);
  *(unsigned char *)(v0 + 368) = (*(uint64_t (**)(uint64_t))(v0 + 320))(1) & 1;
  return _swift_task_switch(sub_1000BAF08, v1, 0);
}

uint64_t sub_1000BAF08()
{
  if (*(unsigned char *)(v0 + 368))
  {

    uint64_t v1 = *(void *)(v0 + 264);
    uint64_t v2 = (*(void *)v1 + 184) & 0xFFFFFFFFFFFFLL | 0x62BB000000000000;
    *(void *)(v0 + 352) = *(void *)(*(void *)v1 + 184);
    *(void *)(v0 + 360) = v2;
    return _swift_task_switch(sub_1000BB5D8, v1, 0);
  }
  else
  {
    uint64_t v3 = (void *)(*(void *)(v0 + 272) + *(void *)(v0 + 280));
    uint64_t v4 = v3[3];
    uint64_t v5 = v3[4];
    sub_10002BCF8(v3, v4);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 112) + **(int **)(v5 + 112));
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 336) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000BB090;
    return v8(v0 + 184, v4, v5);
  }
}

uint64_t sub_1000BB090()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 272);
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BB1A0, v1, 0);
}

uint64_t sub_1000BB1A0()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v3 = (void *)(*(void *)(v0 + 272) + *(void *)(v0 + 280));
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10002BCF8(v3, v4);
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  sub_10002BCF8(v3, v6);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  sub_10002BCF8(v3, v8);
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 64);
  id v11 = v1;
  uint64_t v12 = v10(v8, v9);
  uint64_t v25 = type metadata accessor for KTSWDB();
  uint64_t v26 = sub_1000B7DE8(qword_100157AB0, (void (*)(uint64_t))type metadata accessor for KTSWDB);
  *(void *)&long long v24 = v12;
  sub_10003863C(v0 + 184, v0 + 224);
  uint64_t v13 = v3[3];
  uint64_t v14 = v3[4];
  sub_10002BCF8(v3, v13);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 80))(v13, v14);
  uint64_t v16 = v3[3];
  uint64_t v17 = v3[4];
  sub_10002BCF8(v3, v16);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v17 + 88))(v27, v16, v17);
  swift_retain();
  sub_10005DD38(v23, v22, (uint64_t)v11, &v24, v2, (long long *)(v0 + 224), 0, v15, v0 + 16, (uint64_t)v27);
  sub_10005E850();
  double v19 = v18;
  v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v20;
  void *v20 = v0;
  v20[1] = sub_1000BB424;
  return sub_10005E888(v19);
}

uint64_t sub_1000BB424()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  if (v0)
  {
    swift_errorRelease();
    uint64_t v4 = sub_1000BFD74;
  }
  else
  {
    uint64_t v4 = sub_1000BB55C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000BB55C()
{
  sub_100066558(v0 + 16);
  sub_100028A4C(v0 + 184);
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(9);
}

uint64_t sub_1000BB5D8()
{
  (*(void (**)(uint64_t))(v0 + 352))(4);
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(7);
}

uint64_t sub_1000BB644()
{
  return sub_1000BA984(&OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_priority, &OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps);
}

uint64_t sub_1000BB658()
{
  return sub_1000BA9F8(&OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_priority, &OBJC_IVAR____TtC15swtransparencyd22MilestoneDownloadState_deps);
}

uint64_t sub_1000BB66C(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BB770(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BB874()
{
  return 6;
}

uint64_t sub_1000BB87C@<X0>(uint64_t a1@<X8>)
{
  return sub_100029208(v1 + OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_priority, a1, &qword_100157030);
}

uint64_t sub_1000BB8AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10003863C(v1 + OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps, a1);
}

uint64_t sub_1000BB8D4(long long *a1)
{
  return sub_1000BC4DC(a1, 6, &OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_priority, &OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps);
}

uint64_t sub_1000BB8EC(uint64_t a1)
{
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = v1;
  return _swift_task_switch(sub_1000BB90C, v1, 0);
}

uint64_t sub_1000BB90C()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps;
  v0[34] = OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps;
  uint64_t v3 = *(void *)(v1 + v2 + 24);
  uint64_t v4 = *(void *)(v1 + v2 + 32);
  sub_10002BCF8((void *)(v1 + v2), v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 56))(v3, v4);
  v0[35] = v5;
  uint64_t v6 = (*(void *)v5 + 160) & 0xFFFFFFFFFFFFLL | 0x445F000000000000;
  v0[36] = *(void *)(*(void *)v5 + 160);
  v0[37] = v6;
  return _swift_task_switch(sub_1000BB9D4, v5, 0);
}

uint64_t sub_1000BB9D4()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 288))();
  *(void *)(v0 + 304) = v1;
  swift_release();
  uint64_t v2 = *(void *)(v0 + 256);
  if (v1)
  {
    uint64_t v3 = (*(void *)v2 + 200) & 0xFFFFFFFFFFFFLL | 0x5D5C000000000000;
    *(void *)(v0 + 312) = *(void *)(*(void *)v2 + 200);
    *(void *)(v0 + 320) = v3;
    uint64_t v4 = sub_1000BBA9C;
  }
  else
  {
    uint64_t v5 = (*(void *)v2 + 184) & 0xFFFFFFFFFFFFLL | 0x62BB000000000000;
    *(void *)(v0 + 344) = *(void *)(*(void *)v2 + 184);
    *(void *)(v0 + 352) = v5;
    uint64_t v4 = sub_1000BC1C8;
  }
  return _swift_task_switch(v4, v2, 0);
}

uint64_t sub_1000BBA9C()
{
  uint64_t v1 = *(void *)(v0 + 264);
  *(unsigned char *)(v0 + 360) = (*(uint64_t (**)(uint64_t))(v0 + 312))(1) & 1;
  return _swift_task_switch(sub_1000BBB14, v1, 0);
}

uint64_t sub_1000BBB14()
{
  if (*(unsigned char *)(v0 + 360))
  {

    uint64_t v1 = *(void *)(v0 + 256);
    uint64_t v2 = (*(void *)v1 + 184) & 0xFFFFFFFFFFFFLL | 0x62BB000000000000;
    *(void *)(v0 + 344) = *(void *)(*(void *)v1 + 184);
    *(void *)(v0 + 352) = v2;
    return _swift_task_switch(sub_1000BC1C8, v1, 0);
  }
  else
  {
    uint64_t v3 = (void *)(*(void *)(v0 + 264) + *(void *)(v0 + 272));
    uint64_t v4 = v3[3];
    uint64_t v5 = v3[4];
    sub_10002BCF8(v3, v4);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 120) + **(int **)(v5 + 120));
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000BBC9C;
    return v8(v0 + 176, v4, v5);
  }
}

uint64_t sub_1000BBC9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 264);
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BBDAC, v1, 0);
}

uint64_t sub_1000BBDAC()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = (void *)(*(void *)(v0 + 264) + *(void *)(v0 + 272));
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10002BCF8(v3, v4);
  int v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v6 = v3[3];
  uint64_t v7 = v3[4];
  sub_10002BCF8(v3, v6);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  sub_10002BCF8(v3, v8);
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 64);
  id v11 = v1;
  uint64_t v12 = v10(v8, v9);
  uint64_t v23 = type metadata accessor for KTSWDB();
  uint64_t v24 = sub_1000B7DE8(qword_100157AB0, (void (*)(uint64_t))type metadata accessor for KTSWDB);
  *(void *)&long long v22 = v12;
  sub_10003863C(v0 + 176, v0 + 216);
  uint64_t v13 = v3[3];
  uint64_t v14 = v3[4];
  sub_10002BCF8(v3, v13);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 80))(v13, v14);
  uint64_t v16 = v3[3];
  uint64_t v17 = v3[4];
  sub_10002BCF8(v3, v16);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v17 + 88))(v25, v16, v17);
  swift_retain();
  sub_10004AD68(v21, v20, (uint64_t)v11, &v22, v2, (long long *)(v0 + 216), v15, v25, v0 + 16);
  double v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v18;
  *double v18 = v0;
  v18[1] = sub_1000BC014;
  return sub_10004CAFC();
}

uint64_t sub_1000BC014()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  if (v0)
  {
    swift_errorRelease();
    uint64_t v4 = sub_1000BFD78;
  }
  else
  {
    uint64_t v4 = sub_1000BC14C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_1000BC14C()
{
  sub_100050084((id *)(v0 + 16));
  sub_100028A4C(v0 + 176);
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(9);
}

uint64_t sub_1000BC1C8()
{
  (*(void (**)(uint64_t))(v0 + 344))(3);
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(7);
}

uint64_t sub_1000BC234()
{
  return sub_1000BA984(&OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_priority, &OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps);
}

uint64_t sub_1000BC248()
{
  return sub_1000BA9F8(&OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_priority, &OBJC_IVAR____TtC15swtransparencyd19PatConsistencyState_deps);
}

uint64_t sub_1000BC25C(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BC360(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BC464()
{
  return 8;
}

uint64_t sub_1000BC46C@<X0>(uint64_t a1@<X8>)
{
  return sub_100029208(v1 + OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_priority, a1, &qword_100157030);
}

uint64_t sub_1000BC49C@<X0>(uint64_t a1@<X8>)
{
  return sub_10003863C(v1 + OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps, a1);
}

uint64_t sub_1000BC4C4(long long *a1)
{
  return sub_1000BC4DC(a1, 8, &OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_priority, &OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps);
}

uint64_t sub_1000BC4DC(long long *a1, char a2, void *a3, void *a4)
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v4 + 112) = a2;
  *(void *)(v4 + 120) = &_swiftEmptySetSingleton;
  uint64_t v9 = v4 + *a3;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_10003CD24(a1, v4 + *a4);
  return v4;
}

uint64_t sub_1000BC58C()
{
  v1[18] = v0;
  uint64_t v2 = type metadata accessor for TransparencySWIssue();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for SWTFollowUpType();
  v1[22] = v3;
  v1[23] = *(void *)(v3 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v1[26] = v4;
  v1[27] = *(void *)(v4 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  return _swift_task_switch(sub_1000BC73C, v0, 0);
}

uint64_t sub_1000BC73C()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps;
  v0[32] = OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps;
  uint64_t v3 = *(void *)(v1 + v2 + 24);
  uint64_t v4 = *(void *)(v1 + v2 + 32);
  sub_10002BCF8((void *)(v1 + v2), v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 56))(v3, v4);
  v0[33] = v5;
  uint64_t v6 = (*(void *)v5 + 160) & 0xFFFFFFFFFFFFLL | 0x445F000000000000;
  v0[34] = *(void *)(*(void *)v5 + 160);
  v0[35] = v6;
  return _swift_task_switch(sub_1000BC804, v5, 0);
}

uint64_t sub_1000BC804()
{
  uint64_t v1 = *(void *)(v0 + 144);
  *(void *)(v0 + 288) = (*(uint64_t (**)(void))(v0 + 272))();
  swift_release();
  return _swift_task_switch(sub_1000BC880, v1, 0);
}

uint64_t sub_1000BC880()
{
  v91 = v0;
  uint64_t v1 = (void *)v0[36];
  if (v1)
  {
    uint64_t v2 = (void *)(v0[18] + v0[32]);
    uint64_t v3 = v2[3];
    uint64_t v4 = v2[4];
    sub_10002BCF8(v2, v3);
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    uint64_t v6 = sub_10005194C(v5);
    v0[37] = v6;
    v0[38] = v7;
    if (v7)
    {
      uint64_t v8 = v6;
      unint64_t v9 = v7;
      uint64_t v10 = (void *)(v0[18] + v0[32]);
      uint64_t v11 = type metadata accessor for Date();
      v0[39] = v11;
      uint64_t v12 = *(void *)(v11 - 8);
      v0[40] = v12;
      v0[41] = *(void *)(v12 + 64);
      v0[42] = swift_task_alloc();
      uint64_t v13 = v10[3];
      uint64_t v14 = v10[4];
      sub_10002BCF8(v10, v13);
      id v15 = [*(uint64_t (**)(uint64_t, uint64_t))(v14 + 32)(v13, v14) transparencySettings];
      swift_unknownObjectRelease();
      [v15 atBackgroundFollowupDelayPeriod];
      swift_unknownObjectRelease();
      Date.init(timeIntervalSinceNow:)();
      uint64_t result = (uint64_t)[v1 patLogBeginningMs];
      v0[43] = result;
      if (result < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v17 = (void *)(v0[18] + v0[32]);
      uint64_t v18 = v17[3];
      uint64_t v19 = v17[4];
      sub_10002BCF8(v17, v18);
      (*(void (**)(uint64_t, uint64_t))(v19 + 64))(v18, v19);
      uint64_t v20 = sub_100057310();
      v0[44] = v20;
      v0[45] = 0;
      uint64_t v21 = v20;
      swift_release();
      if (*(void *)(v21 + 16))
      {
        Logger.init()();
        swift_bridgeObjectRetain_n();
        id v22 = v1;
        uint64_t v23 = Logger.logObject.getter();
        os_log_type_t type = static os_log_type_t.error.getter();
        BOOL v24 = os_log_type_enabled(v23, type);
        uint64_t v25 = v0[31];
        uint64_t v26 = v0[27];
        uint64_t v88 = v0[26];
        if (v24)
        {
          uint64_t v27 = swift_slowAlloc();
          v90[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v27 = 136446466;
          swift_bridgeObjectRetain();
          v0[16] = sub_1000262AC(v8, v9, v90);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v27 + 12) = 2050;
          id v28 = [v22 patLogBeginningMs];

          v0[17] = v28;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl((void *)&_mh_execute_header, v23, type, "Found %{public}s PAT split view from before CFU delay for %{public}llu epoch", (uint8_t *)v27, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v88);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v88);
        }
        uint64_t v37 = v0[20];
        uint64_t v36 = v0[21];
        *(void *)typea = v0[19];
        v38 = (void *)(v0[18] + v0[32]);
        (*(void (**)(void, void, void))(v0[23] + 104))(v0[25], enum case for SWTFollowUpType.treeFork(_:), v0[22]);
        uint64_t v39 = v38[3];
        uint64_t v40 = v38[4];
        sub_10002BCF8(v38, v39);
        SWTFollowUpType.rawValue.getter();
        swift_task_alloc();
        Date.init()();
        swift_bridgeObjectRetain();
        TransparencySWIssue.init(issue:posted:slh:)();
        swift_task_dealloc();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 128))(v36, v39, v40);
        (*(void (**)(uint64_t, os_log_type_t *))(v37 + 8))(v36, *(os_log_type_t **)typea);
        uint64_t v41 = v38[3];
        uint64_t v42 = v38[4];
        sub_10002BCF8(v38, v41);
        (*(void (**)(uint64_t, uint64_t))(v42 + 40))(v41, v42);
        uint64_t v43 = v0[10];
        uint64_t v44 = v0[11];
        sub_10002BCF8(v0 + 7, v43);
        *(void *)typeb = *(void *)(v44 + 16) + **(int **)(v44 + 16);
        v45 = (void *)swift_task_alloc();
        v0[46] = v45;
        void *v45 = v0;
        v45[1] = sub_1000BD74C;
        uint64_t v46 = v0[25];
        v47 = v38;
        uint64_t v48 = v21;
        uint64_t v49 = v43;
        uint64_t v50 = v44;
        v51 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))typeb;
LABEL_15:
        return v51(v46, v47, v48, v49, v50);
      }
      uint64_t v31 = v0[37];
      uint64_t v30 = v0[38];
      v32 = (void *)(v0[18] + v0[32]);
      uint64_t v33 = v32[3];
      uint64_t v34 = v32[4];
      sub_10002BCF8(v32, v33);
      (*(void (**)(uint64_t, uint64_t))(v34 + 64))(v33, v34);
      sub_10005639C(v31, v30, 0, 1, 5);
      v0[47] = v35;
      uint64_t v52 = v35;
      uint64_t v53 = v0[32];
      uint64_t v54 = v0[18];
      swift_release();
      v55 = (void *)(v54 + v53);
      uint64_t v56 = *(void *)(v54 + v53 + 24);
      uint64_t v57 = v55[4];
      sub_10002BCF8(v55, v56);
      (*(void (**)(uint64_t, uint64_t))(v57 + 64))(v56, v57);
      uint64_t v58 = sub_100057310();
      v0[48] = v58;
      v0[49] = 0;
      uint64_t v59 = v58;
      swift_release();
      if (*(void *)(v59 + 16))
      {
        uint64_t v89 = v59;
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v60 = Logger.logObject.getter();
        os_log_type_t v61 = static os_log_type_t.error.getter();
        BOOL v62 = os_log_type_enabled(v60, v61);
        unint64_t v63 = v0[38];
        if (v62)
        {
          os_log_t log = (os_log_t)v0[37];
          uint64_t v80 = v0[27];
          uint64_t v81 = v0[26];
          *(void *)typec = v0[30];
          uint64_t v64 = swift_slowAlloc();
          v90[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v64 = 136446466;
          swift_bridgeObjectRetain();
          v0[14] = sub_1000262AC((uint64_t)log, v63, v90);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v64 + 12) = 2050;
          v0[15] = v52;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "Found %{public}s AT split view from before CFU delay for %{public}lld epoch", (uint8_t *)v64, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(os_log_type_t *, uint64_t))(v80 + 8))(*(os_log_type_t **)typec, v81);
        }
        else
        {
          uint64_t v66 = v0[30];
          uint64_t v68 = v0[26];
          uint64_t v67 = v0[27];

          swift_bridgeObjectRelease_n();
          (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
        }
        uint64_t v69 = v0[21];
        uint64_t v70 = v0[20];
        uint64_t v82 = v0[19];
        v71 = (void *)(v0[18] + v0[32]);
        (*(void (**)(void, void, void))(v0[23] + 104))(v0[24], enum case for SWTFollowUpType.treeFork(_:), v0[22]);
        uint64_t v73 = v71[3];
        uint64_t v72 = v71[4];
        sub_10002BCF8(v71, v73);
        SWTFollowUpType.rawValue.getter();
        swift_task_alloc();
        Date.init()();
        TransparencySWIssue.init(issue:posted:slh:)();
        swift_task_dealloc();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 128))(v69, v73, v72);
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v82);
        uint64_t v74 = v71[3];
        uint64_t v75 = v71[4];
        sub_10002BCF8(v71, v74);
        (*(void (**)(uint64_t, uint64_t))(v75 + 40))(v74, v75);
        uint64_t v76 = v0[5];
        uint64_t v77 = v0[6];
        sub_10002BCF8(v0 + 2, v76);
        v83 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 + 16)
                                                                                   + **(int **)(v77 + 16));
        v78 = (void *)swift_task_alloc();
        v0[50] = v78;
        void *v78 = v0;
        v78[1] = sub_1000BE0A8;
        uint64_t v46 = v0[24];
        v47 = v71;
        uint64_t v48 = v89;
        uint64_t v49 = v76;
        uint64_t v50 = v77;
        v51 = v83;
        goto LABEL_15;
      }
      v65 = (void *)v0[36];
      (*(void (**)(void, void))(v0[40] + 8))(v0[42], v0[39]);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
    }
    else
    {
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(uint64_t))v0[1];
  return v29(9);
}

uint64_t sub_1000BD74C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  return _swift_task_switch(sub_1000BD85C, v1, 0);
}

uint64_t sub_1000BD85C()
{
  uint64_t v52 = v0;
  uint64_t v1 = v0[45];
  uint64_t v2 = (void *)(v0[18] + v0[32]);
  sub_100028A4C((uint64_t)(v0 + 7));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_10002BCF8(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4);
  sub_100057394();
  uint64_t v5 = v0[25];
  uint64_t v6 = v0[22];
  uint64_t v7 = v0[23];
  if (v1)
  {
    swift_release();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 8))(v0[25], v0[22]);
    swift_release();
  }
  uint64_t v9 = v0[37];
  uint64_t v8 = v0[38];
  uint64_t v10 = (void *)(v0[18] + v0[32]);
  uint64_t v11 = v10[3];
  uint64_t v12 = v10[4];
  sub_10002BCF8(v10, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 64))(v11, v12);
  sub_10005639C(v9, v8, 0, 1, 5);
  v0[47] = v13;
  uint64_t v14 = v13;
  uint64_t v15 = v0[32];
  uint64_t v16 = v0[18];
  swift_release();
  uint64_t v17 = (void *)(v16 + v15);
  uint64_t v18 = *(void *)(v16 + v15 + 24);
  uint64_t v19 = *(void *)(v16 + v15 + 32);
  sub_10002BCF8(v17, v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 64))(v18, v19);
  uint64_t v20 = sub_100057310();
  v0[48] = v20;
  v0[49] = 0;
  uint64_t v21 = v20;
  swift_release();
  if (*(void *)(v21 + 16))
  {
    uint64_t v50 = v21;
    Logger.init()();
    swift_bridgeObjectRetain_n();
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    BOOL v24 = os_log_type_enabled(v22, v23);
    unint64_t v25 = v0[38];
    if (v24)
    {
      uint64_t v45 = v0[37];
      uint64_t v26 = v0[27];
      uint64_t v46 = v0[26];
      uint64_t v49 = v0[30];
      uint64_t v27 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136446466;
      swift_bridgeObjectRetain();
      v0[14] = sub_1000262AC(v45, v25, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 12) = 2050;
      v0[15] = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Found %{public}s AT split view from before CFU delay for %{public}lld epoch", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v49, v46);
    }
    else
    {
      uint64_t v31 = v0[30];
      uint64_t v33 = v0[26];
      uint64_t v32 = v0[27];

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    }
    uint64_t v34 = v0[21];
    uint64_t v35 = v0[20];
    uint64_t v47 = v0[19];
    uint64_t v36 = (void *)(v0[18] + v0[32]);
    (*(void (**)(void, void, void))(v0[23] + 104))(v0[24], enum case for SWTFollowUpType.treeFork(_:), v0[22]);
    uint64_t v38 = v36[3];
    uint64_t v37 = v36[4];
    sub_10002BCF8(v36, v38);
    SWTFollowUpType.rawValue.getter();
    swift_task_alloc();
    Date.init()();
    TransparencySWIssue.init(issue:posted:slh:)();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 128))(v34, v38, v37);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v47);
    uint64_t v39 = v36[3];
    uint64_t v40 = v36[4];
    sub_10002BCF8(v36, v39);
    (*(void (**)(uint64_t, uint64_t))(v40 + 40))(v39, v40);
    uint64_t v41 = v0[5];
    uint64_t v42 = v0[6];
    sub_10002BCF8(v0 + 2, v41);
    uint64_t v48 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 + 16)
                                                                               + **(int **)(v42 + 16));
    uint64_t v43 = (void *)swift_task_alloc();
    v0[50] = v43;
    *uint64_t v43 = v0;
    v43[1] = sub_1000BE0A8;
    uint64_t v44 = v0[24];
    return v48(v44, v36, v50, v41, v42);
  }
  else
  {
    uint64_t v30 = (void *)v0[36];
    (*(void (**)(void, void))(v0[40] + 8))(v0[42], v0[39]);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v28 = (uint64_t (*)(uint64_t))v0[1];
    return v28(9);
  }
}

uint64_t sub_1000BE0A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000BE1D4, v1, 0);
}

uint64_t sub_1000BE1D4()
{
  uint64_t v1 = v0[49];
  uint64_t v2 = (void *)(v0[18] + v0[32]);
  sub_100028A4C((uint64_t)(v0 + 2));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_10002BCF8(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4);
  sub_100057394();
  uint64_t v5 = (void *)v0[36];
  swift_release();
  swift_bridgeObjectRelease();

  if (v1) {
    swift_errorRelease();
  }
  uint64_t v6 = v0[42];
  uint64_t v7 = v0[39];
  uint64_t v8 = v0[40];
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(9);
}

uint64_t sub_1000BE370()
{
  return sub_1000BA984(&OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_priority, &OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps);
}

uint64_t sub_1000BE384()
{
  return sub_1000BA9F8(&OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_priority, &OBJC_IVAR____TtC15swtransparencyd20DetectSplitViewState_deps);
}

uint64_t sub_1000BE398(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BE49C(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BE5A0()
{
  return 9;
}

uint64_t sub_1000BE5A8()
{
  return sub_1000916EC((uint64_t)&off_10013A7F8);
}

uint64_t sub_1000BE5B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100029208(v1 + OBJC_IVAR____TtC15swtransparencyd5Ready_priority, a1, &qword_100157030);
}

uint64_t sub_1000BE5E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10003863C(v1 + OBJC_IVAR____TtC15swtransparencyd5Ready_deps, a1);
}

uint64_t sub_1000BE60C(long long *a1)
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v1 + 112) = 9;
  *(void *)(v1 + 120) = sub_1000916EC((uint64_t)&off_10013A708);
  uint64_t v3 = v1 + OBJC_IVAR____TtC15swtransparencyd5Ready_priority;
  uint64_t v4 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_10003CD24(a1, v1 + OBJC_IVAR____TtC15swtransparencyd5Ready_deps);
  return v1;
}

uint64_t sub_1000BE6B8(unsigned __int8 a1)
{
  if (a1 >= 6u) {
    uint64_t v2 = 10;
  }
  else {
    uint64_t v2 = (0x805060A070AuLL >> (8 * a1));
  }
  return sub_100091828(*(uint64_t (**)(uint64_t))(v1 + 8), v1, v2);
}

uint64_t sub_1000BE714()
{
  return sub_100091828(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0x8000000000000000);
}

uint64_t sub_1000BE74C()
{
  return sub_1000BA984(&OBJC_IVAR____TtC15swtransparencyd5Ready_priority, &OBJC_IVAR____TtC15swtransparencyd5Ready_deps);
}

uint64_t sub_1000BE760()
{
  return sub_1000BA9F8(&OBJC_IVAR____TtC15swtransparencyd5Ready_priority, &OBJC_IVAR____TtC15swtransparencyd5Ready_deps);
}

uint64_t sub_1000BE774(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BE878(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100091E94;
  return v6(a1);
}

uint64_t sub_1000BE97C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100049298(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000BF0A4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1000BED5C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000BEA4C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100020378(&qword_10015A5E8);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
          uint64_t v3 = v35;
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
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
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
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1000BED5C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
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
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
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

void sub_1000BEF34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100049298(a2, a3);
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
    sub_1000BF0A4();
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
  sub_1000BEA4C(v15, a4 & 1);
  unint64_t v20 = sub_100049298(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
  *uint64_t v22 = a2;
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

id sub_1000BF0A4()
{
  uint64_t v1 = v0;
  sub_100020378(&qword_10015A5E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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

uint64_t type metadata accessor for InitialLoadPublicKeyState(uint64_t a1)
{
  return sub_100028514(a1, (uint64_t *)&unk_100161F20);
}

uint64_t type metadata accessor for ReloadPublicKeyState(uint64_t a1)
{
  return sub_100028514(a1, (uint64_t *)&unk_100161F30);
}

uint64_t type metadata accessor for MilestoneDownloadState(uint64_t a1)
{
  return sub_100028514(a1, (uint64_t *)&unk_100161F40);
}

uint64_t type metadata accessor for PatConsistencyState(uint64_t a1)
{
  return sub_100028514(a1, (uint64_t *)&unk_100161F50);
}

uint64_t type metadata accessor for DetectSplitViewState(uint64_t a1)
{
  return sub_100028514(a1, (uint64_t *)&unk_100161F60);
}

uint64_t type metadata accessor for Ready(uint64_t a1)
{
  return sub_100028514(a1, qword_100161F70);
}

unint64_t sub_1000BF318()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_1000B5C80((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v40 = v2;
  uint64_t v3 = v0 + 14;
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[18];
  sub_10002BCF8(v0 + 14, v4);
  uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 48))(v4, v5);
  id v7 = [v6 currentEnvironment];

  uint64_t v8 = v0[17];
  uint64_t v9 = v0[18];
  sub_10002BCF8(v0 + 14, v8);
  id v10 = [[(id)(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9) transparencySettings];
  swift_unknownObjectRelease();
  id v11 = [v10 getEnvironment];
  swift_unknownObjectRelease();
  uint64_t v12 = v1[17];
  uint64_t v13 = v1[18];
  sub_10002BCF8(v3, v12);
  id v14 = [*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32)(v12, v13) atEnvironment];
  swift_unknownObjectRelease();
  uint64_t v15 = v1[17];
  uint64_t v16 = v1[18];
  sub_10002BCF8(v3, v15);
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 48))(v15, v16);
  id v18 = [v17 configured];

  id v19 = [objc_allocWithZone((Class)NSNumber) initWithBool:v18];
  if (v19)
  {
    uint64_t v20 = (uint64_t)v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1000BEF34(v20, 0x676142676663, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v40 = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  uint64_t v23 = v1[17];
  uint64_t v22 = v1[18];
  sub_10002BCF8(v3, v23);
  int64_t v24 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 48))(v23, v22);
  id v25 = [v24 configurationExpired];

  id v26 = [objc_allocWithZone((Class)NSNumber) initWithBool:v25];
  if (v26)
  {
    uint64_t v27 = (uint64_t)v26;
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    sub_1000BEF34(v27, 0x707845676663, 0xE600000000000000, v28);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  id v29 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:v7];
  if (v29)
  {
    uint64_t v30 = (uint64_t)v29;
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    sub_1000BEF34(v30, 0x766E45624B747773, 0xE800000000000000, v31);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  id v32 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:v14];
  if (v32)
  {
    uint64_t v33 = (uint64_t)v32;
    char v34 = swift_isUniquelyReferenced_nonNull_native();
    sub_1000BEF34(v33, 0x766E457441747773, 0xE800000000000000, v34);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  id v35 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:v11];
  if (v35)
  {
    uint64_t v36 = (uint64_t)v35;
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_1000BEF34(v36, 0x766E45744B747773, 0xE800000000000000, v37);
    unint64_t v38 = v40;
    swift_bridgeObjectRelease();
  }
  else
  {

    return v40;
  }
  return v38;
}

uint64_t sub_1000BF79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000BF7AC()
{
  return swift_release();
}

uint64_t sub_1000BF7B4(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159D78, (void (*)(uint64_t))type metadata accessor for Initial);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF80C(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159D90, (void (*)(uint64_t))type metadata accessor for WaitForNetwork);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF864(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159DA8, (void (*)(uint64_t))type metadata accessor for InitialLoadPublicKeyState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF8BC(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159DC0, (void (*)(uint64_t))type metadata accessor for ReloadPublicKeyState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF914(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159DD8, (void (*)(uint64_t))type metadata accessor for MilestoneDownloadState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF96C(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159DF0, (void (*)(uint64_t))type metadata accessor for PatConsistencyState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BF9C4(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159E08, (void (*)(uint64_t))type metadata accessor for DetectSplitViewState);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000BFA1C(uint64_t a1)
{
  uint64_t result = sub_1000B7DE8(&qword_100159E20, (void (*)(uint64_t))type metadata accessor for Ready);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for SWT2SM()
{
  return self;
}

uint64_t sub_1000BFA98()
{
  return type metadata accessor for Initial(0);
}

uint64_t sub_1000BFAA4()
{
  return type metadata accessor for WaitForNetwork(0);
}

void sub_1000BFAAC()
{
  sub_100091B38();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000BFB60()
{
  return type metadata accessor for InitialLoadPublicKeyState(0);
}

void sub_1000BFB68()
{
  sub_100091B38();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

ValueMetadata *type metadata accessor for InitialLoadPublicKeyState.FetchStatus()
{
  return &type metadata for InitialLoadPublicKeyState.FetchStatus;
}

uint64_t sub_1000BFC4C()
{
  return type metadata accessor for ReloadPublicKeyState(0);
}

uint64_t sub_1000BFC54()
{
  return type metadata accessor for MilestoneDownloadState(0);
}

uint64_t sub_1000BFC5C()
{
  return type metadata accessor for PatConsistencyState(0);
}

uint64_t sub_1000BFC64()
{
  return type metadata accessor for DetectSplitViewState(0);
}

uint64_t sub_1000BFC6C()
{
  return type metadata accessor for Ready(0);
}

void sub_1000BFC74()
{
  sub_100091B38();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1000BFD30()
{
  unint64_t result = qword_100157A88;
  if (!qword_100157A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_100157A88);
  }
  return result;
}

void sub_1000BFD80(char a1)
{
  uint64_t v2 = v1;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setHTTPMethod:v4];

  if (a1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v5)
  {
LABEL_5:
    NSString v6 = String._bridgeToObjectiveC()();
    NSString v7 = String._bridgeToObjectiveC()();
    [v1 setValue:v6 forHTTPHeaderField:v7];
  }
  NSString v8 = String._bridgeToObjectiveC()();
  NSString v9 = String._bridgeToObjectiveC()();
  [v1 setValue:v8 forHTTPHeaderField:v9];

  id v10 = self;
  NSString v11 = [v10 deviceUserAgent];
  if (!v11)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  NSString v12 = String._bridgeToObjectiveC()();
  [v1 setValue:v11 forHTTPHeaderField:v12];

  sub_10008E068();
  BinaryInteger.description.getter();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v13 forHTTPHeaderField:off_100156D90];

  id v14 = (id)ProtocolVersion_EnumDescriptor();
  id v15 = [v14 textFormatNameForValue:kTransparencyProtocolVersion];

  [v2 setValue:v15 forHTTPHeaderField:off_100156D98];
  NSString v16 = [v10 transparencyVersionStr];
  if (!v16)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [v2 setValue:v16 forHTTPHeaderField:off_100156DA8];

  id v17 = [v10 automatedDeviceGroup];
  if (v17)
  {
    id v18 = v17;
    [v2 setValue:v17 forHTTPHeaderField:off_100156DA0];
  }
}

uint64_t sub_1000C00C0(char a1)
{
  if (a1) {
    return 1414745936;
  }
  else {
    return 5522759;
  }
}

uint64_t sub_1000C00E8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1414745936;
  }
  else {
    uint64_t v3 = 5522759;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1414745936;
  }
  else {
    uint64_t v5 = 5522759;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000C0180(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10013AA98, v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000C01D4(char *a1, char *a2)
{
  return sub_1000C00E8(*a1, *a2);
}

Swift::Int sub_1000C01E0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C0254()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000C02B4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C0324@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10013AA98, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_1000C0384(uint64_t *a1@<X8>)
{
  uint64_t v2 = 5522759;
  if (*v1) {
    uint64_t v2 = 1414745936;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

id sub_1000C03B4(uint64_t a1, double a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  URL._bridgeToObjectiveC()(v5);
  char v7 = v6;
  id v8 = [v4 initWithURL:v6 cachePolicy:0 timeoutInterval:a2];

  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

unint64_t sub_1000C0468()
{
  unint64_t result = qword_10015A5F0;
  if (!qword_10015A5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015A5F0);
  }
  return result;
}

unsigned char *_s10HTTPMethodOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000C0588);
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

ValueMetadata *_s10HTTPMethodOMa()
{
  return &_s10HTTPMethodON;
}

BOOL sub_1000C48D4(int a1)
{
  return a1 != -72499473;
}

double sub_1000C58C4(void *a1)
{
  sub_1000C5D04(a1, 8);
  uint64_t v2 = a1[2];
  double result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float sub_1000C5900(void *a1)
{
  sub_1000C5D04(a1, 4);
  uint64_t v2 = a1[2];
  float result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_1000C5940(uint64_t *a1)
{
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  while (v2 <= 0x3F)
  {
    sub_1000C5D04(a1, 1);
    uint64_t v4 = *a1;
    uint64_t v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(unsigned char *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0) {
      return v3;
    }
  }
  sub_1000C5B78(-105, @"Invalid VarInt64");
  return 0;
}

uint64_t sub_1000C59C8(uint64_t *a1)
{
  return sub_1000C5940(a1);
}

uint64_t sub_1000C59E0(void *a1)
{
  sub_1000C5D04(a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t sub_1000C5A1C(void *a1)
{
  sub_1000C5D04(a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_1000C5A58(uint64_t *a1)
{
  unsigned int v1 = sub_1000C5940(a1);
  return -(v1 & 1) ^ (v1 >> 1);
}

unint64_t sub_1000C5A7C(uint64_t *a1)
{
  unint64_t v1 = sub_1000C5940(a1);
  return -(uint64_t)(v1 & 1) ^ (v1 >> 1);
}

BOOL sub_1000C5AA0(uint64_t *a1)
{
  return sub_1000C5940(a1) != 0;
}

uint64_t sub_1000C5AC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a1 + 8) || v2 == *(void *)(a1 + 24))
  {
    uint64_t v3 = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    uint64_t v3 = sub_1000C5940((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = v3;
    if (!sub_1000FA71C(v3))
    {
      sub_1000C5B78(-103, @"Invalid wireformat in tag.");
      uint64_t v3 = *(unsigned int *)(a1 + 32);
    }
    if (!sub_1000FA714(v3))
    {
      sub_1000C5B78(-103, @"A zero field number on the wire is invalid.");
      return *(unsigned int *)(a1 + 32);
    }
  }
  return v3;
}

BOOL sub_1000C5B54(void *a1)
{
  uint64_t v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

id sub_1000C5B78(uint64_t a1, void *a2)
{
  if ([a2 length])
  {
    CFStringRef v8 = @"Reason";
    uint64_t v9 = a2;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  CFStringRef v6 = @"TransparencyGPBCodedInputStreamUnderlyingErrorKey";
  char v7 = +[NSError errorWithDomain:@"TransparencyGPBCodedInputStreamErrorDomain" code:a1 userInfo:v4];
  return [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"TransparencyGPBCodedInputStreamException", a2, +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]) raise];
}

CFStringRef sub_1000C5C70(uint64_t *a1)
{
  int v2 = sub_1000C5940(a1);
  if (!v2) {
    return &stru_10013DAE0;
  }
  sub_1000C5D04(a1, v2);
  CFStringRef result = (const __CFString *)[objc_alloc((Class)NSString) initWithBytes:*a1 + a1[2] length:v2 encoding:4];
  a1[2] += v2;
  if (!result)
  {
    sub_1000C5B78(-104, 0);
    return 0;
  }
  return result;
}

void *sub_1000C5D04(void *result, uint64_t a2)
{
  int v2 = result;
  unint64_t v3 = result[2] + a2;
  if (v3 > result[1]) {
    CFStringRef result = sub_1000C5B78(-100, 0);
  }
  unint64_t v4 = v2[3];
  if (v3 > v4)
  {
    v2[2] = v4;
    return sub_1000C5B78(-101, 0);
  }
  return result;
}

id sub_1000C5D74(uint64_t *a1)
{
  unsigned int v2 = sub_1000C5940(a1);
  if ((v2 & 0x80000000) != 0) {
    return 0;
  }
  sub_1000C5D04(a1, v2);
  id result = [objc_alloc((Class)NSData) initWithBytes:*a1 + a1[2] length:v2];
  a1[2] += v2;
  return result;
}

id sub_1000C5DEC(uint64_t *a1)
{
  unsigned int v2 = sub_1000C5940(a1);
  if ((v2 & 0x80000000) != 0) {
    return 0;
  }
  sub_1000C5D04(a1, v2);
  id result = [objc_alloc((Class)NSData) initWithBytesNoCopy:*a1 + a1[2] length:v2 freeWhenDone:0];
  a1[2] += v2;
  return result;
}

unint64_t sub_1000C5E68(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(a1 + 16) + a2;
  if (v4 > v3) {
    sub_1000C5B78(-102, 0);
  }
  *(void *)(a1 + 24) = v4;
  return v3;
}

uint64_t sub_1000C5EB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_1000C5EBC(uint64_t a1)
{
  return *(void *)(a1 + 24) - *(void *)(a1 + 16);
}

_DWORD *sub_1000C5EC8(_DWORD *result, int a2)
{
  if (result[8] != a2) {
    return sub_1000C5B78(-103, @"Unexpected tag read");
  }
  return result;
}

uint64_t *sub_1000C6964(uint64_t *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    id result = sub_1000C99F4(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = BYTE3(a2);
  uint64_t v12 = v3[2];
  if (v12 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v12 = v3[2];
  }
  uint64_t v13 = *v3;
  v3[2] = v12 + 1;
  *(unsigned char *)(v13 + v12) = BYTE4(a2);
  uint64_t v14 = v3[2];
  if (v14 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v14 = v3[2];
  }
  uint64_t v15 = *v3;
  v3[2] = v14 + 1;
  *(unsigned char *)(v15 + v14) = BYTE5(a2);
  uint64_t v16 = v3[2];
  if (v16 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v16 = v3[2];
  }
  uint64_t v17 = *v3;
  v3[2] = v16 + 1;
  *(unsigned char *)(v17 + v16) = BYTE6(a2);
  uint64_t v18 = v3[2];
  if (v18 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v18 = v3[2];
  }
  uint64_t v19 = *v3;
  v3[2] = v18 + 1;
  *(unsigned char *)(v19 + v18) = HIBYTE(a2);
  return result;
}

uint64_t *sub_1000C6B4C(uint64_t *result, int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    id result = sub_1000C99F4(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t *sub_1000C6C84(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        id result = sub_1000C99F4(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unint64_t v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_1000C6DE4(uint64_t *result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return sub_1000C6C84(result, (int)a2);
  }
  else {
    return sub_1000C7120(result, a2);
  }
}

uint64_t *sub_1000C7120(uint64_t *result, unsigned int a2)
{
  unsigned int v2 = a2;
  unint64_t v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        id result = sub_1000C99F4(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unsigned int v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    id result = sub_1000C99F4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_1000C7534(uint64_t *a1, int a2, unsigned int a3)
{
  unsigned int v5 = sub_1000FA704(a2, 0);
  sub_1000C7120(a1, v5);

  return sub_1000C7120(a1, a3);
}

void sub_1000C7908(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7920(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_1000C7938(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDoubleNoTag:];
}

id sub_1000C7940(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDouble:*(unsigned int *)(a1 + 40)];
}

void sub_1000C7AE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7AF8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_1000C7B10(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloatNoTag:];
}

id sub_1000C7B18(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloat:*(unsigned int *)(a1 + 40)];
}

void sub_1000C7CB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7CD0(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_1000C9CB8(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1000C7D10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64NoTag:a2];
}

id sub_1000C7D1C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C7EC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7ED8(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_1000C9CB8(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1000C7F14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64NoTag:a2];
}

id sub_1000C7F20(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C80C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C80DC(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_1000C8134(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

id sub_1000C8178(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32NoTag:a2];
}

id sub_1000C8184(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8328(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C8340(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_1000C838C(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

id sub_1000C83C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32NoTag:a2];
}

id sub_1000C83D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8574(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C858C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_1000C85A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64NoTag:a2];
}

id sub_1000C85B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8754(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C876C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_1000C8784(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32NoTag:a2];
}

id sub_1000C8790(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8934(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C894C(uint64_t result, int a2)
{
  unsigned int v2 = (2 * a2) ^ (a2 >> 31);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t sub_1000C89A0(int a1)
{
  unsigned int v1 = (2 * a1) ^ (a1 >> 31);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

id sub_1000C89E0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32NoTag:a2];
}

id sub_1000C89EC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8B90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C8BA8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000C9CB8((2 * a2) ^ (a2 >> 63));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000C8BE8(uint64_t a1)
{
  return sub_1000C9CB8((2 * a1) ^ (a1 >> 63));
}

id sub_1000C8BF4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64NoTag:a2];
}

id sub_1000C8C00(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8DA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C8DBC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_1000C8DD4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64NoTag:a2];
}

id sub_1000C8DE0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C8F84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C8F9C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_1000C8FB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32NoTag:a2];
}

id sub_1000C8FC0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C9164(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C917C(uint64_t result)
{
  return result;
}

id sub_1000C9194(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBoolNoTag:a2];
}

id sub_1000C91A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBool:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_1000C9344(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C935C(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

id sub_1000C93B4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnumNoTag:a2];
}

id sub_1000C93C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnum:*(unsigned int *)(a1 + 40) value:a2];
}

void *sub_1000C99F4(void *result)
{
  uint64_t v1 = result;
  if (!result[3]) {
    uint64_t result = +[NSException raise:@"OutOfSpace" format:&stru_10013DAE0];
  }
  if (v1[2])
  {
    uint64_t result = [v1[3] write:*v1];
    if (result != (void *)v1[2]) {
      uint64_t result = +[NSException raise:@"WriteFailed" format:&stru_10013DAE0];
    }
    v1[2] = 0;
  }
  return result;
}

uint64_t sub_1000C9CB8(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  if (a1 < 0x4000) {
    return 2;
  }
  if (a1 < 0x200000) {
    return 3;
  }
  if (!(a1 >> 28)) {
    return 4;
  }
  if (!(a1 >> 35)) {
    return 5;
  }
  if (!(a1 >> 42)) {
    return 6;
  }
  if (!(a1 >> 49)) {
    return 7;
  }
  uint64_t v2 = 9;
  if ((a1 & 0x8000000000000000) != 0) {
    uint64_t v2 = 10;
  }
  if (HIBYTE(a1)) {
    return v2;
  }
  else {
    return 8;
  }
}

char *sub_1000C9D48(void *a1)
{
  uint64_t v1 = (char *)[a1 lengthOfBytesUsingEncoding:4];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

char *sub_1000C9DA0(void *a1)
{
  uint64_t v1 = (char *)[a1 serializedSize];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

char *sub_1000C9DF0(void *a1)
{
  uint64_t v1 = (char *)[a1 length];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

uint64_t sub_1000C9E40(int a1)
{
  unsigned int v1 = sub_1000FA704(a1, 0);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (v1 >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t sub_1000C9E90(int a1)
{
  unsigned int v1 = sub_1000FA704(a1, 0);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

uint64_t sub_1000C9EE0(int a1)
{
  unsigned int v1 = sub_1000FA704(a1, 0);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (v1 >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t sub_1000C9F30(int a1, unint64_t a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return sub_1000C9CB8(a2) + v7;
}

uint64_t sub_1000C9F98(int a1, unsigned int a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 10;
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (a2 >> 28) {
    uint64_t v12 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (a2 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x80) {
    uint64_t v9 = v10;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t sub_1000CA038(int a1)
{
  unsigned int v1 = sub_1000FA704(a1, 0);
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  if (v1 >> 28) {
    uint64_t v4 = 6;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 2;
  }
}

char *sub_1000CA088(int a1, void *a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 lengthOfBytesUsingEncoding:4];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *sub_1000CA12C(int a1, void *a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 4;
  uint64_t v5 = 6;
  uint64_t v6 = 10;
  if (!(v3 >> 28)) {
    uint64_t v6 = 8;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 2;
  }
  return (char *)[a2 serializedSize] + v7;
}

char *sub_1000CA198(int a1, void *a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 serializedSize];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *sub_1000CA238(int a1, void *a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 length];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

uint64_t sub_1000CA2D8(int a1, unsigned int a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (a2 >> 28) {
    uint64_t v11 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t sub_1000CA36C(int a1, int a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  unsigned int v8 = (2 * a2) ^ (a2 >> 31);
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v8 >> 28) {
    uint64_t v11 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v8 >= 0x80) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 1;
  }
  return v12 + v4;
}

uint64_t sub_1000CA408(int a1, uint64_t a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return sub_1000C9CB8((2 * a2) ^ (a2 >> 63)) + v7;
}

char *sub_1000CA474(unsigned int a1, void *a2)
{
  unsigned int v4 = sub_1000FA704(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(v4 >> 28)) {
    uint64_t v7 = 8;
  }
  if (v4 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v4 >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = sub_1000CA2D8(2, a1) + v8;
  return &sub_1000CA198(3, a2)[v9];
}

char *sub_1000CA504(unsigned int a1, void *a2)
{
  unsigned int v4 = sub_1000FA704(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(v4 >> 28)) {
    uint64_t v7 = 8;
  }
  if (v4 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v4 >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = sub_1000CA2D8(2, a1) + v8;
  return &sub_1000CA238(3, a2)[v9];
}

uint64_t sub_1000CA594(int a1, int a2)
{
  unsigned int v3 = sub_1000FA704(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  return v4 << (a2 == 16);
}

void sub_1000CAE3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

SEL sub_1000CB728(char *__s, char *str, const char *a3, int a4)
{
  if (!__s && !a3 && (a4 & 1) == 0)
  {
    return sel_getUid(str);
  }
  if (__s) {
    size_t v9 = strlen(__s);
  }
  else {
    size_t v9 = 0;
  }
  size_t v10 = strlen(str);
  size_t v11 = v10;
  if (a3)
  {
    size_t v10 = strlen(a3);
    size_t v12 = v10;
  }
  else
  {
    size_t v12 = 0;
  }
  uint64_t v18 = (uint64_t)&v18;
  size_t v13 = v11 + v9 + v12;
  uint64_t v14 = 1;
  if (a4) {
    uint64_t v14 = 2;
  }
  size_t v15 = v13 + v14;
  __chkstk_darwin(v10);
  uint64_t v17 = (char *)&v18 - v16;
  bzero((char *)&v18 - v16, v15);
  if (!__s)
  {
    memcpy(v17, str, v11);
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  memcpy(v17, __s, v9);
  memcpy(&v17[v9], str, v11);
  v17[v9] = __toupper(v17[v9]);
  if (a3) {
LABEL_17:
  }
    memcpy(&v17[v9 + v11], a3, v12);
LABEL_18:
  if (a4) {
    v17[v13] = 58;
  }
  v17[v15 - 1] = 0;
  return sel_getUid(v17);
}

uint64_t sub_1000CBB7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned int v2 = *(unsigned __int16 *)(v1 + 28);
  if ((v2 & 0xF00) != 0)
  {
    int v3 = 15;
    LOBYTE(v4) = 0;
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v1 + 30);
    int v4 = (v2 >> 2) & 1;
  }
  int v5 = sub_1000FA72C(v3, v4);
  int v6 = *(_DWORD *)(v1 + 16);

  return sub_1000FA704(v6, v5);
}

uint64_t sub_1000CBBD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  int v2 = sub_1000FA72C(*(unsigned __int8 *)(v1 + 30), (*(_WORD *)(v1 + 28) & 4) == 0);
  int v3 = *(_DWORD *)(v1 + 16);

  return sub_1000FA704(v3, v2);
}

void sub_1000CC4C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000CCC30(void *a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 30);
  id v5 = [a1 keyEnumerator];
  id v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    do
    {
      id v9 = [a1 objectForKeyedSubscript:v7];
      size_t v10 = sub_1000CA088(1, v7);
      size_t v11 = &v10[(void)sub_1000CCD14(v9, v4)];
      v8 += (uint64_t)&v11[sub_1000C838C(v11)];
      id v7 = [v5 nextObject];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = sub_1000CA594(*(_DWORD *)(*(void *)(a2 + 8) + 16), 15);
  return v8 + (void)[a1 count] * v12;
}

char *sub_1000CCD14(void *a1, int a2)
{
  switch(a2)
  {
    case 13:
      return sub_1000CA238(2, a1);
    case 14:
      return sub_1000CA088(2, a1);
    case 15:
      return sub_1000CA198(2, a1);
  }
  return 0;
}

id sub_1000CCD5C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 8);
  int v6 = *(unsigned __int8 *)(v5 + 30);
  uint64_t v7 = sub_1000FA704(*(_DWORD *)(v5 + 16), 2);
  id v8 = [a2 keyEnumerator];
  id result = [v8 nextObject];
  if (result)
  {
    size_t v10 = result;
    do
    {
      id v11 = [a2 objectForKeyedSubscript:v10];
      [a1 writeInt32NoTag:v7];
      unsigned int v12 = sub_1000CA088(1, v10);
      [a1 writeInt32NoTag:sub_1000CCD14(v11, v6) + v12];
      [a1 writeString:1 value:v10];
      sub_1000CCE48(a1, (const char *)v11, v6);
      id result = [v8 nextObject];
      size_t v10 = result;
    }
    while (result);
  }
  return result;
}

void *sub_1000CCE48(void *a1, const char *a2, int a3)
{
  switch(a3)
  {
    case 13:
      return [a1 writeBytes:2 value:a2];
    case 14:
      return [a1 writeString:2 value:a2];
    case 15:
      return [a1 writeMessage:2 value:a2];
  }
  return a1;
}

BOOL sub_1000CCE88(void *a1)
{
  id v1 = [a1 objectEnumerator];
  do
  {
    id v2 = [v1 nextObject];
    id v3 = v2;
  }
  while (v2 && ([v2 isInitialized] & 1) != 0);
  return v3 == 0;
}

void sub_1000CCED0(void *a1, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = [a4 mapKeyDataType];
  int v10 = *(unsigned __int8 *)(a4[1] + 30);
  int64_t v24 = 0;
  id v25 = 0;
  if (v10 == 17) {
    int64_t v24 = (__CFString *)[a4 defaultValue];
  }
  int v11 = sub_1000FA72C((int)v9, 0);
  int v12 = sub_1000FA704(1, v11);
  int v13 = sub_1000FA72C(v10, 0);
  int v14 = sub_1000FA704(2, v13);
  while (1)
  {
    while (1)
    {
      uint64_t v15 = sub_1000C5AC0((uint64_t)(a2 + 1));
      if (v15 == v12)
      {
        uint64_t v16 = (id *)&v25;
        uint64_t v17 = a2;
        int v18 = (int)v9;
        goto LABEL_8;
      }
      uint64_t v19 = v15;
      if (v15 != v14) {
        break;
      }
      uint64_t v16 = (id *)&v24;
      uint64_t v17 = a2;
      int v18 = v10;
LABEL_8:
      sub_1000CD150(v17, v16, v18, a3, a4);
    }
    if (!v15) {
      break;
    }
    if (([a2 skipField:v15] & 1) == 0) {
      goto LABEL_32;
    }
  }
  uint64_t v20 = v25;
  if (v9 == 14 && !v25)
  {
    uint64_t v20 = &stru_10013DAE0;
    id v25 = v20;
  }
  char v21 = v24;
  if ((v10 - 13) > 3u || v24) {
    goto LABEL_25;
  }
  switch(v10)
  {
    case 13:
      uint64_t v22 = (__CFString *)(id)sub_1000F6AE0();
LABEL_23:
      char v21 = v22;
      int64_t v24 = v22;
      goto LABEL_25;
    case 15:
      uint64_t v22 = (__CFString *)[a4 msgClass:v19];
      goto LABEL_23;
    case 14:
      uint64_t v22 = &stru_10013DAE0;
      goto LABEL_23;
  }
  char v21 = 0;
LABEL_25:
  if (v9 == 14 && (v10 - 13) <= 3u)
  {
    [a1 setObject:v21 forKey:v20];
    goto LABEL_34;
  }
  if (v10 == 17
    && (*(_WORD *)(a4[1] + 28) & 0x1000) != 0
    && ![a4 isValidEnumValue:v21])
  {
    [a5 addUnknownMapEntry:*(unsigned int *)(a4[1] + 16) value:[a1 serializedDataForUnknownValue:v21 forKey:&v25 keyDataType:v9]];
  }
  else
  {
    [a1 setTransparencyGPBGenericValue:&v24 forTransparencyGPBGenericValueKey:&v25];
  }
LABEL_32:
  if (((_BYTE)v9 - 13) > 3u) {
    goto LABEL_35;
  }
  uint64_t v20 = v25;
LABEL_34:

LABEL_35:
  if ((v10 - 13) <= 3u) {
}
  }

void sub_1000CD150(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  switch(a3)
  {
    case 0:
      *(unsigned char *)a2 = sub_1000C5AA0(a1 + 1);
      return;
    case 1:
    case 2:
      int v7 = sub_1000C5A1C(a1 + 1);
      goto LABEL_15;
    case 3:
      *(float *)a2 = sub_1000C5900(a1 + 1);
      return;
    case 4:
    case 5:
      uint64_t v8 = sub_1000C59E0(a1 + 1);
      goto LABEL_12;
    case 6:
      *(double *)a2 = sub_1000C58C4(a1 + 1);
      return;
    case 7:
    case 11:
    case 17:
      int v7 = sub_1000C59C8(a1 + 1);
      goto LABEL_15;
    case 8:
    case 12:
      uint64_t v8 = sub_1000C593C(a1 + 1);
      goto LABEL_12;
    case 9:
      int v7 = sub_1000C5A58(a1 + 1);
LABEL_15:
      *(_DWORD *)a2 = v7;
      return;
    case 10:
      uint64_t v8 = sub_1000C5A7C(a1 + 1);
      goto LABEL_12;
    case 13:

      uint64_t v8 = (uint64_t)sub_1000C5D74(a1 + 1);
      goto LABEL_12;
    case 14:

      uint64_t v8 = (uint64_t)sub_1000C5C70(a1 + 1);
LABEL_12:
      *a2 = (id)v8;
      break;
    case 15:
      id v10 = objc_alloc_init((Class)[a5 msgClass]);
      [a1 readMessage:v10 extensionRegistry:a4];

      *a2 = v10;
      break;
    default:
      return;
  }
}

uint64_t sub_1000CD810(unsigned int a1, int a2, int a3)
{
  if (a3 == 1) {
    return sub_1000C9EE0(a2);
  }
  if (a3 == 11) {
    return sub_1000CA2D8(a2, a1);
  }
  return 0;
}

uint64_t sub_1000CDA90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000CE104(unsigned int a1, int a2, int a3)
{
  switch(a3)
  {
    case 2:
      return sub_1000C9EE0(a2);
    case 9:
      return sub_1000CA36C(a2, a1);
    case 7:
      return sub_1000C9F98(a2, a1);
  }
  return 0;
}

id sub_1000CE2A4(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 2:
      return _[result writeSFixed32:a3 value:a2];
    case 9:
      return _[result writeSInt32:a3 value:a2];
    case 7:
      return _[result writeInt32:a3 value:a2];
  }
  return result;
}

uint64_t sub_1000CE3AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000CEA18(unint64_t a1, int a2, int a3)
{
  if (a3 == 4) {
    return sub_1000C9E40(a2);
  }
  if (a3 == 12) {
    return sub_1000C9F30(a2, a1);
  }
  return 0;
}

uint64_t sub_1000CEC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000CF304(unint64_t a1, int a2, int a3)
{
  switch(a3)
  {
    case 5:
      return sub_1000C9E40(a2);
    case 10:
      return sub_1000CA408(a2, a1);
    case 8:
      return sub_1000C9F30(a2, a1);
  }
  return 0;
}

id sub_1000CF4A4(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 5:
      return _[result writeSFixed64:a3 value:a2];
    case 10:
      return _[result writeSInt64:a3 value:a2];
    case 8:
      return _[result writeInt64:a3 value:a2];
  }
  return result;
}

uint64_t sub_1000CF5AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000CFE14(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D0670(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D0EEC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

BOOL sub_1000D1220(int a1)
{
  return a1 != -72499473;
}

uint64_t sub_1000D1884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D24C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1000D2D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D35A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D3E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D46BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D4F04(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D5740(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D5F9C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D68E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D74FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1000D7D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D8620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D8ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D9778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000D9FE0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DA83C(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DB0B8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DBA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DC678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1000DCEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DD75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DDFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DE86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DF0BC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000DF8F8(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000E0154(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000E0A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000E16B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_1000E1EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E26D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E2EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E36C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E3E88(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v3 + 16))(v3, a2, v4);
}

uint64_t sub_1000E4600(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E4DD0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000E567C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, NSNumber *))(v3 + 16);

  return v5(v3, a2, v4);
}

id sub_1000E9F50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v5 + 45))
  {
    if ((*(unsigned char *)(v5 + 45) & 2) != 0)
    {
      [a3 writeTag:*(unsigned int *)(v5 + 40) format:2];
      unint64_t v10 = *(char *)(v5 + 44);
      if (v10 > 6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v12 = 0;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(a2);
              }
              v12 += (uint64_t)sub_1000EAE34((id)*(unsigned __int8 *)(v5 + 44), *(void **)(*((void *)&v24 + 1) + 8 * i));
            }
            id v14 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v11 = qword_10010E530[v10];
        uint64_t v12 = (void)[a2 count] * v11;
      }
      [a3 writeRawVarintSizeTAs32:v12];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
      if (result)
      {
        id v17 = result;
        uint64_t v18 = *(void *)v21;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(a2);
            }
            switch(*(unsigned char *)(v5 + 44))
            {
              case 0:
                [a3 writeBoolNoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) BOOLValue]];
                break;
              case 1:
                [a3 writeFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 2:
                [a3 writeSFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 3:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) floatValue];
                [a3 writeFloatNoTag:];
                break;
              case 4:
                [a3 writeFixed64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 5:
                [a3 writeSFixed64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 6:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) doubleValue];
                [a3 writeDoubleNoTag:];
                break;
              case 7:
                [a3 writeInt32NoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) intValue]];
                break;
              case 8:
                [a3 writeInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 9:
                [a3 writeSInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 0xA:
                [a3 writeSInt64NoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) longLongValue]];
                break;
              case 0xB:
                [a3 writeUInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 0xC:
                [a3 writeUInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 0xD:
                [a3 writeBytesNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xE:
                [a3 writeStringNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xF:
                [a3 writeMessageNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x10:
                [a3 writeGroupNoTag:*(unsigned int *)(v5 + 40) value:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x11:
                [a3 writeEnumNoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              default:
                break;
            }
            uint64_t v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
          id v17 = result;
        }
        while (result);
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (result)
      {
        id v7 = result;
        uint64_t v8 = *(void *)v29;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(a2);
            }
            sub_1000EA404(*(id *)(*((void *)&v28 + 1) + 8 * (void)v9), v5, a3);
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
          id v7 = result;
        }
        while (result);
      }
    }
  }
  else
  {
    return sub_1000EA404(a2, v5, a3);
  }
  return result;
}

id sub_1000EA404(id result, uint64_t a2, void *a3)
{
  switch(*(unsigned char *)(a2 + 44))
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a2 + 40);
      id v5 = [result BOOLValue];
      id result = [a3 writeBool:v4 value:v5];
      break;
    case 1:
      uint64_t v18 = *(unsigned int *)(a2 + 40);
      id v19 = [result unsignedIntValue];
      id result = [a3 writeFixed32:v18 value:v19];
      break;
    case 2:
      uint64_t v6 = *(unsigned int *)(a2 + 40);
      id v7 = [result intValue];
      id result = _[a3 writeSFixed32:v6 value:v7];
      break;
    case 3:
      uint64_t v20 = *(unsigned int *)(a2 + 40);
      [result floatValue];
      id result = [a3 writeFloat:v20];
      break;
    case 4:
      uint64_t v8 = *(unsigned int *)(a2 + 40);
      id v9 = [result unsignedLongLongValue];
      id result = [a3 writeFixed64:v8 value:v9];
      break;
    case 5:
      uint64_t v21 = *(unsigned int *)(a2 + 40);
      id v22 = [result longLongValue];
      id result = _[a3 writeSFixed64:v21 value:v22];
      break;
    case 6:
      uint64_t v23 = *(unsigned int *)(a2 + 40);
      [result doubleValue];
      id result = [a3 writeDouble:v23];
      break;
    case 7:
      uint64_t v24 = *(unsigned int *)(a2 + 40);
      id v25 = [result intValue];
      id result = _[a3 writeInt32:v24 value:v25];
      break;
    case 8:
      uint64_t v26 = *(unsigned int *)(a2 + 40);
      id v27 = [result longLongValue];
      id result = _[a3 writeInt64:v26 value:v27];
      break;
    case 9:
      uint64_t v10 = *(unsigned int *)(a2 + 40);
      id v11 = [result intValue];
      id result = _[a3 writeSInt32:v10 value:v11];
      break;
    case 0xA:
      uint64_t v28 = *(unsigned int *)(a2 + 40);
      id v29 = [result longLongValue];
      id result = _[a3 writeSInt64:v28 value:v29];
      break;
    case 0xB:
      uint64_t v12 = *(unsigned int *)(a2 + 40);
      id v13 = [result unsignedIntValue];
      id result = [a3 writeUInt32:v12 value:v13];
      break;
    case 0xC:
      uint64_t v14 = *(unsigned int *)(a2 + 40);
      id v15 = [result unsignedLongLongValue];
      id result = [a3 writeUInt64:v14 value:v15];
      break;
    case 0xD:
      uint64_t v30 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeBytes:v30 value:result];
      break;
    case 0xE:
      uint64_t v16 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeString:v16 value:result];
      break;
    case 0xF:
      uint64_t v31 = *(unsigned int *)(a2 + 40);
      if ((*(unsigned char *)(a2 + 45) & 4) != 0)
      {
        id result = _[a3 writeMessageSetExtension:v31 value:result];
      }
      else
      {
        id result = [a3 writeMessage:v31 value:result];
      }
      break;
    case 0x10:
      uint64_t v17 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeGroup:v17 value:result];
      break;
    case 0x11:
      uint64_t v32 = *(unsigned int *)(a2 + 40);
      id v33 = [result intValue];
      id result = [a3 writeEnum:v32 value:v33];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000EA820(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v3 + 45))
  {
    if ((*(unsigned char *)(v3 + 45) & 2) != 0)
    {
      unint64_t v11 = *(char *)(v3 + 44);
      if (v11 > 6)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v14 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v13 = 0;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(a2);
              }
              v13 += (uint64_t)sub_1000EAE34((id)*(unsigned __int8 *)(v3 + 44), *(void **)(*((void *)&v19 + 1) + 8 * i));
            }
            id v15 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v12 = qword_10010E530[v11];
        uint64_t v13 = (void)[a2 count] * v12;
      }
      uint64_t v18 = sub_1000C9E90(*(_DWORD *)(v3 + 40));
      return v18 + v13 + sub_1000C838C(v13);
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(a2);
            }
            v8 += sub_1000EAA68(v3, *(void **)(*((void *)&v19 + 1) + 8 * (void)j));
          }
          id v7 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);
      }
      else
      {
        return 0;
      }
    }
    return v8;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 8);
    return sub_1000EAA68(v4, a2);
  }
}

uint64_t sub_1000EAA68(uint64_t result, void *a2)
{
  switch(*(unsigned char *)(result + 44))
  {
    case 0:
      int v2 = *(_DWORD *)(result + 40);
      [a2 BOOLValue];
      return sub_1000CA038(v2);
    case 1:
      int v16 = *(_DWORD *)(result + 40);
      [a2 unsignedIntValue];
      int v4 = v16;
      return sub_1000C9EE0(v4);
    case 2:
      int v3 = *(_DWORD *)(result + 40);
      [a2 intValue];
      int v4 = v3;
      return sub_1000C9EE0(v4);
    case 3:
      int v17 = *(_DWORD *)(result + 40);
      [a2 floatValue];
      int v4 = v17;
      return sub_1000C9EE0(v4);
    case 4:
      int v5 = *(_DWORD *)(result + 40);
      [a2 unsignedLongLongValue];
      int v6 = v5;
      return sub_1000C9E40(v6);
    case 5:
      int v18 = *(_DWORD *)(result + 40);
      [a2 longLongValue];
      int v6 = v18;
      return sub_1000C9E40(v6);
    case 6:
      int v19 = *(_DWORD *)(result + 40);
      [a2 doubleValue];
      int v6 = v19;
      return sub_1000C9E40(v6);
    case 7:
      int v20 = *(_DWORD *)(result + 40);
      unsigned int v21 = [a2 intValue];
      int v22 = v20;
      goto LABEL_40;
    case 8:
      int v23 = *(_DWORD *)(result + 40);
      id v12 = [a2 longLongValue];
      int v13 = v23;
      goto LABEL_19;
    case 9:
      int v7 = *(_DWORD *)(result + 40);
      int v8 = [a2 intValue];
      return sub_1000CA36C(v7, v8);
    case 0xA:
      int v24 = *(_DWORD *)(result + 40);
      id v25 = [a2 longLongValue];
      return sub_1000CA408(v24, (uint64_t)v25);
    case 0xB:
      int v9 = *(_DWORD *)(result + 40);
      unsigned int v10 = [a2 unsignedIntValue];
      return sub_1000CA2D8(v9, v10);
    case 0xC:
      int v11 = *(_DWORD *)(result + 40);
      id v12 = [a2 unsignedLongLongValue];
      int v13 = v11;
LABEL_19:
      id result = sub_1000C9F30(v13, (unint64_t)v12);
      break;
    case 0xD:
      int v26 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_1000CA238(v26, a2);
      break;
    case 0xE:
      int v14 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_1000CA088(v14, a2);
      break;
    case 0xF:
      char v27 = *(unsigned char *)(result + 45);
      unsigned int v28 = *(_DWORD *)(result + 40);
      if ((v27 & 4) != 0)
      {
        id result = (uint64_t)sub_1000CA474(v28, a2);
      }
      else
      {
        id result = (uint64_t)sub_1000CA198(v28, a2);
      }
      break;
    case 0x10:
      int v15 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_1000CA12C(v15, a2);
      break;
    case 0x11:
      int v29 = *(_DWORD *)(result + 40);
      unsigned int v21 = [a2 intValue];
      int v22 = v29;
LABEL_40:
      id result = sub_1000C9F98(v22, v21);
      break;
    default:
      return result;
  }
  return result;
}

id sub_1000EAE34(id result, void *a2)
{
  switch((int)result)
  {
    case 0:
      [a2 BOOLValue];
      return (id)sub_10002F848();
    case 1:
      [a2 unsignedIntValue];
      return (id)sub_10002F9F8();
    case 2:
      [a2 intValue];
      return (id)sub_10002F9F8();
    case 3:
      [a2 floatValue];
      return (id)sub_10002F9F8();
    case 4:
      [a2 unsignedLongLongValue];
      return (id)sub_1000BC464();
    case 5:
      [a2 longLongValue];
      return (id)sub_1000BC464();
    case 6:
      [a2 doubleValue];
      return (id)sub_1000BC464();
    case 7:
      unsigned int v2 = [a2 intValue];
      goto LABEL_25;
    case 8:
      id v3 = [a2 longLongValue];
      goto LABEL_28;
    case 9:
      int v4 = [a2 intValue];
      return (id)sub_1000C89A0(v4);
    case 10:
      id v5 = [a2 longLongValue];
      return (id)sub_1000C8BE8((uint64_t)v5);
    case 11:
      unsigned int v6 = [a2 unsignedIntValue];
      return (id)sub_1000C838C(v6);
    case 12:
      id v3 = [a2 unsignedLongLongValue];
LABEL_28:
      id result = (id)sub_1000C7D0C((unint64_t)v3);
      break;
    case 13:
      id result = sub_1000C9DF0(a2);
      break;
    case 14:
      id result = sub_1000C9D48(a2);
      break;
    case 15:
      id result = sub_1000C9DA0(a2);
      break;
    case 16:
      id result = [a2 serializedSize];
      break;
    case 17:
      unsigned int v2 = [a2 intValue];
LABEL_25:
      id result = (id)sub_1000C8134(v2);
      break;
    default:
      return result;
  }
  return result;
}

void sub_1000EB324(void *key, const __CFDictionary *a2, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_1000EB3DC, Value);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
    CFDictionarySetValue(theDict, key, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void sub_1000EB3DC(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void *sub_1000EB460(objc_class *a1, uint64_t a2, void *a3)
{
  id v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL sub_1000EB4A4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

id sub_1000EB4B4(void *a1)
{
  id result = (id)a1[4];
  if (result)
  {
    id v3 = (void *)a1[5];
    if (v3) {
      return (id)sub_1000F772C((uint64_t)result, v3, a1);
    }
    else {
      return [result setExtension:a1[6]];
    }
  }
  return result;
}

id sub_1000EB4DC(void *a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      int v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v9 fieldType] == 1 && sub_1000F70E4((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4) {
            unsigned int v10 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
          }
          else {
            unsigned int v10 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
          }
          *(void *)(a2 + *v10) = 0;
          return sub_1000EB4B4(a1);
        }
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

id sub_1000EB648(void *a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      int v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v9 fieldType] == 2 && sub_1000F70E4((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if ([v9 mapKeyDataType] == 14
            && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
          {
            unsigned int v10 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
          }
          else
          {
            unsigned int v10 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
          }
          *(void *)(a2 + *v10) = 0;
          return sub_1000EB4B4(a1);
        }
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_1000EB7C8(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      *(void *)(a1 + 32) = 0;

      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
    }
  }
}

NSError *sub_1000EBAD4(void *a1)
{
  if (!objc_msgSend(objc_msgSend(a1, "name"), "isEqual:", @"TransparencyGPBCodedInputStreamException")|| (id result = (NSError *)objc_msgSend(objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", @"TransparencyGPBCodedInputStreamUnderlyingErrorKey")) == 0)
  {
    id v3 = [a1 reason];
    if ([v3 length])
    {
      CFStringRef v5 = @"Reason";
      id v6 = v3;
      int v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    }
    else
    {
      int v4 = 0;
    }
    return +[NSError errorWithDomain:@"TransparencyGPBMessageErrorDomain" code:-100 userInfo:v4];
  }
  return result;
}

void sub_1000EC0E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 copyWithZone:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v5 forKey:a2];
}

NSMutableDictionary *sub_1000EC1CC(void *a1, uint64_t a2)
{
  if (![a1 count]) {
    return 0;
  }
  int v4 = -[NSMutableDictionary initWithCapacity:](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a2), "initWithCapacity:", [a1 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    int v22 = v4;
    do
    {
      int v8 = 0;
      id v23 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(a1);
        }
        int v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
        id v10 = [a1 objectForKey:v9];
        unsigned int v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if ([v9 isRepeated])
        {
          if (v11 > 1)
          {
            id v18 = [v10 mutableCopyWithZone:a2];
            goto LABEL_20;
          }
          id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v10 count]];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v10);
                }
                id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a2];
                [v12 addObject:v17];
              }
              id v14 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v14);
          }
          int v4 = v22;
          [(NSMutableDictionary *)v22 setObject:v12 forKey:v9];

          uint64_t v7 = v21;
          id v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            id v18 = [v10 copyWithZone:a2];
LABEL_20:
            int v19 = v18;
            [(NSMutableDictionary *)v4 setObject:v18 forKey:v9];

            goto LABEL_22;
          }
          [(NSMutableDictionary *)v4 setObject:v10 forKey:v9];
        }
LABEL_22:
        int v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

void *sub_1000EC7C8(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  if (*(unsigned __int8 *)(v4 + 30) - 15 >= 2)
  {
    if (sub_1000F7614(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16))) {
      return *(void **)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
    }
    else {
      return [a2 defaultValue];
    }
  }
  else
  {
    id v5 = (unint64_t *)(*(void *)(a1 + 64) + *(unsigned int *)(v4 + 24));
    id v6 = (void *)atomic_load(v5);
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)[a2 msgClass]);
      v6[4] = a1;
      uint64_t v7 = a2;
      uint64_t v8 = 0;
      v6[5] = v7;
      atomic_compare_exchange_strong((atomic_ullong *volatile)v5, (unint64_t *)&v8, (unint64_t)v6);
      if (v8)
      {
        sub_1000EB7C8((uint64_t)v6);

        return (void *)v8;
      }
    }
  }
  return v6;
}

void sub_1000ECBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000ECBD8(void *result, void *a2, void *a3, unsigned char *a4)
{
  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    id v6 = result;
    if ([a2 isRepeated])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (!result) {
        return result;
      }
      id v7 = result;
      uint64_t v8 = *(void *)v11;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) isInitialized];
        if (!result) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          id v7 = result;
          if (result) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
    else
    {
      id result = [a3 isInitialized];
      if (result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(v6[4] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_1000EDEF0(uint64_t a1, void *a2)
{
  [a2 containingMessageClass];
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return (uint64_t)[NSException raise:format:](NSException, @"raise:format:", NSInvalidArgumentException, @"Extension %@ used on wrong class (%@ instead of %@)", [a2 singletonName], objc_opt_class(), objc_msgSend(a2, @"containingMessageClass"));
  }
  return result;
}

void sub_1000EE8C8(void *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    int v9 = sub_1000C59C8(a3 + 1);
    unint64_t v10 = sub_1000C5E68((uint64_t)(a3 + 1), v9);
    while (sub_1000C5EBC((uint64_t)(a3 + 1)))
    {
      CFStringRef v11 = sub_1000F2CC8(a1, a5, a3, a4, 0);
      if (v11)
      {
        long long v12 = (__CFString *)v11;
        [a5 addExtension:a1 value:v11];
      }
    }
    sub_1000C5EB4((uint64_t)(a3 + 1), v10);
  }
  else
  {
    uint64_t v13 = a1[1];
    if (*(unsigned char *)(v13 + 45))
    {
      CFStringRef v15 = sub_1000F2CC8(a1, a5, a3, a4, 0);
      if (!v15) {
        return;
      }
      id v17 = (__CFString *)v15;
      [a5 addExtension:a1 value:v15];
    }
    else
    {
      if (*(unsigned __int8 *)(v13 + 44) - 15 > 1) {
        id v14 = 0;
      }
      else {
        id v14 = [a5 getExistingExtension:a1];
      }
      CFStringRef v16 = sub_1000F2CC8(a1, a5, a3, a4, v14);
      if (!v16) {
        return;
      }
      id v17 = (__CFString *)v16;
      [a5 setExtension:a1 value:v16];
    }
  }
}

uint64_t sub_1000EEA90(void *a1)
{
  uint64_t result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(TransparencyGPBUnknownFieldSet);
    sub_1000EB4B4(a1);
    return a1[1];
  }
  return result;
}

uint64_t sub_1000EF208(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(unsigned __int8 *)(a2[1] + 30);
  id v6 = (uint64_t *)(a3 + 8);
  id v7 = sub_1000EFEC4((uint64_t)a1, a2);
  int v8 = sub_1000C59C8(v6);
  unint64_t v9 = sub_1000C5E68((uint64_t)v6, v8);
  while (sub_1000C5EBC((uint64_t)v6))
  {
    switch(v5)
    {
      case 0:
        uint64_t v10 = sub_1000C5AA0(v6);
        goto LABEL_14;
      case 1:
      case 2:
        uint64_t v10 = sub_1000C5A1C(v6);
        goto LABEL_14;
      case 3:
        *(float *)&double v11 = sub_1000C5900(v6);
        [v7 addValue:v11];
        continue;
      case 4:
      case 5:
        uint64_t v10 = sub_1000C59E0(v6);
        goto LABEL_14;
      case 6:
        [v7 addValue:sub_1000C58C4(v6)];
        continue;
      case 7:
      case 11:
        uint64_t v10 = sub_1000C59C8(v6);
        goto LABEL_14;
      case 8:
      case 12:
        uint64_t v10 = sub_1000C593C(v6);
        goto LABEL_14;
      case 9:
        uint64_t v10 = sub_1000C5A58(v6);
        goto LABEL_14;
      case 10:
        uint64_t v10 = sub_1000C5A7C(v6);
LABEL_14:
        [v7 addValue:v10];
        break;
      case 17:
        uint64_t v12 = sub_1000C59C8(v6);
        if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && ![a2 isValidEnumValue:v12]) {
          [(id)sub_1000EEA90(a1) mergeVarintField:*(unsigned int *)(a2[1] + 16) value:v12];
        }
        else {
          [v7 addRawValue:v12];
        }
        break;
      default:
        continue;
    }
  }

  return sub_1000C5EB4((uint64_t)v6, v9);
}

void sub_1000EF440(void *a1, void *a2, uint64_t *a3, uint64_t a4)
{
  int v8 = sub_1000EFEC4((uint64_t)a1, a2);
  unint64_t v9 = a3 + 1;
  switch(*(unsigned char *)(a2[1] + 30))
  {
    case 0:
      sub_1000C5AA0(v9);
      goto LABEL_10;
    case 1:
    case 2:
      sub_1000C5A1C(v9);
      goto LABEL_10;
    case 3:
      *(float *)&double v10 = sub_1000C5900(v9);
      double v11 = v8;
      goto LABEL_6;
    case 4:
    case 5:
      sub_1000C59E0(v9);
      goto LABEL_27;
    case 6:
      double v10 = sub_1000C58C4(v9);
      double v11 = v8;
      goto LABEL_6;
    case 7:
    case 0xB:
      sub_1000C59C8(v9);
      goto LABEL_10;
    case 8:
    case 0xC:
      sub_1000C593C(v9);
      goto LABEL_27;
    case 9:
      sub_1000C5A58(v9);
LABEL_10:
      double v11 = v8;
      goto LABEL_6;
    case 0xA:
      sub_1000C5A7C(v9);
LABEL_27:
      double v11 = v8;
LABEL_6:
      [v11 addValue:v10];
      return;
    case 0xD:
      uint64_t v12 = sub_1000C5D74(v9);
      goto LABEL_31;
    case 0xE:
      uint64_t v12 = (void *)sub_1000C5C70(v9);
LABEL_31:
      id v14 = v12;
      id v18 = v12;
      uint64_t v13 = v8;
      goto LABEL_32;
    case 0xF:
      id v18 = objc_alloc_init((Class)[a2 msgClass]);
      [a3 readMessage:v18 extensionRegistry:a4];
      goto LABEL_17;
    case 0x10:
      id v18 = objc_alloc_init((Class)[a2 msgClass]);
      [a3 readGroup:*(unsigned int *)(a2[1] + 16) message:v18 extensionRegistry:a4];
LABEL_17:
      uint64_t v13 = v8;
      id v14 = v18;
LABEL_32:
      [v13 addObject:v14];

      break;
    case 0x11:
      uint64_t v15 = sub_1000C59C8(v9);
      if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && ![a2 isValidEnumValue:v15])
      {
        CFStringRef v16 = (void *)sub_1000EEA90(a1);
        uint64_t v17 = *(unsigned int *)(a2[1] + 16);
        [v16 mergeVarintField:v17 value:v15];
      }
      else
      {
        [v8 addRawValue:v15];
      }
      break;
    default:
      return;
  }
}

void *sub_1000EF790(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)sub_1000F70E4(a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_1000F3178(a2, 0);
    sub_1000F7770(a1, a2, v4);
  }
  return v4;
}

void *sub_1000EFEC4(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)sub_1000F70E4(a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_1000F3824(a2, 0);
    sub_1000F7770(a1, a2, v4);
  }
  return v4;
}

void sub_1000F1274(_Unwind_Exception *a1)
{
}

uint64_t sub_1000F138C(uint64_t a1)
{
  uint64_t result = sub_10002F848();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F13C8(uint64_t a1)
{
  uint64_t result = sub_10002F9F8();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1404(uint64_t a1)
{
  uint64_t result = sub_10002F9F8();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1440(uint64_t a1)
{
  uint64_t result = sub_10002F9F8();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1478(uint64_t a1)
{
  uint64_t result = sub_1000BC464();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F14B4(uint64_t a1)
{
  uint64_t result = sub_1000BC464();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F14F0(uint64_t a1)
{
  uint64_t result = sub_1000BC464();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1528(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_1000C8134(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1564(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_1000C7D0C(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F15A0(uint64_t a1, int a2)
{
  uint64_t result = sub_1000C89A0(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F15DC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000C8BE8(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1618(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_1000C838C(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1654(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_1000C7D0C(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F1690(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_1000C8134(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

BOOL sub_1000F28EC(uint64_t a1, uint64_t a2)
{
  return sub_1000F7614(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void sub_1000F28FC(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (*(void *)(*(void *)(a1 + 32) + 48)) {
      id v6 = *(const char **)(*(void *)(a1 + 32) + 48);
    }
    else {
      id v6 = 0;
    }
    +[NSException raise:NSInvalidArgumentException, @"%@: %@ can only be set to NO (to clear field).", v5, NSStringFromSelector(v6) format];
  }
  uint64_t v7 = *(void *)(a1 + 32);

  sub_1000F7388(a2, v7);
}

uint64_t sub_1000F29D8(uint64_t a1, uint64_t a2)
{
  return sub_1000F7660(a2, *(_DWORD *)(a1 + 32));
}

TransparencyGPBAutocreatedArray *sub_1000F29E8(uint64_t a1, objc_class *a2)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t result = (TransparencyGPBAutocreatedArray *)atomic_load(v3);
  if (!result)
  {
    uint64_t result = sub_1000F3824(v2, a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)result);
    if (v5)
    {
      if (*(unsigned __int8 *)(v2[1] + 30) - 13 >= 4) {
        id v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      }
      else {
        id v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
      }
      *(Class *)((char *)&result->super.super.super.isa + *v6) = 0;

      return (TransparencyGPBAutocreatedArray *)v5;
    }
  }
  return result;
}

TransparencyGPBAutocreatedDictionary *sub_1000F2A84(uint64_t a1, objc_class *a2)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t v4 = (TransparencyGPBAutocreatedDictionary *)atomic_load(v3);
  if (!v4)
  {
    uint64_t v4 = sub_1000F3178(*(void **)(a1 + 32), a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)v4);
    if (v5)
    {
      if ([v2 mapKeyDataType] == 14
        && *(unsigned __int8 *)(v2[1] + 30) - 13 < 4)
      {
        id v6 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
      }
      else
      {
        id v6 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
      }
      *(Class *)((char *)&v4->super.super.super.isa + *v6) = 0;

      return (TransparencyGPBAutocreatedDictionary *)v5;
    }
  }
  return v4;
}

uint64_t sub_1000F2B44(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000F772C(a2, *(void **)(a1 + 32), a3);
}

id sub_1000F2B54(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = (void *)sub_1000F70E4(a2, *(void *)(a1 + 32));

  return [v2 count];
}

CFStringRef sub_1000F2CC8(void *a1, void *a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1[1];
  int v8 = a3 + 1;
  switch(*(unsigned char *)(v5 + 44))
  {
    case 0:
      id v11 = objc_alloc((Class)NSNumber);
      BOOL v12 = sub_1000C5AA0(v8);
      return (const __CFString *)_[v11 initWithBool:v12];
    case 1:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t v14 = sub_1000C5A1C(v8);
      goto LABEL_17;
    case 2:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_1000C5A1C(v8);
      goto LABEL_15;
    case 3:
      id v17 = objc_alloc((Class)NSNumber);
      sub_1000C5900(v8);
      return (const __CFString *)_[v17 initWithFloat:v18];
    case 4:
      id v19 = objc_alloc((Class)NSNumber);
      uint64_t v20 = sub_1000C59E0(v8);
      goto LABEL_21;
    case 5:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_1000C59E0(v8);
      goto LABEL_39;
    case 6:
      id v28 = objc_alloc((Class)NSNumber);
      sub_1000C58C4(v8);
      return (const __CFString *)_[v28 initWithDouble:v29];
    case 7:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_1000C59C8(v8);
      goto LABEL_15;
    case 8:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_1000C593C(v8);
      goto LABEL_39;
    case 9:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_1000C5A58(v8);
LABEL_15:
      uint64_t v21 = v16;
      id v22 = v15;
      goto LABEL_30;
    case 0xA:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_1000C5A7C(v8);
LABEL_39:
      return (const __CFString *)_[v26 initWithLongLong:v27];
    case 0xB:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t v14 = sub_1000C59C8(v8);
LABEL_17:
      return (const __CFString *)_[v13 initWithUnsignedInt:v14];
    case 0xC:
      id v19 = objc_alloc((Class)NSNumber);
      uint64_t v20 = sub_1000C593C(v8);
LABEL_21:
      return (const __CFString *)_[v19 initWithUnsignedLongLong:v20];
    case 0xD:
      return (const __CFString *)sub_1000C5D74(a3 + 1);
    case 0xE:
      return sub_1000C5C70(a3 + 1);
    case 0xF:
    case 0x10:
      if (a5) {
        id v10 = a5;
      }
      else {
        id v10 = objc_alloc_init((Class)[objc_msgSend(objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass")]);
      }
      id v30 = v10;
      if (*(unsigned char *)(v5 + 44) == 16)
      {
        [a3 readGroup:*(unsigned int *)(v5 + 40) message:v10 extensionRegistry:a4];
      }
      else if ((*(unsigned char *)(v5 + 45) & 4) != 0)
      {
        [v10 mergeFromCodedInputStream:a3 extensionRegistry:a4];
      }
      else
      {
        [a3 readMessage:v10 extensionRegistry:a4];
      }
      return (const __CFString *)v30;
    case 0x11:
      uint64_t v24 = sub_1000C59C8(a3 + 1);
      id v25 = [a1 enumDescriptor];
      if ([v25 isClosed]
        && !((unsigned int (*)(uint64_t))[v25 enumVerifier])(v24))
      {
        [(id)sub_1000EEA90(a2) mergeVarintField:*(unsigned int *)(a1[1] + 40) value:v24];
        return 0;
      }
      else
      {
        id v22 = objc_alloc((Class)NSNumber);
        uint64_t v21 = v24;
LABEL_30:
        return (const __CFString *)_[v22 initWithInt:v21];
      }
    default:
      return 0;
  }
}

TransparencyGPBAutocreatedDictionary *sub_1000F3178(void *a1, objc_class *a2)
{
  unsigned int v4 = [a1 mapKeyDataType];
  uint64_t result = 0;
  int v6 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBBoolBoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBBoolUInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBBoolInt32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBBoolFloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBBoolUInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBBoolInt64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBBoolDoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBBoolObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBBoolEnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 1u:
    case 0xBu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBUInt32BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBUInt32UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBUInt32Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBUInt32FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBUInt32UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBUInt32Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBUInt32DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBUInt32ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBUInt32EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 2u:
    case 7u:
    case 9u:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBInt32BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBInt32UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBInt32Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBInt32FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBInt32UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBInt32Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBInt32DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBInt32ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBInt32EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      return result;
    case 4u:
    case 0xCu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBUInt64BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBUInt64UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBUInt64Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBUInt64FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBUInt64UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBUInt64Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBUInt64DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBUInt64ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBUInt64EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 5u:
    case 8u:
    case 0xAu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBInt64BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBInt64UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBInt64Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBInt64FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBInt64UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBInt64Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBInt64DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBInt64ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBInt64EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 0xEu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBStringBoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBStringUInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBStringInt32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBStringFloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBStringUInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBStringInt64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBStringDoubleDictionary;
LABEL_65:
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init(v7);
          goto LABEL_66;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            uint64_t result = objc_alloc_init(TransparencyGPBAutocreatedDictionary);
            goto LABEL_69;
          }
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBStringEnumDictionary;
LABEL_74:
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)[[[v8 alloc] initWithValidationFunction:[objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")]]
          if (a2) {
            goto LABEL_67;
          }
          return result;
        default:
          goto LABEL_66;
      }
      break;
    default:
LABEL_66:
      if (a2)
      {
LABEL_67:
        if (v4 == 14 && (v6 - 13) <= 3) {
LABEL_69:
        }
          unint64_t v9 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
        else {
          unint64_t v9 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
        }
        *(Class *)((char *)&result->super.super.super.isa + *v9) = a2;
      }
      break;
  }
  return result;
}

TransparencyGPBAutocreatedArray *sub_1000F3824(void *a1, objc_class *a2)
{
  int v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(unsigned char *)(a1[1] + 30))
  {
    case 0:
      uint64_t v5 = TransparencyGPBBoolArray;
      goto LABEL_16;
    case 1:
    case 0xB:
      uint64_t v5 = TransparencyGPBUInt32Array;
      goto LABEL_16;
    case 2:
    case 7:
    case 9:
      uint64_t v5 = TransparencyGPBInt32Array;
      goto LABEL_16;
    case 3:
      uint64_t v5 = TransparencyGPBFloatArray;
      goto LABEL_16;
    case 4:
    case 0xC:
      uint64_t v5 = TransparencyGPBUInt64Array;
      goto LABEL_16;
    case 5:
    case 8:
    case 0xA:
      uint64_t v5 = TransparencyGPBInt64Array;
      goto LABEL_16;
    case 6:
      uint64_t v5 = TransparencyGPBDoubleArray;
LABEL_16:
      uint64_t result = (TransparencyGPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2) {
        goto LABEL_17;
      }
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (a2)
      {
        uint64_t result = objc_alloc_init(TransparencyGPBAutocreatedArray);
LABEL_18:
        int v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
LABEL_20:
        *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      }
      else
      {
        return (TransparencyGPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      }
      return result;
    case 0x11:
      uint64_t result = [[[TransparencyGPBEnumArray alloc] initWithValidationFunction:objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")]
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    default:
      uint64_t result = 0;
      if (!a2) {
        return result;
      }
LABEL_17:
      if ((v3 - 13) <= 3) {
        goto LABEL_18;
      }
      int v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      goto LABEL_20;
  }
}

BOOL sub_1000F39D0(uint64_t a1, uint64_t a2)
{
  return sub_1000F7C30(a2, *(void **)(a1 + 32));
}

id sub_1000F39E0(uint64_t a1, uint64_t a2)
{
  return sub_1000F79F8(a2, *(void **)(a1 + 32));
}

id sub_1000F39F0(uint64_t a1, uint64_t a2)
{
  return sub_1000F79F8(a2, *(void **)(a1 + 32));
}

float sub_1000F3A00(uint64_t a1, uint64_t a2)
{
  return sub_1000F7FA8(a2, *(void **)(a1 + 32));
}

id sub_1000F3A10(uint64_t a1, uint64_t a2)
{
  return sub_1000F7E2C(a2, *(void **)(a1 + 32));
}

id sub_1000F3A20(uint64_t a1, uint64_t a2)
{
  return sub_1000F7E2C(a2, *(void **)(a1 + 32));
}

double sub_1000F3A30(uint64_t a1, uint64_t a2)
{
  return sub_1000F8140(a2, *(void **)(a1 + 32));
}

id sub_1000F3A40(uint64_t a1, uint64_t a2)
{
  return sub_1000F79F8(a2, *(void **)(a1 + 32));
}

id sub_1000F3A50(uint64_t a1, uint64_t a2)
{
  return sub_1000F7E2C(a2, *(void **)(a1 + 32));
}

id sub_1000F3A60(uint64_t a1, uint64_t a2)
{
  return sub_1000F79F8(a2, *(void **)(a1 + 32));
}

id sub_1000F3A70(uint64_t a1, uint64_t a2)
{
  return sub_1000F7E2C(a2, *(void **)(a1 + 32));
}

id sub_1000F3A80(uint64_t a1, uint64_t a2)
{
  return sub_1000F79F8(a2, *(void **)(a1 + 32));
}

id sub_1000F3A90(uint64_t a1, uint64_t a2)
{
  return sub_1000F7E2C(a2, *(void **)(a1 + 32));
}

void *sub_1000F3AA0(uint64_t a1, uint64_t a2)
{
  return sub_1000EC7C8(a2, *(void **)(a1 + 32));
}

void *sub_1000F3AB0(uint64_t a1, uint64_t a2)
{
  return sub_1000EC7C8(a2, *(void **)(a1 + 32));
}

void *sub_1000F3AC0(uint64_t a1, uint64_t a2)
{
  return sub_1000EC7C8(a2, *(void **)(a1 + 32));
}

void *sub_1000F3AD0(uint64_t a1, uint64_t a2)
{
  return sub_1000EC7C8(a2, *(void **)(a1 + 32));
}

uint64_t sub_1000F3AE0(uint64_t a1, uint64_t a2)
{
  return sub_1000F7998(a2, *(void **)(a1 + 32));
}

id sub_1000F3AF0(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7CE8(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B00(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7B30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B10(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7B30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B20(uint64_t a1, void *a2, float a3)
{
  return sub_1000F8044(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B30(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7EB0(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B40(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7EB0(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B50(uint64_t a1, void *a2, double a3)
{
  return sub_1000F81DC(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B60(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7B30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B70(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7EB0(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B80(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7B30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3B90(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7EB0(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3BA0(uint64_t a1, void *a2, int a3)
{
  return sub_1000F7B30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000F3BB0(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7EB0(a2, *(void *)(a1 + 32), a3);
}

uint64_t sub_1000F3BC0(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return sub_1000F7770(a2, v4, v5);
}

uint64_t sub_1000F3C08(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return sub_1000F7770(a2, v4, v5);
}

uint64_t sub_1000F3C50(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000F772C(a2, *(void **)(a1 + 32), a3);
}

uint64_t sub_1000F3C60(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000F772C(a2, *(void **)(a1 + 32), a3);
}

id sub_1000F3C70(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000F7A84(a2, *(void **)(a1 + 32), a3);
}

uint64_t sub_1000F3D2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_1000F3D38(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_1000F3D54(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_1000F3D74(unsigned char *a1)
{
  LOBYTE(v1) = *a1;
  if (*a1)
  {
    unsigned int v2 = 0;
    unsigned int v3 = 1;
    do
    {
      unsigned int v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      int v1 = a1[v3++];
    }
    while (v1);
    unsigned int v4 = 9 * v2;
  }
  else
  {
    unsigned int v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t sub_1000F3E2C(objc_class *a1, const char *a2)
{
  uint64_t result = (uint64_t)sub_1000F3F0C(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    int v6 = sub_1000F8394("getClassValue", 0);
    Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F4060;
    block[3] = &unk_10013B7D8;
    block[4] = v5;
    unint64_t v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || sub_1000F96C8(MetaClass, a2);
  }
  return result;
}

const void *sub_1000F3F0C(objc_class *a1, SEL sel)
{
  Name = sel_getName(sel);
  int v4 = *(unsigned __int8 *)Name;
  if (v4 != 95)
  {
    int v6 = Name;
    uint64_t v7 = 1;
    if (!*Name)
    {
LABEL_6:
      int v8 = class_getName(a1);
      size_t v9 = strlen(v8);
      __chkstk_darwin(v9);
      id v11 = (char *)&v14 - v10;
      bzero((char *)&v14 - v10, v12);
      memcpy(v11, v8, v9);
      v11[v9] = 95;
      memcpy(&v11[v9 + 1], v6, v7 - 1);
      v11[v9 + v7] = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100162138);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_100162128, v11);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100162138);
      return Value;
    }
    while (v4 != 58)
    {
      int v4 = Name[v7++];
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  return 0;
}

uint64_t sub_1000F4060(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

unint64_t sub_1000F4138()
{
  if (!atomic_load((unint64_t *)&qword_100162148))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBNullValue" valueNames:"NullValue" values:&unk_10010E574 count:1 enumVerifier:sub_1000F41B8 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_100162148, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_100162148);
}

BOOL sub_1000F41B8(int a1)
{
  return a1 == 0;
}

uint64_t sub_1000F42C0(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBValue descriptor](TransparencyGPBValue) fieldWithNumber:1];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000F430C(uint64_t a1, uint64_t a2)
{
  id v4 = [[TransparencyGPBValue descriptor] fieldWithNumber:1];

  return sub_1000F7C2C(a1, v4, a2);
}

void sub_1000F4360(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor") oneofs] objectAtIndex:0];

  sub_1000F74CC(a1, v2);
}

unint64_t sub_1000F4490()
{
  if (!atomic_load((unint64_t *)&qword_100162170))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBSyntax" valueNames:"SyntaxProto2" values:&unk_10010E594 count:2 enumVerifier:sub_1000F4510 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_100162170, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_100162170);
}

BOOL sub_1000F4510(unsigned int a1)
{
  return a1 < 2;
}

unint64_t sub_1000F451C()
{
  if (!atomic_load((unint64_t *)&qword_100162178))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBField_Kind" valueNames:"TypeUnknown" values:&unk_10010E670 count:19 enumVerifier:sub_1000F459C flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_100162178, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_100162178);
}

BOOL sub_1000F459C(unsigned int a1)
{
  return a1 < 0x13;
}

unint64_t sub_1000F45A8()
{
  if (!atomic_load((unint64_t *)&qword_100162180))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBField_Cardinality" valueNames:"CardinalityUnknown" values:&unk_10010E70C count:4 enumVerifier:sub_1000F4628 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_100162180, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_100162180);
}

BOOL sub_1000F4628(unsigned int a1)
{
  return a1 < 4;
}

uint64_t sub_1000F46A4(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBType descriptor](TransparencyGPBType) fieldWithNumber:6];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000F46F0(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBType descriptor](TransparencyGPBType) fieldWithNumber:6];

  return sub_1000F7C2C(a1, v4, a2);
}

uint64_t sub_1000F47C8(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:1];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000F4814(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:1];

  return sub_1000F7C2C(a1, v4, a2);
}

uint64_t sub_1000F4868(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:2];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000F48B4(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:2];

  return sub_1000F7C2C(a1, v4, a2);
}

uint64_t sub_1000F4978(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBEnum descriptor](TransparencyGPBEnum) fieldWithNumber:5];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000F49C4(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBEnum descriptor](TransparencyGPBEnum) fieldWithNumber:5];

  return sub_1000F7C2C(a1, v4, a2);
}

void sub_1000F52A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t sub_1000F52D8(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_1000C9F30(*(_DWORD *)(a1 + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F5314(uint64_t a1)
{
  uint64_t result = sub_1000C9EE0(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000F5350(uint64_t a1)
{
  uint64_t result = sub_1000C9E40(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1000F5858(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%llu\n", a2];
}

id sub_1000F5888(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%u\n", a2];
}

id sub_1000F58B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%llu\n", a2];
}

void sub_1000F5DB8(uint64_t a1, void *a2, void *a3)
{
  id v4 = [a2 copy];
  [a3 addField:v4];
}

int sub_1000F60F0(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

int sub_1000F6264(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

id sub_1000F633C(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSize];
  *a3 += result;
  return result;
}

id sub_1000F6390(uint64_t a1, void *a2)
{
  return [_objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

id sub_1000F63DC(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSizeAsMessageSetExtension];
  *a3 += result;
  return result;
}

void sub_1000F65F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 number];
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Zero is not a valid field number."];
  }
  id v6 = [a3 mutableFieldForNumber:v5 create:0];
  if (v6)
  {
    _[v6 mergeFromField:a2];
  }
  else
  {
    id v7 = [a2 copy];
    [a3 addField:v7];
  }
}

uint64_t sub_1000F6AE0()
{
  if (qword_1001621B0 != -1) {
    dispatch_once(&qword_1001621B0, &stru_10013B8A8);
  }
  return qword_1001621B8;
}

void sub_1000F6B24(id a1)
{
  qword_1001621B8 = (uint64_t)objc_alloc_init((Class)NSData);
}

id sub_1000F6B4C(id result)
{
  if (!result) {
    return result;
  }
  id v1 = +[NSMutableArray arrayWithObject:result];
  id result = [(NSMutableArray *)v1 count];
  if (!result) {
    return result;
  }
  id v30 = v42;
  long long v31 = v44;
  uint64_t v32 = v40;
  id v28 = v38;
  uint64_t v29 = v46;
  uint64_t v27 = v48;
  do
  {
    id v2 = [(NSMutableArray *)v1 lastObject];
    [(NSMutableArray *)v1 removeLastObject];
    [v2 setUnknownFields:0];
    int v3 = [(id)objc_opt_class() descriptor];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v4 = (void *)v3[1];
    id v5 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (!v5) {
      goto LABEL_36;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        size_t v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (*(unsigned __int8 *)(v9[1] + 30) - 15 <= 1)
        {
          unsigned int v10 = [*(id *)(*((void *)&v49 + 1) + 8 * i) fieldType];
          if (v10 == 2)
          {
            uint64_t v16 = v2[8];
            if (v16) {
              id v17 = *(void **)(v16 + *(unsigned int *)(v9[1] + 24));
            }
            else {
              id v17 = 0;
            }
            switch([v9 mapKeyDataType])
            {
              case 0u:
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472;
                v48[0] = sub_1000F711C;
                v48[1] = &unk_10013B8D0;
                v48[2] = v1;
                uint64_t v18 = v47;
                goto LABEL_33;
              case 1u:
              case 0xBu:
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472;
                v46[0] = sub_1000F7124;
                v46[1] = &unk_10013B8F8;
                v46[2] = v1;
                uint64_t v18 = v45;
                goto LABEL_33;
              case 2u:
              case 7u:
              case 9u:
                v43[0] = _NSConcreteStackBlock;
                v43[1] = 3221225472;
                v44[0] = sub_1000F712C;
                v44[1] = &unk_10013B920;
                v44[2] = v1;
                uint64_t v18 = v43;
                goto LABEL_33;
              case 4u:
              case 0xCu:
                v41[0] = _NSConcreteStackBlock;
                v41[1] = 3221225472;
                v42[0] = sub_1000F7134;
                v42[1] = &unk_10013B948;
                v42[2] = v1;
                uint64_t v18 = v41;
                goto LABEL_33;
              case 5u:
              case 8u:
              case 0xAu:
                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v40[0] = sub_1000F713C;
                v40[1] = &unk_10013B970;
                v40[2] = v1;
                uint64_t v18 = v39;
                goto LABEL_33;
              case 0xEu:
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v38[0] = sub_1000F7144;
                v38[1] = &unk_10013B998;
                v38[2] = v1;
                uint64_t v18 = v37;
LABEL_33:
                [v17 enumerateKeysAndObjectsUsingBlock:v18];
                break;
              default:
                continue;
            }
          }
          else if (v10 == 1)
          {
            uint64_t v14 = v2[8];
            if (v14) {
              id v15 = *(void **)(v14 + *(unsigned int *)(v9[1] + 24));
            }
            else {
              id v15 = 0;
            }
            if ([v15 count]) {
              [(NSMutableArray *)v1 addObjectsFromArray:v15];
            }
          }
          else
          {
            if (v10) {
              continue;
            }
            id v11 = (_DWORD *)v9[1];
            unint64_t v12 = v11[5];
            if ((v12 & 0x80000000) != 0)
            {
              uint64_t v13 = v2[8];
              if (*(_DWORD *)(v13 + 4 * -(int)v12) != v11[4]) {
                continue;
              }
LABEL_24:
              [(NSMutableArray *)v1 addObject:*(void *)(v13 + v11[6])];
              continue;
            }
            uint64_t v13 = v2[8];
            if ((*(_DWORD *)(v13 + ((v12 >> 3) & 0x1FFFFFFC)) >> v12)) {
              goto LABEL_24;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v6);
LABEL_36:
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = [v2 extensionsCurrentlySet];
    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          if ([v24 dataType] - 15 <= 1)
          {
            unsigned int v25 = [v24 isRepeated];
            id v26 = [v2 getExtension:v24];
            if (v25) {
              [(NSMutableArray *)v1 addObjectsFromArray:v26];
            }
            else {
              [(NSMutableArray *)v1 addObject:v26];
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v21);
    }
    id result = [(NSMutableArray *)v1 count];
  }
  while (result);
  return result;
}

uint64_t sub_1000F70E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    return *(void *)(v2 + *(unsigned int *)(*(void *)(a2 + 8) + 24));
  }
  else {
    return 0;
  }
}

id sub_1000F711C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F7124(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F712C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F7134(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F713C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F7144(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_1000F714C(id result)
{
  if ((int)result >= 30008) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!", 30007, result format];
  }
  if ((int)result <= 30000) {
    return +[NSException raise:NSInternalInconsistencyException, @"Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!", result, 30001 format];
  }
  return result;
}

id sub_1000F71D4()
{
  return +[NSException raise:NSInternalInconsistencyException, @"Proto generation source appears to have been from a version newer that this runtime (%d).", 30007 format];
}

id sub_1000F7218(id result)
{
  if (result != 30001) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!", 30001, result, v1, v2 format];
  }
  return result;
}

BOOL sub_1000F7270(void *a1, uint64_t a2)
{
  id v3 = [objc_msgSend(a1, "descriptor") fieldWithNumber:a2];

  return sub_1000F72B8((uint64_t)a1, (uint64_t)v3);
}

BOOL sub_1000F72B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
    {
      uint64_t v4 = *(void *)(a1 + 64);
      if (v4) {
        id v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
      }
      else {
        id v5 = 0;
      }
      return [v5 count] != 0;
    }
    else
    {
      unint64_t v6 = *(unsigned int *)(v3 + 20);
      if ((v6 & 0x80000000) != 0) {
        return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -(int)v6) == *(_DWORD *)(v3 + 16);
      }
      else {
        return (*(_DWORD *)(*(void *)(a1 + 64) + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
      }
    }
  }
  return v2;
}

void sub_1000F7388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(unsigned int *)(v3 + 20);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v5 + 4 * -(int)v4) != *(_DWORD *)(v3 + 16)) {
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) == 0) {
      return;
    }
  }
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v3 + 30) - 13 <= 3)
  {
    uint64_t v6 = *(unsigned int *)(v3 + 24);

    *(void *)(v5 + v6) = 0;
    LODWORD(v4) = *(_DWORD *)(v3 + 20);
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if ((v4 & 0x80000000) != 0) {
    *(_DWORD *)(v7 + 4 * -(int)v4) = 0;
  }
  else {
    *(_DWORD *)(v7 + 4 * (v4 >> 5)) &= ~(1 << v4);
  }
}

uint64_t sub_1000F7478(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(result + 64);
  if ((a2 & 0x80000000) != 0)
  {
    if (!a4) {
      a3 = 0;
    }
    *(_DWORD *)(v4 + 4 * -a2) = a3;
  }
  else
  {
    unsigned int v5 = a2 >> 5;
    int v6 = 1 << a2;
    if (a4) {
      int v7 = *(_DWORD *)(v4 + 4 * v5) | v6;
    }
    else {
      int v7 = *(_DWORD *)(v4 + 4 * v5) & ~v6;
    }
    *(_DWORD *)(v4 + 4 * v5) = v7;
  }
  return result;
}

void sub_1000F74CC(uint64_t a1, id *a2)
{
  unsigned int v4 = *(_DWORD *)(*((void *)[a2[2] objectAtIndexedSubscript:0] + 1) + 20);

  sub_1000F7538(a1, a2, v4, 0);
}

void sub_1000F7538(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  int v5 = *(_DWORD *)(*(void *)(a1 + 64) - 4 * (int)a3);
  if (v5 != a4 && v5 != 0)
  {
    int v8 = [a2 fieldWithNumber:];
    if (v8)
    {
      uint64_t v9 = v8[1];
      if ((*(_WORD *)(v9 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v9 + 30) - 13 <= 3)
      {
        uint64_t v10 = *(void *)(a1 + 64);
        uint64_t v11 = *(unsigned int *)(v9 + 24);

        *(void *)(v10 + v11) = 0;
      }
    }
    uint64_t v12 = *(void *)(a1 + 64);
    if ((a3 & 0x80000000) != 0) {
      *(_DWORD *)(v12 + 4 * -a3) = 0;
    }
    else {
      *(_DWORD *)(v12 + 4 * (a3 >> 5)) &= ~(1 << a3);
    }
  }
}

BOOL sub_1000F7614(uint64_t a1, unsigned int a2, int a3)
{
  if ((a2 & 0x80000000) != 0) {
    return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -a2) == a3;
  }
  else {
    return (*(_DWORD *)(*(void *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
  }
}

uint64_t sub_1000F7660(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(a1 + 64) - 4 * a2);
}

void sub_1000F767C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_DWORD **)(a2 + 8);
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return;
    }
  }
  uint64_t v5 = v2[6];
  uint64_t v6 = *(void *)(v4 + v5);
  id v7 = (id)v6;
  *(void *)(v4 + v5) = 0;
  sub_1000EB7C8(v6);
}

uint64_t sub_1000F772C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;

  return sub_1000F7770(a1, a2, v5);
}

uint64_t sub_1000F7770(uint64_t a1, void *a2, void *a3)
{
  unint64_t v3 = a3;
  uint64_t v6 = a2[1];
  int v7 = *(unsigned __int8 *)(v6 + 30);
  __int16 v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(unsigned int *)(v6 + 24);
    uint64_t v11 = *(char **)(v9 + v10);
    *(void *)(v9 + v10) = a3;
    if (!v11) {
      goto LABEL_32;
    }
    if ([a2 fieldType] == 1)
    {
      if ((v7 - 13) <= 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
          goto LABEL_29;
        }
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
    }
    else if ([a2 mapKeyDataType] == 14 && (v7 - 13) <= 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
    }
    else
    {
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
    }
LABEL_29:
    uint64_t v22 = *v12;
    if (*(void *)&v11[v22] == a1) {
      *(void *)&v11[v22] = 0;
    }
    goto LABEL_31;
  }
  uint64_t v13 = (void *)a2[2];
  if (v13)
  {
    sub_1000F7538(a1, v13, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16));
    __int16 v8 = *(_WORD *)(v6 + 28);
  }
  BOOL v14 = v3 != 0;
  if ((v8 & 0x20) != 0 && ![v3 length])
  {

    BOOL v14 = 0;
    unint64_t v3 = 0;
  }
  unint64_t v15 = *(unsigned int *)(v6 + 20);
  uint64_t v16 = *(void *)(a1 + 64);
  if ((v15 & 0x80000000) != 0)
  {
    int v19 = *(_DWORD *)(v6 + 16);
    if (!v14) {
      int v19 = 0;
    }
    *(_DWORD *)(v16 + 4 * -(int)v15) = v19;
  }
  else
  {
    unint64_t v17 = v15 >> 5;
    int v18 = 1 << v15;
    if (v14) {
      *(_DWORD *)(v16 + 4 * v17) |= v18;
    }
    else {
      *(_DWORD *)(v16 + 4 * v17) &= ~v18;
    }
  }
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(unsigned int *)(v6 + 24);
  uint64_t v11 = *(char **)(v20 + v21);
  *(void *)(v20 + v21) = v3;
  if (v11)
  {
    if ((v7 - 15) <= 1 && sub_1000EB4A4((uint64_t)v11, a1)) {
      sub_1000EB7C8((uint64_t)v11);
    }
    goto LABEL_31;
  }
LABEL_32:

  return sub_1000EB4B4(a1);
}

uint64_t sub_1000F7998(uint64_t a1, void *a2)
{
  id v3 = sub_1000F79F8(a1, a2);
  if ((*(_WORD *)(a2[1] + 28) & 0x1000) == 0)
  {
    if ([a2 isValidEnumValue:v3]) {
      return v3;
    }
    else {
      return 4222467823;
    }
  }
  return (uint64_t)v3;
}

id sub_1000F79F8(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return (id)*(unsigned int *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return (id)*(unsigned int *)(v4 + v2[6]);
    }
  }
  return [a2 defaultValue];
}

id sub_1000F7A84(void *a1, void *a2, uint64_t a3)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0) {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%@.%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), [a2 name], a3);
  }

  return sub_1000F7B30(a1, (uint64_t)a2, a3);
}

id sub_1000F7B30(void *a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1000F7538((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_1000EB4B4(a1);
}

BOOL sub_1000F7C30(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  int v3 = v2[4];
  unint64_t v4 = v2[5];
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4)) {
      goto LABEL_3;
    }
    return (unint64_t)[a2 defaultValue] & 1;
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(_DWORD *)(v5 + 4 * -(int)v4) != v3) {
    return (unint64_t)[a2 defaultValue] & 1;
  }
LABEL_3:
  unint64_t v6 = v2[6];
  if ((v6 & 0x80000000) != 0) {
    return *(_DWORD *)(v5 + 4 * -(int)v6) == v3;
  }
  else {
    return (*(_DWORD *)(v5 + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
  }
}

void *sub_1000F7CD8(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000F7CE8(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000F7CE8(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void **)(a2 + 16);
  if (v6) {
    sub_1000F7538((uint64_t)a1, v6, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16));
  }
  unint64_t v7 = *(unsigned int *)(v5 + 24);
  uint64_t v8 = a1[8];
  if ((v7 & 0x80000000) != 0)
  {
    int v11 = *(_DWORD *)(v5 + 16);
    if (!a3) {
      int v11 = 0;
    }
    *(_DWORD *)(v8 + 4 * -(int)v7) = v11;
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v9 = v7 >> 5;
    int v10 = 1 << v7;
    if (a3)
    {
      *(_DWORD *)(v8 + 4 * v9) |= v10;
LABEL_9:
      BOOL v12 = 1;
      goto LABEL_12;
    }
    *(_DWORD *)(v8 + 4 * v9) &= ~v10;
  }
  BOOL v12 = (*(_WORD *)(v5 + 28) & 0x20) == 0;
LABEL_12:
  unint64_t v13 = *(unsigned int *)(v5 + 20);
  uint64_t v14 = a1[8];
  if ((v13 & 0x80000000) != 0)
  {
    if (v12) {
      int v17 = *(_DWORD *)(v5 + 16);
    }
    else {
      int v17 = 0;
    }
    *(_DWORD *)(v14 + 4 * -(int)v13) = v17;
  }
  else
  {
    unint64_t v15 = v13 >> 5;
    int v16 = 1 << v13;
    if (v12) {
      *(_DWORD *)(v14 + 4 * v15) |= v16;
    }
    else {
      *(_DWORD *)(v14 + 4 * v15) &= ~v16;
    }
  }

  return sub_1000EB4B4(a1);
}

void *sub_1000F7E1C(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000F7B30(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000F7E2C(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(id *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(id *)(v4 + v2[6]);
    }
  }
  return [a2 defaultValue];
}

void *sub_1000F7EA0(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000F7EB0(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000F7EB0(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1000F7538((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_1000EB4B4(a1);
}

float sub_1000F7FA8(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(float *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(float *)(v4 + v2[6]);
    }
  }
  LODWORD(result) = [a2 defaultValue];
  return result;
}

void *sub_1000F8034(void *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000F8044(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000F8044(void *a1, uint64_t a2, float a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1000F7538((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  BOOL v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_1000EB4B4(a1);
}

double sub_1000F8140(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(double *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(double *)(v4 + v2[6]);
    }
  }
  return COERCE_DOUBLE([a2 defaultValue]);
}

void *sub_1000F81CC(void *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000F81DC(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000F81DC(void *a1, uint64_t a2, double a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_1000F7538((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  BOOL v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_1000EB4B4(a1);
}

uint64_t sub_1000F82DC(uint64_t result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = [a3 copy];
    return sub_1000F7770(v4, a2, v5);
  }
  return result;
}

uint64_t sub_1000F833C(uint64_t result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = a3;
    return sub_1000F7770(v4, a2, v5);
  }
  return result;
}

char *sub_1000F8394(const char *a1, BOOL a2)
{
  Protocol = objc_getProtocol("TransparencyGPBMessageSignatureProtocol");
  return protocol_getMethodDescription(Protocol, a1, 0, a2).types;
}

__CFString *sub_1000F83D8(void *a1, __CFString *a2)
{
  uint64_t v2 = &stru_10013DAE0;
  if (a1)
  {
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = &stru_10013DAE0;
    }
    uint64_t v2 = (__CFString *)+[NSMutableString string];
    sub_1000F8438(a1, v2, v4);
  }
  return v2;
}

id sub_1000F8438(void *a1, void *a2, __CFString *a3)
{
  id v5 = a1;
  unint64_t v6 = [a1 descriptor];
  uint64_t v7 = (void *)v6[1];
  BOOL v8 = (char *)[v7 count];
  unint64_t v9 = [v6 extensionRanges];
  unsigned int v10 = [v6 extensionRangesCount];
  id v11 = [[objc_msgSend(v5, "extensionsCurrentlySet") sortedArrayUsingSelector:@selector(compareByFieldNumber:)];
  if (v8) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    int v13 = v11;
    uint64_t v14 = 0;
    unint64_t v15 = v10;
    unint64_t v16 = 0;
    uint64_t v59 = v77;
    v60 = v73;
    uint64_t v69 = v5;
    id v62 = v11;
    unint64_t v63 = v9;
    uint64_t v66 = a3;
    unint64_t v67 = v15;
    uint64_t v64 = v8;
    v65 = v7;
    do
    {
      if (v14 == v8)
      {
        uint64_t v17 = v16++;
        sub_1000F974C(v5, v13, v9[v17], a2, a3);
        uint64_t v14 = v8;
        continue;
      }
      if (v16 != v15)
      {
        int v18 = [v7 objectAtIndexedSubscript:v14];
        int v19 = &v9[v16];
        if (*(_DWORD *)(v18[1] + 16) >= *(_DWORD *)v19)
        {
          ++v16;
          sub_1000F974C(v5, v13, *v19, a2, a3);
          continue;
        }
      }
      uint64_t v70 = v14 + 1;
      v71 = [v7 objectAtIndexedSubscript:v14];
      unsigned int v20 = [v71 fieldType];
      unsigned int v21 = v20;
      if (v20 == 2 || v20 == 1)
      {
        uint64_t v25 = v5[8];
        unint64_t v68 = v16;
        if (v25) {
          id v26 = *(void **)(v25 + *(unsigned int *)(v71[1] + 24));
        }
        else {
          id v26 = 0;
        }
        unint64_t v27 = (unint64_t)[v26 count];
        if (v27) {
          goto LABEL_21;
        }
      }
      else
      {
        if (v20)
        {
          uint64_t v14 = v70;
          continue;
        }
        uint64_t v22 = v71[1];
        unint64_t v23 = *(unsigned int *)(v22 + 20);
        unint64_t v68 = v16;
        if ((v23 & 0x80000000) != 0) {
          unsigned int v24 = *(_DWORD *)(v5[8] + 4 * -(int)v23) == *(_DWORD *)(v22 + 16);
        }
        else {
          unsigned int v24 = (*(_DWORD *)(v5[8] + ((v23 >> 3) & 0x1FFFFFFC)) >> v23) & 1;
        }
        id v26 = 0;
        unint64_t v27 = v24;
        if (v24)
        {
LABEL_21:
          id v28 = (NSString *)[v71 textFormatName];
          if ([(NSString *)v28 length]) {
            goto LABEL_24;
          }
          id v28 = +[NSString stringWithFormat:@"%u", *(unsigned int *)(v71[1] + 16)];
          if (v27 < 2)
          {
            a3 = v66;
            id v5 = v69;
            CFStringRef v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  # %@", [v71 name]);
          }
          else
          {
            [a2 appendFormat:@"%@# %@\n", a3, [v71 name]];
LABEL_24:
            CFStringRef v29 = &stru_10013DAE0;
          }
          if (v21 == 2)
          {
            unsigned int v30 = [v71 mapKeyDataType];
            a3 = v66;
            int v31 = *(unsigned __int8 *)(v71[1] + 30);
            os_log_type_t v61 = +[NSString stringWithFormat:@"%@%@ {%@\n", v66, v28, v29, v59, v60];
            uint64_t v32 = +[NSString stringWithFormat:@"%@%@ {\n", v66, v28];
            long long v33 = +[NSString stringWithFormat:@"%@}\n", v66];
            long long v34 = +[NSString stringWithFormat:@"%@  key: ", v66];
            long long v35 = ":";
            if ((v31 - 15) < 2) {
              long long v35 = "";
            }
            long long v36 = +[NSString stringWithFormat:@"%@  value%s ", v66, v35];
            v79[0] = 0;
            v79[1] = v79;
            v79[2] = 0x2020000000;
            char v80 = 1;
            if (v30 == 14 && (v31 - 13) <= 3)
            {
              v76[0] = _NSConcreteStackBlock;
              v76[1] = 3221225472;
              v77[0] = sub_1000F9D2C;
              v77[1] = &unk_10013BA10;
              v77[2] = a2;
              v77[3] = v61;
              v77[4] = v32;
              v77[5] = v34;
              char v78 = v31;
              v77[6] = v36;
              v77[7] = v66;
              v77[8] = v33;
              v77[9] = v79;
              [v26 enumerateKeysAndObjectsUsingBlock:v76];
            }
            else
            {
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472;
              v73[0] = sub_1000F9E78;
              v73[1] = &unk_10013BA38;
              v73[9] = v33;
              v73[10] = v79;
              v73[2] = a2;
              v73[3] = v61;
              char v74 = v30;
              v73[4] = v32;
              v73[5] = v34;
              char v75 = v31;
              v73[6] = v36;
              v73[7] = v66;
              v73[8] = v71;
              [v26 enumerateForTextFormat:v72];
            }
            _Block_object_dispose(v79, 8);
            id v5 = v69;
            uint64_t v14 = v70;
          }
          else
          {
            uint64_t v37 = 0;
            int v38 = *(unsigned __int8 *)(v71[1] + 30);
            if ((v38 - 15) >= 2) {
              uint64_t v39 = ":";
            }
            else {
              uint64_t v39 = "";
            }
            do
            {
              [a2 appendFormat:@"%@%@%s ", a3, v28, v39];
              switch(v38)
              {
                case 0:
                  if (v26) {
                    unsigned int v45 = [v26 valueAtIndex:v37];
                  }
                  else {
                    unsigned int v45 = sub_1000F7C30((uint64_t)v5, v71);
                  }
                  if (v45) {
                    CFStringRef v53 = @"true";
                  }
                  else {
                    CFStringRef v53 = @"false";
                  }
                  [a2 appendString:v53];
                  break;
                case 1:
                case 11:
                  if (v26) {
                    id v42 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v42 = sub_1000F79F8((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%u", v42, v58];
                  break;
                case 2:
                case 7:
                case 9:
                  if (v26) {
                    id v40 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v40 = sub_1000F79F8((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%d", v40, v58];
                  break;
                case 3:
                  if (v26) {
                    [v26 valueAtIndex:v37];
                  }
                  else {
                    float v46 = sub_1000F7FA8((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%.*g", 6, v46];
                  break;
                case 4:
                case 12:
                  if (v26) {
                    id v43 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v43 = sub_1000F7E2C((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%llu", v43, v58];
                  break;
                case 5:
                case 8:
                case 10:
                  if (v26) {
                    id v41 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v41 = sub_1000F7E2C((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%lld", v41, v58];
                  break;
                case 6:
                  if (v26) {
                    [v26 valueAtIndex:v37];
                  }
                  else {
                    double v47 = sub_1000F8140((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%.*lg", 15, *(void *)&v47];
                  break;
                case 13:
                  if (v26) {
                    uint64_t v48 = [v26 objectAtIndex:v37];
                  }
                  else {
                    uint64_t v48 = sub_1000EC7C8((uint64_t)v5, v71);
                  }
                  sub_1000F9238(v48, a2);
                  break;
                case 14:
                  if (v26) {
                    long long v49 = [v26 objectAtIndex:v37];
                  }
                  else {
                    long long v49 = sub_1000EC7C8((uint64_t)v5, v71);
                  }
                  sub_1000F9B94(v49, a2);
                  break;
                case 15:
                case 16:
                  if (v26) {
                    uint64_t v44 = [v26 objectAtIndex:v37];
                  }
                  else {
                    uint64_t v44 = sub_1000EC7C8((uint64_t)v5, v71);
                  }
                  long long v52 = v44;
                  [a2 appendFormat:@"{%@\n", v29];
                  sub_1000F8438(v52, a2, [(__CFString *)a3 stringByAppendingString:@"  "]);
                  [a2 appendFormat:@"%@}", a3];
                  CFStringRef v29 = &stru_10013DAE0;
                  id v5 = v69;
                  break;
                case 17:
                  if (v26)
                  {
                    id v50 = [v26 rawValueAtIndex:v37];
                    long long v51 = v71;
                  }
                  else
                  {
                    long long v51 = v71;
                    id v50 = sub_1000F79F8((uint64_t)v5, v71);
                  }
                  id v54 = [v51 enumDescriptor];
                  if (v54 && (id v55 = [v54 textFormatNameForValue:v50]) != 0) {
                    [a2 appendString:v55];
                  }
                  else {
                    [a2 appendFormat:@"%d", v50];
                  }
                  id v5 = v69;
                  a3 = v66;
                  break;
                default:
                  break;
              }
              [a2 appendFormat:@"%@\n", v29];
              ++v37;
            }
            while (v27 != v37);
            uint64_t v14 = v70;
          }
          BOOL v8 = v64;
          uint64_t v7 = v65;
          int v13 = v62;
          unint64_t v9 = v63;
          goto LABEL_94;
        }
      }
      uint64_t v14 = v70;
LABEL_94:
      unint64_t v15 = v67;
      unint64_t v16 = v68;
    }
    while (v14 < v8 || v16 < v15);
  }
  uint64_t v56 = sub_1000F8D8C([v5 unknownFields], a3);
  id result = [(__CFString *)v56 length];
  if (result)
  {
    [a2 appendFormat:@"%@# --- Unknown fields ---\n", a3];
    return [a2 appendString:v56];
  }
  return result;
}

void sub_1000F8D28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *sub_1000F8D8C(void *a1, const __CFString *a2)
{
  uint64_t v2 = &stru_10013DAE0;
  if (a1)
  {
    uint64_t v4 = a2 ? (__CFString *)a2 : &stru_10013DAE0;
    uint64_t v2 = (__CFString *)+[NSMutableString string];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [a1 sortedFields];
    id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v5;
          unint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
          id v7 = [v6 number];
          id v8 = [v6 varintList];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          void v41[2] = sub_1000F9184;
          v41[3] = &unk_10013B9C0;
          v41[4] = v2;
          v41[5] = v4;
          int v42 = (int)v7;
          [v8 enumerateValuesWithBlock:v41];
          id v9 = [v6 fixed32List];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          void v39[2] = sub_1000F91C0;
          v39[3] = &unk_10013B9E8;
          v39[4] = v2;
          v39[5] = v4;
          int v40 = (int)v7;
          [v9 enumerateValuesWithBlock:v39];
          id v10 = [v6 fixed64List];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          void v37[2] = sub_1000F91FC;
          v37[3] = &unk_10013B9C0;
          v37[4] = v2;
          v37[5] = v4;
          int v38 = (int)v7;
          [v10 enumerateValuesWithBlock:v37];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          unint64_t v27 = v6;
          id v11 = [v6 lengthDelimitedList];
          id v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                unint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                [(__CFString *)v2 appendFormat:@"%@%d: ", v4, v7];
                sub_1000F9238(v16, v2);
                [(__CFString *)v2 appendString:@"\n"];
              }
              id v13 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
            }
            while (v13);
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v17 = [v27 groupList];
          id v18 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
                [(__CFString *)v2 appendFormat:@"%@%d: {\n", v4, v7];
                [(__CFString *)v2 appendString:sub_1000F8D8C(v22, [(__CFString *)v4 stringByAppendingString:@"  "])];
                [(__CFString *)v2 appendFormat:@"%@}\n", v4];
              }
              id v19 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
            }
            while (v19);
          }
          uint64_t v5 = v28 + 1;
        }
        while ((id)(v28 + 1) != v26);
        id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v26);
    }
  }
  return v2;
}

id sub_1000F9184(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: %llu\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1000F91C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%X\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1000F91FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%llX\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_1000F9238(void *a1, void *a2)
{
  uint64_t v4 = (char *)[a1 bytes];
  uint64_t v5 = (uint64_t)[a1 length];
  [a2 appendString:@"\""];
  if (v5 >= 1)
  {
    unint64_t v6 = &v4[v5];
    do
    {
      uint64_t v7 = *v4;
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            id v8 = a2;
            CFStringRef v9 = @"\\\"";
            goto LABEL_16;
          case '\'':
            id v8 = a2;
            CFStringRef v9 = @"\\'";
            goto LABEL_16;
          case '\\':
            id v8 = a2;
            CFStringRef v9 = @"\\\\"";
            goto LABEL_16;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            id v8 = a2;
            CFStringRef v9 = @"\\t";
            goto LABEL_16;
          case 0xA:
            id v8 = a2;
            CFStringRef v9 = @"\\n";
            goto LABEL_16;
          case 0xD:
            id v8 = a2;
            CFStringRef v9 = @"\\r";
LABEL_16:
            [v8 appendString:v9];
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          [a2 appendFormat:@"\\%03o", v7];
          goto LABEL_17;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      [a2 appendFormat:@"%c", v7];
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }

  return [a2 appendString:@"\""];
}

NSString *sub_1000F93F0(char *a1, int a2, void *a3)
{
  unint64_t v3 = 0;
  if (a1 && a3)
  {
    unint64_t v23 = a1;
    int v6 = sub_1000F95D4(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      int v7 = v6;
      while (1)
      {
        int v8 = sub_1000F95D4(&v23);
        CFStringRef v9 = v23;
        if (v8 == a2) {
          break;
        }
        id v10 = v23 + 1;
        while (*v10++)
          ;
        unint64_t v23 = v10;
        if (v7-- < 2) {
          return 0;
        }
      }
      if (*v23)
      {
        unint64_t v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [a3 length]);
        char v14 = *v9;
        if (*v9)
        {
          uint64_t v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              [(NSMutableString *)v3 appendString:@"_"];
              char v14 = *v9;
            }
            int v16 = v14 & 0x1F;
            int v17 = v14 & 0x60;
            if (v17 == 32) {
              break;
            }
            if (v17 == 64)
            {
              uint64_t v18 = __toupper((char)[a3 characterAtIndex:v15]);
LABEL_21:
              [(NSMutableString *)v3 appendFormat:@"%c", v18];
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              uint64_t v19 = v16;
              uint64_t v20 = v15;
              do
              {
                id v21 = [a3 characterAtIndex:v20];
                if (v17 == 96) {
                  [(NSMutableString *)v3 appendFormat:@"%c", __toupper((char)v21)];
                }
                else {
                  [(NSMutableString *)v3 appendFormat:@"%C", v21];
                }
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            int v22 = *++v9;
            char v14 = v22;
            if (!v22) {
              return (NSString *)v3;
            }
          }
          uint64_t v18 = __tolower((char)[a3 characterAtIndex:v15]);
          goto LABEL_21;
        }
      }
      else
      {
        return +[NSString stringWithUTF8String:v23 + 1];
      }
    }
  }
  return (NSString *)v3;
}

uint64_t sub_1000F95D4(char **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    unsigned int v3 = v2 & 0x7F;
    int v4 = v1[1];
    *a1 = v1 + 2;
    int v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x3F80;
    int v6 = v1[2];
    *a1 = v1 + 3;
    int v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x1FC000;
    int v7 = v1[3];
    *a1 = v1 + 4;
    int v5 = v7 << 21;
    if (v7 < 0)
    {
      int v9 = v1[4];
      *a1 = v1 + 5;
      uint64_t v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        uint64_t v10 = 0;
        while (1)
        {
          int v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          if (++v10 == 5)
          {
            +[NSException raise:NSParseErrorException format:@"Unable to read varint32"];
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void sub_1000F96C0(uint64_t a1, void *a2, unsigned int a3)
{
}

BOOL sub_1000F96C8(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  unsigned int v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      SEL Name = method_getName(v3[i]);
      BOOL v6 = Name == a2;
      if (Name == a2) {
        break;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

id sub_1000F974C(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
  id v28 = result;
  if (result)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(a2);
        }
        uint64_t v30 = v7;
        int v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        id result = [v8 fieldNumber];
        if (result >= a3)
        {
          id v9 = result;
          if (result >= HIDWORD(a3)) {
            return result;
          }
          id v10 = [a1 getExtension:v8];
          unsigned int v11 = [v8 isRepeated];
          if (v11)
          {
            uint64_t v12 = (uint64_t)[v10 count];
            id v13 = [v8 singletonName];
            if (v12 != 1)
            {
              [a4 appendFormat:@"%@# [%@]\n", a5, v13];
              unsigned int v14 = [v8 dataType];
              if (!v12) {
                goto LABEL_7;
              }
              unsigned int v15 = v14;
              CFStringRef v16 = &stru_10013DAE0;
              goto LABEL_16;
            }
          }
          else
          {
            id v13 = [v8 singletonName];
          }
          CFStringRef v16 = +[NSString stringWithFormat:@"  # [%@]", v13];
          unsigned int v15 = [v8 dataType];
          uint64_t v12 = 1;
LABEL_16:
          uint64_t v17 = 0;
          if (v15 - 15 >= 2) {
            uint64_t v18 = ":";
          }
          else {
            uint64_t v18 = "";
          }
          do
          {
            id v19 = v10;
            if (v11) {
              id v19 = [v10 objectAtIndex:v17];
            }
            [a4 appendFormat:@"%@%u%s ", a5, v9, v18];
            switch(v15)
            {
              case 0u:
                if ([v19 BOOLValue]) {
                  CFStringRef v22 = @"true";
                }
                else {
                  CFStringRef v22 = @"false";
                }
                [a4 appendString:v22];
                break;
              case 1u:
              case 0xBu:
                [a4 appendFormat:@"%u", [v19 unsignedIntValue], v24];
                break;
              case 2u:
                id v20 = [v19 unsignedIntValue];
                goto LABEL_34;
              case 3u:
                [v19 floatValue];
                [a4 appendFormat:@"%.*g", 6, v21];
                break;
              case 4u:
              case 0xCu:
                [a4 appendFormat:@"%llu", [v19 unsignedLongLongValue], v24];
                break;
              case 5u:
              case 8u:
              case 0xAu:
                [a4 appendFormat:@"%lld", [v19 longLongValue], v24];
                break;
              case 6u:
                [v19 doubleValue];
                [a4 appendFormat:@"%.*lg", 15, v23];
                break;
              case 7u:
              case 9u:
              case 0x11u:
                id v20 = [v19 intValue];
LABEL_34:
                [a4 appendFormat:@"%d", v20, v24];
                break;
              case 0xDu:
                sub_1000F9238(v19, a4);
                break;
              case 0xEu:
                sub_1000F9B94(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                [a4 appendFormat:@"{%@\n", v16];
                sub_1000F8438(v19, a4, [a5 stringByAppendingString:@"  "]);
                [a4 appendFormat:@"%@}", a5];
                CFStringRef v16 = &stru_10013DAE0;
                break;
              default:
                break;
            }
            [a4 appendFormat:@"%@\n", v16];
            ++v17;
          }
          while (v12 != v17);
        }
LABEL_7:
        uint64_t v7 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v28 = result;
    }
    while (result);
  }
  return result;
}

id sub_1000F9B94(void *a1, void *a2)
{
  [a2 appendString:@"\""];
  int v4 = (char *)[a1 length];
  if (v4)
  {
    int v5 = v4;
    for (unint64_t i = 0; v5 != i; ++i)
    {
      id v7 = [a1 characterAtIndex:i];
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            int v8 = a2;
            CFStringRef v9 = @"\\\"";
            break;
          case '\'':
            int v8 = a2;
            CFStringRef v9 = @"\\'";
            break;
          case '\\':
            int v8 = a2;
            CFStringRef v9 = @"\\\\"";
            break;
          default:
LABEL_19:
            if (v7 > 0x1F) {
              [a2 appendFormat:@"%C", v7, v11, v12];
            }
            else {
              [a2 appendFormat:@"\\%d%d%d", 0, v7 >> 3, v7 & 7];
            }
            continue;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            int v8 = a2;
            CFStringRef v9 = @"\\t";
            break;
          case 0xA:
            int v8 = a2;
            CFStringRef v9 = @"\\n";
            break;
          case 0xD:
            int v8 = a2;
            CFStringRef v9 = @"\\r";
            break;
          default:
            goto LABEL_19;
        }
      }
      [v8 appendString:v9];
    }
  }

  return [a2 appendString:@"\""];
}

id sub_1000F9D2C(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 56)];
  sub_1000F9B94(a2, *(void **)(a1 + 32));
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  int v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_1000F9238(a3, *(void **)(a1 + 32));
      break;
    case 15:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_1000F8438(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 14:
      sub_1000F9B94(a3, *(void **)(a1 + 32));
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  CFStringRef v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 80);

  return [v9 appendString:v10];
}

id sub_1000F9E78(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  int v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 104) == 14)
  {
    [v8 appendString:*(void *)(a1 + 56)];
    sub_1000F9B94(a2, *(void **)(a1 + 32));
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else
  {
    [v8 appendFormat:@"%@%@\n", *(void *)(a1 + 56), a2];
  }
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  switch(*(unsigned char *)(a1 + 105))
  {
    case 0xD:
      sub_1000F9238(a3, *(void **)(a1 + 32));
      break;
    case 0xE:
      sub_1000F9B94(a3, *(void **)(a1 + 32));
      break;
    case 0xF:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_1000F8438(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 0x11:
      id v11 = [a3 intValue];
      id v12 = [*(id *)(a1 + 80) enumDescriptor];
      if (v12)
      {
        id v13 = [v12 textFormatNameForValue:v11];
        if (v13)
        {
          id v10 = v13;
          CFStringRef v9 = *(void **)(a1 + 32);
          goto LABEL_14;
        }
      }
      [*(id *)(a1 + 32) appendFormat:@"%d", v11];
      break;
    default:
      CFStringRef v9 = *(void **)(a1 + 32);
      id v10 = a3;
LABEL_14:
      [v9 appendString:v10];
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  unsigned int v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 88);

  return [v14 appendString:v15];
}

uint64_t sub_1000FA704(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t sub_1000FA70C(char a1)
{
  return a1 & 7;
}

uint64_t sub_1000FA714(unsigned int a1)
{
  return a1 >> 3;
}

BOOL sub_1000FA71C(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t sub_1000FA72C(int a1, char a2)
{
  if (a2) {
    return 2;
  }
  else {
    return dword_10010E730[a1];
  }
}

uint64_t sub_1000FAC2C(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBApi descriptor](TransparencyGPBApi) fieldWithNumber:7];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000FAC78(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBApi descriptor](TransparencyGPBApi, "descriptor") fieldWithNumber:7];

  return sub_1000F7C2C(a1, v4, a2);
}

uint64_t sub_1000FAD50(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBMethod descriptor](TransparencyGPBMethod) fieldWithNumber:7];

  return sub_1000F7C28(a1, v2);
}

uint64_t sub_1000FAD9C(uint64_t a1, uint64_t a2)
{
  id v4 = [[+[TransparencyGPBMethod descriptor](TransparencyGPBMethod) fieldWithNumber:7];

  return sub_1000F7C2C(a1, v4, a2);
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t DataProtocol.copyBytes<A>(to:from:)()
{
  return DataProtocol.copyBytes<A>(to:from:)();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t static CustomNSError.errorDomain.getter()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t CustomNSError.errorCode.getter()
{
  return CustomNSError.errorCode.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return _BridgedStoredNSError.hash(into:)();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t URL.description.getter()
{
  return URL.description.getter();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.resetBytes(in:)()
{
  return Data._Representation.resetBytes(in:)();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Data.append<A>(contentsOf:)()
{
  return Data.append<A>(contentsOf:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Data.init<A>(_:)()
{
  return Data.init<A>(_:)();
}

uint64_t Date.init(timeInterval:since:)()
{
  return Date.init(timeInterval:since:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.hash(into:)()
{
  return UUID.hash(into:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t TransparencySWSysdiagnose.PublicKeybag.init(env:app:patLogBeginMs:tltLogBeginMs:fetchTime:trustedAppSPKI:)()
{
  return TransparencySWSysdiagnose.PublicKeybag.init(env:app:patLogBeginMs:tltLogBeginMs:fetchTime:trustedAppSPKI:)();
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.PublicKeybag()
{
  return type metadata accessor for TransparencySWSysdiagnose.PublicKeybag();
}

uint64_t TransparencySWSysdiagnose.Reachability.init(network:)()
{
  return TransparencySWSysdiagnose.Reachability.init(network:)();
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.Reachability()
{
  return type metadata accessor for TransparencySWSysdiagnose.Reachability();
}

uint64_t TransparencySWSysdiagnose.StateMachine.init(state:flags:pendingFlags:publicKeybag:containerPath:reachability:)()
{
  return TransparencySWSysdiagnose.StateMachine.init(state:flags:pendingFlags:publicKeybag:containerPath:reachability:)();
}

uint64_t type metadata accessor for TransparencySWSysdiagnose.StateMachine()
{
  return type metadata accessor for TransparencySWSysdiagnose.StateMachine();
}

uint64_t TransparencySWSysdiagnose.init(stateMachine:fallback:)()
{
  return TransparencySWSysdiagnose.init(stateMachine:fallback:)();
}

uint64_t TransparencySWSysdiagnose.json()()
{
  return TransparencySWSysdiagnose.json()();
}

uint64_t type metadata accessor for TransparencySWSysdiagnose()
{
  return type metadata accessor for TransparencySWSysdiagnose();
}

uint64_t TransparencySWIssue.init(issue:posted:slh:)()
{
  return TransparencySWIssue.init(issue:posted:slh:)();
}

uint64_t TransparencySWIssue.issue.getter()
{
  return TransparencySWIssue.issue.getter();
}

uint64_t type metadata accessor for TransparencySWIssue()
{
  return type metadata accessor for TransparencySWIssue();
}

uint64_t static SWTFollowUpType.allCases.getter()
{
  return static SWTFollowUpType.allCases.getter();
}

uint64_t SWTFollowUpType.init(rawValue:)()
{
  return SWTFollowUpType.init(rawValue:)();
}

uint64_t SWTFollowUpType.rawValue.getter()
{
  return SWTFollowUpType.rawValue.getter();
}

uint64_t type metadata accessor for SWTFollowUpType()
{
  return type metadata accessor for SWTFollowUpType();
}

uint64_t EventValue.init(stringLiteral:)()
{
  return EventValue.init(stringLiteral:)();
}

uint64_t EventValue.init(BOOLeanLiteral:)()
{
  return EventValue.init(BOOLeanLiteral:)();
}

uint64_t EventValue.init(integerLiteral:)()
{
  return EventValue.init(integerLiteral:)();
}

uint64_t type metadata accessor for EventValue()
{
  return type metadata accessor for EventValue();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

uint64_t static ParsableCommand.configuration.getter()
{
  return static ParsableCommand.configuration.getter();
}

uint64_t static ParsableCommand.main()()
{
  return static ParsableCommand.main()();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

uint64_t CancellationError.init()()
{
  return CancellationError.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:defaultValue:table:bundle:locale:comment:)()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t type metadata accessor for CancellationError()
{
  return type metadata accessor for CancellationError();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return ThrowingTaskGroup.makeAsyncIterator()();
}

Swift::Void __swiftcall ThrowingTaskGroup.cancelAll()()
{
}

uint64_t type metadata accessor for ThrowingTaskGroup()
{
  return type metadata accessor for ThrowingTaskGroup();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t NSArray.makeIterator()()
{
  return NSArray.makeIterator()();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t BinaryInteger.description.getter()
{
  return BinaryInteger.description.getter();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return dispatch thunk of BinaryInteger.init<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static GlobalActor.sharedUnownedExecutor.getter()
{
  return static GlobalActor.sharedUnownedExecutor.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t SuspendingClock.now.getter()
{
  return SuspendingClock.now.getter();
}

uint64_t static SuspendingClock.now.getter()
{
  return static SuspendingClock.now.getter();
}

uint64_t SuspendingClock.Instant.duration(to:)()
{
  return SuspendingClock.Instant.duration(to:)();
}

uint64_t type metadata accessor for SuspendingClock.Instant()
{
  return type metadata accessor for SuspendingClock.Instant();
}

uint64_t SuspendingClock.init()()
{
  return SuspendingClock.init()();
}

uint64_t type metadata accessor for SuspendingClock()
{
  return type metadata accessor for SuspendingClock();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return dispatch thunk of static FixedWidthInteger.bitWidth.getter();
}

uint64_t dispatch thunk of FixedWidthInteger.bigEndian.getter()
{
  return dispatch thunk of FixedWidthInteger.bigEndian.getter();
}

uint64_t dispatch thunk of FixedWidthInteger.init(bigEndian:)()
{
  return dispatch thunk of FixedWidthInteger.init(bigEndian:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return dispatch thunk of static AdditiveArithmetic.zero.getter();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error<>._code.getter()
{
  return Error<>._code.getter();
}

{
  return Error<>._code.getter();
}

uint64_t Error<>._domain.getter()
{
  return Error<>._domain.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)Int32._bridgeToObjectiveC()();
}

NSNumber __swiftcall Int64._bridgeToObjectiveC()()
{
  return (NSNumber)Int64._bridgeToObjectiveC()();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Duration.components.getter()
{
  return Duration.components.getter();
}

uint64_t static Duration.milliseconds(_:)()
{
  return static Duration.milliseconds(_:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return _NSAllocateObject(aClass, extraBytes, zone);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return _NSZoneFromPointer(ptr);
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

uint64_t SecCertificateCopySubjectPublicKeyInfoSHA256Digest()
{
  return _SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

uint64_t SecCertificateCreateWithPEM()
{
  return _SecCertificateCreateWithPEM();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleIDSService()
{
  return _SecPolicyCreateAppleIDSService();
}

uint64_t SecPolicyCreateAppleKeyTransparency()
{
  return _SecPolicyCreateAppleKeyTransparency();
}

uint64_t SecSHA256DigestCreateFromData()
{
  return _SecSHA256DigestCreateFromData();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccvrf_factory_irtfdraft03_default()
{
  return _ccvrf_factory_irtfdraft03_default();
}

uint64_t ccvrf_sizeof_public_key()
{
  return _ccvrf_sizeof_public_key();
}

uint64_t ccvrf_verify()
{
  return _ccvrf_verify();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return _class_copyMethodList(cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return _class_getInstanceSize(cls);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

SEL method_getName(Method m)
{
  return _method_getName(m);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

nw_endpoint_t nw_endpoint_create_url(const char *url)
{
  return _nw_endpoint_create_url(url);
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_evaluator_cancel()
{
  return _nw_path_evaluator_cancel();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return _nw_path_evaluator_set_update_handler();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

Class objc_getMetaClass(const char *name)
{
  return _objc_getMetaClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return _objc_getProtocol(name);
}

Class objc_lookUpClass(const char *name)
{
  return _objc_lookUpClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  objc_method_description MethodDescription = _protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
  types = MethodDescription.types;
  name = MethodDescription.name;
  result.types = types;
  result.name = name;
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

SEL sel_getUid(const char *str)
{
  return _sel_getUid(str);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v3(db, zSql, nByte, prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBody];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return _[a1 HTTPMethod];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return [a1 URLsForDirectory:inDomains:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___verifiedLogHeads(void *a1, const char *a2, ...)
{
  return [a1 __verifiedLogHeads];
}

id objc_msgSend__setPrivacyProxyFailClosed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setPrivacyProxyFailClosed:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 addExtension:value:];
}

id objc_msgSend_addExtensions_(void *a1, const char *a2, ...)
{
  return [a1 addExtensions:];
}

id objc_msgSend_addField_(void *a1, const char *a2, ...)
{
  return [a1 addField:];
}

id objc_msgSend_addFixed32_(void *a1, const char *a2, ...)
{
  return [a1 addFixed32:];
}

id objc_msgSend_addFixed64_(void *a1, const char *a2, ...)
{
  return [a1 addFixed64:];
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return [a1 addGroup:];
}

id objc_msgSend_addLengthDelimited_(void *a1, const char *a2, ...)
{
  return [a1 addLengthDelimited:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addRawEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addRawEntriesFromDictionary:];
}

id objc_msgSend_addRawValue_(void *a1, const char *a2, ...)
{
  return [a1 addRawValue:];
}

id objc_msgSend_addRawValues_count_(void *a1, const char *a2, ...)
{
  return [a1 addRawValues:count:];
}

id objc_msgSend_addRawValuesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addRawValuesFromArray:];
}

id objc_msgSend_addTrustedCertificate_trustedKeys_error_(void *a1, const char *a2, ...)
{
  return [a1 addTrustedCertificate:trustedKeys:error:];
}

id objc_msgSend_addUnknownMapEntry_value_(void *a1, const char *a2, ...)
{
  return [a1 addUnknownMapEntry:x0 value:x1];
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return [a1 addValue:];
}

id objc_msgSend_addValues_count_(void *a1, const char *a2, ...)
{
  return [a1 addValues:count:];
}

id objc_msgSend_addValuesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addValuesFromArray:];
}

id objc_msgSend_addVarint_(void *a1, const char *a2, ...)
{
  return [a1 addVarint:];
}

id objc_msgSend_algorithm(void *a1, const char *a2, ...)
{
  return _[a1 algorithm];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocDescriptorForClass_messageName_fileDescription_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return [a1 allocDescriptorForClass:x0 messageName:x1 fileDescription:x2 fields:x3 fieldCount:x4 storageSize:x5 flags:x6];
}

id objc_msgSend_allocDescriptorForClass_rootClass_file_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:extraTextFormatInfo:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowOldKeys(void *a1, const char *a2, ...)
{
  return _[a1 allowOldKeys];
}

id objc_msgSend_allowsInternalSecurityPolicies(void *a1, const char *a2, ...)
{
  return _[a1 allowsInternalSecurityPolicies];
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return _[a1 alternateWireType];
}

id objc_msgSend_appLeafsArray(void *a1, const char *a2, ...)
{
  return _[a1 appLeafsArray];
}

id objc_msgSend_appLeafsArray_Count(void *a1, const char *a2, ...)
{
  return [a1 appLeafsArray_Count];
}

id objc_msgSend_appSmtKeyStore(void *a1, const char *a2, ...)
{
  return _[a1 appSmtKeyStore];
}

id objc_msgSend_appSthKeyStore(void *a1, const char *a2, ...)
{
  return _[a1 appSthKeyStore];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return _[a1 application];
}

id objc_msgSend_applicationIdentifierForValue_(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifierForValue:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_atEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 atEnvironment];
}

id objc_msgSend_autoVacuumSetting(void *a1, const char *a2, ...)
{
  return _[a1 autoVacuumSetting];
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_bindNullAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 bindNullAtColumn:];
}

id objc_msgSend_blobAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 blobAtColumn:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return _[a1 calcValueNameOffsets];
}

id objc_msgSend_certificateFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 certificateFromData:x0 error:x1];
}

id objc_msgSend_changeLogHead(void *a1, const char *a2, ...)
{
  return _[a1 changeLogHead];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_checkBagKeyClass_keys_(void *a1, const char *a2, ...)
{
  return [a1 checkBagKeyClass:keys];
}

id objc_msgSend_checkLastTagWas_(void *a1, const char *a2, ...)
{
  return [a1 checkLastTagWas:];
}

id objc_msgSend_checkMissingBagKeys_keys_(void *a1, const char *a2, ...)
{
  return [a1 checkMissingBagKeys:keys];
}

id objc_msgSend_checkSplitsFor_(void *a1, const char *a2, ...)
{
  return [a1 checkSplitsFor:];
}

id objc_msgSend_cleanseErrorForXPC_(void *a1, const char *a2, ...)
{
  return [a1 cleanseErrorForXPC:];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return _[a1 columnCount];
}

id objc_msgSend_columnNameAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 columnNameAtColumn:];
}

id objc_msgSend_columnTypeAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 columnTypeAtColumn:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_computeSerializedSizeAsField_(void *a1, const char *a2, ...)
{
  return [a1 computeSerializedSizeAsField:];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configApp(void *a1, const char *a2, ...)
{
  return _[a1 configApp];
}

id objc_msgSend_configBagFileName(void *a1, const char *a2, ...)
{
  return _[a1 configBagFileName];
}

id objc_msgSend_configBagRequest(void *a1, const char *a2, ...)
{
  return _[a1 configBagRequest];
}

id objc_msgSend_configBagURL(void *a1, const char *a2, ...)
{
  return _[a1 configBagURL];
}

id objc_msgSend_configurationExpired(void *a1, const char *a2, ...)
{
  return _[a1 configurationExpired];
}

id objc_msgSend_configureFromNetworkBagData_error_(void *a1, const char *a2, ...)
{
  return [a1 configureFromNetworkBagData:x0 error:x1];
}

id objc_msgSend_configureFromNetworkWithFetcher_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "configureFromNetworkWithFetcher:completionHandler:");
}

id objc_msgSend_configureWithDisk_(void *a1, const char *a2, ...)
{
  return [a1 configureWithDisk:];
}

id objc_msgSend_configured(void *a1, const char *a2, ...)
{
  return _[a1 configured];
}

id objc_msgSend_consistencyVerified(void *a1, const char *a2, ...)
{
  return _[a1 consistencyVerified];
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return _[a1 containingMessageClass];
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return _[a1 containingType];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtURL:x0 includingPropertiesForKeys:x1 options:x2 error:x3];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyFieldsInto_zone_descriptor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyFieldsInto:zone:descriptor:");
}

id objc_msgSend_copyManagedObject_(void *a1, const char *a2, ...)
{
  return [a1 copyManagedObject:];
}

id objc_msgSend_copyTrustedKeysFromDataArray_error_(void *a1, const char *a2, ...)
{
  return [a1 copyTrustedKeysFromDataArray:x0 error:x1];
}

id objc_msgSend_copyVRFKeyFromConfigProof_error_(void *a1, const char *a2, ...)
{
  return [a1 copyVRFKeyFromConfigProof:x0 error:x1];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return _[a1 countOfFields];
}

id objc_msgSend_createCACertificatesArray_error_(void *a1, const char *a2, ...)
{
  return [a1 createCACertificatesArray:error];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createFailureEvent_application_optInServer_(void *a1, const char *a2, ...)
{
  return [a1 createFailureEvent:x0 application:x1 optInServer:x2];
}

id objc_msgSend_createManagedObjectWithError_(void *a1, const char *a2, ...)
{
  return [a1 createManagedObjectWithError:];
}

id objc_msgSend_createMapHead_application_logBeginTime_logHeadHash_logType_revision_populating_gossip_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createMapHead:application:logBeginTime:logHeadHash:logType:revision:populating:gossip:");
}

id objc_msgSend_createSignedTreeHeadFailure(void *a1, const char *a2, ...)
{
  return _[a1 createSignedTreeHeadFailure];
}

id objc_msgSend_createTreeHead_isMapHead_application_logBeginTime_logHeadHash_logType_revision_gossip_(void *a1, const char *a2, ...)
{
  return [a1 createTreeHead:x0 isMapHead:x1 application:x2 logBeginTime:x3 logHeadHash:x4 logType:x5 revision:x6 gossip:x7];
}

id objc_msgSend_createTrustedSthKeyStoreFromProofSPKI_signingKeysMap_error_(void *a1, const char *a2, ...)
{
  return [a1 createTrustedSthKeyStoreFromProofSPKI:x0 signingKeysMap:x1 error:x2];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 currentEnvironment];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataStore(void *a1, const char *a2, ...)
{
  return _[a1 dataStore];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return _[a1 dataType];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:options:error:];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return [a1 dataWithLength:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return _[a1 db];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_deepCopyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 deepCopyWithZone:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultNetworkTimeout(void *a1, const char *a2, ...)
{
  return _[a1 defaultNetworkTimeout];
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return _[a1 defaultValue];
}

id objc_msgSend_deleteFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return [a1 deleteFile:x0 inDirectory:x1 error:x2];
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return [a1 deleteObject:];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_determineATEnvironmentFromPCCEnvironment_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "determineATEnvironmentFromPCCEnvironment:completion:");
}

id objc_msgSend_devicePlatform(void *a1, const char *a2, ...)
{
  return _[a1 devicePlatform];
}

id objc_msgSend_diagnosticsJsonDictionary(void *a1, const char *a2, ...)
{
  return _[a1 diagnosticsJsonDictionary];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:error:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return _[a1 directory];
}

id objc_msgSend_doKTResultWithAnalyticsForEventName_error_block_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "doKTResultWithAnalyticsForEventName:error:block:");
}

id objc_msgSend_doKTResultWithAnalyticsForEventName_validateType_error_block_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "doKTResultWithAnalyticsForEventName:validateType:error:block:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 doubleAtColumn:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earliestCurrentTreeVersionWithError_(void *a1, const char *a2, ...)
{
  return [a1 earliestCurrentTreeVersionWithError:];
}

id objc_msgSend_earliestNextTreeVersionWithError_(void *a1, const char *a2, ...)
{
  return [a1 earliestNextTreeVersionWithError:];
}

id objc_msgSend_emptyAtDepth_leafIndex_treeId_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "emptyAtDepth:leafIndex:treeId:");
}

id objc_msgSend_endSlh(void *a1, const char *a2, ...)
{
  return _[a1 endSlh];
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 enumDescriptor];
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return _[a1 enumVerifier];
}

id objc_msgSend_enumerateColumnsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateColumnsUsingBlock:];
}

id objc_msgSend_enumerateForTextFormat_(void *a1, const char *a2, ...)
{
  return [a1 enumerateForTextFormat:];
}

id objc_msgSend_enumerateKeysAndBoolsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndBoolsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndDoublesUsingBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumerateKeysAndDoublesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndFloatsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndFloatsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndInt32sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndInt64sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndRawValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndRawValuesUsingBlock:];
}

id objc_msgSend_enumerateKeysAndUInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndUInt32sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndUInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndUInt64sUsingBlock:];
}

id objc_msgSend_enumerateRawValuesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateRawValuesWithBlock:];
}

id objc_msgSend_enumerateValuesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateValuesWithBlock:];
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:description:];
}

id objc_msgSend_errorWithDomain_code_underlyingError_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorWithDomain:code:underlyingError:description:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_eventId(void *a1, const char *a2, ...)
{
  return _[a1 eventId];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_executeSQL_(void *a1, const char *a2, ...)
{
  return [a1 executeSQL:];
}

id objc_msgSend_executeSQL_arguments_(void *a1, const char *a2, ...)
{
  return [a1 executeSQL:];
}

id objc_msgSend_expirationTime(void *a1, const char *a2, ...)
{
  return _[a1 expirationTime];
}

id objc_msgSend_extensionForDescriptor_fieldNumber_(void *a1, const char *a2, ...)
{
  return [a1 extensionForDescriptor:fieldNumber:];
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return _[a1 extensionRanges];
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return _[a1 extensionRangesCount];
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return _[a1 extensionRegistry];
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return _[a1 extensionsCurrentlySet];
}

id objc_msgSend_fetchConfigBag_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchConfigBag:x0 completionHandler:x1];
}

id objc_msgSend_fetchTreeHead_isMapHead_application_logBeginTime_logType_revision_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:");
}

id objc_msgSend_fetchTreeHeadsWithoutHash_isMapHead_application_logBeginTime_logType_revision_error_(void *a1, const char *a2, ...)
{
  return [a1 fetchTreeHeadsWithoutHash:x0 isMapHead:x1 application:x2 logBeginTime:x3 logType:x4 revision:x5 error:x6];
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return _[a1 fieldNumber];
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return _[a1 fieldType];
}

id objc_msgSend_fieldWithNumber_(void *a1, const char *a2, ...)
{
  return [a1 fieldWithNumber:];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return _[a1 file];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return _[a1 fixed32List];
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return _[a1 fixed64List];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_followUp(void *a1, const char *a2, ...)
{
  return _[a1 followUp];
}

id objc_msgSend_formatEventName_application_(void *a1, const char *a2, ...)
{
  return [a1 formatEventName:application:];
}

id objc_msgSend_forwards(void *a1, const char *a2, ...)
{
  return _[a1 forwards];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_generateDone(void *a1, const char *a2, ...)
{
  return _[a1 generateDone];
}

id objc_msgSend_generateError_method_(void *a1, const char *a2, ...)
{
  return [a1 generateError:method];
}

id objc_msgSend_getAggregateOptInState_(void *a1, const char *a2, ...)
{
  return [a1 getAggregateOptInState:];
}

id objc_msgSend_getBool_(void *a1, const char *a2, ...)
{
  return [a1 getBool:];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 maxLength:x1 usedLength:x2 encoding:x3 options:x4 range:x5 remainingRange:x6];
}

id objc_msgSend_getConfigBagEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 getConfigBagEnvironment];
}

id objc_msgSend_getEnumTextFormatNameForIndex_(void *a1, const char *a2, ...)
{
  return [a1 getEnumTextFormatNameForIndex:];
}

id objc_msgSend_getEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 getEnvironment];
}

id objc_msgSend_getExistingExtension_(void *a1, const char *a2, ...)
{
  return [a1 getExistingExtension:];
}

id objc_msgSend_getExtension_(void *a1, const char *a2, ...)
{
  return [a1 getExtension:];
}

id objc_msgSend_getOverride_(void *a1, const char *a2, ...)
{
  return [a1 getOverride:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_getSettings(void *a1, const char *a2, ...)
{
  return _[a1 getSettings];
}

id objc_msgSend_getUnsigned_(void *a1, const char *a2, ...)
{
  return [a1 getUnsigned:];
}

id objc_msgSend_gossip(void *a1, const char *a2, ...)
{
  return _[a1 gossip];
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return _[a1 groupList];
}

id objc_msgSend_hasChangeLogHead(void *a1, const char *a2, ...)
{
  return _[a1 hasChangeLogHead];
}

id objc_msgSend_hasEndSlh(void *a1, const char *a2, ...)
{
  return _[a1 hasEndSlh];
}

id objc_msgSend_hasInternalDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 hasInternalDiagnostics];
}

id objc_msgSend_hasObjectMapHead(void *a1, const char *a2, ...)
{
  return _[a1 hasObjectMapHead];
}

id objc_msgSend_hasPamHeadInPatProof(void *a1, const char *a2, ...)
{
  return _[a1 hasPamHeadInPatProof];
}

id objc_msgSend_hasPatClosedProof(void *a1, const char *a2, ...)
{
  return _[a1 hasPatClosedProof];
}

id objc_msgSend_hasPatConfigProof(void *a1, const char *a2, ...)
{
  return _[a1 hasPatConfigProof];
}

id objc_msgSend_hasPatHead(void *a1, const char *a2, ...)
{
  return _[a1 hasPatHead];
}

id objc_msgSend_hasPerApplicationTreeEntry(void *a1, const char *a2, ...)
{
  return _[a1 hasPerApplicationTreeEntry];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSignature(void *a1, const char *a2, ...)
{
  return _[a1 hasSignature];
}

id objc_msgSend_hasSlh(void *a1, const char *a2, ...)
{
  return _[a1 hasSlh];
}

id objc_msgSend_hasSmh(void *a1, const char *a2, ...)
{
  return _[a1 hasSmh];
}

id objc_msgSend_hasStartSlh(void *a1, const char *a2, ...)
{
  return _[a1 hasStartSlh];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hasTltConfigProof(void *a1, const char *a2, ...)
{
  return _[a1 hasTltConfigProof];
}

id objc_msgSend_hasTopLevelTreeEntry(void *a1, const char *a2, ...)
{
  return _[a1 hasTopLevelTreeEntry];
}

id objc_msgSend_hasUnknownSPKIHashError_(void *a1, const char *a2, ...)
{
  return [a1 hasUnknownSPKIHashError:];
}

id objc_msgSend_hasVrfPublicKey(void *a1, const char *a2, ...)
{
  return _[a1 hasVrfPublicKey];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashesOfPeersInPathToRootArray(void *a1, const char *a2, ...)
{
  return _[a1 hashesOfPeersInPathToRootArray];
}

id objc_msgSend_hashesOfPeersInPathToRootArray_Count(void *a1, const char *a2, ...)
{
  return [a1 hashesOfPeersInPathToRootArray_Count];
}

id objc_msgSend_httpMethod(void *a1, const char *a2, ...)
{
  return _[a1 httpMethod];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initGETWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initGETWithURL:];
}

id objc_msgSend_initPOSTWithURL_data_uuid_(void *a1, const char *a2, ...)
{
  return [a1 initPOSTWithURL:data:uuid:];
}

id objc_msgSend_initPUSHWithURL_data_uuid_(void *a1, const char *a2, ...)
{
  return [a1 initPUSHWithURL:x0 data:x1 uuid:x2];
}

id objc_msgSend_initWithBools_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithBools:forKeys:count:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 length:x1];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:encoding:];
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithClass_messageName_fileDescription_fields_storageSize_wireFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithClass:x0 messageName:x1 fileDescription:x2 fields:x3 storageSize:x4 wireFormat:x5];
}

id objc_msgSend_initWithCodedInputStream_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithCodedInputStream:x0 extensionRegistry:x1 error:x2];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 extensionRegistry:x1 error:x2];
}

id objc_msgSend_initWithDoubles_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithDoubles:forKeys:count:];
}

id objc_msgSend_initWithFieldDescription_descriptorFlags_(void *a1, const char *a2, ...)
{
  return [a1 initWithFieldDescription:descriptorFlags:];
}

id objc_msgSend_initWithFloats_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithFloats:forKeys:count:];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithInt32s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithInt64s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithKey_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:];
}

id objc_msgSend_initWithKeyBag_application_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyBag:application:];
}

id objc_msgSend_initWithKeyData_tltLeafs_intermediates_patConfigProof_tltConfigProof_patClosedProof_pamHeadInPatProof_application_allowOldKeys_settings_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyData:x0 tltLeafs:x1 intermediates:x2 patConfigProof:x3 tltConfigProof:x4 patClosedProof:x5 pamHeadInPatProof:x6 application:x7 allowOldKeys:x8 settings:x9 error:x10];
}

id objc_msgSend_initWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithMessage:x0 typeURLPrefix:x1 error:x2];
}

id objc_msgSend_initWithName_fields_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 fields:x1];
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 value:x1];
}

id objc_msgSend_initWithNumber_(void *a1, const char *a2, ...)
{
  return [a1 initWithNumber:];
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:count:];
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return [a1 initWithOutputStream:];
}

id objc_msgSend_initWithOutputStream_data_(void *a1, const char *a2, ...)
{
  return [a1 initWithOutputStream:x0 data:x1];
}

id objc_msgSend_initWithPackage_objcPrefix_syntax_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:x0 objcPrefix:x1 syntax:x2];
}

id objc_msgSend_initWithPackage_syntax_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:x0 syntax:x1];
}

id objc_msgSend_initWithStatement_db_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithStatement:x0 db:x1 error:x2];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithTransparencySettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithTransparencySettings:];
}

id objc_msgSend_initWithTrustedKeyStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithTrustedKeyStore:];
}

id objc_msgSend_initWithTrustedKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithTrustedKeys:];
}

id objc_msgSend_initWithUInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithUInt32s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithUInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithUInt64s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithURL_data_timeout_httpMethod_uuid_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 data:x1 timeout:x2 httpMethod:x3 uuid:x4];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithValidationFunction_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:];
}

id objc_msgSend_initWithValidationFunction_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:_objc_msgSend(a1, "validationFunction") capacity:_objc_msgSend(a1, "capacity")];
}

id objc_msgSend_initWithValidationFunction_rawValues_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:x0 rawValues:x1 count:x2];
}

id objc_msgSend_initWithValidationFunction_rawValues_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:x0 rawValues:x1 forKeys:x2 count:x3];
}

id objc_msgSend_initWithValueArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithValueArray:];
}

id objc_msgSend_initWithValues_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValues:x0 count:x1];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_int64AtColumn_(void *a1, const char *a2, ...)
{
  return [a1 int64AtColumn:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interiorNodeForLeftData_rightData_(void *a1, const char *a2, ...)
{
  return [a1 interiorNodeForLeftData:rightData:];
}

id objc_msgSend_intermediatesArray(void *a1, const char *a2, ...)
{
  return _[a1 intermediatesArray];
}

id objc_msgSend_internalClear_(void *a1, const char *a2, ...)
{
  return [a1 internalClear:];
}

id objc_msgSend_internalResizeToCapacity_(void *a1, const char *a2, ...)
{
  return [a1 internalResizeToCapacity:];
}

id objc_msgSend_isClosed(void *a1, const char *a2, ...)
{
  return _[a1 isClosed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFieldTag_(void *a1, const char *a2, ...)
{
  return [a1 isFieldTag:];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return _[a1 isInitialized];
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return _[a1 isPackable];
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return _[a1 isRepeated];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return _[a1 isRequired];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isSubclassOfClass:];
}

id objc_msgSend_isValidEnumValue_(void *a1, const char *a2, ...)
{
  return [a1 isValidEnumValue:];
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return _[a1 isWireFormat];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyBag(void *a1, const char *a2, ...)
{
  return _[a1 keyBag];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_kt_currentTimeMs(void *a1, const char *a2, ...)
{
  return [a1 kt_currentTimeMs];
}

id objc_msgSend_kt_dataWithUint64_length_(void *a1, const char *a2, ...)
{
  return [a1 kt_dataWithUint64:x0 length:x1];
}

id objc_msgSend_kt_hexString(void *a1, const char *a2, ...)
{
  return [a1 kt_hexString];
}

id objc_msgSend_kt_sha256(void *a1, const char *a2, ...)
{
  return [a1 kt_sha256];
}

id objc_msgSend_kt_toISO_8601_UTCString(void *a1, const char *a2, ...)
{
  return [a1 kt_toISO_8601_UTCString];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_leafHash_index_treeId_(void *a1, const char *a2, ...)
{
  return [a1 leafHash:x0 index:x1 treeId:x2];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return _[a1 lengthDelimitedList];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_logBeginningMs(void *a1, const char *a2, ...)
{
  return _[a1 logBeginningMs];
}

id objc_msgSend_logHead(void *a1, const char *a2, ...)
{
  return _[a1 logHead];
}

id objc_msgSend_logHeadHash(void *a1, const char *a2, ...)
{
  return _[a1 logHeadHash];
}

id objc_msgSend_logMetric_withName_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logMetric:withName:");
}

id objc_msgSend_logResultForEvent_hardFailure_result_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logResultForEvent:hardFailure:result:");
}

id objc_msgSend_logResultForEvent_hardFailure_result_withAttributes_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logResultForEvent:hardFailure:result:withAttributes:");
}

id objc_msgSend_logSize(void *a1, const char *a2, ...)
{
  return _[a1 logSize];
}

id objc_msgSend_logType(void *a1, const char *a2, ...)
{
  return _[a1 logType];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return _[a1 logger];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mapHead(void *a1, const char *a2, ...)
{
  return _[a1 mapHead];
}

id objc_msgSend_mapHeadHash(void *a1, const char *a2, ...)
{
  return _[a1 mapHeadHash];
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return _[a1 mapKeyDataType];
}

id objc_msgSend_mapLeaf(void *a1, const char *a2, ...)
{
  return _[a1 mapLeaf];
}

id objc_msgSend_mapType(void *a1, const char *a2, ...)
{
  return _[a1 mapType];
}

id objc_msgSend_mergeDelimitedFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeDelimitedFromCodedInputStream:extensionRegistry:];
}

id objc_msgSend_mergeFieldFrom_input_(void *a1, const char *a2, ...)
{
  return [a1 mergeFieldFrom:input:];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return [a1 mergeFrom:];
}

id objc_msgSend_mergeFromCodedInputStream_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromCodedInputStream:];
}

id objc_msgSend_mergeFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromCodedInputStream:extensionRegistry:];
}

id objc_msgSend_mergeFromData_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromData:x0 extensionRegistry:x1];
}

id objc_msgSend_mergeUnknownFields_(void *a1, const char *a2, ...)
{
  return [a1 mergeUnknownFields:];
}

id objc_msgSend_mergeVarintField_value_(void *a1, const char *a2, ...)
{
  return [a1 mergeVarintField:value:];
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return _[a1 messageClass];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return _[a1 msgClass];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 mutableCopyWithZone:];
}

id objc_msgSend_mutableFieldForNumber_create_(void *a1, const char *a2, ...)
{
  return [a1 mutableFieldForNumber:x0 create:x1];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nanos(void *a1, const char *a2, ...)
{
  return _[a1 nanos];
}

id objc_msgSend_needReset(void *a1, const char *a2, ...)
{
  return _[a1 needReset];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nodeBytes(void *a1, const char *a2, ...)
{
  return _[a1 nodeBytes];
}

id objc_msgSend_nodePosition(void *a1, const char *a2, ...)
{
  return _[a1 nodePosition];
}

id objc_msgSend_nodeType(void *a1, const char *a2, ...)
{
  return _[a1 nodeType];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _[a1 number];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return _[a1 objcPrefix];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 objectAtColumn:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectMapHead(void *a1, const char *a2, ...)
{
  return _[a1 objectMapHead];
}

id objc_msgSend_oldAppRootCertsArray(void *a1, const char *a2, ...)
{
  return _[a1 oldAppRootCertsArray];
}

id objc_msgSend_oldAppRootCertsArray_Count(void *a1, const char *a2, ...)
{
  return [a1 oldAppRootCertsArray_Count];
}

id objc_msgSend_oldTltRootCertsArray(void *a1, const char *a2, ...)
{
  return _[a1 oldTltRootCertsArray];
}

id objc_msgSend_oldTltRootCertsArray_Count(void *a1, const char *a2, ...)
{
  return [a1 oldTltRootCertsArray_Count];
}

id objc_msgSend_onMocSetMapHead_inclusionResult_inclusionError_(void *a1, const char *a2, ...)
{
  return [a1 onMocSetMapHead:x0 inclusionResult:x1 inclusionError:x2];
}

id objc_msgSend_onMocSetMapHead_mmdResult_mmdError_(void *a1, const char *a2, ...)
{
  return [a1 onMocSetMapHead:mmdResult:mmdError:];
}

id objc_msgSend_onMocSetMapHead_signatureResult_signatureError_(void *a1, const char *a2, ...)
{
  return [a1 onMocSetMapHead:signatureResult:signatureError:];
}

id objc_msgSend_oneofs(void *a1, const char *a2, ...)
{
  return _[a1 oneofs];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_optInServer(void *a1, const char *a2, ...)
{
  return _[a1 optInServer];
}

id objc_msgSend_overrideBeginTime(void *a1, const char *a2, ...)
{
  return _[a1 overrideBeginTime];
}

id objc_msgSend_packWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "packWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return _[a1 package];
}

id objc_msgSend_pamHeadInPatProof(void *a1, const char *a2, ...)
{
  return _[a1 pamHeadInPatProof];
}

id objc_msgSend_parseFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 parseFromData:x0 error:x1];
}

id objc_msgSend_parseMessageSet_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseMessageSet:extensionRegistry:");
}

id objc_msgSend_parseUnknownField_extensionRegistry_tag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseUnknownField:extensionRegistry:tag:");
}

id objc_msgSend_parsedLogHead(void *a1, const char *a2, ...)
{
  return _[a1 parsedLogHead];
}

id objc_msgSend_parsedMapHead(void *a1, const char *a2, ...)
{
  return _[a1 parsedMapHead];
}

id objc_msgSend_patClosedProof(void *a1, const char *a2, ...)
{
  return _[a1 patClosedProof];
}

id objc_msgSend_patConfigProof(void *a1, const char *a2, ...)
{
  return _[a1 patConfigProof];
}

id objc_msgSend_patEarliestVersion(void *a1, const char *a2, ...)
{
  return _[a1 patEarliestVersion];
}

id objc_msgSend_patHead(void *a1, const char *a2, ...)
{
  return _[a1 patHead];
}

id objc_msgSend_patLogBeginningMs(void *a1, const char *a2, ...)
{
  return _[a1 patLogBeginningMs];
}

id objc_msgSend_patSigningKeyWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "patSigningKeyWithError:");
}

id objc_msgSend_pccEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 pccEnvironment];
}

id objc_msgSend_peerIndexAtDepth_leafIndex_(void *a1, const char *a2, ...)
{
  return [a1 peerIndexAtDepth:leafIndex:];
}

id objc_msgSend_perApplicationTreeEntry(void *a1, const char *a2, ...)
{
  return _[a1 perApplicationTreeEntry];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_persistWithError_(void *a1, const char *a2, ...)
{
  return [a1 persistWithError:];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_populating(void *a1, const char *a2, ...)
{
  return _[a1 populating];
}

id objc_msgSend_postFollowup_type_eventId_errorCode_optInState_infoLink_additionalInfo_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:");
}

id objc_msgSend_processConfigBagData_error_(void *a1, const char *a2, ...)
{
  return [a1 processConfigBagData:error];
}

id objc_msgSend_processPamHeadInPatProof_tltEntry_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processPamHeadInPatProof:tltEntry:error:");
}

id objc_msgSend_processPatClosedProof_error_(void *a1, const char *a2, ...)
{
  return [a1 processPatClosedProof:error];
}

id objc_msgSend_processPatConfigProof_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processPatConfigProof:error:");
}

id objc_msgSend_processTltConfigProof_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processTltConfigProof:error:");
}

id objc_msgSend_proofHashesArray(void *a1, const char *a2, ...)
{
  return _[a1 proofHashesArray];
}

id objc_msgSend_proofHashesArray_Count(void *a1, const char *a2, ...)
{
  return [a1 proofHashesArray_Count];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_publicKeyBytes(void *a1, const char *a2, ...)
{
  return _[a1 publicKeyBytes];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:x0 options:x1];
}

id objc_msgSend_rawValueAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rawValueAtIndex:];
}

id objc_msgSend_readConfigFromDisk_(void *a1, const char *a2, ...)
{
  return [a1 readConfigFromDisk:];
}

id objc_msgSend_readDictionaryFromFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return [a1 readDictionaryFromFile:x0 inDirectory:x1 error:x2];
}

id objc_msgSend_readGroup_message_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 readGroup:message:extensionRegistry:];
}

id objc_msgSend_readMapEntry_extensionRegistry_field_parentMessage_(void *a1, const char *a2, ...)
{
  return [a1 readMapEntry:extensionRegistry:field:parentMessage:];
}

id objc_msgSend_readMessage_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 readMessage:x0 extensionRegistry:x1];
}

id objc_msgSend_readUnknownGroup_message_(void *a1, const char *a2, ...)
{
  return [a1 readUnknownGroup:message:];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receiptTime(void *a1, const char *a2, ...)
{
  return _[a1 receiptTime];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return [a1 replaceBytesInRange:withBytes:];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectAtIndex:withObject:];
}

id objc_msgSend_reportCoreDataPersistEventForLocation_underlyingError_(void *a1, const char *a2, ...)
{
  return [a1 reportCoreDataPersistEventForLocation:x0 underlyingError:x1];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:x0 cachePolicy:x1 timeoutInterval:x2];
}

id objc_msgSend_requiredKeys(void *a1, const char *a2, ...)
{
  return _[a1 requiredKeys];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetBytesInRange_(void *a1, const char *a2, ...)
{
  return [a1 resetBytesInRange:];
}

id objc_msgSend_revision(void *a1, const char *a2, ...)
{
  return _[a1 revision];
}

id objc_msgSend_saltMessage_salt_(void *a1, const char *a2, ...)
{
  return [a1 saltMessage:salt:];
}

id objc_msgSend_secKeyAlgorithmForProtoAlgorithm_(void *a1, const char *a2, ...)
{
  return [a1 secKeyAlgorithmForProtoAlgorithm:];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return _[a1 seconds];
}

id objc_msgSend_selectedEnvironmentNameWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 selectedEnvironmentNameWithCompletionHandler:];
}

id objc_msgSend_serializedDataForUnknownValue_forKey_keyDataType_(void *a1, const char *a2, ...)
{
  return [a1 serializedDataForUnknownValue:x0 forKey:x1 keyDataType:x2];
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return _[a1 serializedSize];
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return _[a1 serializedSizeAsMessageSet];
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return _[a1 serializedSizeAsMessageSetExtension];
}

id objc_msgSend_setAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalHeaders:];
}

id objc_msgSend_setAllowOldKeys_(void *a1, const char *a2, ...)
{
  return [a1 setAllowOldKeys:];
}

id objc_msgSend_setAppSmtKeyStore_(void *a1, const char *a2, ...)
{
  return [a1 setAppSmtKeyStore:];
}

id objc_msgSend_setAppSthKeyStore_(void *a1, const char *a2, ...)
{
  return [a1 setAppSthKeyStore:];
}

id objc_msgSend_setApplication_(void *a1, const char *a2, ...)
{
  return [a1 setApplication:];
}

id objc_msgSend_setAtEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setAtEnvironment:];
}

id objc_msgSend_setAuthenticated_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticated:];
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return [a1 setConfig:];
}

id objc_msgSend_setConfigApp_(void *a1, const char *a2, ...)
{
  return [a1 setConfigApp:];
}

id objc_msgSend_setConfigured_(void *a1, const char *a2, ...)
{
  return [a1 setConfigured:];
}

id objc_msgSend_setCurrentEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentEnvironment:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDataStore_(void *a1, const char *a2, ...)
{
  return [a1 setDataStore:];
}

id objc_msgSend_setDb_(void *a1, const char *a2, ...)
{
  return [a1 setDb:];
}

id objc_msgSend_setDirectory_(void *a1, const char *a2, ...)
{
  return [a1 setDirectory:];
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return [a1 setErrorCode:];
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return [a1 setErrorDomain:];
}

id objc_msgSend_setExpirationTime_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationTime:];
}

id objc_msgSend_setExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 setExtension:value:];
}

id objc_msgSend_setFailureEvent_(void *a1, const char *a2, ...)
{
  return [a1 setFailureEvent:];
}

id objc_msgSend_setGossip_(void *a1, const char *a2, ...)
{
  return [a1 setGossip:];
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPBody:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setHttpMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHttpMethod:];
}

id objc_msgSend_setInclusionResult_mapHead_failure_(void *a1, const char *a2, ...)
{
  return [a1 setInclusionResult:mapHead:failure:];
}

id objc_msgSend_setInclusionResult_signedLogHead_error_(void *a1, const char *a2, ...)
{
  return [a1 setInclusionResult:signedLogHead:error:];
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return [a1 setKey:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return [a1 setLog:];
}

id objc_msgSend_setMMDVerifiedForMapHead_mmdError_(void *a1, const char *a2, ...)
{
  return [a1 setMMDVerifiedForMapHead:mmdError:];
}

id objc_msgSend_setMapStillPopulating_(void *a1, const char *a2, ...)
{
  return [a1 setMapStillPopulating:];
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setMetadata:];
}

id objc_msgSend_setMetadataValue_key_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataValue:key:];
}

id objc_msgSend_setNanos_(void *a1, const char *a2, ...)
{
  return [a1 setNanos:];
}

id objc_msgSend_setNeedReset_(void *a1, const char *a2, ...)
{
  return [a1 setNeedReset:];
}

id objc_msgSend_setNeedsRefresh_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsRefresh:];
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return [a1 setObject:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOverrideBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideBeginTime:];
}

id objc_msgSend_setOverrideBeginTimeFromLogEntry_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideBeginTimeFromLogEntry:];
}

id objc_msgSend_setOverrideReversePushConfig_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideReversePushConfig:];
}

id objc_msgSend_setOverrideReversePushPercentage_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideReversePushPercentage:];
}

id objc_msgSend_setPatClosedProof_(void *a1, const char *a2, ...)
{
  return [a1 setPatClosedProof:];
}

id objc_msgSend_setPatConfigProof_(void *a1, const char *a2, ...)
{
  return [a1 setPatConfigProof:];
}

id objc_msgSend_setPatEarliestVersion_(void *a1, const char *a2, ...)
{
  return [a1 setPatEarliestVersion:];
}

id objc_msgSend_setPatLogBeginningMs_(void *a1, const char *a2, ...)
{
  return [a1 setPatLogBeginningMs:];
}

id objc_msgSend_setPccEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setPccEnvironment:];
}

id objc_msgSend_setProtectionToClassDForURL_error_(void *a1, const char *a2, ...)
{
  return [a1 setProtectionToClassDForURL:error:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setReceiptTime_(void *a1, const char *a2, ...)
{
  return [a1 setReceiptTime:];
}

id objc_msgSend_setRequiredKeys_(void *a1, const char *a2, ...)
{
  return [a1 setRequiredKeys:];
}

id objc_msgSend_setResult_treeHead_error_(void *a1, const char *a2, ...)
{
  return [a1 setResult:treeHead:error:];
}

id objc_msgSend_setSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setSeconds:];
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return [a1 setSettings:];
}

id objc_msgSend_setShutDown_(void *a1, const char *a2, ...)
{
  return [a1 setShutDown:];
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return [a1 setSignature:];
}

id objc_msgSend_setSignatureVerifier_(void *a1, const char *a2, ...)
{
  return [a1 setSignatureVerifier:];
}

id objc_msgSend_setSignedObject_(void *a1, const char *a2, ...)
{
  return [a1 setSignedObject:];
}

id objc_msgSend_setSth_(void *a1, const char *a2, ...)
{
  return [a1 setSth:];
}

id objc_msgSend_setSwtSettings_(void *a1, const char *a2, ...)
{
  return [a1 setSwtSettings:];
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setTimeout:];
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutInterval:];
}

id objc_msgSend_setTltConfigProof_(void *a1, const char *a2, ...)
{
  return [a1 setTltConfigProof:];
}

id objc_msgSend_setTltEarliestVersion_(void *a1, const char *a2, ...)
{
  return [a1 setTltEarliestVersion:];
}

id objc_msgSend_setTltKeyStore_(void *a1, const char *a2, ...)
{
  return [a1 setTltKeyStore:];
}

id objc_msgSend_setTltLogBeginningMs_(void *a1, const char *a2, ...)
{
  return [a1 setTltLogBeginningMs:];
}

id objc_msgSend_setTransparencyGPBGenericValue_forTransparencyGPBGenericValueKey_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyGPBGenericValue:forTransparencyGPBGenericValueKey:];
}

id objc_msgSend_setTransparencySettings_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencySettings:];
}

id objc_msgSend_setTreeRollInfoURL_(void *a1, const char *a2, ...)
{
  return [a1 setTreeRollInfoURL:];
}

id objc_msgSend_setTrustedAppSigningKeys_(void *a1, const char *a2, ...)
{
  return [a1 setTrustedAppSigningKeys:];
}

id objc_msgSend_setTrustedKeys_(void *a1, const char *a2, ...)
{
  return [a1 setTrustedKeys:];
}

id objc_msgSend_setTrustedTltSigningKeys_(void *a1, const char *a2, ...)
{
  return [a1 setTrustedTltSigningKeys:];
}

id objc_msgSend_setTypeURL_(void *a1, const char *a2, ...)
{
  return [a1 setTypeURL:];
}

id objc_msgSend_setUnknownFields_(void *a1, const char *a2, ...)
{
  return [a1 setUnknownFields:];
}

id objc_msgSend_setUnsigned_value_(void *a1, const char *a2, ...)
{
  return [a1 setUnsigned:value:];
}

id objc_msgSend_setUnsupported_(void *a1, const char *a2, ...)
{
  return [a1 setUnsupported:];
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return [a1 setUrl:];
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return [a1 setUuid:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forHTTPHeaderField:];
}

id objc_msgSend_setVerificationType_(void *a1, const char *a2, ...)
{
  return [a1 setVerificationType:];
}

id objc_msgSend_setVerifiedSignedMapHead_(void *a1, const char *a2, ...)
{
  return [a1 setVerifiedSignedMapHead:];
}

id objc_msgSend_setVerifier_(void *a1, const char *a2, ...)
{
  return [a1 setVerifier:];
}

id objc_msgSend_setVrfKey_(void *a1, const char *a2, ...)
{
  return [a1 setVrfKey:];
}

id objc_msgSend_setVrfType_(void *a1, const char *a2, ...)
{
  return [a1 setVrfType:];
}

id objc_msgSend_set__verifiedLogHeads_(void *a1, const char *a2, ...)
{
  return [a1 set__verifiedLogHeads:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupContainingMessageClass_(void *a1, const char *a2, ...)
{
  return [a1 setupContainingMessageClass:];
}

id objc_msgSend_setupExtraTextInfo_(void *a1, const char *a2, ...)
{
  return [a1 setupExtraTextInfo:];
}

id objc_msgSend_setupOneofs_count_firstHasIndex_(void *a1, const char *a2, ...)
{
  return [a1 setupOneofs:x0 count:x1 firstHasIndex:x2];
}

id objc_msgSend_shouldSetInternalHeader(void *a1, const char *a2, ...)
{
  return _[a1 shouldSetInternalHeader];
}

id objc_msgSend_shutDown(void *a1, const char *a2, ...)
{
  return _[a1 shutDown];
}

id objc_msgSend_shutdownTimeStamp_(void *a1, const char *a2, ...)
{
  return [a1 shutdownTimeStamp:];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _[a1 signature];
}

id objc_msgSend_signatureDiagnosticsJsonDictionary(void *a1, const char *a2, ...)
{
  return _[a1 signatureDiagnosticsJsonDictionary];
}

id objc_msgSend_signatureVerifier(void *a1, const char *a2, ...)
{
  return _[a1 signatureVerifier];
}

id objc_msgSend_signedObject(void *a1, const char *a2, ...)
{
  return _[a1 signedObject];
}

id objc_msgSend_signedTypeWithObject_(void *a1, const char *a2, ...)
{
  return [a1 signedTypeWithObject:];
}

id objc_msgSend_signedTypeWithObject_verifier_dataStore_(void *a1, const char *a2, ...)
{
  return [a1 signedTypeWithObject:x0 verifier:x1 dataStore:x2];
}

id objc_msgSend_signingKeySpkihash(void *a1, const char *a2, ...)
{
  return _[a1 signingKeySpkihash];
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return _[a1 singletonName];
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return _[a1 singletonNameC];
}

id objc_msgSend_skipField_(void *a1, const char *a2, ...)
{
  return [a1 skipField:];
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return _[a1 skipMessage];
}

id objc_msgSend_slh(void *a1, const char *a2, ...)
{
  return _[a1 slh];
}

id objc_msgSend_smh(void *a1, const char *a2, ...)
{
  return _[a1 smh];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return _[a1 sortedFields];
}

id objc_msgSend_startRevision(void *a1, const char *a2, ...)
{
  return _[a1 startRevision];
}

id objc_msgSend_startSlh(void *a1, const char *a2, ...)
{
  return _[a1 startSlh];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_sth(void *a1, const char *a2, ...)
{
  return _[a1 sth];
}

id objc_msgSend_stmt(void *a1, const char *a2, ...)
{
  return _[a1 stmt];
}

id objc_msgSend_storeSMHSignatureResult_smh_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "storeSMHSignatureResult:smh:error:");
}

id objc_msgSend_storeSignatureResult_signatureError_(void *a1, const char *a2, ...)
{
  return [a1 storeSignatureResult:signatureError:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_swtSettings(void *a1, const char *a2, ...)
{
  return _[a1 swtSettings];
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return _[a1 syntax];
}

id objc_msgSend_textAtColumn_(void *a1, const char *a2, ...)
{
  return [a1 textAtColumn:];
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return _[a1 textFormatName];
}

id objc_msgSend_textFormatNameForValue_(void *a1, const char *a2, ...)
{
  return [a1 textFormatNameForValue:];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestampMs(void *a1, const char *a2, ...)
{
  return _[a1 timestampMs];
}

id objc_msgSend_tltConfigProof(void *a1, const char *a2, ...)
{
  return _[a1 tltConfigProof];
}

id objc_msgSend_tltEarliestVersion(void *a1, const char *a2, ...)
{
  return _[a1 tltEarliestVersion];
}

id objc_msgSend_tltKeyStore(void *a1, const char *a2, ...)
{
  return _[a1 tltKeyStore];
}

id objc_msgSend_tltLeafsArray(void *a1, const char *a2, ...)
{
  return _[a1 tltLeafsArray];
}

id objc_msgSend_tltLeafsArray_Count(void *a1, const char *a2, ...)
{
  return [a1 tltLeafsArray_Count];
}

id objc_msgSend_tltLogBeginningMs(void *a1, const char *a2, ...)
{
  return _[a1 tltLogBeginningMs];
}

id objc_msgSend_topLevelTreeEntry(void *a1, const char *a2, ...)
{
  return _[a1 topLevelTreeEntry];
}

id objc_msgSend_transparencyFilesPath_(void *a1, const char *a2, ...)
{
  return [a1 transparencyFilesPath:];
}

id objc_msgSend_transparencySettings(void *a1, const char *a2, ...)
{
  return _[a1 transparencySettings];
}

id objc_msgSend_transparencyVersionStr(void *a1, const char *a2, ...)
{
  return _[a1 transparencyVersionStr];
}

id objc_msgSend_treeId(void *a1, const char *a2, ...)
{
  return _[a1 treeId];
}

id objc_msgSend_treeRollInfoURL(void *a1, const char *a2, ...)
{
  return _[a1 treeRollInfoURL];
}

id objc_msgSend_triggerConfigBagFetch_(void *a1, const char *a2, ...)
{
  return [a1 triggerConfigBagFetch:];
}

id objc_msgSend_trustedAppLeafs(void *a1, const char *a2, ...)
{
  return _[a1 trustedAppLeafs];
}

id objc_msgSend_trustedAppSigningKeys(void *a1, const char *a2, ...)
{
  return _[a1 trustedAppSigningKeys];
}

id objc_msgSend_trustedIntermediates(void *a1, const char *a2, ...)
{
  return _[a1 trustedIntermediates];
}

id objc_msgSend_trustedKeyStore(void *a1, const char *a2, ...)
{
  return _[a1 trustedKeyStore];
}

id objc_msgSend_trustedKeys(void *a1, const char *a2, ...)
{
  return _[a1 trustedKeys];
}

id objc_msgSend_trustedTltLeafs(void *a1, const char *a2, ...)
{
  return _[a1 trustedTltLeafs];
}

id objc_msgSend_trustedTltSigningKeys(void *a1, const char *a2, ...)
{
  return _[a1 trustedTltSigningKeys];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeURL(void *a1, const char *a2, ...)
{
  return _[a1 typeURL];
}

id objc_msgSend_uiBlockingNetworkTimeout(void *a1, const char *a2, ...)
{
  return _[a1 uiBlockingNetworkTimeout];
}

id objc_msgSend_uintegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 uintegerForKey:];
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return _[a1 unknownFields];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validateConfigBagCertificates_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validateConfigBagCertificates:error:");
}

id objc_msgSend_validateConfigBagEntries_error_(void *a1, const char *a2, ...)
{
  return [a1 validateConfigBagEntries:error];
}

id objc_msgSend_validateConfigBagSignature_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validateConfigBagSignature:error:")];
}

id objc_msgSend_validateConfigEntries_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "validateConfigEntries:error:");
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return _[a1 validationFunc];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 valueAtIndex:];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 valueForHTTPHeaderField:];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return _[a1 varintList];
}

id objc_msgSend_verifier(void *a1, const char *a2, ...)
{
  return _[a1 verifier];
}

id objc_msgSend_verifierOfType_key_(void *a1, const char *a2, ...)
{
  return [a1 verifierOfType:key:];
}

id objc_msgSend_verifyCertificates_intermediates_application_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyCertificates:intermediates:application:error:");
}

id objc_msgSend_verifyCertificates_intermediates_policy_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyCertificates:intermediates:policy:error:");
}

id objc_msgSend_verifyConfigProof_(void *a1, const char *a2, ...)
{
  return [a1 verifyConfigProof:];
}

id objc_msgSend_verifyConfigProof_error_(void *a1, const char *a2, ...)
{
  return [a1 verifyConfigProof:error];
}

id objc_msgSend_verifyConsistencyProof_startHash_startSize_endHash_endSize_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyConsistencyProof:startHash:startSize:endHash:endSize:error:")
}

id objc_msgSend_verifyConsistencyProof_startLogHead_endLogHead_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyConsistencyProof:startLogHead:endLogHead:error:");
}

id objc_msgSend_verifyInclusionOfLogLeaf_position_treeSize_treeHead_hashPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyInclusionOfLogLeaf:position:treeSize:treeHead:hashPath:error:");
}

id objc_msgSend_verifyInclusionOfMapLeaf_position_treeHead_treeId_hashPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyInclusionOfMapLeaf:position:treeHead:treeId:hashPath:error:");
}

id objc_msgSend_verifyLeaf_intermediates_policy_error_(void *a1, const char *a2, ...)
{
  return [a1 verifyLeaf:x0 intermediates:x1 policy:x2 error:x3];
}

id objc_msgSend_verifyLogEntryWithLogLeaf_position_hashesToRoot_signedLogHead_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyLogEntryWithLogLeaf:position:hashesToRoot:signedLogHead:error:");
}

id objc_msgSend_verifyMapEntryWithMapLeaf_hashesToRoot_signedMapHead_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyMapEntryWithMapLeaf:hashesToRoot:signedMapHead:error:");
}

id objc_msgSend_verifyMessage_salt_output_proof_key_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyMessage:salt:output:proof:key:error:");
}

id objc_msgSend_verifyMessage_signature_spkiHash_algorithm_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyMessage:signature:spkiHash:algorithm:error:");
}

id objc_msgSend_verifyMessage_signature_spkiHash_trustedKeys_algorithm_error_(void *a1, const char *a2, ...)
{
  return [a1 verifyMessage:x0 signature:x1 spkiHash:x2 trustedKeys:x3 algorithm:x4 error:x5];
}

id objc_msgSend_verifyPatInclusionProofWithPerAppLogEntry_topLevelTreeEntry_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyPatInclusionProofWithPerAppLogEntry:topLevelTreeEntry:error:");
}

id objc_msgSend_verifyPerApplicationTreeEntry_mapHead_topLevelTreeEntry_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:");
}

id objc_msgSend_verifyTLTEntryForPerApplicationLogHead_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyTLTEntryForPerApplicationLogHead:error:");
}

id objc_msgSend_verifyWithError_(void *a1, const char *a2, ...)
{
  return [a1 verifyWithError:];
}

id objc_msgSend_vrfKey(void *a1, const char *a2, ...)
{
  return _[a1 vrfKey];
}

id objc_msgSend_vrfPublicKey(void *a1, const char *a2, ...)
{
  return _[a1 vrfPublicKey];
}

id objc_msgSend_vrfPublicKeyWithError_(void *a1, const char *a2, ...)
{
  return [a1 vrfPublicKeyWithError:];
}

id objc_msgSend_vrfType(void *a1, const char *a2, ...)
{
  return _[a1 vrfType];
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return _[a1 wireType];
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 write:x0 maxLength:x1];
}

id objc_msgSend_writeBool_value_(void *a1, const char *a2, ...)
{
  return [a1 writeBool:value:];
}

id objc_msgSend_writeBoolNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeBoolNoTag:];
}

id objc_msgSend_writeBytes_value_(void *a1, const char *a2, ...)
{
  return [a1 writeBytes:x0 value:x1];
}

id objc_msgSend_writeBytesArray_values_(void *a1, const char *a2, ...)
{
  return [a1 writeBytesArray:values];
}

id objc_msgSend_writeBytesNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeBytesNoTag:];
}

id objc_msgSend_writeConfigToDisk_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeConfigToDisk:error:");
}

id objc_msgSend_writeDelimitedToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeDelimitedToCodedOutputStream:");
}

id objc_msgSend_writeDictionaryToFile_fileName_inDirectory_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeDictionaryToFile:fileName:inDirectory:error:");
}

id objc_msgSend_writeDouble_value_(void *a1, const char *a2, ...)
{
  return [a1 writeDouble:value:];
}

id objc_msgSend_writeDoubleNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeDoubleNoTag:];
}

id objc_msgSend_writeEnum_value_(void *a1, const char *a2, ...)
{
  return [a1 writeEnum:value:];
}

id objc_msgSend_writeEnumNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeEnumNoTag:];
}

id objc_msgSend_writeExtensionsToCodedOutputStream_range_sortedExtensions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeExtensionsToCodedOutputStream:range:sortedExtensions:");
}

id objc_msgSend_writeField_toCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeField:toCodedOutputStream:");
}

id objc_msgSend_writeFixed32_value_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed32:value:];
}

id objc_msgSend_writeFixed32Array_values_tag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed32Array:values:tag:];
}

id objc_msgSend_writeFixed32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed32NoTag:];
}

id objc_msgSend_writeFixed64_value_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64:value:];
}

id objc_msgSend_writeFixed64Array_values_tag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64Array:x0 values:x1 tag:x2];
}

id objc_msgSend_writeFixed64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64NoTag:];
}

id objc_msgSend_writeFloat_value_(void *a1, const char *a2, ...)
{
  return [a1 writeFloat:value:];
}

id objc_msgSend_writeFloatNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFloatNoTag:];
}

id objc_msgSend_writeGroup_value_(void *a1, const char *a2, ...)
{
  return [a1 writeGroup:value];
}

id objc_msgSend_writeGroupNoTag_value_(void *a1, const char *a2, ...)
{
  return [a1 writeGroupNoTag:value:];
}

id objc_msgSend_writeInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeInt32NoTag:];
}

id objc_msgSend_writeInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeInt64NoTag:];
}

id objc_msgSend_writeMessage_value_(void *a1, const char *a2, ...)
{
  return [a1 writeMessage:value:];
}

id objc_msgSend_writeMessageNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeMessageNoTag:];
}

id objc_msgSend_writeRawMessageSetExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 writeRawMessageSetExtension:x0 value:x1];
}

id objc_msgSend_writeRawVarintSizeTAs32_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeRawVarintSizeTAs32:");
}

id objc_msgSend_writeSFixed32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSFixed32NoTag:];
}

id objc_msgSend_writeSFixed64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSFixed64NoTag:];
}

id objc_msgSend_writeSInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSInt32NoTag:];
}

id objc_msgSend_writeSInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSInt64NoTag:];
}

id objc_msgSend_writeString_value_(void *a1, const char *a2, ...)
{
  return [a1 writeString:value:];
}

id objc_msgSend_writeStringNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeStringNoTag:];
}

id objc_msgSend_writeTag_format_(void *a1, const char *a2, ...)
{
  return [a1 writeTag:format:];
}

id objc_msgSend_writeToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [a1 writeToCodedOutputStream:];
}

id objc_msgSend_writeToOutput_(void *a1, const char *a2, ...)
{
  return [a1 writeToOutput:];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}

id objc_msgSend_writeUInt32_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt32:value:];
}

id objc_msgSend_writeUInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt32NoTag:];
}

id objc_msgSend_writeUInt64_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt64:x0 value:x1];
}

id objc_msgSend_writeUInt64Array_values_tag_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt64Array:values:tag:];
}

id objc_msgSend_writeUInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt64NoTag:];
}

id objc_msgSend_writeUnknownGroup_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUnknownGroup:value:];
}