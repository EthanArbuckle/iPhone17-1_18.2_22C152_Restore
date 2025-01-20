uint64_t sub_10000204C()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;
  Swift::String v7;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection);
  v2 = [v1 description];
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);

  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return 0x6576726553435058;
}

uint64_t sub_10000227C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  return _swift_task_switch(sub_100002308, 0, 0);
}

uint64_t sub_100002308()
{
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_1000023AC;
  uint64_t v2 = *(void *)(v0 + 16);
  return sub_100005A40(v2);
}

uint64_t sub_1000023AC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100002518, 0, 0);
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 24);
    uint64_t v3 = *(void *)(v2 + 32);

    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    _Block_release(*(const void **)(v2 + 32));
    v5 = *(uint64_t (**)(void))(v2 + 8);
    return v5();
  }
}

uint64_t sub_100002518()
{
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);

  uint64_t v3 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

  _Block_release(*(const void **)(v0 + 32));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100002744(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  if (a2) {
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  v4[5] = v8;
  id v9 = a1;
  id v10 = a4;
  return _swift_task_switch(sub_1000027F4, 0, 0);
}

uint64_t sub_1000027F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_10000289C;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[2];
  return sub_100009868(v3, v2);
}

uint64_t sub_10000289C()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v1[2](v1, 0);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_100002B90(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3[5] = v5;
  id v6 = a3;
  return _swift_task_switch(sub_100002C1C, 0, 0);
}

uint64_t sub_100002C1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_100002CC0;
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  return sub_10000A028(v3, v2);
}

uint64_t sub_100002CC0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100002E30, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 24);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    _Block_release(*(const void **)(v2 + 24));
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_100002E30()
{
  uint64_t v1 = *(void *)(v0 + 24);

  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  _Block_release(*(const void **)(v0 + 24));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100003058(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3[5] = v5;
  id v6 = a3;
  return _swift_task_switch(sub_1000030E4, 0, 0);
}

uint64_t sub_1000030E4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_100003188;
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  return sub_10000AA14(v3, v2);
}

uint64_t sub_100003188()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100005178, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 24);

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    _Block_release(*(const void **)(v2 + 24));
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_1000032F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return _swift_task_switch(sub_100003320, 0, 0);
}

uint64_t sub_100003320()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  void *v1 = v0;
  v1[1] = sub_1000033BC;
  return sub_10000B990();
}

uint64_t sub_1000033BC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1000035BC;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_1000034E4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000034E4()
{
  unint64_t v1 = v0[9];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100004BE8(v1, v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void (*)(void *, void))v0[5];
  if (v4)
  {
    id v6 = v4;
    v5(v4, 0);
  }
  else
  {
    v5(0, 0);
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1000035BC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (void (*)(void, uint64_t))v0[5];
  swift_errorRetain();
  v2(0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10000364C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004584(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100003980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_100003B58(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_100003BD0, 0, 0);
}

uint64_t sub_100003BD0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_100003C6C;
  return sub_10000B990();
}

uint64_t sub_100003C6C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100003E40;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v5 = sub_100003D94;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100003D94()
{
  sub_1000048A8();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void (***)(void, void, void))(v0 + 24);
  ((void (**)(void, Class, void))v2)[2](v2, isa, 0);

  _Block_release(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100003E40()
{
  uint64_t v1 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  uint64_t v2 = *(void (***)(void, void, void))(v0 + 24);
  ((void (**)(void, void, void *))v2)[2](v2, 0, v1);

  _Block_release(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_100003EE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdXPCServer();
  return [super dealloc];
}

uint64_t type metadata accessor for KCSharingMessagingdXPCServer()
{
  return self;
}

uint64_t sub_100003F84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003FC8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004008()
{
  objc_super v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100005170;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1000255A8 + dword_1000255A8);
  return v5(v2, v3);
}

uint64_t sub_1000040B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005170;
  return v6();
}

uint64_t sub_100004184()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005170;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000255B8 + dword_1000255B8);
  return v6(v2, v3, v4);
}

uint64_t sub_100004244(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100005170;
  return v7();
}

uint64_t sub_100004314(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005170;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000255C8 + dword_1000255C8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000043E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004584(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004584(uint64_t a1)
{
  uint64_t v2 = sub_100003F84(&qword_1000255A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000045E4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000046C0;
  return v6(a1);
}

uint64_t sub_1000046C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000047B8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000047F0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005170;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000255D8 + dword_1000255D8);
  return v6(a1, v4);
}

unint64_t sub_1000048A8()
{
  unint64_t result = qword_1000255E8;
  if (!qword_1000255E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000255E8);
  }
  return result;
}

uint64_t sub_1000048E8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004920(uint64_t a1, uint64_t a2)
{
  sub_100003980(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100004928()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100004978()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_100005170;
  *(void *)(v5 + 48) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  return _swift_task_switch(sub_100003320, 0, 0);
}

uint64_t sub_100004A3C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100004AF4;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000258C8 + dword_1000258C8);
  return v6(a1, v4);
}

uint64_t sub_100004AF4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_100004BE8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        v13 = v10;
        uint64_t v14 = a3;
        id v15 = [v10 groupID:v22];
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100004D94()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005170;
  long long v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100025608 + dword_100025608);
  return v6(v2, v3, v4);
}

uint64_t sub_100004E54()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005170;
  long long v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100025628 + dword_100025628);
  return v6(v2, v3, v4);
}

uint64_t sub_100004F10()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100004F60()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *long long v6 = v1;
  v6[1] = sub_100005170;
  unint64_t v7 = (uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_100025648 + dword_100025648);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000502C()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005074()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100004AF4;
  long long v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100025668 + dword_100025668);
  return v6(v2, v3, v4);
}

uint64_t sub_100005130()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000517C()
{
  qword_1000256F0 = 0x444970756F7267;
  qword_1000256F8 = 0xE700000000000000;
}

void sub_1000051A0()
{
  qword_100025700 = 0x4C52556572616873;
  qword_100025708 = 0xE800000000000000;
}

void sub_1000051C4()
{
  qword_100025710 = 0x6974617469766E69;
  qword_100025718 = 0xEF6E656B6F546E6FLL;
}

void sub_1000051F4()
{
  HIWORD(qword_100025728) = -4864;
}

void sub_100005224()
{
  qword_100025730 = 0x656D6954746E6573;
  qword_100025738 = 0xE800000000000000;
}

void sub_100005248()
{
  qword_100025740 = 0x6D614E70756F7267;
  qword_100025748 = 0xE900000000000065;
}

char *sub_100005270()
{
  id v0 = [self sharedInvitationNotifier];
  id v1 = objc_allocWithZone((Class)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate());
  unint64_t result = sub_100005594(v0);
  qword_100025D30 = (uint64_t)result;
  return result;
}

void sub_1000052CC()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  v8[0] = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue;
  sub_1000142B8(0, (unint64_t *)&qword_100025828);
  static DispatchQoS.unspecified.getter();
  v8[1] = &_swiftEmptyArrayStorage;
  sub_10000FF00((unint64_t *)&qword_100025830, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100003F84(&qword_100025838);
  sub_10000EDE8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)&v0[v8[0]] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  unint64_t v7 = &v0[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier];
  *(void *)unint64_t v7 = 0xD000000000000023;
  *((void *)v7 + 1) = 0x800000010001AE70;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

char *sub_100005594(void *a1)
{
  v30 = a1;
  uint64_t v29 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  uint64_t v28 = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue;
  sub_1000142B8(0, (unint64_t *)&qword_100025828);
  unint64_t v7 = v1;
  static DispatchQoS.unspecified.getter();
  v33 = &_swiftEmptyArrayStorage;
  sub_10000FF00((unint64_t *)&qword_100025830, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100003F84(&qword_100025838);
  sub_10000EDE8();
  uint64_t v8 = v7;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v29);
  *(void *)(v27 + v28) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v9 = &v7[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier];
  *(void *)uint64_t v9 = 0xD000000000000023;
  *((void *)v9 + 1) = 0x800000010001AE70;
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_10000FBA4(v10, (uint64_t)qword_100025D50);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v33 = (void *)swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    uint64_t v31 = sub_100017798(0xD000000000000028, 0x800000010001AEA0, (uint64_t *)&v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "initing IDSInvitationManager with service name %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v14 = objc_allocWithZone((Class)IDSInvitationManager);
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v14 initWithServiceIdentifier:v15];

  *(void *)&v8[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] = v16;
  uint64_t v17 = v30;
  *(void *)&v8[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection] = v30;
  id v18 = v17;

  BOOL v19 = (objc_class *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate();
  v32.receiver = v8;
  v32.super_class = v19;
  char v20 = (char *)[super init];
  v21 = *(void **)&v20[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  uint64_t v22 = *(void **)&v20[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue];
  unint64_t v23 = v20;
  id v24 = v21;
  id v25 = v22;
  [v24 setDelegate:v23 queue:v25];

  return v23;
}

uint64_t sub_100005A40(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  sub_100003F84(&qword_1000258F0);
  v2[12] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return _swift_task_switch(sub_100005B40, 0, 0);
}

uint64_t sub_100005B40()
{
  uint64_t v65 = v0;
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v63 + 80);
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v63 + 136) = sub_10000FBA4(v2, (uint64_t)qword_100025D50);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void **)(v63 + 80);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v62 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v63 + 72) = v7;
    id v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v62 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "sending new invites for group %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v10 = [*(id *)(v63 + 80) shareURL];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v13 = *(void *)(v63 + 112);
    uint64_t v12 = *(void *)(v63 + 120);
    uint64_t v15 = *(void *)(v63 + 96);
    uint64_t v14 = *(void *)(v63 + 104);
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
    v16(v15, v12, v14);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v14);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v14) != 1)
    {
      uint64_t v17 = *(void **)(v63 + 80);
      id v18 = *(char **)(v63 + 88);
      v16(*(void *)(v63 + 128), *(void *)(v63 + 96), *(void *)(v63 + 104));
      id v19 = [v17 groupID];
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      id v23 = [*(id *)&v18[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] pendingInvitations];
      sub_1000142B8(0, &qword_100025960);
      sub_1000138F0(&qword_100025968, &qword_100025960);
      uint64_t v24 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      id v25 = v18;
      sub_1000129A8(v24, (uint64_t)v25, v20, v22);
      unint64_t v27 = v26;
      *(void *)(v63 + 144) = v26;

      swift_bridgeObjectRelease();
      *(void *)(v63 + 40) = &_swiftEmptySetSingleton;
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t v28 = v29;
        if (!v29) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v29 = swift_bridgeObjectRetain();
        if (!v28) {
          goto LABEL_23;
        }
      }
      if (v28 < 1)
      {
        __break(1u);
        return withTaskGroup<A, B>(of:returning:isolation:body:)(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      uint64_t v37 = 0;
      do
      {
        if ((v27 & 0xC000000000000001) != 0) {
          id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v38 = *(id *)(v27 + 8 * v37 + 32);
        }
        v39 = v38;
        ++v37;
        id v40 = [v38 destination];
        uint64_t v41 = sub_1000066DC();
        swift_unknownObjectRelease();
        sub_100006770(v41);
      }
      while (v28 != v37);
LABEL_23:
      swift_bridgeObjectRelease();
      v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        *(_DWORD *)v51 = 136315138;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v52 = Set.description.getter();
        unint64_t v54 = v53;
        swift_bridgeObjectRelease();
        *(void *)(v63 + 64) = sub_100017798(v52, v54, &v64);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "all pending URIs: %s", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v55 = *(void *)(v63 + 128);
      uint64_t v57 = *(void *)(v63 + 80);
      uint64_t v56 = *(void *)(v63 + 88);
      uint64_t v58 = sub_100003F84(&qword_100025980);
      uint64_t v59 = sub_100003F84(&qword_100025988);
      v60 = (void *)swift_task_alloc();
      *(void *)(v63 + 152) = v60;
      v60[2] = v57;
      v60[3] = v63 + 40;
      v60[4] = v27;
      v60[5] = v56;
      v60[6] = v55;
      v61 = (void *)swift_task_alloc();
      *(void *)(v63 + 160) = v61;
      void *v61 = v63;
      v61[1] = sub_1000062F4;
      uint64_t v67 = v59;
      v34 = &unk_100025998;
      uint64_t v29 = v63 + 48;
      uint64_t v30 = v58;
      uint64_t v31 = v59;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      v35 = v60;
      uint64_t v36 = v58;
      return withTaskGroup<A, B>(of:returning:isolation:body:)(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v63 + 112) + 56))(*(void *)(v63 + 96), 1, 1, *(void *)(v63 + 104));
  }
  sub_100013EF0(*(void *)(v63 + 96), &qword_1000258F0);
  v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "missing group shareURL", v44, 2u);
    swift_slowDealloc();
  }

  id v45 = objc_allocWithZone((Class)NSError);
  NSString v46 = String._bridgeToObjectiveC()();
  [v45 initWithDomain:v46 code:3 userInfo:0];

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v47 = *(uint64_t (**)(void))(v63 + 8);
  return v47();
}

uint64_t sub_1000062F4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return _swift_task_switch(sub_100006428, 0, 0);
}

