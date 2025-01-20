uint64_t static DaemonUtilities.ingestContent(_:)(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v5;

  sub_25F737C38();
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_25F733640;
  return MEMORY[0x270F7E788](a1);
}

uint64_t sub_25F733640()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t static DaemonUtilities.updateDeviceProfile(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25F733754, 0, 0);
}

uint64_t sub_25F733754()
{
  sub_25F737BC8();
  sub_25F737C18();
  sub_25F737C08();
  v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

ValueMetadata *type metadata accessor for DaemonUtilities()
{
  return &type metadata for DaemonUtilities;
}

uint64_t sub_25F7337FC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t static TipConfiguration.bundleIdentifierOverride.getter()
{
  uint64_t v0 = sub_25F737BB8();
  sub_25F733AE0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F737BA8();
  uint64_t v5 = sub_25F737B78();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return v5;
}

uint64_t static TipConfiguration.bundleIdentifierOverride.setter()
{
  uint64_t v0 = (uint64_t (*)(uint64_t *, void))sub_25F737B98();
  sub_25F737B88();
  return v0(&v2, 0);
}

void (*static TipConfiguration.bundleIdentifierOverride.modify(void *a1))(char **a1, char a2)
{
  uint64_t v2 = malloc(0x58uLL);
  *a1 = v2;
  uint64_t v3 = sub_25F737BB8();
  sub_25F733AE0();
  uint64_t v5 = v4;
  uint64_t v7 = malloc(*(void *)(v6 + 64));
  v2[10] = v7;
  sub_25F737BA8();
  uint64_t v8 = sub_25F737B78();
  uint64_t v10 = v9;
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v3);
  v2[8] = v8;
  v2[9] = v10;
  return sub_25F733A0C;
}

void sub_25F733A0C(char **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)*((void *)*a1 + 10);
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void (*)(char *, void))sub_25F737B98();
    sub_25F733AFC();
    v4(v2, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = (void (*)(char *, void))sub_25F737B98();
    sub_25F733AFC();
    v5(v2 + 32, 0);
  }
  free(v3);
  free(v2);
}

ValueMetadata *type metadata accessor for TipConfiguration()
{
  return &type metadata for TipConfiguration;
}

uint64_t sub_25F733AFC()
{
  return sub_25F737B88();
}

uint64_t static TipEventProxy.donate(eventIdentifier:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  return MEMORY[0x270FA2498](sub_25F733B44, 0, 0);
}

uint64_t sub_25F733B44()
{
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = sub_25F734098;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = (void (*)(void *, void))sub_25F737C48();
  sub_25F737C58();
  swift_task_dealloc();
  v6(v0 + 2, 0);
  swift_task_dealloc();
  if (v1) {
    unint64_t v7 = sub_25F7340A8(v0[10]);
  }
  else {
    unint64_t v7 = 0;
  }
  v0[11] = v7;
  sub_25F737BF8();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[12] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25F733C9C;
  uint64_t v10 = v0[8];
  uint64_t v9 = v0[9];
  return MEMORY[0x270F7E768](v10, v9);
}

uint64_t sub_25F733C9C(uint64_t a1)
{
  sub_25F73462C();
  uint64_t v5 = v4;
  sub_25F734644();
  *uint64_t v6 = v5;
  uint64_t v7 = *v2;
  sub_25F734644();
  *uint64_t v8 = v7;
  v5[13] = a1;
  v5[14] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_25F733F2C, 0, 0);
  }
  else
  {
    sub_25F737B18();
    uint64_t v9 = (void *)swift_task_alloc();
    v5[15] = v9;
    *uint64_t v9 = v7;
    v9[1] = sub_25F733E0C;
    uint64_t v10 = v5[11];
    uint64_t v11 = v5[7];
    uint64_t v12 = v5[6];
    return MEMORY[0x270F7E400](v12, v11, v10, a1);
  }
}

uint64_t sub_25F733E0C()
{
  sub_25F73462C();
  uint64_t v3 = v2;
  sub_25F734644();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_25F734644();
  *uint64_t v6 = v5;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25F733F90, 0, 0);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
}

