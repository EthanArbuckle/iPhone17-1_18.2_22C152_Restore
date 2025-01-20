id sub_1000044CC()
{
  objc_class *v0;
  uint64_t v1;
  id (__cdecl *v2)();
  id v3;
  id *v4;
  id result;
  objc_super v6;

  v0 = (objc_class *)type metadata accessor for HomeManagerActor();
  v1 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v1 + 112) = 0;
  *(void *)(v1 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess();
  v2 = (id (__cdecl *)())static HomeManagerActor.homeManagerCreationBlock;
  swift_retain();
  swift_retain();
  v3 = v2();
  swift_release();
  *(void *)(v1 + 128) = v3;
  swift_release();
  v6.receiver = (id)v1;
  v6.super_class = v0;
  v4 = [super init];
  result = [v4[16] setDelegate:v4];
  qword_10004D4E0 = (uint64_t)v4;
  return result;
}

id *sub_1000045A8()
{
  uint64_t v1 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v1 + 112) = 0;
  *(void *)(v1 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess();
  v2 = (id (__cdecl *)())static HomeManagerActor.homeManagerCreationBlock;
  swift_retain();
  swift_retain();
  id v3 = v2();
  swift_release();
  *(void *)(v1 + 128) = v3;
  swift_release();
  v6.receiver = (id)v1;
  v6.super_class = v0;
  v4 = [super init];
  [v4[16] setDelegate:v4];
  return v4;
}

uint64_t (**HomeManagerActor.homeManagerCreationBlock.unsafeMutableAddressor())()
{
  return &static HomeManagerActor.homeManagerCreationBlock;
}

uint64_t (*static HomeManagerActor.homeManagerCreationBlock.getter())()
{
  swift_beginAccess();
  v0 = static HomeManagerActor.homeManagerCreationBlock;
  swift_retain();
  return v0;
}

uint64_t static HomeManagerActor.homeManagerCreationBlock.setter(uint64_t (*a1)(), uint64_t a2)
{
  static HomeManagerActor.homeManagerCreationBlock = a1;
  qword_10004C710 = a2;
  return swift_release();
}

void (*static HomeManagerActor.homeManagerCreationBlock.modify(void *a1))(uint64_t a1, char a2)
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  swift_beginAccess();
  uint64_t v3 = qword_10004C710;
  v2[3] = static HomeManagerActor.homeManagerCreationBlock;
  v2[4] = v3;
  swift_retain();
  return sub_1000047C0;
}

void sub_1000047C0(uint64_t a1, char a2)
{
  v2 = *(void **)a1;
  uint64_t v3 = *(uint64_t (**)())(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    swift_retain();
    sub_1000096C8((uint64_t)v3, v4);
    static HomeManagerActor.homeManagerCreationBlock = v3;
    qword_10004C710 = v4;
    swift_release();
  }
  else
  {
    sub_1000096C8(*(void *)(*(void *)a1 + 24), v4);
    static HomeManagerActor.homeManagerCreationBlock = v3;
    qword_10004C710 = v4;
  }
  swift_release();

  free(v2);
}

id *sub_10000485C()
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess();
  uint64_t v1 = static HomeManagerActor.homeManagerCreationBlock;
  swift_retain();
  uint64_t v2 = swift_retain();
  uint64_t v3 = ((uint64_t (*)(uint64_t))v1)(v2);
  swift_release();
  *(void *)(v0 + 128) = v3;
  swift_release();
  v6.receiver = (id)v0;
  v6.super_class = (Class)type metadata accessor for HomeManagerActor();
  uint64_t v4 = [super init];
  [v4[16] setDelegate:v4];
  return v4;
}

uint64_t variable initialization expression of HomeManagerActor.homeHasUpdatedOnce()
{
  return 0;
}

void *variable initialization expression of HomeManagerActor.blocks()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100004960()
{
  uint64_t v0 = sub_10003F890();
  sub_10000AB4C(v0, qword_10004D4E8);
  sub_10000AB14(v0, (uint64_t)qword_10004D4E8);
  return sub_10003F880();
}

uint64_t HomeManagerActor.deinit()
{
  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t HomeManagerActor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t HomeManagerActor.unownedExecutor.getter()
{
  return v0;
}

uint64_t static HomeManagerActor.homeManager.getter()
{
  return _swift_task_switch(sub_100004A7C, 0, 0);
}

uint64_t sub_100004A7C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v1 = v0;
  v1[1] = sub_100004B70;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_100004B70()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004C6C, 0, 0);
}

uint64_t sub_100004C6C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_100004C84(uint64_t a1)
{
  uint64_t v2 = sub_100009B04(&qword_10004C8F8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  sub_100009B04(&qword_10004C8A8);
  __chkstk_darwin();
  objc_super v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003FCF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v9 + v8, (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_100005268((uint64_t)v6, (uint64_t)&unk_10004C908, v9);
  return swift_release();
}

uint64_t sub_100004E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_100009B04(&qword_10004C8F8);
  v4[7] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[8] = v6;
  v4[9] = *(void *)(v6 + 64);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  return _swift_task_switch(sub_100004F28, 0, 0);
}

uint64_t sub_100004F28()
{
  if (qword_10004C700 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = qword_10004D4E0;
  v0[12] = qword_10004D4E0;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v2, v4, v5);
  v7(v1, v2, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  v0[13] = v9;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v2, v5);
  return _swift_task_switch(sub_10000505C, v6, 0);
}

uint64_t sub_10000505C()
{
  uint64_t v1 = v0[12];
  if (*(unsigned char *)(v1 + 112) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 128);
    v0[5] = v2;
    id v3 = v2;
    sub_10003FCB0();
  }
  else
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_10000AE04;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = (char **)(v1 + 120);
    swift_beginAccess();
    uint64_t v7 = *(char **)(v1 + 120);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v1 + 120) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_1000343B4(0, *((void *)v7 + 2) + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = *((void *)v7 + 2);
    unint64_t v9 = *((void *)v7 + 3);
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_1000343B4((char *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    *((void *)v7 + 2) = v10 + 1;
    uint64_t v11 = &v7[16 * v10];
    *((void *)v11 + 4) = sub_10000AEE8;
    *((void *)v11 + 5) = v5;
    swift_endAccess();
  }
  swift_release();
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_100005220(void *a1)
{
  id v1 = a1;
  sub_100009B04(&qword_10004C8F8);
  return sub_10003FCB0();
}

uint64_t sub_100005268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FCF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10003FCE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000A34C(a1, &qword_10004C8A8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10003FCA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100005418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_100005438, a4, 0);
}

uint64_t sub_100005438()
{
  sub_100005498();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100005498()
{
  if ((*(unsigned char *)(v0 + 112) & 1) == 0)
  {
    uint64_t v1 = v0;
    [*(id *)(v0 + 128) setDelegate:0];
    *(unsigned char *)(v0 + 112) = 1;
    uint64_t v2 = (void *)(v0 + 120);
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 120);
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v14 = v2;
      swift_bridgeObjectRetain_n();
      uint64_t v5 = 0;
      uint64_t v6 = v3 + 40;
      do
      {
        uint64_t v8 = *(void (**)(id *))(v6 - 8);
        uint64_t v9 = qword_10004C718;
        swift_retain_n();
        if (v9 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_10003F890();
        sub_10000AB14(v10, (uint64_t)qword_10004D4E8);
        uint64_t v11 = sub_10003F870();
        os_log_type_t v12 = sub_10003FD50();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = swift_slowAlloc();
          *(_DWORD *)uint64_t v13 = 134217984;
          *(void *)(v13 + 4) = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "catching up on block %ld", (uint8_t *)v13, 0xCu);
          swift_slowDealloc();
        }
        ++v5;

        id v15 = *(id *)(v1 + 128);
        id v7 = v15;
        v8(&v15);
        swift_release_n();

        v6 += 16;
      }
      while (v4 != v5);
      swift_bridgeObjectRelease_n();
      uint64_t v2 = v14;
    }
    void *v2 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
  }
}

id sub_1000056DC()
{
  sub_10000AEA8(0, &qword_10004C918);
  id v0 = [(id)swift_getObjCClassFromMetadata() defaultPrivateConfiguration];
  [v0 setCachePolicy:0];
  [v0 setDiscretionary:0];
  [v0 setAdaptive:1];
  id v1 = [objc_allocWithZone((Class)HMHomeManager) initWithConfiguration:v0];

  return v1;
}

uint64_t static DataModel.sharedAsync(coverages:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_10003F650();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_100009B04(&qword_10004C788);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_10003F1D0();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v5 = sub_10003F730();
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  sub_10003FCD0();
  v2[15] = sub_10003FCC0();
  uint64_t v7 = sub_10003FCA0();
  v2[16] = v7;
  v2[17] = v6;
  return _swift_task_switch(sub_100005978, v7, v6);
}

uint64_t sub_100005978()
{
  uint64_t v1 = v0[2];
  if (!v1)
  {
    sub_10003F6F0();
    if (sub_10003F6E0() == 4)
    {
      sub_100009B04(&qword_10004C7B8);
      uint64_t v2 = sub_10003F710();
      uint64_t v3 = *(void *)(v2 - 8);
      uint64_t v4 = *(void *)(v3 + 72);
      unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1000405A0;
      unint64_t v7 = v6 + v5;
      uint64_t v8 = *(void (**)(unint64_t, void, uint64_t))(v3 + 104);
      v8(v7, enum case for StateSnapshot.Coverage.everythingElse(_:), v2);
      v8(v7 + v4, enum case for StateSnapshot.Coverage.characteristics(_:), v2);
      uint64_t v1 = (uint64_t)sub_100009B90(v6);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
    }
    else
    {
      sub_100009B04(&qword_10004C790);
      sub_100009F88(&qword_10004C798, &qword_10004C790);
      uint64_t v1 = sub_10003FD00();
    }
  }
  v0[18] = v1;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[19] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100005BA0;
  return sub_100006CD4();
}

uint64_t sub_100005BA0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  return _swift_task_switch(sub_100005CC8, v4, v3);
}

uint64_t sub_100005CC8()
{
  uint64_t v1 = (void *)v0[20];
  if (!v1)
  {
    v23 = (void *)swift_task_alloc();
    v0[28] = v23;
    void *v23 = v0;
    v23[1] = sub_100006ADC;
    uint64_t v24 = v0[18];
    return sub_1000070B4(v24);
  }
  id v2 = [v1 sortedHomes];
  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();
  v0[21] = v3;

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003FE10();
    swift_bridgeObjectRelease();
    v0[22] = v4;
    if (v4) {
      goto LABEL_4;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v27 = v0[20];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v28 = (uint64_t (*)(uint64_t))v0[1];
    return v28(v27);
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v0[22] = v4;
  if (!v4) {
    goto LABEL_25;
  }
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
    return StaticHome.home.getter();
  }
  uint64_t v5 = 0;
  while (1)
  {
    v0[23] = v5;
    uint64_t v7 = v0[21];
    id v8 = (v7 & 0xC000000000000001) != 0 ? (id)sub_10003FDE0() : *(id *)(v7 + 8 * v5 + 32);
    uint64_t v9 = v8;
    v0[24] = v8;
    id v10 = [v8 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v11 = sub_10003F6C0();
    if (*(void *)(v11 + 16) && (unint64_t v12 = sub_100008E88(v0[11]), (v13 & 1) != 0))
    {
      (*(void (**)(void, unint64_t, void))(v0[13] + 16))(v0[8], *(void *)(v11 + 56) + *(void *)(v0[13] + 72) * v12, v0[12]);
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = 1;
    }
    uint64_t v15 = v0[12];
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[10];
    uint64_t v18 = v0[11];
    uint64_t v20 = v0[8];
    uint64_t v19 = v0[9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v20, v14, 1, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v20, 1, v15) != 1) {
      break;
    }
    uint64_t v6 = v0[8];

    sub_10000A34C(v6, &qword_10004C788);
LABEL_7:
    uint64_t v5 = v0[23] + 1;
    if (v5 == v0[22]) {
      goto LABEL_25;
    }
  }
  uint64_t v21 = v0[18];
  (*(void (**)(void, void, void))(v0[13] + 32))(v0[14], v0[8], v0[12]);
  uint64_t v22 = sub_10003F720();
  LOBYTE(v21) = sub_100008F98(v22, v21);
  swift_bridgeObjectRelease();
  if (v21)
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);

    goto LABEL_7;
  }
  sub_10003F700();
  v26 = (void *)swift_task_alloc();
  v0[25] = v26;
  void *v26 = v0;
  v26[1] = sub_1000060F4;
  return StaticHome.home.getter();
}

uint64_t sub_1000060F4(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *(void *)(*v1 + 32);
  *(void *)(*v1 + 208) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 136);
  uint64_t v7 = *(void *)(v2 + 128);
  return _swift_task_switch(sub_100006280, v7, v6);
}

uint64_t sub_100006280()
{
  uint64_t v1 = v0[26];
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[27] = v2;
    void *v2 = v0;
    v2[1] = sub_10000664C;
    uint64_t v3 = v0[18];
    uint64_t v4 = v0[7];
    return DataModel.rebuildSnapshot(for:includingMatterSnapshot:coverage:)(v4, v1, 0, v3);
  }
  uint64_t v5 = (void *)v0[24];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);

  uint64_t v6 = v0[23] + 1;
  if (v6 == v0[22])
  {
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v7 = v0[20];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v7);
  }
  while (1)
  {
    v0[23] = v6;
    uint64_t v10 = v0[21];
    id v11 = (v10 & 0xC000000000000001) != 0 ? (id)sub_10003FDE0() : *(id *)(v10 + 8 * v6 + 32);
    unint64_t v12 = v11;
    v0[24] = v11;
    id v13 = [v11 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v14 = sub_10003F6C0();
    if (*(void *)(v14 + 16) && (unint64_t v15 = sub_100008E88(v0[11]), (v16 & 1) != 0))
    {
      (*(void (**)(void, unint64_t, void))(v0[13] + 16))(v0[8], *(void *)(v14 + 56) + *(void *)(v0[13] + 72) * v15, v0[12]);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
    uint64_t v18 = v0[12];
    uint64_t v19 = v0[13];
    uint64_t v20 = v0[10];
    uint64_t v21 = v0[11];
    uint64_t v23 = v0[8];
    uint64_t v22 = v0[9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v23, v17, 1, v18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v23, 1, v18) != 1) {
      break;
    }
    uint64_t v9 = v0[8];

    sub_10000A34C(v9, &qword_10004C788);
LABEL_11:
    uint64_t v6 = v0[23] + 1;
    if (v6 == v0[22]) {
      goto LABEL_6;
    }
  }
  uint64_t v24 = v0[18];
  (*(void (**)(void, void, void))(v0[13] + 32))(v0[14], v0[8], v0[12]);
  uint64_t v25 = sub_10003F720();
  LOBYTE(v24) = sub_100008F98(v25, v24);
  swift_bridgeObjectRelease();
  if (v24)
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);

    goto LABEL_11;
  }
  sub_10003F700();
  v26 = (void *)swift_task_alloc();
  v0[25] = v26;
  void *v26 = v0;
  v26[1] = sub_1000060F4;
  return StaticHome.home.getter();
}

uint64_t sub_10000664C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  sub_10000A34C(v2, &qword_10004C788);
  uint64_t v3 = *(void *)(v1 + 136);
  uint64_t v4 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_100006798, v4, v3);
}

uint64_t sub_100006798()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v0 + 184) + 1;
  if (v5 == *(void *)(v0 + 176))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v6 = *(void *)(v0 + 160);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v7(v6);
  }
  while (1)
  {
    *(void *)(v0 + 184) = v5;
    uint64_t v10 = *(void *)(v0 + 168);
    id v11 = (v10 & 0xC000000000000001) != 0 ? (id)sub_10003FDE0() : *(id *)(v10 + 8 * v5 + 32);
    unint64_t v12 = v11;
    *(void *)(v0 + 192) = v11;
    id v13 = [v11 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v14 = sub_10003F6C0();
    if (*(void *)(v14 + 16) && (unint64_t v15 = sub_100008E88(*(void *)(v0 + 88)), (v16 & 1) != 0))
    {
      (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 104) + 16))(*(void *)(v0 + 64), *(void *)(v14 + 56) + *(void *)(*(void *)(v0 + 104) + 72) * v15, *(void *)(v0 + 96));
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
    uint64_t v18 = *(void *)(v0 + 96);
    uint64_t v19 = *(void *)(v0 + 104);
    uint64_t v20 = *(void *)(v0 + 80);
    uint64_t v21 = *(void *)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 64);
    uint64_t v22 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v23, v17, 1, v18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v23, 1, v18) != 1) {
      break;
    }
    uint64_t v9 = *(void *)(v0 + 64);

    sub_10000A34C(v9, &qword_10004C788);
LABEL_7:
    uint64_t v5 = *(void *)(v0 + 184) + 1;
    if (v5 == *(void *)(v0 + 176)) {
      goto LABEL_2;
    }
  }
  uint64_t v24 = *(void *)(v0 + 144);
  (*(void (**)(void, void, void))(*(void *)(v0 + 104) + 32))(*(void *)(v0 + 112), *(void *)(v0 + 64), *(void *)(v0 + 96));
  uint64_t v25 = sub_10003F720();
  LOBYTE(v24) = sub_100008F98(v25, v24);
  swift_bridgeObjectRelease();
  if (v24)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));

    goto LABEL_7;
  }
  sub_10003F700();
  v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v26;
  void *v26 = v0;
  v26[1] = sub_1000060F4;
  return StaticHome.home.getter();
}

uint64_t sub_100006ADC(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  return _swift_task_switch(sub_100006C28, v4, v3);
}

uint64_t sub_100006C28()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 232);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100006CD4()
{
  v1[3] = v0;
  v1[4] = sub_10003FCD0();
  v1[5] = sub_10003FCC0();
  uint64_t v3 = sub_10003FCA0();
  v1[6] = v3;
  v1[7] = v2;
  return _swift_task_switch(sub_100006D70, v3, v2);
}

uint64_t sub_100006D70()
{
  if (byte_10004D500 == 1 && (uint64_t v1 = sub_10003F6F0(), sub_10003F6E0() == 4))
  {
    uint64_t v2 = v0[3];
    uint64_t v3 = sub_10003FCC0();
    v0[8] = v3;
    uint64_t v4 = swift_task_alloc();
    v0[9] = v4;
    *(void *)(v4 + 16) = v2;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[10] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100006EF0;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, v3, &protocol witness table for MainActor, 0xD00000000000001BLL, 0x8000000100042C60, sub_10000A814, v4, v1);
  }
  else
  {
    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
}

uint64_t sub_100006EF0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return _swift_task_switch(sub_100007050, v3, v2);
}

uint64_t sub_100007050()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000070B4(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  v2[5] = sub_10003FCD0();
  v2[6] = sub_10003FCC0();
  uint64_t v4 = sub_10003FCA0();
  v2[7] = v4;
  v2[8] = v3;
  return _swift_task_switch(sub_100007150, v4, v3);
}

uint64_t sub_100007150()
{
  uint64_t v1 = sub_10003F6F0();
  if (sub_10003F6E0() == 4)
  {
    int8x16_t v7 = *(int8x16_t *)(v0 + 24);
    uint64_t v2 = sub_10003FCC0();
    *(void *)(v0 + 72) = v2;
    uint64_t v3 = (int8x16_t *)swift_task_alloc();
    *(void *)(v0 + 80) = v3;
    v3[1] = vextq_s8(v7, v7, 8uLL);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v4;
    void *v4 = v0;
    v4[1] = sub_100007310;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, v2, &protocol witness table for MainActor, 0xD00000000000001BLL, 0x8000000100042C00, sub_10000A040, v3, v1);
  }
  else
  {
    swift_release();
    if (qword_10004C720 != -1) {
      swift_once();
    }
    uint64_t v8 = *(uint64_t (**)(id))(v0 + 8);
    id v5 = (id)qword_10004C728;
    return v8(v5);
  }
}

uint64_t sub_100007310()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_100007470, v3, v2);
}

uint64_t sub_100007470()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000074D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a2;
  uint64_t v39 = a1;
  uint64_t v45 = sub_100009B04(&qword_10004C8A0);
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v40 = v4;
  v42 = &v34[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100009B04(&qword_10004C8A8);
  __chkstk_darwin(v5 - 8);
  v41 = &v34[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10003F7B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = &v34[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  id v13 = &v34[-v12];
  uint64_t v14 = sub_10003F7D0();
  uint64_t v37 = *(void *)(v14 - 8);
  uint64_t v38 = v14;
  __chkstk_darwin(v14);
  char v16 = &v34[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10003F6F0();
  sub_10003F670();
  sub_10003F7A0();
  uint64_t v17 = sub_10003F7C0();
  int v18 = sub_10003FD70();
  if (sub_10003FD80())
  {
    uint64_t v19 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
    int v35 = v18;
    v19(v11, v13, v7);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = a3;
    uint64_t v21 = v20;
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v22 = sub_10003F790();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, (os_signpost_type_t)v35, v22, "HomeManagerWarmUp", "", v21, 2u);
    a3 = v36;
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {

    uint64_t v19 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16);
  }
  v19(v11, v13, v7);
  sub_10003F810();
  swift_allocObject();
  uint64_t v23 = sub_10003F800();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
  (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v16, v38);
  uint64_t v24 = sub_10003FCF0();
  uint64_t v25 = (uint64_t)v41;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v41, 1, 1, v24);
  uint64_t v27 = v42;
  uint64_t v26 = v43;
  uint64_t v28 = v45;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v43 + 16))(v42, v39, v45);
  sub_10003FCD0();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_10003FCC0();
  unint64_t v30 = (*(unsigned __int8 *)(v26 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v29;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  *(void *)(v31 + 32) = "HomeManagerWarmUp";
  *(void *)(v31 + 40) = 17;
  *(unsigned char *)(v31 + 48) = 2;
  uint64_t v32 = v44;
  *(void *)(v31 + 56) = v23;
  *(void *)(v31 + 64) = v32;
  *(void *)(v31 + 72) = a3;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v26 + 32))(v31 + v30, v27, v28);
  sub_100005268(v25, (uint64_t)&unk_10004C8B8, v31);
  swift_release();
  return swift_release();
}

uint64_t sub_10000799C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = v15;
  *(void *)(v8 + 80) = v16;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(unsigned char *)(v8 + 168) = a6;
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 48) = a5;
  uint64_t v9 = sub_100009B04(&qword_10004C8A0);
  *(void *)(v8 + 88) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 96) = v10;
  *(void *)(v8 + 104) = *(void *)(v10 + 64);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = swift_task_alloc();
  sub_10003FCD0();
  *(void *)(v8 + 128) = sub_10003FCC0();
  uint64_t v12 = sub_10003FCA0();
  *(void *)(v8 + 136) = v12;
  *(void *)(v8 + 144) = v11;
  return _swift_task_switch(sub_100007AC0, v12, v11);
}

uint64_t sub_100007AC0()
{
  if (qword_10004C700 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 72);
  char v14 = *(unsigned char *)(v0 + 168);
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v7 = qword_10004D4E0;
  *(void *)(v0 + 152) = qword_10004D4E0;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  long long v15 = *(_OWORD *)(v0 + 56);
  v8(v1, v4, v5);
  v8(v2, v1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v0 + 160) = v10;
  *(void *)(v10 + 16) = v12;
  *(void *)(v10 + 24) = v13;
  *(unsigned char *)(v10 + 32) = v14;
  *(_OWORD *)(v10 + 40) = v15;
  *(void *)(v10 + 56) = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v1, v5);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  return _swift_task_switch(sub_100007C5C, v7, 0);
}

uint64_t sub_100007C5C()
{
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  if (*(unsigned char *)(v2 + 112) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v7 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v8 = *(const char **)(v0 + 40);
    unint64_t v9 = *(void **)(v2 + 128);
    int v10 = *(unsigned __int8 *)(v0 + 168);
    id v11 = v9;
    sub_100007EC4(v11, v8, v7, v10, v6, v5, v4, v3);
  }
  else
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_10000A570;
    *(void *)(v12 + 24) = v1;
    uint64_t v13 = (char **)(v2 + 120);
    swift_beginAccess();
    char v14 = *(char **)(v2 + 120);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 120) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v14 = sub_1000343B4(0, *((void *)v14 + 2) + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      char v14 = sub_1000343B4((char *)(v16 > 1), v17 + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    int v18 = &v14[16 * v17];
    *((void *)v18 + 4) = sub_10000A5F4;
    *((void *)v18 + 5) = v12;
    swift_endAccess();
  }
  swift_release();
  swift_release();
  uint64_t v19 = *(void *)(v0 + 112);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v21 = *(void *)(v0 + 96);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
  uint64_t v22 = *(void *)(v0 + 136);
  uint64_t v23 = *(void *)(v0 + 144);
  return _swift_task_switch(sub_100007E50, v22, v23);
}

uint64_t sub_100007E50()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007EC4(void *a1, const char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v53 = a1;
  uint64_t v54 = a8;
  uint64_t v52 = a7;
  uint64_t v60 = a6;
  v61 = (char *)a2;
  LODWORD(v51) = a4;
  uint64_t v8 = sub_100009B04(&qword_10004C8A0);
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  __chkstk_darwin(v8);
  uint64_t v55 = v9;
  v57 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009B04(&qword_10004C8A8);
  __chkstk_darwin(v10 - 8);
  v56 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10003F7E0();
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v49 = v12;
  __chkstk_darwin(v12);
  char v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10003F7B0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v50 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v45 - v19;
  uint64_t v21 = sub_10003F7D0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F6F0();
  sub_10003F670();
  uint64_t v25 = sub_10003F7C0();
  sub_10003F7F0();
  int v47 = sub_10003FD60();
  uint64_t result = sub_10003FD80();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v46 = v21;
  if (v51)
  {
    if ((unint64_t)v61 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v61 >> 11 == 27)
      {
LABEL_19:
        __break(1u);
        return result;
      }
      if (v61 >> 16 <= 0x10)
      {
        v61 = &v62;
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v61)
  {
LABEL_10:
    swift_retain();
    sub_10003F820();
    swift_release();
    uint64_t v29 = v48;
    uint64_t v28 = v49;
    if ((*(unsigned int (**)(char *, uint64_t))(v48 + 88))(v14, v49) == enum case for OSSignpostError.doubleEnd(_:))
    {
      unint64_t v30 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v28);
      unint64_t v30 = "";
    }
    v51 = v30;
    uint64_t v27 = v52;
    uint64_t v31 = v50;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v50, v20, v15);
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    os_signpost_id_t v33 = sub_10003F790();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, (os_signpost_type_t)v47, v33, v61, v51, v32, 2u);
    swift_slowDealloc();

    v34 = *(void (**)(char *, uint64_t))(v16 + 8);
    v34(v20, v15);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v46);
    v34(v31, v15);
    goto LABEL_14;
  }
  __break(1u);
LABEL_5:

  (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  uint64_t v27 = v52;
LABEL_14:
  if (qword_10004C720 != -1) {
    swift_once();
  }
  id v35 = v53;
  sub_10003F690();
  uint64_t v36 = sub_10003FCF0();
  uint64_t v37 = (uint64_t)v56;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v56, 1, 1, v36);
  uint64_t v39 = v57;
  uint64_t v38 = v58;
  uint64_t v40 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v54, v59);
  sub_10003FCD0();
  id v41 = v35;
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_10003FCC0();
  unint64_t v43 = (*(unsigned __int8 *)(v38 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  uint64_t v44 = (char *)swift_allocObject();
  *((void *)v44 + 2) = v42;
  *((void *)v44 + 3) = &protocol witness table for MainActor;
  *((void *)v44 + 4) = v60;
  *((void *)v44 + 5) = v41;
  *((void *)v44 + 6) = v27;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v44[v43], v39, v40);
  sub_100005268(v37, (uint64_t)&unk_10004C8D8, (uint64_t)v44);
  return swift_release();
}

uint64_t sub_1000084DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a5;
  sub_10003FCD0();
  v7[6] = sub_10003FCC0();
  uint64_t v9 = sub_10003FCA0();
  v7[7] = v9;
  v7[8] = v8;
  return _swift_task_switch(sub_100008578, v9, v8);
}

uint64_t sub_100008578()
{
  if (qword_10004C720 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100008648;
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  return DataModel.loadUpHomeSnapshots(homeManager:coverages:)(v3, v2);
}

uint64_t sub_100008648()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_100008768, v3, v2);
}

uint64_t sub_100008768()
{
  swift_release();
  byte_10004D500 = 1;
  uint64_t v1 = (void *)qword_10004C728;
  *(void *)(v0 + 16) = qword_10004C728;
  id v2 = v1;
  sub_100009B04(&qword_10004C8A0);
  sub_10003FCB0();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_100008800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009B04(&qword_10004C8A0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  if (qword_10004C720 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10003F680();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    *(void *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
    aBlock[4] = sub_10000A8BC;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008BC0;
    aBlock[3] = &unk_1000497E8;
    uint64_t v11 = _Block_copy(aBlock);
    swift_release();
    id v12 = [v8 _refreshBeforeDate:0 completionHandler:v11];
    swift_unknownObjectRelease();
    _Block_release(v11);
  }
}

uint64_t sub_100008A10()
{
  uint64_t v0 = sub_10003F890();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F6F0();
  sub_10003F6A0();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "homemanager refresh is done", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_10004C720 != -1) {
    swift_once();
  }
  v9[1] = qword_10004C728;
  id v7 = (id)qword_10004C728;
  sub_100009B04(&qword_10004C8A0);
  return sub_10003FCB0();
}

void sub_100008BC0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100008C2C()
{
  sub_10003F6F0();
  uint64_t result = sub_10003F6D0();
  qword_10004C728 = result;
  return result;
}

unint64_t variable initialization expression of HistoricalUsageWidget.kind()
{
  return 0xD000000000000015;
}

unint64_t variable initialization expression of UtilityRateInfoWidget.kind()
{
  return 0xD000000000000015;
}

unint64_t variable initialization expression of EnergyForecastWidget.kind()
{
  return 0xD000000000000014;
}

uint64_t sub_100008CB4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100008D90;
  return v6(a1);
}

uint64_t sub_100008D90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100008E88(uint64_t a1)
{
  sub_10003F1D0();
  sub_100009FF8(&qword_10004C890, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_10003FB80();

  return sub_100009424(a1, v2);
}

unint64_t sub_100008F20(uint64_t a1, uint64_t a2)
{
  sub_10003FE90();
  sub_10003FC40();
  Swift::Int v4 = sub_10003FEA0();

  return sub_1000095E4(a1, a2, v4);
}

uint64_t sub_100008F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003F710();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v37 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v15 = *(void *)(a2 + 56);
  uint64_t v49 = a2 + 56;
  uint64_t v16 = -1 << *(unsigned char *)(a2 + 32);
  uint64_t v40 = ~v16;
  if (-v16 < 64) {
    uint64_t v17 = ~(-1 << -(char)v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v41 = (unint64_t)(63 - v16) >> 6;
  uint64_t v46 = v5 + 32;
  uint64_t v50 = a1 + 56;
  uint64_t v51 = v5 + 16;
  uint64_t v52 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  uint64_t v44 = a2;
  uint64_t v38 = v13;
  uint64_t v39 = v5;
  int64_t v47 = 0;
  unint64_t v48 = v18;
  if (!v18) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v42 = (v18 - 1) & v18;
  int64_t v43 = v20;
  for (unint64_t i = __clz(__rbit64(v18)) | (v20 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    uint64_t v26 = *(void *)(v5 + 72);
    uint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v27(v13, *(void *)(a2 + 48) + v26 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v11, v13, v4);
    uint64_t v28 = *(void *)(a1 + 16);
    uint64_t v45 = (unint64_t)v52 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v29 = v11;
    if (!v28
      || (sub_100009FF8(&qword_10004C880, (void (*)(uint64_t))&type metadata accessor for StateSnapshot.Coverage), uint64_t v30 = sub_10003FB80(), v31 = -1 << *(unsigned char *)(a1 + 32), v32 = v30 & ~v31, ((*(void *)(v50 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0))
    {
      (*v52)(v11, v4);
LABEL_30:
      uint64_t v14 = 0;
      goto LABEL_31;
    }
    uint64_t v33 = a1;
    uint64_t v34 = ~v31;
    while (1)
    {
      v27(v8, *(void *)(v33 + 48) + v32 * v26, v4);
      sub_100009FF8(&qword_10004C888, (void (*)(uint64_t))&type metadata accessor for StateSnapshot.Coverage);
      char v35 = sub_10003FB90();
      uint64_t v36 = *v52;
      (*v52)(v8, v4);
      if (v35) {
        break;
      }
      unint64_t v32 = (v32 + 1) & v34;
      if (((*(void *)(v50 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
      {
        v36(v29, v4);
        goto LABEL_30;
      }
    }
    uint64_t v11 = v29;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v36)(v29, v4);
    unint64_t v18 = v42;
    int64_t v20 = v43;
    a2 = v44;
    a1 = v33;
    uint64_t v13 = v38;
    uint64_t v5 = v39;
    int64_t v47 = v43;
    unint64_t v48 = v42;
    if (v42) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v22 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v22 >= v41) {
      goto LABEL_34;
    }
    unint64_t v23 = *(void *)(v49 + 8 * v22);
    int64_t v24 = v20 + 1;
    if (!v23)
    {
      int64_t v24 = v20 + 2;
      if (v20 + 2 >= v41) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v49 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v20 + 3;
        if (v20 + 3 >= v41) {
          goto LABEL_34;
        }
        unint64_t v23 = *(void *)(v49 + 8 * v24);
        if (!v23) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v42 = (v23 - 1) & v23;
    int64_t v43 = v24;
  }
  uint64_t v25 = v20 + 4;
  if (v20 + 4 >= v41)
  {
LABEL_34:
    uint64_t v14 = 1;
LABEL_31:
    sub_100009FF0();
    return v14;
  }
  unint64_t v23 = *(void *)(v49 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v20 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v41) {
      goto LABEL_34;
    }
    unint64_t v23 = *(void *)(v49 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_21;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_100009424(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_10003F1D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
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
      sub_100009FF8(&qword_10004C898, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_10003FB90();
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

unint64_t sub_1000095E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10003FE70() & 1) == 0)
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
      while (!v14 && (sub_10003FE70() & 1) == 0);
    }
  }
  return v6;
}

void sub_1000096C8(uint64_t a1, uint64_t a2)
{
  if (qword_10004C718 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10003F890();
  sub_10000AB14(v4, (uint64_t)qword_10004D4E8);
  swift_retain_n();
  uint64_t v5 = sub_10003F870();
  os_log_type_t v6 = sub_10003FD50();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    swift_retain();
    sub_100009B04(&qword_10004C910);
    uint64_t v9 = sub_10003FC30();
    sub_100016708(v9, v10, &v11);
    sub_10003FD90();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

uint64_t _s26HomeEnergyWidgetsExtension0A12ManagerActorC04homeE14DidUpdateHomesyySo06HMHomeE0CF_0()
{
  uint64_t v1 = v0;
  sub_100009B04(&qword_10004C8A8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003FCF0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  os_log_type_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_10000A34C((uint64_t)v3, &qword_10004C8A8);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_10003FCE0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_10003FCA0();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_10004C8E8;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100009B04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009B48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_100009B90(uint64_t a1)
{
  uint64_t v2 = sub_10003F710();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100009B04(&qword_10004C878);
    uint64_t v9 = sub_10003FDB0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    char v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    char v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100009FF8(&qword_10004C880, (void (*)(uint64_t))&type metadata accessor for StateSnapshot.Coverage);
      uint64_t v16 = sub_10003FB80();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_100009FF8(&qword_10004C888, (void (*)(uint64_t))&type metadata accessor for StateSnapshot.Coverage);
          char v23 = sub_10003FB90();
          int64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_100009EA8(long long *a1)
{
  long long v2 = *a1;
  if (sub_10003EA14(2, 17, 0, 0)) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_100009F1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_10003EA14(2, 17, 0, 0)) {
    return swift_getOpaqueTypeConformance2();
  }
  return v1;
}

uint64_t sub_100009F88(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009B48(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for HomeManagerActor()
{
  return self;
}

uint64_t sub_100009FF0()
{
  return swift_release();
}

uint64_t sub_100009FF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000A040(uint64_t a1)
{
  return sub_1000074D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000A048()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000A128(uint64_t a1)
{
  sub_100009B04(&qword_10004C8A0);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v8 = *(void *)(v1 + 64);
  char v9 = *(unsigned char *)(v1 + 48);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000A258;
  return sub_10000799C(a1, v3, v4, v5, v6, v9, v7, v8);
}

uint64_t sub_10000A258()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A34C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100009B04(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A3A8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A3E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10004C8C0 + dword_10004C8C0);
  return v6(a1, v4);
}

uint64_t sub_10000A498()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000A570(void *a1)
{
  uint64_t v3 = *(void *)(sub_100009B04(&qword_10004C8A0) - 8);
  uint64_t v4 = *(const char **)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  int v10 = *(unsigned __int8 *)(v1 + 32);

  return sub_100007EC4(a1, v4, v5, v10, v6, v7, v8, v9);
}

uint64_t sub_10000A5F4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_10000A620()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000A700(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100009B04(&qword_10004C8A0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000AEE4;
  return sub_1000084DC(a1, v5, v6, v7, v8, v9, v10);
}

void sub_10000A814(uint64_t a1)
{
  sub_100008800(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000A81C()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000A8BC()
{
  sub_100009B04(&qword_10004C8A0);

  return sub_100008A10();
}

uint64_t sub_10000A95C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A96C()
{
  return swift_release();
}

uint64_t sub_10000A974()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A9B4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000AEE4;
  v3[2] = v2;
  return _swift_task_switch(sub_100005438, v2, 0);
}

uint64_t sub_10000AA5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A258;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10004C8C0 + dword_10004C8C0);
  return v6(a1, v4);
}

uint64_t sub_10000AB14(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000AB4C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000ABB0()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000AC80(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100009B04(&qword_10004C8F8) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000AEE4;
  return sub_100004E4C(a1, v5, v6, v7);
}

uint64_t sub_10000AD70()
{
  uint64_t v1 = sub_100009B04(&qword_10004C8F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000AE04(void *a1)
{
  sub_100009B04(&qword_10004C8F8);

  return sub_100005220(a1);
}

uint64_t sub_10000AE78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_10000AEA8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000AEFC()
{
  return sub_1000127F8(&qword_10004C980, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t type metadata accessor for ForecastLocationEntity()
{
  uint64_t result = qword_10004CAA8;
  if (!qword_10004CAA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000AF90()
{
  return sub_1000127F8(&qword_10004C988, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000AFD8()
{
  return sub_1000127F8(&qword_10004C990, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

unint64_t sub_10000B024()
{
  unint64_t result = qword_10004C998;
  if (!qword_10004C998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C998);
  }
  return result;
}

void *sub_10000B078()
{
  return &protocol witness table for UUID;
}

uint64_t sub_10000B084@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v2 = sub_10003F0C0();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  __chkstk_darwin(v2);
  uint64_t v42 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F1F0();
  __chkstk_darwin(v4 - 8);
  uint64_t v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003FBF0();
  __chkstk_darwin(v6 - 8);
  char v35 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009B04(&qword_10004CB58);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v39 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v38 = (char *)&v32 - v12;
  __chkstk_darwin(v11);
  uint64_t v36 = (char *)&v32 - v13;
  uint64_t v14 = sub_100009B04(&qword_10004CAF8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v34 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v33 = (char *)&v32 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v32 - v19;
  uint64_t v43 = sub_10003F0E0();
  uint64_t v21 = *(void *)(v43 - 8);
  uint64_t v22 = __chkstk_darwin(v43);
  uint64_t v23 = __chkstk_darwin(v22);
  __chkstk_darwin(v23);
  uint64_t v24 = sub_10003FBE0();
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  __chkstk_darwin(v25);
  uint64_t v26 = type metadata accessor for ForecastLocationEntity();
  if (*(unsigned char *)(v1 + *(int *)(v26 + 28) + 16))
  {
    if (*(unsigned char *)(v1 + *(int *)(v26 + 28) + 16) == 1)
    {
      sub_10003FBD0();
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_10003FBC0(v46);
      sub_10003EF80();
      sub_10003FBB0(v45);
      swift_bridgeObjectRelease();
      v47._countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      sub_10003FBC0(v47);
      sub_10003F0D0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v33, 1, 1, v43);
      uint64_t v27 = v38;
    }
    else
    {
      sub_10003FBA0();
      sub_10003F1E0();
      (*(void (**)(char *, void, uint64_t))(v40 + 104))(v42, enum case for LocalizedStringResource.BundleDescription.main(_:), v41);
      sub_10003F0F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v34, 1, 1, v43);
      uint64_t v27 = v39;
    }
    sub_10003EFE0();
    uint64_t v28 = sub_10003EFF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
  }
  else
  {
    sub_10003FBD0();
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    sub_10003FBC0(v48);
    sub_10003EF80();
    sub_10003FBB0(v45);
    swift_bridgeObjectRelease();
    v49._countAndFlagsBits = 0;
    v49._object = (void *)0xE000000000000000;
    sub_10003FBC0(v49);
    sub_10003F0D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v20, 1, 1, v43);
    uint64_t v29 = v36;
    sub_10003EFE0();
    uint64_t v30 = sub_10003EFF0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  }
  return sub_10003F000();
}

uint64_t sub_10000B760()
{
  uint64_t v0 = sub_100009B04(&qword_10004CAF8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10003F0C0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003F1F0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10003FBF0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10003F0E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10003F060();
  sub_10000AB4C(v10, qword_10004D508);
  sub_10000AB14(v10, (uint64_t)qword_10004D508);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10003F0F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10003F050();
}

uint64_t sub_10000BA48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10003F890();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003F0E0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for ForecastLocationEntity();
  uint64_t v8 = *(int *)(v7 + 24);
  sub_100009B04(&qword_10004CB28);
  sub_10003F0B0();
  *(void *)(a1 + v8) = sub_10003EFA0();
  sub_10003F840();
  uint64_t v9 = sub_10003F870();
  os_log_type_t v10 = sub_10003FD50();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v8;
    v21[0] = v12;
    uint64_t v18 = v2;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v20 = sub_100016708(0x292874696E69, 0xE600000000000000, v21);
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "ForecastLocationEntity:%s creating a Current Location entity.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_10003F1C0();
  if (qword_10004C738 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10003F1D0();
  uint64_t v14 = sub_10000AB14(v13, (uint64_t)qword_10004D520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(a1, v14, v13);
  uint64_t v15 = a1 + *(int *)(v7 + 28);
  *(void *)uint64_t v15 = 0;
  *(void *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 16) = 2;
  v21[0] = 0xD000000000000010;
  v21[1] = 0x8000000100042E80;
  return sub_10003EF90();
}

uint64_t sub_10000BD9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v7 = sub_10003F1D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v10 = &v34[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10003F890();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_10003F0E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v39 = type metadata accessor for ForecastLocationEntity();
  uint64_t v15 = *(int *)(v39 + 24);
  sub_100009B04(&qword_10004CB28);
  sub_10003F0B0();
  uint64_t v16 = sub_10003EFA0();
  uint64_t v43 = a4;
  uint64_t v40 = v15;
  *(void *)(a4 + v15) = v16;
  sub_10003F840();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v44 = v7;
  uint64_t v38 = v17;
  v17((uint64_t)v10, a1, v7);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_10003F870();
  os_log_type_t v19 = sub_10003FD50();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v37 = a1;
    uint64_t v22 = v21;
    uint64_t v36 = swift_slowAlloc();
    v47[0] = v36;
    *(_DWORD *)uint64_t v22 = 136315650;
    int v35 = v20;
    uint64_t v46 = sub_100016708(0xD000000000000016, 0x8000000100042E60, v47);
    sub_10003FD90();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100016708(v45, a3, v47);
    sub_10003FD90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    uint64_t v23 = sub_10003F190();
    uint64_t v46 = sub_100016708(v23, v24, v47);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    uint64_t v26 = v10;
    uint64_t v27 = v44;
    v25((uint64_t)v26, v44);
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v35, "ForecastLocationEntity:%s creating a HMHome entity: %s : %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v37;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    uint64_t v28 = v10;
    uint64_t v27 = v44;
    v25((uint64_t)v28, v44);
  }

  (*(void (**)(unsigned char *, uint64_t))(v41 + 8))(v13, v42);
  uint64_t v29 = v39;
  uint64_t v30 = v43;
  sub_10003F1C0();
  v38(v30, a1, v27);
  uint64_t v31 = v30 + *(int *)(v29 + 28);
  uint64_t v32 = v45;
  *(void *)uint64_t v31 = v45;
  *(void *)(v31 + 8) = a3;
  *(unsigned char *)(v31 + 16) = 0;
  v47[0] = v32;
  v47[1] = a3;
  swift_bridgeObjectRetain();
  sub_10003EF90();
  return v25(a1, v27);
}

unint64_t sub_10000C220()
{
  uint64_t v1 = type metadata accessor for ForecastLocationEntity();
  if (*(unsigned char *)(v0 + *(int *)(v1 + 28) + 16))
  {
    if (*(unsigned char *)(v0 + *(int *)(v1 + 28) + 16) != 1)
    {
      unint64_t v5 = 0xD000000000000010;
      goto LABEL_7;
    }
    sub_10003FDC0(26);
    swift_bridgeObjectRelease();
    unint64_t v2 = 0xD000000000000018;
  }
  else
  {
    unint64_t v2 = 0x746E4520656D6F48;
  }
  unint64_t v5 = v2;
  sub_10003EF80();
  sub_10003FC50(v4);
  swift_bridgeObjectRelease();
LABEL_7:
  sub_10003F1D0();
  sub_1000127F8(&qword_10004CB08, (void (*)(uint64_t))&type metadata accessor for UUID);
  v6._countAndFlagsBits = sub_10003FE50();
  sub_10003FC50(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x4449677562656420;
  v7._object = (void *)0xEA0000000000203ALL;
  sub_10003FC50(v7);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000C3C8()
{
  uint64_t v0 = sub_100009B04(&qword_10004CB30);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10003F1D0();
  sub_10000AB4C(v3, qword_10004D520);
  uint64_t v4 = sub_10000AB14(v3, (uint64_t)qword_10004D520);
  sub_10003F180();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C4F8(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 72) = a2;
  *(void *)(v3 + 80) = a3;
  *(unsigned char *)(v3 + 184) = a1;
  sub_100009B04(&qword_10004CAF0);
  *(void *)(v3 + 88) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ForecastLocationEntity();
  *(void *)(v3 + 96) = v4;
  *(void *)(v3 + 104) = *(void *)(v4 - 8);
  *(void *)(v3 + 112) = swift_task_alloc();
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  uint64_t v5 = sub_10003F890();
  *(void *)(v3 + 136) = v5;
  *(void *)(v3 + 144) = *(void *)(v5 - 8);
  *(void *)(v3 + 152) = swift_task_alloc();
  *(void *)(v3 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_10000C674, 0, 0);
}

uint64_t sub_10000C674()
{
  uint64_t v22 = v0;
  uint64_t v1 = v0;
  v0[2] = &_swiftEmptyArrayStorage;
  id v2 = [self sharedAuthorization];
  unsigned int v3 = [v2 isAuthorized];

  sub_10003F840();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v18 = v0[18];
    uint64_t v19 = v0[17];
    uint64_t v20 = v0[20];
    unint64_t v6 = v0[10];
    uint64_t v17 = v0[9];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315650;
    v0[6] = sub_100016708(0xD000000000000026, 0x8000000100042F90, &v21);
    sub_10003FD90();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_100016708(v17, v6, &v21);
    sub_10003FD90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 22) = 2080;
    if (v3) {
      uint64_t v8 = 21321;
    }
    else {
      uint64_t v8 = 0x544F4E207369;
    }
    if (v3) {
      unint64_t v9 = 0xE200000000000000;
    }
    else {
      unint64_t v9 = 0xE600000000000000;
    }
    v0[8] = sub_100016708(v8, v9, &v21);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s from %s: HMFLocationAuthorization %s authorized", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v10(v20, v19);
  }
  else
  {
    uint64_t v11 = v0[20];
    uint64_t v12 = v1[17];
    uint64_t v13 = v1[18];
    swift_bridgeObjectRelease_n();

    os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v10(v11, v12);
  }
  v1[21] = v10;
  uint64_t v14 = (void *)swift_task_alloc();
  v1[22] = v14;
  uint64_t v15 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v14 = v1;
  v14[1] = sub_10000CA00;
  return withCheckedContinuation<A>(isolation:function:_:)(v1 + 3, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v15);
}

uint64_t sub_10000CA00()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000CAFC, 0, 0);
}

uint64_t sub_10000CAFC()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  uint64_t v3 = sub_10003FC80();

  sub_10003F840();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_10003F870();
  LOBYTE(v5) = sub_10003FD50();
  unint64_t v6 = (unint64_t)v3 >> 62;
  if (!os_log_type_enabled(v4, (os_log_type_t)v5))
  {
    os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    uint64_t v7 = *(void *)(v0 + 152);
    uint64_t v5 = *(void *)(v0 + 136);
    swift_bridgeObjectRelease_n();

    v10(v7, v5);
    goto LABEL_6;
  }
  uint64_t v7 = swift_slowAlloc();
  v38[0] = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v7 = 136315394;
  *(void *)(v0 + 32) = sub_100016708(0xD000000000000026, 0x8000000100042F90, (uint64_t *)v38);
  sub_10003FD90();
  *(_WORD *)(v7 + 12) = 2048;
  if (v6) {
    goto LABEL_34;
  }
  uint64_t v8 = v3;
  uint64_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v34 = *(void *)(v0 + 152);
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    uint64_t v33 = *(void *)(v0 + 136);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = v9;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, (os_log_type_t)v5, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v36(v34, v33);
    uint64_t v3 = v8;
LABEL_6:
    if (v6)
    {
      if (v3 < 0) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = (v3 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10003FE10();
      if (!v11)
      {
LABEL_25:
        uint64_t v13 = &_swiftEmptyArrayStorage;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v11) {
        goto LABEL_25;
      }
    }
    if (v11 >= 1) {
      break;
    }
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v8 = v3;
    uint64_t v9 = sub_10003FE10();
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = 0;
  uint64_t v35 = *(void *)(v0 + 104);
  unint64_t v37 = v3 & 0xC000000000000001;
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t v14 = v3;
  do
  {
    if (v37) {
      id v15 = (id)sub_10003FDE0();
    }
    else {
      id v15 = *(id *)(v3 + 8 * v12 + 32);
    }
    uint64_t v16 = v15;
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 96);
    char v19 = *(unsigned char *)(v0 + 184);
    v38[0] = v15;
    sub_10000D038(v38, v19, v18);

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v18, 1, v17) == 1)
    {
      sub_10000A34C(*(void *)(v0 + 88), &qword_10004CAF0);
      uint64_t v3 = v14;
    }
    else
    {
      uint64_t v21 = *(void *)(v0 + 112);
      uint64_t v20 = *(void *)(v0 + 120);
      sub_100012840(*(void *)(v0 + 88), v20);
      sub_100012840(v20, v21);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v13 = (void *)sub_1000344C4(0, v13[2] + 1, 1, (unint64_t)v13);
      }
      uint64_t v3 = v14;
      unint64_t v23 = v13[2];
      unint64_t v22 = v13[3];
      if (v23 >= v22 >> 1) {
        uint64_t v13 = (void *)sub_1000344C4(v22 > 1, v23 + 1, 1, (unint64_t)v13);
      }
      uint64_t v24 = *(void *)(v0 + 112);
      v13[2] = v23 + 1;
      sub_100012840(v24, (uint64_t)v13+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v23);
    }
    ++v12;
  }
  while (v11 != v12);
LABEL_26:
  uint64_t v25 = *(void *)(v0 + 128);
  swift_bridgeObjectRelease_n();
  sub_100021C44((uint64_t)v13);
  sub_10000BA48(v25);
  unint64_t v26 = *(void *)(v0 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v26 = sub_1000344C4(0, *(void *)(v26 + 16) + 1, 1, v26);
  }
  unint64_t v28 = *(void *)(v26 + 16);
  unint64_t v27 = *(void *)(v26 + 24);
  if (v28 >= v27 >> 1) {
    unint64_t v26 = sub_1000344C4(v27 > 1, v28 + 1, 1, v26);
  }
  uint64_t v29 = *(void *)(v0 + 128);
  uint64_t v30 = *(void *)(v0 + 104);
  *(void *)(v26 + 16) = v28 + 1;
  sub_100012840(v29, v26+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v28);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v31(v26);
}

uint64_t sub_10000D038@<X0>(void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_10003F1D0();
  __chkstk_darwin(v7 - 8);
  uint64_t v55 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003F890();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v49 - v14;
  uint64_t v16 = *a1;
  id v17 = [v16 location];

  if (v17 || (a2 & 1) == 0)
  {
    sub_10003F840();
    id v28 = v16;
    uint64_t v29 = sub_10003F870();
    os_log_type_t v30 = sub_10003FD50();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      LODWORD(v50) = v31;
      uint64_t v33 = v32;
      uint64_t v51 = swift_slowAlloc();
      v57 = (char *)v51;
      *(_DWORD *)uint64_t v33 = 136315394;
      uint64_t v53 = v9;
      uint64_t v56 = sub_100016708(0xD000000000000026, 0x8000000100042F90, (uint64_t *)&v57);
      uint64_t v52 = v3;
      sub_10003FD90();
      *(_WORD *)(v33 + 12) = 2080;
      id v34 = [v28 name:v33 + 14];
      uint64_t v35 = sub_10003FC10();
      uint64_t v54 = a3;
      unint64_t v37 = v36;

      uint64_t v56 = sub_100016708(v35, v37, (uint64_t *)&v57);
      sub_10003FD90();

      a3 = v54;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v50, "%s Creating entity for home '%s' with known location.", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v38 = &HomeManagerActor;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v53);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      uint64_t v38 = &HomeManagerActor;
    }
    id v39 = [v28 uniqueIdentifier];
    uint64_t v40 = (uint64_t)v55;
    sub_10003F1B0();

    id v41 = [v28 (SEL)v38[186].count];
    uint64_t v42 = sub_10003FC10();
    unint64_t v44 = v43;

    sub_10000BD9C(v40, v42, v44, a3);
    uint64_t v45 = type metadata accessor for ForecastLocationEntity();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(a3, 0, 1, v45);
  }
  else
  {
    uint64_t v54 = a3;
    sub_10003F840();
    id v18 = v16;
    char v19 = sub_10003F870();
    os_log_type_t v20 = sub_10003FD50();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v55 = (char *)swift_slowAlloc();
      v57 = v55;
      *(_DWORD *)uint64_t v22 = 136315394;
      LODWORD(v52) = v21;
      uint64_t v56 = sub_100016708(0xD000000000000026, 0x8000000100042F90, (uint64_t *)&v57);
      uint64_t v53 = v9;
      sub_10003FD90();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v50 = v22 + 14;
      id v23 = [v18 name];
      uint64_t v24 = sub_10003FC10();
      uint64_t v51 = v10;
      uint64_t v25 = v24;
      unint64_t v27 = v26;

      uint64_t v56 = sub_100016708(v25, v27, (uint64_t *)&v57);
      sub_10003FD90();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v52, "%s No location found for home '%s', skipping", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v53);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    uint64_t v47 = v54;
    uint64_t v48 = type metadata accessor for ForecastLocationEntity();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 1, 1, v48);
  }
}

uint64_t sub_10000D63C(uint64_t a1)
{
  v1[7] = a1;
  sub_10003F1D0();
  v1[8] = swift_task_alloc();
  uint64_t v2 = sub_10003F890();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_10004CB20 + dword_10004CB20);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[14] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000D784;
  return v5();
}

uint64_t sub_10000D784(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000D884, 0, 0);
}

uint64_t sub_10000D884()
{
  uint64_t v50 = v0;
  uint64_t v1 = (void *)v0[15];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v2 location];

    if (v3) {
      unint64_t v4 = 0xEE002E6E6F697461;
    }
    else {
      unint64_t v4 = 0x8000000100042E20;
    }
    sub_10003F840();
    id v5 = v2;
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10003F870();
    os_log_type_t type = sub_10003FD50();
    BOOL v7 = os_log_type_enabled(v6, type);
    uint64_t v8 = v0[13];
    uint64_t v9 = &HomeManagerActor;
    uint64_t v11 = v0[9];
    uint64_t v10 = v0[10];
    if (v7)
    {
      unint64_t v12 = 0xD000000000000031;
      if (v3) {
        unint64_t v12 = 0x636F6C20444F4F47;
      }
      uint64_t v44 = v12;
      uint64_t v13 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315650;
      v0[4] = sub_100016708(0xD000000000000012, 0x8000000100042E00, &v49);
      sub_10003FD90();
      *(_WORD *)(v13 + 12) = 2080;
      id v14 = [v5 name];
      uint64_t v43 = v11;
      uint64_t v15 = sub_10003FC10();
      unint64_t v17 = v16;

      v0[5] = sub_100016708(v15, v17, &v49);
      sub_10003FD90();
      uint64_t v9 = &HomeManagerActor;
      swift_bridgeObjectRelease();

      *(_WORD *)(v13 + 22) = 2080;
      swift_bridgeObjectRetain();
      v0[6] = sub_100016708(v44, v4, &v49);
      sub_10003FD90();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v6, type, "%s returning default entity for current home '%s' with %s", (uint8_t *)v13, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v43);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v11);
    }
    uint64_t v27 = v0[7];
    uint64_t v26 = v0[8];
    id v28 = [v5 uniqueIdentifier];
    sub_10003F1B0();

    id v29 = [v5 (SEL)v9[186].count];
    uint64_t v30 = sub_10003FC10();
    unint64_t v32 = v31;

    sub_10000BD9C(v26, v30, v32, v27);
  }
  else
  {
    sub_10003F840();
    id v18 = sub_10003F870();
    os_log_type_t v19 = sub_10003FD50();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v21 = v0[12];
    uint64_t v23 = v0[9];
    uint64_t v22 = v0[10];
    if (v20)
    {
      uint64_t v45 = v0[9];
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      v0[3] = sub_100016708(0xD000000000000012, 0x8000000100042E00, &v49);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s no current home found.", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v25(v21, v45);
    }
    else
    {

      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v25(v21, v23);
    }
    sub_10003F840();
    uint64_t v33 = sub_10003F870();
    os_log_type_t v34 = sub_10003FD50();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = v0[11];
    uint64_t v37 = v0[9];
    if (v35)
    {
      uint64_t v47 = v0[11];
      uint64_t v46 = v0[9];
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 136315138;
      v0[2] = sub_100016708(0xD000000000000012, 0x8000000100042E00, &v49);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s returning default entity (Current Location)", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v40 = v46;
      uint64_t v39 = v47;
    }
    else
    {

      uint64_t v39 = v36;
      uint64_t v40 = v37;
    }
    v25(v39, v40);
    sub_10000BA48(v0[7]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v41 = (uint64_t (*)(void))v0[1];
  return v41();
}

uint64_t sub_10000DEDC()
{
  return sub_1000127F8(&qword_10004C890, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_10000DF24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10003F1D0();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000DF90()
{
  return sub_1000127F8(&qword_10004C9A0, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000DFD8()
{
  return sub_1000127F8(&qword_10004C9A8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000E020()
{
  return sub_1000127F8(&qword_10004C9B0, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000E068()
{
  return sub_1000127F8(&qword_10004C9B8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000E0B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F5C8(&qword_10004C730, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10004D508, a1);
}

uint64_t sub_10000E0EC()
{
  return sub_100009F88(&qword_10004C9C0, &qword_10004C9C8);
}

uint64_t sub_10000E128(uint64_t a1)
{
  uint64_t v2 = sub_1000127F8(qword_10004C9E8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000E1A4()
{
  return sub_1000127F8(&qword_10004C9D0, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000E1F0(uint64_t a1)
{
  uint64_t v2 = sub_1000127F8(&qword_10004C9B8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000E270()
{
  unint64_t result = qword_10004C9D8;
  if (!qword_10004C9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C9D8);
  }
  return result;
}

unint64_t sub_10000E2C8()
{
  unint64_t result = qword_10004C9E0;
  if (!qword_10004C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C9E0);
  }
  return result;
}

uint64_t sub_10000E31C()
{
  return sub_1000127F8(qword_10004C9E8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
}

uint64_t sub_10000E364(uint64_t a1)
{
  v1[4] = a1;
  sub_100009B04(&qword_10004CAF8);
  v1[5] = swift_task_alloc();
  uint64_t v2 = sub_10003F890();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[9] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000E49C;
  return sub_10000C4F8(1, 0xD000000000000019, 0x8000000100042F30);
}

uint64_t sub_10000E49C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000E59C, 0, 0);
}

uint64_t sub_10000E59C()
{
  unint64_t v16 = v0;
  uint64_t v1 = *(void *)(v0[10] + 16);
  swift_bridgeObjectRelease();
  sub_10003F840();
  uint64_t v2 = sub_10003F870();
  os_log_type_t v3 = sub_10003FD50();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[7];
    uint64_t v14 = v0[8];
    uint64_t v5 = v0[6];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[2] = sub_100016708(0xD000000000000013, 0x8000000100042F70, &v15);
    sub_10003FD90();
    *(_WORD *)(v6 + 12) = 2048;
    v0[3] = v1;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s returning %ld locations", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v5);
  }
  else
  {
    uint64_t v8 = v0[7];
    uint64_t v7 = v0[8];
    uint64_t v9 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v10 = v0[5];
  sub_10003F0B0();
  uint64_t v11 = sub_10003F0E0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  unint64_t v12 = (void *)swift_task_alloc();
  v0[11] = v12;
  *unint64_t v12 = v0;
  v12[1] = sub_10000E838;
  return sub_10000C4F8(1, 0xD000000000000018, 0x8000000100042F50);
}

uint64_t sub_10000E838(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000E938, 0, 0);
}

uint64_t sub_10000E938()
{
  type metadata accessor for ForecastLocationEntity();
  sub_1000127F8(&qword_10004C988, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
  sub_1000127F8(&qword_10004C9B0, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
  sub_10003EFD0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000EA54(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10004CB50 + dword_10004CB50);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000EAFC;
  return v5(a1);
}

uint64_t sub_10000EAFC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000EBFC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000A258;
  return sub_10000E364(a1);
}

unint64_t sub_10000EC98()
{
  unint64_t result = qword_10004CA00;
  if (!qword_10004CA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CA00);
  }
  return result;
}

uint64_t sub_10000ECEC()
{
  return sub_100009F88(&qword_10004CA08, qword_10004CA10);
}

uint64_t sub_10000ED28(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000B024();
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000EDDC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000EE78;
  return sub_10000D63C(a1);
}

uint64_t sub_10000EE78()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000EF74, 0, 0);
}

uint64_t sub_10000EF74()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for ForecastLocationEntity();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

unint64_t sub_10000F018()
{
  unint64_t result = qword_10004CA28;
  if (!qword_10004CA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CA28);
  }
  return result;
}

uint64_t sub_10000F06C()
{
  uint64_t v0 = sub_10003F0C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F1F0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10003FBF0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10003F0E0();
  sub_10000AB4C(v6, qword_10004D538);
  sub_10000AB14(v6, (uint64_t)qword_10004D538);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10003F0F0();
}

unint64_t sub_10000F260()
{
  uint64_t v0 = type metadata accessor for ForecastLocationEntity();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009B04(&qword_10004CAF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_10003FDC0(32);
  swift_bridgeObjectRelease();
  unint64_t v11 = 0xD00000000000001ELL;
  unint64_t v12 = 0x8000000100042D10;
  sub_10003EFB0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0))
  {
    sub_10000A34C((uint64_t)v6, &qword_10004CAF0);
    uint64_t v7 = (void *)0xE500000000000000;
    unint64_t v8 = 0x3E6C696E3CLL;
  }
  else
  {
    sub_10001267C((uint64_t)v6, (uint64_t)v3);
    sub_10000A34C((uint64_t)v6, &qword_10004CAF0);
    unint64_t v8 = sub_10000C220();
    uint64_t v7 = v9;
    sub_1000126E0((uint64_t)v3);
  }
  v13._countAndFlagsBits = v8;
  v13._object = v7;
  sub_10003FC50(v13);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_10000F430()
{
  return sub_10000F260();
}

unint64_t sub_10000F43C()
{
  unint64_t result = qword_10004CA30;
  if (!qword_10004CA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CA30);
  }
  return result;
}

unint64_t sub_10000F494()
{
  unint64_t result = qword_10004CA38;
  if (!qword_10004CA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CA38);
  }
  return result;
}

unint64_t sub_10000F4EC()
{
  unint64_t result = qword_10004CA40;
  if (!qword_10004CA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CA40);
  }
  return result;
}

uint64_t sub_10000F540()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F590@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F5C8(&qword_10004C740, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10004D538, a1);
}

uint64_t sub_10000F5C8@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000AB14(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000F680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001273C();
  void *v4 = v2;
  v4[1] = sub_10000F72C;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10000F72C()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_10000F834@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001216C();
  *a1 = result;
  return result;
}

uint64_t sub_10000F85C(uint64_t a1)
{
  unint64_t v2 = sub_10000F018();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ForecastLocationQuery()
{
  return &type metadata for ForecastLocationQuery;
}

uint64_t *sub_10000F8A8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10003F1D0();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v10 = (char *)a1 + v9;
    unint64_t v11 = (char *)a2 + v9;
    unint64_t v12 = *(void **)((char *)a2 + v9);
    Swift::String v13 = (void *)*((void *)v11 + 1);
    LOBYTE(v7) = v11[16];
    swift_retain();
    sub_10000F9C8(v12, v13, v7);
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v7;
  }
  return a1;
}

id sub_10000F9C8(id result, id a2, char a3)
{
  if (a3 == 1) {
    return result;
  }
  if (!a3) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void sub_10000F9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003F1D0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = *(void **)v6;
  uint64_t v8 = *(void **)(v6 + 8);
  char v9 = *(unsigned char *)(v6 + 16);

  sub_10000FA9C(v7, v8, v9);
}

void sub_10000FA9C(void *a1, id a2, char a3)
{
  if (a3 == 1)
  {
  }
  else if (!a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000FABC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  unint64_t v11 = *(void **)(a2 + v8);
  unint64_t v12 = *(void **)(a2 + v8 + 8);
  LOBYTE(v6) = *(unsigned char *)(v10 + 16);
  swift_retain();
  sub_10000F9C8(v11, v12, v6);
  *(void *)uint64_t v9 = v11;
  *(void *)(v9 + 8) = v12;
  *(unsigned char *)(v9 + 16) = v6;
  return a1;
}

uint64_t sub_10000FB8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  id v11 = *(id *)v10;
  unint64_t v12 = *(void **)(v10 + 8);
  LOBYTE(v6) = *(unsigned char *)(v10 + 16);
  sub_10000F9C8(*(id *)v10, v12, v6);
  Swift::String v13 = *(void **)v9;
  uint64_t v14 = *(void **)(v9 + 8);
  *(void *)uint64_t v9 = v11;
  *(void *)(v9 + 8) = v12;
  char v15 = *(unsigned char *)(v9 + 16);
  *(unsigned char *)(v9 + 16) = v6;
  sub_10000FA9C(v13, v14, v15);
  return a1;
}

uint64_t sub_10000FC78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  return a1;
}

uint64_t sub_10000FD34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_release();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  char v11 = *(unsigned char *)(v10 + 16);
  unint64_t v12 = *(void **)v9;
  Swift::String v13 = *(void **)(v9 + 8);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  char v14 = *(unsigned char *)(v9 + 16);
  *(unsigned char *)(v9 + 16) = v11;
  sub_10000FA9C(v12, v13, v14);
  return a1;
}

uint64_t sub_10000FE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000FE1C);
}

uint64_t sub_10000FE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000FEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000FEF0);
}

uint64_t sub_10000FEF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003F1D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000FFAC()
{
  uint64_t result = sub_10003F1D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForecastWidgetConfiguration()
{
  return &type metadata for ForecastWidgetConfiguration;
}

void *sub_100010060(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v6 = sub_10003F1D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v36 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100009B04(&qword_10004CB38);
  __chkstk_darwin(v45);
  unint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009B04(&qword_10004CB30);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  char v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v33 - v16;
  __chkstk_darwin(v15);
  os_log_type_t v19 = (char *)&v33 - v18;
  if (a1 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_10003FE10();
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v20)
    {
LABEL_3:
      uint64_t v33 = v4;
      unint64_t v43 = a1;
      unint64_t v44 = a1 & 0xC000000000000001;
      uint64_t v41 = v20;
      uint64_t v42 = (void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
      uint64_t v4 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
      os_log_type_t v34 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
      BOOL v35 = (void (**)(char *, uint64_t, uint64_t))(v7 + 32);
      uint64_t v39 = (void (**)(uint64_t, uint64_t))(v7 + 8);
      uint64_t v40 = v14;
      uint64_t v7 = 4;
      uint64_t v49 = v6;
      uint64_t v38 = v10;
      while (1)
      {
        char v14 = (char *)(v7 - 4);
        if (v44)
        {
          id v24 = (id)sub_10003FDE0();
          a1 = v7 - 3;
          if (__OFADD__(v14, 1)) {
            goto LABEL_20;
          }
        }
        else
        {
          id v24 = *(id *)(a1 + 8 * v7);
          a1 = v7 - 3;
          if (__OFADD__(v14, 1))
          {
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
        }
        id v48 = v24;
        id v25 = [v24 uniqueIdentifier:v33];
        sub_10003F1B0();

        (*v42)(v19, 0, 1, v6);
        sub_10003F180();
        uint64_t v26 = (uint64_t)&v10[*(int *)(v45 + 48)];
        sub_100012790((uint64_t)v19, (uint64_t)v10);
        sub_100012790((uint64_t)v17, v26);
        uint64_t v27 = *v4;
        if ((*v4)(v10, 1, v6) == 1) {
          break;
        }
        uint64_t v28 = (uint64_t)v10;
        uint64_t v29 = (uint64_t)v40;
        sub_100012790(v28, (uint64_t)v40);
        if (v27((char *)v26, 1, v6) == 1)
        {
          sub_10000A34C((uint64_t)v17, &qword_10004CB30);
          uint64_t v6 = v49;
          sub_10000A34C((uint64_t)v19, &qword_10004CB30);
          (*v39)(v29, v6);
          unint64_t v10 = v38;
          uint64_t v22 = v48;
LABEL_5:
          sub_10000A34C((uint64_t)v10, &qword_10004CB38);
          goto LABEL_6;
        }
        uint64_t v30 = v36;
        (*v35)(v36, v26, v6);
        sub_1000127F8(&qword_10004C898, (void (*)(uint64_t))&type metadata accessor for UUID);
        int v37 = sub_10003FB90();
        unint64_t v31 = *v39;
        (*v39)((uint64_t)v30, v49);
        sub_10000A34C((uint64_t)v17, &qword_10004CB30);
        sub_10000A34C((uint64_t)v19, &qword_10004CB30);
        v31(v29, v49);
        uint64_t v4 = v34;
        unint64_t v10 = v38;
        uint64_t v6 = v49;
        sub_10000A34C((uint64_t)v38, &qword_10004CB30);
        uint64_t v22 = v48;
        if (v37) {
          goto LABEL_19;
        }
LABEL_6:

        ++v7;
        BOOL v23 = a1 == v41;
        a1 = v43;
        if (v23) {
          goto LABEL_22;
        }
      }
      sub_10000A34C((uint64_t)v17, &qword_10004CB30);
      uint64_t v6 = v49;
      sub_10000A34C((uint64_t)v19, &qword_10004CB30);
      unsigned int v21 = v27((char *)v26, 1, v6);
      uint64_t v22 = v48;
      if (v21 == 1)
      {
        sub_10000A34C((uint64_t)v10, &qword_10004CB30);
LABEL_19:
        swift_bridgeObjectRelease();
        return v22;
      }
      goto LABEL_5;
    }
  }
LABEL_22:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100010570()
{
  uint64_t v1 = sub_10003F890();
  v0[24] = v1;
  v0[25] = *(void *)(v1 - 8);
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  v0[29] = swift_task_alloc();
  v0[30] = swift_task_alloc();
  return _swift_task_switch(sub_100010660, 0, 0);
}

uint64_t sub_100010660()
{
  v0[16] = 0;
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  v0[32] = v2;
  *uint64_t v1 = v0;
  v1[1] = sub_10001075C;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 19, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_10001075C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100010858, 0, 0);
}

uint64_t sub_100010858()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void **)(v0 + 152);
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();
  *(void *)(v0 + 264) = v3;

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003FE10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v0 + 272) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_10003F840();
    uint64_t v9 = sub_10003F870();
    os_log_type_t v10 = sub_10003FD50();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v13 = *(void *)(v0 + 200);
    if (v11)
    {
      uint64_t v49 = *(void *)(v0 + 208);
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v0 + 184) = sub_100016708(0xD000000000000010, 0x8000000100042EF0, v51);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s HomeManagerActor returned no homes", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v49, v14);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }

    uint64_t v20 = 0;
    goto LABEL_27;
  }
  uint64_t v50 = (void *)(v0 + 128);
  sub_10003F840();
  swift_bridgeObjectRetain_n();
  int v5 = sub_10003F870();
  os_log_type_t v6 = sub_10003FD50();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v0 + 168) = sub_100016708(0xD000000000000010, 0x8000000100042EF0, v51);
    sub_10003FD90();
    *(_WORD *)(v7 + 12) = 2048;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_10003FE10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v45 = *(void *)(v0 + 192);
    *(void *)typea = *(void *)(v0 + 240);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 176) = v8;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v19(*(void *)typea, v45);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 240);
    uint64_t v17 = *(void *)(v0 + 192);
    uint64_t v18 = *(void *)(v0 + 200);
    swift_bridgeObjectRelease_n();

    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v19(v16, v17);
  }
  *(void *)(v0 + 280) = v19;
  id v22 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v23 = sub_10003FC00();
  id v24 = [v22 initWithSuiteName:v23];

  if (v24)
  {
    NSString v25 = sub_10003FC00();
    id v26 = [v24 stringForKey:v25];

    if (v26)
    {
      uint64_t v27 = sub_10003FC10();
      unint64_t v29 = v28;

      swift_bridgeObjectRetain();
      uint64_t v46 = v27;
      uint64_t v30 = sub_100010060(v3, v27, v29);
      swift_bridgeObjectRelease();

      *(void *)(v0 + 128) = v30;
      sub_10003F840();
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_10003F870();
      os_log_type_t type = sub_10003FD50();
      BOOL v32 = os_log_type_enabled(v31, type);
      uint64_t v33 = *(void *)(v0 + 232);
      uint64_t v34 = *(void *)(v0 + 192);
      if (v32)
      {
        uint64_t v44 = *(void *)(v0 + 232);
        uint64_t v43 = *(void *)(v0 + 192);
        uint64_t v35 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315650;
        *(void *)(v0 + 136) = sub_100016708(0xD000000000000010, 0x8000000100042EF0, v51);
        sub_10003FD90();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 144) = sub_100016708(v46, v29, v51);
        sub_10003FD90();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 22) = 2080;
        uint64_t v36 = (uint64_t *)(v0 + 128);
        swift_beginAccess();
        uint64_t v37 = *v50 ? 0x444E554F46 : 0x6E756F6620746F6ELL;
        unint64_t v38 = *v50 ? 0xE500000000000000 : 0xE900000000000064;
        *(void *)(v0 + 160) = sub_100016708(v37, v38, v51);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v31, type, "%s HFSelectedHomeKey %s %s in list of homes", (uint8_t *)v35, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v19(v44, v43);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v19(v33, v34);
        uint64_t v36 = (uint64_t *)(v0 + 128);
      }
      swift_beginAccess();
      uint64_t v20 = *v36;
      if (*v36)
      {
        swift_bridgeObjectRelease();
LABEL_27:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v39 = *(uint64_t (**)(uint64_t))(v0 + 8);
        return v39(v20);
      }
    }
  }
  uint64_t v41 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v41;
  void *v41 = v0;
  v41[1] = sub_10001111C;
  uint64_t v42 = *(void *)(v0 + 256);
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 88, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v42);
}

uint64_t sub_10001111C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100011218, 0, 0);
}

id sub_100011218()
{
  uint64_t v39 = v0;
  uint64_t v1 = (void *)v0[11];
  id v2 = [v1 currentHome];

  swift_beginAccess();
  unint64_t v3 = (void *)v0[16];
  v0[16] = v2;

  sub_10003F840();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v35 = v0[28];
    uint64_t v37 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v34 = v0[24];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[14] = sub_100016708(0xD000000000000010, 0x8000000100042EF0, &v38);
    sub_10003FD90();
    *(_WORD *)(v6 + 12) = 2080;
    if (v0[16]) {
      uint64_t v7 = 0x444E554F46;
    }
    else {
      uint64_t v7 = 0x6E756F6620746F6ELL;
    }
    if (v0[16]) {
      unint64_t v8 = 0xE500000000000000;
    }
    else {
      unint64_t v8 = 0xE900000000000064;
    }
    v0[15] = sub_100016708(v7, v8, &v38);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v37(v35, v34);
  }
  else
  {
    uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v10 = v0[28];
    uint64_t v11 = v0[24];

    v9(v10, v11);
  }
  uint64_t v12 = v0[16];
  uint64_t v13 = v0[33];
  if (v12)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v14 = v13 & 0xC000000000000001;
    uint64_t v15 = v13 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      if (v14) {
        id result = (id)sub_10003FDE0();
      }
      else {
        id result = *(id *)(v15 + 8 * v12);
      }
      uint64_t v17 = result;
      uint64_t v18 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
        return result;
      }
      id v19 = [result location];

      if (v19) {
        break;
      }
      uint64_t v20 = v0[34];

      ++v12;
      if (v18 == v20)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v17 = 0;
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_21:
    uint64_t v21 = (void *)v0[16];
    v0[16] = v17;

    sub_10003F840();
    id v22 = v17;
    NSString v23 = sub_10003F870();
    os_log_type_t v24 = sub_10003FD50();
    BOOL v25 = os_log_type_enabled(v23, v24);
    id v26 = (void (*)(uint64_t, uint64_t))v0[35];
    uint64_t v27 = v0[27];
    uint64_t v28 = v0[24];
    if (v25)
    {
      uint64_t v36 = v0[24];
      uint64_t v29 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v33 = v26;
      v0[12] = sub_100016708(0xD000000000000010, 0x8000000100042EF0, &v38);
      sub_10003FD90();
      *(_WORD *)(v29 + 12) = 2080;
      if (v17) {
        uint64_t v30 = 0x444E554F46;
      }
      else {
        uint64_t v30 = 0x6E756F6620746F6ELL;
      }
      if (v17) {
        unint64_t v31 = 0xE500000000000000;
      }
      else {
        unint64_t v31 = 0xE900000000000064;
      }
      v0[13] = sub_100016708(v30, v31, &v38);
      sub_10003FD90();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s HomeKit home with location %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v33(v27, v36);
    }
    else
    {

      v26(v27, v28);
    }
    uint64_t v12 = v0[16];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v32 = (uint64_t (*)(uint64_t))v0[1];
  return (id)v32(v12);
}

uint64_t sub_100011784(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v2 = sub_10003F1D0();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  sub_100009B04(&qword_10004CB30);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_10003F890();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ForecastLocationEntity();
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_10001193C, 0, 0);
}

uint64_t sub_10001193C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000119EC;
  return sub_10000C4F8(0, 0x7365697469746E65, 0xEE00293A726F6628);
}

uint64_t sub_1000119EC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100011AEC, 0, 0);
}

uint64_t sub_100011AEC()
{
  uint64_t v55 = v0;
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[19];
  uint64_t v54 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v45 = v3;
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v0[15];
    uint64_t v6 = v0[8];
    uint64_t v46 = *(void *)(v5 + 72);
    unint64_t v40 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v43 = v2 + v40;
    uint64_t v7 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v49 = (void (**)(uint64_t, void, uint64_t))(v6 + 32);
    uint64_t v51 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    uint64_t v42 = v6;
    os_log_type_t type = (void (**)(uint64_t, uint64_t))(v6 + 8);
    uint64_t v41 = &_swiftEmptyArrayStorage;
    uint64_t v44 = v1;
    do
    {
      uint64_t v47 = v4;
      sub_10001267C(v43 + v4 * v46, v0[17]);
      uint64_t v10 = *(void *)(v1 + 16);
      if (v10)
      {
        unint64_t v11 = v0[6] + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
        uint64_t v12 = *(void *)(v42 + 72);
        uint64_t v13 = *(void (**)(uint64_t, unint64_t, uint64_t))(v42 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          uint64_t v14 = v0[10];
          uint64_t v15 = v0[7];
          v13(v14, v11, v15);
          unint64_t v8 = *v7;
          (*v7)(v14, 0, 1, v15);
          if ((*v51)(v14, 1, v15) == 1) {
            break;
          }
          uint64_t v16 = v0[9];
          uint64_t v17 = v0[7];
          (*v49)(v16, v0[10], v17);
          sub_1000127F8(&qword_10004C898, (void (*)(uint64_t))&type metadata accessor for UUID);
          char v18 = sub_10003FB90();
          (*type)(v16, v17);
          if (v18)
          {
            uint64_t v20 = v0[16];
            uint64_t v19 = v0[17];
            swift_bridgeObjectRelease();
            sub_100012840(v19, v20);
            uint64_t v21 = v41;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_100023558(0, v41[2] + 1, 1);
              uint64_t v21 = v54;
            }
            uint64_t v1 = v44;
            unint64_t v23 = v21[2];
            unint64_t v22 = v21[3];
            if (v23 >= v22 >> 1)
            {
              sub_100023558(v22 > 1, v23 + 1, 1);
              uint64_t v21 = v54;
            }
            uint64_t v24 = v0[16];
            uint64_t v21[2] = v23 + 1;
            uint64_t v41 = v21;
            sub_100012840(v24, (uint64_t)v21 + v40 + v23 * v46);
            goto LABEL_6;
          }
          v11 += v12;
          if (!--v10) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        unint64_t v8 = *v7;
        swift_bridgeObjectRetain();
LABEL_4:
        v8(v0[10], 1, 1, v0[7]);
      }
      uint64_t v9 = v0[17];
      swift_bridgeObjectRelease();
      sub_1000126E0(v9);
      uint64_t v1 = v44;
LABEL_6:
      uint64_t v4 = v47 + 1;
    }
    while (v47 + 1 != v45);
  }
  else
  {
    uint64_t v41 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003F840();
  swift_bridgeObjectRetain();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  BOOL v25 = sub_10003F870();
  os_log_type_t v26 = sub_10003FD50();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v53 = v0[13];
    uint64_t v50 = v0[12];
    uint64_t v52 = v0[11];
    uint64_t v27 = swift_slowAlloc();
    uint64_t v54 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315906;
    v0[2] = sub_100016708(0x7365697469746E65, 0xEE00293A726F6628, (uint64_t *)&v54);
    sub_10003FD90();
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_10003FC90();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    v0[3] = sub_100016708(v28, v30, (uint64_t *)&v54);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 22) = 2048;
    uint64_t v31 = v41[2];
    swift_release();
    v0[4] = v31;
    sub_10003FD90();
    swift_release();
    *(_WORD *)(v27 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_10003FC90();
    unint64_t v34 = v33;
    swift_release();
    v0[5] = sub_100016708(v32, v34, (uint64_t *)&v54);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s requested entities (%s) returning %ld: %s", (uint8_t *)v27, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v52);
  }
  else
  {
    uint64_t v35 = v0[12];
    uint64_t v36 = v0[13];
    uint64_t v37 = v0[11];
    swift_release_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v37);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(void *))v0[1];
  return v38(v41);
}

uint64_t sub_10001216C()
{
  uint64_t v0 = sub_10003F020();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  __chkstk_darwin(v0);
  uint64_t v27 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009B04(&qword_10004CAE8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  os_log_type_t v26 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v25 = (char *)v24 - v5;
  uint64_t v6 = sub_100009B04(&qword_10004CAF0);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004CAF8);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10003F0C0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10003F1F0();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_10003FBF0();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = sub_10003F0E0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  v24[1] = sub_100009B04(&qword_10004CB00);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_10003F0F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v11, 1, 1, v18);
  uint64_t v20 = type metadata accessor for ForecastLocationEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  uint64_t v21 = sub_10003EF70();
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v25, 1, 1, v21);
  v22(v26, 1, 1, v21);
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v27, enum case for InputConnectionBehavior.default(_:), v29);
  sub_1000127F8(qword_10004C9E8, (void (*)(uint64_t))type metadata accessor for ForecastLocationEntity);
  return sub_10003EFC0();
}

uint64_t sub_10001267C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ForecastLocationEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000126E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ForecastLocationEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001273C()
{
  unint64_t result = qword_10004CB10;
  if (!qword_10004CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10004CB10);
  }
  return result;
}

uint64_t sub_100012790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009B04(&qword_10004CB30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000127F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ForecastLocationEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void destroy for ForecastLocationEntity.EntityType(uint64_t a1)
{
}

uint64_t _s26HomeEnergyWidgetsExtension22ForecastLocationEntityV10EntityTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000F9C8(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ForecastLocationEntity.EntityType(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000F9C8(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000FA9C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ForecastLocationEntity.EntityType(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ForecastLocationEntity.EntityType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000FA9C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForecastLocationEntity.EntityType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForecastLocationEntity.EntityType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100012A44(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100012A5C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ForecastLocationEntity.EntityType()
{
  return &type metadata for ForecastLocationEntity.EntityType;
}

uint64_t sub_100012A84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v175 = a1;
  uint64_t v137 = sub_100009B04(&qword_10004CC58);
  __chkstk_darwin(v137);
  v136 = (char *)&v128 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_100009B04(&qword_10004CC60);
  __chkstk_darwin(v174);
  v139 = (char *)&v128 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_10003F490();
  uint64_t v131 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  v149 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_100009B04(&qword_10004CC68);
  uint64_t v133 = *(void *)(v138 - 8);
  uint64_t v5 = __chkstk_darwin(v138);
  v148 = (char *)&v128 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v132 = (char *)&v128 - v7;
  uint64_t v163 = sub_10003F5A0();
  uint64_t v128 = *(void *)(v163 - 8);
  __chkstk_darwin(v163);
  v154 = (char *)&v128 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100009B04(&qword_10004CC70);
  uint64_t v130 = *(void *)(v164 - 8);
  uint64_t v9 = __chkstk_darwin(v164);
  v147 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v129 = (char *)&v128 - v11;
  uint64_t v171 = sub_100009B04(&qword_10004CC78);
  __chkstk_darwin(v171);
  uint64_t v173 = (uint64_t)&v128 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_100009B04(&qword_10004CC80);
  __chkstk_darwin(v160);
  v161 = (char *)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_100009B04(&qword_10004CC88);
  __chkstk_darwin(v172);
  v162 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_10003F9C0();
  uint64_t v153 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v142 = (char *)&v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100009B04(&qword_10004CC90);
  __chkstk_darwin(v16 - 8);
  v165 = (char *)&v128 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_10003F3B0();
  uint64_t v168 = *(void *)(v176 - 8);
  uint64_t v18 = __chkstk_darwin(v176);
  v140 = (char *)&v128 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v144 = (char *)&v128 - v20;
  uint64_t v21 = sub_10003F170();
  uint64_t v166 = *(void *)(v21 - 8);
  uint64_t v167 = v21;
  uint64_t v22 = __chkstk_darwin(v21);
  v134 = (char *)&v128 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v170 = (char *)&v128 - v24;
  uint64_t v155 = sub_10003F450();
  uint64_t v145 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  v141 = (char *)&v128 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_100009B04(&qword_10004CC98);
  uint64_t v151 = *(void *)(v158 - 8);
  __chkstk_darwin(v158);
  v150 = (char *)&v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100009B04(&qword_10004CCA0);
  v152 = *(uint8_t **)(v159 - 8);
  uint64_t v27 = __chkstk_darwin(v159);
  uint64_t v29 = (char *)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v128 - v30;
  uint64_t v32 = type metadata accessor for HistoricalUsageWidgetEntryView();
  uint64_t v33 = __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v128 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v146 = (uint64_t)&v128 - v36;
  uint64_t v157 = sub_10003F890();
  uint64_t v156 = *(void *)(v157 - 8);
  uint64_t v37 = __chkstk_darwin(v157);
  uint64_t v39 = (char *)&v128 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  uint64_t v41 = (char *)&v128 - v40;
  uint64_t v42 = sub_10003FAB0();
  uint64_t v43 = *(uint64_t (***)(char *, uint64_t))(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v45 = (char *)&v128 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = v32;
  uint64_t v46 = v1;
  sub_100016194((uint64_t)v45);
  int v47 = v43[11](v45, v42);
  if (v47 == enum case for WidgetFamily.systemSmall(_:))
  {
    v148 = v29;
    v149 = v31;
    id v48 = v41;
    sub_10003F850();
    v154 = (char *)v1;
    uint64_t v49 = v146;
    sub_100016F60(v1, v146, (uint64_t (*)(void))type metadata accessor for HistoricalUsageWidgetEntryView);
    uint64_t v50 = sub_10003F870();
    os_log_type_t v51 = sub_10003FD50();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v177 = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136315138;
      uint64_t v53 = v169;
      type metadata accessor for HistoricalUsageEntry();
      sub_100016D60(&qword_10004CCD0, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot);
      uint64_t v54 = sub_10003FE50();
      uint64_t v182 = sub_100016708(v54, v55, &v177);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_1000166AC(v49);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "HistoricalUsageWidgetEntryView: creating systemSmall widget for usageSnapshot %s", v52, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v156 + 8))(v48, v157);
      uint64_t v56 = v154;
      uint64_t v57 = v145;
      uint64_t v58 = v144;
    }
    else
    {
      sub_1000166AC(v49);

      (*(void (**)(char *, uint64_t))(v156 + 8))(v48, v157);
      uint64_t v56 = v154;
      uint64_t v57 = v145;
      uint64_t v58 = v144;
      uint64_t v53 = v169;
    }
    v75 = &v56[*(int *)(v53 + 24)];
    uint64_t v76 = type metadata accessor for HistoricalUsageEntry();
    sub_10003EFB0();
    if (v178)
    {
      int v77 = v181 & 1;
      sub_100016DA8(v177, (uint64_t)v178);
    }
    else
    {
      int v77 = 0;
    }
    uint64_t v94 = v176;
    uint64_t v95 = v168;
    (*(void (**)(char *, char *, uint64_t))(v166 + 16))(v170, v75, v167);
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v58, &v75[*(int *)(v76 + 20)], v94);
    if (v77)
    {
      sub_10003EFB0();
      uint64_t v96 = (uint64_t)v178;
      if (v178)
      {
        uint64_t v97 = v177;
        swift_bridgeObjectRetain();
        sub_100016DA8(v97, v96);
      }
    }
    uint64_t v98 = (uint64_t)v165;
    uint64_t v99 = v155;
    uint64_t v100 = v143;
    v101 = v142;
    v102 = v141;
    sub_10003F440();
    sub_1000143D8();
    sub_10003F100();
    swift_bridgeObjectRelease();
    v103 = (void *)sub_100016D60(&qword_10004CCB8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView);
    v104 = v150;
    sub_10003F9F0();
    sub_10000A34C(v98, &qword_10004CC90);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v102, v99);
    sub_10003F9B0();
    sub_10003FA40();
    uint64_t v177 = v99;
    v178 = v103;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v106 = v148;
    uint64_t v107 = v158;
    sub_10003FA30();
    (*(void (**)(char *, uint64_t))(v153 + 8))(v101, v100);
    (*(void (**)(char *, uint64_t))(v151 + 8))(v104, v107);
    v108 = v152;
    v109 = v149;
    v110 = v106;
    uint64_t v111 = v159;
    (*((void (**)(char *, char *, uint64_t))v152 + 4))(v149, v110, v159);
    (*((void (**)(char *, char *, uint64_t))v108 + 2))(v161, v109, v111);
    swift_storeEnumTagMultiPayload();
    uint64_t v177 = v107;
    v178 = &type metadata for EmptyView;
    uint64_t v179 = OpaqueTypeConformance2;
    v180 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    v112 = (void *)sub_100016D60(&qword_10004CCC0, (void (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView);
    uint64_t v177 = v163;
    v178 = v112;
    swift_getOpaqueTypeConformance2();
    uint64_t v113 = (uint64_t)v162;
    sub_10003F9A0();
    sub_100016EFC(v113, v173, &qword_10004CC88);
    swift_storeEnumTagMultiPayload();
    sub_100016450();
    sub_1000165D0();
    sub_10003F9A0();
    sub_10000A34C(v113, &qword_10004CC88);
    return (*((uint64_t (**)(char *, uint64_t))v108 + 1))(v109, v111);
  }
  else
  {
    v170 = (char *)v43;
    uint64_t v59 = (uint64_t)v35;
    uint64_t v60 = v148;
    v61 = v149;
    char v62 = v147;
    v63 = v154;
    if (v47 == enum case for WidgetFamily.accessoryCircular(_:))
    {
      uint64_t v64 = v46 + *(int *)(v169 + 24);
      (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v134, v64, v167);
      uint64_t v65 = type metadata accessor for HistoricalUsageEntry();
      (*(void (**)(char *, uint64_t, uint64_t))(v168 + 16))(v140, v64 + *(int *)(v65 + 20), v176);
      v66 = v61;
      sub_10003F480();
      sub_1000143D8();
      uint64_t v67 = (uint64_t)v165;
      sub_10003F100();
      swift_bridgeObjectRelease();
      v68 = (void *)sub_100016D60(&qword_10004CCA8, (void (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView);
      uint64_t v69 = v135;
      sub_10003F9F0();
      sub_10000A34C(v67, &qword_10004CC90);
      (*(void (**)(char *, uint64_t))(v131 + 8))(v66, v69);
      uint64_t v70 = v133;
      v71 = v132;
      uint64_t v72 = v138;
      (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v132, v60, v138);
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v136, v71, v72);
      swift_storeEnumTagMultiPayload();
      uint64_t v177 = v69;
      v178 = v68;
      swift_getOpaqueTypeConformance2();
      uint64_t v73 = (uint64_t)v139;
      sub_10003F9A0();
      sub_100016EFC(v73, v173, &qword_10004CC60);
      swift_storeEnumTagMultiPayload();
      sub_100016450();
      sub_1000165D0();
      sub_10003F9A0();
      sub_10000A34C(v73, &qword_10004CC60);
      return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v71, v72);
    }
    else if (v47 == enum case for WidgetFamily.accessoryRectangular(_:))
    {
      v78 = v39;
      sub_10003F850();
      uint64_t v79 = v46;
      uint64_t v80 = v59;
      sub_100016F60(v46, v59, (uint64_t (*)(void))type metadata accessor for HistoricalUsageWidgetEntryView);
      v81 = sub_10003F870();
      os_log_type_t v82 = sub_10003FD50();
      int v83 = v82;
      if (os_log_type_enabled(v81, v82))
      {
        LODWORD(v153) = v83;
        uint64_t v84 = swift_slowAlloc();
        v170 = v78;
        v85 = (uint8_t *)v84;
        uint64_t v177 = swift_slowAlloc();
        *(_DWORD *)v85 = 136315138;
        v152 = v85 + 4;
        v86 = v62;
        uint64_t v87 = v80;
        uint64_t v88 = v169;
        type metadata accessor for HistoricalUsageEntry();
        sub_100016D60(&qword_10004CCD0, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot);
        uint64_t v89 = v176;
        uint64_t v90 = sub_10003FE50();
        uint64_t v182 = sub_100016708(v90, v91, &v177);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        uint64_t v92 = v87;
        char v62 = v86;
        v63 = v154;
        sub_1000166AC(v92);
        _os_log_impl((void *)&_mh_execute_header, v81, (os_log_type_t)v153, "HistoricalUsageWidgetEntryView: creating accessoryRectangular widget for usageSnapshot: %s", v85, 0xCu);
        swift_arrayDestroy();
        uint64_t v79 = v46;
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v156 + 8))(v170, v157);
        uint64_t v93 = v130;
      }
      else
      {
        sub_1000166AC(v80);

        (*(void (**)(char *, uint64_t))(v156 + 8))(v78, v157);
        uint64_t v93 = v130;
        uint64_t v89 = v176;
        uint64_t v88 = v169;
      }
      v116 = v140;
      uint64_t v117 = v79 + *(int *)(v88 + 24);
      (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v134, v117, v167);
      uint64_t v118 = type metadata accessor for HistoricalUsageEntry();
      (*(void (**)(char *, uint64_t, uint64_t))(v168 + 16))(v116, v117 + *(int *)(v118 + 20), v89);
      sub_10003F590();
      sub_1000143D8();
      uint64_t v119 = (uint64_t)v165;
      sub_10003F100();
      swift_bridgeObjectRelease();
      v120 = (void *)sub_100016D60(&qword_10004CCC0, (void (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView);
      v121 = v63;
      uint64_t v122 = v163;
      sub_10003F9F0();
      sub_10000A34C(v119, &qword_10004CC90);
      (*(void (**)(char *, uint64_t))(v128 + 8))(v121, v122);
      v123 = v129;
      uint64_t v124 = v164;
      (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v129, v62, v164);
      (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v161, v123, v124);
      swift_storeEnumTagMultiPayload();
      v125 = (void *)sub_100016D60(&qword_10004CCB8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView);
      uint64_t v177 = v155;
      v178 = v125;
      uint64_t v126 = swift_getOpaqueTypeConformance2();
      uint64_t v177 = v158;
      v178 = &type metadata for EmptyView;
      uint64_t v179 = v126;
      v180 = &protocol witness table for EmptyView;
      swift_getOpaqueTypeConformance2();
      uint64_t v177 = v122;
      v178 = v120;
      swift_getOpaqueTypeConformance2();
      uint64_t v127 = (uint64_t)v162;
      sub_10003F9A0();
      sub_100016EFC(v127, v173, &qword_10004CC88);
      swift_storeEnumTagMultiPayload();
      sub_100016450();
      sub_1000165D0();
      sub_10003F9A0();
      sub_10000A34C(v127, &qword_10004CC88);
      return (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v123, v124);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      v114 = (void *)sub_100016D60(&qword_10004CCA8, (void (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView);
      uint64_t v177 = v135;
      v178 = v114;
      swift_getOpaqueTypeConformance2();
      uint64_t v115 = (uint64_t)v139;
      sub_10003F9A0();
      sub_100016EFC(v115, v173, &qword_10004CC60);
      swift_storeEnumTagMultiPayload();
      sub_100016450();
      sub_1000165D0();
      sub_10003F9A0();
      sub_10000A34C(v115, &qword_10004CC60);
      return (*((uint64_t (**)(char *, uint64_t))v170 + 1))(v45, v42);
    }
  }
}

uint64_t sub_1000143D8()
{
  unint64_t v0 = 0xD000000000000039;
  type metadata accessor for HistoricalUsageWidgetEntryView();
  type metadata accessor for HistoricalUsageEntry();
  sub_10003EFB0();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_100016DA8(v4, v5);
    sub_100009B04(&qword_10004CCE0);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1000405A0;
    *(void *)(v1 + 56) = &type metadata for String;
    unint64_t v2 = sub_100016EA8();
    *(void *)(v1 + 32) = 0xD000000000000039;
    *(void *)(v1 + 40) = 0x8000000100043370;
    *(void *)(v1 + 96) = &type metadata for String;
    *(void *)(v1 + 104) = v2;
    *(void *)(v1 + 64) = v2;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    return sub_10003FC20();
  }
  return v0;
}

uint64_t sub_100014520()
{
  return sub_10003FA20();
}

HomeEnergyWidgetsExtension::HistoricalUsageWidget __swiftcall HistoricalUsageWidget.init()()
{
  unint64_t v0 = (void *)0x8000000100040B10;
  uint64_t v1 = 0xD000000000000015;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t HistoricalUsageWidget.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100009B04(&qword_10004C7C0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009B04(&qword_10004CB60);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v44 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004CB68);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  uint64_t v47 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009B04(&qword_10004CB70);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v48 = v13;
  uint64_t v49 = v14;
  __chkstk_darwin(v13);
  uint64_t v45 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HistoricalUsageWidgetEntryView();
  sub_100016D60(&qword_10004CB78, (void (*)(uint64_t))type metadata accessor for HistoricalUsageWidgetEntryView);
  sub_100014D14();
  swift_bridgeObjectRetain();
  sub_10003FB10();
  unint64_t v16 = sub_100014D68();
  sub_10003F980();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_10003F950();
  uint64_t v17 = sub_10003F9E0();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v51 = v1;
  unint64_t v52 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v43;
  sub_10003F990();
  sub_100014DC4(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v23);
  sub_10003F950();
  uint64_t v25 = sub_10003F9E0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  uint64_t v51 = v24;
  unint64_t v52 = OpaqueTypeConformance2;
  uint64_t v30 = swift_getOpaqueTypeConformance2();
  uint64_t v32 = v45;
  uint64_t v31 = v46;
  sub_10003F960();
  sub_100014DC4(v25, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v31);
  sub_100009B04(&qword_10004CB88);
  uint64_t v33 = sub_10003FAB0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void *)(v34 + 72);
  unint64_t v36 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_100040B20;
  unint64_t v38 = v37 + v36;
  uint64_t v39 = *(void (**)(unint64_t, void, uint64_t))(v34 + 104);
  v39(v37 + v36, enum case for WidgetFamily.systemSmall(_:), v33);
  v39(v38 + v35, enum case for WidgetFamily.accessoryRectangular(_:), v33);
  v39(v38 + 2 * v35, enum case for WidgetFamily.accessoryCircular(_:), v33);
  uint64_t v51 = v31;
  unint64_t v52 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v48;
  sub_10003F970();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v32, v40);
}

uint64_t sub_100014BB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for HistoricalUsageEntry();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F60(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HistoricalUsageEntry);
  *a2 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB90);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = type metadata accessor for HistoricalUsageWidgetEntryView();
  uint64_t v8 = (uint64_t *)((char *)a2 + *(int *)(v7 + 20));
  *uint64_t v8 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB98);
  swift_storeEnumTagMultiPayload();
  return sub_100016FD4((uint64_t)v6, (uint64_t)a2 + *(int *)(v7 + 24));
}

uint64_t type metadata accessor for HistoricalUsageWidgetEntryView()
{
  uint64_t result = qword_10004CC08;
  if (!qword_10004CC08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100014D14()
{
  unint64_t result = qword_10004CB80;
  if (!qword_10004CB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CB80);
  }
  return result;
}

unint64_t sub_100014D68()
{
  unint64_t result = qword_10004C7C8;
  if (!qword_10004C7C8)
  {
    sub_100009B48(&qword_10004C7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C7C8);
  }
  return result;
}

uint64_t sub_100014DC4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100014DD4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100014DF0(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100040B10;
}

uint64_t sub_100014E10@<X0>(uint64_t a1@<X8>)
{
  return HistoricalUsageWidget.body.getter(a1);
}

void *initializeBufferWithCopyOfBuffer for HistoricalUsageWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HistoricalUsageWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HistoricalUsageWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for HistoricalUsageWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HistoricalUsageWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HistoricalUsageWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HistoricalUsageWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HistoricalUsageWidget()
{
  return &type metadata for HistoricalUsageWidget;
}

uint64_t sub_100014F68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100015068(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_10003F170();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = type metadata accessor for HistoricalUsageEntry();
    uint64_t v18 = *(int *)(v17 + 20);
    uint64_t v19 = &v14[v18];
    char v20 = &v15[v18];
    uint64_t v21 = sub_10003F3B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000152C0(uint64_t a1, uint64_t a2)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10003FAA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v7 + *(int *)(type metadata accessor for HistoricalUsageEntry() + 20);
  uint64_t v10 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return swift_release();
}

void *sub_100015460(void *a1, void *a2, uint64_t a3)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10003FAB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v16 = *(int *)(v15 + 20);
  uint64_t v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_10003F3B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  *(void *)&v12[*(int *)(v15 + 24)] = *(void *)&v13[*(int *)(v15 + 24)];
  swift_retain();
  return a1;
}

void *sub_10001566C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10003FAA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_10000A34C((uint64_t)a1 + v7, &qword_10004CB98);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v16 = *(int *)(v15 + 20);
  uint64_t v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_10003F3B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  *(void *)&v12[*(int *)(v15 + 24)] = *(void *)&v13[*(int *)(v15 + 24)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000158AC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10003FAA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10003FAB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v14[v18];
  char v20 = &v15[v18];
  uint64_t v21 = sub_10003F3B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  return a1;
}

char *sub_100015AC4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    uint64_t v6 = sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_10000A34C((uint64_t)&a1[v8], &qword_10004CB98);
    uint64_t v11 = sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v14[v18];
  char v20 = &v15[v18];
  uint64_t v21 = sub_10003F3B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_100015D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015D20);
}

uint64_t sub_100015D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CBA0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100009B04(&qword_10004CBA8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_100015E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100015E88);
}

uint64_t sub_100015E88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100009B04(&qword_10004CBA0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100009B04(&qword_10004CBA8);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_100015FE8()
{
  sub_100016124(319, &qword_10004CC18, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F)
  {
    sub_100016124(319, (unint64_t *)&unk_10004CC20, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v1 <= 0x3F)
    {
      type metadata accessor for HistoricalUsageEntry();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100016124(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10003F8D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100016178()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016194@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10003F940();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009B04(&qword_10004CB98);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016EFC(v2, (uint64_t)v10, &qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_10003FAB0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_10003FD40();
    uint64_t v14 = sub_10003F9D0();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_100016708(0x6146746567646957, 0xEC000000796C696DLL, &v19);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10003F930();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_100016450()
{
  unint64_t result = qword_10004CCB0;
  if (!qword_10004CCB0)
  {
    sub_100009B48(&qword_10004CC88);
    sub_100009B48(&qword_10004CC98);
    sub_10003F450();
    sub_100016D60(&qword_10004CCB8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_10003F5A0();
    sub_100016D60(&qword_10004CCC0, (void (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CCB0);
  }
  return result;
}

unint64_t sub_1000165D0()
{
  unint64_t result = qword_10004CCC8;
  if (!qword_10004CCC8)
  {
    sub_100009B48(&qword_10004CC60);
    sub_10003F490();
    sub_100016D60(&qword_10004CCA8, (void (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CCC8);
  }
  return result;
}

uint64_t sub_1000166AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HistoricalUsageWidgetEntryView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016708(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000167DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100016E48((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100016E48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100016DF8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000167DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10003FDA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100016998(a5, a6);
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
  uint64_t v8 = sub_10003FDF0();
  if (!v8)
  {
    sub_10003FE00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10003FE40();
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

uint64_t sub_100016998(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100016A30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100016C10(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100016C10(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100016A30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100016BA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10003FDD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10003FE00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10003FC60();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10003FE40();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10003FE00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100016BA8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100009B04(&qword_10004CCD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100016C10(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009B04(&qword_10004CCD8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_100016D60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016DA8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100016DF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100016E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100016EA8()
{
  unint64_t result = qword_10004CCE8;
  if (!qword_10004CCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CCE8);
  }
  return result;
}

uint64_t sub_100016EFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100009B04(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016F60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HistoricalUsageEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001703C()
{
  unint64_t result = qword_10004CCF0;
  if (!qword_10004CCF0)
  {
    sub_100009B48(&qword_10004CCF8);
    sub_100016450();
    sub_1000165D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CCF0);
  }
  return result;
}

uint64_t sub_1000170BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v178 = a1;
  uint64_t v146 = sub_100009B04(&qword_10004CDC0);
  __chkstk_darwin(v146);
  v148 = (char *)&v129 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = sub_100009B04(&qword_10004CDC8);
  __chkstk_darwin(v177);
  v149 = (char *)&v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_10003F4B0();
  uint64_t v138 = *(void *)(v145 - 8);
  __chkstk_darwin(v145);
  uint64_t v137 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = sub_100009B04(&qword_10004CDD0);
  uint64_t v140 = *(void *)(v147 - 8);
  uint64_t v5 = __chkstk_darwin(v147);
  v136 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v139 = (char *)&v129 - v7;
  uint64_t v143 = sub_10003F170();
  uint64_t v142 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v144 = (char *)&v129 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = sub_10003F550();
  uint64_t v130 = *(void *)(v168 - 8);
  __chkstk_darwin(v168);
  uint64_t v133 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_100009B04(&qword_10004CDD8);
  uint64_t v135 = *(void *)(v161 - 8);
  uint64_t v10 = __chkstk_darwin(v161);
  v132 = (char *)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v134 = (char *)&v129 - v12;
  uint64_t v175 = sub_100009B04(&qword_10004CDE0);
  __chkstk_darwin(v175);
  uint64_t v174 = (uint64_t)&v129 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = sub_100009B04(&qword_10004CDE8);
  __chkstk_darwin(v165);
  uint64_t v166 = (char *)&v129 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_100009B04(&qword_10004CDF0);
  __chkstk_darwin(v176);
  uint64_t v167 = (char *)&v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_10003F9C0();
  uint64_t v159 = *(void *)(v160 - 8);
  __chkstk_darwin(v160);
  uint64_t v157 = (char *)&v129 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100009B04(&qword_10004CC90);
  __chkstk_darwin(v17 - 8);
  uint64_t v169 = (char *)&v129 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_10003F420();
  uint64_t v172 = *(void *)(v179 - 8);
  uint64_t v19 = __chkstk_darwin(v179);
  v141 = (char *)&v129 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v151 = (char *)&v129 - v21;
  uint64_t v162 = sub_10003F470();
  uint64_t v150 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  v152 = (char *)&v129 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_100009B04(&qword_10004CDF8);
  uint64_t v155 = *(void *)(v163 - 8);
  __chkstk_darwin(v163);
  v154 = (char *)&v129 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100009B04(&qword_10004CE00);
  uint64_t v158 = *(void *)(v164 - 8);
  uint64_t v24 = __chkstk_darwin(v164);
  uint64_t v153 = (char *)&v129 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v156 = (char *)&v129 - v26;
  uint64_t v27 = type metadata accessor for UtilityRateInfoWidgetEntryView();
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v129 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v131 = (uint64_t)&v129 - v32;
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v129 - v33;
  uint64_t v35 = sub_10003F890();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v170 = v35;
  uint64_t v171 = v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v39 = (char *)&v129 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v37);
  uint64_t v42 = (char *)&v129 - v41;
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v129 - v43;
  uint64_t v45 = sub_10003FAB0();
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v129 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = v27;
  uint64_t v49 = v1;
  sub_100016194((uint64_t)v48);
  int v50 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v48, v45);
  if (v50 == enum case for WidgetFamily.systemSmall(_:))
  {
    sub_10003F830();
    sub_10001AA9C(v1, (uint64_t)v34, (uint64_t (*)(void))type metadata accessor for UtilityRateInfoWidgetEntryView);
    uint64_t v51 = sub_10003F870();
    os_log_type_t v52 = sub_10003FD50();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v180 = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 136315138;
      uint64_t v135 = v1;
      uint64_t v54 = v173;
      type metadata accessor for UtilityRateInfoEntry();
      sub_10001AA54(&qword_10004CE30, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot);
      uint64_t v55 = sub_10003FE50();
      uint64_t v185 = sub_100016708(v55, v56, &v180);
      uint64_t v49 = v135;
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_10001A9F8((uint64_t)v34);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "UtilityRateInfoWidgetEntryView: creating systemSmall widget for infoSnapshot: %s", v53, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v171 + 8))(v44, v170);
    }
    else
    {
      sub_10001A9F8((uint64_t)v34);

      (*(void (**)(char *, uint64_t))(v171 + 8))(v44, v170);
      uint64_t v54 = v173;
    }
    uint64_t v65 = v151;
    uint64_t v66 = v49 + *(int *)(v54 + 24);
    uint64_t v67 = type metadata accessor for UtilityRateInfoEntry();
    sub_10003EFB0();
    if (v181)
    {
      char v68 = v184;
      sub_100016DA8(v180, (uint64_t)v181);
      (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v65, v66 + *(int *)(v67 + 20), v179);
      if (v68)
      {
        sub_10003EFB0();
        uint64_t v69 = (uint64_t)v181;
        uint64_t v70 = v150;
        if (v181)
        {
          uint64_t v71 = v180;
          swift_bridgeObjectRetain();
          sub_100016DA8(v71, v69);
        }
        uint64_t v86 = (uint64_t)v169;
        goto LABEL_24;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v65, v66 + *(int *)(v67 + 20), v179);
    }
    uint64_t v86 = (uint64_t)v169;
    uint64_t v70 = v150;
LABEL_24:
    v116 = v152;
    sub_10003F460();
    sub_100018BA4();
    sub_10003F100();
    swift_bridgeObjectRelease();
    uint64_t v117 = (void *)sub_10001AA54(&qword_10004CE18, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView);
    uint64_t v118 = v154;
    uint64_t v119 = v162;
    sub_10003F9F0();
    sub_10000A34C(v86, &qword_10004CC90);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v116, v119);
    v120 = v157;
    sub_10003F9B0();
    sub_10003FA40();
    uint64_t v180 = v119;
    char v181 = v117;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v122 = v153;
    uint64_t v123 = v163;
    sub_10003FA30();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v120, v160);
    (*(void (**)(char *, uint64_t))(v155 + 8))(v118, v123);
    uint64_t v124 = v158;
    v125 = v156;
    uint64_t v126 = v164;
    (*(void (**)(char *, char *, uint64_t))(v158 + 32))(v156, v122, v164);
    (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v166, v125, v126);
    swift_storeEnumTagMultiPayload();
    uint64_t v180 = v123;
    char v181 = &type metadata for EmptyView;
    uint64_t v182 = OpaqueTypeConformance2;
    v183 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    uint64_t v127 = (void *)sub_10001AA54(&qword_10004CE20, (void (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView);
    uint64_t v180 = v168;
    char v181 = v127;
    swift_getOpaqueTypeConformance2();
    uint64_t v128 = (uint64_t)v167;
    sub_10003F9A0();
    sub_100016EFC(v128, v174, &qword_10004CDF0);
    swift_storeEnumTagMultiPayload();
    sub_10001A79C();
    sub_10001A91C();
    sub_10003F9A0();
    sub_10000A34C(v128, &qword_10004CDF0);
    return (*(uint64_t (**)(char *, uint64_t))(v124 + 8))(v125, v126);
  }
  if (v50 == enum case for WidgetFamily.accessoryCircular(_:))
  {
    sub_10003F830();
    uint64_t v135 = v1;
    sub_10001AA9C(v1, (uint64_t)v30, (uint64_t (*)(void))type metadata accessor for UtilityRateInfoWidgetEntryView);
    uint64_t v57 = sub_10003F870();
    os_log_type_t v58 = sub_10003FD50();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      uint64_t v180 = swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 136315138;
      uint64_t v168 = (uint64_t)(v59 + 4);
      uint64_t v60 = v173;
      type metadata accessor for UtilityRateInfoEntry();
      sub_10001AA54(&qword_10004CE30, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot);
      uint64_t v61 = v179;
      uint64_t v62 = sub_10003FE50();
      uint64_t v185 = sub_100016708(v62, v63, &v180);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_10001A9F8((uint64_t)v30);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "UtilityRateInfoWidgetEntryView: creating accessoryCircular widget for infoSnapshot: %s", v59, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v171 + 8))(v39, v170);
      uint64_t v64 = v174;
    }
    else
    {
      sub_10001A9F8((uint64_t)v30);

      (*(void (**)(char *, uint64_t))(v171 + 8))(v39, v170);
      uint64_t v61 = v179;
      uint64_t v64 = v174;
      uint64_t v60 = v173;
    }
    uint64_t v87 = v141;
    uint64_t v88 = v135 + *(int *)(v60 + 24);
    (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v144, v88, v143);
    uint64_t v89 = type metadata accessor for UtilityRateInfoEntry();
    (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v87, v88 + *(int *)(v89 + 20), v61);
    uint64_t v90 = v137;
    sub_10003F4A0();
    sub_100018BA4();
    uint64_t v91 = (uint64_t)v169;
    sub_10003F100();
    swift_bridgeObjectRelease();
    uint64_t v92 = (void *)sub_10001AA54(&qword_10004CE08, (void (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView);
    uint64_t v93 = v136;
    uint64_t v94 = v145;
    sub_10003F9F0();
    sub_10000A34C(v91, &qword_10004CC90);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v90, v94);
    uint64_t v95 = v140;
    uint64_t v96 = v139;
    uint64_t v97 = v93;
    uint64_t v98 = v147;
    (*(void (**)(char *, char *, uint64_t))(v140 + 32))(v139, v97, v147);
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v148, v96, v98);
    swift_storeEnumTagMultiPayload();
    uint64_t v180 = v94;
    char v181 = v92;
    swift_getOpaqueTypeConformance2();
    uint64_t v99 = (uint64_t)v149;
    sub_10003F9A0();
    sub_100016EFC(v99, v64, &qword_10004CDC8);
    swift_storeEnumTagMultiPayload();
    sub_10001A79C();
    sub_10001A91C();
    sub_10003F9A0();
    sub_10000A34C(v99, &qword_10004CDC8);
    return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v96, v98);
  }
  else
  {
    if (v50 == enum case for WidgetFamily.accessoryRectangular(_:))
    {
      uint64_t v72 = v42;
      sub_10003F830();
      uint64_t v73 = v131;
      sub_10001AA9C(v1, v131, (uint64_t (*)(void))type metadata accessor for UtilityRateInfoWidgetEntryView);
      v74 = sub_10003F870();
      os_log_type_t v75 = sub_10003FD50();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = (uint8_t *)swift_slowAlloc();
        uint64_t v180 = swift_slowAlloc();
        *(_DWORD *)uint64_t v76 = 136315138;
        uint64_t v160 = (uint64_t)(v76 + 4);
        type metadata accessor for UtilityRateInfoEntry();
        sub_10001AA54(&qword_10004CE30, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot);
        uint64_t v77 = v179;
        uint64_t v78 = sub_10003FE50();
        uint64_t v185 = sub_100016708(v78, v79, &v180);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        sub_10001A9F8(v73);
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "UtilityRateInfoWidgetEntryView: creating accessoryRectangular widget for infoSnapshot: %s", v76, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v171 + 8))(v72, v170);
        uint64_t v80 = v173;
        uint64_t v81 = v174;
        uint64_t v45 = v161;
        uint64_t v82 = (uint64_t)v169;
        int v83 = v144;
        uint64_t v84 = v143;
        uint64_t v85 = v142;
      }
      else
      {
        sub_10001A9F8(v73);

        (*(void (**)(char *, uint64_t))(v171 + 8))(v72, v170);
        uint64_t v45 = v161;
        uint64_t v82 = (uint64_t)v169;
        uint64_t v77 = v179;
        int v83 = v144;
        uint64_t v84 = v143;
        uint64_t v85 = v142;
        uint64_t v80 = v173;
        uint64_t v81 = v174;
      }
      uint64_t v105 = v130;
      v106 = v141;
      uint64_t v107 = v1 + *(int *)(v80 + 24);
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v83, v107, v84);
      uint64_t v108 = type metadata accessor for UtilityRateInfoEntry();
      (*(void (**)(char *, uint64_t, uint64_t))(v172 + 16))(v106, v107 + *(int *)(v108 + 20), v77);
      v109 = v133;
      sub_10003F540();
      sub_100018BA4();
      sub_10003F100();
      swift_bridgeObjectRelease();
      v110 = (void *)sub_10001AA54(&qword_10004CE20, (void (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView);
      uint64_t v111 = v132;
      uint64_t v112 = v168;
      sub_10003F9F0();
      sub_10000A34C(v82, &qword_10004CC90);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v109, v112);
      uint64_t v46 = v135;
      uint64_t v48 = v134;
      (*(void (**)(char *, char *, uint64_t))(v135 + 32))(v134, v111, v45);
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v166, v48, v45);
      swift_storeEnumTagMultiPayload();
      uint64_t v113 = (void *)sub_10001AA54(&qword_10004CE18, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView);
      uint64_t v180 = v162;
      char v181 = v113;
      uint64_t v114 = swift_getOpaqueTypeConformance2();
      uint64_t v180 = v163;
      char v181 = &type metadata for EmptyView;
      uint64_t v182 = v114;
      v183 = &protocol witness table for EmptyView;
      swift_getOpaqueTypeConformance2();
      uint64_t v180 = v112;
      char v181 = v110;
      swift_getOpaqueTypeConformance2();
      uint64_t v115 = (uint64_t)v167;
      sub_10003F9A0();
      v103 = &qword_10004CDF0;
      sub_100016EFC(v115, v81, &qword_10004CDF0);
      swift_storeEnumTagMultiPayload();
      sub_10001A79C();
      sub_10001A91C();
      sub_10003F9A0();
      uint64_t v104 = v115;
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      v101 = (void *)sub_10001AA54(&qword_10004CE08, (void (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView);
      uint64_t v180 = v145;
      char v181 = v101;
      swift_getOpaqueTypeConformance2();
      uint64_t v102 = (uint64_t)v149;
      sub_10003F9A0();
      v103 = &qword_10004CDC8;
      sub_100016EFC(v102, v174, &qword_10004CDC8);
      swift_storeEnumTagMultiPayload();
      sub_10001A79C();
      sub_10001A91C();
      sub_10003F9A0();
      uint64_t v104 = v102;
    }
    sub_10000A34C(v104, v103);
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v48, v45);
  }
}

uint64_t sub_100018BA4()
{
  unint64_t v0 = 0xD000000000000039;
  type metadata accessor for UtilityRateInfoWidgetEntryView();
  type metadata accessor for UtilityRateInfoEntry();
  sub_10003EFB0();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_100016DA8(v4, v5);
    sub_100009B04(&qword_10004CCE0);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1000405A0;
    *(void *)(v1 + 56) = &type metadata for String;
    unint64_t v2 = sub_100016EA8();
    *(void *)(v1 + 32) = 0xD000000000000039;
    *(void *)(v1 + 40) = 0x8000000100043370;
    *(void *)(v1 + 96) = &type metadata for String;
    *(void *)(v1 + 104) = v2;
    *(void *)(v1 + 64) = v2;
    *(void *)(v1 + 72) = v6;
    *(void *)(v1 + 80) = v7;
    return sub_10003FC20();
  }
  return v0;
}

HomeEnergyWidgetsExtension::UtilityRateInfoWidget __swiftcall UtilityRateInfoWidget.init()()
{
  unint64_t v0 = (void *)0x8000000100040C40;
  uint64_t v1 = 0xD000000000000015;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t UtilityRateInfoWidget.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100009B04(&qword_10004C7D0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009B04(&qword_10004CD00);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v44 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004CD08);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  uint64_t v47 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009B04(&qword_10004CD10);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v48 = v13;
  uint64_t v49 = v14;
  __chkstk_darwin(v13);
  uint64_t v45 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UtilityRateInfoWidgetEntryView();
  sub_10001AA54(&qword_10004CD18, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoWidgetEntryView);
  sub_1000194C0();
  swift_bridgeObjectRetain();
  sub_10003FB10();
  unint64_t v16 = sub_100019514();
  sub_10003F980();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_10003F950();
  uint64_t v17 = sub_10003F9E0();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v51 = v1;
  unint64_t v52 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v43;
  sub_10003F990();
  sub_100014DC4(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v23);
  sub_10003F950();
  uint64_t v25 = sub_10003F9E0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  uint64_t v51 = v24;
  unint64_t v52 = OpaqueTypeConformance2;
  uint64_t v30 = swift_getOpaqueTypeConformance2();
  uint64_t v32 = v45;
  uint64_t v31 = v46;
  sub_10003F960();
  sub_100014DC4(v25, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v31);
  sub_100009B04(&qword_10004CB88);
  uint64_t v33 = sub_10003FAB0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void *)(v34 + 72);
  unint64_t v36 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_100040B20;
  unint64_t v38 = v37 + v36;
  uint64_t v39 = *(void (**)(unint64_t, void, uint64_t))(v34 + 104);
  v39(v37 + v36, enum case for WidgetFamily.accessoryRectangular(_:), v33);
  v39(v38 + v35, enum case for WidgetFamily.systemSmall(_:), v33);
  v39(v38 + 2 * v35, enum case for WidgetFamily.accessoryCircular(_:), v33);
  uint64_t v51 = v31;
  unint64_t v52 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v48;
  sub_10003F970();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v32, v40);
}

uint64_t sub_100019364@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UtilityRateInfoEntry();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AA9C(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UtilityRateInfoEntry);
  *a2 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB90);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = type metadata accessor for UtilityRateInfoWidgetEntryView();
  uint64_t v8 = (uint64_t *)((char *)a2 + *(int *)(v7 + 20));
  *uint64_t v8 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB98);
  swift_storeEnumTagMultiPayload();
  return sub_10001AB10((uint64_t)v6, (uint64_t)a2 + *(int *)(v7 + 24));
}

uint64_t type metadata accessor for UtilityRateInfoWidgetEntryView()
{
  uint64_t result = qword_10004CD80;
  if (!qword_10004CD80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000194C0()
{
  unint64_t result = qword_10004CD20;
  if (!qword_10004CD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CD20);
  }
  return result;
}

unint64_t sub_100019514()
{
  unint64_t result = qword_10004C7D8;
  if (!qword_10004C7D8)
  {
    sub_100009B48(&qword_10004C7D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C7D8);
  }
  return result;
}

uint64_t sub_100019570()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10001958C(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100040C40;
}

uint64_t sub_1000195AC@<X0>(uint64_t a1@<X8>)
{
  return UtilityRateInfoWidget.body.getter(a1);
}

ValueMetadata *type metadata accessor for UtilityRateInfoWidget()
{
  return &type metadata for UtilityRateInfoWidget;
}

uint64_t sub_1000195C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1000196C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_10003F170();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = type metadata accessor for UtilityRateInfoEntry();
    uint64_t v18 = *(int *)(v17 + 20);
    uint64_t v19 = &v14[v18];
    char v20 = &v15[v18];
    uint64_t v21 = sub_10003F420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  }
  swift_retain();
  return a1;
}

uint64_t sub_10001991C(uint64_t a1, uint64_t a2)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10003FAA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v7 + *(int *)(type metadata accessor for UtilityRateInfoEntry() + 20);
  uint64_t v10 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return swift_release();
}

void *sub_100019ABC(void *a1, void *a2, uint64_t a3)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10003FAB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v16 = *(int *)(v15 + 20);
  uint64_t v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_10003F420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  *(void *)&v12[*(int *)(v15 + 24)] = *(void *)&v13[*(int *)(v15 + 24)];
  swift_retain();
  return a1;
}

void *sub_100019CC8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10003FAA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_10000A34C((uint64_t)a1 + v7, &qword_10004CB98);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v16 = *(int *)(v15 + 20);
  uint64_t v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_10003F420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  *(void *)&v12[*(int *)(v15 + 24)] = *(void *)&v13[*(int *)(v15 + 24)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_100019F08(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10003FAA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10003FAB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v14[v18];
  char v20 = &v15[v18];
  uint64_t v21 = sub_10003F420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  return a1;
}

char *sub_10001A120(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    uint64_t v6 = sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_10000A34C((uint64_t)&a1[v8], &qword_10004CB98);
    uint64_t v11 = sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F170();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v14[v18];
  char v20 = &v15[v18];
  uint64_t v21 = sub_10003F420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_10001A368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A37C);
}

uint64_t sub_10001A37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CBA0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100009B04(&qword_10004CBA8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_10001A4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A4E4);
}

uint64_t sub_10001A4E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100009B04(&qword_10004CBA0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100009B04(&qword_10004CBA8);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_10001A644()
{
  sub_100016124(319, &qword_10004CC18, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F)
  {
    sub_100016124(319, (unint64_t *)&unk_10004CC20, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v1 <= 0x3F)
    {
      type metadata accessor for UtilityRateInfoEntry();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_10001A780()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001A79C()
{
  unint64_t result = qword_10004CE10;
  if (!qword_10004CE10)
  {
    sub_100009B48(&qword_10004CDF0);
    sub_100009B48(&qword_10004CDF8);
    sub_10003F470();
    sub_10001AA54(&qword_10004CE18, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_10003F550();
    sub_10001AA54(&qword_10004CE20, (void (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CE10);
  }
  return result;
}

unint64_t sub_10001A91C()
{
  unint64_t result = qword_10004CE28;
  if (!qword_10004CE28)
  {
    sub_100009B48(&qword_10004CDC8);
    sub_10003F4B0();
    sub_10001AA54(&qword_10004CE08, (void (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CE28);
  }
  return result;
}

uint64_t sub_10001A9F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UtilityRateInfoWidgetEntryView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001AA54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001AA9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001AB10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UtilityRateInfoEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001AB78()
{
  unint64_t result = qword_10004CE38;
  if (!qword_10004CE38)
  {
    sub_100009B48(&qword_10004CE40);
    sub_10001A79C();
    sub_10001A91C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CE38);
  }
  return result;
}

uint64_t sub_10001ABF4()
{
  return swift_bridgeObjectRelease();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001ACF4()
{
  unint64_t result = qword_10004CE48;
  if (!qword_10004CE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CE48);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyWidgetsBundle()
{
  return &type metadata for HomeEnergyWidgetsBundle;
}

uint64_t sub_10001AD58()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001AD78()
{
  unint64_t result = qword_10004CE58;
  if (!qword_10004CE58)
  {
    sub_100009B48(&qword_10004CE60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CE58);
  }
  return result;
}

ValueMetadata *type metadata accessor for UtilityRateInfoTimelineProvider()
{
  return &type metadata for UtilityRateInfoTimelineProvider;
}

uint64_t *sub_10001ADE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10003F170();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_10003F420();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return a1;
}

uint64_t sub_10001AF00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t sub_10001AFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

uint64_t sub_10001B08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10001B168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10001B234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F420();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_10001B308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B31C);
}

uint64_t sub_10001B31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_10003F420();
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
  return (v14 + 1);
}

uint64_t sub_10001B430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B444);
}

uint64_t sub_10001B444(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10003F170();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_10003F420();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for UtilityRateInfoEntry()
{
  uint64_t result = qword_10004CEC0;
  if (!qword_10004CEC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001B5A0()
{
  uint64_t result = sub_10003F170();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10003F420();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001B674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10003F170();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v31 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10003F420();
  uint64_t v5 = *(void *)(v32 - 8);
  uint64_t v6 = __chkstk_darwin(v32);
  uint64_t v30 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_10003F890();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F830();
  uint64_t v14 = sub_10003F870();
  os_log_type_t v15 = sub_10003FD50();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v28 = v2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v29 = a1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = v10;
    uint64_t v34 = v18;
    uint64_t v27 = v3;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v33 = sub_100016708(0xD000000000000010, 0x8000000100043560, &v34);
    uint64_t v3 = v27;
    uint64_t v2 = v28;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s Generating placeholder with mock data.", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v29;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_10003F3E0();
  uint64_t v19 = v31;
  sub_10003F140();
  char v20 = v30;
  uint64_t v21 = v32;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v30, v9, v32);
  uint64_t v22 = sub_10003E580();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v19, v2);
  uint64_t v23 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1 + *(int *)(v23 + 20), v20, v21);
  *(void *)(a1 + *(int *)(v23 + 24)) = v22;
  return result;
}

uint64_t sub_10001BA40(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_10003F890();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_10001BB00, 0, 0);
}

uint64_t sub_10001BB00()
{
  uint64_t v19 = v0;
  sub_10003F830();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v15 = v0[7];
    uint64_t v16 = v0[6];
    uint64_t v17 = v0[8];
    uint64_t v3 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[2] = sub_100016708(0xD000000000000011, 0x8000000100043540, &v18);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_10003E008();
    unint64_t v6 = v5;
    swift_release();
    v0[3] = sub_100016708(v4, v6, &v18);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v8 = v0[7];
    uint64_t v7 = v0[8];
    uint64_t v9 = v0[6];
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v11 = v0[4];
  uint64_t v10 = v0[5];
  uint64_t v12 = type metadata accessor for UtilityRateInfoEntry();
  sub_10003F3F0();
  sub_10003F140();
  *(void *)(v11 + *(int *)(v12 + 24)) = v10;
  swift_retain();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10001BD88(uint64_t a1, uint64_t a2)
{
  v2[38] = a1;
  v2[39] = a2;
  uint64_t v3 = sub_10003FB00();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for UtilityRateInfoEntry();
  v2[44] = v4;
  v2[45] = *(void *)(v4 - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  sub_100009B04(&qword_10004CF48);
  v2[49] = swift_task_alloc();
  uint64_t v5 = sub_10003F170();
  v2[50] = v5;
  v2[51] = *(void *)(v5 - 8);
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  sub_100009B04(&qword_10004CF50);
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  uint64_t v6 = sub_10003F330();
  v2[59] = v6;
  v2[60] = *(void *)(v6 - 8);
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  uint64_t v7 = sub_10003F420();
  v2[64] = v7;
  v2[65] = *(void *)(v7 - 8);
  v2[66] = swift_task_alloc();
  v2[67] = swift_task_alloc();
  uint64_t v8 = sub_10003F890();
  v2[68] = v8;
  v2[69] = *(void *)(v8 - 8);
  v2[70] = swift_task_alloc();
  v2[71] = swift_task_alloc();
  v2[72] = swift_task_alloc();
  v2[73] = swift_task_alloc();
  v2[74] = swift_task_alloc();
  v2[75] = swift_task_alloc();
  v2[76] = swift_task_alloc();
  v2[77] = swift_task_alloc();
  v2[78] = swift_task_alloc();
  return _swift_task_switch(sub_10001C174, 0, 0);
}

uint64_t sub_10001C174()
{
  uint64_t v80 = v0;
  sub_10003F830();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v75 = v0[78];
    uint64_t v72 = v0[69];
    uint64_t v73 = v0[68];
    uint64_t v3 = swift_slowAlloc();
    v79[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[36] = sub_100016708(0xD000000000000011, 0x8000000100043490, v79);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_10003E008();
    unint64_t v6 = v5;
    swift_release();
    v0[37] = sub_100016708(v4, v6, v79);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s resolving usageSnapshot type for configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v7(v75, v73);
  }
  else
  {
    uint64_t v8 = v0[78];
    uint64_t v9 = v0[69];
    uint64_t v10 = v0[68];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v7(v8, v10);
  }
  v0[79] = v7;
  sub_10003EFB0();
  uint64_t v11 = v0[3];
  if (v11)
  {
    uint64_t v12 = v0[2];
    swift_bridgeObjectRetain();
    sub_100016DA8(v12, v11);
    v0[15] = v12;
    v0[16] = v11;
    sub_10003F830();
    uint64_t v13 = sub_10003F870();
    os_log_type_t v14 = sub_10003FD30();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = v0[75];
    uint64_t v17 = v0[68];
    if (v15)
    {
      uint64_t v18 = swift_slowAlloc();
      v79[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      v0[29] = sub_100016708(0xD000000000000011, 0x8000000100043490, v79);
      sub_10003FD90();
      *(_WORD *)(v18 + 12) = 2080;
      swift_beginAccess();
      uint64_t v19 = v0[16];
      v0[17] = v0[15];
      v0[18] = v19;
      swift_bridgeObjectRetain();
      sub_100009B04(&qword_10004CF70);
      uint64_t v20 = sub_10003FC30();
      v0[32] = sub_100016708(v20, v21, v79);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s SiteDetail provided with non-nil siteID: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v7(v16, v17);
    swift_beginAccess();
    uint64_t v28 = v0[16];
    if (v28)
    {
      uint64_t v29 = v0[15];
      sub_10003F580();
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v30 = (void *)swift_task_alloc();
      v0[82] = v30;
      *uint64_t v30 = v0;
      v30[1] = sub_10001DBB8;
      return UtilityRateInfoSnapshotManager.init(siteID:)(v29, v28);
    }
    else
    {
      sub_10003F830();
      uint64_t v31 = sub_10003F870();
      os_log_type_t v32 = sub_10003FD30();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v34 = (void (*)(uint64_t, uint64_t))v0[79];
      uint64_t v35 = v0[71];
      uint64_t v36 = v0[68];
      if (v33)
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        v79[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315138;
        v0[20] = sub_100016708(0xD000000000000011, 0x8000000100043490, v79);
        sub_10003FD90();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s: Widget configuration has no entity (no home)", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v34(v35, v36);
      uint64_t v40 = v0[59];
      uint64_t v39 = v0[60];
      sub_100021BA4(&qword_10004CF58, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoError);
      uint64_t v41 = swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v42, enum case for UtilityRateInfoError.invalidEnergySite(_:), v40);
      swift_willThrow();
      swift_bridgeObjectRelease();
      sub_10003F830();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v43 = sub_10003F870();
      os_log_type_t v44 = sub_10003FD30();
      BOOL v45 = os_log_type_enabled(v43, v44);
      uint64_t v46 = (void (*)(uint64_t, uint64_t))v0[79];
      uint64_t v47 = v0[70];
      uint64_t v48 = v0[68];
      if (v45)
      {
        uint64_t v49 = swift_slowAlloc();
        v74 = v46;
        uint64_t v50 = (void *)swift_slowAlloc();
        v79[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = 136315394;
        v0[30] = sub_100016708(0xD000000000000011, 0x8000000100043490, v79);
        sub_10003FD90();
        *(_WORD *)(v49 + 12) = 2112;
        swift_errorRetain();
        uint64_t v51 = v41;
        uint64_t v52 = _swift_stdlib_bridgeErrorToNSError();
        v0[19] = v52;
        sub_10003FD90();
        void *v50 = v52;
        uint64_t v41 = v51;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s:ERROR: %@", (uint8_t *)v49, 0x16u);
        sub_100009B04(&qword_10004CF68);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v74(v47, v48);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();

        v46(v47, v48);
      }
      uint64_t v53 = v0[60];
      v0[31] = v41;
      swift_errorRetain();
      sub_100009B04(&qword_10004CF60);
      int v54 = swift_dynamicCast();
      uint64_t v55 = *(void (**)(void, uint64_t, uint64_t, void))(v53 + 56);
      uint64_t v57 = v0[60];
      uint64_t v56 = v0[61];
      uint64_t v58 = v0[59];
      uint64_t v59 = v0[57];
      if (v54)
      {
        v55(v0[57], 0, 1, v0[59]);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v56, v59, v58);
      }
      else
      {
        v55(v0[57], 1, 1, v0[59]);
        (*(void (**)(uint64_t, void, uint64_t))(v57 + 104))(v56, enum case for UtilityRateInfoError.otherError(_:), v58);
        sub_10000A34C(v59, &qword_10004CF50);
      }
      uint64_t v61 = v0[60];
      uint64_t v60 = v0[61];
      uint64_t v78 = v0[59];
      uint64_t v62 = v0[45];
      uint64_t v63 = v0[46];
      uint64_t v64 = v0[43];
      uint64_t v66 = v0[41];
      uint64_t v65 = v0[42];
      uint64_t v67 = v0[40];
      sub_10001EF5C(v63, v64, v60);
      sub_100009B04(&qword_10004CF38);
      unint64_t v68 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
      uint64_t v69 = swift_allocObject();
      *(_OWORD *)(v69 + 16) = xmmword_100040DF0;
      sub_100021AE4(v63, v69 + v68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v65, v64, v67);
      sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
      sub_10003FB70();
      swift_errorRelease();
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v67);
      sub_100021B48(v63);
      (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v78);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v70 = (uint64_t (*)(void))v0[1];
      return v70();
    }
  }
  else
  {
    v0[15] = 0;
    v0[16] = 0;
    sub_10003F830();
    uint64_t v22 = sub_10003F870();
    os_log_type_t v23 = sub_10003FD50();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = v0[77];
    uint64_t v26 = v0[68];
    if (v24)
    {
      uint64_t v76 = v7;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      v79[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      v0[35] = sub_100016708(0xD000000000000011, 0x8000000100043490, v79);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s No SiteDetail provided. ***Attempting Fallback to first onboarded home***", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v76(v25, v26);
    }
    else
    {

      v7(v25, v26);
    }
    uint64_t v77 = (uint64_t (*)(void))((char *)&dword_10004CF78 + dword_10004CF78);
    unint64_t v38 = (void *)swift_task_alloc();
    v0[80] = v38;
    *unint64_t v38 = v0;
    v38[1] = sub_10001D020;
    return v77();
  }
}

uint64_t sub_10001D020(uint64_t a1)
{
  *(void *)(*(void *)v1 + 648) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10001D120, 0, 0);
}

uint64_t sub_10001D120()
{
  uint64_t v60 = v0;
  sub_10003F830();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[81];
    uint64_t v56 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v54 = v0[68];
    uint64_t v55 = v0[76];
    uint64_t v4 = swift_slowAlloc();
    v59[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[33] = sub_100016708(0xD000000000000011, 0x8000000100043490, v59);
    sub_10003FD90();
    *(_WORD *)(v4 + 12) = 2048;
    v0[34] = *(void *)(v3 + 16);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s (%ld homes available.", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v56(v55, v54);
  }
  else
  {
    unint64_t v5 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v6 = v0[76];
    uint64_t v7 = v0[68];
    swift_bridgeObjectRelease();

    v5(v6, v7);
  }
  uint64_t v8 = sub_100035FB4(v0[81]);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10) {
    swift_bridgeObjectRelease();
  }
  else {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  v0[15] = v8;
  v0[16] = v10;
  swift_beginAccess();
  uint64_t v11 = v0[16];
  if (v11)
  {
    uint64_t v12 = v0[15];
    sub_10003F580();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[82] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_10001DBB8;
    return UtilityRateInfoSnapshotManager.init(siteID:)(v12, v11);
  }
  else
  {
    sub_10003F830();
    os_log_type_t v14 = sub_10003F870();
    os_log_type_t v15 = sub_10003FD30();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v18 = v0[71];
    uint64_t v19 = v0[68];
    if (v16)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      v59[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      v0[20] = sub_100016708(0xD000000000000011, 0x8000000100043490, v59);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s: Widget configuration has no entity (no home)", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v17(v18, v19);
    uint64_t v22 = v0[59];
    uint64_t v21 = v0[60];
    sub_100021BA4(&qword_10004CF58, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoError);
    uint64_t v23 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v24, enum case for UtilityRateInfoError.invalidEnergySite(_:), v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_10003F830();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v25 = sub_10003F870();
    os_log_type_t v26 = sub_10003FD30();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v29 = v0[70];
    uint64_t v30 = v0[68];
    uint64_t v58 = v23;
    if (v27)
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v53 = v28;
      os_log_type_t v32 = (void *)swift_slowAlloc();
      v59[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      v0[30] = sub_100016708(0xD000000000000011, 0x8000000100043490, v59);
      sub_10003FD90();
      *(_WORD *)(v31 + 12) = 2112;
      swift_errorRetain();
      uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
      v0[19] = v33;
      sub_10003FD90();
      *os_log_type_t v32 = v33;
      uint64_t v23 = v58;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s:ERROR: %@", (uint8_t *)v31, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v53(v29, v30);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v28(v29, v30);
    }
    uint64_t v34 = v0[60];
    v0[31] = v23;
    swift_errorRetain();
    sub_100009B04(&qword_10004CF60);
    int v35 = swift_dynamicCast();
    uint64_t v36 = *(void (**)(void, uint64_t, uint64_t, void))(v34 + 56);
    uint64_t v38 = v0[60];
    uint64_t v37 = v0[61];
    uint64_t v39 = v0[59];
    uint64_t v40 = v0[57];
    if (v35)
    {
      v36(v0[57], 0, 1, v0[59]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v37, v40, v39);
    }
    else
    {
      v36(v0[57], 1, 1, v0[59]);
      (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v37, enum case for UtilityRateInfoError.otherError(_:), v39);
      sub_10000A34C(v40, &qword_10004CF50);
    }
    uint64_t v42 = v0[60];
    uint64_t v41 = v0[61];
    uint64_t v57 = v0[59];
    uint64_t v43 = v0[45];
    uint64_t v44 = v0[46];
    uint64_t v45 = v0[43];
    uint64_t v47 = v0[41];
    uint64_t v46 = v0[42];
    uint64_t v48 = v0[40];
    sub_10001EF5C(v44, v45, v41);
    sub_100009B04(&qword_10004CF38);
    unint64_t v49 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_100040DF0;
    sub_100021AE4(v44, v50 + v49);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v46, v45, v48);
    sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
    sub_10003FB70();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v48);
    sub_100021B48(v44);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v57);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = (uint64_t (*)(void))v0[1];
    return v51();
  }
}

uint64_t sub_10001DBB8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 664) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10001DCB8, 0, 0);
}

uint64_t sub_10001DCB8()
{
  sub_10003FCD0();
  *(void *)(v0 + 672) = sub_10003FCC0();
  uint64_t v2 = sub_10003FCA0();
  return _swift_task_switch(sub_10001DD4C, v2, v1);
}

uint64_t sub_10001DD4C()
{
  swift_release();
  sub_10003F560();
  swift_release();
  return _swift_task_switch(sub_10001DDCC, 0, 0);
}

uint64_t sub_10001DDCC()
{
  v134 = v0;
  uint64_t v1 = v0[67];
  uint64_t v2 = v0[66];
  uint64_t v3 = v0[65];
  uint64_t v4 = v0[64];
  sub_10003F830();
  uint64_t v123 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v123(v2, v1, v4);
  unint64_t v5 = sub_10003F870();
  os_log_type_t v6 = sub_10003FD50();
  if (os_log_type_enabled(v5, v6))
  {
    *(void *)typec = v0[74];
    v120 = (void (*)(void, uint64_t))v0[79];
    uint64_t v112 = v0[68];
    uint64_t v7 = v0[66];
    uint64_t v131 = v0[65];
    uint64_t v8 = v0[64];
    uint64_t v9 = swift_slowAlloc();
    v133[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    v0[27] = sub_100016708(0xD000000000000011, 0x8000000100043490, v133);
    sub_10003FD90();
    *(_WORD *)(v9 + 12) = 2080;
    sub_100021BA4(&qword_10004CE30, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot);
    uint64_t v10 = sub_10003FE50();
    v0[28] = sub_100016708(v10, v11, v133);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    v132 = *(void (**)(uint64_t, uint64_t))(v131 + 8);
    v132(v7, v8);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Retrieved week snapshot for widget %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v120(*(void *)typec, v112);
  }
  else
  {
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v13 = v0[74];
    uint64_t v14 = v0[68];
    v132 = *(void (**)(uint64_t, uint64_t))(v0[65] + 8);
    v132(v0[66], v0[64]);

    v12(v13, v14);
  }
  uint64_t v15 = v0[59];
  uint64_t v16 = v0[60];
  uint64_t v17 = v0[58];
  sub_10003F400();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v15) == 1)
  {
    uint64_t v18 = v0[56];
    uint64_t v19 = v0[54];
    uint64_t v20 = v0[50];
    uint64_t v21 = v0[51];
    uint64_t v22 = v0[49];
    sub_10000A34C(v0[58], &qword_10004CF50);
    sub_10003F140();
    sub_10003F410();
    os_log_type_t type = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
    type(v19, v18, v20);
    int v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v22, 1, v20);
    uint64_t v25 = v0[54];
    uint64_t v24 = v0[55];
    uint64_t v26 = v0[50];
    uint64_t v27 = v0[51];
    uint64_t v28 = v0[49];
    if (v23 == 1)
    {
      sub_10003F770();
      sub_10003F120();
      v121 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
      v121(v25, v26);
      sub_10000A34C(v28, &qword_10004CF48);
    }
    else
    {
      v121 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
      v121(v0[54], v0[50]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v24, v28, v26);
    }
    uint64_t v44 = v0[67];
    uint64_t v45 = v0[64];
    uint64_t v46 = v0[56];
    os_log_t loga = (os_log_t)v0[53];
    uint64_t v111 = v0[52];
    uint64_t v113 = v0[55];
    uint64_t v47 = v0[50];
    uint64_t v48 = v0[48];
    os_log_t v107 = (os_log_t)v0[47];
    uint64_t v49 = v0[44];
    uint64_t v50 = v0[39];
    type(v48, v46, v47);
    v123(v48 + *(int *)(v49 + 20), v44, v45);
    *(void *)(v48 + *(int *)(v49 + 24)) = v50;
    swift_retain();
    sub_10003F830();
    sub_100021AE4(v48, (uint64_t)v107);
    type((uint64_t)loga, v46, v47);
    type(v111, v113, v47);
    uint64_t v51 = sub_10003F870();
    os_log_type_t typeb = sub_10003FD50();
    BOOL v52 = os_log_type_enabled(v51, typeb);
    uint64_t v53 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v54 = v0[72];
    uint64_t v55 = v0[68];
    uint64_t v56 = v0[53];
    uint64_t v125 = v0[52];
    uint64_t v57 = v0[50];
    uint64_t v58 = v0[47];
    if (v52)
    {
      uint64_t v114 = (void (*)(uint64_t, uint64_t))v0[79];
      uint64_t v59 = swift_slowAlloc();
      v133[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 136315906;
      v0[21] = sub_100016708(0xD000000000000011, 0x8000000100043490, v133);
      sub_10003FD90();
      *(_WORD *)(v59 + 12) = 2080;
      uint64_t v60 = sub_10001FA18();
      v0[22] = sub_100016708(v60, v61, v133);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_100021B48(v58);
      *(_WORD *)(v59 + 22) = 2080;
      uint64_t v62 = sub_10003F150();
      v0[23] = sub_100016708(v62, v63, v133);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v64 = v121;
      v121(v56, v57);
      *(_WORD *)(v59 + 32) = 2080;
      uint64_t v65 = sub_10003F150();
      v0[24] = sub_100016708(v65, v66, v133);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      v121(v125, v57);
      _os_log_impl((void *)&_mh_execute_header, v51, typeb, "%s Entry:%s created for %s, until %s", (uint8_t *)v59, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v114(v54, v55);
    }
    else
    {
      sub_100021B48(v0[47]);
      uint64_t v64 = v121;
      v121(v56, v57);
      v121(v125, v57);

      v53(v54, v55);
    }
    uint64_t v129 = v0[67];
    uint64_t v126 = v0[64];
    uint64_t v82 = v0[55];
    *(void *)typed = v0[56];
    uint64_t v83 = v0[50];
    uint64_t v84 = v0[48];
    uint64_t v85 = v0[45];
    sub_100009B04(&qword_10004CF38);
    unint64_t v86 = (*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_100040DF0;
    sub_100021AE4(v84, v87 + v86);
    sub_10003FAD0();
    sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
    sub_10003FB70();
    sub_100021B48(v84);
    v64(v82, v83);
    v64(*(void *)typed, v83);
    v132(v129, v126);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = v0[62];
    uint64_t v29 = v0[63];
    uint64_t v31 = v0[59];
    uint64_t v32 = v0[60];
    (*(void (**)(uint64_t, void, uint64_t))(v32 + 32))(v29, v0[58], v31);
    sub_10003F830();
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
    v33(v30, v29, v31);
    uint64_t v34 = sub_10003F870();
    os_log_type_t v35 = sub_10003FD50();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v122 = v0[73];
    uint64_t v124 = (void (*)(uint64_t, void))v0[79];
    *(void *)typea = v0[68];
    uint64_t v37 = v0[62];
    uint64_t v38 = v0[59];
    uint64_t v39 = v0[60];
    if (v36)
    {
      log = v34;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v108 = (void *)swift_slowAlloc();
      v133[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 136315394;
      v0[25] = sub_100016708(0xD000000000000011, 0x8000000100043490, v133);
      sub_10003FD90();
      *(_WORD *)(v40 + 12) = 2112;
      sub_100021BA4(&qword_10004CF58, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoError);
      swift_allocError();
      v33(v41, v37, v38);
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      v0[26] = v42;
      sub_10003FD90();
      void *v108 = v42;
      uint64_t v43 = v33;
      uint64_t v127 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v127(v37, v38);
      _os_log_impl((void *)&_mh_execute_header, log, v35, "%s retrieved snapshot with error: %@, giving up.", (uint8_t *)v40, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v43 = v33;
      uint64_t v127 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v127(v37, v38);
    }
    v124(v122, *(void *)typea);
    uint64_t v67 = v0[67];
    uint64_t v69 = v0[63];
    uint64_t v68 = v0[64];
    uint64_t v70 = v0[59];
    sub_100021BA4(&qword_10004CF58, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoError);
    uint64_t v71 = swift_allocError();
    v43(v72, v69, v70);
    swift_willThrow();
    v127(v69, v70);
    v132(v67, v68);
    swift_bridgeObjectRelease();
    sub_10003F830();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v73 = sub_10003F870();
    os_log_type_t v74 = sub_10003FD30();
    BOOL v75 = os_log_type_enabled(v73, v74);
    uint64_t v76 = (void (*)(uint64_t, uint64_t))v0[79];
    uint64_t v77 = v0[70];
    uint64_t v78 = v0[68];
    if (v75)
    {
      uint64_t v128 = v0[70];
      uint64_t v79 = swift_slowAlloc();
      uint64_t v80 = (void *)swift_slowAlloc();
      v133[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 136315394;
      v0[30] = sub_100016708(0xD000000000000011, 0x8000000100043490, v133);
      sub_10003FD90();
      *(_WORD *)(v79 + 12) = 2112;
      swift_errorRetain();
      uint64_t v81 = _swift_stdlib_bridgeErrorToNSError();
      v0[19] = v81;
      sub_10003FD90();
      *uint64_t v80 = v81;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "%s:ERROR: %@", (uint8_t *)v79, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v76(v128, v78);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v76(v77, v78);
    }
    uint64_t v88 = v0[60];
    v0[31] = v71;
    swift_errorRetain();
    sub_100009B04(&qword_10004CF60);
    int v89 = swift_dynamicCast();
    uint64_t v90 = *(void (**)(void, uint64_t, uint64_t, void))(v88 + 56);
    uint64_t v92 = v0[60];
    uint64_t v91 = v0[61];
    uint64_t v93 = v0[59];
    uint64_t v94 = v0[57];
    if (v89)
    {
      v90(v0[57], 0, 1, v0[59]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 32))(v91, v94, v93);
    }
    else
    {
      v90(v0[57], 1, 1, v0[59]);
      (*(void (**)(uint64_t, void, uint64_t))(v92 + 104))(v91, enum case for UtilityRateInfoError.otherError(_:), v93);
      sub_10000A34C(v94, &qword_10004CF50);
    }
    uint64_t v96 = v0[60];
    uint64_t v95 = v0[61];
    uint64_t v130 = v0[59];
    uint64_t v97 = v0[45];
    uint64_t v98 = v0[46];
    uint64_t v99 = v0[43];
    uint64_t v100 = v0[41];
    uint64_t v101 = v0[42];
    uint64_t v102 = v0[40];
    sub_10001EF5C(v98, v99, v95);
    sub_100009B04(&qword_10004CF38);
    unint64_t v103 = (*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
    uint64_t v104 = swift_allocObject();
    *(_OWORD *)(v104 + 16) = xmmword_100040DF0;
    sub_100021AE4(v98, v104 + v103);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16))(v101, v99, v102);
    sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
    sub_10003FB70();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v99, v102);
    sub_100021B48(v98);
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v130);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v105 = (uint64_t (*)(void))v0[1];
  return v105();
}

uint64_t sub_10001EF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = a2;
  uint64_t v74 = a1;
  uint64_t v4 = sub_10003F170();
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  __chkstk_darwin(v4);
  uint64_t v71 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003FB00();
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v64 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v62 = (char *)&v55 - v9;
  uint64_t v10 = sub_10003F420();
  uint64_t v68 = *(void *)(v10 - 8);
  uint64_t v69 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v67 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v63 = (char *)&v55 - v13;
  uint64_t v14 = sub_10003F330();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10003F890();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  BOOL v75 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  int v23 = (char *)&v55 - v22;
  sub_10003F830();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v24(v17, a3, v14);
  uint64_t v25 = sub_10003F870();
  os_log_type_t v26 = sub_10003FD30();
  uint64_t v60 = v25;
  int v59 = v26;
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v61 = v18;
  if (v27)
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v58 = v19;
    uint64_t v29 = v28;
    uint64_t v56 = (void *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v77[0] = v57;
    *(_DWORD *)uint64_t v29 = 136315394;
    uint64_t v76 = sub_100016708(0xD000000000000019, 0x8000000100043520, v77);
    sub_10003FD90();
    *(_WORD *)(v29 + 12) = 2112;
    sub_100021BA4(&qword_10004CF58, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoError);
    swift_allocError();
    v24(v30, (uint64_t)v17, v14);
    uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v76 = v31;
    uint64_t v18 = v61;
    sub_10003FD90();
    void *v56 = v31;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v32 = v60;
    _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v59, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v29, 0x16u);
    sub_100009B04(&qword_10004CF68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v19 = v58;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  uint64_t v33 = *(void (**)(char *, uint64_t))(v19 + 8);
  v33(v23, v18);
  uint64_t v34 = v63;
  sub_10003F3C0();
  os_log_type_t v35 = v62;
  sub_10003FAE0();
  BOOL v36 = v75;
  sub_10003F830();
  uint64_t v37 = sub_10003F870();
  os_log_type_t v38 = sub_10003FD30();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    v77[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v76 = sub_100016708(0xD000000000000019, 0x8000000100043520, v77);
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "%s: utility rate info loading failed, but error is recoverable, asking for 60 minute reload", v39, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v40 = v75;
    uint64_t v41 = v61;
  }
  else
  {

    uint64_t v40 = v36;
    uint64_t v41 = v18;
  }
  v33(v40, v41);
  uint64_t v42 = v71;
  sub_10003F130();
  uint64_t v43 = v64;
  sub_10003FAD0();
  uint64_t v45 = v72;
  uint64_t v44 = v73;
  (*(void (**)(char *, uint64_t))(v72 + 8))(v42, v73);
  uint64_t v47 = v65;
  uint64_t v46 = v66;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v66);
  (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v70, v43, v46);
  sub_10003F140();
  uint64_t v49 = v67;
  uint64_t v48 = v68;
  uint64_t v50 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v67, v34, v69);
  uint64_t v51 = sub_10003E580();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v50);
  uint64_t v52 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v45 + 32))(v74, v42, v44);
  uint64_t v53 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v52 + *(int *)(v53 + 20), v49, v50);
  *(void *)(v52 + *(int *)(v53 + 24)) = v51;
  return result;
}

uint64_t sub_10001F760(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_10001BA40(a1, v4);
}

uint64_t sub_10001F800(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_10001BD88(a1, v4);
}

uint64_t sub_10001F8A0(uint64_t *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_100021414(*a1, a2, a3, a4);
}

uint64_t sub_10001F8A8(uint64_t *a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_1000216AC(*a1, a2, a3, a4);
}

uint64_t sub_10001F8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000A258;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10001F964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000AEE4;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_10001FA18()
{
  sub_10003FDC0(53);
  v1._countAndFlagsBits = 0xD000000000000018;
  v1._object = (void *)0x80000001000434E0;
  sub_10003FC50(v1);
  v2._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 2106912;
  v3._object = (void *)0xE300000000000000;
  sub_10003FC50(v3);
  type metadata accessor for UtilityRateInfoEntry();
  swift_retain();
  v4._countAndFlagsBits = sub_10003E008();
  sub_10003FC50(v4);
  swift_release();
  swift_bridgeObjectRelease();
  v5._object = (void *)0x8000000100043500;
  v5._countAndFlagsBits = 0xD000000000000014;
  sub_10003FC50(v5);
  sub_10003F420();
  sub_100021BA4(&qword_10004CE30, (void (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot);
  v6._countAndFlagsBits = sub_10003FE50();
  sub_10003FC50(v6);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10001FB88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10003F170();
  Swift::String v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10001FBF8()
{
  return sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
}

unint64_t sub_10001FC44()
{
  unint64_t result = qword_10004CF08[0];
  if (!qword_10004CF08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10004CF08);
  }
  return result;
}

uint64_t sub_10001FC98()
{
  uint64_t v1 = sub_10003F1D0();
  v0[15] = v1;
  v0[16] = *(void *)(v1 - 8);
  v0[17] = swift_task_alloc();
  uint64_t v2 = sub_10003F890();
  v0[18] = v2;
  v0[19] = *(void *)(v2 - 8);
  v0[20] = swift_task_alloc();
  v0[21] = swift_task_alloc();
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  v0[24] = swift_task_alloc();
  return _swift_task_switch(sub_10001FDE4, 0, 0);
}

uint64_t sub_10001FDE4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v1 = v0;
  v1[1] = sub_10001FED8;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_10001FED8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001FFD4, 0, 0);
}

uint64_t sub_10001FFD4()
{
  uint64_t v54 = v0;
  uint64_t v1 = (void *)v0[6];
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();
  v0[26] = v3;

  v0[5] = _swiftEmptyDictionarySingleton;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003FE10();
    swift_bridgeObjectRelease();
    v0[27] = v4;
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[27] = v4;
    if (v4)
    {
LABEL_3:
      uint64_t v5 = sub_10003FA90();
      v0[28] = v5;
      if (v4 < 1)
      {
        __break(1u);
      }
      else
      {
        v0[29] = 0;
        uint64_t v7 = v0[26];
        if ((v7 & 0xC000000000000001) != 0) {
          id v8 = (id)sub_10003FDE0();
        }
        else {
          id v8 = *(id *)(v7 + 32);
        }
        uint64_t v9 = v8;
        v0[30] = v8;
        sub_10003F860();
        id v10 = v9;
        uint64_t v11 = sub_10003F870();
        os_log_type_t v12 = sub_10003FD50();
        BOOL v13 = os_log_type_enabled(v11, v12);
        uint64_t v14 = v0[24];
        uint64_t v16 = v0[18];
        uint64_t v15 = v0[19];
        if (v13)
        {
          uint64_t v50 = v0[24];
          uint64_t v51 = v0[18];
          uint64_t v47 = v0[17];
          uint64_t v48 = v0[16];
          uint64_t v49 = v0[15];
          uint64_t v17 = swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315650;
          v0[12] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v53);
          sub_10003FD90();
          *(_WORD *)(v17 + 12) = 2080;
          id v18 = [v10 name];
          uint64_t v19 = sub_10003FC10();
          os_log_type_t type = v12;
          unint64_t v21 = v20;

          v0[13] = sub_100016708(v19, v21, &v53);
          sub_10003FD90();
          swift_bridgeObjectRelease();

          *(_WORD *)(v17 + 22) = 2080;
          id v22 = [v10 uniqueIdentifier];
          sub_10003F1B0();

          uint64_t v23 = sub_10003F190();
          unint64_t v25 = v24;
          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
          v0[14] = sub_100016708(v23, v25, &v53);
          sub_10003FD90();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v11, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v17, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          os_log_type_t v26 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v26(v50, v51);
        }
        else
        {

          os_log_type_t v26 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v26(v14, v16);
        }
        v0[31] = v26;
        uint64_t v28 = v0[16];
        uint64_t v27 = v0[17];
        uint64_t v29 = v0[15];
        id v30 = [v10 uniqueIdentifier];
        sub_10003F1B0();

        uint64_t v31 = sub_10003F190();
        uint64_t v33 = v32;
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v0[32] = v34;
        v0[33] = (v28 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v34(v27, v29);
        os_log_type_t v35 = (void *)swift_task_alloc();
        v0[34] = v35;
        *os_log_type_t v35 = v0;
        v35[1] = sub_1000206A4;
        uint64_t v5 = v31;
        uint64_t v6 = v33;
      }
      return EnergySite.__allocating_init(clientProvidedID:)(v5, v6);
    }
  }
  swift_bridgeObjectRelease();
  sub_10003F850();
  swift_bridgeObjectRetain();
  BOOL v36 = sub_10003F870();
  os_log_type_t v37 = sub_10003FD50();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v40 = v0[19];
  uint64_t v39 = v0[20];
  uint64_t v41 = v0[18];
  if (v38)
  {
    uint64_t v52 = v0[18];
    uint64_t v42 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136315394;
    v0[7] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v53);
    sub_10003FD90();
    *(_WORD *)(v42 + 12) = 2048;
    v0[8] = _swiftEmptyDictionarySingleton[2];
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s found %ld onboarded homes", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v52);
  }
  else
  {
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  }
  swift_beginAccess();
  uint64_t v43 = v0[5];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = (uint64_t (*)(uint64_t))v0[1];
  return v44(v43);
}

uint64_t sub_1000206A4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 280) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000207A4, 0, 0);
}

uint64_t sub_1000207A4()
{
  v109 = v0;
  if (!v0[35])
  {
    id v18 = (void *)v0[30];
    sub_10003F860();
    id v19 = v18;
    unint64_t v20 = sub_10003F870();
    os_log_type_t v21 = sub_10003FD30();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = (void *)v0[30];
    unint64_t v24 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v25 = v0[21];
    uint64_t v26 = v0[18];
    if (!v22)
    {

      v24(v25, v26);
      goto LABEL_14;
    }
    uint64_t v104 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v27 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315394;
    *(void *)(v27 + 4) = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    *(_WORD *)(v27 + 12) = 2080;
    id v28 = [v23 name];
    uint64_t v29 = sub_10003FC10();
    unint64_t v31 = v30;

    *(void *)(v27 + 14) = sub_100016708(v29, v31, &v108);
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v32 = v25;
    uint64_t v33 = v26;
    goto LABEL_9;
  }
  if ((sub_10003FA80() & 1) == 0)
  {
    sub_10003F830();
    swift_retain_n();
    uint64_t v34 = sub_10003F870();
    os_log_type_t v35 = sub_10003FD50();
    BOOL v36 = os_log_type_enabled(v34, v35);
    BOOL v38 = (void *)v0[30];
    os_log_type_t v37 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v39 = v0[23];
    uint64_t v40 = v0[18];
    if (!v36)
    {

      swift_release_n();
      v37(v39, v40);
      goto LABEL_14;
    }
    uint64_t v104 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v41 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 136315394;
    *(void *)(v41 + 4) = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    *(_WORD *)(v41 + 12) = 2080;
    uint64_t v42 = sub_10003FA60();
    *(void *)(v41 + 14) = sub_100016708(v42, v43, &v108);
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    uint64_t v32 = v39;
    uint64_t v33 = v40;
LABEL_9:
    v104(v32, v33);
    goto LABEL_14;
  }
  uint64_t v1 = (void *)v0[30];
  sub_10003F830();
  id v2 = v1;
  swift_retain_n();
  id v3 = v2;
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v8 = (void *)v0[30];
  uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[31];
  uint64_t v9 = v0[22];
  uint64_t v10 = v0[18];
  if (v6)
  {
    os_log_type_t type = v5;
    *(void *)unint64_t v103 = v0[22];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    v0[9] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    sub_10003FD90();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v98 = v10;
    uint64_t v12 = sub_10003FA60();
    v0[10] = sub_100016708(v12, v13, &v108);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 22) = 2080;
    id v14 = [v8 name];
    uint64_t v15 = sub_10003FC10();
    unint64_t v17 = v16;

    v0[11] = sub_100016708(v15, v17, &v108);
    sub_10003FD90();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, type, "%s Site %s onboarded for '%s', adding to list...", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v7(*(void *)v103, v98);
  }
  else
  {
    swift_release_n();

    v7(v9, v10);
  }
  uint64_t v44 = (void (*)(uint64_t, uint64_t))v0[32];
  uint64_t v45 = (void *)v0[30];
  uint64_t v46 = v0[17];
  uint64_t v47 = v0[15];
  id v48 = [v45 uniqueIdentifier];
  sub_10003F1B0();

  uint64_t v49 = sub_10003F190();
  uint64_t v51 = v50;
  v44(v46, v47);
  uint64_t v52 = sub_10003FA60();
  uint64_t v54 = v53;
  uint64_t v55 = v0[5];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v108 = v55;
  v0[5] = 0x8000000000000000;
  sub_10003B754(v49, v51, v52, v54, isUniquelyReferenced_nonNull_native);
  v0[5] = v108;
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_14:
  uint64_t v57 = v0[29] + 1;
  if (v57 == v0[27])
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = v0[5];
    sub_10003F850();
    swift_bridgeObjectRetain();
    int v59 = sub_10003F870();
    os_log_type_t v60 = sub_10003FD50();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v63 = v0[19];
    uint64_t v62 = v0[20];
    uint64_t v64 = v0[18];
    if (v61)
    {
      uint64_t v106 = v0[20];
      uint64_t v65 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136315394;
      v0[7] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
      sub_10003FD90();
      *(_WORD *)(v65 + 12) = 2048;
      v0[8] = *(void *)(v58 + 16);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s found %ld onboarded homes", (uint8_t *)v65, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v106, v64);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
    }
    swift_beginAccess();
    uint64_t v68 = v0[5];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v69 = (uint64_t (*)(uint64_t))v0[1];
    return v69(v68);
  }
  else
  {
    v0[29] = v57;
    uint64_t v66 = v0[26];
    if ((v66 & 0xC000000000000001) != 0) {
      id v67 = (id)sub_10003FDE0();
    }
    else {
      id v67 = *(id *)(v66 + 8 * v57 + 32);
    }
    uint64_t v71 = v67;
    v0[30] = v67;
    sub_10003F860();
    id v72 = v71;
    uint64_t v73 = sub_10003F870();
    os_log_type_t v74 = sub_10003FD50();
    BOOL v75 = os_log_type_enabled(v73, v74);
    uint64_t v76 = v0[24];
    uint64_t v78 = v0[18];
    uint64_t v77 = v0[19];
    if (v75)
    {
      os_log_type_t v105 = v74;
      uint64_t v99 = v0[17];
      uint64_t v100 = v0[16];
      *(void *)typea = v0[15];
      uint64_t v79 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 136315650;
      v0[12] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
      sub_10003FD90();
      *(_WORD *)(v79 + 12) = 2080;
      id v80 = [v72 name];
      uint64_t v81 = sub_10003FC10();
      log = v73;
      unint64_t v83 = v82;

      v0[13] = sub_100016708(v81, v83, &v108);
      sub_10003FD90();
      swift_bridgeObjectRelease();

      *(_WORD *)(v79 + 22) = 2080;
      id v84 = [v72 uniqueIdentifier];
      sub_10003F1B0();

      uint64_t v85 = sub_10003F190();
      unint64_t v87 = v86;
      (*(void (**)(uint64_t, os_log_type_t *))(v100 + 8))(v99, *(os_log_type_t **)typea);
      v0[14] = sub_100016708(v85, v87, &v108);
      sub_10003FD90();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, log, v105, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v79, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
    v88(v76, v78);
    v0[31] = v88;
    uint64_t v90 = v0[16];
    uint64_t v89 = v0[17];
    uint64_t v91 = v0[15];
    id v92 = [v72 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v93 = sub_10003F190();
    uint64_t v95 = v94;
    uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
    v0[32] = v96;
    v0[33] = (v90 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v96(v89, v91);
    uint64_t v97 = (void *)swift_task_alloc();
    v0[34] = v97;
    *uint64_t v97 = v0;
    v97[1] = sub_1000206A4;
    return EnergySite.__allocating_init(clientProvidedID:)(v93, v95);
  }
}

uint64_t sub_100021414(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v7 = type metadata accessor for UtilityRateInfoEntry();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10003F890();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F830();
  id v14 = sub_10003F870();
  os_log_type_t v15 = sub_10003FD30();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v21 = a1;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = a4;
    unint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = a3;
    uint64_t v25 = v18;
    uint64_t v20 = v10;
    *(_DWORD *)unint64_t v17 = 136315138;
    uint64_t v24 = sub_100016708(0xD00000000000001FLL, 0x8000000100043470, &v25);
    a1 = v21;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s THIS SHOULD NEVER GET CALLED", v17, 0xCu);
    swift_arrayDestroy();
    a3 = v23;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_10003F140();
  sub_10003F3F0();
  *(void *)&v9[*(int *)(v7 + 24)] = a1;
  swift_retain();
  a3(v9);
  return sub_100021B48((uint64_t)v9);
}

uint64_t sub_1000216AC(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v36 = a1;
  uint64_t v6 = sub_10003FB00();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004CF30);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v35 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UtilityRateInfoEntry();
  uint64_t v33 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  __chkstk_darwin(v12);
  id v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10003F890();
  uint64_t v15 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F830();
  uint64_t v18 = sub_10003F870();
  os_log_type_t v19 = sub_10003FD30();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v30 = v9;
    uint64_t v20 = swift_slowAlloc();
    v28[1] = v8;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v31 = a4;
    uint64_t v38 = v22;
    uint64_t v29 = v10;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v37 = sub_100016708(0xD00000000000001FLL, 0x8000000100043450, &v38);
    uint64_t v10 = v29;
    uint64_t v9 = v30;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s THIS SHOULD NEVER GET CALLED", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v32);
  sub_10003F140();
  uint64_t v23 = v34;
  sub_10003F3D0();
  *(void *)&v14[*(int *)(v23 + 24)] = v36;
  sub_100009B04(&qword_10004CF38);
  unint64_t v24 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100040DF0;
  sub_100021AE4((uint64_t)v14, v25 + v24);
  swift_retain();
  sub_10003FAF0();
  sub_100021BA4(&qword_10004CF00, (void (*)(uint64_t))type metadata accessor for UtilityRateInfoEntry);
  uint64_t v26 = v35;
  sub_10003FB70();
  a3(v26);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v26, v9);
  return sub_100021B48((uint64_t)v14);
}

uint64_t sub_100021AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UtilityRateInfoEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021B48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UtilityRateInfoEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100021BA4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100021BF0()
{
  unint64_t result = qword_10004CF88;
  if (!qword_10004CF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CF88);
  }
  return result;
}

uint64_t sub_100021C44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_1000344C4(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for ForecastLocationEntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_100021DE8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
  unint64_t v3 = sub_1000344E8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[56 * v9 + 32];
  if (a1 + 32 < v10 + 56 * v8 && v10 < a1 + 32 + 56 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

unint64_t sub_100021F48()
{
  sub_10003FDC0(31);
  swift_bridgeObjectRelease();
  sub_10003EFB0();
  sub_100009B04(&qword_10004D050);
  v1._countAndFlagsBits = sub_10003FC30();
  sub_10003FC50(v1);
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

uint64_t sub_100021FFC()
{
  uint64_t v0 = sub_10003F0C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F1F0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10003FBF0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10003F0E0();
  sub_10000AB4C(v6, qword_10004D550);
  sub_10000AB14(v6, (uint64_t)qword_10004D550);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10003F0F0();
}

unint64_t sub_1000221F0()
{
  return sub_100021F48();
}

unint64_t sub_1000221FC()
{
  unint64_t result = qword_10004CF90;
  if (!qword_10004CF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CF90);
  }
  return result;
}

unint64_t sub_100022254()
{
  unint64_t result = qword_10004CF98;
  if (!qword_10004CF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CF98);
  }
  return result;
}

uint64_t sub_1000222A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000222F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000227B4(&qword_10004C748, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10004D550, a1);
}

uint64_t sub_100022330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000273D0();
  void *v4 = v2;
  v4[1] = sub_10000F72C;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_1000223DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100023B7C();
  *a1 = result;
  return result;
}

uint64_t sub_100022404(uint64_t a1)
{
  unint64_t v2 = sub_100021BF0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100022444()
{
  unint64_t result = qword_10004CFA8;
  if (!qword_10004CFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFA8);
  }
  return result;
}

unint64_t sub_10002249C()
{
  unint64_t result = qword_10004CFB0;
  if (!qword_10004CFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFB0);
  }
  return result;
}

unint64_t sub_1000224F4()
{
  unint64_t result = qword_10004CFB8;
  if (!qword_10004CFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFB8);
  }
  return result;
}

unint64_t sub_10002254C()
{
  unint64_t result = qword_10004CFC0;
  if (!qword_10004CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFC0);
  }
  return result;
}

void *sub_1000225A0()
{
  return &protocol witness table for String;
}

uint64_t sub_1000225AC()
{
  uint64_t v0 = sub_10003F060();
  sub_10000AB4C(v0, qword_10004D568);
  sub_10000AB14(v0, (uint64_t)qword_10004D568);
  return sub_10003F040();
}

unint64_t sub_100022608()
{
  unint64_t result = qword_10004CFC8;
  if (!qword_10004CFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFC8);
  }
  return result;
}

unint64_t sub_100022660()
{
  unint64_t result = qword_10004CFD0;
  if (!qword_10004CFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFD0);
  }
  return result;
}

unint64_t sub_1000226B8()
{
  unint64_t result = qword_10004CFD8;
  if (!qword_10004CFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFD8);
  }
  return result;
}

unint64_t sub_100022710()
{
  unint64_t result = qword_10004CFE0;
  if (!qword_10004CFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFE0);
  }
  return result;
}

void *sub_100022764()
{
  return &protocol witness table for String;
}

uint64_t sub_100022770@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002277C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000227B4(&qword_10004C750, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10004D568, a1);
}

uint64_t sub_1000227B4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000AB14(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_10002285C()
{
  unint64_t result = qword_10004CFE8;
  if (!qword_10004CFE8)
  {
    sub_100009B48(&qword_10004CFF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFE8);
  }
  return result;
}

uint64_t sub_1000228B8(uint64_t a1)
{
  unint64_t v2 = sub_100022CA8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100022908()
{
  unint64_t result = qword_10004CFF8;
  if (!qword_10004CFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004CFF8);
  }
  return result;
}

uint64_t sub_10002295C()
{
  uint64_t v1 = sub_100009B04(&qword_10004CB58);
  __chkstk_darwin(v1 - 8);
  unint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009B04(&qword_10004CAF8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003F0E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_10003FBE0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = *(void *)(v0 + 16);
  uint64_t v11 = *(void **)(v0 + 24);
  sub_10003FBD0();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_10003FBC0(v15);
  v16._countAndFlagsBits = v10;
  v16._object = v11;
  sub_10003FBB0(v16);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_10003FBC0(v17);
  sub_10003F0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  uint64_t v12 = sub_10003EFF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  return sub_10003F000();
}

uint64_t sub_100022BA8(uint64_t a1)
{
  unint64_t v2 = sub_100022710();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100022BF8()
{
  unint64_t result = qword_10004D000;
  if (!qword_10004D000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D000);
  }
  return result;
}

unint64_t sub_100022C50()
{
  unint64_t result = qword_10004D008;
  if (!qword_10004D008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D008);
  }
  return result;
}

unint64_t sub_100022CA8()
{
  unint64_t result = qword_10004D010[0];
  if (!qword_10004D010[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10004D010);
  }
  return result;
}

uint64_t sub_100022CFC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10004D078 + dword_10004D078);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_10000EAFC;
  return v5(a1);
}

uint64_t sub_100022DA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10004D068 + dword_10004D068);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100022E48;
  return v4();
}

uint64_t sub_100022E48(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100022F5C()
{
  unint64_t result = qword_10004D028;
  if (!qword_10004D028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D028);
  }
  return result;
}

unint64_t sub_100022FB4()
{
  unint64_t result = qword_10004D030;
  if (!qword_10004D030)
  {
    sub_100009B48(qword_10004D038);
    sub_1000226B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D030);
  }
  return result;
}

uint64_t sub_100023028(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002254C();
  *uint64_t v5 = v2;
  v5[1] = sub_10000A258;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000230DC(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_10004D060 + dword_10004D060);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 80) = v2;
  void *v2 = v1;
  v2[1] = sub_10002318C;
  return v4(v1 + 16);
}

uint64_t sub_10002318C()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  sub_100027318(v1, v2);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

ValueMetadata *type metadata accessor for SiteQuery()
{
  return &type metadata for SiteQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for SiteDetail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiteDetail()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiteDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiteDetail(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for SiteDetail(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SiteDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiteDetail(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiteDetail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiteDetail()
{
  return &type metadata for SiteDetail;
}

ValueMetadata *type metadata accessor for HistoricalUsageWidgetConfiguration()
{
  return &type metadata for HistoricalUsageWidgetConfiguration;
}

uint64_t sub_100023558(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100023598(a1, a2, a3, (void *)*v3);
  *long long v3 = result;
  return result;
}

uint64_t sub_100023578(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000237D8(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_100023598(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    BOOL v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100009B04(&qword_10004D090);
  uint64_t v10 = *(void *)(type metadata accessor for ForecastLocationEntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for ForecastLocationEntity() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_1000237D8(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100009B04(&qword_10004D080);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  size_t v14 = 56 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_100023958(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v23 = result + 32;
    uint64_t v21 = (void *)(a2 + 56);
    unint64_t v22 = _swiftEmptyArrayStorage;
    uint64_t v29 = a2;
    unint64_t v27 = *(void *)(result + 16);
    while (1)
    {
      if (v3 <= v2) {
        unint64_t v4 = v2;
      }
      else {
        unint64_t v4 = v3;
      }
      unint64_t v28 = v4;
      while (1)
      {
        if (v3 == v28) {
          goto LABEL_34;
        }
        uint64_t v5 = v3++;
        uint64_t v6 = *(void *)(a2 + 16);
        if (!v6) {
          goto LABEL_7;
        }
        uint64_t v7 = v23 + 56 * v5;
        uint64_t v8 = *(void *)v7;
        uint64_t v9 = *(void *)(v7 + 8);
        uint64_t v10 = *(void *)(v7 + 24);
        uint64_t v11 = *(void *)(v7 + 40);
        uint64_t v25 = *(void *)(v7 + 32);
        uint64_t v26 = *(void *)(v7 + 16);
        char v24 = *(unsigned char *)(v7 + 48);
        if (*(void *)(v29 + 32) == *(void *)v7 && *(void *)(v29 + 40) == v9) {
          break;
        }
        uint64_t result = sub_10003FE70();
        if (result) {
          break;
        }
        if (v6 != 1)
        {
          BOOL v13 = v21;
          uint64_t v14 = 1;
          while (1)
          {
            uint64_t v15 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              break;
            }
            if (*(v13 - 1) == v8 && *v13 == v9) {
              goto LABEL_25;
            }
            uint64_t result = sub_10003FE70();
            if (result) {
              goto LABEL_25;
            }
            v13 += 2;
            ++v14;
            if (v15 == v6) {
              goto LABEL_7;
            }
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        a2 = v29;
        if (v3 == v27) {
          return (uint64_t)v22;
        }
      }
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v17 = v22;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_100023578(0, v22[2] + 1, 1);
        unint64_t v17 = v22;
      }
      unint64_t v19 = v17[2];
      unint64_t v18 = v17[3];
      if (v19 >= v18 >> 1)
      {
        uint64_t result = sub_100023578(v18 > 1, v19 + 1, 1);
        unint64_t v17 = v22;
      }
      v17[2] = v19 + 1;
      unint64_t v22 = v17;
      uint64_t v20 = &v17[7 * v19];
      v20[4] = v8;
      v20[5] = v9;
      v20[6] = v26;
      v20[7] = v10;
      v20[8] = v25;
      v20[9] = v11;
      *((unsigned char *)v20 + 80) = v24;
      unint64_t v2 = v27;
      a2 = v29;
      if (v3 == v27) {
        return (uint64_t)v22;
      }
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_100023B7C()
{
  uint64_t v0 = sub_10003F890();
  uint64_t v34 = *(void *)(v0 - 8);
  uint64_t v35 = v0;
  __chkstk_darwin(v0);
  uint64_t v30 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10003F020();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  uint64_t v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009B04(&qword_10004CAE8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v29 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_100009B04(&qword_10004CAF8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10003F0C0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10003F1F0();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_10003FBF0();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = sub_10003F0E0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v28 = sub_100009B04(&qword_10004D058);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  sub_10003F0F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v11, 1, 1, v18);
  uint64_t v20 = v30;
  uint64_t v21 = sub_10003EF70();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  char v39 = 0;
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v8, 1, 1, v21);
  v22(v29, 1, 1, v21);
  (*(void (**)(char *, void, uint64_t))(v32 + 104))(v31, enum case for InputConnectionBehavior.default(_:), v33);
  sub_100022CA8();
  uint64_t v23 = sub_10003EFC0();
  sub_10003F850();
  char v24 = sub_10003F870();
  os_log_type_t v25 = sub_10003FD50();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "HistoricalUsageWidgetConfiguration init without siteDetail...", v26, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v35);
  return v23;
}

uint64_t sub_1000240E8()
{
  uint64_t v1 = sub_10003F1D0();
  v0[19] = v1;
  v0[20] = *(void *)(v1 - 8);
  v0[21] = swift_task_alloc();
  uint64_t v2 = sub_10003F890();
  v0[22] = v2;
  v0[23] = *(void *)(v2 - 8);
  v0[24] = swift_task_alloc();
  v0[25] = swift_task_alloc();
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  v0[29] = swift_task_alloc();
  v0[30] = swift_task_alloc();
  return _swift_task_switch(sub_10002424C, 0, 0);
}

uint64_t sub_10002424C()
{
  *(void *)(v0 + 56) = _swiftEmptyArrayStorage;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v1 = v0;
  v1[1] = sub_10002434C;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 40, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_10002434C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100024448, 0, 0);
}

uint64_t sub_100024448()
{
  id v80 = v0;
  uint64_t v1 = (void *)v0[5];
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();
  v0[32] = v3;

  sub_10003F850();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  unint64_t v6 = v3 >> 62;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v79 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[18] = sub_100016708(0xD000000000000017, 0x80000001000435F0, &v79);
    sub_10003FD90();
    *(_WORD *)(v7 + 12) = 2048;
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_10003FE10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v9 = v0[23];
    uint64_t v74 = v0[22];
    uint64_t v76 = v0[30];
    swift_bridgeObjectRelease();
    v0[14] = v8;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s HomeManagerActor returned %ld home(s), checking if onboarded...", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v10(v76, v74);
  }
  else
  {
    uint64_t v11 = v0[30];
    uint64_t v12 = v0[22];
    uint64_t v13 = v0[23];
    swift_bridgeObjectRelease_n();

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v14(v11, v12);
    uint64_t v10 = v14;
  }
  v0[33] = v3;
  v0[34] = v10;
  v0[6] = _swiftEmptyArrayStorage;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_10003FE10();
    v0[35] = v44;
    if (v44) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v0[35] = v15;
    if (v15)
    {
LABEL_8:
      uint64_t v16 = sub_10003FA90();
      v0[40] = v10;
      v0[41] = v10;
      v0[38] = v10;
      v0[39] = v10;
      v0[36] = v16;
      v0[37] = v10;
      if ((v0[33] & 0xC000000000000001) != 0) {
        id v17 = (id)sub_10003FDE0();
      }
      else {
        id v17 = *(id *)(v0[32] + 32);
      }
      uint64_t v18 = v17;
      v0[42] = v17;
      v0[43] = 1;
      sub_10003F850();
      id v19 = v18;
      uint64_t v20 = sub_10003F870();
      os_log_type_t v21 = sub_10003FD20();
      BOOL v22 = os_log_type_enabled(v20, v21);
      uint64_t v23 = v0[29];
      uint64_t v24 = v0[22];
      if (v22)
      {
        uint64_t v77 = v0[29];
        uint64_t v78 = v10;
        uint64_t v25 = v0[21];
        id v67 = v0 + 17;
        uint64_t v68 = v0[20];
        uint64_t v69 = v0[19];
        os_log_type_t type = v21;
        uint64_t v26 = swift_slowAlloc();
        uint64_t v79 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315650;
        uint64_t v71 = v24;
        v0[15] = sub_100016708(0xD000000000000017, 0x80000001000435F0, &v79);
        sub_10003FD90();
        *(_WORD *)(v26 + 12) = 2080;
        id v27 = [v19 name];
        uint64_t v28 = sub_10003FC10();
        unint64_t v30 = v29;

        v0[16] = sub_100016708(v28, v30, &v79);
        sub_10003FD90();
        swift_bridgeObjectRelease();

        *(_WORD *)(v26 + 22) = 2080;
        id v31 = [v19 uniqueIdentifier];
        sub_10003F1B0();

        uint64_t v32 = sub_10003F190();
        unint64_t v34 = v33;
        (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v25, v69);
        v0[17] = sub_100016708(v32, v34, &v79);
        sub_10003FD90();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v20, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v26, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v78(v77, v71);
      }
      else
      {

        v10(v23, v24);
      }
      uint64_t v36 = v0[20];
      uint64_t v35 = v0[21];
      uint64_t v37 = v0[19];
      id v38 = [v19 uniqueIdentifier];
      sub_10003F1B0();

      uint64_t v39 = sub_10003F190();
      uint64_t v41 = v40;
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v0[44] = v42;
      v0[45] = (v36 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v42(v35, v37);
      unint64_t v43 = (void *)swift_task_alloc();
      v0[46] = v43;
      *unint64_t v43 = v0;
      v43[1] = sub_100024F28;
      return EnergySite.__allocating_init(clientProvidedID:)(v39, v41);
    }
  }
  uint64_t v45 = v0 + 6;
  swift_bridgeObjectRelease_n();
  sub_10003F850();
  swift_bridgeObjectRetain();
  uint64_t v46 = sub_10003F870();
  os_log_type_t v47 = sub_10003FD50();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v49 = (void (*)(uint64_t, uint64_t))v0[34];
  uint64_t v50 = v0[25];
  uint64_t v51 = v0[22];
  if (v48)
  {
    uint64_t v72 = v0[22];
    uint64_t v52 = swift_slowAlloc();
    uint64_t v79 = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 136315394;
    v0[9] = sub_100016708(0xD000000000000017, 0x80000001000435F0, &v79);
    sub_10003FD90();
    *(_WORD *)(v52 + 12) = 2048;
    v0[10] = _swiftEmptyArrayStorage[2];
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "%s Found %ld home(s) with an onboarded utility)", (uint8_t *)v52, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v49(v50, v72);
  }
  else
  {
    swift_bridgeObjectRelease();

    v49(v50, v51);
  }
  uint64_t v53 = (char **)(v0 + 7);
  swift_beginAccess();
  if (*(void *)(*v45 + 16))
  {
    sub_100021DE8(*v45);
    uint64_t v54 = *v53;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10003F850();
    uint64_t v55 = sub_10003F870();
    os_log_type_t v56 = sub_10003FD50();
    BOOL v57 = os_log_type_enabled(v55, v56);
    uint64_t v58 = (void (*)(uint64_t, uint64_t))v0[34];
    uint64_t v59 = v0[24];
    uint64_t v60 = v0[22];
    if (v57)
    {
      BOOL v75 = (void (*)(uint64_t, uint64_t))v0[34];
      uint64_t v73 = v0[24];
      BOOL v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      *(_DWORD *)BOOL v61 = 136315138;
      v0[8] = sub_100016708(0xD000000000000017, 0x80000001000435F0, &v79);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s No onboarded homes found! (returning error SiteDetail: <NO ONBOARDED HOMES ERROR>)", v61, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v75(v73, v60);
    }
    else
    {

      v58(v59, v60);
    }
    uint64_t v54 = *v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v54 = sub_1000344E8(0, *((void *)v54 + 2) + 1, 1, v54);
    }
    unint64_t v63 = *((void *)v54 + 2);
    unint64_t v62 = *((void *)v54 + 3);
    if (v63 >= v62 >> 1) {
      uint64_t v54 = sub_1000344E8((char *)(v62 > 1), v63 + 1, 1, v54);
    }
    *((void *)v54 + 2) = v63 + 1;
    uint64_t v64 = &v54[56 * v63];
    *((void *)v64 + 4) = 0xD00000000000001ALL;
    *((void *)v64 + 5) = 0x80000001000435D0;
    *((void *)v64 + 6) = 0;
    *((void *)v64 + 7) = 0xE000000000000000;
    *((void *)v64 + 8) = 0;
    *((void *)v64 + 9) = 0xE000000000000000;
    v64[80] = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v65 = (uint64_t (*)(char *))v0[1];
  return v65(v54);
}

uint64_t sub_100024F28(uint64_t a1)
{
  *(void *)(*(void *)v1 + 376) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100025028, 0, 0);
}

uint64_t sub_100025028()
{
  uint64_t v131 = v0;
  if (!*(void *)(v0 + 376))
  {
    uint64_t v4 = *(void **)(v0 + 336);
    sub_10003F850();
    id v5 = v4;
    unint64_t v6 = sub_10003F870();
    os_log_type_t v7 = sub_10003FD30();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void **)(v0 + 336);
    uint64_t v10 = *(void *)(v0 + 208);
    uint64_t v11 = *(void *)(v0 + 176);
    if (v8)
    {
      *(void *)os_log_type_t type = *(void *)(v0 + 184) + 8;
      uint64_t v127 = *(void *)(v0 + 272);
      uint64_t v121 = *(void *)(v0 + 208);
      uint64_t v10 = swift_slowAlloc();
      uint64_t v1 = swift_slowAlloc();
      uint64_t v130 = (void *)v1;
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
      *(_WORD *)(v10 + 12) = 2080;
      id v2 = [v9 name];
      uint64_t v12 = sub_10003FC10();
      unint64_t v14 = v13;

      *(void *)(v10 + 14) = sub_100016708(v12, v14, (uint64_t *)&v130);
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(uint64_t, uint64_t))v127)(v121, v11);
      uint64_t v15 = *(void **)(v0 + 272);
    }
    else
    {
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 296);

      v28(v10, v11);
      uint64_t v15 = *(void **)(v0 + 296);
    }
    uint64_t v26 = v15;
    uint64_t v25 = (void (*)(void, uint64_t))v15;
    uint64_t v24 = (void (*)(void, uint64_t))v15;
    id v27 = (void (*)(uint64_t, uint64_t))v15;
    goto LABEL_21;
  }
  if ((sub_10003FA80() & 1) == 0)
  {
    sub_10003F850();
    swift_retain_n();
    uint64_t v16 = sub_10003F870();
    os_log_type_t v17 = sub_10003FD50();
    uint64_t v10 = v17;
    BOOL v18 = os_log_type_enabled(v16, v17);
    id v19 = *(void **)(v0 + 336);
    uint64_t v20 = *(void *)(v0 + 224);
    uint64_t v21 = *(void *)(v0 + 176);
    if (v18)
    {
      *(void *)os_log_type_t type = *(void *)(v0 + 184) + 8;
      uint64_t v127 = *(void *)(v0 + 320);
      uint64_t v1 = swift_slowAlloc();
      id v2 = (void *)swift_slowAlloc();
      uint64_t v130 = v2;
      *(_DWORD *)uint64_t v1 = 136315394;
      *(void *)(v1 + 4) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
      *(_WORD *)(v1 + 12) = 2080;
      uint64_t v22 = sub_10003FA60();
      *(void *)(v1 + 14) = sub_100016708(v22, v23, (uint64_t *)&v130);
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v10, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v1, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      ((void (*)(uint64_t, uint64_t))v127)(v20, v21);
      uint64_t v25 = *(void (**)(void, uint64_t))(v0 + 312);
      uint64_t v24 = *(void (**)(void, uint64_t))(v0 + 320);
      uint64_t v15 = *(void **)(v0 + 296);
      uint64_t v26 = *(void **)(v0 + 304);
      id v27 = v24;
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v0 + 328);

    swift_release_n();
    ((void (*)(uint64_t, uint64_t))v10)(v20, v21);
    uint64_t v24 = *(void (**)(void, uint64_t))(v0 + 320);
    id v27 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    uint64_t v25 = *(void (**)(void, uint64_t))(v0 + 312);
    goto LABEL_20;
  }
  if (*(void *)(v0 + 256) >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10003FE10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((*(void *)(v0 + 264) & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v29 = *(void **)(v0 + 336);
  sub_10003F850();
  id v30 = v29;
  swift_retain_n();
  id v31 = v30;
  uint64_t v32 = sub_10003F870();
  os_log_type_t typea = sub_10003FD50();
  BOOL v33 = os_log_type_enabled(v32, typea);
  unint64_t v34 = *(void **)(v0 + 336);
  uint64_t v35 = *(void *)(v0 + 216);
  uint64_t v36 = &HomeManagerActor;
  uint64_t v37 = *(void *)(v0 + 176);
  uint64_t v127 = v3;
  if (v33)
  {
    BOOL v115 = v3 > 1;
    uint64_t v111 = v0 + 304;
    uint64_t v112 = v0 + 104;
    uint64_t v122 = *(void (**)(uint64_t, void))(v0 + 304);
    *(void *)uint64_t v117 = *(void *)(v0 + 176);
    uint64_t v38 = swift_slowAlloc();
    uint64_t v130 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315906;
    *(void *)(v0 + 88) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
    sub_10003FD90();
    *(_WORD *)(v38 + 12) = 2080;
    id v39 = [v34 name];
    uint64_t v40 = sub_10003FC10();
    uint64_t v113 = v35;
    unint64_t v42 = v41;

    *(void *)(v0 + 96) = sub_100016708(v40, v42, (uint64_t *)&v130);
    uint64_t v36 = &HomeManagerActor;
    unint64_t v43 = (void **)(v0 + 304);
    sub_10003FD90();
    swift_bridgeObjectRelease();

    *(_WORD *)(v38 + 22) = 2080;
    uint64_t v44 = sub_10003FA60();
    *(void *)(v0 + 104) = sub_100016708(v44, v45, (uint64_t *)&v130);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v38 + 32) = 1024;
    *(_DWORD *)(v0 + 384) = v115;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v32, typea, "%s Creating entity for home '%s' with energySiteID: %s & multiHome: %{BOOL}d", (uint8_t *)v38, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v122(v113, *(void *)v117);
  }
  else
  {
    unint64_t v43 = (void **)(v0 + 312);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v0 + 312);

    swift_release_n();
    v46(v35, v37);
  }
  uint64_t v25 = (void (*)(void, uint64_t))*v43;
  os_log_type_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  BOOL v48 = *(void **)(v0 + 336);
  uint64_t v49 = *(void *)(v0 + 168);
  uint64_t v50 = *(void *)(v0 + 152);
  uint64_t v51 = sub_10003FA60();
  uint64_t v121 = v52;
  *(void *)os_log_type_t type = v51;
  id v53 = [v48 (SEL)v36[186].count];
  uint64_t v120 = sub_10003FC10();
  uint64_t v10 = v54;

  id v55 = [v48 uniqueIdentifier];
  sub_10003F1B0();

  uint64_t v56 = sub_10003F190();
  uint64_t v1 = v57;
  v47(v49, v50);
  id v2 = *(void **)(v0 + 48);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_49;
  }
  while (1)
  {
    unint64_t v59 = v2[2];
    unint64_t v58 = v2[3];
    if (v59 >= v58 >> 1) {
      id v2 = sub_1000344E8((char *)(v58 > 1), v59 + 1, 1, (char *)v2);
    }
    uint64_t v60 = *(void **)(v0 + 336);
    v2[2] = v59 + 1;
    BOOL v61 = &v2[7 * v59];
    v61[4] = *(void *)type;
    v61[5] = v121;
    v61[6] = v120;
    v61[7] = v10;
    v61[8] = v56;
    v61[9] = v1;
    *((unsigned char *)v61 + 80) = v127 > 1;

    swift_release();
    *(void *)(v0 + 48) = v2;
    uint64_t v24 = v25;
    id v27 = v25;
LABEL_20:
    uint64_t v15 = *(void **)(v0 + 296);
    uint64_t v26 = *(void **)(v0 + 304);
LABEL_21:
    uint64_t v56 = *(void *)(v0 + 344);
    if (v56 == *(void *)(v0 + 280))
    {
      unint64_t v62 = (uint64_t *)(v0 + 48);
      swift_bridgeObjectRelease_n();
      uint64_t v63 = *(void *)(v0 + 48);
      sub_10003F850();
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_10003F870();
      os_log_type_t v65 = sub_10003FD50();
      BOOL v66 = os_log_type_enabled(v64, v65);
      id v67 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
      uint64_t v68 = *(void *)(v0 + 200);
      uint64_t v69 = *(void *)(v0 + 176);
      if (v66)
      {
        *(void *)uint64_t v118 = *(void *)(v0 + 176);
        uint64_t v70 = swift_slowAlloc();
        uint64_t v130 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v70 = 136315394;
        *(void *)(v0 + 72) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
        sub_10003FD90();
        *(_WORD *)(v70 + 12) = 2048;
        *(void *)(v0 + 80) = *(void *)(v63 + 16);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v64, v65, "%s Found %ld home(s) with an onboarded utility)", (uint8_t *)v70, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v67(v68, *(void *)v118);
      }
      else
      {
        swift_bridgeObjectRelease();

        v67(v68, v69);
      }
      uint64_t v72 = (char **)(v0 + 56);
      swift_beginAccess();
      if (*(void *)(*v62 + 16))
      {
        sub_100021DE8(*v62);
        uint64_t v73 = *v72;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_10003F850();
        uint64_t v99 = sub_10003F870();
        os_log_type_t v100 = sub_10003FD50();
        BOOL v101 = os_log_type_enabled(v99, v100);
        uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
        uint64_t v103 = *(void *)(v0 + 192);
        uint64_t v104 = *(void *)(v0 + 176);
        if (v101)
        {
          uint64_t v129 = *(void *)(v0 + 176);
          uint64_t v123 = *(void *)(v0 + 192);
          os_log_type_t v105 = (uint8_t *)swift_slowAlloc();
          uint64_t v130 = (void *)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v105 = 136315138;
          *(void *)(v0 + 64) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
          sub_10003FD90();
          _os_log_impl((void *)&_mh_execute_header, v99, v100, "%s No onboarded homes found! (returning error SiteDetail: <NO ONBOARDED HOMES ERROR>)", v105, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v102(v123, v129);
        }
        else
        {

          v102(v103, v104);
        }
        uint64_t v73 = *v72;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v73 = sub_1000344E8(0, *((void *)v73 + 2) + 1, 1, v73);
        }
        unint64_t v107 = *((void *)v73 + 2);
        unint64_t v106 = *((void *)v73 + 3);
        if (v107 >= v106 >> 1) {
          uint64_t v73 = sub_1000344E8((char *)(v106 > 1), v107 + 1, 1, v73);
        }
        *((void *)v73 + 2) = v107 + 1;
        uint64_t v108 = &v73[56 * v107];
        *((void *)v108 + 4) = 0xD00000000000001ALL;
        *((void *)v108 + 5) = 0x80000001000435D0;
        *((void *)v108 + 6) = 0;
        *((void *)v108 + 7) = 0xE000000000000000;
        *((void *)v108 + 8) = 0;
        *((void *)v108 + 9) = 0xE000000000000000;
        v108[80] = 0;
      }
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v109 = *(uint64_t (**)(char *))(v0 + 8);
      return v109(v73);
    }
    *(void *)(v0 + 320) = v24;
    *(void *)(v0 + 328) = v27;
    *(void *)(v0 + 304) = v26;
    *(void *)(v0 + 312) = v25;
    *(void *)(v0 + 296) = v15;
    uint64_t v71 = (*(void *)(v0 + 264) & 0xC000000000000001) != 0
        ? (void (*)(void, uint64_t))sub_10003FDE0()
        : (void (*)(void, uint64_t))*(id *)(*(void *)(v0 + 256) + 8 * v56 + 32);
    uint64_t v25 = v71;
    *(void *)(v0 + 336) = v71;
    *(void *)(v0 + 344) = v56 + 1;
    if (!__OFADD__(v56, 1)) {
      break;
    }
    __break(1u);
LABEL_49:
    id v2 = sub_1000344E8(0, v2[2] + 1, 1, (char *)v2);
  }
  sub_10003F850();
  uint64_t v74 = v25;
  BOOL v75 = sub_10003F870();
  os_log_type_t v76 = sub_10003FD20();
  BOOL v77 = os_log_type_enabled(v75, v76);
  uint64_t v78 = *(void *)(v0 + 232);
  uint64_t v79 = *(void *)(v0 + 176);
  if (v77)
  {
    uint64_t v128 = *(void *)(v0 + 176);
    *(void *)os_log_type_t typeb = *(void *)(v0 + 232);
    uint64_t v80 = *(void *)(v0 + 168);
    uint64_t v114 = *(void *)(v0 + 160);
    uint64_t v116 = *(void *)(v0 + 152);
    os_log_type_t v119 = v76;
    uint64_t v81 = swift_slowAlloc();
    uint64_t v130 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v81 = 136315650;
    *(void *)(v0 + 120) = sub_100016708(0xD000000000000017, 0x80000001000435F0, (uint64_t *)&v130);
    sub_10003FD90();
    *(_WORD *)(v81 + 12) = 2080;
    id v82 = [v74 name];
    uint64_t v83 = sub_10003FC10();
    unint64_t v85 = v84;

    *(void *)(v0 + 128) = sub_100016708(v83, v85, (uint64_t *)&v130);
    sub_10003FD90();
    swift_bridgeObjectRelease();

    *(_WORD *)(v81 + 22) = 2080;
    id v86 = [v74 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v87 = sub_10003F190();
    unint64_t v89 = v88;
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v80, v116);
    *(void *)(v0 + 136) = sub_100016708(v87, v89, (uint64_t *)&v130);
    sub_10003FD90();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v75, v119, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v81, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v27(*(void *)typeb, v128);
  }
  else
  {

    v27(v78, v79);
  }
  uint64_t v91 = *(void *)(v0 + 160);
  uint64_t v90 = *(void *)(v0 + 168);
  uint64_t v92 = *(void *)(v0 + 152);
  id v93 = [v74 uniqueIdentifier:v111, v112];
  sub_10003F1B0();

  uint64_t v94 = sub_10003F190();
  uint64_t v96 = v95;
  uint64_t v97 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
  *(void *)(v0 + 352) = v97;
  *(void *)(v0 + 360) = (v91 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v97(v90, v92);
  uint64_t v98 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v98;
  *uint64_t v98 = v0;
  v98[1] = sub_100024F28;
  return EnergySite.__allocating_init(clientProvidedID:)(v94, v96);
}

uint64_t sub_100026068(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v2 = sub_10003F890();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  id v5 = (uint64_t (__cdecl *)())((char *)&dword_10004D070 + dword_10004D070);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[10] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100026168;
  return v5();
}

uint64_t sub_100026168(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100026268, 0, 0);
}

uint64_t sub_100026268()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[11];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100023958(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003F850();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v21 = v0[8];
    uint64_t v22 = v0[7];
    uint64_t v23 = v0[9];
    log = v4;
    uint64_t v6 = swift_slowAlloc();
    v24[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315906;
    v0[2] = sub_100016708(0x7365697469746E65, 0xEE00293A726F6628, v24);
    sub_10003FD90();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    os_log_type_t type = v5;
    uint64_t v7 = sub_10003FC90();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[3] = sub_100016708(v7, v9, v24);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 22) = 2048;
    uint64_t v10 = *(void *)(v3 + 16);
    swift_bridgeObjectRelease();
    v0[4] = v10;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_10003FC90();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v0[5] = sub_100016708(v11, v13, v24);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s filtering for utility onboarded homes with these IDs: %s, FOUND %ld: %s", (uint8_t *)v6, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  }
  else
  {
    uint64_t v15 = v0[8];
    uint64_t v14 = v0[9];
    uint64_t v16 = v0[7];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  swift_task_dealloc();
  os_log_type_t v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v3);
}

uint64_t sub_1000265E8()
{
  uint64_t v1 = sub_10003F890();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10004D070 + dword_10004D070);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  void *v2 = v0;
  v2[1] = sub_1000266E4;
  return v4();
}

uint64_t sub_1000266E4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000267E4, 0, 0);
}

uint64_t sub_1000267E4()
{
  os_log_type_t v17 = v0;
  sub_10003F850();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v13 = v0[5];
    uint64_t v14 = v0[4];
    uint64_t v15 = v0[6];
    uint64_t v3 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[2] = sub_100016708(0xD000000000000013, 0x8000000100042F70, &v16);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003FC90();
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    v0[3] = sub_100016708(v4, v6, &v16);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s returning all utility onboarded homes: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  }
  else
  {
    uint64_t v8 = v0[5];
    uint64_t v7 = v0[6];
    uint64_t v9 = v0[4];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v11 = v0[8];
  return v10(v11);
}

uint64_t sub_100026A58(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = sub_10003F890();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  unint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_10004D068 + dword_10004D068);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[8] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100026B58;
  return v5();
}

uint64_t sub_100026B58(uint64_t a1)
{
  *(void *)(*(void *)v2 + 72) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v3 = sub_100027030;
  }
  else
  {
    uint64_t v3 = sub_100026C74;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100026C74()
{
  uint64_t v28 = v0;
  uint64_t v1 = v0[9];
  if (*(void *)(v1 + 16))
  {
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v2 = *(void *)(v1 + 40);
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t v4 = *(void *)(v1 + 56);
    uint64_t v7 = *(void *)(v1 + 64);
    unint64_t v6 = *(void *)(v1 + 72);
    char v8 = *(unsigned char *)(v1 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = 0;
    uint64_t v2 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    uint64_t v7 = 0;
    unint64_t v6 = 0;
    char v8 = 0;
  }
  sub_10003F850();
  sub_100027380(v3, v2);
  sub_100027380(v3, v2);
  unint64_t v9 = v6;
  uint64_t v10 = sub_10003F870();
  os_log_type_t v11 = sub_10003FD50();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v23 = v11;
    uint64_t v25 = v3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[2] = sub_100016708(0x52746C7561666564, 0xEF2928746C757365, &v27);
    sub_10003FD90();
    *(_WORD *)(v12 + 12) = 2080;
    if (v2)
    {
      unint64_t v13 = v9;
      swift_bridgeObjectRetain();
      uint64_t v14 = v7;
    }
    else
    {
      unint64_t v13 = 0xE500000000000000;
      uint64_t v14 = 0x3E6C696E3CLL;
    }
    uint64_t v20 = v0[6];
    uint64_t v21 = v0[5];
    uint64_t v22 = v0[7];
    v0[3] = sub_100016708(v14, v13, &v27);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    uint64_t v3 = v25;
    sub_100016DA8(v25, v2);
    sub_100016DA8(v25, v2);
    _os_log_impl((void *)&_mh_execute_header, v10, v23, "%s returning: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
    unint64_t v16 = v9;
  }
  else
  {
    uint64_t v15 = v0[6];
    os_log_t log = (os_log_t)v0[5];
    uint64_t v26 = v0[7];
    sub_100016DA8(v3, v2);
    sub_100016DA8(v3, v2);

    (*(void (**)(uint64_t, os_log_t))(v15 + 8))(v26, log);
    unint64_t v16 = v9;
  }
  uint64_t v17 = v0[4];
  swift_task_dealloc();
  *(void *)uint64_t v17 = v3;
  *(void *)(v17 + 8) = v2;
  *(void *)(v17 + 16) = v5;
  *(void *)(v17 + 24) = v4;
  *(void *)(v17 + 32) = v7;
  *(void *)(v17 + 40) = v16;
  *(unsigned char *)(v17 + 48) = v8;
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_100027030()
{
  uint64_t v14 = v0;
  sub_10003F850();
  sub_100027380(0, 0);
  sub_100027380(0, 0);
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[2] = sub_100016708(0x52746C7561666564, 0xEF2928746C757365, &v13);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    uint64_t v4 = v0[6];
    uint64_t v12 = v0[7];
    uint64_t v5 = v0[5];
    v0[3] = sub_100016708(0x3E6C696E3CLL, 0xE500000000000000, &v13);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    sub_100016DA8(0, 0);
    sub_100016DA8(0, 0);
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s returning: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v12, v5);
  }
  else
  {
    uint64_t v7 = v0[6];
    uint64_t v6 = v0[7];
    uint64_t v8 = v0[5];
    sub_100016DA8(0, 0);
    sub_100016DA8(0, 0);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  uint64_t v9 = v0[4];
  swift_task_dealloc();
  *(unsigned char *)(v9 + 48) = 0;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100027318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009B04(&qword_10004D050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100027380(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1000273D0()
{
  unint64_t result = qword_10004D088;
  if (!qword_10004D088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D088);
  }
  return result;
}

HomeEnergyWidgetsExtension::EnergyForecastWidget __swiftcall EnergyForecastWidget.init()()
{
  uint64_t v0 = (void *)0x8000000100041370;
  uint64_t v1 = 0xD000000000000014;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_100027440()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_10004D580 = result;
  return result;
}

uint64_t sub_100027468@<X0>(uint64_t a1@<X8>)
{
  uint64_t v172 = a1;
  uint64_t v2 = sub_100009B04(&qword_10004D168);
  __chkstk_darwin(v2 - 8);
  v126[1] = (char *)v126 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_10003F630();
  uint64_t v153 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  uint64_t v132 = (char *)v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009B04(&qword_10004D170);
  __chkstk_darwin(v5 - 8);
  uint64_t v131 = (char *)v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_10003F170();
  uint64_t v154 = *(void *)(v173 - 8);
  uint64_t v7 = __chkstk_darwin(v173);
  uint64_t v129 = (char *)v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v128 = (char *)v126 - v9;
  uint64_t v163 = sub_10003F290();
  uint64_t v133 = *(void *)(v163 - 8);
  __chkstk_darwin(v163);
  uint64_t v130 = (char *)v126 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_100009B04(&qword_10004D178);
  uint64_t v136 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v135 = (char *)v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_100009B04(&qword_10004D180);
  uint64_t v138 = *(void *)(v167 - 8);
  uint64_t v12 = __chkstk_darwin(v167);
  os_log_t v134 = (os_log_t)((char *)v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  uint64_t v137 = (char *)v126 - v14;
  uint64_t v170 = sub_100009B04(&qword_10004D188);
  __chkstk_darwin(v170);
  uint64_t v171 = (uint64_t)v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_100009B04(&qword_10004D190);
  __chkstk_darwin(v162);
  uint64_t v164 = (char *)v126 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_100009B04(&qword_10004D198);
  __chkstk_darwin(v169);
  uint64_t v165 = (char *)v126 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_10003F9C0();
  uint64_t v159 = *(void *)(v160 - 8);
  __chkstk_darwin(v160);
  uint64_t v158 = (char *)v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100009B04(&qword_10004CC90);
  __chkstk_darwin(v19 - 8);
  v152 = (char *)v126 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100009B04(&qword_10004CF48);
  __chkstk_darwin(v21 - 8);
  uint64_t v142 = (char *)v126 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100009B04(&qword_10004D1A0);
  __chkstk_darwin(v23 - 8);
  v141 = (char *)v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_10003F350();
  uint64_t v144 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  uint64_t v143 = (char *)v126 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_100009B04(&qword_10004D1A8);
  uint64_t v147 = *(void *)(v157 - 8);
  __chkstk_darwin(v157);
  uint64_t v146 = (char *)v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_100009B04(&qword_10004D1B0);
  uint64_t v149 = *(void *)(v161 - 8);
  uint64_t v27 = __chkstk_darwin(v161);
  uint64_t v145 = (char *)v126 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v148 = (char *)v126 - v29;
  uint64_t v30 = type metadata accessor for EnergyForecastWidgetEntryView();
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v127 = (uint64_t)v126 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)v126 - v34;
  uint64_t v36 = __chkstk_darwin(v33);
  uint64_t v38 = (char *)v126 - v37;
  __chkstk_darwin(v36);
  uint64_t v40 = (char *)v126 - v39;
  uint64_t v151 = sub_10003F890();
  uint64_t v150 = *(void *)(v151 - 8);
  uint64_t v41 = __chkstk_darwin(v151);
  unint64_t v43 = (char *)v126 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41);
  unint64_t v45 = (char *)v126 - v44;
  uint64_t v46 = sub_10003FAB0();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = __chkstk_darwin(v46);
  uint64_t v140 = (char *)v126 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v139 = (uint64_t)v126 - v51;
  __chkstk_darwin(v50);
  id v53 = (char *)v126 - v52;
  uint64_t v168 = v30;
  uint64_t v54 = *(int *)(v30 + 20);
  uint64_t v174 = v1;
  uint64_t v55 = v1 + v54;
  sub_100016194((uint64_t)v126 - v52);
  int v56 = (*(uint64_t (**)(char *, uint64_t))(v47 + 88))(v53, v46);
  if (v56 == enum case for WidgetFamily.systemSmall(_:) || v56 == enum case for WidgetFamily.systemMedium(_:))
  {
    LODWORD(v137) = enum case for WidgetFamily.systemSmall(_:);
    uint64_t v138 = v55;
    sub_10003F840();
    uint64_t v67 = v174;
    sub_10002C48C(v174, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
    sub_10002C48C(v67, (uint64_t)v38, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
    uint64_t v68 = sub_10003F870();
    os_log_type_t v69 = sub_10003FD50();
    int v70 = v69;
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v71 = swift_slowAlloc();
      uint64_t v136 = swift_slowAlloc();
      uint64_t v175 = v136;
      *(_DWORD *)uint64_t v71 = 136315394;
      os_log_t v134 = (os_log_t)(v71 + 4);
      LODWORD(v135) = v70;
      uint64_t v72 = v168;
      type metadata accessor for GridForecastEntry();
      sub_10002C444(&qword_10004D1D0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v73 = sub_10003FE50();
      uint64_t v180 = sub_100016708(v73, v74, &v175);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      os_log_t v134 = v68;
      sub_10002C3E4((uint64_t)v40, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      *(_WORD *)(v71 + 12) = 2080;
      uint64_t v133 = v71 + 14;
      sub_10003F310();
      sub_10002C444(&qword_10004D1D8, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
      uint64_t v75 = sub_10003FE50();
      uint64_t v180 = sub_100016708(v75, v76, &v175);
      sub_10003FD90();
      uint64_t v77 = v72;
      swift_bridgeObjectRelease();
      sub_10002C3E4((uint64_t)v38, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      os_log_t v78 = v134;
      _os_log_impl((void *)&_mh_execute_header, v134, (os_log_type_t)v135, "EnergyForecastWidgetEntryView: creating systemSmall/systemMedium widget for %s w/ forecastSnapshot %s", (uint8_t *)v71, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v150 + 8))(v45, v151);
    }
    else
    {
      sub_10002C3E4((uint64_t)v40, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      sub_10002C3E4((uint64_t)v38, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);

      (*(void (**)(char *, uint64_t))(v150 + 8))(v45, v151);
      uint64_t v77 = v168;
    }
    uint64_t v151 = sub_10003F5C0();
    uint64_t v150 = sub_10003F5B0();
    uint64_t v79 = v174 + *(int *)(v77 + 24);
    uint64_t v80 = v141;
    sub_10003F2E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v153 + 56))(v80, 0, 1, v155);
    uint64_t v81 = sub_10003F310();
    uint64_t v178 = (void *)v81;
    uint64_t v179 = sub_10002C444(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
    id v82 = sub_10002C248(&v175);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v81 - 8) + 16))(v82, v79, v81);
    uint64_t v83 = v79 + *(int *)(type metadata accessor for GridForecastEntry() + 24);
    uint64_t v84 = v154;
    unint64_t v85 = v142;
    uint64_t v86 = v173;
    (*(void (**)(char *, uint64_t, uint64_t))(v154 + 16))(v142, v83, v173);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v85, 0, 1, v86);
    uint64_t v87 = v139;
    sub_100016194(v139);
    unint64_t v88 = v140;
    (*(void (**)(char *, void, uint64_t))(v47 + 104))(v140, v137, v46);
    sub_10002C444(&qword_10004D1E8, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_10003FC70();
    sub_10003FC70();
    unint64_t v89 = *(void (**)(char *, uint64_t))(v47 + 8);
    v89(v88, v46);
    v89((char *)v87, v46);
    sub_100029A9C();
    uint64_t v90 = v143;
    sub_10003F340();
    sub_100028F14();
    uint64_t v91 = (uint64_t)v152;
    sub_10003F100();
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_10002C444(&qword_10004D1C0, (void (*)(uint64_t))&type metadata accessor for GridForecastWidgetView);
    id v93 = v146;
    uint64_t v94 = v156;
    sub_10003F9F0();
    sub_10000A34C(v91, &qword_10004CC90);
    (*(void (**)(char *, uint64_t))(v144 + 8))(v90, v94);
    uint64_t v95 = v158;
    sub_10003F9B0();
    sub_10003FA40();
    uint64_t v175 = v94;
    uint64_t v176 = (void *)v92;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v97 = v145;
    uint64_t v98 = v157;
    sub_10003FA30();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v95, v160);
    (*(void (**)(char *, uint64_t))(v147 + 8))(v93, v98);
    uint64_t v99 = v149;
    os_log_type_t v100 = v148;
    BOOL v101 = v97;
    uint64_t v102 = v161;
    (*(void (**)(char *, char *, uint64_t))(v149 + 32))(v148, v101, v161);
    (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v164, v100, v102);
    swift_storeEnumTagMultiPayload();
    uint64_t v175 = v98;
    uint64_t v176 = &type metadata for EmptyView;
    uint64_t v177 = OpaqueTypeConformance2;
    uint64_t v178 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    uint64_t v103 = sub_10002C444(&qword_10004D1C8, (void (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView);
    uint64_t v175 = v163;
    uint64_t v176 = (void *)v103;
    uint64_t v104 = swift_getOpaqueTypeConformance2();
    uint64_t v175 = v166;
    uint64_t v176 = &type metadata for EmptyView;
    uint64_t v177 = v104;
    uint64_t v178 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    uint64_t v105 = (uint64_t)v165;
    sub_10003F9A0();
    sub_10002C0D0(v105, v171);
    swift_storeEnumTagMultiPayload();
    sub_10002BF14();
    sub_10003F9A0();
    sub_10000A34C(v105, &qword_10004D198);
    return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v100, v102);
  }
  else if (v56 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    sub_10003F840();
    uint64_t v57 = v174;
    sub_10002C48C(v174, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
    uint64_t v58 = v127;
    sub_10002C48C(v57, v127, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
    unint64_t v59 = sub_10003F870();
    os_log_type_t v60 = sub_10003FD50();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = swift_slowAlloc();
      uint64_t v149 = swift_slowAlloc();
      uint64_t v175 = v149;
      *(_DWORD *)uint64_t v61 = 136315394;
      type metadata accessor for GridForecastEntry();
      sub_10002C444(&qword_10004D1D0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v62 = sub_10003FE50();
      uint64_t v180 = sub_100016708(v62, v63, &v175);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_10002C3E4((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      *(_WORD *)(v61 + 12) = 2080;
      sub_10003F310();
      sub_10002C444(&qword_10004D1D8, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
      uint64_t v64 = sub_10003FE50();
      uint64_t v180 = sub_100016708(v64, v65, &v175);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_10002C3E4(v58, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "EnergyForecastWidgetEntryView: creating accessoryRectangular widget for %s w/ forecastSnapshot %s", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy();
      uint64_t v66 = v173;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v150 + 8))(v43, v151);
    }
    else
    {
      sub_10002C3E4((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);
      sub_10002C3E4(v58, (uint64_t (*)(void))type metadata accessor for EnergyForecastWidgetEntryView);

      (*(void (**)(char *, uint64_t))(v150 + 8))(v43, v151);
      uint64_t v66 = v173;
    }
    uint64_t v107 = v174 + *(int *)(v168 + 24);
    uint64_t v108 = type metadata accessor for GridForecastEntry();
    v109 = *(void (**)(char *, uint64_t, uint64_t))(v154 + 16);
    v109(v128, v107 + *(int *)(v108 + 24), v66);
    v109(v129, v107 + *(int *)(v108 + 28), v66);
    uint64_t v110 = v132;
    sub_10003F2E0();
    sub_10003F600();
    (*(void (**)(char *, uint64_t))(v153 + 8))(v110, v155);
    sub_10003F300();
    uint64_t v111 = v130;
    sub_10003F280();
    sub_100028F14();
    uint64_t v112 = (uint64_t)v152;
    sub_10003F100();
    swift_bridgeObjectRelease();
    uint64_t v113 = sub_10002C444(&qword_10004D1C8, (void (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView);
    uint64_t v114 = v135;
    uint64_t v115 = v163;
    sub_10003F9F0();
    sub_10000A34C(v112, &qword_10004CC90);
    (*(void (**)(char *, uint64_t))(v133 + 8))(v111, v115);
    uint64_t v116 = v158;
    sub_10003F9B0();
    sub_10003FA40();
    uint64_t v175 = v115;
    uint64_t v176 = (void *)v113;
    uint64_t v117 = swift_getOpaqueTypeConformance2();
    os_log_t v118 = v134;
    uint64_t v119 = v166;
    sub_10003FA30();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v116, v160);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v114, v119);
    uint64_t v120 = v138;
    uint64_t v121 = v137;
    uint64_t v122 = v167;
    (*(void (**)(char *, os_log_t, uint64_t))(v138 + 32))(v137, v118, v167);
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v164, v121, v122);
    swift_storeEnumTagMultiPayload();
    uint64_t v123 = sub_10002C444(&qword_10004D1C0, (void (*)(uint64_t))&type metadata accessor for GridForecastWidgetView);
    uint64_t v175 = v156;
    uint64_t v176 = (void *)v123;
    uint64_t v124 = swift_getOpaqueTypeConformance2();
    uint64_t v175 = v157;
    uint64_t v176 = &type metadata for EmptyView;
    uint64_t v177 = v124;
    uint64_t v178 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    uint64_t v175 = v119;
    uint64_t v176 = &type metadata for EmptyView;
    uint64_t v177 = v117;
    uint64_t v178 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2();
    uint64_t v125 = (uint64_t)v165;
    sub_10003F9A0();
    sub_10002C0D0(v125, v171);
    swift_storeEnumTagMultiPayload();
    sub_10002BF14();
    sub_10003F9A0();
    sub_10000A34C(v125, &qword_10004D198);
    return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v122);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_10002BF14();
    sub_10003F9A0();
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v53, v46);
  }
}

unint64_t sub_100028F14()
{
  uint64_t v1 = sub_100009B04(&qword_10004CAF0);
  __chkstk_darwin(v1 - 8);
  uint64_t v71 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = type metadata accessor for ForecastLocationEntity();
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v67 = (uint64_t)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F890();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v73 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v68 = (char *)&v66 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v66 - v10;
  uint64_t v12 = sub_10003F430();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (id *)((char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v66 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v66 - v20;
  uint64_t v83 = 0;
  unint64_t v84 = 0xE000000000000000;
  uint64_t v69 = v0 + *(int *)(type metadata accessor for EnergyForecastWidgetEntryView() + 24);
  sub_10003F2F0();
  sub_10003F840();
  uint64_t v79 = v13;
  uint64_t v80 = v21;
  uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v75(v19, v21, v12);
  uint64_t v22 = sub_10003F870();
  os_log_type_t v23 = sub_10003FD50();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v77 = v4;
  uint64_t v78 = v5;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    v82[0] = v66;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v81 = sub_100016708(0x525568636E75616CLL, 0xE90000000000004CLL, v82);
    sub_10003FD90();
    *(_WORD *)(v25 + 12) = 2080;
    unint64_t v76 = (void (*)(char *, uint64_t))(v25 + 14);
    sub_10002C444(&qword_10004D1F8, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshotType);
    uint64_t v26 = sub_10003FE50();
    uint64_t v81 = sub_100016708(v26, v27, v82);
    uint64_t v4 = v77;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    uint64_t v28 = v79;
    unint64_t v76 = *(void (**)(char *, uint64_t))(v79 + 8);
    v76(v19, v12);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s creating launchURL with snapshot type: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v78;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v28 = v79;
    unint64_t v76 = *(void (**)(char *, uint64_t))(v79 + 8);
    v76(v19, v12);
  }

  uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  v29(v11, v4);
  uint64_t v30 = (void (*)(id *, char *, uint64_t))v75;
  uint64_t v31 = (void *)sub_10003F740();
  v30(v16, v80, v12);
  int v32 = (*(uint64_t (**)(id *, uint64_t))(v28 + 88))(v16, v12);
  uint64_t v74 = v12;
  uint64_t v75 = (void (*)(char *, char *, uint64_t))v29;
  if (v32 == enum case for GridForecastSnapshotType.currentLocation(_:))
  {
    (*(void (**)(id *, uint64_t))(v28 + 96))(v16, v12);
    id v33 = *v16;
    if (*v16)
    {

      uint64_t v31 = v33;
    }
    goto LABEL_12;
  }
  if (v32 != enum case for GridForecastSnapshotType.fixedLocation(_:))
  {
    v76((char *)v16, v12);
LABEL_12:
    sub_100009B04(&qword_10004CCE0);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_100040B20;
    *(void *)(v44 + 56) = &type metadata for String;
    unint64_t v45 = sub_100016EA8();
    *(void *)(v44 + 64) = v45;
    *(void *)(v44 + 32) = 0xD000000000000039;
    *(void *)(v44 + 40) = 0x8000000100043370;
    [v31 coordinate];
    *(void *)(v44 + 96) = &type metadata for Double;
    *(void *)(v44 + 104) = &protocol witness table for Double;
    *(void *)(v44 + 72) = v46;
    uint64_t v72 = (uint64_t)v31;
    [v31 coordinate];
    *(void *)(v44 + 136) = &type metadata for Double;
    *(void *)(v44 + 144) = &protocol witness table for Double;
    *(void *)(v44 + 112) = v47;
    sub_10003FC20();
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_100040DF0;
    *(void *)(v48 + 56) = &type metadata for String;
    *(void *)(v48 + 64) = v45;
    *(void *)(v48 + 32) = 0xD000000000000039;
    *(void *)(v48 + 40) = 0x8000000100043370;
    uint64_t v49 = sub_10003FC20();
    unint64_t v51 = v50;
    swift_bridgeObjectRelease();
    uint64_t v52 = 2;
    uint64_t v4 = v77;
LABEL_13:
    id v53 = v73;
    uint64_t v83 = v49;
    unint64_t v84 = v51;
    qword_10004D0A0 = v52;
    sub_10003F840();
    swift_bridgeObjectRetain_n();
    uint64_t v54 = sub_10003F870();
    os_log_type_t v55 = sub_10003FD20();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = swift_slowAlloc();
      v82[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136315394;
      uint64_t v81 = sub_100016708(0x525568636E75616CLL, 0xE90000000000004CLL, v82);
      sub_10003FD90();
      *(_WORD *)(v56 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_100016708(v49, v51, v82);
      sub_10003FD90();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "%s launchURL is: %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(char *, uint64_t))v75)(v53, v4);
    uint64_t v57 = v74;
    uint64_t v58 = (void *)v72;
    sub_10002C2AC();

    v76(v80, v57);
    swift_beginAccess();
    return v83;
  }
  (*(void (**)(id *, uint64_t))(v28 + 96))(v16, v12);

  swift_bridgeObjectRelease();
  uint64_t v34 = sub_100009B04(&qword_10004D1F0);
  sub_10000A34C((uint64_t)v16 + *(int *)(v34 + 64), &qword_10004CB30);
  type metadata accessor for GridForecastEntry();
  uint64_t v35 = (uint64_t)v71;
  sub_10003EFB0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v35, 1, v72) != 1)
  {
    uint64_t v72 = (uint64_t)v31;
    uint64_t v60 = v67;
    sub_10002C540(v35, v67, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
    sub_100009B04(&qword_10004CCE0);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_1000405A0;
    *(void *)(v61 + 56) = &type metadata for String;
    unint64_t v62 = sub_100016EA8();
    *(void *)(v61 + 64) = v62;
    *(void *)(v61 + 32) = 0xD000000000000039;
    *(void *)(v61 + 40) = 0x8000000100043370;
    uint64_t v63 = sub_10003F190();
    *(void *)(v61 + 96) = &type metadata for String;
    *(void *)(v61 + 104) = v62;
    *(void *)(v61 + 72) = v63;
    *(void *)(v61 + 80) = v64;
    uint64_t v49 = sub_10003FC20();
    unint64_t v51 = v65;
    sub_10002C3E4(v60, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
    uint64_t v52 = 1;
    goto LABEL_13;
  }
  uint64_t v36 = v31;
  unint64_t v37 = 0xD000000000000039;
  sub_10000A34C(v35, &qword_10004CAF0);
  uint64_t v38 = v68;
  sub_10003F840();
  uint64_t v39 = sub_10003F870();
  os_log_type_t v40 = sub_10003FD30();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    v82[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 136315138;
    uint64_t v81 = sub_100016708(0x525568636E75616CLL, 0xE90000000000004CLL, v82);
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "%s launchURL error: No Home found", v41, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v75)(v38, v4);
    uint64_t v42 = v80;
    uint64_t v43 = v74;
  }
  else
  {

    v29(v38, v4);
    uint64_t v42 = v80;
    uint64_t v43 = v12;
  }
  v76(v42, v43);
  return v37;
}

uint64_t sub_100029A9C()
{
  uint64_t v0 = sub_10003F890();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F1D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009B04(&qword_10004CAF0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004C758 != -1) {
    swift_once();
  }
  if (byte_10004D580 != 1) {
    return 0;
  }
  id v11 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v12 = sub_10003FC00();
  id v13 = [v11 initWithSuiteName:v12];

  if (!v13) {
    return 0;
  }
  uint64_t v25 = v1;
  NSString v14 = sub_10003FC00();
  unsigned int v15 = [v13 BOOLForKey:v14];

  if (!v15)
  {

    return 0;
  }
  type metadata accessor for EnergyForecastWidgetEntryView();
  type metadata accessor for GridForecastEntry();
  sub_10003EFB0();
  uint64_t v16 = type metadata accessor for ForecastLocationEntity();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v10, 1, v16))
  {

    sub_10000A34C((uint64_t)v10, &qword_10004CAF0);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v10[*(int *)(v16 + 20)], v4);
  sub_10000A34C((uint64_t)v10, &qword_10004CAF0);
  uint64_t v17 = sub_10003F190();
  unint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10003F840();
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_10003F870();
  os_log_type_t v22 = sub_10003FD20();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v27 = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v26 = sub_100016708(0x7865546775626564, 0xE900000000000074, &v27);
    sub_10003FD90();
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100016708(v17, v20, &v27);
    sub_10003FD90();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "EnergyForecastWidgetEntryView:%s will show debug text: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v0);
  return v17;
}

uint64_t sub_100029F80()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_10003FC00();
  [v0 initWithSuiteName:v1];

  uint64_t result = sub_10003F8A0();
  qword_10004D098 = result;
  return result;
}

uint64_t EnergyForecastWidget.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v1 = sub_100009B04(&qword_10004C7E0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100009B04(&qword_10004D0A8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v44 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004D0B0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  uint64_t v47 = v10;
  __chkstk_darwin(v9);
  NSString v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009B04(&qword_10004D0B8);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v48 = v13;
  uint64_t v49 = v14;
  __chkstk_darwin(v13);
  unint64_t v45 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EnergyForecastWidgetEntryView();
  sub_10002C444(&qword_10004D0C0, (void (*)(uint64_t))type metadata accessor for EnergyForecastWidgetEntryView);
  sub_10002A7F0();
  swift_bridgeObjectRetain();
  sub_10003FB10();
  unint64_t v16 = sub_10002A844();
  sub_10003F980();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_10003F950();
  uint64_t v17 = sub_10003F9E0();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v51 = v1;
  unint64_t v52 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v43;
  sub_10003F990();
  sub_100014DC4(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v23);
  sub_10003F950();
  uint64_t v25 = sub_10003F9E0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  uint64_t v51 = v24;
  unint64_t v52 = OpaqueTypeConformance2;
  uint64_t v30 = swift_getOpaqueTypeConformance2();
  int v32 = v45;
  uint64_t v31 = v46;
  sub_10003F960();
  sub_100014DC4(v25, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v31);
  sub_100009B04(&qword_10004CB88);
  uint64_t v33 = sub_10003FAB0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void *)(v34 + 72);
  unint64_t v36 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_100040B20;
  unint64_t v38 = v37 + v36;
  uint64_t v39 = *(void (**)(unint64_t, void, uint64_t))(v34 + 104);
  v39(v37 + v36, enum case for WidgetFamily.accessoryRectangular(_:), v33);
  v39(v38 + v35, enum case for WidgetFamily.systemSmall(_:), v33);
  v39(v38 + 2 * v35, enum case for WidgetFamily.systemMedium(_:), v33);
  uint64_t v51 = v31;
  unint64_t v52 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v48;
  sub_10003F970();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v32, v40);
}

uint64_t sub_10002A680@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for GridForecastEntry();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002C48C(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
  *a2 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB90);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = type metadata accessor for EnergyForecastWidgetEntryView();
  uint64_t v8 = (uint64_t *)((char *)a2 + *(int *)(v7 + 20));
  *uint64_t v8 = swift_getKeyPath();
  sub_100009B04(&qword_10004CB98);
  swift_storeEnumTagMultiPayload();
  return sub_10002C540((uint64_t)v6, (uint64_t)a2 + *(int *)(v7 + 24), (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
}

uint64_t type metadata accessor for EnergyForecastWidgetEntryView()
{
  uint64_t result = qword_10004D128;
  if (!qword_10004D128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10002A7F0()
{
  unint64_t result = qword_10004D0C8;
  if (!qword_10004D0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D0C8);
  }
  return result;
}

unint64_t sub_10002A844()
{
  unint64_t result = qword_10004C7E8;
  if (!qword_10004C7E8)
  {
    sub_100009B48(&qword_10004C7E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004C7E8);
  }
  return result;
}

uint64_t sub_10002A8A0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10002A8BC(void *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x8000000100041370;
}

uint64_t sub_10002A8DC@<X0>(uint64_t a1@<X8>)
{
  return EnergyForecastWidget.body.getter(a1);
}

ValueMetadata *type metadata accessor for EnergyForecastWidget()
{
  return &type metadata for EnergyForecastWidget;
}

uint64_t sub_10002A8F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_10002A9F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_10003F310();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = (int *)type metadata accessor for GridForecastEntry();
    uint64_t v18 = v17[5];
    long long v19 = *(_OWORD *)&v15[v18 + 24];
    *(_OWORD *)&v14[v18 + 24] = v19;
    (**(void (***)(void))(v19 - 8))();
    uint64_t v20 = v17[6];
    char v21 = &v14[v20];
    os_log_type_t v22 = &v15[v20];
    uint64_t v23 = sub_10003F170();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    v24(v21, v22, v23);
    v24(&v14[v17[7]], &v15[v17[7]], v23);
    *(void *)&v14[v17[8]] = *(void *)&v15[v17[8]];
  }
  swift_retain();
  return a1;
}

uint64_t sub_10002ACD0(uint64_t a1, uint64_t a2)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_10003FAA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = (int *)type metadata accessor for GridForecastEntry();
  sub_100016DF8(v7 + v9[5]);
  uint64_t v10 = v7 + v9[6];
  uint64_t v11 = sub_10003F170();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(v7 + v9[7], v11);

  return swift_release();
}

void *sub_10002AEA0(void *a1, void *a2, uint64_t a3)
{
  sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10003FAA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10003FAB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F310();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = (int *)type metadata accessor for GridForecastEntry();
  uint64_t v16 = v15[5];
  long long v17 = *(_OWORD *)&v13[v16 + 24];
  *(_OWORD *)&v12[v16 + 24] = v17;
  (**(void (***)(void))(v17 - 8))();
  uint64_t v18 = v15[6];
  long long v19 = &v12[v18];
  uint64_t v20 = &v13[v18];
  uint64_t v21 = sub_10003F170();
  os_log_type_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
  v22(v19, v20, v21);
  v22(&v12[v15[7]], &v13[v15[7]], v21);
  *(void *)&v12[v15[8]] = *(void *)&v13[v15[8]];
  swift_retain();
  return a1;
}

void *sub_10002B130(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10003FAA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_10000A34C((uint64_t)a1 + v7, &qword_10004CB98);
    sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10003FAB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_10003F310();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = (int *)type metadata accessor for GridForecastEntry();
  sub_10002B3B0((uint64_t *)&v12[v15[5]], (uint64_t *)&v13[v15[5]]);
  uint64_t v16 = v15[6];
  long long v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_10003F170();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(&v12[v15[7]], &v13[v15[7]], v19);
  *(void *)&v12[v15[8]] = *(void *)&v13[v15[8]];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_10002B3B0(uint64_t *result, uint64_t *a2)
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

char *sub_10002B5E0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CB90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10003FAA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  int v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100009B04(&qword_10004CB98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10003FAB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F310();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  long long v17 = (int *)type metadata accessor for GridForecastEntry();
  uint64_t v18 = v17[5];
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  long long v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *((void *)v19 + 4) = *((void *)v20 + 4);
  uint64_t v22 = v17[6];
  uint64_t v23 = &v14[v22];
  uint64_t v24 = &v15[v22];
  uint64_t v25 = sub_10003F170();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32);
  v26(v23, v24, v25);
  v26(&v14[v17[7]], &v15[v17[7]], v25);
  *(void *)&v14[v17[8]] = *(void *)&v15[v17[8]];
  return a1;
}

char *sub_10002B844(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A34C((uint64_t)a1, &qword_10004CB90);
    uint64_t v6 = sub_100009B04(&qword_10004CB90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10003FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    int v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_10000A34C((uint64_t)&a1[v8], &qword_10004CB98);
    uint64_t v11 = sub_100009B04(&qword_10004CB98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10003FAB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_10003F310();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  long long v17 = (int *)type metadata accessor for GridForecastEntry();
  uint64_t v18 = v17[5];
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  sub_100016DF8((uint64_t)&v14[v18]);
  long long v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *((void *)v19 + 4) = *((void *)v20 + 4);
  uint64_t v22 = v17[6];
  uint64_t v23 = &v14[v22];
  uint64_t v24 = &v15[v22];
  uint64_t v25 = sub_10003F170();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40);
  v26(v23, v24, v25);
  v26(&v14[v17[7]], &v15[v17[7]], v25);
  *(void *)&v14[v17[8]] = *(void *)&v15[v17[8]];
  swift_release();
  return a1;
}

uint64_t sub_10002BAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BAF4);
}

uint64_t sub_10002BAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009B04(&qword_10004CBA0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100009B04(&qword_10004CBA8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for GridForecastEntry();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_10002BC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BC5C);
}

uint64_t sub_10002BC5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100009B04(&qword_10004CBA0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100009B04(&qword_10004CBA8);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for GridForecastEntry();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_10002BDBC()
{
  sub_100016124(319, &qword_10004CC18, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F)
  {
    sub_100016124(319, (unint64_t *)&unk_10004CC20, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v1 <= 0x3F)
    {
      type metadata accessor for GridForecastEntry();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_10002BEF8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10002BF14()
{
  unint64_t result = qword_10004D1B8;
  if (!qword_10004D1B8)
  {
    sub_100009B48(&qword_10004D198);
    sub_100009B48(&qword_10004D1A8);
    sub_10003F350();
    sub_10002C444(&qword_10004D1C0, (void (*)(uint64_t))&type metadata accessor for GridForecastWidgetView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100009B48(&qword_10004D178);
    sub_10003F290();
    sub_10002C444(&qword_10004D1C8, (void (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D1B8);
  }
  return result;
}

uint64_t sub_10002C0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009B04(&qword_10004D198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C138()
{
  return sub_10003F900();
}

uint64_t sub_10002C15C()
{
  return sub_10003F910();
}

uint64_t sub_10002C180(uint64_t a1)
{
  uint64_t v2 = sub_10003FAA0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10003F920();
}

uint64_t *sub_10002C248(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10002C2AC()
{
  if (qword_10004C760 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10003F8B0();
  uint64_t result = swift_release();
  if (v1 == 1)
  {
    if (qword_10004D0A0 != 2) {
      return result;
    }
    [self saveWidgetSettingsEvent:52 withLocation:2];
    swift_retain();
  }
  else
  {
    if (qword_10004D0A0 != 1) {
      return result;
    }
    [self saveWidgetSettingsEvent:52 withLocation:1];
    swift_retain();
  }
  sub_10003F8C0();
  return swift_release();
}

uint64_t sub_10002C3E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002C444(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002C48C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002C4F4()
{
  return sub_10003F910();
}

uint64_t sub_10002C51C()
{
  return sub_10003F900();
}

uint64_t sub_10002C540(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10002C5AC()
{
  unint64_t result = qword_10004D200;
  if (!qword_10004D200)
  {
    sub_100009B48(&qword_10004D208);
    sub_10002BF14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D200);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyForecastTimelineProvider()
{
  return &type metadata for EnergyForecastTimelineProvider;
}

char *sub_10002C638(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10003F310();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    long long v9 = *(_OWORD *)&a2[v8 + 24];
    *(_OWORD *)&a1[v8 + 24] = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = a3[6];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = sub_10003F170();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v14(&a1[a3[7]], &a2[a3[7]], v13);
    *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  }
  swift_retain();
  return a1;
}

uint64_t sub_10002C7D0(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_100016DF8(a1 + a2[5]);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_10003F170();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[7], v6);

  return swift_release();
}

uint64_t sub_10002C8BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_10003F170();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v13(a1 + a3[7], a2 + a3[7], v12);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  return a1;
}

uint64_t sub_10002CA08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  sub_10002B3B0((uint64_t *)(a1 + a3[5]), (uint64_t *)(a2 + a3[5]));
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F170();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10002CB1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = sub_10003F170();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(a1 + a3[7], a2 + a3[7], v14);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10002CC28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10003F310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_100016DF8(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_10003F170();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(a1 + a3[7], a2 + a3[7], v14);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_10002CD48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002CD5C);
}

uint64_t sub_10002CD5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F310();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_10003F170();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10002CE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002CEA0);
}

uint64_t sub_10002CEA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10003F310();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_10003F170();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for GridForecastEntry()
{
  uint64_t result = qword_10004D268;
  if (!qword_10004D268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002D01C()
{
  uint64_t result = sub_10003F310();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10003F170();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_10002D0FC(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_10003FE10())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)sub_10003FDE0() : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10002D224@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = sub_10003F170();
  uint64_t v2 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v39 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009B04(&qword_10004CF48);
  __chkstk_darwin(v4 - 8);
  uint64_t v44 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003F610();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v41 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003F310();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v42 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v13 = (char *)&v34 - v12;
  uint64_t v40 = sub_10003F890();
  uint64_t v14 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F840();
  uint64_t v17 = sub_10003F870();
  os_log_type_t v18 = sub_10003FD50();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v38 = a1;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v37 = v2;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v36 = v6;
    *(void *)&long long v47 = v21;
    uint64_t v35 = v7;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v46 = sub_100016708(0xD000000000000010, 0x8000000100043560, (uint64_t *)&v47);
    a1 = v38;
    uint64_t v7 = v35;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s Generating placeholder with mock data.", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = v36;
    swift_slowDealloc();
    uint64_t v2 = v37;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v40);
  uint64_t v22 = v41;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v41, enum case for EnergyWindows.MockType.widgetSnapshot(_:), v6);
  sub_10003F2B0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v22, v6);
  uint64_t v24 = v42;
  uint64_t v23 = v43;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v25(v42, v13, v9);
  uint64_t v48 = v9;
  uint64_t v49 = sub_1000355E4(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
  uint64_t v26 = sub_10002C248((uint64_t *)&v47);
  v25((char *)v26, v13, v9);
  uint64_t v27 = v44;
  sub_10003F760();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v27, 1, v45);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    char v29 = v39;
    sub_10003F140();
    uint64_t v30 = sub_10001216C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v24, v9);
    uint64_t v31 = (int *)type metadata accessor for GridForecastEntry();
    sub_1000355CC(&v47, a1 + v31[5]);
    int v32 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
    uint64_t v33 = v45;
    v32(a1 + v31[6], v27, v45);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(a1 + v31[7], v29, v33);
    *(void *)(a1 + v31[8]) = v30;
  }
  return result;
}

uint64_t sub_10002D7B0(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = sub_10003F170();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  sub_100009B04(&qword_10004CF48);
  v2[14] = swift_task_alloc();
  uint64_t v4 = sub_10003F610();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v5 = sub_10003F310();
  v2[18] = v5;
  v2[19] = *(void *)(v5 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  uint64_t v6 = sub_10003F890();
  v2[22] = v6;
  v2[23] = *(void *)(v6 - 8);
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_10002D9C4, 0, 0);
}

uint64_t sub_10002D9C4()
{
  uint64_t v41 = v0;
  uint64_t v39 = v0 + 2;
  sub_10003F840();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v35 = v0[23];
    uint64_t v36 = v0[22];
    uint64_t v37 = v0[24];
    uint64_t v3 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[7] = sub_100016708(0xD000000000000011, 0x8000000100043540, &v40);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_10000F260();
    unint64_t v6 = v5;
    swift_release();
    v0[8] = sub_100016708(v4, v6, &v40);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
  }
  else
  {
    uint64_t v8 = v0[23];
    uint64_t v7 = v0[24];
    uint64_t v9 = v0[22];
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v10 = (uint64_t *)v0[20];
  uint64_t v11 = v0[21];
  uint64_t v12 = v0[18];
  uint64_t v13 = v0[19];
  uint64_t v14 = v0[16];
  uint64_t v15 = v0[17];
  uint64_t v16 = v0[14];
  uint64_t v17 = v0[15];
  uint64_t v18 = v0[12];
  uint64_t v38 = v0[11];
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v15, enum case for EnergyWindows.MockType.widgetSnapshot(_:), v17);
  sub_10003F2B0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v17);
  uint64_t v19 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 16);
  v19(v10, v11, v12);
  v0[5] = v12;
  v0[6] = sub_1000355E4(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
  uint64_t v20 = sub_10002C248(v39);
  v19(v20, v11, v12);
  sub_10003F760();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v38);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = v0[20];
    uint64_t v22 = v0[21];
    uint64_t v24 = v0[18];
    uint64_t v25 = v0[19];
    uint64_t v26 = v0[14];
    uint64_t v34 = v0[13];
    uint64_t v28 = v0[11];
    uint64_t v27 = v0[12];
    uint64_t v29 = v0[9];
    uint64_t v30 = v0[10];
    sub_10003F140();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v24);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v29, v23, v24);
    uint64_t v31 = (int *)type metadata accessor for GridForecastEntry();
    sub_1000355CC((long long *)v39, v29 + v31[5]);
    int v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
    v32(v29 + v31[6], v26, v28);
    v32(v29 + v31[7], v34, v28);
    *(void *)(v29 + v31[8]) = v30;
    swift_retain();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = (uint64_t (*)(void))v0[1];
    return v33();
  }
  return result;
}

uint64_t sub_10002DE24(uint64_t a1, uint64_t a2)
{
  v2[21] = a1;
  v2[22] = a2;
  uint64_t v3 = sub_10003F250();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v4 = sub_10003F260();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  sub_100009B04(&qword_10004CF48);
  v2[29] = swift_task_alloc();
  uint64_t v5 = sub_10003F170();
  v2[30] = v5;
  v2[31] = *(void *)(v5 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  uint64_t v6 = sub_10003F630();
  v2[36] = v6;
  v2[37] = *(void *)(v6 - 8);
  v2[38] = swift_task_alloc();
  uint64_t v7 = sub_10003FB00();
  v2[39] = v7;
  v2[40] = *(void *)(v7 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for GridForecastEntry();
  v2[43] = v8;
  v2[44] = *(void *)(v8 - 8);
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  sub_100009B04(&qword_10004D168);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  uint64_t v9 = sub_10003F2A0();
  v2[51] = v9;
  v2[52] = *(void *)(v9 - 8);
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  uint64_t v10 = sub_10003F310();
  v2[56] = v10;
  v2[57] = *(void *)(v10 - 8);
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  uint64_t v11 = sub_10003F890();
  v2[60] = v11;
  v2[61] = *(void *)(v11 - 8);
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  v2[65] = swift_task_alloc();
  v2[66] = swift_task_alloc();
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  return _swift_task_switch(sub_10002E30C, 0, 0);
}

uint64_t sub_10002E30C()
{
  uint64_t v19 = v0;
  sub_10003F840();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v15 = v0[61];
    uint64_t v16 = v0[60];
    uint64_t v17 = v0[68];
    uint64_t v3 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[19] = sub_100016708(0xD000000000000011, 0x8000000100043490, &v18);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_10000F260();
    unint64_t v6 = v5;
    swift_release();
    v0[20] = sub_100016708(v4, v6, &v18);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s resolving forecastSnapshot type for configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v7(v17, v16);
  }
  else
  {
    uint64_t v8 = v0[68];
    uint64_t v9 = v0[60];
    uint64_t v10 = v0[61];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[69] = v7;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[70] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10002E5A0;
  uint64_t v12 = v0[59];
  uint64_t v13 = v0[22];
  return sub_10002FFE0(v12, v13);
}

uint64_t sub_10002E5A0()
{
  *(void *)(*(void *)v1 + 568) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_10002F9C4;
  }
  else {
    os_log_type_t v2 = sub_10002E6B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002E6B4()
{
  uint64_t v149 = v0;
  uint64_t v1 = v0[51];
  uint64_t v2 = v0[52];
  uint64_t v3 = v0[50];
  sub_10003F300();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = v0[37];
    uint64_t v4 = v0[38];
    uint64_t v6 = v0[36];
    sub_10000A34C(v0[50], &qword_10004D168);
    sub_10003F2E0();
    uint64_t v7 = sub_10003F620();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    if (v7)
    {
      uint64_t v140 = *(void *)(v7 + 16);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v140 = 0;
    }
    sub_10003F840();
    uint64_t v41 = sub_10003F870();
    os_log_type_t v42 = sub_10003FD50();
    BOOL v43 = os_log_type_enabled(v41, v42);
    uint64_t v44 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v45 = v0[66];
    uint64_t v46 = v0[60];
    if (v43)
    {
      uint64_t v47 = swift_slowAlloc();
      v148[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136315394;
      v0[14] = sub_100016708(0xD000000000000011, 0x8000000100043490, v148);
      sub_10003FD90();
      *(_WORD *)(v47 + 12) = 2048;
      v0[15] = v140;
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%s: retrieved %ld windows", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v44(v45, v46);
    }
    else
    {

      v44(v45, v46);
    }
    uint64_t v49 = v0[34];
    uint64_t v48 = v0[35];
    uint64_t v50 = v0[30];
    uint64_t v51 = v0[31];
    v0[7] = _swiftEmptyArrayStorage;
    sub_10003F160();
    sub_10003F840();
    os_log_t v118 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
    v118(v49, v48, v50);
    unint64_t v52 = sub_10003F870();
    os_log_type_t v53 = sub_10003FD50();
    BOOL v54 = os_log_type_enabled(v52, v53);
    os_log_type_t v55 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v56 = v0[65];
    uint64_t v57 = v0[60];
    uint64_t v58 = v0[34];
    uint64_t v59 = v0[31];
    if (v54)
    {
      uint64_t v146 = v0[30];
      uint64_t v60 = swift_slowAlloc();
      v148[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = 136315394;
      v0[12] = sub_100016708(0xD000000000000011, 0x8000000100043490, v148);
      sub_10003FD90();
      *(_WORD *)(v60 + 12) = 2080;
      uint64_t v61 = sub_10003F150();
      v0[13] = sub_100016708(v61, v62, v148);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v63 = (void (**)(uint64_t, uint64_t))(v59 + 8);
      uint64_t v64 = v146;
      uint64_t v147 = *v63;
      (*v63)(v58, v64);
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "-------- %s creating 60 mins of entries, starting at %s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v55(v56, v57);
    }
    else
    {
      uint64_t v147 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      v147(v58, v0[30]);

      v55(v56, v57);
    }
    uint64_t v116 = (int *)v0[43];
    uint64_t v117 = v0[44];
    uint64_t v65 = v0[31];
    uint64_t v66 = v0[24];
    unsigned int typea = enum case for Calendar.Component.minute(_:);
    uint64_t v122 = (void (**)(uint64_t, uint64_t))(v66 + 8);
    uint64_t v124 = (void (**)(uint64_t, void, uint64_t))(v66 + 104);
    uint64_t v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
    os_log_t log = (os_log_t)(v0[27] + 8);
    uint64_t v114 = (void (**)(uint64_t, uint64_t, uint64_t))(v0[57] + 16);
    uint64_t v115 = (void (**)(uint64_t, void, uint64_t))(v65 + 32);
    uint64_t v113 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v67 = -5;
    do
    {
      uint64_t v144 = v67;
      uint64_t v69 = v0[29];
      uint64_t v68 = v0[30];
      uint64_t v70 = v0[28];
      uint64_t v72 = v0[25];
      uint64_t v71 = v0[26];
      uint64_t v73 = v0[23];
      sub_10003F240();
      (*v124)(v72, typea, v73);
      sub_10003F230();
      (*v122)(v72, v73);
      ((void (*)(uint64_t, uint64_t))log->isa)(v70, v71);
      uint64_t result = (*v120)(v69, 1, v68);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v75 = v0[59];
      uint64_t v76 = v0[56];
      uint64_t v77 = v0[47];
      uint64_t v138 = v0[46];
      uint64_t v78 = v0[33];
      uint64_t v142 = v0[32];
      uint64_t v79 = v0[30];
      uint64_t v132 = v0[22];
      uint64_t v133 = v0[35];
      (*v115)(v78, v0[29], v79);
      uint64_t v80 = *v114;
      (*v114)(v77, v75, v76);
      uint64_t v81 = (uint64_t *)(v77 + v116[5]);
      v81[3] = v76;
      v81[4] = sub_1000355E4(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
      id v82 = sub_10002C248(v81);
      v80((uint64_t)v82, v75, v76);
      v118(v77 + v116[6], v78, v79);
      v118(v77 + v116[7], v133, v79);
      *(void *)(v77 + v116[8]) = v132;
      swift_retain();
      sub_10003F840();
      sub_100035568(v77, v138);
      v118(v142, v78, v79);
      uint64_t v83 = sub_10003F870();
      os_log_type_t v84 = sub_10003FD50();
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v139 = v0[64];
        uint64_t v143 = (void (*)(uint64_t, uint64_t))v0[69];
        uint64_t v85 = v0[46];
        uint64_t v86 = v0[32];
        uint64_t v134 = v0[30];
        uint64_t v137 = v0[60];
        uint64_t v87 = swift_slowAlloc();
        v148[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v87 = 136315394;
        unint64_t v88 = sub_1000333DC();
        v0[10] = sub_100016708(v88, v89, v148);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        sub_100035694(v85, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
        *(_WORD *)(v87 + 12) = 2080;
        uint64_t v90 = sub_10003F150();
        v0[11] = sub_100016708(v90, v91, v148);
        sub_10003FD90();
        swift_bridgeObjectRelease();
        v147(v86, v134);
        _os_log_impl((void *)&_mh_execute_header, v83, v84, "\t\t- %s created for %s", (uint8_t *)v87, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v143(v139, v137);
        uint64_t v113 = (void (*)(uint64_t, uint64_t))v0[69];
      }
      else
      {
        uint64_t v92 = v0[64];
        uint64_t v93 = v0[60];
        uint64_t v94 = v0[32];
        uint64_t v95 = v0[30];
        sub_100035694(v0[46], (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
        v147(v94, v95);

        v113(v92, v93);
      }
      sub_100035568(v0[47], v0[45]);
      unint64_t v96 = v0[7];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v96 = sub_100034610(0, *(void *)(v96 + 16) + 1, 1, v96, &qword_10004D2E0, (uint64_t (*)(void))type metadata accessor for GridForecastEntry, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
      }
      unint64_t v98 = *(void *)(v96 + 16);
      unint64_t v97 = *(void *)(v96 + 24);
      if (v98 >= v97 >> 1) {
        unint64_t v96 = sub_100034610(v97 > 1, v98 + 1, 1, v96, &qword_10004D2E0, (uint64_t (*)(void))type metadata accessor for GridForecastEntry, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
      }
      uint64_t v99 = v0[47];
      uint64_t v100 = v0[45];
      uint64_t v101 = v0[33];
      uint64_t v102 = v0[30];
      *(void *)(v96 + 16) = v98 + 1;
      sub_10003562C(v100, v96+ ((*(unsigned __int8 *)(v117 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80))+ *(void *)(v117 + 72) * v98, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
      v0[7] = v96;
      sub_100035694(v99, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
      v147(v101, v102);
      uint64_t v67 = v144 + 5;
    }
    while ((unint64_t)(v144 + 5) < 0x37);
    sub_10003F840();
    uint64_t v103 = v0[7];
    swift_bridgeObjectRetain();
    uint64_t v104 = sub_10003F870();
    os_log_type_t v105 = sub_10003FD50();
    if (os_log_type_enabled(v104, v105))
    {
      unint64_t v106 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v106 = 134217984;
      v0[9] = *(void *)(v103 + 16);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v104, v105, "-------- %ld entries created, creating timeline...", v106, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v107 = v0[59];
    uint64_t v108 = v0[56];
    uint64_t v109 = v0[57];
    uint64_t v110 = v0[35];
    uint64_t v111 = v0[30];
    ((void (*)(void, void))v0[69])(v0[63], v0[60]);
    swift_beginAccess();
    sub_10003FAE0();
    sub_1000355E4(qword_10004D2B0, (void (*)(uint64_t))type metadata accessor for GridForecastEntry);
    sub_10003FB70();
    v147(v110, v111);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v107, v108);
  }
  else
  {
    uint64_t v9 = v0[58];
    uint64_t v8 = v0[59];
    uint64_t v10 = v0[56];
    uint64_t v11 = v0[57];
    uint64_t v13 = v0[54];
    uint64_t v12 = v0[55];
    uint64_t v14 = v0[51];
    uint64_t v15 = v0[52];
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 32))(v12, v0[50], v14);
    sub_10003F840();
    v141 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v141(v9, v8, v10);
    uint64_t v129 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    v129(v13, v12, v14);
    uint64_t v16 = sub_10003F870();
    os_log_type_t type = sub_10003FD30();
    BOOL v17 = os_log_type_enabled(v16, type);
    uint64_t v18 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v127 = v0[67];
    uint64_t v135 = v0[60];
    uint64_t v20 = v0[57];
    uint64_t v19 = v0[58];
    uint64_t v21 = v0[56];
    uint64_t v130 = v0[54];
    uint64_t v23 = v0[51];
    uint64_t v22 = v0[52];
    if (v17)
    {
      uint64_t v123 = (void (*)(uint64_t, uint64_t))v0[69];
      uint64_t v24 = swift_slowAlloc();
      uint64_t v119 = (void *)swift_slowAlloc();
      v148[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315650;
      v0[16] = sub_100016708(0xD000000000000011, 0x8000000100043490, v148);
      sub_10003FD90();
      *(_WORD *)(v24 + 12) = 2080;
      sub_1000355E4(&qword_10004D1D8, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
      uint64_t v25 = sub_10003FE50();
      v0[17] = sub_100016708(v25, v26, v148);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v145 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v145(v19, v21);
      *(_WORD *)(v24 + 22) = 2112;
      sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
      swift_allocError();
      uint64_t v27 = v130;
      v129(v28, v130, v23);
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      v0[18] = v29;
      sub_10003FD90();
      *uint64_t v119 = v29;
      uint64_t v131 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v131(v27, v23);
      _os_log_impl((void *)&_mh_execute_header, v16, type, "%s forecastSnapshot (%s) has error: %@", (uint8_t *)v24, 0x20u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v123(v127, v135);
    }
    else
    {
      uint64_t v145 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v145(v19, v21);
      uint64_t v30 = v130;
      uint64_t v131 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v131(v30, v23);

      v18(v127, v135);
    }
    uint64_t v31 = v0[59];
    uint64_t v32 = v0[56];
    uint64_t v128 = v0[55];
    uint64_t v33 = v0[48];
    uint64_t v35 = v0[43];
    uint64_t v34 = v0[44];
    uint64_t v36 = v0[42];
    uint64_t v136 = v0[51];
    v141(v33, v31, v32);
    uint64_t v37 = (uint64_t *)(v33 + *(int *)(v35 + 20));
    v37[3] = v32;
    v37[4] = sub_1000355E4(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
    uint64_t v38 = sub_10002C248(v37);
    v141((uint64_t)v38, v31, v32);
    sub_10003F140();
    sub_10003F140();
    *(void *)(v33 + *(int *)(v35 + 32)) = sub_10001216C();
    sub_100009B04(&qword_10004D2E0);
    unint64_t v39 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_100040DF0;
    sub_100035568(v33, v40 + v39);
    sub_1000326E8(v128, v36);
    sub_1000355E4(qword_10004D2B0, (void (*)(uint64_t))type metadata accessor for GridForecastEntry);
    sub_10003FB70();
    sub_100035694(v33, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
    v131(v128, v136);
    v145(v31, v32);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v112 = (uint64_t (*)(void))v0[1];
  return v112();
}

uint64_t sub_10002F9C4()
{
  uint64_t v33 = v0;
  sub_10003F840();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v29 = v0[62];
    uint64_t v30 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v28 = v0[60];
    uint64_t v3 = swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[5] = sub_100016708(0xD000000000000011, 0x8000000100043490, &v32);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v4 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v4;
    sub_10003FD90();
    *uint64_t v27 = v4;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s:ERROR: %@", (uint8_t *)v3, 0x16u);
    sub_100009B04(&qword_10004CF68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v30(v29, v28);
  }
  else
  {
    uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[69];
    uint64_t v6 = v0[62];
    uint64_t v7 = v0[60];
    swift_errorRelease();
    swift_errorRelease();

    v5(v6, v7);
  }
  uint64_t v8 = v0[52];
  v0[8] = v0[71];
  swift_errorRetain();
  sub_100009B04(&qword_10004CF60);
  int v9 = swift_dynamicCast();
  uint64_t v10 = *(void (**)(void, uint64_t, uint64_t, void))(v8 + 56);
  uint64_t v12 = v0[52];
  uint64_t v11 = v0[53];
  uint64_t v13 = v0[51];
  uint64_t v14 = v0[49];
  if (v9)
  {
    v10(v0[49], 0, 1, v0[51]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v11, v14, v13);
  }
  else
  {
    v10(v0[49], 1, 1, v0[51]);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for GridForecastError.otherError(_:), v13);
    sub_10000A34C(v14, &qword_10004D168);
  }
  uint64_t v16 = v0[52];
  uint64_t v15 = v0[53];
  uint64_t v31 = v0[51];
  uint64_t v17 = v0[48];
  uint64_t v18 = v0[44];
  uint64_t v20 = v0[41];
  uint64_t v19 = v0[42];
  uint64_t v21 = v0[39];
  uint64_t v22 = v0[40];
  sub_100033504(v17, v19, v15);
  sub_100009B04(&qword_10004D2E0);
  unint64_t v23 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100040DF0;
  sub_100035568(v17, v24 + v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
  sub_1000355E4(qword_10004D2B0, (void (*)(uint64_t))type metadata accessor for GridForecastEntry);
  sub_10003FB70();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v19, v21);
  sub_100035694(v17, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v31);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_10002FFE0(uint64_t a1, uint64_t a2)
{
  v2[23] = a1;
  v2[24] = a2;
  uint64_t v3 = sub_10003F1D0();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  sub_100009B04(&qword_10004CB30);
  v2[30] = swift_task_alloc();
  uint64_t v4 = sub_10003F4E0();
  v2[31] = v4;
  v2[32] = *(void *)(v4 - 8);
  v2[33] = swift_task_alloc();
  uint64_t v5 = sub_10003F890();
  v2[34] = v5;
  v2[35] = *(void *)(v5 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  sub_100009B04(&qword_10004CAF0);
  v2[45] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ForecastLocationEntity();
  v2[46] = v6;
  v2[47] = *(void *)(v6 - 8);
  v2[48] = swift_task_alloc();
  sub_10003FCD0();
  v2[49] = sub_10003FCC0();
  uint64_t v8 = sub_10003FCA0();
  v2[50] = v8;
  v2[51] = v7;
  return _swift_task_switch(sub_1000302C8, v8, v7);
}

uint64_t sub_1000302C8()
{
  uint64_t v57 = v0;
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v3 = v0[45];
  sub_10003EFB0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[45];
    swift_release();
    sub_10000A34C(v4, &qword_10004CAF0);
    sub_10003F840();
    uint64_t v5 = sub_10003F870();
    os_log_type_t v6 = sub_10003FD30();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = v0[35];
    uint64_t v9 = v0[36];
    uint64_t v10 = v0[34];
    if (v7)
    {
      uint64_t v54 = v0[34];
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      v56[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      v0[4] = sub_100016708(0xD000000000000026, 0x8000000100043890, v56);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Widget configuration has no entity (home not found)", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v54);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    }
    uint64_t v27 = sub_10003F2A0();
    sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v27 - 8) + 104))(v28, enum case for GridForecastError.homeNotFound(_:), v27);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = (uint64_t (*)(void))v0[1];
    return v29();
  }
  else
  {
    uint64_t v12 = v0[48];
    uint64_t v13 = v0[46];
    sub_10003562C(v0[45], v12, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
    sub_10003EF80();
    uint64_t v15 = v0[2];
    unint64_t v14 = v0[3];
    uint64_t v16 = v12 + *(int *)(v13 + 28);
    uint64_t v17 = *(void **)v16;
    v0[52] = *(void *)v16;
    v0[53] = *(void *)(v16 + 8);
    int v18 = *(unsigned __int8 *)(v16 + 16);
    if (v18)
    {
      if (v18 == 1)
      {
        id v19 = v17;
        sub_10003F840();
        swift_bridgeObjectRetain_n();
        uint64_t v20 = sub_10003F870();
        os_log_type_t v21 = sub_10003FD50();
        BOOL v22 = os_log_type_enabled(v20, v21);
        uint64_t v23 = v0[44];
        uint64_t v25 = v0[34];
        uint64_t v24 = v0[35];
        if (v22)
        {
          id v55 = v19;
          uint64_t v26 = swift_slowAlloc();
          v56[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 136315394;
          v0[21] = sub_100016708(0xD000000000000026, 0x8000000100043890, v56);
          sub_10003FD90();
          *(_WORD *)(v26 + 12) = 2080;
          swift_bridgeObjectRetain();
          v0[22] = sub_100016708(v15, v14, v56);
          sub_10003FD90();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s: Widget configuration is for static location: %s", (uint8_t *)v26, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          id v19 = v55;
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
        }
        uint64_t v43 = v0[30];
        uint64_t v45 = v0[25];
        uint64_t v44 = v0[26];
        (*(void (**)(void, void, void))(v0[32] + 104))(v0[33], enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), v0[31]);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v43, 1, 1, v45);
        sub_10003F500();
        swift_allocObject();
        id v46 = v19;
        v0[54] = sub_10003F4F0();
        uint64_t v47 = (void *)swift_task_alloc();
        v0[55] = v47;
        *uint64_t v47 = v0;
        v47[1] = sub_100030C24;
        uint64_t v48 = v0[23];
        return GridForecastSnapshotManager.retrieveFixedSnapshot()(v48);
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_10003F840();
        uint64_t v36 = sub_10003F870();
        os_log_type_t v37 = sub_10003FD50();
        BOOL v38 = os_log_type_enabled(v36, v37);
        uint64_t v39 = v0[37];
        uint64_t v40 = v0[34];
        uint64_t v41 = v0[35];
        if (v38)
        {
          os_log_type_t v42 = (uint8_t *)swift_slowAlloc();
          v56[0] = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v42 = 136315138;
          v0[5] = sub_100016708(0xD000000000000026, 0x8000000100043890, v56);
          sub_10003FD90();
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s: Widget configuration is for current location.", v42, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
        }
        else
        {

          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
        }
        uint64_t v49 = v0[30];
        uint64_t v50 = v0[25];
        uint64_t v51 = v0[26];
        (*(void (**)(void, void, void))(v0[32] + 104))(v0[33], enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), v0[31]);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56))(v49, 1, 1, v50);
        sub_10003F500();
        swift_allocObject();
        v0[65] = sub_10003F4F0();
        unint64_t v52 = (void *)swift_task_alloc();
        v0[66] = v52;
        *unint64_t v52 = v0;
        v52[1] = sub_100032468;
        uint64_t v53 = v0[23];
        return GridForecastSnapshotManager.retrieveImmediateLocationSnapshotForWidget()(v53);
      }
    }
    else
    {
      uint64_t v31 = v0[48];
      uint64_t v32 = v0[29];
      uint64_t v33 = v0[25];
      uint64_t v34 = v0[26];
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
      v0[56] = v35;
      v0[57] = (v34 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v35(v32, v31, v33);
      return _swift_task_switch(sub_100030EB8, 0, 0);
    }
  }
}

uint64_t sub_100030C24()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 408);
  uint64_t v3 = *(void *)(v1 + 400);
  return _swift_task_switch(sub_100030D44, v3, v2);
}

uint64_t sub_100030D44()
{
  uint64_t v1 = (void *)v0[53];
  uint64_t v2 = (void *)v0[52];
  uint64_t v3 = v0[48];
  swift_release();
  swift_release();
  sub_10000FA9C(v2, v1, 1);
  sub_100035694(v3, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100030EB8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v1 = v0;
  v1[1] = sub_100030FAC;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_100030FAC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000310A8, 0, 0);
}

uint64_t sub_1000310A8()
{
  v0[59] = v0[6];
  return _swift_task_switch(sub_1000310C8, v0[50], v0[51]);
}

uint64_t sub_1000310C8()
{
  os_log_t v118 = v0;
  uint64_t v1 = (void *)v0[59];
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();

  sub_10003F840();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v117[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[19] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
    sub_10003FD90();
    *(_WORD *)(v6 + 12) = 2048;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_10003FE10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v114 = v0[43];
    uint64_t v9 = v0[34];
    uint64_t v8 = v0[35];
    swift_bridgeObjectRelease();
    v0[20] = v7;
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v10(v114, v9);
  }
  else
  {
    uint64_t v11 = v0[43];
    uint64_t v12 = v0[34];
    uint64_t v13 = v0[35];
    swift_bridgeObjectRelease_n();

    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v10(v11, v12);
  }
  uint64_t v14 = v0[29];
  uint64_t v15 = swift_task_alloc();
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = sub_10002D0FC(sub_1000356F4, v15, v3);
  v0[60] = v16;
  swift_task_dealloc();
  uint64_t v17 = (void (*)(uint64_t, uint64_t, uint64_t))v0[56];
  if (v16)
  {
    uint64_t v115 = v10;
    uint64_t v19 = v0[28];
    uint64_t v18 = v0[29];
    uint64_t v20 = v0[25];
    id v21 = v16;
    swift_bridgeObjectRelease();
    sub_10003F840();
    v17(v19, v18, v20);
    id v22 = v21;
    uint64_t v23 = sub_10003F870();
    os_log_type_t v24 = sub_10003FD50();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = v0[42];
    uint64_t v27 = v0[34];
    uint64_t v28 = v0[28];
    uint64_t v29 = v0[26];
    uint64_t v111 = v0[25];
    if (v25)
    {
      uint64_t v105 = v0[34];
      uint64_t v30 = swift_slowAlloc();
      uint64_t v101 = v28;
      uint64_t v31 = (void *)swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315650;
      v0[16] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
      sub_10003FD90();
      *(_WORD *)(v30 + 12) = 2112;
      os_log_type_t type = v24;
      v0[17] = v22;
      os_log_t log = v23;
      id v32 = v22;
      id v33 = v22;
      sub_10003FD90();
      *uint64_t v31 = v16;

      id v22 = v32;
      *(_WORD *)(v30 + 22) = 2080;
      uint64_t v34 = sub_10003F190();
      v0[18] = sub_100016708(v34, v35, v117);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v36(v101, v111);
      _os_log_impl((void *)&_mh_execute_header, log, type, "%s: Widget configuration is for a home: %@ with ID: %s", (uint8_t *)v30, 0x20u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v37 = v26;
      uint64_t v38 = v105;
    }
    else
    {

      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v36(v28, v111);

      uint64_t v37 = v26;
      uint64_t v38 = v27;
    }
    uint64_t v57 = v115;
    v115(v37, v38);
    v0[61] = v36;
    id v58 = [v22 location];
    if (v58)
    {
      uint64_t v59 = v58;
      sub_10003F840();
      id v60 = v59;
      uint64_t v61 = sub_10003F870();
      os_log_type_t v62 = sub_10003FD10();
      BOOL v63 = os_log_type_enabled(v61, v62);
      uint64_t v64 = v0[41];
      uint64_t v109 = v0[34];
      uint64_t v112 = v59;
      if (v63)
      {
        uint64_t v65 = swift_slowAlloc();
        v117[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v65 = 136315394;
        v0[14] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
        sub_10003FD90();
        *(_WORD *)(v65 + 12) = 2080;
        uint64_t v66 = sub_10003F750();
        v0[15] = sub_100016708(v66, v67, v117);
        sub_10003FD90();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: Home location found...%s", (uint8_t *)v65, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v57 = v115;
        swift_slowDealloc();
      }
      else
      {
      }
      v57(v64, v109);
      sub_10003F840();
      id v76 = v60;
      uint64_t v77 = sub_10003F870();
      os_log_type_t v78 = sub_10003FD20();
      BOOL v79 = os_log_type_enabled(v77, v78);
      uint64_t v80 = v0[40];
      uint64_t v81 = v0[34];
      if (v79)
      {
        uint64_t v110 = v0[40];
        uint64_t v82 = swift_slowAlloc();
        uint64_t v83 = (void *)swift_slowAlloc();
        v117[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v82 = 136315394;
        v0[12] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
        sub_10003FD90();
        *(_WORD *)(v82 + 12) = 2112;
        v0[13] = v76;
        id v76 = v76;
        sub_10003FD90();
        *uint64_t v83 = v112;

        _os_log_impl((void *)&_mh_execute_header, v77, v78, "\t...%s:%@", (uint8_t *)v82, 0x16u);
        sub_100009B04(&qword_10004CF68);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v115(v110, v81);
      }
      else
      {

        v57(v80, v81);
      }
    }
    else
    {
      sub_10003F840();
      id v68 = v22;
      uint64_t v69 = sub_10003F870();
      os_log_type_t v70 = sub_10003FD30();
      BOOL v71 = os_log_type_enabled(v69, v70);
      uint64_t v72 = v0[39];
      uint64_t v73 = v0[34];
      if (v71)
      {
        uint64_t v113 = v0[34];
        uint64_t v108 = v0[39];
        uint64_t v74 = swift_slowAlloc();
        uint64_t v104 = (void *)swift_slowAlloc();
        v117[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v74 = 136315394;
        v0[10] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
        sub_10003FD90();
        *(_WORD *)(v74 + 12) = 2112;
        v0[11] = v68;
        id v75 = v68;
        sub_10003FD90();
        void *v104 = v16;

        _os_log_impl((void *)&_mh_execute_header, v69, v70, "%s: Home location disappeared, no longer valid: %@", (uint8_t *)v74, 0x16u);
        sub_100009B04(&qword_10004CF68);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v115(v108, v113);
      }
      else
      {

        v115(v72, v73);
      }
      id v76 = (id)sub_10003F740();
    }
    v0[62] = v76;
    unint64_t v91 = (void (*)(uint64_t, uint64_t, uint64_t))v0[56];
    uint64_t v92 = v0[30];
    uint64_t v93 = v0[29];
    uint64_t v94 = v0[25];
    uint64_t v95 = v0[26];
    (*(void (**)(void, void, void))(v0[32] + 104))(v0[33], enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), v0[31]);
    id v96 = v76;
    id v97 = [v22 name];
    sub_10003FC10();

    v91(v92, v93, v94);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v95 + 56))(v92, 0, 1, v94);
    sub_10003F500();
    swift_allocObject();
    v0[63] = sub_10003F4F0();
    unint64_t v98 = (void *)swift_task_alloc();
    v0[64] = v98;
    *unint64_t v98 = v0;
    v98[1] = sub_1000321B8;
    uint64_t v99 = v0[23];
    return GridForecastSnapshotManager.retrieveFixedSnapshot()(v99);
  }
  else
  {
    uint64_t v39 = v0[29];
    uint64_t v40 = v0[27];
    uint64_t v41 = v0[25];
    swift_release();
    sub_10003F840();
    v17(v40, v39, v41);
    swift_bridgeObjectRetain();
    os_log_type_t v42 = sub_10003F870();
    os_log_type_t v43 = sub_10003FD50();
    BOOL v44 = os_log_type_enabled(v42, v43);
    uint64_t v45 = v0[38];
    uint64_t v46 = v0[34];
    uint64_t v48 = v0[26];
    uint64_t v47 = v0[27];
    uint64_t v49 = v0[25];
    if (v44)
    {
      uint64_t v116 = v10;
      uint64_t v107 = v0[38];
      uint64_t v106 = v0[34];
      uint64_t v50 = swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 136315650;
      os_log_type_t v103 = v43;
      v0[7] = sub_100016708(0xD000000000000026, 0x8000000100043890, v117);
      sub_10003FD90();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v51 = sub_10003F190();
      v0[8] = sub_100016708(v51, v52, v117);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v53(v47, v49);
      *(_WORD *)(v50 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v54 = sub_10003FC90();
      unint64_t v56 = v55;
      swift_bridgeObjectRelease();
      v0[9] = sub_100016708(v54, v56, v117);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v42, v103, "%s: Widget configuration could not find %s in %s", (uint8_t *)v50, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v116(v107, v106);
    }
    else
    {
      uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v53(v47, v49);
      swift_bridgeObjectRelease_n();

      v10(v45, v46);
    }
    uint64_t v84 = v0[48];
    uint64_t v85 = v0[29];
    uint64_t v86 = v0[25];
    uint64_t v87 = sub_10003F2A0();
    sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v87 - 8) + 104))(v88, enum case for GridForecastError.homeNotFound(_:), v87);
    swift_willThrow();
    sub_100035694(v84, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
    v53(v85, v86);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v89 = (uint64_t (*)(void))v0[1];
    return v89();
  }
}

uint64_t sub_1000321B8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 408);
  uint64_t v3 = *(void *)(v1 + 400);
  return _swift_task_switch(sub_1000322D8, v3, v2);
}

uint64_t sub_1000322D8()
{
  uint64_t v1 = (void *)v0[62];
  uint64_t v3 = (void *)v0[60];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[61];
  uint64_t v4 = v0[48];
  uint64_t v5 = v0[29];
  uint64_t v6 = v0[25];
  swift_release();
  swift_release();

  sub_100035694(v4, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
  v2(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100032468()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 408);
  uint64_t v3 = *(void *)(v1 + 400);
  return _swift_task_switch(sub_100032588, v3, v2);
}

uint64_t sub_100032588()
{
  uint64_t v1 = *(void *)(v0 + 384);
  swift_release();
  swift_release();
  sub_100035694(v1, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000326E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v3 = sub_10003F170();
  uint64_t v75 = *(void *)(v3 - 8);
  id v76 = (void (*)(uint64_t, char *, uint64_t))v3;
  __chkstk_darwin(v3);
  uint64_t v74 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003FB00();
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  __chkstk_darwin(v5);
  uint64_t v83 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003F2A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v81 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  os_log_t v84 = (os_log_t)((char *)&v69 - v12);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v69 - v13;
  uint64_t v15 = sub_10003F890();
  uint64_t v88 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v82 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v69 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v69 - v22;
  __chkstk_darwin(v21);
  BOOL v25 = (char *)&v69 - v24;
  sub_10003F840();
  uint64_t v85 = a1;
  uint64_t v86 = v8;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v26(v14, a1, v7);
  uint64_t v27 = sub_10003F870();
  os_log_type_t v28 = sub_10003FD30();
  os_log_type_t v78 = v27;
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v72 = v23;
  uint64_t v73 = v20;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v87 = (void (*)(char *, uint64_t))v7;
    uint64_t v31 = v30;
    os_log_type_t v70 = (void *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    v91[0] = v71;
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v77 = v15;
    uint64_t v90 = sub_100016708(0xD00000000000001BLL, 0x8000000100043790, v91);
    sub_10003FD90();
    *(_WORD *)(v31 + 12) = 2112;
    sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
    swift_allocError();
    uint64_t v32 = v86;
    v26(v33, (uint64_t)v14, (uint64_t)v87);
    uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v90 = v34;
    sub_10003FD90();
    *os_log_type_t v70 = v34;
    unint64_t v35 = *(void (**)(char *, uint64_t))(v32 + 8);
    v35(v14, (uint64_t)v87);
    uint64_t v36 = v78;
    _os_log_impl((void *)&_mh_execute_header, v78, v28, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v31, 0x16u);
    sub_100009B04(&qword_10004CF68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = (uint64_t)v87;
    swift_slowDealloc();

    uint64_t v37 = v77;
    uint64_t v38 = *(void (**)(char *, uint64_t))(v88 + 8);
    v38(v25, v77);
    uint64_t v39 = v32;
  }
  else
  {
    uint64_t v39 = v86;
    uint64_t v40 = *(void (**)(char *, uint64_t))(v86 + 8);
    v40(v14, v7);

    uint64_t v38 = *(void (**)(char *, uint64_t))(v88 + 8);
    v38(v25, v15);
    uint64_t v37 = v15;
    unint64_t v35 = v40;
  }
  sub_10003FAE0();
  os_log_t v41 = v84;
  v26((char *)v84, v85, v7);
  int v42 = (*(uint64_t (**)(os_log_t, uint64_t))(v39 + 88))(v41, v7);
  os_log_type_t v43 = v81;
  BOOL v44 = v82;
  if (v42 == enum case for GridForecastError.gettingLocation(_:)
    || v42 == enum case for GridForecastError.gettingGridID(_:)
    || v42 == enum case for GridForecastError.gettingEnergyWindows(_:))
  {
    uint64_t v45 = v73;
    sub_10003F840();
    uint64_t v46 = sub_10003F870();
    os_log_type_t v49 = sub_10003FD50();
    if (os_log_type_enabled(v46, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      v91[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v90 = sub_100016708(0xD00000000000001BLL, 0x8000000100043790, v91);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v46, v49, "%s: windows are still loading (or a transient error), displaying empty, retrying as soon as WidgetKit allows...", v50, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_16;
  }
  if (v42 == enum case for GridForecastError.noLocationPermission(_:)
    || v42 == enum case for GridForecastError.noLocationFound(_:)
    || v42 == enum case for GridForecastError.noLocationInHome(_:)
    || v42 == enum case for GridForecastError.noGridIDAvailable(_:))
  {
LABEL_23:
    uint64_t v77 = v37;
    sub_10003F840();
    v26(v43, v85, v7);
    unint64_t v56 = sub_10003F870();
    os_log_type_t v57 = sub_10003FD30();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = swift_slowAlloc();
      os_log_t v84 = v56;
      uint64_t v59 = v58;
      os_log_type_t v78 = swift_slowAlloc();
      uint64_t v85 = swift_slowAlloc();
      v91[0] = v85;
      *(_DWORD *)uint64_t v59 = 136315394;
      uint64_t v87 = v38;
      id v76 = (void (*)(uint64_t, char *, uint64_t))v26;
      uint64_t v90 = sub_100016708(0xD00000000000001BLL, 0x8000000100043790, v91);
      sub_10003FD90();
      *(_WORD *)(v59 + 12) = 2112;
      sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
      swift_allocError();
      id v60 = v35;
      v76(v61, v43, v7);
      uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v90 = v62;
      sub_10003FD90();
      v78->isa = (Class)v62;
      v60(v43, v7);
      os_log_t v63 = v84;
      _os_log_impl((void *)&_mh_execute_header, v84, v57, "%s: window loading failed, erroring out widget. Unrecoverable error: %@", (uint8_t *)v59, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v87(v44, v77);
    }
    else
    {
      v35(v43, v7);

      v38(v44, v77);
    }
    uint64_t v65 = v83;
    sub_10003FAF0();
    goto LABEL_28;
  }
  if (v42 != enum case for GridForecastError.gridIDLookupFailure(_:))
  {
    if (v42 != enum case for GridForecastError.failedEnergyWindows(_:)
      && v42 != enum case for GridForecastError.homeNotFound(_:)
      && v42 != enum case for GridForecastError.noHomePermission(_:)
      && v42 != enum case for GridForecastError.otherError(_:))
    {
      uint64_t v51 = v83;
      sub_10003FAF0();
      uint64_t v53 = v79;
      uint64_t v52 = v80;
      uint64_t v54 = v89;
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v89, v80);
      (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v54, v51, v52);
      return ((uint64_t (*)(os_log_t, uint64_t))v35)(v84, v7);
    }
    goto LABEL_23;
  }
  uint64_t v45 = v72;
  sub_10003F840();
  uint64_t v46 = sub_10003F870();
  os_log_type_t v47 = sub_10003FD30();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    v91[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 136315138;
    uint64_t v90 = sub_100016708(0xD00000000000001BLL, 0x8000000100043790, v91);
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "%s: window loading failed, but error is recoverable, asking for 5 minute reload", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
LABEL_16:

  v38(v45, v37);
  uint64_t v64 = v74;
  sub_10003F130();
  uint64_t v65 = v83;
  sub_10003FAD0();
  (*(void (**)(char *, void (*)(uint64_t, char *, uint64_t)))(v75 + 8))(v64, v76);
LABEL_28:
  uint64_t v67 = v79;
  uint64_t v66 = v80;
  uint64_t v68 = v89;
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v89, v80);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v67 + 32))(v68, v65, v66);
}

unint64_t sub_1000333DC()
{
  sub_10003FDC0(50);
  swift_bridgeObjectRelease();
  type metadata accessor for GridForecastEntry();
  v1._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x20726F66203ALL;
  v2._object = (void *)0xE600000000000000;
  sub_10003FC50(v2);
  swift_retain();
  v3._countAndFlagsBits = sub_10000F260();
  sub_10003FC50(v3);
  swift_release();
  swift_bridgeObjectRelease();
  v4._object = (void *)0x80000001000437D0;
  v4._countAndFlagsBits = 0xD000000000000013;
  sub_10003FC50(v4);
  v5._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v5);
  swift_bridgeObjectRelease();
  return 0xD000000000000013;
}

uint64_t sub_100033504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = a2;
  uint64_t v5 = sub_10003F170();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v54 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v53 = (char *)&v40 - v8;
  uint64_t v9 = sub_10003F310();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v51 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  os_log_type_t v49 = (char *)&v40 - v12;
  uint64_t v13 = sub_10003F2A0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10003F890();
  uint64_t v47 = *(void *)(v17 - 8);
  uint64_t v48 = v17;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F840();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v20(v16, a3, v13);
  uint64_t v21 = sub_10003F870();
  os_log_type_t v22 = sub_10003FD30();
  uint64_t v46 = v21;
  int v45 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v44 = a1;
    uint64_t v24 = v23;
    os_log_t v41 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(void *)&long long v58 = v42;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v57 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v58);
    uint64_t v43 = a3;
    sub_10003FD90();
    *(_WORD *)(v24 + 12) = 2112;
    uint64_t v40 = v24 + 14;
    sub_1000355E4(&qword_10004D2E8, (void (*)(uint64_t))&type metadata accessor for GridForecastError);
    swift_allocError();
    v20(v25, (uint64_t)v16, v13);
    uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v57 = v26;
    a3 = v43;
    sub_10003FD90();
    void *v41 = v26;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v27 = v46;
    _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v45, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v24, 0x16u);
    sub_100009B04(&qword_10004CF68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v44;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v48);
  sub_1000326E8(a3, v50);
  os_log_type_t v28 = v49;
  sub_10003F2C0();
  uint64_t v30 = v51;
  uint64_t v29 = v52;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  v31(v51, v28, v9);
  uint64_t v59 = v9;
  uint64_t v60 = sub_1000355E4(&qword_10004D1E0, (void (*)(uint64_t))&type metadata accessor for GridForecastSnapshot);
  uint64_t v32 = sub_10002C248((uint64_t *)&v58);
  v31((char *)v32, v28, v9);
  id v33 = v53;
  sub_10003F140();
  uint64_t v34 = v54;
  sub_10003F140();
  uint64_t v35 = sub_10001216C();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(a1, v30, v9);
  uint64_t v36 = (int *)type metadata accessor for GridForecastEntry();
  sub_1000355CC(&v58, a1 + v36[5]);
  uint64_t v37 = v56;
  uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v55 + 32);
  v38(a1 + v36[6], v33, v56);
  uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v38)(a1 + v36[7], v34, v37);
  *(void *)(a1 + v36[8]) = v35;
  return result;
}

uint64_t sub_100033B50(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_10002D7B0(a1, v4);
}

uint64_t sub_100033BF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_10002DE24(a1, v4);
}

uint64_t sub_100033C90(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_100034BF0(a2, a3, a4);
}

uint64_t sub_100033CA0(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_100034FB8(a2, a3, a4);
}

uint64_t sub_100033CB0(id *a1)
{
  uint64_t v2 = sub_10003F1D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*a1 uniqueIdentifier];
  sub_10003F1B0();

  char v7 = sub_10003F1A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_100033DBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100009B04(&qword_10004CF48);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009B04(&qword_10004D170);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10003F5E0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F2E0();
  type metadata accessor for GridForecastEntry();
  sub_10003F5F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_10000A34C((uint64_t)v10, &qword_10004D170);
LABEL_5:
    uint64_t v17 = sub_10003FB30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v22, 1, 1, v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  sub_10003F5D0();
  uint64_t v15 = sub_10003F170();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v3, 1, v15) == 1)
  {
    sub_10000A34C((uint64_t)v3, &qword_10004CF48);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_5;
  }
  sub_10003F110();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v15);
  uint64_t v19 = v22;
  sub_10003FB20();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v20 = sub_10003FB30();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
}

uint64_t sub_100034184()
{
  sub_10003FDC0(91);
  v1._countAndFlagsBits = 0xD000000000000013;
  v1._object = (void *)0x80000001000437B0;
  sub_10003FC50(v1);
  type metadata accessor for GridForecastEntry();
  v2._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v2);
  swift_bridgeObjectRelease();
  v3._object = (void *)0x80000001000438C0;
  v3._countAndFlagsBits = 0xD000000000000011;
  sub_10003FC50(v3);
  swift_retain();
  v4._countAndFlagsBits = sub_10000F260();
  sub_10003FC50(v4);
  swift_release();
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0xD000000000000018;
  v5._object = (void *)0x80000001000438E0;
  sub_10003FC50(v5);
  v6._countAndFlagsBits = sub_10003F2D0();
  sub_10003FC50(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0xD000000000000017;
  v7._object = (void *)0x8000000100043900;
  sub_10003FC50(v7);
  v8._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v8);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000342F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_10003F170();
  Swift::String v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100034368()
{
  return sub_1000355E4(qword_10004D2B0, (void (*)(uint64_t))type metadata accessor for GridForecastEntry);
}

char *sub_1000343B4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100009B04(&qword_10004D308);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100034890(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000344C4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100034610(a1, a2, a3, a4, &qword_10004D090, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity, (uint64_t (*)(void))type metadata accessor for ForecastLocationEntity);
}

char *sub_1000344E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100009B04(&qword_10004D080);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[56 * v8 + 32]) {
          memmove(v12, a4 + 32, 56 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10003499C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100034610(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100009B04(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_10003FE00();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  void v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100034A94(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_100034890(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100009B04(&qword_10004D310);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_10003499C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_100034A94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_10003FE40();
  __break(1u);
  return result;
}

uint64_t sub_100034BF0(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5 = sub_10003F2A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003FB00();
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  __chkstk_darwin(v9);
  uint64_t v29 = (uint64_t)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for GridForecastEntry();
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10003F890();
  uint64_t v14 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F840();
  unint64_t v17 = sub_10003F870();
  os_log_type_t v18 = sub_10003FD30();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v24 = v6;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v26 = a3;
    BOOL v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v5;
    uint64_t v33 = v21;
    uint64_t v27 = a2;
    *(_DWORD *)BOOL v20 = 136315138;
    uint64_t v32 = sub_100016708(0xD00000000000001FLL, 0x8000000100043470, &v33);
    uint64_t v6 = v24;
    a2 = v27;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s THIS SHOULD NEVER GET CALLED", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v25;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v28);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for GridForecastError.otherError(_:), v5);
  uint64_t v22 = v29;
  sub_100033504((uint64_t)v13, v29, (uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v22, v31);
  a2(v13);
  return sub_100035694((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
}

uint64_t sub_100034FB8(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v46 = a2;
  uint64_t v4 = sub_100009B04(&qword_10004D2D8);
  uint64_t v45 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003F2A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v38 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003FB00();
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v40 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v41 = (uint64_t)&v33 - v12;
  uint64_t v13 = type metadata accessor for GridForecastEntry();
  uint64_t v37 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v39 = (uint64_t)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10003F890();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  os_log_type_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F840();
  uint64_t v19 = sub_10003F870();
  os_log_type_t v20 = sub_10003FD30();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v33 = v15;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v35 = a3;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v36 = v4;
    uint64_t v48 = v23;
    uint64_t v34 = v7;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v47 = sub_100016708(0xD00000000000001FLL, 0x8000000100043450, &v48);
    uint64_t v7 = v34;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s THIS SHOULD NEVER GET CALLED", v22, 0xCu);
    swift_arrayDestroy();
    uint64_t v4 = v36;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  uint64_t v24 = (uint64_t)v38;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v38, enum case for GridForecastError.otherError(_:), v6);
  uint64_t v25 = v39;
  uint64_t v26 = v41;
  sub_100033504(v39, v41, v24);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v6);
  sub_100009B04(&qword_10004D2E0);
  unint64_t v27 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_100040DF0;
  sub_100035568(v25, v28 + v27);
  uint64_t v30 = v42;
  uint64_t v29 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v40, v26, v43);
  sub_1000355E4(qword_10004D2B0, (void (*)(uint64_t))type metadata accessor for GridForecastEntry);
  uint64_t v31 = v44;
  sub_10003FB70();
  v46(v31);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v4);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v26, v29);
  return sub_100035694(v25, (uint64_t (*)(void))type metadata accessor for GridForecastEntry);
}

uint64_t sub_100035568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GridForecastEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000355CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000355E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003562C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100035694(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000356F4(id *a1)
{
  return sub_100033CB0(a1) & 1;
}

ValueMetadata *type metadata accessor for HistoricalUsageTimelineProvider()
{
  return &type metadata for HistoricalUsageTimelineProvider;
}

uint64_t *sub_100035724(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10003F170();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_10003F3B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return a1;
}

uint64_t sub_100035840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t sub_1000358FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

uint64_t sub_1000359CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100035AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100035B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10003F3B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_100035C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100035C5C);
}

uint64_t sub_100035C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003F170();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_10003F3B0();
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
  return (v14 + 1);
}

uint64_t sub_100035D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100035D84);
}

uint64_t sub_100035D84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10003F170();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_10003F3B0();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for HistoricalUsageEntry()
{
  uint64_t result = qword_10004D370;
  if (!qword_10004D370) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100035EE0()
{
  uint64_t result = sub_10003F170();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10003F3B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_100035FB4(uint64_t a1)
{
  uint64_t result = (void *)sub_10003BDA0(a1);
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
    return sub_10003BE28(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_100036044@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10003F170();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v31 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10003F3B0();
  uint64_t v5 = *(void *)(v32 - 8);
  uint64_t v6 = __chkstk_darwin(v32);
  uint64_t v30 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = sub_10003F890();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F850();
  uint64_t v14 = sub_10003F870();
  os_log_type_t v15 = sub_10003FD50();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v28 = v2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v29 = a1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = v10;
    uint64_t v34 = v18;
    uint64_t v27 = v3;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v33 = sub_100016708(0xD000000000000010, 0x8000000100043560, &v34);
    uint64_t v3 = v27;
    uint64_t v2 = v28;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s Generating placeholder with mock data.", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v29;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_10003F380();
  uint64_t v19 = v31;
  sub_10003F140();
  os_log_type_t v20 = v30;
  uint64_t v21 = v32;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v30, v9, v32);
  uint64_t v22 = sub_100023B7C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v21);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v19, v2);
  uint64_t v23 = type metadata accessor for HistoricalUsageEntry();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a1 + *(int *)(v23 + 20), v20, v21);
  *(void *)(a1 + *(int *)(v23 + 24)) = v22;
  return result;
}

uint64_t sub_100036410(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_10003F3B0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  sub_100009B04(&qword_10004CF48);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_10003F170();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  sub_100009B04(&qword_10004D418);
  v2[13] = swift_task_alloc();
  sub_100009B04(&qword_10004D420);
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_10003F0A0();
  v2[15] = v5;
  v2[16] = *(void *)(v5 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v6 = sub_10003F200();
  v2[18] = v6;
  v2[19] = *(void *)(v6 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v7 = sub_10003F260();
  v2[21] = v7;
  v2[22] = *(void *)(v7 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v8 = sub_10003F890();
  v2[24] = v8;
  v2[25] = *(void *)(v8 - 8);
  v2[26] = swift_task_alloc();
  return _swift_task_switch(sub_10003672C, 0, 0);
}

uint64_t sub_10003672C()
{
  uint64_t v48 = v0;
  sub_10003F850();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v42 = v0[25];
    uint64_t v43 = v0[24];
    uint64_t v45 = v0[26];
    uint64_t v3 = swift_slowAlloc();
    v47[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[2] = sub_100016708(0xD000000000000011, 0x8000000100043540, v47);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_100021F48();
    unint64_t v6 = v5;
    swift_release();
    v0[3] = sub_100016708(v4, v6, v47);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v45, v43);
  }
  else
  {
    uint64_t v8 = v0[25];
    uint64_t v7 = v0[26];
    uint64_t v9 = v0[24];
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v11 = v0[22];
  uint64_t v10 = v0[23];
  uint64_t v13 = v0[20];
  uint64_t v12 = v0[21];
  uint64_t v15 = v0[18];
  uint64_t v14 = v0[19];
  uint64_t v17 = v0[13];
  uint64_t v16 = v0[14];
  uint64_t v18 = v0[11];
  uint64_t v46 = v0[10];
  uint64_t v44 = v0[9];
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for Calendar.Identifier.gregorian(_:), v15);
  sub_10003F210();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v16, v10, v12);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v12);
  uint64_t v19 = sub_10003F270();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  sub_10003F090();
  sub_10003F220();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v44, 1, v46);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v27 = v0[22];
    uint64_t v26 = v0[23];
    uint64_t v28 = v0[16];
    uint64_t v29 = v0[17];
    uint64_t v38 = v0[15];
    uint64_t v39 = v0[21];
    uint64_t v37 = v0[12];
    uint64_t v36 = v0[10];
    uint64_t v30 = v0[8];
    uint64_t v31 = v0[7];
    uint64_t v32 = v0[4];
    uint64_t v40 = v0[6];
    uint64_t v41 = v0[5];
    uint64_t v33 = *(void (**)(void, void, void))(v0[11] + 32);
    ((void (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t, _BYTE, void, char, void, char, void, char, void, char, void, char))v33)(v37, v0[9], v36, v21, v22, v23, v24, v25, 17, 0, 3, 0, 0, 1, 0, 1, 0, 1, 0,
      1,
      0,
      1);
    sub_10003F360();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v38);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v39);
    v33(v32, v37, v36);
    uint64_t v34 = type metadata accessor for HistoricalUsageEntry();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v32 + *(int *)(v34 + 20), v30, v40);
    *(void *)(v32 + *(int *)(v34 + 24)) = v41;
    swift_retain();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = (uint64_t (*)(void))v0[1];
    return v35();
  }
  return result;
}

uint64_t sub_100036C70(uint64_t a1, uint64_t a2)
{
  v2[44] = a1;
  v2[45] = a2;
  uint64_t v3 = sub_10003FB00();
  v2[46] = v3;
  v2[47] = *(void *)(v3 - 8);
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for HistoricalUsageEntry();
  v2[50] = v4;
  v2[51] = *(void *)(v4 - 8);
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  uint64_t v5 = sub_10003F260();
  v2[55] = v5;
  v2[56] = *(void *)(v5 - 8);
  v2[57] = swift_task_alloc();
  uint64_t v6 = sub_10003F170();
  v2[58] = v6;
  v2[59] = *(void *)(v6 - 8);
  v2[60] = swift_task_alloc();
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  sub_100009B04(&qword_10004D3F0);
  v2[64] = swift_task_alloc();
  v2[65] = swift_task_alloc();
  uint64_t v7 = sub_10003F320();
  v2[66] = v7;
  v2[67] = *(void *)(v7 - 8);
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  uint64_t v8 = sub_10003FA50();
  v2[71] = v8;
  v2[72] = *(void *)(v8 - 8);
  v2[73] = swift_task_alloc();
  uint64_t v9 = sub_10003F3B0();
  v2[74] = v9;
  v2[75] = *(void *)(v9 - 8);
  v2[76] = swift_task_alloc();
  v2[77] = swift_task_alloc();
  uint64_t v10 = sub_10003F890();
  v2[78] = v10;
  v2[79] = *(void *)(v10 - 8);
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  v2[82] = swift_task_alloc();
  v2[83] = swift_task_alloc();
  v2[84] = swift_task_alloc();
  v2[85] = swift_task_alloc();
  v2[86] = swift_task_alloc();
  v2[87] = swift_task_alloc();
  v2[88] = swift_task_alloc();
  return _swift_task_switch(sub_1000370D8, 0, 0);
}

uint64_t sub_1000370D8()
{
  uint64_t v81 = v0;
  sub_10003F850();
  swift_retain_n();
  unint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v74 = v0[88];
    uint64_t v72 = v0[79];
    uint64_t v73 = v0[78];
    uint64_t v3 = swift_slowAlloc();
    v80[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[42] = sub_100016708(0xD000000000000011, 0x8000000100043490, v80);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_retain();
    unint64_t v4 = sub_100021F48();
    unint64_t v6 = v5;
    swift_release();
    v0[43] = sub_100016708(v4, v6, v80);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s resolving usageSnapshot type for configuration: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v7(v74, v73);
  }
  else
  {
    uint64_t v8 = v0[88];
    uint64_t v9 = v0[79];
    uint64_t v10 = v0[78];
    swift_release_n();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v7(v8, v10);
  }
  v0[89] = v7;
  sub_10003EFB0();
  uint64_t v11 = v0[3];
  if (v11)
  {
    uint64_t v12 = v0[2];
    swift_bridgeObjectRetain();
    sub_100016DA8(v12, v11);
    v0[21] = v12;
    v0[22] = v11;
    sub_10003F850();
    uint64_t v13 = sub_10003F870();
    os_log_type_t v14 = sub_10003FD30();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = v0[85];
    uint64_t v17 = v0[78];
    if (v15)
    {
      uint64_t v18 = swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      v0[35] = sub_100016708(0xD000000000000011, 0x8000000100043490, v80);
      sub_10003FD90();
      *(_WORD *)(v18 + 12) = 2080;
      swift_beginAccess();
      uint64_t v19 = v0[22];
      v0[23] = v0[21];
      v0[24] = v19;
      swift_bridgeObjectRetain();
      sub_100009B04(&qword_10004CF70);
      uint64_t v20 = sub_10003FC30();
      v0[38] = sub_100016708(v20, v21, v80);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s SiteDetail provided with non-nil siteID: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v7(v16, v17);
    swift_beginAccess();
    uint64_t v28 = v0[22];
    if (v28)
    {
      uint64_t v29 = v0[21];
      sub_10003F530();
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v30 = (void *)swift_task_alloc();
      v0[92] = v30;
      *uint64_t v30 = v0;
      v30[1] = sub_100038B24;
      return HistoricalUsageSnapshotManager.init(siteID:)(v29, v28);
    }
    else
    {
      sub_10003F850();
      uint64_t v31 = sub_10003F870();
      os_log_type_t v32 = sub_10003FD30();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v34 = (void (*)(uint64_t, uint64_t))v0[89];
      uint64_t v35 = v0[81];
      uint64_t v36 = v0[78];
      if (v33)
      {
        uint64_t v77 = v0[81];
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        v80[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315138;
        v0[25] = sub_100016708(0xD000000000000011, 0x8000000100043490, v80);
        sub_10003FD90();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s: Widget configuration has no entity (no home)", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v34(v77, v36);
      }
      else
      {

        v34(v35, v36);
      }
      uint64_t v39 = v0[67];
      uint64_t v40 = v0[66];
      sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
      uint64_t v41 = swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(v39 + 104))(v42, enum case for HistoricalUsageError.invalidEnergySite(_:), v40);
      swift_willThrow();
      swift_bridgeObjectRelease();
      sub_10003F850();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v43 = sub_10003F870();
      os_log_type_t v44 = sub_10003FD30();
      BOOL v45 = os_log_type_enabled(v43, v44);
      uint64_t v46 = (void (*)(uint64_t, uint64_t))v0[89];
      uint64_t v47 = v0[80];
      uint64_t v48 = v0[78];
      uint64_t v79 = v41;
      if (v45)
      {
        uint64_t v49 = swift_slowAlloc();
        uint64_t v71 = v46;
        uint64_t v50 = (void *)swift_slowAlloc();
        v80[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = 136315394;
        v0[36] = sub_100016708(0xD000000000000011, 0x8000000100043490, v80);
        sub_10003FD90();
        *(_WORD *)(v49 + 12) = 2112;
        swift_errorRetain();
        uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
        v0[33] = v51;
        sub_10003FD90();
        void *v50 = v51;
        uint64_t v41 = v79;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s:ERROR: %@", (uint8_t *)v49, 0x16u);
        sub_100009B04(&qword_10004CF68);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v71(v47, v48);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();

        v46(v47, v48);
      }
      uint64_t v52 = v0[67];
      v0[37] = v41;
      swift_errorRetain();
      sub_100009B04(&qword_10004CF60);
      int v53 = swift_dynamicCast();
      uint64_t v54 = *(void (**)(void, uint64_t, uint64_t, void))(v52 + 56);
      uint64_t v55 = v0[68];
      uint64_t v56 = v0[67];
      uint64_t v57 = v0[66];
      uint64_t v58 = v0[64];
      if (v53)
      {
        v54(v0[64], 0, 1, v0[66]);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v55, v58, v57);
      }
      else
      {
        v54(v0[64], 1, 1, v0[66]);
        (*(void (**)(uint64_t, void, uint64_t))(v56 + 104))(v55, enum case for HistoricalUsageError.otherError(_:), v57);
        sub_10003DF08(v58);
      }
      uint64_t v59 = v0[68];
      uint64_t v60 = v0[67];
      uint64_t v75 = v0[66];
      uint64_t v61 = v0[51];
      uint64_t v62 = v0[52];
      uint64_t v63 = v0[49];
      uint64_t v65 = v0[47];
      uint64_t v64 = v0[48];
      uint64_t v66 = v0[46];
      sub_100039E7C(v62, v63, v59);
      sub_100009B04(&qword_10004D3E0);
      unint64_t v67 = (*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
      uint64_t v68 = swift_allocObject();
      *(_OWORD *)(v68 + 16) = xmmword_100040DF0;
      sub_10003DE48(v62, v68 + v67);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(v64, v63, v66);
      sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
      sub_10003FB70();
      swift_errorRelease();
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v66);
      sub_10003DEAC(v62);
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v75);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v69 = (uint64_t (*)(void))v0[1];
      return v69();
    }
  }
  else
  {
    v0[21] = 0;
    v0[22] = 0;
    sub_10003F850();
    uint64_t v22 = sub_10003F870();
    os_log_type_t v23 = sub_10003FD30();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = v0[87];
    uint64_t v26 = v0[78];
    if (v24)
    {
      id v76 = v7;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      v0[41] = sub_100016708(0xD000000000000011, 0x8000000100043490, v80);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s No SiteDetail provided. ***Attempting Fallback to first onboarded home***", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v76(v25, v26);
    }
    else
    {

      v7(v25, v26);
    }
    os_log_type_t v78 = (uint64_t (*)(void))((char *)&dword_10004D400 + dword_10004D400);
    uint64_t v38 = (void *)swift_task_alloc();
    v0[90] = v38;
    *uint64_t v38 = v0;
    v38[1] = sub_100037F84;
    return v78();
  }
}

uint64_t sub_100037F84(uint64_t a1)
{
  *(void *)(*(void *)v1 + 728) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100038084, 0, 0);
}

uint64_t sub_100038084()
{
  uint64_t v62 = v0;
  sub_10003F850();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[91];
    uint64_t v57 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v54 = v0[78];
    uint64_t v56 = v0[86];
    uint64_t v4 = swift_slowAlloc();
    v61[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[39] = sub_100016708(0xD000000000000011, 0x8000000100043490, v61);
    sub_10003FD90();
    *(_WORD *)(v4 + 12) = 2048;
    v0[40] = *(void *)(v3 + 16);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s (%ld homes available.", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v57(v56, v54);
  }
  else
  {
    unint64_t v5 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v6 = v0[86];
    uint64_t v7 = v0[78];
    swift_bridgeObjectRelease();

    v5(v6, v7);
  }
  uint64_t v8 = sub_100035FB4(v0[91]);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10) {
    swift_bridgeObjectRelease();
  }
  else {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  v0[21] = v8;
  v0[22] = v10;
  swift_beginAccess();
  uint64_t v11 = v0[22];
  if (v11)
  {
    uint64_t v12 = v0[21];
    sub_10003F530();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[92] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_100038B24;
    return HistoricalUsageSnapshotManager.init(siteID:)(v12, v11);
  }
  else
  {
    sub_10003F850();
    os_log_type_t v14 = sub_10003F870();
    os_log_type_t v15 = sub_10003FD30();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v18 = v0[81];
    uint64_t v19 = v0[78];
    if (v16)
    {
      uint64_t v59 = v0[81];
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      v61[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      v0[25] = sub_100016708(0xD000000000000011, 0x8000000100043490, v61);
      sub_10003FD90();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s: Widget configuration has no entity (no home)", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v17(v59, v19);
    }
    else
    {

      v17(v18, v19);
    }
    uint64_t v21 = v0[67];
    uint64_t v22 = v0[66];
    sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
    uint64_t v23 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v24, enum case for HistoricalUsageError.invalidEnergySite(_:), v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_10003F850();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v25 = sub_10003F870();
    os_log_type_t v26 = sub_10003FD30();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v29 = v0[80];
    uint64_t v30 = v0[78];
    uint64_t v60 = v23;
    if (v27)
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v55 = v30;
      os_log_type_t v32 = (void *)swift_slowAlloc();
      v61[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      uint64_t v53 = v29;
      v0[36] = sub_100016708(0xD000000000000011, 0x8000000100043490, v61);
      sub_10003FD90();
      *(_WORD *)(v31 + 12) = 2112;
      swift_errorRetain();
      uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
      v0[33] = v33;
      sub_10003FD90();
      *os_log_type_t v32 = v33;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s:ERROR: %@", (uint8_t *)v31, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v23 = v60;
      swift_slowDealloc();

      v28(v53, v55);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v28(v29, v30);
    }
    uint64_t v34 = v0[67];
    v0[37] = v23;
    swift_errorRetain();
    sub_100009B04(&qword_10004CF60);
    int v35 = swift_dynamicCast();
    uint64_t v36 = *(void (**)(void, uint64_t, uint64_t, void))(v34 + 56);
    uint64_t v37 = v0[68];
    uint64_t v38 = v0[67];
    uint64_t v39 = v0[66];
    uint64_t v40 = v0[64];
    if (v35)
    {
      v36(v0[64], 0, 1, v0[66]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v37, v40, v39);
    }
    else
    {
      v36(v0[64], 1, 1, v0[66]);
      (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v37, enum case for HistoricalUsageError.otherError(_:), v39);
      sub_10003DF08(v40);
    }
    uint64_t v41 = v0[68];
    uint64_t v42 = v0[67];
    uint64_t v58 = v0[66];
    uint64_t v43 = v0[51];
    uint64_t v44 = v0[52];
    uint64_t v45 = v0[49];
    uint64_t v47 = v0[47];
    uint64_t v46 = v0[48];
    uint64_t v48 = v0[46];
    sub_100039E7C(v44, v45, v41);
    sub_100009B04(&qword_10004D3E0);
    unint64_t v49 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_100040DF0;
    sub_10003DE48(v44, v50 + v49);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v46, v45, v48);
    sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
    sub_10003FB70();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v45, v48);
    sub_10003DEAC(v44);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v58);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = (uint64_t (*)(void))v0[1];
    return v51();
  }
}

uint64_t sub_100038B24(uint64_t a1)
{
  *(void *)(*(void *)v1 + 744) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100038C24, 0, 0);
}

uint64_t sub_100038C24()
{
  (*(void (**)(void, void, void))(v0[72] + 104))(v0[73], enum case for EnergySite.EnergyUsageTimeInterval.week(_:), v0[71]);
  sub_10003FCD0();
  v0[94] = sub_10003FCC0();
  uint64_t v2 = sub_10003FCA0();
  return _swift_task_switch(sub_100038CE0, v2, v1);
}

uint64_t sub_100038CE0()
{
  uint64_t v1 = v0[73];
  uint64_t v2 = v0[72];
  uint64_t v3 = v0[71];
  swift_release();
  sub_10003F510();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100038D9C, 0, 0);
}

uint64_t sub_100038D9C()
{
  uint64_t v123 = v0;
  (*(void (**)(void, void, void))(v0[75] + 32))(v0[77], v0[76], v0[74]);
  sub_10003F850();
  uint64_t v1 = sub_10003F870();
  os_log_type_t v2 = sub_10003FD50();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v106 = v0[84];
    os_log_type_t typeb = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v104 = v0[78];
    uint64_t v3 = swift_slowAlloc();
    v122[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    v0[32] = sub_100016708(0xD000000000000011, 0x8000000100043490, v122);
    sub_10003FD90();
    *(_WORD *)(v3 + 12) = 2080;
    swift_beginAccess();
    sub_10003DF68(&qword_10004CCD0, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot);
    uint64_t v4 = sub_10003FE50();
    v0[34] = sub_100016708(v4, v5, v122);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: Retrieved week snapshot for widget %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    typeb(v106, v104);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v7 = v0[84];
    uint64_t v8 = v0[78];

    v6(v7, v8);
  }
  uint64_t v9 = v0[67];
  uint64_t v10 = v0[66];
  uint64_t v11 = v0[65];
  swift_beginAccess();
  sub_10003F3A0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v11, 1, v10) == 1)
  {
    uint64_t v12 = v0[75];
    uint64_t v102 = v0[74];
    uint64_t v105 = v0[77];
    uint64_t v13 = v0[62];
    uint64_t v14 = v0[63];
    uint64_t v114 = v0[61];
    uint64_t v15 = v0[59];
    uint64_t v117 = v0[60];
    uint64_t v16 = v0[57];
    uint64_t v17 = v0[56];
    os_log_t log = (os_log_t)v0[55];
    uint64_t v101 = v0[58];
    uint64_t v18 = v0[54];
    uint64_t v107 = v0[53];
    uint64_t v19 = v0[50];
    uint64_t v20 = v0[45];
    sub_10003DF08(v0[65]);
    sub_10003F140();
    sub_10003F240();
    sub_10003F780();
    (*(void (**)(uint64_t, os_log_t))(v17 + 8))(v16, log);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    v21(v18, v14, v101);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v18 + *(int *)(v19 + 20), v105, v102);
    *(void *)(v18 + *(int *)(v19 + 24)) = v20;
    swift_retain();
    sub_10003F850();
    sub_10003DE48(v18, v107);
    v21(v114, v14, v101);
    v21(v117, v13, v101);
    uint64_t v22 = sub_10003F870();
    os_log_type_t type = sub_10003FD50();
    BOOL v23 = os_log_type_enabled(v22, type);
    uint64_t v24 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v25 = v0[82];
    uint64_t v26 = v0[78];
    uint64_t v27 = v0[61];
    uint64_t v115 = v0[60];
    uint64_t v29 = v0[58];
    uint64_t v28 = v0[59];
    uint64_t v30 = v0[53];
    if (v23)
    {
      os_log_t loga = v22;
      uint64_t v31 = swift_slowAlloc();
      v122[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315906;
      v0[26] = sub_100016708(0xD000000000000011, 0x8000000100043490, v122);
      sub_10003FD90();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v32 = sub_10003B594();
      v0[27] = sub_100016708(v32, v33, v122);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      sub_10003DEAC(v30);
      *(_WORD *)(v31 + 22) = 2080;
      uint64_t v34 = sub_10003F150();
      v0[28] = sub_100016708(v34, v35, v122);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v36(v27, v29);
      *(_WORD *)(v31 + 32) = 2080;
      uint64_t v37 = sub_10003F150();
      v0[29] = sub_100016708(v37, v38, v122);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      uint64_t v119 = v36;
      v36(v115, v29);
      _os_log_impl((void *)&_mh_execute_header, loga, type, "%s Entry:%s created for %s, until %s", (uint8_t *)v31, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10003DEAC(v0[53]);
      uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v54(v27, v29);
      uint64_t v119 = v54;
      v54(v115, v29);
    }
    v24(v25, v26);
    uint64_t v55 = v0[75];
    *(void *)typec = v0[74];
    uint64_t v116 = v0[77];
    uint64_t v56 = v0[62];
    uint64_t v108 = v0[63];
    uint64_t v57 = v0[58];
    uint64_t v58 = v0[54];
    uint64_t v59 = v0[51];
    sub_100009B04(&qword_10004D3E0);
    unint64_t v60 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_100040DF0;
    sub_10003DE48(v58, v61 + v60);
    sub_10003FAD0();
    sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
    sub_10003FB70();
    sub_10003DEAC(v58);
    v119(v56, v57);
    v119(v108, v57);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, os_log_type_t *))(v55 + 8))(v116, *(os_log_type_t **)typec);
  }
  else
  {
    uint64_t v39 = v0[70];
    uint64_t v40 = v0[69];
    uint64_t v41 = v0[67];
    uint64_t v42 = v0[66];
    (*(void (**)(uint64_t, void, uint64_t))(v41 + 32))(v39, v0[65], v42);
    sub_10003F850();
    uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
    v43(v40, v39, v42);
    uint64_t v44 = sub_10003F870();
    os_log_type_t v45 = sub_10003FD50();
    BOOL v46 = os_log_type_enabled(v44, v45);
    os_log_type_t v103 = (void (*)(uint64_t, void))v0[89];
    uint64_t v47 = v0[83];
    *(void *)unsigned int typea = v0[78];
    uint64_t v48 = v0[69];
    uint64_t v49 = v0[67];
    uint64_t v50 = v0[66];
    if (v46)
    {
      unint64_t v98 = v44;
      uint64_t v51 = swift_slowAlloc();
      id v97 = (void *)swift_slowAlloc();
      v122[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315394;
      v0[30] = sub_100016708(0xD000000000000011, 0x8000000100043490, v122);
      sub_10003FD90();
      *(_WORD *)(v51 + 12) = 2112;
      sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
      swift_allocError();
      v43(v52, v48, v50);
      uint64_t v53 = _swift_stdlib_bridgeErrorToNSError();
      v0[31] = v53;
      sub_10003FD90();
      *id v97 = v53;
      uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v120(v48, v50);
      _os_log_impl((void *)&_mh_execute_header, v98, v45, "%s retrieved snapshot with error: %@, giving up.", (uint8_t *)v51, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v120(v0[69], v0[66]);
    }
    v103(v47, *(void *)typea);
    uint64_t v62 = v0[77];
    uint64_t v63 = v0[75];
    uint64_t v64 = v0[74];
    uint64_t v65 = v0[70];
    uint64_t v66 = v0[66];
    sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
    uint64_t v67 = swift_allocError();
    v43(v68, v65, v66);
    swift_willThrow();
    v120(v65, v66);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
    sub_10003F850();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v69 = sub_10003F870();
    os_log_type_t v70 = sub_10003FD30();
    BOOL v71 = os_log_type_enabled(v69, v70);
    uint64_t v72 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v73 = v0[80];
    uint64_t v74 = v0[78];
    uint64_t v121 = v67;
    if (v71)
    {
      typed = (void (*)(uint64_t, uint64_t))v0[89];
      uint64_t v75 = swift_slowAlloc();
      id v76 = (void *)swift_slowAlloc();
      v122[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v75 = 136315394;
      v0[36] = sub_100016708(0xD000000000000011, 0x8000000100043490, v122);
      sub_10003FD90();
      *(_WORD *)(v75 + 12) = 2112;
      swift_errorRetain();
      uint64_t v77 = _swift_stdlib_bridgeErrorToNSError();
      v0[33] = v77;
      sub_10003FD90();
      *id v76 = v77;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "%s:ERROR: %@", (uint8_t *)v75, 0x16u);
      sub_100009B04(&qword_10004CF68);
      swift_arrayDestroy();
      uint64_t v67 = v121;
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      typed(v73, v74);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v72(v73, v74);
    }
    uint64_t v78 = v0[67];
    v0[37] = v67;
    swift_errorRetain();
    sub_100009B04(&qword_10004CF60);
    int v79 = swift_dynamicCast();
    uint64_t v80 = *(void (**)(void, uint64_t, uint64_t, void))(v78 + 56);
    uint64_t v81 = v0[68];
    uint64_t v82 = v0[67];
    uint64_t v83 = v0[66];
    uint64_t v84 = v0[64];
    if (v79)
    {
      v80(v0[64], 0, 1, v0[66]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 32))(v81, v84, v83);
    }
    else
    {
      v80(v0[64], 1, 1, v0[66]);
      (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))(v81, enum case for HistoricalUsageError.otherError(_:), v83);
      sub_10003DF08(v84);
    }
    uint64_t v85 = v0[68];
    uint64_t v86 = v0[67];
    uint64_t v118 = v0[66];
    uint64_t v87 = v0[51];
    uint64_t v88 = v0[52];
    uint64_t v89 = v0[49];
    uint64_t v90 = v0[47];
    uint64_t v91 = v0[48];
    uint64_t v92 = v0[46];
    sub_100039E7C(v88, v89, v85);
    sub_100009B04(&qword_10004D3E0);
    unint64_t v93 = (*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
    uint64_t v94 = swift_allocObject();
    *(_OWORD *)(v94 + 16) = xmmword_100040DF0;
    sub_10003DE48(v88, v94 + v93);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v91, v89, v92);
    sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
    sub_10003FB70();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v92);
    sub_10003DEAC(v88);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v118);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v95 = (uint64_t (*)(void))v0[1];
  return v95();
}

uint64_t sub_100039E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v134 = a1;
  uint64_t v131 = sub_10003FA50();
  uint64_t v129 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  uint64_t v128 = (char *)&v112 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003F3B0();
  uint64_t v132 = *(void *)(v6 - 8);
  uint64_t v133 = v6;
  __chkstk_darwin(v6);
  uint64_t v130 = (char *)&v112 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003F170();
  uint64_t v141 = *(void *)(v8 - 8);
  uint64_t v142 = v8;
  __chkstk_darwin(v8);
  uint64_t v122 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10003FB00();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v124 = v10;
  uint64_t v125 = v11;
  __chkstk_darwin(v10);
  uint64_t v123 = (char *)&v112 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10003F320();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v127 = (char *)&v112 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = ((char *)&v112 - v18);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v116 = (char *)&v112 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v135 = (char *)&v112 - v23;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v112 - v24;
  uint64_t v26 = sub_10003F890();
  uint64_t v139 = *(void *)(v26 - 8);
  uint64_t v140 = v26;
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v114 = (char *)&v112 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v115 = (char *)&v112 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  os_log_t v120 = (os_log_t)((char *)&v112 - v32);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v113 = (char *)&v112 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  os_log_t v37 = (os_log_t)((char *)&v112 - v36);
  uint64_t v38 = __chkstk_darwin(v35);
  uint64_t v117 = (char *)&v112 - v39;
  __chkstk_darwin(v38);
  uint64_t v41 = (char *)&v112 - v40;
  sub_10003F850();
  uint64_t v136 = a3;
  uint64_t v137 = v14;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v43 = a3;
  uint64_t v44 = v13;
  v42(v25, v43, v13);
  os_log_type_t v45 = sub_10003F870();
  os_log_type_t v46 = sub_10003FD30();
  uint64_t v126 = v45;
  BOOL v47 = os_log_type_enabled(v45, v46);
  os_log_t v119 = v19;
  if (v47)
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v118 = (void (*)(uint64_t, char *, uint64_t))v42;
    uint64_t v49 = v48;
    uint64_t v112 = (void *)swift_slowAlloc();
    uint64_t v121 = (char *)swift_slowAlloc();
    uint64_t v144 = v121;
    *(_DWORD *)uint64_t v49 = 136315394;
    uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
    sub_10003FD90();
    *(_WORD *)(v49 + 12) = 2112;
    uint64_t v138 = (void (*)(char *, uint64_t))(v49 + 14);
    sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
    swift_allocError();
    uint64_t v50 = v37;
    v118(v51, v25, v44);
    uint64_t v52 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v143 = v52;
    sub_10003FD90();
    void *v112 = v52;
    os_log_t v37 = v50;
    uint64_t v53 = v137;
    uint64_t v138 = *(void (**)(char *, uint64_t))(v137 + 8);
    v138(v25, v44);
    uint64_t v54 = v126;
    _os_log_impl((void *)&_mh_execute_header, v126, v46, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v49, 0x16u);
    sub_100009B04(&qword_10004CF68);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v42 = (void (*)(char *, uint64_t, uint64_t))v118;
    swift_slowDealloc();

    uint64_t v121 = *(char **)(v139 + 8);
    ((void (*)(char *, uint64_t))v121)(v41, v140);
    uint64_t v55 = v53;
  }
  else
  {
    uint64_t v55 = v137;
    uint64_t v138 = *(void (**)(char *, uint64_t))(v137 + 8);
    v138(v25, v44);

    uint64_t v121 = *(char **)(v139 + 8);
    ((void (*)(char *, uint64_t))v121)(v41, v140);
  }
  uint64_t v57 = v135;
  uint64_t v56 = v136;
  sub_10003FAE0();
  v42(v57, v56, v44);
  int v58 = (*(uint64_t (**)(char *, uint64_t))(v55 + 88))(v57, v44);
  uint64_t v59 = enum case for HistoricalUsageError.invalidEnergySite(_:);
  LODWORD(v126) = enum case for HistoricalUsageError.invalidEnergySite(_:);
  if (v58 != enum case for HistoricalUsageError.invalidEnergySite(_:))
  {
    if (v58 == enum case for HistoricalUsageError.gettingUsageData(_:))
    {
      uint64_t v136 = a2;
      os_log_type_t v70 = v117;
      sub_10003F850();
      BOOL v71 = sub_10003F870();
      os_log_type_t v72 = sub_10003FD50();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = (uint8_t *)swift_slowAlloc();
        uint64_t v144 = (char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v73 = 136315138;
        uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
        uint64_t v55 = v137;
        uint64_t v68 = v122;
        sub_10003FD90();
        _os_log_impl((void *)&_mh_execute_header, v71, v72, "%s: historical usage is still loading (or a transient error), displaying empty, retrying as soon as WidgetKit allows...", v73, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        ((void (*)(char *, uint64_t))v121)(v70, v140);
        uint64_t v74 = v136;
        uint64_t v59 = v126;
LABEL_27:
        sub_10003F130();
        uint64_t v92 = v123;
        sub_10003FAD0();
        (*(void (**)(char *, uint64_t))(v141 + 8))(v68, v142);
        uint64_t v93 = v125;
        uint64_t v94 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
LABEL_28:
        uint64_t v95 = v124;
        v94(v74, v124);
        (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v74, v92, v95);
        goto LABEL_29;
      }
LABEL_26:

      ((void (*)(char *, uint64_t))v121)(v70, v140);
      uint64_t v74 = v136;
      uint64_t v59 = v126;
      uint64_t v68 = v122;
      goto LABEL_27;
    }
    if (v58 == enum case for HistoricalUsageError.noUsageDataAvailable(_:))
    {
      sub_10003F850();
      uint64_t v78 = v116;
      v42(v116, v136, v44);
      int v79 = sub_10003F870();
      os_log_type_t v80 = sub_10003FD30();
      int v81 = v80;
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v82 = swift_slowAlloc();
        os_log_t v120 = v79;
        uint64_t v83 = v82;
        uint64_t v118 = (void (*)(uint64_t, char *, uint64_t))swift_slowAlloc();
        uint64_t v135 = (char *)swift_slowAlloc();
        uint64_t v136 = a2;
        uint64_t v144 = v135;
        *(_DWORD *)uint64_t v83 = 136315394;
        uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
        LODWORD(v117) = v81;
        sub_10003FD90();
        *(_WORD *)(v83 + 12) = 2112;
        sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
        swift_allocError();
        os_log_t v119 = v37;
        uint64_t v84 = v44;
        v42(v85, (uint64_t)v78, v44);
        uint64_t v86 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v143 = v86;
        uint64_t v87 = v122;
        sub_10003FD90();
        *(void *)uint64_t v118 = v86;
        uint64_t v44 = v84;
        uint64_t v68 = v87;
        v138(v78, v44);
        os_log_t v88 = v120;
        _os_log_impl((void *)&_mh_execute_header, v120, (os_log_type_t)v117, "%s: historical usage loading failed, erroring out widget, asking for 60 minute reload: %@", (uint8_t *)v83, 0x16u);
        sub_100009B04(&qword_10004CF68);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        a2 = v136;
        swift_slowDealloc();
        swift_slowDealloc();

        os_log_t v69 = v119;
        goto LABEL_7;
      }
      v138(v78, v44);

LABEL_12:
      ((void (*)(os_log_t, uint64_t))v121)(v37, v140);
      uint64_t v59 = v126;
      uint64_t v68 = v122;
      goto LABEL_13;
    }
    if (v58 == enum case for HistoricalUsageError.noUtilityFound(_:))
    {
      uint64_t v136 = a2;
      os_log_type_t v70 = v115;
      sub_10003F850();
      BOOL v71 = sub_10003F870();
      os_log_type_t v89 = sub_10003FD30();
      if (!os_log_type_enabled(v71, v89)) {
        goto LABEL_26;
      }
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      uint64_t v144 = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v90 = 136315138;
      uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
      uint64_t v55 = v137;
      uint64_t v68 = v122;
      sub_10003FD90();
      uint64_t v91 = "%s: Utility has been offboarded for EnergySite. Asking for 60 minute reload";
    }
    else
    {
      if (v58 != enum case for HistoricalUsageError.disconnectedSubscription(_:))
      {
        if (v58 != enum case for HistoricalUsageError.otherError(_:))
        {
          uint64_t v68 = v122;
          sub_10003F130();
          uint64_t v109 = v123;
          sub_10003FAD0();
          (*(void (**)(char *, uint64_t))(v141 + 8))(v68, v142);
          uint64_t v111 = v124;
          uint64_t v110 = v125;
          (*(void (**)(uint64_t, uint64_t))(v125 + 8))(a2, v124);
          (*(void (**)(uint64_t, char *, uint64_t))(v110 + 32))(a2, v109, v111);
          v138(v135, v44);
          goto LABEL_29;
        }
        uint64_t v136 = a2;
        uint64_t v105 = v113;
        sub_10003F850();
        uint64_t v106 = sub_10003F870();
        os_log_type_t v107 = sub_10003FD30();
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v108 = (uint8_t *)swift_slowAlloc();
          uint64_t v144 = (char *)swift_slowAlloc();
          *(_DWORD *)uint64_t v108 = 136315138;
          uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
          uint64_t v55 = v137;
          uint64_t v68 = v122;
          sub_10003FD90();
          _os_log_impl((void *)&_mh_execute_header, v106, v107, "%s: historical usage loading failed, but error is recoverable, asking for 60 minute reload", v108, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          ((void (*)(char *, uint64_t))v121)(v105, v140);
          uint64_t v59 = v126;
        }
        else
        {

          ((void (*)(char *, uint64_t))v121)(v105, v140);
          uint64_t v59 = v126;
          uint64_t v68 = v122;
        }
        sub_10003F130();
        uint64_t v92 = v123;
        sub_10003FAD0();
        (*(void (**)(char *, uint64_t))(v141 + 8))(v68, v142);
        uint64_t v93 = v125;
        uint64_t v94 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
        uint64_t v74 = v136;
        goto LABEL_28;
      }
      uint64_t v136 = a2;
      os_log_type_t v70 = v114;
      sub_10003F850();
      BOOL v71 = sub_10003F870();
      os_log_type_t v89 = sub_10003FD30();
      if (!os_log_type_enabled(v71, v89)) {
        goto LABEL_26;
      }
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      uint64_t v144 = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v90 = 136315138;
      uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
      uint64_t v55 = v137;
      uint64_t v68 = v122;
      sub_10003FD90();
      uint64_t v91 = "%s: Subscription disconnected, erroring out widget. Asking for 60 minute reload";
    }
    _os_log_impl((void *)&_mh_execute_header, v71, v89, v91, v90, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v121)(v70, v140);
    uint64_t v74 = v136;
    uint64_t v59 = v126;
    goto LABEL_27;
  }
  os_log_t v37 = v120;
  sub_10003F850();
  os_log_t v60 = v119;
  v42((char *)v119, v56, v44);
  uint64_t v61 = sub_10003F870();
  os_log_type_t v62 = sub_10003FD30();
  if (!os_log_type_enabled(v61, v62))
  {
    v138((char *)v60, v44);

    goto LABEL_12;
  }
  uint64_t v63 = swift_slowAlloc();
  uint64_t v118 = (void (*)(uint64_t, char *, uint64_t))swift_slowAlloc();
  uint64_t v135 = (char *)swift_slowAlloc();
  uint64_t v136 = a2;
  uint64_t v144 = v135;
  *(_DWORD *)uint64_t v63 = 136315394;
  uint64_t v143 = sub_100016708(0xD000000000000019, 0x8000000100043520, (uint64_t *)&v144);
  sub_10003FD90();
  *(_WORD *)(v63 + 12) = 2112;
  uint64_t v117 = (char *)(v63 + 14);
  sub_10003DF68(&qword_10004D3F8, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageError);
  swift_allocError();
  os_log_t v64 = v60;
  uint64_t v65 = v44;
  v42(v66, (uint64_t)v64, v44);
  uint64_t v67 = _swift_stdlib_bridgeErrorToNSError();
  uint64_t v143 = v67;
  uint64_t v68 = v122;
  uint64_t v55 = v137;
  sub_10003FD90();
  *(void *)uint64_t v118 = v67;
  uint64_t v44 = v65;
  v138((char *)v64, v65);
  _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: No site for available, erroring out widget. asking for 60 minute reload %@", (uint8_t *)v63, 0x16u);
  sub_100009B04(&qword_10004CF68);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_arrayDestroy();
  a2 = v136;
  swift_slowDealloc();
  swift_slowDealloc();

  os_log_t v69 = v37;
LABEL_7:
  ((void (*)(os_log_t, uint64_t))v121)(v69, v140);
  uint64_t v59 = v126;
LABEL_13:
  sub_10003F130();
  uint64_t v75 = v123;
  sub_10003FAD0();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v68, v142);
  uint64_t v77 = v124;
  uint64_t v76 = v125;
  (*(void (**)(uint64_t, uint64_t))(v125 + 8))(a2, v124);
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(a2, v75, v77);
LABEL_29:
  sub_10003F140();
  id v96 = v127;
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 104))(v127, v59, v44);
  unint64_t v98 = v128;
  uint64_t v97 = v129;
  uint64_t v99 = v131;
  (*(void (**)(char *, void, uint64_t))(v129 + 104))(v128, enum case for EnergySite.EnergyUsageTimeInterval.week(_:), v131);
  uint64_t v100 = v130;
  sub_10003F370();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v98, v99);
  v138(v96, v44);
  uint64_t v101 = sub_100023B7C();
  uint64_t v102 = v134;
  (*(void (**)(uint64_t, char *, uint64_t))(v141 + 32))(v134, v68, v142);
  uint64_t v103 = type metadata accessor for HistoricalUsageEntry();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v132 + 32))(v102 + *(int *)(v103 + 20), v100, v133);
  *(void *)(v102 + *(int *)(v103 + 24)) = v101;
  return result;
}

uint64_t sub_10003B444(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_100036410(a1, v4);
}

uint64_t sub_10003B4E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AEE4;
  return sub_100036C70(a1, v4);
}

uint64_t sub_10003B584(uint64_t *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_10003D640(*a1, a2, a3, a4);
}

uint64_t sub_10003B58C(uint64_t *a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_10003DA10(*a1, a2, a3, a4);
}

uint64_t sub_10003B594()
{
  sub_10003FDC0(54);
  v1._countAndFlagsBits = 0xD000000000000018;
  v1._object = (void *)0x8000000100043920;
  sub_10003FC50(v1);
  v2._countAndFlagsBits = sub_10003F150();
  sub_10003FC50(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 2106912;
  v3._object = (void *)0xE300000000000000;
  sub_10003FC50(v3);
  type metadata accessor for HistoricalUsageEntry();
  swift_retain();
  v4._countAndFlagsBits = sub_100021F48();
  sub_10003FC50(v4);
  swift_release();
  swift_bridgeObjectRelease();
  v5._object = (void *)0x8000000100043940;
  v5._countAndFlagsBits = 0xD000000000000015;
  sub_10003FC50(v5);
  sub_10003F3B0();
  sub_10003DF68(&qword_10004CCD0, (void (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot);
  v6._countAndFlagsBits = sub_10003FE50();
  sub_10003FC50(v6);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10003B708()
{
  return sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
}

uint64_t sub_10003B754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  Swift::String v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100008F20(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10003BBE4();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (uint64_t *)(v20[7] + 16 * v14);
      uint64_t result = *v21;
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
    *uint64_t v25 = a3;
    v25[1] = a4;
    uint64_t v26 = (uint64_t *)(v20[7] + 16 * v14);
    uint64_t *v26 = a1;
    v26[1] = a2;
    uint64_t v27 = v20[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      swift_bridgeObjectRetain();
      return 0;
    }
    goto LABEL_14;
  }
  sub_10003B8BC(v17, a5 & 1);
  unint64_t v23 = sub_100008F20(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    unint64_t v14 = v23;
    uint64_t v20 = (void *)*v6;
    if (v18) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10003FE80();
  __break(1u);
  return result;
}

uint64_t sub_10003B8BC(uint64_t a1, char a2)
{
  Swift::String v3 = v2;
  uint64_t v5 = *v2;
  sub_100009B04(&qword_10004D408);
  char v42 = a2;
  uint64_t v6 = sub_10003FE30();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    char v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          Swift::String v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_10003FE90();
    sub_10003FC40();
    uint64_t result = sub_10003FEA0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::String v3 = v39;
  char v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::String v3 = v7;
  return result;
}

void *sub_10003BBE4()
{
  Swift::String v1 = v0;
  sub_100009B04(&qword_10004D408);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003FE20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *Swift::String v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10003BDA0(uint64_t a1)
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
  int64_t v9 = (unint64_t *)(a1 + 80);
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

void *sub_10003BE28(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
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
    unsigned int v6 = (void *)(*(void *)(a5 + 56) + 16 * a2);
    uint64_t v7 = v6[1];
    *uint64_t result = *v6;
    result[1] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10003BEC4()
{
  uint64_t v1 = sub_10003F1D0();
  v0[15] = v1;
  v0[16] = *(void *)(v1 - 8);
  v0[17] = swift_task_alloc();
  uint64_t v2 = sub_10003F890();
  v0[18] = v2;
  v0[19] = *(void *)(v2 - 8);
  v0[20] = swift_task_alloc();
  v0[21] = swift_task_alloc();
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  v0[24] = swift_task_alloc();
  return _swift_task_switch(sub_10003C010, 0, 0);
}

uint64_t sub_10003C010()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  uint64_t v2 = sub_10000AEA8(0, &qword_10004C778);
  *uint64_t v1 = v0;
  v1[1] = sub_10003C104;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004C84, 0, v2);
}

uint64_t sub_10003C104()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003C200, 0, 0);
}

uint64_t sub_10003C200()
{
  uint64_t v54 = v0;
  uint64_t v1 = (void *)v0[6];
  id v2 = [v1 homes];

  sub_10000AEA8(0, &qword_10004C7B0);
  unint64_t v3 = sub_10003FC80();
  v0[26] = v3;

  v0[5] = _swiftEmptyDictionarySingleton;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003FE10();
    swift_bridgeObjectRelease();
    v0[27] = v4;
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[27] = v4;
    if (v4)
    {
LABEL_3:
      uint64_t v5 = sub_10003FA90();
      v0[28] = v5;
      if (v4 < 1)
      {
        __break(1u);
      }
      else
      {
        v0[29] = 0;
        uint64_t v7 = v0[26];
        if ((v7 & 0xC000000000000001) != 0) {
          id v8 = (id)sub_10003FDE0();
        }
        else {
          id v8 = *(id *)(v7 + 32);
        }
        int64_t v9 = v8;
        v0[30] = v8;
        sub_10003F860();
        id v10 = v9;
        uint64_t v11 = sub_10003F870();
        os_log_type_t v12 = sub_10003FD50();
        BOOL v13 = os_log_type_enabled(v11, v12);
        uint64_t v14 = v0[24];
        uint64_t v16 = v0[18];
        uint64_t v15 = v0[19];
        if (v13)
        {
          uint64_t v50 = v0[24];
          uint64_t v51 = v0[18];
          uint64_t v47 = v0[17];
          uint64_t v48 = v0[16];
          uint64_t v49 = v0[15];
          uint64_t v17 = swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315650;
          v0[12] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v53);
          sub_10003FD90();
          *(_WORD *)(v17 + 12) = 2080;
          id v18 = [v10 name];
          uint64_t v19 = sub_10003FC10();
          os_log_type_t type = v12;
          unint64_t v21 = v20;

          v0[13] = sub_100016708(v19, v21, &v53);
          sub_10003FD90();
          swift_bridgeObjectRelease();

          *(_WORD *)(v17 + 22) = 2080;
          id v22 = [v10 uniqueIdentifier];
          sub_10003F1B0();

          uint64_t v23 = sub_10003F190();
          unint64_t v25 = v24;
          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
          v0[14] = sub_100016708(v23, v25, &v53);
          sub_10003FD90();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v11, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v17, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          unint64_t v26 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v26(v50, v51);
        }
        else
        {

          unint64_t v26 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v26(v14, v16);
        }
        v0[31] = v26;
        uint64_t v28 = v0[16];
        uint64_t v27 = v0[17];
        uint64_t v29 = v0[15];
        id v30 = [v10 uniqueIdentifier];
        sub_10003F1B0();

        uint64_t v31 = sub_10003F190();
        uint64_t v33 = v32;
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v0[32] = v34;
        v0[33] = (v28 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v34(v27, v29);
        uint64_t v35 = (void *)swift_task_alloc();
        v0[34] = v35;
        *uint64_t v35 = v0;
        v35[1] = sub_10003C8D0;
        uint64_t v5 = v31;
        uint64_t v6 = v33;
      }
      return EnergySite.__allocating_init(clientProvidedID:)(v5, v6);
    }
  }
  swift_bridgeObjectRelease();
  sub_10003F850();
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_10003F870();
  os_log_type_t v37 = sub_10003FD50();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v40 = v0[19];
  uint64_t v39 = v0[20];
  uint64_t v41 = v0[18];
  if (v38)
  {
    uint64_t v52 = v0[18];
    uint64_t v42 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136315394;
    v0[7] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v53);
    sub_10003FD90();
    *(_WORD *)(v42 + 12) = 2048;
    v0[8] = _swiftEmptyDictionarySingleton[2];
    sub_10003FD90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s found %ld onboarded homes", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v52);
  }
  else
  {
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  }
  swift_beginAccess();
  uint64_t v43 = v0[5];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = (uint64_t (*)(uint64_t))v0[1];
  return v44(v43);
}

uint64_t sub_10003C8D0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 280) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10003C9D0, 0, 0);
}

uint64_t sub_10003C9D0()
{
  uint64_t v109 = v0;
  if (!v0[35])
  {
    id v18 = (void *)v0[30];
    sub_10003F860();
    id v19 = v18;
    unint64_t v20 = sub_10003F870();
    os_log_type_t v21 = sub_10003FD30();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = (void *)v0[30];
    unint64_t v24 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v25 = v0[21];
    uint64_t v26 = v0[18];
    if (!v22)
    {

      v24(v25, v26);
      goto LABEL_14;
    }
    uint64_t v104 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v27 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315394;
    *(void *)(v27 + 4) = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    *(_WORD *)(v27 + 12) = 2080;
    id v28 = [v23 name];
    uint64_t v29 = sub_10003FC10();
    unint64_t v31 = v30;

    *(void *)(v27 + 14) = sub_100016708(v29, v31, &v108);
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v32 = v25;
    uint64_t v33 = v26;
    goto LABEL_9;
  }
  if ((sub_10003FA80() & 1) == 0)
  {
    sub_10003F850();
    swift_retain_n();
    uint64_t v34 = sub_10003F870();
    os_log_type_t v35 = sub_10003FD50();
    BOOL v36 = os_log_type_enabled(v34, v35);
    BOOL v38 = (void *)v0[30];
    os_log_type_t v37 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v39 = v0[23];
    uint64_t v40 = v0[18];
    if (!v36)
    {

      swift_release_n();
      v37(v39, v40);
      goto LABEL_14;
    }
    uint64_t v104 = (void (*)(uint64_t, uint64_t))v0[31];
    uint64_t v41 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 136315394;
    *(void *)(v41 + 4) = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    *(_WORD *)(v41 + 12) = 2080;
    uint64_t v42 = sub_10003FA60();
    *(void *)(v41 + 14) = sub_100016708(v42, v43, &v108);
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    uint64_t v32 = v39;
    uint64_t v33 = v40;
LABEL_9:
    v104(v32, v33);
    goto LABEL_14;
  }
  uint64_t v1 = (void *)v0[30];
  sub_10003F850();
  id v2 = v1;
  swift_retain_n();
  id v3 = v2;
  uint64_t v4 = sub_10003F870();
  os_log_type_t v5 = sub_10003FD50();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v8 = (void *)v0[30];
  uint64_t v7 = (void (*)(uint64_t, uint64_t))v0[31];
  uint64_t v9 = v0[22];
  uint64_t v10 = v0[18];
  if (v6)
  {
    os_log_type_t type = v5;
    *(void *)uint64_t v103 = v0[22];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v108 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    v0[9] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
    sub_10003FD90();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v98 = v10;
    uint64_t v12 = sub_10003FA60();
    v0[10] = sub_100016708(v12, v13, &v108);
    sub_10003FD90();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 22) = 2080;
    id v14 = [v8 name];
    uint64_t v15 = sub_10003FC10();
    unint64_t v17 = v16;

    v0[11] = sub_100016708(v15, v17, &v108);
    sub_10003FD90();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, type, "%s Site %s onboarded for '%s', adding to list...", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v7(*(void *)v103, v98);
  }
  else
  {
    swift_release_n();

    v7(v9, v10);
  }
  uint64_t v44 = (void (*)(uint64_t, uint64_t))v0[32];
  os_log_type_t v45 = (void *)v0[30];
  uint64_t v46 = v0[17];
  uint64_t v47 = v0[15];
  id v48 = [v45 uniqueIdentifier];
  sub_10003F1B0();

  uint64_t v49 = sub_10003F190();
  uint64_t v51 = v50;
  v44(v46, v47);
  uint64_t v52 = sub_10003FA60();
  uint64_t v54 = v53;
  uint64_t v55 = v0[5];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v108 = v55;
  v0[5] = 0x8000000000000000;
  sub_10003B754(v49, v51, v52, v54, isUniquelyReferenced_nonNull_native);
  v0[5] = v108;
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_14:
  uint64_t v57 = v0[29] + 1;
  if (v57 == v0[27])
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = v0[5];
    sub_10003F850();
    swift_bridgeObjectRetain();
    uint64_t v59 = sub_10003F870();
    os_log_type_t v60 = sub_10003FD50();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v63 = v0[19];
    uint64_t v62 = v0[20];
    uint64_t v64 = v0[18];
    if (v61)
    {
      uint64_t v106 = v0[20];
      uint64_t v65 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136315394;
      v0[7] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
      sub_10003FD90();
      *(_WORD *)(v65 + 12) = 2048;
      v0[8] = *(void *)(v58 + 16);
      sub_10003FD90();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s found %ld onboarded homes", (uint8_t *)v65, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v106, v64);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v64);
    }
    swift_beginAccess();
    uint64_t v68 = v0[5];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_t v69 = (uint64_t (*)(uint64_t))v0[1];
    return v69(v68);
  }
  else
  {
    v0[29] = v57;
    uint64_t v66 = v0[26];
    if ((v66 & 0xC000000000000001) != 0) {
      id v67 = (id)sub_10003FDE0();
    }
    else {
      id v67 = *(id *)(v66 + 8 * v57 + 32);
    }
    BOOL v71 = v67;
    v0[30] = v67;
    sub_10003F860();
    id v72 = v71;
    uint64_t v73 = sub_10003F870();
    os_log_type_t v74 = sub_10003FD50();
    BOOL v75 = os_log_type_enabled(v73, v74);
    uint64_t v76 = v0[24];
    uint64_t v78 = v0[18];
    uint64_t v77 = v0[19];
    if (v75)
    {
      os_log_type_t v105 = v74;
      uint64_t v99 = v0[17];
      uint64_t v100 = v0[16];
      *(void *)unsigned int typea = v0[15];
      uint64_t v79 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 136315650;
      v0[12] = sub_100016708(0xD000000000000022, 0x80000001000434B0, &v108);
      sub_10003FD90();
      *(_WORD *)(v79 + 12) = 2080;
      id v80 = [v72 name];
      uint64_t v81 = sub_10003FC10();
      os_log_t log = v73;
      unint64_t v83 = v82;

      v0[13] = sub_100016708(v81, v83, &v108);
      sub_10003FD90();
      swift_bridgeObjectRelease();

      *(_WORD *)(v79 + 22) = 2080;
      id v84 = [v72 uniqueIdentifier];
      sub_10003F1B0();

      uint64_t v85 = sub_10003F190();
      unint64_t v87 = v86;
      (*(void (**)(uint64_t, os_log_type_t *))(v100 + 8))(v99, *(os_log_type_t **)typea);
      v0[14] = sub_100016708(v85, v87, &v108);
      sub_10003FD90();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, log, v105, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v79, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    os_log_t v88 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
    v88(v76, v78);
    v0[31] = v88;
    uint64_t v90 = v0[16];
    uint64_t v89 = v0[17];
    uint64_t v91 = v0[15];
    id v92 = [v72 uniqueIdentifier];
    sub_10003F1B0();

    uint64_t v93 = sub_10003F190();
    uint64_t v95 = v94;
    id v96 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
    v0[32] = v96;
    v0[33] = (v90 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v96(v89, v91);
    uint64_t v97 = (void *)swift_task_alloc();
    v0[34] = v97;
    *uint64_t v97 = v0;
    v97[1] = sub_10003C8D0;
    return EnergySite.__allocating_init(clientProvidedID:)(v93, v95);
  }
}

uint64_t sub_10003D640(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v30 = a1;
  uint64_t v29 = type metadata accessor for HistoricalUsageEntry();
  __chkstk_darwin(v29);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003F890();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10003F200();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10003F260();
  uint64_t v15 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  unint64_t v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Calendar.Identifier.gregorian(_:), v11);
  sub_10003F210();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_10003F850();
  id v18 = sub_10003F870();
  os_log_type_t v19 = sub_10003FD30();
  if (os_log_type_enabled(v18, v19))
  {
    v24[1] = a4;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v25 = a3;
    os_log_type_t v21 = (uint8_t *)v20;
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v21 = 136315138;
    uint64_t v31 = sub_100016708(0xD00000000000001FLL, 0x8000000100043470, &v32);
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s THIS SHOULD NEVER GET CALLED", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v25;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  sub_10003F140();
  uint64_t v22 = v29;
  sub_10003F360();
  *(void *)&v7[*(int *)(v22 + 24)] = v30;
  swift_retain();
  a3(v7);
  sub_10003DEAC((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v26);
}

uint64_t sub_10003DA10(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v36 = a1;
  uint64_t v6 = sub_10003FB00();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009B04(&qword_10004D3D8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v35 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for HistoricalUsageEntry();
  uint64_t v33 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  __chkstk_darwin(v12);
  id v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10003F890();
  uint64_t v15 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  unint64_t v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F850();
  id v18 = sub_10003F870();
  os_log_type_t v19 = sub_10003FD30();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v30 = v9;
    uint64_t v20 = swift_slowAlloc();
    v28[1] = v8;
    os_log_type_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v31 = a4;
    uint64_t v38 = v22;
    uint64_t v29 = v10;
    *(_DWORD *)os_log_type_t v21 = 136315138;
    uint64_t v37 = sub_100016708(0xD00000000000001FLL, 0x8000000100043450, &v38);
    uint64_t v10 = v29;
    uint64_t v9 = v30;
    sub_10003FD90();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s THIS SHOULD NEVER GET CALLED", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v32);
  sub_10003F140();
  uint64_t v23 = v34;
  sub_10003F390();
  *(void *)&v14[*(int *)(v23 + 24)] = v36;
  sub_100009B04(&qword_10004D3E0);
  unint64_t v24 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100040DF0;
  sub_10003DE48((uint64_t)v14, v25 + v24);
  swift_retain();
  sub_10003FAF0();
  sub_10003DF68(qword_10004D3B0, (void (*)(uint64_t))type metadata accessor for HistoricalUsageEntry);
  uint64_t v26 = v35;
  sub_10003FB70();
  a3(v26);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v26, v9);
  return sub_10003DEAC((uint64_t)v14);
}

uint64_t sub_10003DE48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HistoricalUsageEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003DEAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HistoricalUsageEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003DF08(uint64_t a1)
{
  uint64_t v2 = sub_100009B04(&qword_10004D3F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003DF68(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10003DFB4()
{
  unint64_t result = qword_10004D428;
  if (!qword_10004D428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D428);
  }
  return result;
}

unint64_t sub_10003E008()
{
  sub_10003FDC0(18);
  swift_bridgeObjectRelease();
  sub_10003EFB0();
  sub_100009B04(&qword_10004D050);
  v1._countAndFlagsBits = sub_10003FC30();
  sub_10003FC50(v1);
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

uint64_t sub_10003E0BC()
{
  uint64_t v0 = sub_10003F0C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003F1F0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10003FBF0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10003F0E0();
  sub_10000AB4C(v6, qword_10004D588);
  sub_10000AB14(v6, (uint64_t)qword_10004D588);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10003F0F0();
}

unint64_t sub_10003E2B0()
{
  return sub_10003E008();
}

unint64_t sub_10003E2BC()
{
  unint64_t result = qword_10004D430;
  if (!qword_10004D430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D430);
  }
  return result;
}

unint64_t sub_10003E314()
{
  unint64_t result = qword_10004D438;
  if (!qword_10004D438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D438);
  }
  return result;
}

uint64_t sub_10003E368()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003E3B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10004C768 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10003F0E0();
  uint64_t v3 = sub_10000AB14(v2, (uint64_t)qword_10004D588);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10003E460(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10001FC44();
  void *v4 = v2;
  v4[1] = sub_10000F72C;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10003E50C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003E580();
  *a1 = result;
  return result;
}

uint64_t sub_10003E534(uint64_t a1)
{
  unint64_t v2 = sub_10003DFB4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for UtilityRateInfoWidgetConfiguration()
{
  return &type metadata for UtilityRateInfoWidgetConfiguration;
}

uint64_t sub_10003E580()
{
  uint64_t v0 = sub_10003F020();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009B04(&qword_10004CAE8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v21 - v5;
  uint64_t v7 = sub_100009B04(&qword_10004CAF8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10003F0C0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10003F1F0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10003FBF0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10003F0E0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v21[1] = sub_100009B04(&qword_10004D058);
  sub_10003FBA0();
  sub_10003F1E0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10003F0F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  uint64_t v18 = sub_10003EF70();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v29 = 0;
  os_log_type_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_100022CA8();
  return sub_10003EFC0();
}

uint64_t sub_10003E9D8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10003EA0C()
{
  return sub_10003EBB8(1);
}

uint64_t sub_10003EA14(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_10004F368 == -1)
  {
    if (qword_10004F370) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_10004F368, 0, (dispatch_function_t)sub_10003EBB0);
    if (qword_10004F370) {
      return _availability_version_check();
    }
  }
  if (qword_10004F360 == -1)
  {
    BOOL v8 = dword_10004F350 < a2;
    if (dword_10004F350 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_10004F360, 0, (dispatch_function_t)sub_10003EA0C);
    BOOL v8 = dword_10004F350 < a2;
    if (dword_10004F350 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_10004F354 > a3) {
    return 1;
  }
  return dword_10004F354 >= a3 && dword_10004F358 >= a4;
}

uint64_t sub_10003EBB0()
{
  return sub_10003EBB8(0);
}

uint64_t sub_10003EBB8(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_10004F370;
  if (qword_10004F370) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_10004F370 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    long long v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          long long v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              long long v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  os_log_type_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_10004F350, &dword_10004F354, &dword_10004F358);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    os_log_type_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  os_log_type_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                os_log_type_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          os_log_type_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10003EF00()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10003EF10()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10003EF20()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10003EF30()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10003EF40()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10003EF70()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10003EF80()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_10003EF90()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_10003EFA0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_10003EFB0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10003EFC0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10003EFD0()
{
  return IntentItemCollection.init<>(promptLabel:usesIndexedCollation:items:)();
}

uint64_t sub_10003EFE0()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_10003EFF0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10003F000()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10003F010()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10003F020()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10003F030()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10003F040()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10003F050()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10003F060()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10003F090()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_10003F0A0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10003F0B0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10003F0C0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10003F0D0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10003F0E0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10003F0F0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10003F100()
{
  return URL.init(string:)();
}

uint64_t sub_10003F110()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10003F120()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_10003F130()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10003F140()
{
  return static Date.now.getter();
}

uint64_t sub_10003F150()
{
  return Date.formatted()()._countAndFlagsBits;
}

uint64_t sub_10003F160()
{
  return Date.init()();
}

uint64_t sub_10003F170()
{
  return type metadata accessor for Date();
}

uint64_t sub_10003F180()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10003F190()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10003F1A0()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_10003F1B0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003F1C0()
{
  return UUID.init()();
}

uint64_t sub_10003F1D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10003F1E0()
{
  return static Locale.current.getter();
}

uint64_t sub_10003F1F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10003F200()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_10003F210()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_10003F220()
{
  return Calendar.date(from:)();
}

uint64_t sub_10003F230()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_10003F240()
{
  return static Calendar.current.getter();
}

uint64_t sub_10003F250()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10003F260()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10003F270()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10003F280()
{
  return RectangularLockEnergyForecastView.init(referenceDate:widgetStartDate:energyWindow:gridForecastError:)();
}

uint64_t sub_10003F290()
{
  return type metadata accessor for RectangularLockEnergyForecastView();
}

uint64_t sub_10003F2A0()
{
  return type metadata accessor for GridForecastError();
}

uint64_t sub_10003F2B0()
{
  return static GridForecastSnapshot.staticSnapshotWithWindowsType(_:)();
}

uint64_t sub_10003F2C0()
{
  return static GridForecastSnapshot.staticSnapshotWithError(_:)();
}

uint64_t sub_10003F2D0()
{
  return GridForecastSnapshot.description.getter();
}

uint64_t sub_10003F2E0()
{
  return GridForecastSnapshot.energyWindows.getter();
}

uint64_t sub_10003F2F0()
{
  return GridForecastSnapshot.type.getter();
}

uint64_t sub_10003F300()
{
  return GridForecastSnapshot.error.getter();
}

uint64_t sub_10003F310()
{
  return type metadata accessor for GridForecastSnapshot();
}

uint64_t sub_10003F320()
{
  return type metadata accessor for HistoricalUsageError();
}

uint64_t sub_10003F330()
{
  return type metadata accessor for UtilityRateInfoError();
}

uint64_t sub_10003F340()
{
  return GridForecastWidgetView.init(energyWindows:forecastUIProvider:referenceTime:numHoursToDisplay:debugText:)();
}

uint64_t sub_10003F350()
{
  return type metadata accessor for GridForecastWidgetView();
}

uint64_t sub_10003F360()
{
  return static HistoricalUsageSnapshot.staticWidgetPlaceholderSnapshot(calendar:)();
}

uint64_t sub_10003F370()
{
  return static HistoricalUsageSnapshot.dynamicSnapshotWithError(_:interval:)();
}

uint64_t sub_10003F380()
{
  return static HistoricalUsageSnapshot.dynamicMockNoDataWeekly.getter();
}

uint64_t sub_10003F390()
{
  return static HistoricalUsageSnapshot.dynamicMockStaticNoSubintervalsForWeek.getter();
}

uint64_t sub_10003F3A0()
{
  return HistoricalUsageSnapshot.error.getter();
}

uint64_t sub_10003F3B0()
{
  return type metadata accessor for HistoricalUsageSnapshot();
}

uint64_t sub_10003F3C0()
{
  return static UtilityRateInfoSnapshot.noUtilitySnapshot.getter();
}

uint64_t sub_10003F3D0()
{
  return static UtilityRateInfoSnapshot.loadingSnapshot.getter();
}

uint64_t sub_10003F3E0()
{
  return static UtilityRateInfoSnapshot.mockETOUCSnapshotOne.getter();
}

uint64_t sub_10003F3F0()
{
  return static UtilityRateInfoSnapshot.placeholderETOUCSnapshot.getter();
}

uint64_t sub_10003F400()
{
  return UtilityRateInfoSnapshot.error.getter();
}

uint64_t sub_10003F410()
{
  return UtilityRateInfoSnapshot.peakUntil.getter();
}

uint64_t sub_10003F420()
{
  return type metadata accessor for UtilityRateInfoSnapshot();
}

uint64_t sub_10003F430()
{
  return type metadata accessor for GridForecastSnapshotType();
}

uint64_t sub_10003F440()
{
  return HistoricalUsageWidgetView.init(widgetDate:usageSnapshot:homeName:)();
}

uint64_t sub_10003F450()
{
  return type metadata accessor for HistoricalUsageWidgetView();
}

uint64_t sub_10003F460()
{
  return UtilityRateInfoWidgetView.init(snapshot:homeName:)();
}

uint64_t sub_10003F470()
{
  return type metadata accessor for UtilityRateInfoWidgetView();
}

uint64_t sub_10003F480()
{
  return CircularHistoricalUsageView.init(widgetStartDate:usageSnapshot:)();
}

uint64_t sub_10003F490()
{
  return type metadata accessor for CircularHistoricalUsageView();
}

uint64_t sub_10003F4A0()
{
  return CircularUtilityRateInfoView.init(widgetStartDate:infoSnapshot:)();
}

uint64_t sub_10003F4B0()
{
  return type metadata accessor for CircularUtilityRateInfoView();
}

uint64_t sub_10003F4E0()
{
  return type metadata accessor for GridForecastSnapshotManager.SnapshotManagerType();
}

uint64_t sub_10003F4F0()
{
  return GridForecastSnapshotManager.init(type:location:locationName:locationUUID:)();
}

uint64_t sub_10003F500()
{
  return type metadata accessor for GridForecastSnapshotManager();
}

uint64_t sub_10003F510()
{
  return dispatch thunk of HistoricalUsageSnapshotManager.snapshotForInterval(_:summary:)();
}

uint64_t sub_10003F530()
{
  return type metadata accessor for HistoricalUsageSnapshotManager();
}

uint64_t sub_10003F540()
{
  return RectangularLockUtilityInfoView.init(widgetStartDate:infoSnapshot:)();
}

uint64_t sub_10003F550()
{
  return type metadata accessor for RectangularLockUtilityInfoView();
}

uint64_t sub_10003F560()
{
  return dispatch thunk of UtilityRateInfoSnapshotManager.infoSnapshot.getter();
}

uint64_t sub_10003F580()
{
  return type metadata accessor for UtilityRateInfoSnapshotManager();
}

uint64_t sub_10003F590()
{
  return RectangularLockHistoricalUsageView.init(widgetStartDate:usageSnapshot:)();
}

uint64_t sub_10003F5A0()
{
  return type metadata accessor for RectangularLockHistoricalUsageView();
}

uint64_t sub_10003F5B0()
{
  return static HEUIDate.numHoursToDisplayInSmallWidget.getter();
}

uint64_t sub_10003F5C0()
{
  return static HEUIDate.numHoursToDisplayInAppGridForecast.getter();
}

uint64_t sub_10003F5D0()
{
  return EnergyWindow.endDate.getter();
}

uint64_t sub_10003F5E0()
{
  return type metadata accessor for EnergyWindow();
}

uint64_t sub_10003F5F0()
{
  return EnergyWindows.cleanEnergyWindowForDate(referenceDate:)();
}

uint64_t sub_10003F600()
{
  return EnergyWindows.energyWindowForDate(referenceDate:)();
}

uint64_t sub_10003F610()
{
  return type metadata accessor for EnergyWindows.MockType();
}

uint64_t sub_10003F620()
{
  return EnergyWindows.windows.getter();
}

uint64_t sub_10003F630()
{
  return type metadata accessor for EnergyWindows();
}

uint64_t sub_10003F650()
{
  return type metadata accessor for StaticHome();
}

uint64_t sub_10003F670()
{
  return static DataModel.signposter.getter();
}

uint64_t sub_10003F680()
{
  return dispatch thunk of DataModel.homeManager.getter();
}

uint64_t sub_10003F690()
{
  return dispatch thunk of DataModel.homeManager.setter();
}

uint64_t sub_10003F6A0()
{
  return static DataModel.modelLogger.getter();
}

uint64_t sub_10003F6C0()
{
  return dispatch thunk of DataModel.homesToStateSnapshots.getter();
}

uint64_t sub_10003F6D0()
{
  return static DataModel.shared.getter();
}

uint64_t sub_10003F6E0()
{
  return static DataModel.context.getter();
}

uint64_t sub_10003F6F0()
{
  return type metadata accessor for DataModel();
}

uint64_t sub_10003F700()
{
  return StateSnapshot.staticHome.getter();
}

uint64_t sub_10003F710()
{
  return type metadata accessor for StateSnapshot.Coverage();
}

uint64_t sub_10003F720()
{
  return StateSnapshot.coverages.getter();
}

uint64_t sub_10003F730()
{
  return type metadata accessor for StateSnapshot();
}

uint64_t sub_10003F740()
{
  return static EKLocation.invalidLocation.getter();
}

uint64_t sub_10003F750()
{
  return static EKLocation.safeLog(_:)();
}

uint64_t sub_10003F760()
{
  return static EKDateUtilities.nearestTenAM()();
}

uint64_t sub_10003F770()
{
  return static EKDateUtilities.oneHour.getter();
}

uint64_t sub_10003F780()
{
  return static EKDateUtilities.endOfDay(for:with:)();
}

uint64_t sub_10003F790()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_10003F7A0()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_10003F7B0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_10003F7C0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_10003F7D0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_10003F7E0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_10003F7F0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_10003F800()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_10003F810()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_10003F820()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_10003F830()
{
  return static Logger.utilityRateWidgets.getter();
}

uint64_t sub_10003F840()
{
  return static Logger.gridForecastWidgets.getter();
}

uint64_t sub_10003F850()
{
  return static Logger.historicalUsageWidgets.getter();
}

uint64_t sub_10003F860()
{
  return static Logger.other.getter();
}

uint64_t sub_10003F870()
{
  return Logger.logObject.getter();
}

uint64_t sub_10003F880()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10003F890()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10003F8A0()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_10003F8B0()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t sub_10003F8C0()
{
  return AppStorage.wrappedValue.setter();
}

uint64_t sub_10003F8D0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10003F8E0()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_10003F8F0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10003F900()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10003F910()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10003F920()
{
  return EnvironmentValues.widgetRenderingMode.setter();
}

uint64_t sub_10003F930()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10003F940()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10003F950()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10003F960()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10003F970()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10003F980()
{
  return WidgetConfiguration._contentMarginsDisabled()();
}

uint64_t sub_10003F990()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10003F9A0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10003F9B0()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_10003F9C0()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_10003F9D0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10003F9E0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10003F9F0()
{
  return View.widgetURL(_:)();
}

uint64_t sub_10003FA00()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10003FA10()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10003FA20()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10003FA30()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_10003FA40()
{
  return static Alignment.center.getter();
}

uint64_t sub_10003FA50()
{
  return type metadata accessor for EnergySite.EnergyUsageTimeInterval();
}

uint64_t sub_10003FA60()
{
  return EnergySite.identifier.getter();
}

uint64_t sub_10003FA80()
{
  return EnergySite.utilityOnboarded.getter();
}

uint64_t sub_10003FA90()
{
  return type metadata accessor for EnergySite();
}

uint64_t sub_10003FAA0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_10003FAB0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_10003FAC0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_10003FAD0()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_10003FAE0()
{
  return static TimelineReloadPolicy.atEnd.getter();
}

uint64_t sub_10003FAF0()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_10003FB00()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_10003FB10()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_10003FB20()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_10003FB30()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_10003FB50()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_10003FB70()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_10003FB80()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10003FB90()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10003FBA0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_10003FBB0(Swift::String a1)
{
}

void sub_10003FBC0(Swift::String a1)
{
}

uint64_t sub_10003FBD0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10003FBE0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_10003FBF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10003FC00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10003FC10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FC20()
{
  return String.init(format:_:)();
}

uint64_t sub_10003FC30()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10003FC40()
{
  return String.hash(into:)();
}

void sub_10003FC50(Swift::String a1)
{
}

Swift::Int sub_10003FC60()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10003FC70()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10003FC80()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003FC90()
{
  return Array.description.getter();
}

uint64_t sub_10003FCA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10003FCB0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10003FCC0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10003FCD0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10003FCE0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10003FCF0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10003FD00()
{
  return static Collection<>.all.getter();
}

uint64_t sub_10003FD10()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10003FD20()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10003FD30()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10003FD40()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10003FD50()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10003FD60()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_10003FD70()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_10003FD80()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_10003FD90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10003FDA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10003FDB0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10003FDC0(Swift::Int a1)
{
}

uint64_t sub_10003FDD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10003FDE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10003FDF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10003FE00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10003FE10()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10003FE20()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10003FE30()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10003FE40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10003FE50()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10003FE70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10003FE80()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10003FE90()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10003FEA0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}