uint64_t sub_100006428()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0[6];
  if (*(void *)(v1 + 16))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      sub_1000142B8(0, &qword_1000259A0);
      swift_bridgeObjectRetain();
      uint64_t v5 = Dictionary.description.getter();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      v0[7] = sub_100017798(v5, v7, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "collected errors %s", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v12 = v0[16];
    uint64_t v13 = v0[13];
    uint64_t v14 = v0[14];
    sub_100019534(v1);
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v8 = v0[16];
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[14];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_1000066DC()
{
  id v1 = [v0 destinationURIs];
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = sub_10000C068(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_100012F54(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100006770(uint64_t result)
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
    uint64_t v10 = (Swift::Int *)(*(void *)(v1 + 48) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_10000FF48(&v16, v11, v12);
    unint64_t result = swift_bridgeObjectRelease();
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

uint64_t sub_1000068F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[15] = a6;
  v7[16] = a7;
  v7[13] = a4;
  v7[14] = a5;
  v7[11] = a2;
  v7[12] = a3;
  v7[10] = a1;
  sub_100003F84(&qword_1000255A0);
  v7[17] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Date();
  v7[18] = v8;
  v7[19] = *(void *)(v8 - 8);
  v7[20] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v7[21] = v9;
  v7[22] = *(void *)(v9 - 8);
  v7[23] = swift_task_alloc();
  sub_100003F84(&qword_100025948);
  v7[24] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  v7[25] = v10;
  v7[26] = *(void *)(v10 - 8);
  v7[27] = swift_task_alloc();
  v7[28] = swift_task_alloc();
  uint64_t v11 = sub_100003F84(&qword_1000259B8);
  v7[29] = v11;
  v7[30] = *(void *)(v11 - 8);
  v7[31] = swift_task_alloc();
  return _swift_task_switch(sub_100006B44, 0, 0);
}

uint64_t sub_100006B44()
{
  uint64_t v1 = (void *)v0;
  id v2 = [*(id *)(v0 + 96) participants];
  sub_1000142B8(0, &qword_1000259C0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v4 = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
LABEL_57:
    swift_bridgeObjectRelease();
    sub_100003F84(&qword_100025980);
    TaskGroup.makeAsyncIterator()();
    v1[33] = _swiftEmptyDictionarySingleton;
    v106 = (void *)swift_task_alloc();
    v1[32] = v106;
    void *v106 = v1;
    v106[1] = sub_100007930;
    uint64_t v7 = v1[29];
    uint64_t v4 = (uint64_t)(v1 + 5);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    return TaskGroup.Iterator.next(isolation:)(v4, v5, v6, v7);
  }
  uint64_t v8 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v8) {
    goto LABEL_57;
  }
LABEL_3:
  if (v8 < 1) {
    goto LABEL_62;
  }
  uint64_t v9 = *(void *)(v0 + 112);
  v109 = (NSObject **)(v0 + 72);
  uint64_t v110 = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager;
  uint64_t v111 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 208);
  uint64_t v119 = *(void *)(v0 + 216);
  v120 = *(int **)(v0 + 200);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v12 = v1[19];
  unint64_t v13 = v3 & 0xC000000000000001;
  swift_beginAccess();
  uint64_t v135 = 0;
  uint64_t v14 = 0;
  uint64_t v114 = v9 & 0xFFFFFFFFFFFFFF8;
  unint64_t v115 = v9 & 0xC000000000000001;
  uint64_t v112 = v9 + 32;
  v113 = (void (**)(uint64_t, void, uint64_t, void))(v10 + 56);
  v108 = v1 + 10;
  v117 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
  v118 = (void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v116 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
  unint64_t v121 = v3;
  unint64_t v122 = v3 & 0xC000000000000001;
  uint64_t v123 = v8;
  while (1)
  {
    id v15 = v13 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v3 + 8 * v14 + 32);
    Swift::Int v16 = v15;
    if (objc_msgSend(v15, "inviteStatus", v108) == (id)1) {
      break;
    }
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_10000FBA4(v26, (uint64_t)qword_100025D50);
    id v18 = v16;
    id v19 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v27))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)(v21 + 4) = v18;
      *uint64_t v28 = v18;
      id v23 = v19;
      os_log_type_t v24 = v27;
      id v25 = "Skipping participant %@ because they're not pending";
      goto LABEL_20;
    }
LABEL_5:

LABEL_6:
    if (v8 == ++v14) {
      goto LABEL_57;
    }
  }
  if ([v16 isCurrentUser])
  {
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_10000FBA4(v17, (uint64_t)qword_100025D50);
    id v18 = v16;
    id v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)(v21 + 4) = v18;
      *uint64_t v22 = v18;
      id v23 = v19;
      os_log_type_t v24 = v20;
      id v25 = "Skipping participant %@ because they're us";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v23, v24, v25, (uint8_t *)v21, 0xCu);
      sub_100003F84(&qword_1000258C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v29 = [v16 sharingInvitationData];
  if (!v29)
  {
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v42 = type metadata accessor for Logger();
    sub_10000FBA4(v42, (uint64_t)qword_100025D50);
    id v18 = v16;
    id v19 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v43))
    {
      uint64_t v21 = swift_slowAlloc();
      v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)(v21 + 4) = v18;
      void *v44 = v18;
      id v23 = v19;
      os_log_type_t v24 = v43;
      id v25 = "missing invitationData for participant %@, can't (re)invite them";
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  uint64_t v30 = v29;
  uint64_t v133 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v134 = v31;

  id v32 = v16;
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = v135;
  char v35 = sub_1000142F4(v33, v32);
  swift_bridgeObjectRelease();

  v132 = v32;
  if ((v35 & 1) == 0) {
    goto LABEL_48;
  }
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v36 = type metadata accessor for Logger();
  sub_10000FBA4(v36, (uint64_t)qword_100025D50);
  uint64_t v37 = v32;
  id v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 138412290;
    *(void *)(v40 + 4) = v37;
    *uint64_t v41 = v37;
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Participant %@ already has a pending invite", (uint8_t *)v40, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    unint64_t v3 = v121;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v38 = v37;
  }
  unint64_t v45 = v1[14];

  NSString v46 = v37;
  unint64_t v47 = sub_100014634(v45, v46);
  LOBYTE(v45) = v48;

  if (v45)
  {
    v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Unable to find existing invitation, which we know we do have..? Skipping participant which has unknown pending invitation", v53, 2u);
      swift_slowDealloc();

      sub_100010F5C(v133, v134);
    }
    else
    {

      sub_100010F5C(v133, v134);
    }
    goto LABEL_52;
  }
  if (v115)
  {
    id v49 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_37;
  }
  if ((v47 & 0x8000000000000000) == 0)
  {
    if (v47 >= *(void *)(v114 + 16)) {
      goto LABEL_61;
    }
    id v49 = *(id *)(v112 + 8 * v47);
LABEL_37:
    os_log_type_t v50 = v49;
    sub_10000CE80(v49, (uint64_t *)v1[24]);
    uint64_t v54 = v1[28];
    uint64_t v55 = v1[24];
    (*v113)(v55, 0, 1, v1[25]);
    sub_100013F4C(v55, v54);
    uint64_t v56 = (uint64_t *)(v54 + v120[6]);
    uint64_t v58 = *v56;
    unint64_t v57 = v56[1];
    sub_100013844(*v56, v57);
    uint64_t v59 = sub_100014864(v58, v57, v133, v134);
    sub_100010F5C(v58, v57);
    if (v59)
    {
      v60 = v46;
      v61 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = swift_slowAlloc();
        uint64_t v64 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v63 = 138412290;
        *(void *)(v63 + 4) = v60;
        *uint64_t v64 = v60;

        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Skipping participant %@ because their pending invite seems fine", (uint8_t *)v63, 0xCu);
        sub_100003F84(&qword_1000258C0);
        swift_arrayDestroy();
        unint64_t v3 = v121;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      unint64_t v13 = v122;
      uint64_t v8 = v123;
      uint64_t v105 = v1[28];

      sub_100010F5C(v133, v134);
      sub_10001362C(v105);
      uint64_t v135 = 0;
      goto LABEL_6;
    }
    sub_10001362C(v1[28]);
    uint64_t v65 = v46;
    uint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v131 = (void *)swift_slowAlloc();
      *(_DWORD *)v68 = 138412290;
      *v109 = v65;
      v136 = v1;
      v69 = v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v131 = v65;

      uint64_t v1 = v136;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Invitation data for %@ has changed. Canceling existing invite and resending", v68, 0xCu);
      sub_100003F84(&qword_1000258C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v66 = v65;
    }
    id v32 = v132;

    [*(id *)(v111 + v110) cancelInvitation:v50 serverAcknowledgedBlock:0];
    uint64_t v34 = 0;
LABEL_48:
    uint64_t v70 = v1[23];
    uint64_t v71 = v1[21];
    uint64_t v72 = v1[16];
    v73 = v1;
    v74 = (void *)v1[12];
    id v75 = [v74 groupID];
    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v126 = v77;
    uint64_t v127 = v76;

    (*v118)(v70, v72, v71);
    id v78 = [v32 handle];
    uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v124 = v80;
    uint64_t v125 = v79;

    Date.init()();
    id v81 = [v74 displayName];
    uint64_t v135 = v34;
    if (v81)
    {
      v82 = v81;
      uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v85 = v84;
    }
    else
    {
      uint64_t v83 = 0;
      uint64_t v85 = 0;
    }
    uint64_t v1 = v73;
    v86 = (uint64_t *)v73[27];
    uint64_t v87 = v73[23];
    v90 = v73 + 20;
    uint64_t v89 = v73[20];
    uint64_t v88 = v90[1];
    uint64_t v91 = v1[18];
    uint64_t v128 = v1[17];
    v129 = (void *)v1[15];
    v130 = (void *)v1[12];
    uint64_t *v86 = v127;
    *(void *)(v119 + 8) = v126;
    (*v117)((char *)v86 + v120[5], v87, v88);
    v92 = (uint64_t *)((char *)v86 + v120[6]);
    uint64_t *v92 = v133;
    v92[1] = v134;
    v93 = (uint64_t *)((char *)v86 + v120[7]);
    uint64_t *v93 = v125;
    v93[1] = v124;
    (*v116)((char *)v86 + v120[8], v89, v91);
    v94 = (uint64_t *)((char *)v86 + v120[9]);
    uint64_t *v94 = v83;
    v94[1] = v85;
    sub_100013844(v133, v134);
    unint64_t v95 = sub_100007E64();
    sub_1000081FC(v95);
    swift_bridgeObjectRelease();
    id v96 = objc_allocWithZone((Class)IDSDictionaryInvitationContext);
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v98 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v99 = [v96 initWithDictionary:isa schema:v98];

    uint64_t v100 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v128, 1, 1, v100);
    v101 = (void *)swift_allocObject();
    v101[2] = 0;
    v101[3] = 0;
    v101[4] = v132;
    v101[5] = v129;
    v101[6] = v99;
    v101[7] = v130;
    id v102 = v132;
    id v103 = v129;
    id v104 = v130;
    sub_1000092E4(v128, (uint64_t)&unk_1000259D0, (uint64_t)v101);
    sub_100010F5C(v133, v134);

    sub_100013EF0(v128, &qword_1000255A0);
    sub_10001362C((uint64_t)v86);
    unint64_t v3 = v121;
LABEL_52:
    unint64_t v13 = v122;
    uint64_t v8 = v123;
    goto LABEL_6;
  }
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
  return TaskGroup.Iterator.next(isolation:)(v4, v5, v6, v7);
}

uint64_t sub_100007930()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100007A2C, 0, 0);
}