uint64_t sub_25F733F2C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25F733F90()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25F733FFC()
{
  uint64_t v1 = sub_25F737DE8();
  sub_25F737CC8();
  sub_25F737CC8();
  sub_25F737CC8();
  return v1;
}

uint64_t sub_25F734098()
{
  return sub_25F733FFC();
}

uint64_t sub_25F7340A0()
{
  return sub_25F7337FC(*(uint64_t (**)(void))(v0 + 16));
}

unint64_t sub_25F7340A8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_25F7344F4(&qword_26A7BB388);
    uint64_t v2 = (void *)sub_25F737DD8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &__src[2];
  uint64_t v7 = (long long *)&__dst[2];
  uint64_t v8 = &v41;
  uint64_t v9 = &v42;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v37 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v36 << 6);
      }
      else
      {
        int64_t v12 = v36 + 1;
        if (__OFADD__(v36, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v34)
        {
LABEL_31:
          sub_25F734624();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v35 + 8 * v12);
        int64_t v14 = v36 + 1;
        if (!v13)
        {
          int64_t v14 = v36 + 2;
          if (v36 + 2 >= v34) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v35 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v36 + 3;
            if (v36 + 3 >= v34) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v35 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v36 + 4;
              if (v36 + 4 >= v34) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v35 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v36 + 5;
                if (v36 + 5 >= v34) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v35 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v34) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v35 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v36 + 5;
              }
            }
          }
        }
LABEL_25:
        int64_t v36 = v14;
        uint64_t v37 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_25F734538(*(void *)(v1 + 56) + 56 * v11, (uint64_t)v6);
      __src[0] = v18;
      __src[1] = v17;
      memcpy(__dst, __src, sizeof(__dst));
      uint64_t v39 = __dst[0];
      uint64_t v40 = __dst[1];
      sub_25F7345A4(v7, (uint64_t)v38);
      swift_bridgeObjectRetain();
      sub_25F7344F4(&qword_26A7BB390);
      sub_25F7344F4(&qword_26A7BB398);
      swift_dynamicCast();
      uint64_t v19 = v39;
      uint64_t v20 = v40;
      sub_25F7345C4(v8, v9);
      sub_25F7345C4(v9, v43);
      sub_25F7345C4(v43, v38);
      unint64_t result = sub_25F736ED4(v19, v20);
      unint64_t v21 = result;
      if ((v22 & 1) == 0) {
        break;
      }
      v23 = v9;
      v24 = v8;
      uint64_t v25 = v1;
      v26 = v7;
      v27 = v6;
      v28 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v28 = v19;
      v28[1] = v20;
      uint64_t v6 = v27;
      uint64_t v7 = v26;
      uint64_t v1 = v25;
      uint64_t v8 = v24;
      uint64_t v9 = v23;
      v29 = (_OWORD *)(v2[7] + 32 * v21);
      sub_25F7345D4((uint64_t)v29);
      unint64_t result = (unint64_t)sub_25F7345C4(v38, v29);
      unint64_t v5 = v37;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v30 = v19;
    v30[1] = v20;
    unint64_t result = (unint64_t)sub_25F7345C4(v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_33;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t TipEventProxy.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TipEventProxy.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t TipEventProxy.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25F73449C()
{
  return TipEventProxy.unownedExecutor.getter();
}

uint64_t type metadata accessor for TipEventProxy()
{
  return self;
}

uint64_t method lookup function for TipEventProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipEventProxy);
}

uint64_t sub_25F7344F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25F734538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(void *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25F7345A4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  long long v4 = a1[2];
  *(void *)(a2 + 48) = *((void *)a1 + 6);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

_OWORD *sub_25F7345C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25F7345D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25F734624()
{
  return swift_release();
}

uint64_t static TipEventProxySwift.donate(eventIdentifier:for:)()
{
  sub_25F7355E8();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  type metadata accessor for TipEventProxy();
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)sub_25F7355DC(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_25F73471C;
  return static TipEventProxy.donate(eventIdentifier:for:with:)(v7, v5, v3, v1, 0);
}

uint64_t sub_25F73471C()
{
  sub_25F7355F4();
  sub_25F73462C();
  uint64_t v1 = *v0;
  sub_25F7355AC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25F735600();
  return v3();
}

uint64_t sub_25F734870(int a1, int a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  sub_25F737CA8();
  v3[3] = v4;
  sub_25F737CA8();
  v3[4] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[5] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_25F734950;
  return static TipEventProxySwift.donate(eventIdentifier:for:)();
}

uint64_t sub_25F734950()
{
  sub_25F7355E8();
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  sub_25F7355AC();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  *uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 16);
  if (v2)
  {
    uint64_t v8 = (void *)sub_25F737AD8();
    MEMORY[0x2611FD170](v2);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_25F734AE8(uint64_t a1, uint64_t a2)
{
  sub_25F7344F4(&qword_26A7BB3B8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F737D18();
  sub_25F734DC0((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_26A7BB3C8;
  v8[5] = v7;
  sub_25F73512C((uint64_t)v5, (uint64_t)&unk_26A7BB3D8, (uint64_t)v8);
  return swift_release();
}

id TipEventProxySwift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TipEventProxySwift.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipEventProxySwift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TipEventProxySwift()
{
  return self;
}

uint64_t sub_25F734CD8()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25F734D20()
{
  sub_25F7355E8();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)sub_25F7355DC(v0);
  *id v1 = v2;
  v1[1] = sub_25F73471C;
  uint64_t v3 = sub_25F7355BC();
  return v4(v3);
}

uint64_t sub_25F734DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25F734DE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_25F7355A8;
  return v6();
}

uint64_t sub_25F734EB8()
{
  sub_25F7355E8();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)sub_25F7355DC(v0);
  *id v1 = v2;
  v1[1] = sub_25F7355A8;
  uint64_t v3 = sub_25F7355BC();
  return v4(v3);
}

uint64_t sub_25F734F58(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25F7355A8;
  return v7();
}

uint64_t sub_25F735028()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25F735068()
{
  sub_25F7355E8();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_25F7355DC(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_25F7355A8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A7BB3D0 + dword_26A7BB3D0);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_25F73512C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25F737D18();
  if (sub_25F735294(a1, 1, v6) == 1)
  {
    sub_25F7352BC(a1);
  }
  else
  {
    sub_25F737D08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25F737CF8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25F735294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25F7352BC(uint64_t a1)
{
  uint64_t v2 = sub_25F7344F4(&qword_26A7BB3B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F73531C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25F7353F8;
  return v6(a1);
}

uint64_t sub_25F7353F8()
{
  sub_25F7355F4();
  sub_25F73462C();
  uint64_t v1 = *v0;
  sub_25F7355AC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25F735600();
  return v3();
}

uint64_t sub_25F7354BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F7354F4(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_25F7355DC(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_25F73471C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A7BB3E0 + dword_26A7BB3E0);
  return v7(a1, v3);
}

uint64_t sub_25F7355BC()
{
  return v0;
}

uint64_t sub_25F7355DC(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_25F735600()
{
  return v0 + 8;
}

uint64_t static TipProxy.invalidate(tipIdentifier:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(void *)(v5 + 64) = a3;
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 56) = a2;
  *(unsigned char *)(v5 + 112) = *a5;
  return MEMORY[0x270FA2498](sub_25F735638, 0, 0);
}

uint64_t sub_25F735638()
{
  char v1 = *(unsigned char *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = sub_25F735B34;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = (void (*)(uint64_t, void))sub_25F737C48();
  sub_25F737C58();
  swift_task_dealloc();
  v6(v0 + 16, 0);
  swift_task_dealloc();
  sub_25F737BF8();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25F73577C;
  uint64_t v9 = *(void *)(v0 + 64);
  uint64_t v8 = *(void *)(v0 + 72);
  return MEMORY[0x270F7E768](v9, v8);
}

uint64_t sub_25F73577C(uint64_t a1)
{
  sub_25F73462C();
  uint64_t v5 = v4;
  sub_25F734644();
  *uint64_t v6 = v5;
  uint64_t v7 = *v2;
  sub_25F734644();
  *uint64_t v8 = v7;
  *(void *)(v5 + 88) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
    return v9();
  }
  else
  {
    sub_25F737B38();
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v5 + 96) = v11;
    *uint64_t v11 = v7;
    v11[1] = sub_25F7358E4;
    uint64_t v12 = *(void *)(v5 + 56);
    uint64_t v13 = *(unsigned __int8 *)(v5 + 112);
    uint64_t v14 = *(void *)(v5 + 48);
    return MEMORY[0x270F7E470](v14, v12, v13, a1);
  }
}

uint64_t sub_25F7358E4()
{
  sub_25F73462C();
  uint64_t v3 = v2;
  sub_25F734644();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_25F734644();
  *uint64_t v6 = v5;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25F7359F4, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
}

uint64_t sub_25F7359F4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25F735A58()
{
  uint64_t v1 = sub_25F737DE8();
  sub_25F737CC8();
  sub_25F737CC8();
  sub_25F737CC8();
  sub_25F737D88();
  sub_25F737CC8();
  return v1;
}

uint64_t sub_25F735B34()
{
  return sub_25F735A58();
}

uint64_t TipProxy.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TipProxy.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t TipProxy.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_25F735B9C()
{
  return TipProxy.unownedExecutor.getter();
}

void static TipProxy.InvalidationReason.userClosedTip.getter(unsigned char *a1@<X8>)
{
}

void static TipProxy.InvalidationReason.userPerformedAction.getter(unsigned char *a1@<X8>)
{
}

void static TipProxy.InvalidationReason.maxDisplayCountExceeded.getter(unsigned char *a1@<X8>)
{
}

BOOL static TipProxy.InvalidationReason.== infix(_:_:)()
{
  return sub_25F735BDC();
}

BOOL sub_25F735BDC()
{
  sub_25F735E30();
  sub_25F737CE8();
  sub_25F737CE8();
  return v2 == v1;
}

uint64_t type metadata accessor for TipProxy()
{
  return self;
}

uint64_t method lookup function for TipProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipProxy);
}

unsigned char *initializeBufferWithCopyOfBuffer for TipProxy.InvalidationReason(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TipProxy.InvalidationReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TipProxy.InvalidationReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x25F735DF8);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TipProxy.InvalidationReason()
{
  return &type metadata for TipProxy.InvalidationReason;
}

unint64_t sub_25F735E30()
{
  unint64_t result = qword_26A7BB3F8;
  if (!qword_26A7BB3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB3F8);
  }
  return result;
}

void sub_25F735E7C(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t static TipProxy.remoteTipIdentifiers(bundleID:in:)()
{
  sub_25F737A98();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  v0[4] = v5;
  v0[5] = v6;
  v0[3] = v7;
  v0[6] = sub_25F737BF8();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25F735F44;
  return MEMORY[0x270F7E768](v4, v2);
}

uint64_t sub_25F735F44()
{
  sub_25F7355F4();
  sub_25F73462C();
  sub_25F734644();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 64) = v4;
  swift_task_dealloc();
  if (v0)
  {
    sub_25F735600();
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_25F736048, 0, 0);
  }
}