uint64_t sub_100007A2C()
{
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  if (v3)
  {
    uint64_t v5 = (void *)v0[7];
    if (!v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    uint64_t v6 = v0[33];
    id v7 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v0[8] = v6;
    unint64_t v9 = sub_100010E7C(v4, v3);
    uint64_t v13 = *(void *)(v6 + 16);
    BOOL v14 = (v10 & 1) == 0;
    BOOL v15 = __OFADD__(v13, v14);
    uint64_t v16 = v13 + v14;
    if (v15)
    {
      __break(1u);
    }
    else
    {
      char v1 = v10;
      id v2 = v0 + 8;
      if (*(void *)(v0[33] + 24) < v16)
      {
        sub_1000117BC(v16, isUniquelyReferenced_nonNull_native);
        unint64_t v9 = sub_100010E7C(v4, v3);
        if ((v1 & 1) != (v10 & 1))
        {
          return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        }
LABEL_14:
        uint64_t v21 = (void *)*v2;
        if (v1)
        {
LABEL_15:
          uint64_t v22 = v21[7];
          uint64_t v23 = 8 * v9;

          *(void *)(v22 + v23) = v7;
LABEL_20:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          v0[33] = v21;
LABEL_21:
          uint64_t v28 = (void *)swift_task_alloc();
          v0[32] = v28;
          *uint64_t v28 = v0;
          v28[1] = sub_100007930;
          uint64_t v12 = v0[29];
          unint64_t v9 = (unint64_t)(v0 + 5);
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          return TaskGroup.Iterator.next(isolation:)(v9, v10, v11, v12);
        }
LABEL_18:
        v21[(v9 >> 6) + 8] |= 1 << v9;
        id v25 = (uint64_t *)(v21[6] + 16 * v9);
        *id v25 = v4;
        v25[1] = v3;
        *(void *)(v21[7] + 8 * v9) = v7;
        uint64_t v26 = v21[2];
        BOOL v15 = __OFADD__(v26, 1);
        uint64_t v27 = v26 + 1;
        if (v15)
        {
          __break(1u);
          return TaskGroup.Iterator.next(isolation:)(v9, v10, v11, v12);
        }
        v21[2] = v27;
        swift_bridgeObjectRetain();
        goto LABEL_20;
      }
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
    }
    unint64_t v24 = v9;
    sub_1000123C8();
    unint64_t v9 = v24;
    uint64_t v21 = (void *)*v2;
    if (v1) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v18 = v0[33];
  id v19 = (void *)v0[10];
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  *id v19 = v18;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_100007D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

unint64_t sub_100007E64()
{
  char v1 = v0;
  sub_100003F84(&qword_1000259F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001C480;
  if (qword_1000254B0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1000256F8;
  *(void *)(inited + 32) = qword_1000256F0;
  *(void *)(inited + 40) = v3;
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
  uint64_t v6 = qword_1000254B8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100025708;
  *(void *)(inited + 80) = qword_100025700;
  *(void *)(inited + 88) = v7;
  unint64_t v8 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  swift_bridgeObjectRetain();
  uint64_t v9 = URL.absoluteString.getter();
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v10;
  if (qword_1000254C0 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100025718;
  *(void *)(inited + 128) = qword_100025710;
  *(void *)(inited + 136) = v11;
  BOOL v12 = (void *)((char *)v1 + v8[6]);
  uint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  *(void *)(inited + 168) = &type metadata for Data;
  *(void *)(inited + 144) = v13;
  *(void *)(inited + 152) = v14;
  swift_bridgeObjectRetain();
  sub_100013844(v13, v14);
  if (qword_1000254C8 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_100025728;
  *(void *)(inited + 176) = qword_100025720;
  *(void *)(inited + 184) = v15;
  uint64_t v16 = (void *)((char *)v1 + v8[7]);
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 192) = v17;
  *(void *)(inited + 200) = v18;
  uint64_t v19 = qword_1000254D0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_100025738;
  *(void *)(inited + 224) = qword_100025730;
  *(void *)(inited + 232) = v20;
  uint64_t v21 = (char *)v1 + v8[8];
  uint64_t v22 = type metadata accessor for Date();
  *(void *)(inited + 264) = v22;
  uint64_t v23 = sub_100014BEC((uint64_t *)(inited + 240));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v23, v21, v22);
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_10000A560(inited);
  unint64_t v36 = v24;
  if (qword_1000254D8 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_100025740;
  uint64_t v25 = qword_100025748;
  uint64_t v27 = (void *)((char *)v1 + v8[9]);
  uint64_t v28 = v27[1];
  if (v28)
  {
    uint64_t v29 = *v27;
    char v35 = &type metadata for String;
    *(void *)&long long v34 = v29;
    *((void *)&v34 + 1) = v28;
    sub_1000140BC(&v34, v33);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100011CA4(v33, v26, v25, isUniquelyReferenced_nonNull_native);
    unint64_t v31 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000110A0(v26, v25, &v34);
    swift_bridgeObjectRelease();
    sub_100013EF0((uint64_t)&v34, &qword_1000258F8);
    return v36;
  }
  return v31;
}

uint64_t sub_1000081FC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003F84(&qword_100025950);
    id v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    id v2 = _swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 8;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100011000(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000140BC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000140BC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000140BC(v36, v37);
    sub_1000140BC(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~v6[v21 >> 6]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~v6[v21 >> 6])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = v6[v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)((char *)v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000140BC(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100014BE4();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000085C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return _swift_task_switch(sub_1000085EC, 0, 0);
}

uint64_t sub_1000085EC()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  uint64_t v4 = sub_100003F84(&qword_100025980);
  void *v3 = v0;
  v3[1] = sub_1000086E8;
  uint64_t v5 = *(void *)(v0 + 16);
  return withCheckedContinuation<A>(isolation:function:_:)(v5, 0, 0, 0xD000000000000018, 0x800000010001B090, sub_100014A78, v1, v4);
}

uint64_t sub_1000086E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_1000087F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v37 = a5;
  uint64_t v38 = a4;
  uint64_t v8 = sub_100003F84(&qword_1000259E8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v39 = v10;
  unint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_10000FBA4(v12, (uint64_t)qword_100025D50);
  id v13 = a2;
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v34 = a1;
    uint64_t v17 = swift_slowAlloc();
    int v33 = v16;
    uint64_t v18 = (uint8_t *)v17;
    aBlock[0] = swift_slowAlloc();
    uint64_t v35 = v11;
    *(_DWORD *)uint64_t v18 = 136315138;
    id v32 = v18;
    id v19 = [v13 handle:v18 + 4];
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v36 = v9;
    unint64_t v22 = v21;

    a1 = v34;
    uint64_t v40 = sub_100017798(v20, v22, aBlock);
    unint64_t v11 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v9 = v36;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v33, "Sending invite to participant %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  char v23 = *(void **)(a3 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  NSString v24 = [v13 handle];
  if (!v24)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v25 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v26 = swift_allocObject();
  int64_t v27 = v37;
  *(void *)(v26 + 16) = v13;
  *(void *)(v26 + 24) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v26 + v25, v11, v8);
  aBlock[4] = (uint64_t)sub_100014B5C;
  aBlock[5] = v26;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009258;
  aBlock[3] = (uint64_t)&unk_100020F10;
  uint64_t v28 = _Block_copy(aBlock);
  id v29 = v13;
  id v30 = v27;
  swift_release();
  [v23 sendInvitationToDestination:v24 expirationDate:0 context:v38 serverAcknowledgedBlock:v28];
  _Block_release(v28);
}

uint64_t sub_100008BC8(void *a1, uint64_t a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = [a1 description];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    if (a2)
    {
LABEL_3:
      swift_errorRetain();
      if (qword_1000254F0 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_10000FBA4(v11, (uint64_t)qword_100025D50);
      id v12 = a4;
      swift_errorRetain();
      id v13 = a3;
      id v14 = v12;
      swift_bridgeObjectRetain();
      swift_errorRetain();
      id v15 = v13;
      int v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      uint64_t v18 = &KCSharingMessagingdXPCServer;
      if (os_log_type_enabled(v16, v17))
      {
        os_log_type_t type = v17;
        uint64_t v19 = swift_slowAlloc();
        id v49 = (void *)swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315906;
        swift_bridgeObjectRetain();
        sub_100017798(v8, v10, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        id v20 = [v15 handle];
        uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v23 = v22;

        sub_100017798(v21, v23, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 22) = 2080;
        id v24 = [v14 groupID];
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v27 = v26;

        uint64_t v28 = v25;
        uint64_t v18 = &KCSharingMessagingdXPCServer;
        sub_100017798(v28, v27, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 32) = 2112;
        swift_errorRetain();
        uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v49 = v51;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v16, type, "IDS reports error sending invitation %s to %s for %s: %@", (uint8_t *)v19, 0x2Au);
        sub_100003F84(&qword_1000258C0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }

      id v38 = [v15 (SEL)v18[500].count];
      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v41 = v40;

      uint64_t v42 = (void *)_convertErrorToNSError(_:)();
      uint64_t v52 = v39;
      uint64_t v53 = v41;
      uint64_t v54 = v42;
      swift_bridgeObjectRetain();
      id v43 = v42;
      sub_100003F84(&qword_1000259E8);
      CheckedContinuation.resume(returning:)();
      swift_errorRelease();

      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    unint64_t v10 = 0xE500000000000000;
    uint64_t v8 = 0x3E6C696E3CLL;
    if (a2) {
      goto LABEL_3;
    }
  }
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  sub_10000FBA4(v29, (uint64_t)qword_100025D50);
  id v30 = a4;
  swift_bridgeObjectRetain();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_bridgeObjectRetain();
    sub_100017798(v8, v10, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    id v34 = [v30 groupID];
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v37 = v36;

    sub_100017798(v35, v37, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "IDS acknowledges sending %s for %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v45 = [a3 handle];
  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v47;

  uint64_t v52 = v46;
  uint64_t v53 = v48;
  uint64_t v54 = 0;
  sub_100003F84(&qword_1000259E8);
  return CheckedContinuation.resume(returning:)();
}

void sub_100009258(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1000092E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100003F84(&qword_1000255A0);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014254(a1, (uint64_t)v10, &qword_1000255A0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_100013EF0((uint64_t)v10, &qword_1000255A0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  sub_100003F84(&qword_100025980);
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_1000094F4(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_100009514, 0, 0);
}

uint64_t sub_100009514()
{
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000FBA4(v2, (uint64_t)qword_100025D50);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 24);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v0 + 16) = v7;
    id v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v27 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Canceling pending invites for group %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v10 = *(char **)(v0 + 32);
  id v11 = [*(id *)(v0 + 24) groupID];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  uint64_t v15 = *(void **)&v10[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  id v16 = [v15 pendingInvitations];
  sub_1000142B8(0, &qword_100025960);
  sub_1000138F0(&qword_100025968, &qword_100025960);
  uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v18 = v10;
  sub_1000129A8(v17, (uint64_t)v18, v12, v14);
  unint64_t v20 = v19;

  uint64_t result = swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v22 = result;
    if (!result) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v22) {
      goto LABEL_17;
    }
  }
  if (v22 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v22; ++i)
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v24 = *(id *)(v20 + 8 * i + 32);
    }
    uint64_t v25 = v24;
    if ([v24 state] == (id)1) {
      [v15 cancelInvitation:v25 serverAcknowledgedBlock:0];
    }
  }
LABEL_17:
  swift_bridgeObjectRelease();
  unint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_100009868(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return _swift_task_switch(sub_10000988C, 0, 0);
}

uint64_t sub_10000988C()
{
  uint64_t v59 = v0;
  uint64_t v1 = *(void *)(v0 + 40);
  if (!v1)
  {
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_100009F34;
    uint64_t v15 = *(void *)(v0 + 48);
    v14[3] = *(void *)(v0 + 32);
    v14[4] = v15;
    uint64_t v16 = (uint64_t)sub_100009514;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    return _swift_task_switch(v16, v17, v18);
  }
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000FBA4(v3, (uint64_t)qword_100025D50);
  swift_bridgeObjectRetain_n();
  id v4 = v2;
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 32);
  uint64_t v50 = v0;
  uint64_t v55 = v1;
  if (v7)
  {
    uint64_t v53 = (uint64_t *)(v0 + 16);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v56 = (void *)swift_slowAlloc();
    v58[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v10 = Array.description.getter();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *uint64_t v53 = sub_100017798(v10, v12, v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    *(void *)(v50 + 24) = v8;
    id v13 = v8;
    uint64_t v0 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v56 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Canceling pending invites for participants %s in group %@", (uint8_t *)v9, 0x16u);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v19 = *(char **)(v0 + 48);
  id v20 = [*(id *)(v0 + 32) groupID:v50];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  id v57 = *(id *)&v19[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  id v24 = [v57 pendingInvitations];
  sub_1000142B8(0, &qword_100025960);
  sub_1000138F0(&qword_100025968, &qword_100025960);
  uint64_t v25 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v26 = v19;
  sub_1000129A8(v25, (uint64_t)v26, v21, v23);
  unint64_t v28 = v27;

  uint64_t v16 = swift_bridgeObjectRelease();
  if (v28 >> 62)
  {
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v29 = v16;
    uint64_t v30 = v55;
    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v30 = v55;
    if (v29)
    {
LABEL_12:
      if (v29 >= 1)
      {
        uint64_t v31 = 0;
        unint64_t v32 = v28 & 0xC000000000000001;
        uint64_t v33 = &KCSharingMessagingdXPCServer;
        unint64_t v52 = v28 & 0xC000000000000001;
        uint64_t v54 = v29;
        do
        {
          if (v32) {
            id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v34 = *(id *)(v28 + 8 * v31 + 32);
          }
          uint64_t v35 = v34;
          if ([v34 (SEL)v33[493].count] == (id)1)
          {
            id v36 = [v35 destination];
            uint64_t v37 = sub_1000066DC();
            swift_unknownObjectRelease();
            char v38 = sub_10001257C(v30, v37);
            swift_bridgeObjectRelease();
            if ((v38 & 1) == 0)
            {
              id v39 = v35;
              uint64_t v40 = Logger.logObject.getter();
              os_log_type_t v41 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v40, v41))
              {
                uint64_t v42 = swift_slowAlloc();
                v58[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v42 = 136315138;
                id v43 = [v39 destination];
                sub_1000066DC();
                swift_unknownObjectRelease();
                uint64_t v44 = Set.description.getter();
                unint64_t v45 = v28;
                unint64_t v47 = v46;
                uint64_t v30 = v55;
                swift_bridgeObjectRelease();
                *(void *)(v42 + 4) = sub_100017798(v44, v47, v58);

                unint64_t v28 = v45;
                uint64_t v29 = v54;
                swift_bridgeObjectRelease();
                _os_log_impl((void *)&_mh_execute_header, v40, v41, "Canceling pending invite for %s", (uint8_t *)v42, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                unint64_t v32 = v52;
                swift_slowDealloc();
              }
              else
              {
              }
              [v57 cancelInvitation:v39 serverAcknowledgedBlock:0];
              uint64_t v33 = &KCSharingMessagingdXPCServer;
            }
          }
          ++v31;
        }
        while (v29 != v31);
        goto LABEL_25;
      }
      __break(1u);
      return _swift_task_switch(v16, v17, v18);
    }
  }
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v48 = *(uint64_t (**)(void))(v51 + 8);
  return v48();
}

uint64_t sub_100009F34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A028(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_10000A04C, 0, 0);
}

uint64_t sub_10000A04C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (char *)v0[4];
  uint64_t v3 = v0[2];
  id v4 = [*(id *)&v2[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] receivedInvitations];
  sub_1000142B8(0, &qword_100025908);
  sub_1000138F0(&qword_100025910, &qword_100025908);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  os_log_type_t v6 = v2;
  swift_bridgeObjectRetain();
  sub_100012FEC(v5, (uint64_t)v6, v3, v1);
  uint64_t v8 = v7;
  v0[5] = v7;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = v0[4];
    sub_10000A698((uint64_t)&_swiftEmptyArrayStorage);
    id v10 = objc_allocWithZone((Class)IDSDictionaryInvitationContext);
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v13 = [v10 initWithDictionary:isa schema:v12];
    v0[6] = v13;

    uint64_t v14 = (void *)swift_task_alloc();
    v0[7] = v14;
    v14[2] = v9;
    v14[3] = v8;
    v14[4] = v13;
    uint64_t v15 = (void *)swift_task_alloc();
    v0[8] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_10000A368;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    id v16 = objc_allocWithZone((Class)NSError);
    NSString v17 = String._bridgeToObjectiveC()();
    [v16 initWithDomain:v17 code:8 userInfo:0];

    swift_willThrow();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_10000A368()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10000A4EC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10000A484;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000A484()
{
  uint64_t v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000A4EC()
{
  uint64_t v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_10000A560(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003F84(&qword_1000259A8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100014254(v6, (uint64_t)&v15, &qword_1000259B0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100010E7C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000140BC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000A698(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003F84(&qword_100025950);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100014254(v6, (uint64_t)v15, &qword_100025958);
    unint64_t result = sub_10001105C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000140BC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

void sub_10000A7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100003F84(&qword_100025940);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  long long v11 = *(void **)(a2 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_100013ED4;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A9A8;
  aBlock[3] = &unk_100020E70;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  [v11 acceptInvitation:a3 withContext:a4 serverAcknowledgedBlock:v14];
  _Block_release(v14);
}

void sub_10000A9A8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000AA14(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_10000AA38, 0, 0);
}

uint64_t sub_10000AA38()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (char *)v0[4];
  uint64_t v3 = v0[2];
  id v4 = [*(id *)&v2[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] receivedInvitations];
  sub_1000142B8(0, &qword_100025908);
  sub_1000138F0(&qword_100025910, &qword_100025908);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v6 = v2;
  swift_bridgeObjectRetain();
  sub_100012FEC(v5, (uint64_t)v6, v3, v1);
  uint64_t v8 = v7;
  v0[5] = v7;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = v0[4];
    uint64_t v10 = swift_task_alloc();
    v0[6] = v10;
    *(void *)(v10 + 16) = v9;
    *(void *)(v10 + 24) = v8;
    long long v11 = (void *)swift_task_alloc();
    v0[7] = v11;
    *long long v11 = v0;
    v11[1] = sub_10000AC40;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    unint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_10000AC40()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10000ADC0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10000AD5C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000AD5C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000ADC0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10000AE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003F84(&qword_100025940);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = *(void **)(a2 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_100013ED4;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A9A8;
  aBlock[3] = &unk_100020E20;
  unint64_t v12 = _Block_copy(aBlock);
  swift_release();
  [v9 declineInvitation:a3 serverAcknowledgedBlock:v12];
  _Block_release(v12);
}

uint64_t sub_10000AFE8(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    sub_100003F84(&qword_100025940);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_100003F84(&qword_100025940);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_10000B04C(void *a1, void *a2, NSObject *a3, unint64_t a4)
{
  uint64_t v5 = v4;
  os_log_t v47 = a3;
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v48 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_10000FBA4(v14, (uint64_t)qword_100025D50);
  id v15 = a1;
  swift_bridgeObjectRetain_n();
  id v16 = a2;
  id v17 = v15;
  id v18 = v16;
  unint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    unint64_t v46 = v5;
    uint64_t v23 = v22;
    os_log_type_t v41 = (void *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v50 = v45;
    *(_DWORD *)uint64_t v23 = 136315906;
    int v44 = v21;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_100017798((uint64_t)v47, a4, &v50);
    uint64_t v43 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    os_log_t v47 = v19;
    *(_WORD *)(v23 + 12) = 2112;
    uint64_t v49 = (uint64_t)v17;
    id v24 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v25 = v41;
    *os_log_type_t v41 = v17;

    *(_WORD *)(v23 + 22) = 2112;
    id v42 = v17;
    unint64_t v26 = v13;
    uint64_t v49 = (uint64_t)v18;
    id v27 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v25[1] = v18;

    *(_WORD *)(v23 + 32) = 2080;
    id v28 = [v24 uniqueID];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000FF00(&qword_1000258D8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v29 = v43;
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v32 = v31;
    uint64_t v33 = v26;
    id v17 = v42;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v29);
    uint64_t v49 = sub_100017798(v30, v32, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    os_log_t v34 = v47;
    _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v44, "Found duplicate invite for %s:\n%@\n%@, will decline %s", (uint8_t *)v23, 0x2Au);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v46;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v35 = os_transaction_create();
  static TaskPriority.background.getter();
  uint64_t v36 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v10, 0, 1, v36);
  uint64_t v37 = (void *)swift_allocObject();
  v37[2] = 0;
  _OWORD v37[3] = 0;
  v37[4] = v35;
  v37[5] = v17;
  v37[6] = v5;
  id v38 = v17;
  swift_unknownObjectRetain();
  id v39 = v5;
  sub_10000B79C((uint64_t)v10, (uint64_t)&unk_100025938, (uint64_t)v37);
  swift_release();
  swift_unknownObjectRelease();
  return sub_100013EF0((uint64_t)v10, &qword_1000255A0);
}

uint64_t sub_10000B58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 32) = a6;
  return _swift_task_switch(sub_10000B5AC, 0, 0);
}

uint64_t sub_10000B5AC()
{
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000FBA4(v2, (uint64_t)qword_100025D50);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[3];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[2] = v7;
    id v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v12 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Declining duplicate invite %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [*(id *)(v0[4] + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager) declineInvitation:v0[3] serverAcknowledgedBlock:0];
  unint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10000B79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100003F84(&qword_1000255A0);
  __chkstk_darwin();
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014254(a1, (uint64_t)v7, &qword_1000255A0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100013EF0((uint64_t)v7, &qword_1000255A0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    _OWORD v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_10000B990()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_10000BA60, 0, 0);
}

uint64_t sub_10000BA60()
{
  if (qword_1000254F0 != -1) {
LABEL_33:
  }
    swift_once();
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000FBA4(v1, (uint64_t)qword_100025D50);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "fetching all received invites", v4, 2u);
    swift_slowDealloc();
  }
  os_log_type_t v5 = (char *)v0[3];

  id v6 = [*(id *)&v5[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] receivedInvitations];
  sub_1000142B8(0, &qword_100025908);
  sub_1000138F0(&qword_100025910, &qword_100025908);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v8 = v5;
  sub_100013A34(v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();

  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v60 = v0;
  if (!v11)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v55 = swift_bridgeObjectRetain();
    uint64_t v56 = sub_10000C2B4(v55);
    swift_bridgeObjectRelease_n();
    swift_task_dealloc();
    swift_task_dealloc();
    id v57 = (uint64_t (*)(void *))v60[1];
    return v57(v56);
  }
  uint64_t v12 = v0[5];
  uint64_t v0 = (void *)(v10 + 32);
  uint64_t v59 = (void (**)(uint64_t, uint64_t))(v12 + 8);
  while (1)
  {
    uint64_t v64 = v11;
    long long v65 = *(_OWORD *)v0;
    id v15 = (id)*v0;
    id v16 = *((id *)&v65 + 1);
    id v17 = [v16 groupID];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;

    if (_swiftEmptyDictionarySingleton[2])
    {
      unint64_t v21 = sub_100010E7C(v18, v20);
      if (v22)
      {
        uint64_t v63 = v15;
        uint64_t v23 = v60[6];
        uint64_t v24 = v60[7];
        uint64_t v25 = v60[4];
        uint64_t v26 = _swiftEmptyDictionarySingleton[7] + 16 * v21;
        id v27 = *(void **)(v26 + 8);
        id v62 = *(id *)v26;
        id v28 = v27;
        swift_bridgeObjectRelease();
        id v29 = [v16 sentTime];
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        v61 = v28;
        id v30 = [v28 sentTime];
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        sub_10000FF00(&qword_100025918, (void (*)(uint64_t))&type metadata accessor for Date);
        LOBYTE(v28) = dispatch thunk of static Comparable.< infix(_:_:)();
        unint64_t v31 = *v59;
        (*v59)(v23, v25);
        v31(v24, v25);
        id v32 = [v16 groupID];
        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v35 = v34;

        if ((v28 & 1) == 0)
        {
          sub_10000B04C(v63, v62, v33, v35);

          goto LABEL_8;
        }
        id v15 = v63;
        sub_10000B04C(v62, v63, v33, v35);
      }
    }
    swift_bridgeObjectRelease();
    id v36 = [v16 groupID];
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v39 = v38;

    id v40 = v15;
    id v41 = v16;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v44 = sub_100010E7C(v37, v39);
    uint64_t v45 = _swiftEmptyDictionarySingleton[2];
    BOOL v46 = (v43 & 1) == 0;
    uint64_t v47 = v45 + v46;
    if (__OFADD__(v45, v46))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    char v48 = v43;
    if (_swiftEmptyDictionarySingleton[3] < v47) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if ((v43 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      sub_100012010();
      if ((v48 & 1) == 0)
      {
LABEL_20:
        _swiftEmptyDictionarySingleton[(v44 >> 6) + 8] |= 1 << v44;
        uint64_t v51 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v44);
        uint64_t *v51 = v37;
        v51[1] = v39;
        *(_OWORD *)(_swiftEmptyDictionarySingleton[7] + 16 * v44) = v65;
        uint64_t v52 = _swiftEmptyDictionarySingleton[2];
        BOOL v53 = __OFADD__(v52, 1);
        uint64_t v54 = v52 + 1;
        if (v53) {
          goto LABEL_32;
        }
        _swiftEmptyDictionarySingleton[2] = v54;
        swift_bridgeObjectRetain();
        goto LABEL_7;
      }
    }
LABEL_6:
    uint64_t v13 = _swiftEmptyDictionarySingleton[7] + 16 * v44;
    uint64_t v14 = *(void **)v13;

    *(_OWORD *)uint64_t v13 = v65;
LABEL_7:

    swift_bridgeObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    v0 += 2;
    uint64_t v11 = v64 - 1;
    if (v64 == 1) {
      goto LABEL_25;
    }
  }
  sub_1000111A4(v47, isUniquelyReferenced_nonNull_native);
  unint64_t v49 = sub_100010E7C(v37, v39);
  if ((v48 & 1) == (v50 & 1))
  {
    unint64_t v44 = v49;
    if ((v48 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_6;
  }
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000C068(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v19 = (char *)&_swiftEmptyArrayStorage;
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  for (v4 &= v4 - 1; ; uint64_t v4 = (v11 - 1) & v11)
  {
    swift_bridgeObjectRetain();
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v8 _stripFZIDPrefix];

    if (v9)
    {
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v18 = v14;
      swift_bridgeObjectRelease();

      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000FBDC(0, *((void *)v19 + 2) + 1, 1, v19);
        uint64_t v19 = (char *)result;
      }
      unint64_t v16 = *((void *)v19 + 2);
      unint64_t v15 = *((void *)v19 + 3);
      if (v16 >= v15 >> 1)
      {
        uint64_t result = (uint64_t)sub_10000FBDC((char *)(v15 > 1), v16 + 1, 1, v19);
        uint64_t v19 = (char *)result;
      }
      *((void *)v19 + 2) = v16 + 1;
      id v17 = &v19[16 * v16];
      *((void *)v17 + 4) = v13;
      *((void *)v17 + 5) = v18;
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
LABEL_7:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v10 >= v5) {
      goto LABEL_29;
    }
    uint64_t v11 = *(void *)(v1 + 8 * v10);
    ++v7;
    if (!v11)
    {
      int64_t v7 = v10 + 1;
      if (v10 + 1 >= v5) {
        goto LABEL_29;
      }
      uint64_t v11 = *(void *)(v1 + 8 * v7);
      if (!v11)
      {
        int64_t v7 = v10 + 2;
        if (v10 + 2 >= v5) {
          goto LABEL_29;
        }
        uint64_t v11 = *(void *)(v1 + 8 * v7);
        if (!v11)
        {
          int64_t v7 = v10 + 3;
          if (v10 + 3 >= v5) {
            goto LABEL_29;
          }
          uint64_t v11 = *(void *)(v1 + 8 * v7);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    ;
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v5)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v19;
  }
  uint64_t v11 = *(void *)(v1 + 8 * v12);
  if (v11)
  {
    int64_t v7 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_29;
    }
    uint64_t v11 = *(void *)(v1 + 8 * v7);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void *sub_10000C2B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t result = (void *)sub_10001270C(a1);
    uint64_t v4 = (uint64_t)result;
    int v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 64;
    uint64_t v17 = v2;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v18 = v7;
      id v11 = *(id *)(*(void *)(a1 + 56) + 16 * v4 + 8);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      uint64_t result = (void *)specialized ContiguousArray._endMutation()();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      if ((v12 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v13 = v12 & (-2 << (v4 & 0x3F));
      if (v13)
      {
        int64_t v9 = __clz(__rbit64(v13)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v14 = v10 + 1;
        unint64_t v15 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v15)
        {
          unint64_t v16 = *(void *)(v8 + 8 * v14);
          if (v16)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v16)) + (v14 << 6);
          }
          else
          {
            while (v15 - 2 != v10)
            {
              unint64_t v16 = *(void *)(a1 + 80 + 8 * v10++);
              if (v16)
              {
                unint64_t v14 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v7 = v18 + 1;
      uint64_t v4 = v9;
      if (v18 + 1 == v17) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

void sub_10000C498(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v74 = *(void *)(v10 - 8);
  uint64_t v75 = v10;
  __chkstk_darwin(v10);
  uint64_t v76 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v78 = *(void *)(v12 - 8);
  uint64_t v79 = v12;
  __chkstk_darwin(v12);
  uint64_t v83 = (uint64_t *)((char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  __chkstk_darwin(v85);
  unint64_t v15 = (uint64_t *)((char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v81 = v6;
  uint64_t v16 = sub_10000FBA4(v6, (uint64_t)qword_100025D50);
  id v17 = a1;
  uint64_t v82 = v16;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v80 = v9;
  if (v20)
  {
    uint64_t v77 = v7;
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v84 = v15;
    uint64_t v72 = (void *)v22;
    uint64_t v73 = v2;
    *(_DWORD *)unint64_t v21 = 138412290;
    uint64_t v88 = (uint64_t)v17;
    id v23 = v17;
    uint64_t v3 = v73;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v72 = v17;

    uint64_t v7 = v77;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "creating KCSharingGroup object from invite %@", v21, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    unint64_t v15 = v84;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000CE80(v17, v15);
  id v24 = (id)v3;
  if (!v3)
  {
    uint64_t v84 = (uint64_t *)v17;
    uint64_t v25 = (uint64_t *)((char *)v15 + v85[7]);
    uint64_t v26 = *v25;
    unint64_t v27 = v25[1];
    id v28 = v4;
    id v29 = *(void **)&v4[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
    swift_bridgeObjectRetain();
    id v30 = v29;
    id v31 = [v29 internal];
    id v32 = [v31 aliases];

    if (v32)
    {
      uint64_t v33 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      swift_bridgeObjectRetain();
      uint64_t v73 = v26;
      char v34 = sub_100013478(v33);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0)
      {
        uint64_t v58 = (uint64_t)v80;
        uint64_t v59 = v81;
        (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v80, v82, v81);
        id v60 = v28;
        swift_bridgeObjectRetain();
        id v24 = v60;
        v61 = Logger.logObject.getter();
        int v62 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v61, (os_log_type_t)v62))
        {
          LODWORD(v85) = v62;
          uint64_t v77 = v7;
          uint64_t v84 = v15;
          uint64_t v63 = swift_slowAlloc();
          uint64_t v88 = swift_slowAlloc();
          *(_DWORD *)uint64_t v63 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v86 = sub_100017798(v73, v27, &v88);
          uint64_t v83 = &v87;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v63 + 12) = 2080;
          id v64 = [v30 internal];
          id v65 = [v64 aliases];

          if (!v65)
          {
LABEL_24:

            __break(1u);
            return;
          }
          static Set._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v66 = Set.description.getter();
          unint64_t v68 = v67;
          swift_bridgeObjectRelease();
          uint64_t v86 = sub_100017798(v66, v68, &v88);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v61, (os_log_type_t)v85, "received invitee handle %s is not a valid alias for this account. all aliases: %s", (uint8_t *)v63, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v77 + 8))(v80, v81);
          unint64_t v15 = v84;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v58, v59);
        }
        id v69 = objc_allocWithZone((Class)NSError);
        NSString v70 = String._bridgeToObjectiveC()();
        [v69 initWithDomain:v70 code:6 userInfo:0];

        swift_willThrow();
        sub_10001362C((uint64_t)v15);
        return;
      }
      uint64_t v35 = v15[1];
      uint64_t v81 = *v15;
      (*(void (**)(uint64_t *, char *, uint64_t))(v78 + 16))(v83, (char *)v15 + v85[5], v79);
      uint64_t v80 = (char *)v35;
      swift_bridgeObjectRetain();
      NSString v36 = [v84 fromID];
      if (!v36)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v36 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      id v37 = [v36 _stripFZIDPrefix];

      if (v37)
      {
        uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v39 = v38;

        id v40 = v85;
        id v41 = (uint64_t *)((char *)v15 + v85[6]);
        uint64_t v42 = *v41;
        unint64_t v43 = v41[1];
        uint64_t v44 = (uint64_t)v76;
        (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v76, (char *)v15 + v85[8], v75);
        uint64_t v45 = (uint64_t *)((char *)v15 + v40[9]);
        uint64_t v84 = v15;
        uint64_t v46 = *v45;
        uint64_t v47 = v45[1];
        id v48 = objc_allocWithZone((Class)KCSharingGroupInvite);
        sub_100013844(v42, v43);
        swift_bridgeObjectRetain();
        id v49 = sub_100013688(v81, (uint64_t)v80, (uint64_t)v83, v79, v39, v73, v27, v42, v43, v44, v46, v47);
        sub_100010F5C(v42, v43);
        id v50 = v49;
        uint64_t v51 = Logger.logObject.getter();
        os_log_type_t v52 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v51, v52))
        {
          BOOL v53 = (uint8_t *)swift_slowAlloc();
          uint64_t v85 = (int *)swift_slowAlloc();
          uint64_t v88 = (uint64_t)v85;
          *(_DWORD *)BOOL v53 = 136315138;
          uint64_t v83 = (uint64_t *)(v53 + 4);
          id v54 = [v50 groupID];
          uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v57 = v56;

          uint64_t v86 = sub_100017798(v55, v57, &v88);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Created group invite for %s", v53, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        sub_10001362C((uint64_t)v84);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
}

uint64_t sub_10000CE80@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_100003F84(&qword_1000255A0);
  __chkstk_darwin(v7 - 8);
  int64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [a1 context];
  self;
  uint64_t v11 = (void *)swift_dynamicCastObjCClass();
  if (v11)
  {
    id v12 = [v11 dictionary];
    uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000D3D8(v13, a2);
    if (v3)
    {
      if (qword_1000254F0 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      sub_10000FBA4(v14, (uint64_t)qword_100025D50);
      id v15 = a1;
      swift_errorRetain();
      id v16 = v15;
      swift_errorRetain();
      id v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      int v19 = v18;
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v42 = v4;
        uint64_t v21 = v20;
        uint64_t v38 = (void *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v44 = v41;
        *(_DWORD *)uint64_t v21 = 138412546;
        os_log_t v40 = v17;
        uint64_t v43 = (uint64_t)v16;
        id v22 = v16;
        int v39 = v19;
        id v23 = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v38 = v16;

        *(_WORD *)(v21 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v24 = Error.localizedDescription.getter();
        uint64_t v43 = sub_100017798(v24, v25, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        id v17 = v40;
        _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v39, "Failed to extract payload for invitation %@: %s", (uint8_t *)v21, 0x16u);
        sub_100003F84(&qword_1000258C0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v4 = v42;
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }

      uint64_t v33 = os_transaction_create();
      static TaskPriority.background.getter();
      uint64_t v34 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v9, 0, 1, v34);
      uint64_t v35 = (void *)swift_allocObject();
      v35[2] = 0;
      v35[3] = 0;
      v35[4] = v33;
      v35[5] = v16;
      v35[6] = v4;
      id v36 = v16;
      swift_unknownObjectRetain();
      id v37 = v4;
      sub_10000B79C((uint64_t)v9, (uint64_t)&unk_1000258B8, (uint64_t)v35);
      swift_release();
      sub_100013EF0((uint64_t)v9, &qword_1000255A0);
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_10000FBA4(v26, (uint64_t)qword_100025D50);
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "early return failed cast", v29, 2u);
      swift_slowDealloc();
    }

    id v30 = objc_allocWithZone((Class)NSError);
    NSString v31 = String._bridgeToObjectiveC()();
    [v30 initWithDomain:v31 code:9 userInfo:0];

    return swift_willThrow();
  }
}

uint64_t sub_10000D3D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v117 = a2;
  sub_100003F84(&qword_1000258E0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = type metadata accessor for Date();
  uint64_t v120 = *(void *)(v125 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v119 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v118 = (char *)&v105 - v7;
  uint64_t v8 = sub_100003F84(&qword_1000258E8);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003F84(&qword_1000258F0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&v105 - v16;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  id v23 = (char *)&v105 - v20;
  if (qword_1000254B0 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_3;
    }
LABEL_34:
    long long v123 = 0u;
    long long v124 = 0u;
    goto LABEL_35;
  }
  v113 = v22;
  uint64_t v114 = (char *)&v105 - v20;
  uint64_t v116 = v21;
  swift_once();
  id v22 = v113;
  id v23 = v114;
  uint64_t v21 = v116;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_34;
  }
LABEL_3:
  v113 = v22;
  uint64_t v114 = v23;
  uint64_t v115 = v18;
  uint64_t v116 = v21;
  uint64_t v24 = qword_1000256F8;
  uint64_t v25 = qword_1000256F0;
  swift_bridgeObjectRetain();
  unint64_t v26 = sub_100010E7C(v25, v24);
  if ((v27 & 1) == 0)
  {
    long long v123 = 0u;
    long long v124 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  sub_100011000(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v123);
  swift_bridgeObjectRelease();
  if (!*((void *)&v124 + 1))
  {
LABEL_35:
    swift_bridgeObjectRelease();
    sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_36:
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v49 = type metadata accessor for Logger();
    sub_10000FBA4(v49, (uint64_t)qword_100025D50);
    id v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Invitation lacks GroupID", v52, 2u);
      swift_slowDealloc();
    }

    id v53 = objc_allocWithZone((Class)NSError);
    NSString v54 = String._bridgeToObjectiveC()();
    [v53 initWithDomain:v54 code:2 userInfo:0];
    goto LABEL_41;
  }
  uint64_t v28 = v121;
  unint64_t v112 = v122;
  if (qword_1000254B8 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_8;
    }
LABEL_58:
    long long v123 = 0u;
    long long v124 = 0u;
LABEL_59:
    sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
    goto LABEL_60;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_58;
  }
LABEL_8:
  uint64_t v111 = v28;
  uint64_t v29 = qword_100025708;
  uint64_t v30 = qword_100025700;
  swift_bridgeObjectRetain();
  unint64_t v31 = sub_100010E7C(v30, v29);
  if (v32)
  {
    sub_100011000(*(void *)(a1 + 56) + 32 * v31, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v124 + 1)) {
    goto LABEL_59;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_60:
    uint64_t v34 = v115;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  swift_bridgeObjectRelease();
  int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  uint64_t v34 = v115;
  if (v33 == 1)
  {
LABEL_61:
    id v37 = &qword_1000258E8;
    uint64_t v38 = (uint64_t)v10;
    goto LABEL_62;
  }
  sub_100010EF4((uint64_t)v10, (uint64_t)v15);
  uint64_t v35 = v116;
  id v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v116 + 48);
  if (v36(v15, 1, v34) == 1)
  {
    id v37 = &qword_1000258F0;
    uint64_t v38 = (uint64_t)v15;
LABEL_62:
    sub_100013EF0(v38, v37);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v17, 1, 1, v34);
    goto LABEL_63;
  }
  uint64_t v110 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  v110(v17, v15, v34);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v17, 0, 1, v34);
  if (v36(v17, 1, v34) == 1)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100013EF0((uint64_t)v17, &qword_1000258F0);
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v68 = type metadata accessor for Logger();
    sub_10000FBA4(v68, (uint64_t)qword_100025D50);
    id v69 = Logger.logObject.getter();
    os_log_type_t v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Invitation lacks ShareURL", v71, 2u);
      swift_slowDealloc();
    }

    id v72 = objc_allocWithZone((Class)NSError);
    NSString v54 = String._bridgeToObjectiveC()();
    [v72 initWithDomain:v54 code:3 userInfo:0];
LABEL_41:

    return swift_willThrow();
  }
  v110(v114, v17, v34);
  if (qword_1000254C0 != -1) {
    swift_once();
  }
  if (!*(void *)(a1 + 16))
  {
    long long v123 = 0u;
    long long v124 = 0u;
LABEL_32:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
LABEL_43:
    uint64_t v56 = v115;
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v57 = type metadata accessor for Logger();
    sub_10000FBA4(v57, (uint64_t)qword_100025D50);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      id v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Invitation lacks invitation data", v60, 2u);
      swift_slowDealloc();
    }

    id v61 = objc_allocWithZone((Class)NSError);
    NSString v62 = String._bridgeToObjectiveC()();
    [v61 initWithDomain:v62 code:4 userInfo:0];

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v114, v56);
  }
  uint64_t v39 = qword_100025718;
  uint64_t v40 = qword_100025710;
  swift_bridgeObjectRetain();
  unint64_t v41 = sub_100010E7C(v40, v39);
  if (v42)
  {
    sub_100011000(*(void *)(a1 + 56) + 32 * v41, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v124 + 1)) {
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  uint64_t v43 = v121;
  unint64_t v44 = v122;
  if (qword_1000254C8 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_30;
    }
LABEL_78:
    long long v123 = 0u;
    long long v124 = 0u;
LABEL_79:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
    goto LABEL_80;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_78;
  }
LABEL_30:
  uint64_t v45 = qword_100025728;
  uint64_t v46 = qword_100025720;
  swift_bridgeObjectRetain();
  unint64_t v47 = sub_100010E7C(v46, v45);
  if (v48)
  {
    sub_100011000(*(void *)(a1 + 56) + 32 * v47, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v124 + 1)) {
    goto LABEL_79;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_80:
    uint64_t v56 = v115;
    if (qword_1000254F0 != -1) {
      swift_once();
    }
    uint64_t v83 = type metadata accessor for Logger();
    sub_10000FBA4(v83, (uint64_t)qword_100025D50);
    uint64_t v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v86 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Invitation lacks inviteeHandle", v86, 2u);
      swift_slowDealloc();
    }

    id v87 = objc_allocWithZone((Class)NSError);
    NSString v88 = String._bridgeToObjectiveC()();
    [v87 initWithDomain:v88 code:5 userInfo:0];

    swift_willThrow();
    sub_100010F5C(v43, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v114, v56);
  }
  unint64_t v108 = v44;
  uint64_t v109 = v43;
  unint64_t v63 = v122;
  uint64_t v107 = v121;
  if (qword_1000254D0 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_54;
    }
LABEL_86:
    long long v123 = 0u;
    long long v124 = 0u;
LABEL_87:
    sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v120 + 56))(v4, 1, 1, v125);
    goto LABEL_88;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_86;
  }
LABEL_54:
  uint64_t v64 = qword_100025738;
  uint64_t v65 = qword_100025730;
  swift_bridgeObjectRetain();
  unint64_t v66 = sub_100010E7C(v65, v64);
  if (v67)
  {
    sub_100011000(*(void *)(a1 + 56) + 32 * v66, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v124 + 1)) {
    goto LABEL_87;
  }
  uint64_t v73 = v125;
  int v74 = swift_dynamicCast();
  uint64_t v75 = v120;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v120 + 56))(v4, v74 ^ 1u, 1, v73);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v4, 1, v73) != 1)
  {
    uint64_t v76 = v120;
    uint64_t v77 = v118;
    uint64_t v78 = v125;
    v106 = *(void (**)(char *, char *, uint64_t))(v120 + 32);
    v106(v118, v4, v125);
    (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v113, v114, v115);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v119, v77, v78);
    if (qword_1000254D8 == -1)
    {
      if (*(void *)(a1 + 16))
      {
LABEL_73:
        uint64_t v79 = qword_100025748;
        uint64_t v80 = qword_100025740;
        swift_bridgeObjectRetain();
        unint64_t v81 = sub_100010E7C(v80, v79);
        if (v82)
        {
          sub_100011000(*(void *)(a1 + 56) + 32 * v81, (uint64_t)&v123);
        }
        else
        {
          long long v123 = 0u;
          long long v124 = 0u;
        }
        swift_bridgeObjectRelease();
LABEL_95:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v120 + 8))(v118, v125);
        (*(void (**)(char *, uint64_t))(v116 + 8))(v114, v115);
        if (*((void *)&v124 + 1))
        {
          int v95 = swift_dynamicCast();
          if (v95) {
            uint64_t v96 = v121;
          }
          else {
            uint64_t v96 = 0;
          }
          if (v95) {
            unint64_t v97 = v122;
          }
          else {
            unint64_t v97 = 0;
          }
        }
        else
        {
          sub_100013EF0((uint64_t)&v123, &qword_1000258F8);
          uint64_t v96 = 0;
          unint64_t v97 = 0;
        }
        NSString v98 = v117;
        unint64_t v99 = v112;
        uint64_t *v117 = v111;
        v98[1] = v99;
        uint64_t v100 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
        v110((char *)v98 + v100[5], v113, v115);
        v101 = (uint64_t *)((char *)v98 + v100[6]);
        unint64_t v102 = v108;
        void *v101 = v109;
        v101[1] = v102;
        id v103 = (uint64_t *)((char *)v98 + v100[7]);
        *id v103 = v107;
        v103[1] = v63;
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v106)((char *)v98 + v100[8], v119, v125);
        id v104 = (uint64_t *)((char *)v98 + v100[9]);
        *id v104 = v96;
        v104[1] = v97;
        return result;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(a1 + 16)) {
        goto LABEL_73;
      }
    }
    long long v123 = 0u;
    long long v124 = 0u;
    goto LABEL_95;
  }
LABEL_88:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100013EF0((uint64_t)v4, &qword_1000258E0);
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v89 = type metadata accessor for Logger();
  sub_10000FBA4(v89, (uint64_t)qword_100025D50);
  v90 = Logger.logObject.getter();
  os_log_type_t v91 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v90, v91))
  {
    v92 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v92 = 0;
    _os_log_impl((void *)&_mh_execute_header, v90, v91, "Invitation lacks sentTime", v92, 2u);
    swift_slowDealloc();
  }

  id v93 = objc_allocWithZone((Class)NSError);
  NSString v94 = String._bridgeToObjectiveC()();
  [v93 initWithDomain:v94 code:7 userInfo:0];

  swift_willThrow();
  sub_100010F5C(v109, v108);
  return (*(uint64_t (**)(char *, uint64_t))(v116 + 8))(v114, v115);
}

uint64_t sub_10000E548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  uint64_t v7 = type metadata accessor for UUID();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return _swift_task_switch(sub_10000E608, 0, 0);
}