uint64_t sub_25F736048()
{
  sub_25F737A98();
  *(void *)(v0 + 72) = sub_25F737BD8();
  uint64_t v4 = (uint64_t (*)(uint64_t, void *, void, uint64_t))((int)*MEMORY[0x263F7F480] + MEMORY[0x263F7F480]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  uint64_t v2 = sub_25F7344F4(&qword_26A7BB410);
  *uint64_t v1 = v0;
  v1[1] = sub_25F736130;
  return v4(v0 + 16, &unk_26A7BB408, 0, v2);
}

uint64_t sub_25F736130()
{
  sub_25F7355F4();
  sub_25F73462C();
  uint64_t v3 = v2;
  sub_25F734644();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_25F734644();
  *uint64_t v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_25F7362C8;
  }
  else
  {
    swift_release();
    uint64_t v7 = sub_25F73621C;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_25F73621C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = v0[2];
  sub_25F737AF8();
  sub_25F737AC4();
  uint64_t v5 = sub_25F737AA4();
  v6(v5);
  v3[3] = v2;
  *uint64_t v3 = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v4);
}

uint64_t sub_25F7362C8()
{
  sub_25F7355F4();
  swift_release();
  swift_release();
  sub_25F735600();
  return v0();
}

uint64_t sub_25F73632C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_25F73634C, 0, 0);
}