uint64_t sub_10000E608()
{
  uint64_t v49 = v0;
  uint64_t v1 = (id *)(v0 + 32);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = qword_1000254F0;
    id v5 = *(id *)(v0 + 32);
    if (v4 == -1)
    {
      id v6 = v5;
    }
    else
    {
      swift_once();
      id v6 = *v1;
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000FBA4(v7, (uint64_t)qword_100025D50);
    id v8 = v6;
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_type_t type = v10;
      uint64_t v12 = *(void *)(v0 + 56);
      uint64_t v11 = *(void *)(v0 + 64);
      uint64_t v13 = *(void *)(v0 + 48);
      uint64_t v46 = *(void **)(v0 + 32);
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      buf = v14;
      *(_DWORD *)uint64_t v14 = 136315138;
      id v15 = [v3 uniqueID];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000FF00(&qword_1000258D8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
      id v17 = v3;
      unint64_t v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      *(void *)(v0 + 24) = sub_100017798(v16, v19, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v3 = v17;
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v9, type, "Auto-declining received invite for which we can't extract the payload: %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v37 = *v1;
    }
    uint64_t v38 = &selRef_declineInvitation_serverAcknowledgedBlock_;
  }
  else
  {
    self;
    uint64_t v20 = swift_dynamicCastObjCClass();
    if (!v20) {
      goto LABEL_16;
    }
    uint64_t v3 = (void *)v20;
    uint64_t v21 = qword_1000254F0;
    id v22 = *v1;
    if (v21 == -1)
    {
      id v23 = v22;
    }
    else
    {
      swift_once();
      id v23 = *v1;
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_10000FBA4(v24, (uint64_t)qword_100025D50);
    id v25 = v23;
    unint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t typea = v27;
      uint64_t v29 = *(void *)(v0 + 56);
      uint64_t v28 = *(void *)(v0 + 64);
      uint64_t v30 = *(void *)(v0 + 48);
      unint64_t v47 = *(void **)(v0 + 32);
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      *(_DWORD *)unint64_t v31 = 136315138;
      id v32 = [v3 uniqueID];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000FF00(&qword_1000258D8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v34 = v3;
      unint64_t v36 = v35;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      *(void *)(v0 + 16) = sub_100017798(v33, v36, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v3 = v34;
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v26, typea, "Auto-canceling sent invite for which we can't extract the payload: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v39 = *v1;
    }
    uint64_t v38 = &selRef_cancelInvitation_serverAcknowledgedBlock_;
  }
  uint64_t v40 = *(void **)(v0 + 32);
  [*(id *)(*(void *)(v0 + 40)+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager) *v38 v3, 0];

LABEL_16:
  swift_task_dealloc();
  unint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

id sub_10000ED20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for KCSharingMessagingdInvitationManagerDelegate()
{
  return self;
}

unint64_t sub_10000EDE8()
{
  unint64_t result = qword_100025840;
  if (!qword_100025840)
  {
    sub_10000EE44(&qword_100025838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025840);
  }
  return result;
}

uint64_t sub_10000EE44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000EE8C()
{
  _StringGuts.grow(_:)(17);
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v1;
  v2._countAndFlagsBits = 32;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  uint64_t v3 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  type metadata accessor for URL();
  sub_10000FF00(&qword_100025AE8, (void (*)(uint64_t))&type metadata accessor for URL);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 32;
  v5._object = (void *)0xE100000000000000;
  String.append(_:)(v5);
  id v6 = (uint64_t *)((char *)v0 + v3[6]);
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];
  sub_100013844(*v6, v8);
  v9._countAndFlagsBits = Data.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  sub_100010F5C(v7, v8);
  v10._countAndFlagsBits = 32;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  uint64_t v11 = (uint64_t *)((char *)v0 + v3[7]);
  uint64_t v12 = *v11;
  uint64_t v13 = (void *)v11[1];
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 32;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  type metadata accessor for Date();
  sub_10000FF00(&qword_100025AF0, (void (*)(uint64_t))&type metadata accessor for Date);
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 32;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  unint64_t v18 = (uint64_t *)((char *)v0 + v3[9]);
  if (v18[1])
  {
    uint64_t v19 = *v18;
    uint64_t v20 = (void *)v18[1];
  }
  else
  {
    uint64_t v20 = (void *)0xE90000000000003ELL;
    uint64_t v19 = 0x656D616E206F6E3CLL;
  }
  swift_bridgeObjectRetain();
  v21._countAndFlagsBits = v19;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_10000F0E4(char a1)
{
  return *(void *)&aGroupid_2[8 * a1];
}

BOOL sub_10000F104(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000F118()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000F160()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000F18C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000F1D0()
{
  return sub_10000F0E4(*v0);
}

uint64_t sub_10000F1D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100016488(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F200()
{
  return 0;
}

void sub_10000F20C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000F218(uint64_t a1)
{
  unint64_t v2 = sub_100016018();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F254(uint64_t a1)
{
  unint64_t v2 = sub_100016018();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000F290(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100003F84(&qword_100025AC8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100015FD4(a1, a1[3]);
  sub_100016018();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v12) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
    LOBYTE(v12) = 1;
    type metadata accessor for URL();
    sub_10000FF00(&qword_100025AD0, (void (*)(uint64_t))&type metadata accessor for URL);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    long long v12 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    sub_100016174();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v12) = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v12) = 4;
    type metadata accessor for Date();
    sub_10000FF00(&qword_100025AE0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v12) = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000F568@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v35 = type metadata accessor for Date();
  uint64_t v32 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  Swift::String v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v33 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100003F84(&qword_100025AA0);
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v10 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  __chkstk_darwin(v10);
  long long v12 = (void *)((char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  uint64_t v38 = a1;
  sub_100015FD4(a1, v13);
  sub_100016018();
  id v37 = v9;
  uint64_t v14 = v39;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v14) {
    return sub_10001606C((uint64_t)v38);
  }
  Swift::String v15 = v7;
  uint64_t v30 = v4;
  uint64_t v17 = v34;
  uint64_t v16 = v35;
  uint64_t v39 = v5;
  LOBYTE(v40) = 0;
  uint64_t v18 = v36;
  *long long v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v12[1] = v19;
  LOBYTE(v40) = 1;
  sub_10000FF00(&qword_100025AB0, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v20 = v39;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))((char *)v12 + v10[5], v15, v20);
  char v41 = 2;
  sub_1000160BC();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *(_OWORD *)((char *)v12 + v10[6]) = v40;
  LOBYTE(v40) = 3;
  v29[1] = 0;
  uint64_t v21 = KeyedDecodingContainer.decode(_:forKey:)();
  id v22 = (uint64_t *)((char *)v12 + v10[7]);
  *id v22 = v21;
  v22[1] = v23;
  LOBYTE(v40) = 4;
  sub_10000FF00(&qword_100025AC0, (void (*)(uint64_t))&type metadata accessor for Date);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))((char *)v12 + v10[8], v30, v16);
  LOBYTE(v40) = 5;
  uint64_t v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v37, v18);
  os_log_type_t v27 = (uint64_t *)((char *)v12 + v10[9]);
  *os_log_type_t v27 = v24;
  v27[1] = v26;
  sub_100016110((uint64_t)v12, v31);
  sub_10001606C((uint64_t)v38);
  return sub_10001362C((uint64_t)v12);
}

uint64_t sub_10000FB70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000F568(a1, a2);
}

uint64_t sub_10000FB88(void *a1)
{
  return sub_10000F290(a1);
}

uint64_t sub_10000FBA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

char *sub_10000FBDC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003F84(&qword_100025978);
      Swift::String v10 = (char *)swift_allocObject();
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
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100012E60(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000FCEC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003F84(&qword_100025928);
      Swift::String v10 = (char *)swift_allocObject();
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
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100013940(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000FE00(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100004AF4;
  return sub_10000E548(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000FEC8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FF00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000FF48(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000103D8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000100F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003F84(&qword_100025970);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
      }
      else
      {
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
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
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
            goto LABEL_38;
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_1000103D8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1000100F8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100010574();
      goto LABEL_22;
    }
    sub_100010728();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
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

void *sub_100010574()
{
  uint64_t v1 = v0;
  sub_100003F84(&qword_100025970);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100010728()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003F84(&qword_100025970);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
          goto LABEL_36;
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
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000109D8@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
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
      sub_100013844(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
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
        JUMPOUT(0x100010C3CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_100010F5C(a2, a3);
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
      unint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
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
      uint64_t v21 = __DataStorage._length.getter();
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

uint64_t sub_100010C4C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_100013844(a1, a2);
      char v5 = sub_1000147AC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_100010F5C(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_1000147AC(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_100010F5C(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_1000109D8((uint64_t)__s1, a3, a4, &v14);
      sub_100010F5C(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

unint64_t sub_100010E7C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100011E64(a1, a2, v4);
}

uint64_t sub_100010EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F84(&qword_1000258F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010F5C(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload()
{
  uint64_t result = qword_100025A58;
  if (!qword_100025A58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011000(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10001105C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100011F48(a1, v4);
}

double sub_1000110A0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  Swift::Int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100010E7C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *Swift::Int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000121E0();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1000140BC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_100011ACC(v8, v11);
    *Swift::Int v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1000111A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003F84(&qword_100025920);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v9 + 63) >> 6;
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
        if (v23 >= v37) {
          goto LABEL_33;
        }
        unint64_t v24 = v38[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v24 = v38[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v38[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v24 = v38[v14];
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
      long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v34 = (id)v39;
        id v35 = *((id *)&v39 + 1);
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
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
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *int64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v39;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v8;
  return result;
}

uint64_t sub_1000114BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003F84(&qword_1000259A8);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1000140BC(v24, v35);
      }
      else
      {
        sub_100011000((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1000140BC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000117BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003F84(&qword_1000259F8);
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
  id v35 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_100011ACC(unint64_t result, uint64_t a2)
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
        Swift::Int v10 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100011CA4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_100010E7C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1000121E0();
      goto LABEL_7;
    }
    sub_1000114BC(v15, a4 & 1);
    unint64_t v21 = sub_100010E7C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10001606C((uint64_t)v19);
    return sub_1000140BC(a1, v19);
  }
LABEL_13:
  sub_100011DF8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100011DF8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1000140BC(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_100011E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100011F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000140CC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100014128((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_100012010()
{
  uint64_t v1 = v0;
  sub_100003F84(&qword_100025920);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
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
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + v17);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    long long v26 = *(_OWORD *)(*(void *)(v2 + 56) + v17);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v17);
    void *v21 = v20;
    v21[1] = v19;
    *(_OWORD *)(*(void *)(v4 + 56) + v17) = v26;
    swift_bridgeObjectRetain();
    id v22 = (id)v26;
    id result = *((id *)&v26 + 1);
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

void *sub_1000121E0()
{
  uint64_t v1 = v0;
  sub_100003F84(&qword_1000259A8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100011000(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_1000140BC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000123C8()
{
  uint64_t v1 = v0;
  sub_100003F84(&qword_1000259F8);
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
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

uint64_t sub_10001257C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 1;
  }
  uint64_t v22 = a1 + 32;
  uint64_t v4 = a2 + 56;
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != v2; ++i)
  {
    if (*(void *)(a2 + 16))
    {
      uint64_t v6 = (uint64_t *)(v22 + 16 * i);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(a2 + 48);
        int64_t v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_22:
          swift_bridgeObjectRelease();
          uint64_t v20 = 0;
          goto LABEL_23;
        }
        uint64_t v15 = ~v10;
        for (unint64_t j = v11 + 1; ; unint64_t j = v17 + 1)
        {
          uint64_t v17 = j & v15;
          if (((*(void *)(v4 + (((j & v15) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v15)) & 1) == 0) {
            break;
          }
          uint64_t v18 = (void *)(v12 + 16 * v17);
          BOOL v19 = *v18 == v8 && v18[1] == v7;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v20 = 1;
LABEL_23:
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_10001270C(uint64_t a1)
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
  Swift::Int v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_100012794(uint64_t a1, int *a2)
{
  *(void *)(v2 + 40) = a1;
  char v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v3;
  void *v3 = v2;
  v3[1] = sub_100012874;
  return v5(v2 + 16);
}

uint64_t sub_100012874()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v1 + 32);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  char v5 = *(uint64_t (**)(void))(v3 + 8);
  return v5();
}

void sub_1000129A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a4;
  uint64_t v34 = a3;
  uint64_t v37 = a2;
  uint64_t v7 = sub_100003F84(&qword_100025948);
  __chkstk_darwin(v7 - 8);
  Swift::Int v9 = (void *)((char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  uint64_t v10 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  id v35 = (void *)((char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v46 = &_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    sub_1000142B8(0, &qword_100025960);
    sub_1000138F0(&qword_100025968, &qword_100025960);
    Set.Iterator.init(_cocoa:)();
    a1 = v41;
    uint64_t v32 = v42;
    uint64_t v12 = v43;
    int64_t v13 = v44;
    unint64_t v14 = v45;
  }
  else
  {
    int64_t v13 = 0;
    uint64_t v15 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v32 = a1 + 56;
    uint64_t v12 = ~v15;
    uint64_t v17 = -v15;
    if (v17 < 64) {
      uint64_t v18 = ~(-1 << v17);
    }
    else {
      uint64_t v18 = -1;
    }
    unint64_t v14 = v18 & v16;
  }
  v30[0] = v12;
  v30[2] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v31 = (unint64_t)(v12 + 64) >> 6;
  BOOL v19 = (void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v30[1] = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v38 = a1;
  while (a1 < 0)
  {
    uint64_t v23 = __CocoaSet.Iterator.next()();
    if (!v23) {
      goto LABEL_41;
    }
    uint64_t v39 = v23;
    sub_1000142B8(0, &qword_100025960);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v24 = v40;
    swift_unknownObjectRelease();
    int64_t v22 = v13;
    uint64_t v20 = v14;
    if (!v24) {
      goto LABEL_41;
    }
LABEL_28:
    sub_10000CE80(v24, v9);
    if (v5)
    {
      swift_errorRelease();
      (*v19)(v9, 1, 1, v36);
      sub_100013EF0((uint64_t)v9, &qword_100025948);

      uint64_t v5 = 0;
      goto LABEL_9;
    }
    (*v19)(v9, 0, 1, v36);
    BOOL v27 = v35;
    sub_100013F4C((uint64_t)v9, (uint64_t)v35);
    if (*v27 == v34 && v27[1] == v33)
    {
      sub_10001362C((uint64_t)v35);
LABEL_33:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      goto LABEL_9;
    }
    char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
    sub_10001362C((uint64_t)v35);
    if (v28) {
      goto LABEL_33;
    }

LABEL_9:
    int64_t v13 = v22;
    unint64_t v14 = v20;
    a1 = v38;
  }
  if (v14)
  {
    uint64_t v20 = (v14 - 1) & v14;
    unint64_t v21 = __clz(__rbit64(v14)) | (v13 << 6);
    int64_t v22 = v13;
LABEL_27:
    id v24 = *(id *)(*(void *)(a1 + 48) + 8 * v21);
    if (!v24) {
      goto LABEL_41;
    }
    goto LABEL_28;
  }
  int64_t v22 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v22 >= v31) {
      goto LABEL_41;
    }
    unint64_t v25 = *(void *)(v32 + 8 * v22);
    if (!v25)
    {
      int64_t v26 = v13 + 2;
      if (v13 + 2 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25) {
        goto LABEL_25;
      }
      int64_t v26 = v13 + 3;
      if (v13 + 3 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25) {
        goto LABEL_25;
      }
      int64_t v26 = v13 + 4;
      if (v13 + 4 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25)
      {
LABEL_25:
        int64_t v22 = v26;
      }
      else
      {
        int64_t v22 = v13 + 5;
        if (v13 + 5 >= v31) {
          goto LABEL_41;
        }
        unint64_t v25 = *(void *)(v32 + 8 * v22);
        if (!v25)
        {
          int64_t v29 = v13 + 6;
          while (v31 != v29)
          {
            unint64_t v25 = *(void *)(v32 + 8 * v29++);
            if (v25)
            {
              int64_t v22 = v29 - 1;
              goto LABEL_26;
            }
          }
LABEL_41:
          sub_100014BE4();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v20 = (v25 - 1) & v25;
    unint64_t v21 = __clz(__rbit64(v25)) + (v22 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

uint64_t sub_100012E60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100012F54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000FF48(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100012FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v33 = a4;
  uint64_t v34 = a3;
  uint64_t v37 = a2;
  uint64_t v7 = sub_100003F84(&qword_100025948);
  __chkstk_darwin(v7 - 8);
  Swift::Int v9 = (void *)((char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  uint64_t v10 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  id v35 = (void *)((char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000142B8(0, &qword_100025908);
    sub_1000138F0(&qword_100025910, &qword_100025908);
    Set.Iterator.init(_cocoa:)();
    a1 = v40;
    uint64_t v32 = v41;
    uint64_t v12 = v42;
    int64_t v13 = v43;
    unint64_t v14 = v44;
  }
  else
  {
    uint64_t v15 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v32 = a1 + 56;
    uint64_t v12 = ~v15;
    uint64_t v17 = -v15;
    if (v17 < 64) {
      uint64_t v18 = ~(-1 << v17);
    }
    else {
      uint64_t v18 = -1;
    }
    unint64_t v14 = v18 & v16;
    swift_bridgeObjectRetain();
    int64_t v13 = 0;
  }
  v30[1] = v12;
  void v30[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v31 = (unint64_t)(v12 + 64) >> 6;
  BOOL v19 = (void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v30[2] = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v38 = a1;
  while (a1 < 0)
  {
    uint64_t v23 = __CocoaSet.Iterator.next()();
    if (!v23) {
      goto LABEL_41;
    }
    uint64_t v39 = v23;
    sub_1000142B8(0, &qword_100025908);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v24 = v45;
    swift_unknownObjectRelease();
    int64_t v22 = v13;
    uint64_t v20 = v14;
    if (!v24) {
      goto LABEL_41;
    }
LABEL_28:
    sub_10000CE80(v24, v9);
    if (v5)
    {
      swift_errorRelease();
      (*v19)(v9, 1, 1, v36);
      sub_100013EF0((uint64_t)v9, &qword_100025948);
      uint64_t v5 = 0;
    }
    else
    {
      (*v19)(v9, 0, 1, v36);
      BOOL v27 = v35;
      sub_100013F4C((uint64_t)v9, (uint64_t)v35);
      if (*v27 == v34 && v27[1] == v33)
      {
        sub_10001362C((uint64_t)v35);
LABEL_41:
        sub_100014BE4();
        return;
      }
      char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10001362C((uint64_t)v35);
      if (v28) {
        goto LABEL_41;
      }
    }

    int64_t v13 = v22;
    unint64_t v14 = v20;
    a1 = v38;
  }
  if (v14)
  {
    uint64_t v20 = (v14 - 1) & v14;
    unint64_t v21 = __clz(__rbit64(v14)) | (v13 << 6);
    int64_t v22 = v13;
LABEL_27:
    id v24 = *(id *)(*(void *)(a1 + 48) + 8 * v21);
    if (!v24) {
      goto LABEL_41;
    }
    goto LABEL_28;
  }
  int64_t v22 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v22 >= v31) {
      goto LABEL_41;
    }
    unint64_t v25 = *(void *)(v32 + 8 * v22);
    if (!v25)
    {
      int64_t v26 = v13 + 2;
      if (v13 + 2 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25) {
        goto LABEL_25;
      }
      int64_t v26 = v13 + 3;
      if (v13 + 3 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25) {
        goto LABEL_25;
      }
      int64_t v26 = v13 + 4;
      if (v13 + 4 >= v31) {
        goto LABEL_41;
      }
      unint64_t v25 = *(void *)(v32 + 8 * v26);
      if (v25)
      {
LABEL_25:
        int64_t v22 = v26;
      }
      else
      {
        int64_t v22 = v13 + 5;
        if (v13 + 5 >= v31) {
          goto LABEL_41;
        }
        unint64_t v25 = *(void *)(v32 + 8 * v22);
        if (!v25)
        {
          int64_t v29 = v13 + 6;
          while (v31 != v29)
          {
            unint64_t v25 = *(void *)(v32 + 8 * v29++);
            if (v25)
            {
              int64_t v22 = v29 - 1;
              goto LABEL_26;
            }
          }
          goto LABEL_41;
        }
      }
    }
LABEL_26:
    uint64_t v20 = (v25 - 1) & v25;
    unint64_t v21 = __clz(__rbit64(v25)) + (v22 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

uint64_t sub_100013478(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v8 >= v5) {
      goto LABEL_24;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v8);
    ++v7;
    if (!v9)
    {
      int64_t v7 = v8 + 1;
      if (v8 + 1 >= v5) {
        goto LABEL_24;
      }
      uint64_t v9 = *(void *)(v1 + 8 * v7);
      if (!v9)
      {
        int64_t v7 = v8 + 2;
        if (v8 + 2 >= v5) {
          goto LABEL_24;
        }
        uint64_t v9 = *(void *)(v1 + 8 * v7);
        if (!v9)
        {
          int64_t v7 = v8 + 3;
          if (v8 + 3 >= v5) {
            goto LABEL_24;
          }
          uint64_t v9 = *(void *)(v1 + 8 * v7);
          if (!v9)
          {
            int64_t v10 = v8 + 4;
            if (v10 >= v5)
            {
LABEL_24:
              uint64_t v11 = 0;
              goto LABEL_25;
            }
            uint64_t v9 = *(void *)(v1 + 8 * v10);
            if (!v9)
            {
              while (1)
              {
                int64_t v7 = v10 + 1;
                if (__OFADD__(v10, 1)) {
                  goto LABEL_27;
                }
                if (v7 >= v5) {
                  goto LABEL_24;
                }
                uint64_t v9 = *(void *)(v1 + 8 * v7);
                ++v10;
                if (v9) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v7 = v10;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v9 - 1) & v9;
LABEL_5:
    sub_10001389C();
    uint64_t result = StringProtocol.contains<A>(_:)();
    if (result)
    {
      uint64_t v11 = 1;
LABEL_25:
      swift_release();
      return v11;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10001362C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100013688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3;
  URL._bridgeToObjectiveC()(v14);
  uint64_t v16 = v15;
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v19.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  v20.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  if (a12)
  {
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }
  id v22 = [v26 initWithGroupID:v13 shareURL:v16 senderHandle:v17 inviteeHandle:v18 inviteToken:v19.super.isa sentTime:v20.super.isa displayName:v21];

  uint64_t v23 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a10, v23);
  uint64_t v24 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v27, v24);
  return v22;
}

uint64_t sub_100013844(uint64_t a1, unint64_t a2)
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

unint64_t sub_10001389C()
{
  unint64_t result = qword_100025900;
  if (!qword_100025900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025900);
  }
  return result;
}

uint64_t sub_1000138F0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000142B8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013940(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100013A34(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000142B8(0, &qword_100025908);
    sub_1000138F0(&qword_100025910, &qword_100025908);
    Set.Iterator.init(_cocoa:)();
    uint64_t v3 = v25;
    uint64_t v24 = v26;
    uint64_t v4 = v27;
    int64_t v5 = v28;
    unint64_t v6 = v29;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v24 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v5 = 0;
  }
  id v22 = (char *)&_swiftEmptyArrayStorage;
  int64_t v23 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    int64_t v10 = v5;
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_39;
    }
    sub_1000142B8(0, &qword_100025908);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = v30;
    swift_unknownObjectRelease();
    if (!v30) {
      goto LABEL_39;
    }
LABEL_26:
    sub_10000C498(v13);
    if (v2)
    {
      swift_errorRelease();

      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v17 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v22 = sub_10000FCEC(0, *((void *)v22 + 2) + 1, 1, v22);
      }
      unint64_t v19 = *((void *)v22 + 2);
      unint64_t v18 = *((void *)v22 + 3);
      if (v19 >= v18 >> 1) {
        id v22 = sub_10000FCEC((char *)(v18 > 1), v19 + 1, 1, v22);
      }
      *((void *)v22 + 2) = v19 + 1;
      NSDate v20 = &v22[16 * v19];
      *((void *)v20 + 4) = v13;
      *((void *)v20 + 5) = v17;
    }
  }
  if (v6)
  {
    unint64_t v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v12 = v11 | (v5 << 6);
LABEL_25:
    id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
    if (!v13) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  ++v5;
  if (!__OFADD__(v10, 1))
  {
    if (v5 >= v23) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v5);
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v23) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14) {
        goto LABEL_23;
      }
      int64_t v15 = v10 + 3;
      if (v10 + 3 >= v23) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14) {
        goto LABEL_23;
      }
      int64_t v15 = v10 + 4;
      if (v10 + 4 >= v23) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14)
      {
LABEL_23:
        int64_t v5 = v15;
      }
      else
      {
        int64_t v5 = v10 + 5;
        if (v10 + 5 >= v23) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v5);
        if (!v14)
        {
          int64_t v21 = v10 + 6;
          while (v23 != v21)
          {
            unint64_t v14 = *(void *)(v24 + 8 * v21++);
            if (v14)
            {
              int64_t v5 = v21 - 1;
              goto LABEL_24;
            }
          }
LABEL_39:
          sub_100014BE4();
          return;
        }
      }
    }
LABEL_24:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
    goto LABEL_25;
  }
  __break(1u);
}

uint64_t sub_100013DCC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100013E1C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100005170;
  *(_OWORD *)(v2 + 24) = v3;
  return _swift_task_switch(sub_10000B5AC, 0, 0);
}

void sub_100013EC8(uint64_t a1)
{
  sub_10000AE2C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100013ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013EE8()
{
  return swift_release();
}

uint64_t sub_100013EF0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003F84(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100013F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100013FB0(uint64_t a1)
{
  sub_10000A7DC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100013FC0()
{
  uint64_t v1 = sub_100003F84(&qword_100025940);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100014054(uint64_t a1)
{
  return sub_10000AFE8(a1);
}

_OWORD *sub_1000140BC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000140CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100014128(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001417C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *unint64_t v11 = v3;
  v11[1] = sub_100005170;
  return sub_1000068F0(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_100014254(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003F84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000142B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000142F4(uint64_t a1, void *a2)
{
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v14 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_24;
    }
    uint64_t v10 = *(void *)(v13 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v14) {
        goto LABEL_24;
      }
      uint64_t v10 = *(void *)(v13 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v14) {
          goto LABEL_24;
        }
        uint64_t v10 = *(void *)(v13 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v14) {
            goto LABEL_24;
          }
          uint64_t v10 = *(void *)(v13 + 8 * v7);
          if (!v10)
          {
            int64_t v11 = v9 + 4;
            if (v11 >= v14)
            {
LABEL_24:
              uint64_t v12 = 0;
              goto LABEL_25;
            }
            uint64_t v10 = *(void *)(v13 + 8 * v11);
            if (!v10)
            {
              while (1)
              {
                int64_t v7 = v11 + 1;
                if (__OFADD__(v11, 1)) {
                  goto LABEL_27;
                }
                if (v7 >= v14) {
                  goto LABEL_24;
                }
                uint64_t v10 = *(void *)(v13 + 8 * v7);
                ++v11;
                if (v10) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v7 = v11;
          }
        }
      }
    }
LABEL_22:
    uint64_t v5 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    id v8 = [a2 handle];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10001389C();
    LOBYTE(v8) = StringProtocol.contains<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v8)
    {
      uint64_t v12 = 1;
LABEL_25:
      swift_release();
      return v12;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100014524()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001457C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  long long v6 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100005170;
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_1000085EC, 0, 0);
}

uint64_t sub_100014634(unint64_t a1, void *a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
LABEL_3:
  for (uint64_t i = 0; ; ++i)
  {
    id v5 = (a1 & 0xC000000000000001) != 0
       ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
       : *(id *)(a1 + 8 * i + 32);
    long long v6 = v5;
    id v7 = [v5 destination];
    uint64_t v8 = sub_1000066DC();
    swift_unknownObjectRelease();
    id v9 = [a2 handle];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    LOBYTE(v9) = sub_100007D2C(v10, v12, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9) {
      break;
    }
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v13 == v3) {
      return 0;
    }
  }
  return i;
}

uint64_t sub_1000147AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
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
  __DataStorage._length.getter();
  sub_1000109D8(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100014864(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x1000149A0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_100013844(a3, a4);
              char v15 = sub_100010C4C(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
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
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1000149C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100004AF4;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000259D8 + dword_1000259D8);
  return v6(a1, v4);
}

void sub_100014A78(uint64_t a1)
{
  sub_1000087F8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_100014A84()
{
  uint64_t v1 = sub_100003F84(&qword_1000259E8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100014B5C(void *a1, uint64_t a2)
{
  sub_100003F84(&qword_1000259E8);
  uint64_t v5 = *(void **)(v2 + 16);
  uint64_t v6 = *(void **)(v2 + 24);

  return sub_100008BC8(a1, a2, v5, v6);
}

uint64_t sub_100014BE4()
{
  return swift_release();
}

uint64_t *sub_100014BEC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_100014C50(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000FBA4(v4, (uint64_t)qword_100025D50);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    uint64_t v18 = v2;
    id v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v17 = v5;

    *(_WORD *)(v8 + 12) = 2080;
    id v10 = [objc_msgSend(v9, "context") payload];
    swift_unknownObjectRelease();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v11 = Dictionary.description.getter();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    uint64_t v14 = v11;
    uint64_t v2 = v18;
    sub_100017798(v14, v13, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "incoming invitation %@ %s", (uint8_t *)v8, 0x16u);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000C498(v5);
  uint64_t v16 = v15;
  [*(id *)(v2+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection) receivedGroupInvitation:v15];
}

id sub_100014FD8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000FBA4(v4, (uint64_t)qword_100025D50);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "sender did cancel invite %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return [*(id *)(v2+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection) groupInvitationWasCancelled];
}

void sub_100015194(void *a1, const char *a2)
{
  if (qword_1000254F0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000FBA4(v4, (uint64_t)qword_100025D50);
  id v10 = a1;
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138412290;
    id v9 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v10;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void *initializeBufferWithCopyOfBuffer for KCSharingMessagingdInvitationManagerDelegate.BothTypes(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  os_log_type_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for KCSharingMessagingdInvitationManagerDelegate.BothTypes(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.BothTypes()
{
  return &type metadata for KCSharingMessagingdInvitationManagerDelegate.BothTypes;
}

uint64_t *sub_100015518(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    id v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    char v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    sub_100013844(*v15, v17);
    *uint64_t v14 = v16;
    v14[1] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    NSDate v20 = (uint64_t *)((char *)v4 + v18);
    int64_t v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *NSDate v20 = *v21;
    v20[1] = v22;
    int64_t v23 = (char *)v4 + v19;
    uint64_t v24 = (char *)a2 + v19;
    uint64_t v25 = type metadata accessor for Date();
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
    uint64_t v27 = a3[9];
    int64_t v28 = (uint64_t *)((char *)v4 + v27);
    unint64_t v29 = (uint64_t *)((char *)a2 + v27);
    uint64_t v30 = v29[1];
    *int64_t v28 = *v29;
    v28[1] = v30;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1000156AC(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_100010F5C(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[8];
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_bridgeObjectRelease();
}

void *sub_10001579C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  id v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_100013844(*v14, v16);
  uint64_t *v13 = v15;
  v13[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v17);
  NSDate v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (char *)a1 + v18;
  int64_t v23 = (char *)a2 + v18;
  uint64_t v24 = type metadata accessor for Date();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  v25(v22, v23, v24);
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)((char *)a1 + v26);
  int64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1000158E0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  sub_100013844(*v12, v14);
  uint64_t v15 = *v11;
  unint64_t v16 = v11[1];
  *uint64_t v11 = v13;
  v11[1] = v14;
  sub_100010F5C(v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_100015A4C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  return a1;
}

void *sub_100015B40(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void *)((char *)a1 + v11);
  unint64_t v13 = *(void *)((char *)a1 + v11 + 8);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  sub_100010F5C(v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)((char *)a1 + v14);
  unint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100015C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015C80);
}

uint64_t sub_100015C80(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for URL();
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
      uint64_t v13 = type metadata accessor for Date();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100015DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100015DC0);
}

uint64_t sub_100015DC0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
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
      uint64_t v13 = type metadata accessor for Date();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_100015EEC()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Date();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_100015FD4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100016018()
{
  unint64_t result = qword_100025AA8;
  if (!qword_100025AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025AA8);
  }
  return result;
}

uint64_t sub_10001606C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000160BC()
{
  unint64_t result = qword_100025AB8;
  if (!qword_100025AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025AB8);
  }
  return result;
}

uint64_t sub_100016110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100016174()
{
  unint64_t result = qword_100025AD8;
  if (!qword_100025AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025AD8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x100016334);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_10001635C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100016368(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys()
{
  return &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys;
}

unint64_t sub_100016384()
{
  unint64_t result = qword_100025AF8;
  if (!qword_100025AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025AF8);
  }
  return result;
}

unint64_t sub_1000163DC()
{
  unint64_t result = qword_100025B00;
  if (!qword_100025B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025B00);
  }
  return result;
}

unint64_t sub_100016434()
{
  unint64_t result = qword_100025B08;
  if (!qword_100025B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025B08);
  }
  return result;
}

uint64_t sub_100016488(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x444970756F7267 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4C52556572616873 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6974617469766E69 && a2 == 0xEF6E656B6F546E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4865657469766E69 && a2 == 0xED0000656C646E61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656D6954746E6573 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_10001673C(uint64_t a1)
{
  return sub_1000167C8(a1, qword_100025D38);
}

uint64_t *sub_100016750(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000167B4(uint64_t a1)
{
  return sub_1000167C8(a1, qword_100025D50);
}

uint64_t sub_1000167C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100016750(v3, a2);
  sub_10000FBA4(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001683C()
{
  sub_100017058();
  uint64_t result = static OS_dispatch_source.makeSignalSource(signal:queue:)();
  qword_100025D68 = result;
  return result;
}

uint64_t sub_100016878()
{
  if (qword_1000254E8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000FBA4(v0, (uint64_t)qword_100025D38);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Received SIGTERM, will exit when clean", v3, 2u);
    swift_slowDealloc();
  }

  return _xpc_transaction_exit_clean();
}

uint64_t sub_100016960()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

int main(int argc, const char **argv, const char **envp)
{
  swift_task_create();
  swift_task_getMainExecutor();
  swift_job_run();
  int result = swift_task_asyncMainDrainQueue();
  __break(1u);
  return result;
}

uint64_t sub_100016A48()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100025B78 + dword_100025B78);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100016B00;
  return v3();
}

uint64_t sub_100016B00()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100016C3C, v1, v0);
}

void sub_100016C3C()
{
}

uint64_t sub_100016C74()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  v0[8] = v1;
  v0[9] = *(void *)(v1 - 8);
  v0[10] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for DispatchQoS();
  v0[11] = v2;
  v0[12] = *(void *)(v2 - 8);
  v0[13] = swift_task_alloc();
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100016DBC, v4, v3);
}

void sub_100016DBC()
{
  if (qword_1000254F8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[9];
  swift_getObjectType();
  v0[6] = sub_100016878;
  v0[7] = 0;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100017098;
  v0[5] = &unk_100021048;
  BOOL v7 = _Block_copy(v0 + 2);
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  sub_100016960();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v7);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  int v8 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v8);
  swift_getObjectType();
  swift_unknownObjectRetain();
  OS_dispatch_source.activate()();
  swift_unknownObjectRelease();
  if (qword_100025500 == -1) {
    dispatch_main();
  }
  swift_once();
  dispatch_main();
}

uint64_t sub_100016F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016F9C()
{
  return swift_release();
}

unint64_t sub_100016FA4()
{
  unint64_t result = qword_100025B80;
  if (!qword_100025B80)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025B80);
  }
  return result;
}

unint64_t sub_100016FFC()
{
  unint64_t result = qword_100025B90;
  if (!qword_100025B90)
  {
    sub_10000EE44(&qword_100025B88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025B90);
  }
  return result;
}

unint64_t sub_100017058()
{
  unint64_t result = qword_100025B98;
  if (!qword_100025B98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025B98);
  }
  return result;
}

uint64_t sub_100017098(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1000170DC()
{
  id v0 = objc_allocWithZone((Class)NSXPCListener);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithMachServiceName:v1];

  id v3 = objc_allocWithZone((Class)type metadata accessor for KCSharingMessagingdXPCListenerDelegate());
  id v4 = v2;
  uint64_t v5 = (char *)sub_100017F5C(v4);

  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener];
  [v6 setDelegate:v5];
  [v6 _setQueue:*(void *)&v5[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue]];
  [v6 resume];

  qword_100025D70 = (uint64_t)v5;
}

void sub_1000171C4()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  v7[0] = OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue;
  sub_1000192F0();
  static DispatchQoS.unspecified.getter();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_100019330();
  sub_100003F84(&qword_100025838);
  sub_10000EDE8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)&v0[v7[0]] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v0[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections] = &_swiftEmptyArrayStorage;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10001749C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000254E8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000FBA4(v4, (uint64_t)qword_100025D38);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)int v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "connection invalidated %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = (unint64_t *)(v2
                           + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections);
  swift_beginAccess();
  id v12 = v5;
  uint64_t v13 = sub_100018B10(v11, (uint64_t)v12);

  if (*v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v14 >= v13) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14 >= v13)
    {
LABEL_8:
      sub_100018E2C(v13, v14);
      swift_endAccess();
      return;
    }
  }
  __break(1u);
}

id sub_1000176E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdXPCListenerDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for KCSharingMessagingdXPCListenerDelegate()
{
  return self;
}

uint64_t sub_100017798(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001786C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100011000((uint64_t)v12, *a3);
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
      sub_100011000((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001606C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001786C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100017A28(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100017A28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100017AC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100017CA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100017CA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100017AC0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100017C38(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100017C38(uint64_t a1, uint64_t a2)
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
  sub_100003F84(&qword_100025C40);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100017CA0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003F84(&qword_100025C40);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100017DF0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100017E6C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }
      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1)) {
        break;
      }
      if (++v5 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return 0;
}

id sub_100017F5C(void *a1)
{
  uint64_t v15 = a1;
  uint64_t v14 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v6 - 8);
  uint64_t v13 = OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue;
  sub_1000192F0();
  int64_t v7 = v1;
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = &_swiftEmptyArrayStorage;
  sub_100019330();
  sub_100003F84(&qword_100025838);
  sub_10000EDE8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v14);
  *(void *)(v12[1] + v13) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v7[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections] = &_swiftEmptyArrayStorage;
  int64_t v8 = v15;
  *(void *)&v7[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener] = v15;
  id v9 = v8;

  uint64_t v10 = (objc_class *)type metadata accessor for KCSharingMessagingdXPCListenerDelegate();
  v16.receiver = v7;
  v16.super_class = v10;
  return [super init];
}

uint64_t sub_1000181C0(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000254E8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000FBA4(v4, (uint64_t)qword_100025D38);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    *(void *)&long long aBlock = v5;
    *(_DWORD *)int64_t v8 = 138412290;
    id v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v39 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handling incoming connection %@", v8, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (qword_1000254E0 != -1) {
    swift_once();
  }
  if (!qword_100025D30)
  {
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "keychainsharingmessagingd disabled. refusing new XPC connection", v15, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  id v10 = (id)qword_100025D30;
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v5 valueForEntitlement:v11];

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v42 = 0u;
  }
  sub_100019138((uint64_t)&aBlock, (uint64_t)v47);
  sub_1000191A0((uint64_t)v47, (uint64_t)&aBlock);
  if (!*((void *)&v42 + 1))
  {
    sub_100019208((uint64_t)&aBlock);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0 || (v46 & 1) == 0)
  {
LABEL_22:
    id v33 = v5;
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 138412546;
      uint64_t v46 = (uint64_t)v33;
      uint64_t v40 = v10;
      id v38 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v37 = v33;

      *(_WORD *)(v36 + 12) = 2080;
      uint64_t v46 = sub_100017798(0xD000000000000037, 0x800000010001B240, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Rejected connection %@ lacks entitlement %s", (uint8_t *)v36, 0x16u);
      sub_100003F84(&qword_1000258C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_100019208((uint64_t)v47);
    return 0;
  }
  id v16 = [self interfaceWithProtocol:&OBJC_PROTOCOL___KCSharingMessagingdXPCServerProtocol];
  [v5 setExportedInterface:v16];
  uint64_t v17 = (objc_class *)type metadata accessor for KCSharingMessagingdXPCServer();
  uint64_t v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection] = v5;
  *(void *)&v18[OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_invitationManagerDelegate] = v10;
  v45.receiver = v18;
  v45.super_class = v17;
  id v19 = v5;
  id v20 = v10;
  id v21 = [super init];
  [v19 setExportedObject:v21];
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v2;
  *(void *)(v22 + 24) = v21;
  int64_t v43 = sub_1000192A8;
  uint64_t v44 = v22;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v42 = sub_100017098;
  *((void *)&v42 + 1) = &unk_100021098;
  uint64_t v23 = _Block_copy(&aBlock);
  id v24 = v2;
  id v25 = v21;
  swift_release();
  [v19 setInterruptionHandler:v23];
  _Block_release(v23);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v24;
  *(void *)(v26 + 24) = v25;
  int64_t v43 = sub_1000192C8;
  uint64_t v44 = v26;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v42 = sub_100017098;
  *((void *)&v42 + 1) = &unk_1000210E8;
  uint64_t v27 = _Block_copy(&aBlock);
  int64_t v28 = (char *)v24;
  id v29 = v25;
  swift_release();
  [v19 setInvalidationHandler:v27];
  _Block_release(v27);
  uint64_t v30 = &v28[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections];
  swift_beginAccess();
  id v31 = v29;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*(void *)v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v30 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  [v19 _setQueue:*(void *)&v28[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue]];
  [v19 resume];

  sub_100019208((uint64_t)v47);
  return 1;
}

void sub_100018944(void *a1)
{
  if (qword_1000254E8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000FBA4(v2, (uint64_t)qword_100025D38);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)id v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "connection interrupted %@", v5, 0xCu);
    sub_100003F84(&qword_1000258C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_100018B10(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_100017E6C(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v9 != v25) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0) {
          break;
        }
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_45;
        }
        if (*(void *)(v12 + 8 * i) != a2) {
          goto LABEL_11;
        }
LABEL_31:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v21 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v21) {
          return v6;
        }
      }
      uint64_t v22 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_unknownObjectRelease();
      if (v22 == a2) {
        goto LABEL_31;
      }
LABEL_11:
      if (v11 == v6)
      {
LABEL_30:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_31;
      }
      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          id v14 = *(id *)(v9 + 8 * i);
          goto LABEL_19;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        id v13 = *(id *)(v9 + 8 * v6 + 32);
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_16;
        }
      }
      id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      unint64_t v9 = *a1;
LABEL_19:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        unint64_t v9 = sub_100017DF0(v9);
        *a1 = v9;
      }
      id v16 = *(void **)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20);
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v14;

      specialized Array._endMutation()();
      unint64_t v9 = *a1;
      int v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v17 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
      {
        unint64_t v9 = sub_100017DF0(v9);
        *a1 = v9;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      uint64_t v18 = v9 & 0xFFFFFFFFFFFFFF8;
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      id v19 = *(void **)(v18 + 8 * i);
      *(void *)(v18 + 8 * i) = v13;

      specialized Array._endMutation()();
      goto LABEL_30;
    }
    return v6;
  }
  unint64_t v23 = *a1;
  if (!(v23 >> 62)) {
    return *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_100018E2C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!((unint64_t)*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v20 < v2) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v8 = v21 + v5;
    if (!__OFADD__(v21, v5)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((unint64_t)*v3 >> 62) {
    goto LABEL_32;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t *v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v12 = v11 + 32;
  id v13 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for KCSharingMessagingdXPCServer();
  swift_arrayDestroy();
  if (v5)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v15 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_17:
        if (v15 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        id v16 = (char *)(v12 + 8 * v2);
        if (v4 != v2 || v13 >= &v16[8 * v15]) {
          memmove(v13, v16, 8 * v15);
        }
        if (!((unint64_t)*v3 >> 62))
        {
          uint64_t v17 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v18 = v17 + v5;
          if (!__OFADD__(v17, v5))
          {
LABEL_23:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v18;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v18 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v14 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v15 = v14 - v2;
      if (!__OFSUB__(v14, v2)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:

  return specialized Array._endMutation()();
}

uint64_t sub_100019138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F84(&qword_1000258F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000191A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F84(&qword_1000258F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019208(uint64_t a1)
{
  uint64_t v2 = sub_100003F84(&qword_1000258F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019268()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000192A8()
{
  sub_100018944(*(void **)(v0 + 24));
}

uint64_t sub_1000192B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000192C0()
{
  return swift_release();
}

void sub_1000192C8()
{
  sub_10001749C(*(void **)(v0 + 24));
}

unint64_t sub_1000192F0()
{
  unint64_t result = qword_100025828;
  if (!qword_100025828)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100025828);
  }
  return result;
}

unint64_t sub_100019330()
{
  unint64_t result = qword_100025830;
  if (!qword_100025830)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025830);
  }
  return result;
}

id sub_1000194D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagingError();
  return [super dealloc];
}

uint64_t type metadata accessor for MessagingError()
{
  return self;
}

id sub_100019534(uint64_t a1)
{
  sub_100003F84(&qword_1000259F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001C760;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000010001B540;
  *(void *)(inited + 72) = sub_100003F84(&qword_100025988);
  *(void *)(inited + 48) = a1;
  swift_bridgeObjectRetain();
  sub_10000A560(inited);
  id v3 = objc_allocWithZone((Class)NSError);
  NSString v4 = String._bridgeToObjectiveC()();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithDomain:v4 code:0 userInfo:isa];

  return v6;
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

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
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

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
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

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.background.getter()
{
  return static TaskPriority.background.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
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

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
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

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
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

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
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

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
{
}

void exit(int a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_job_run()
{
  return _swift_job_run();
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

uint64_t swift_task_asyncMainDrainQueue()
{
  return _swift_task_asyncMainDrainQueue();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
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

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _[a1 groupID];
}

id objc_msgSend_inviteToken(void *a1, const char *a2, ...)
{
  return _[a1 inviteToken];
}

id objc_msgSend_inviteeHandle(void *a1, const char *a2, ...)
{
  return _[a1 inviteeHandle];
}

id objc_msgSend_senderHandle(void *a1, const char *a2, ...)
{
  return _[a1 senderHandle];
}

id objc_msgSend_sentTime(void *a1, const char *a2, ...)
{
  return _[a1 sentTime];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return _[a1 shareURL];
}