uint64_t sub_25F73634C()
{
  uint64_t v1 = v0;
  sub_25F737B68();
  sub_25F737A44();
  uint64_t v2 = sub_25F737AB8();
  MEMORY[0x2611FCE10](v2);
  sub_25F737AB8();
  sub_25F737C88();
  sub_25F737AB8();
  sub_25F737C88();
  unint64_t v3 = sub_25F737C68();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25F737DB8();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      if (v6 < 1)
      {
        __break(1u);
        goto LABEL_33;
      }
      for (uint64_t i = 0; i != v6; ++i)
      {
        if ((v3 & 0xC000000000000001) != 0) {
          MEMORY[0x2611FCED0](i, v3);
        }
        else {
          swift_retain();
        }
        uint64_t v8 = (void *)sub_25F737B58();

        if (v8)
        {
          sub_25F737D48();
          sub_25F737D68();
          sub_25F737D78();
          sub_25F737D58();
        }
        else
        {
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = v23;
      if (v23 < 0) {
        goto LABEL_27;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v9 & 0x4000000000000000) != 0)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25F737DB8();
    swift_release();
    if (!v10) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
LABEL_18:
    uint64_t result = (uint64_t)sub_25F737030(0, v10 & ~(v10 >> 63), 0);
    if ((v10 & 0x8000000000000000) == 0)
    {
      uint64_t v22 = v1;
      uint64_t v11 = 0;
      uint64_t v12 = v5;
      unint64_t v13 = v9 & 0xC000000000000001;
      uint64_t v14 = v9;
      do
      {
        if (v13) {
          MEMORY[0x2611FCED0](v11, v9);
        }
        else {
          swift_retain();
        }
        uint64_t v15 = sub_25F737B48();
        uint64_t v17 = v16;
        swift_release();
        unint64_t v19 = *(void *)(v5 + 16);
        unint64_t v18 = *(void *)(v5 + 24);
        if (v19 >= v18 >> 1) {
          sub_25F737030((char *)(v18 > 1), v19 + 1, 1);
        }
        ++v11;
        *(void *)(v5 + 16) = v19 + 1;
        uint64_t v20 = v5 + 16 * v19;
        *(void *)(v20 + 32) = v15;
        *(void *)(v20 + 40) = v17;
        uint64_t v9 = v14;
      }
      while (v10 != v11);
      swift_release();
      uint64_t v1 = v22;
      goto LABEL_29;
    }
LABEL_33:
    __break(1u);
    return result;
  }
LABEL_28:
  swift_release();
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_29:
  **(void **)(v1 + 16) = v12;
  unint64_t v21 = *(uint64_t (**)(void))(v1 + 8);
  return v21();
}

uint64_t static TipProxy.remoteTipIdentifiers(in:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_25F7366A0, 0, 0);
}

uint64_t sub_25F7366A0()
{
  uint64_t v1 = v0[4];
  v0[2] = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[5] = v2;
  *(void *)(v2 + 16) = v1;
  unint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  uint64_t v4 = sub_25F7344F4(&qword_26A7BB430);
  uint64_t v5 = sub_25F7344F4(&qword_26A7BB438);
  unint64_t v6 = sub_25F736D8C();
  *unint64_t v3 = v0;
  v3[1] = sub_25F7367AC;
  return MEMORY[0x270F7E840](&unk_26A7BB428, v2, v4, v5, v6);
}

uint64_t sub_25F7367AC()
{
  sub_25F737A98();
  uint64_t v3 = v2;
  sub_25F73462C();
  uint64_t v5 = v4;
  sub_25F734644();
  *unint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_25F734644();
  *uint64_t v8 = v7;
  *(void *)(v5 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = sub_25F73690C;
  }
  else
  {
    *(void *)(v5 + 64) = v3;
    swift_task_dealloc();
    uint64_t v9 = sub_25F7368AC;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_25F7368AC()
{
  sub_25F7355F4();
  uint64_t v1 = sub_25F736E28(*(void *)(v0 + 64));
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25F73690C()
{
  sub_25F7355F4();
  swift_task_dealloc();
  sub_25F735600();
  return v0();
}

uint64_t sub_25F736968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25F73698C, 0, 0);
}

uint64_t sub_25F73698C()
{
  sub_25F737A98();
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *(_DWORD *)(v0 + 80) = *(_DWORD *)(sub_25F7344F4(&qword_26A7BB438) + 48);
  *uint64_t v1 = sub_25F737AE8();
  v1[1] = v2;
  *(void *)(v0 + 40) = sub_25F7344F4(&qword_26A7BB450);
  sub_25F737AE8();
  *(void *)(v0 + 48) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25F736A7C;
  sub_25F737AB8();
  return static TipProxy.remoteTipIdentifiers(bundleID:in:)();
}

uint64_t sub_25F736A7C()
{
  sub_25F737A98();
  uint64_t v3 = v2;
  sub_25F73462C();
  uint64_t v5 = v4;
  sub_25F734644();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_25F734644();
  *uint64_t v8 = v7;
  *(void *)(v5 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = sub_25F736BB4;
  }
  else
  {
    uint64_t v10 = *(void *)(v5 + 40);
    swift_bridgeObjectRelease();
    *(void *)(v5 + 72) = v3;
    *(_DWORD *)(v5 + 84) = *(_DWORD *)(v10 + 64);
    uint64_t v9 = sub_25F736B84;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_25F736B84()
{
  *(void *)(*(void *)(v0 + 16) + *(int *)(v0 + 80) + *(int *)(v0 + 84)) = *(void *)(v0 + 72);
  sub_25F735600();
  return v1();
}

uint64_t sub_25F736BB4()
{
  sub_25F7355F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25F735600();
  return v0();
}

uint64_t sub_25F736C1C()
{
  sub_25F737A98();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_25F736CC8;
  return sub_25F736968(v5, v3, v6);
}

uint64_t sub_25F736CC8()
{
  sub_25F7355F4();
  sub_25F73462C();
  uint64_t v1 = *v0;
  sub_25F734644();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_25F735600();
  return v3();
}

unint64_t sub_25F736D8C()
{
  unint64_t result = qword_26A7BB440;
  if (!qword_26A7BB440)
  {
    sub_25F736DE0(&qword_26A7BB430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB440);
  }
  return result;
}

uint64_t sub_25F736DE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25F736E28(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_25F7344F4(&qword_26A7BB448);
    uint64_t v1 = sub_25F737DD8();
  }
  else
  {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_25F737150(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_25F736ED4(uint64_t a1, uint64_t a2)
{
  sub_25F737E18();
  sub_25F737CB8();
  uint64_t v4 = sub_25F737E28();
  return sub_25F736F4C(a1, a2, v4);
}

unint64_t sub_25F736F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25F737DF8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25F737DF8() & 1) == 0);
    }
  }
  return v6;
}

char *sub_25F737030(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F737050(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_25F737050(char *result, int64_t a2, char a3, char *a4)
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
    sub_25F7344F4((uint64_t *)&unk_26A7BB470);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_25F737150(uint64_t a1, char a2, void *a3)
{
  v38 = a3;
  uint64_t v37 = *(void *)(sub_25F7344F4(&qword_26A7BB450) - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F7344F4(&qword_26A7BB438);
  uint64_t v8 = MEMORY[0x270FA5388]();
  size_t v11 = (void *)((char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12) {
    return swift_bridgeObjectRelease();
  }
  v33[1] = v3;
  v33[2] = a1;
  uint64_t v36 = (uint64_t)v11 + *(int *)(v8 + 48);
  uint64_t v13 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v34 = *(void *)(v9 + 72);
  swift_bridgeObjectRetain();
  uint64_t v35 = v7;
  while (1)
  {
    sub_25F7379DC(v13, (uint64_t)v11, &qword_26A7BB438);
    BOOL v14 = v11;
    uint64_t v15 = *v11;
    uint64_t v16 = v11[1];
    uint64_t v41 = v15;
    uint64_t v42 = v16;
    sub_25F737574(v36, (uint64_t)v7);
    uint64_t v17 = (void *)*v38;
    unint64_t v19 = sub_25F736ED4(v15, v16);
    uint64_t v20 = v17[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_25F737E08();
      __break(1u);
      goto LABEL_20;
    }
    char v23 = v18;
    if (v17[3] < v22) {
      break;
    }
    if (a2)
    {
      if (v18) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_25F7344F4(&qword_26A7BB458);
      sub_25F737D98();
      if (v23) {
        goto LABEL_14;
      }
    }
LABEL_10:
    v26 = (void *)*v38;
    *(void *)(*v38 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    v27 = (uint64_t *)(v26[6] + 16 * v19);
    uint64_t *v27 = v15;
    v27[1] = v16;
    int64_t v7 = v35;
    sub_25F737574((uint64_t)v35, v26[7] + *(void *)(v37 + 72) * v19);
    uint64_t v28 = v26[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_18;
    }
    v26[2] = v30;
    v13 += v34;
    a2 = 1;
    --v12;
    size_t v11 = v14;
    if (!v12) {
      return swift_bridgeObjectRelease_n();
    }
  }
  sub_25F73763C(v22, a2 & 1);
  unint64_t v24 = sub_25F736ED4(v15, v16);
  if ((v23 & 1) != (v25 & 1)) {
    goto LABEL_19;
  }
  unint64_t v19 = v24;
  if ((v23 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v31 = swift_allocError();
  swift_willThrow();
  uint64_t v43 = v31;
  MEMORY[0x2611FD180](v31);
  sub_25F7344F4(&qword_26A7BB460);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25F7375DC((uint64_t)v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x2611FD170](v43);
  }
LABEL_20:
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_25F737D28();
  sub_25F737CC8();
  sub_25F737D88();
  sub_25F737CC8();
  uint64_t result = sub_25F737DA8();
  __break(1u);
  return result;
}

uint64_t sub_25F737574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F7344F4(&qword_26A7BB450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F7375DC(uint64_t a1)
{
  uint64_t v2 = sub_25F7344F4(&qword_26A7BB450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F73763C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = *(void *)(sub_25F7344F4(&qword_26A7BB450) - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_25F7344F4(&qword_26A7BB448);
  int v42 = a2;
  uint64_t v8 = sub_25F737DC8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_40;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  unint64_t v40 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  v38 = v2;
  int64_t v39 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v13) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v16 << 6))
  {
    char v23 = (uint64_t *)(*(void *)(v7 + 48) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    uint64_t v26 = *(void *)(v41 + 72);
    uint64_t v27 = *(void *)(v7 + 56) + v26 * i;
    if (v42)
    {
      sub_25F737574(v27, (uint64_t)v6);
    }
    else
    {
      sub_25F7379DC(v27, (uint64_t)v6, &qword_26A7BB450);
      swift_bridgeObjectRetain();
    }
    sub_25F737E18();
    sub_25F737CB8();
    uint64_t result = sub_25F737E28();
    uint64_t v28 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v14 + 8 * (v29 >> 6))) == 0)
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v28) >> 6;
      while (++v30 != v33 || (v32 & 1) == 0)
      {
        BOOL v34 = v30 == v33;
        if (v30 == v33) {
          unint64_t v30 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v14 + 8 * v30);
        if (v35 != -1)
        {
          unint64_t v31 = __clz(__rbit64(~v35)) + (v30 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    unint64_t v31 = __clz(__rbit64((-1 << v29) & ~*(void *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(void *)(v14 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    uint64_t v36 = (void *)(*(void *)(v9 + 48) + 16 * v31);
    *uint64_t v36 = v24;
    v36[1] = v25;
    uint64_t result = sub_25F737574((uint64_t)v6, *(void *)(v9 + 56) + v26 * v31);
    ++*(void *)(v9 + 16);
    if (v13) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_42;
    }
    if (v19 >= v39)
    {
      swift_release();
      uint64_t v3 = v38;
      uint64_t v20 = v40;
      goto LABEL_35;
    }
    uint64_t v20 = v40;
    unint64_t v21 = v40[v19];
    ++v16;
    if (!v21)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v39) {
        goto LABEL_33;
      }
      unint64_t v21 = v40[v16];
      if (!v21) {
        break;
      }
    }
LABEL_18:
    unint64_t v13 = (v21 - 1) & v21;
  }
  int64_t v22 = v19 + 2;
  if (v22 < v39)
  {
    unint64_t v21 = v40[v22];
    if (!v21)
    {
      while (1)
      {
        int64_t v16 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_43;
        }
        if (v16 >= v39) {
          goto LABEL_33;
        }
        unint64_t v21 = v40[v16];
        ++v22;
        if (v21) {
          goto LABEL_18;
        }
      }
    }
    int64_t v16 = v22;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  uint64_t v3 = v38;
LABEL_35:
  if (v42)
  {
    uint64_t v37 = 1 << *(unsigned char *)(v7 + 32);
    if (v37 >= 64) {
      sub_25F737A28(0, (unint64_t)(v37 + 63) >> 6, v20);
    }
    else {
      *uint64_t v20 = -1 << v37;
    }
    *(void *)(v7 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_25F7379DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_25F7344F4(a3);
  sub_25F737AC4();
  uint64_t v4 = sub_25F737AA4();
  v5(v4);
  return a2;
}

uint64_t sub_25F737A28(uint64_t result, uint64_t a2, void *a3)
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

unint64_t sub_25F737A44()
{
  unint64_t result = qword_26A7BB468;
  if (!qword_26A7BB468)
  {
    sub_25F737B68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7BB468);
  }
  return result;
}

uint64_t sub_25F737AA4()
{
  return v0;
}

uint64_t sub_25F737AB8()
{
  return v0;
}

uint64_t sub_25F737AD8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25F737AE8()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25F737AF8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25F737B18()
{
  return MEMORY[0x270F7E420]();
}

uint64_t sub_25F737B38()
{
  return MEMORY[0x270F7E628]();
}

uint64_t sub_25F737B48()
{
  return MEMORY[0x270F7E638]();
}

uint64_t sub_25F737B58()
{
  return MEMORY[0x270F7E640]();
}

uint64_t sub_25F737B68()
{
  return MEMORY[0x270F7E648]();
}

uint64_t sub_25F737B78()
{
  return MEMORY[0x270F7E688]();
}

uint64_t sub_25F737B88()
{
  return MEMORY[0x270F7E690]();
}

uint64_t sub_25F737B98()
{
  return MEMORY[0x270F7E6B0]();
}

uint64_t sub_25F737BA8()
{
  return MEMORY[0x270F7E6B8]();
}

uint64_t sub_25F737BB8()
{
  return MEMORY[0x270F7E6C0]();
}

uint64_t sub_25F737BC8()
{
  return MEMORY[0x270F7E6C8]();
}

uint64_t sub_25F737BD8()
{
  return MEMORY[0x270F7E750]();
}

uint64_t sub_25F737BF8()
{
  return MEMORY[0x270F7E770]();
}

uint64_t sub_25F737C08()
{
  return MEMORY[0x270F7E778]();
}

uint64_t sub_25F737C18()
{
  return MEMORY[0x270F7E780]();
}

uint64_t sub_25F737C38()
{
  return MEMORY[0x270F7E790]();
}

uint64_t sub_25F737C48()
{
  return MEMORY[0x270F7E7A0]();
}

uint64_t sub_25F737C58()
{
  return MEMORY[0x270F7E7A8]();
}

uint64_t sub_25F737C68()
{
  return MEMORY[0x270F7E7E8]();
}

uint64_t sub_25F737C78()
{
  return MEMORY[0x270F7E7F0]();
}

uint64_t sub_25F737C88()
{
  return MEMORY[0x270F7E7F8]();
}

uint64_t sub_25F737C98()
{
  return MEMORY[0x270F7E800]();
}

uint64_t sub_25F737CA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25F737CB8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25F737CC8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25F737CE8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25F737CF8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25F737D08()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25F737D18()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25F737D28()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25F737D38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25F737D48()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25F737D58()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25F737D68()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25F737D78()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25F737D88()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25F737D98()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25F737DA8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25F737DB8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25F737DC8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25F737DD8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25F737DE8()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_25F737DF8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25F737E08()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25F737E18()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25F737E28()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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