uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1A75FA6C8()
{
  MEMORY[0x1AD0CDE20](*(void *)(v0 + 16), -1, -1);
  return MEMORY[0x1F4186488](v0, 24, 7);
}

double default argument 2 of static KeepAliveTransaction.asyncTask(reason:queue:delay:wrapping:)()
{
  return 0.0;
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_1E972BC90)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E972BC90);
    }
  }
}

uint64_t BufferedAsyncSequence.init(publisher:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BufferedAsyncSequence.makeAsyncIterator()()
{
  type metadata accessor for BufferedAsyncSequence.Iterator();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = swift_retain();
  sub_1A75FA848(v1);
  return v0;
}

uint64_t type metadata accessor for BufferedAsyncSequence.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A75FA7F8(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1A75FA848(a1);
  return v2;
}

uint64_t sub_1A75FA838(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return swift_release();
}

void *sub_1A75FA848(uint64_t a1)
{
  type metadata accessor for UnfairLock();
  uint64_t v3 = swift_allocObject();
  v4 = (_DWORD *)swift_slowAlloc();
  *(void *)(v3 + 16) = v4;
  _DWORD *v4 = 0;
  v1[2] = v3;
  v1[4] = 0;
  sub_1A7604A60();
  v1[5] = sub_1A76048F0();
  swift_getFunctionTypeMetadata1();
  v1[6] = sub_1A7604870();
  v1[3] = a1;
  return v1;
}

uint64_t sub_1A75FA904(void (*a1)(unsigned char *), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(*v3 + 80);
  uint64_t v7 = sub_1A7604A60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  v10 = &v13[-v9];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(&v13[-v9], 1, 1, v6);
  char v14 = 0;
  v11 = *(os_unfair_lock_s **)(v3[2] + 16);
  os_unfair_lock_lock(v11);
  sub_1A75FAA74(v3, (uint64_t)v10, &v14, (uint64_t)a1, a2);
  os_unfair_lock_unlock(v11);
  if (v14 == 1) {
    a1(v10);
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1A75FAA74(void *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a2;
  v17 = a3;
  uint64_t v8 = *(void *)(*a1 + 80);
  uint64_t v9 = sub_1A7604A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  v12 = (char *)&v16 - v11;
  swift_beginAccess();
  uint64_t v20 = a1[5];
  sub_1A7604950();
  swift_getWitnessTable();
  if (sub_1A76049A0())
  {
    v13 = (void *)swift_allocObject();
    v13[2] = v8;
    v13[3] = a4;
    v13[4] = a5;
    v18 = sub_1A75FC680;
    v19 = v13;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_1A7604950();
    swift_retain();
    sub_1A7604910();
    uint64_t result = swift_endAccess();
    char v15 = 0;
  }
  else
  {
    swift_beginAccess();
    sub_1A7604920();
    swift_endAccess();
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(v16, v12, v9);
    char v15 = 1;
  }
  char *v17 = v15;
  return result;
}

uint64_t sub_1A75FACA4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x1F4188298](sub_1A75FACEC, 0, 0);
}

uint64_t sub_1A75FACEC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  uint64_t v2 = sub_1A7604A60();
  *uint64_t v1 = v0;
  v1[1] = sub_1A75FADD0;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  return MEMORY[0x1F41880D8](v3, 0, 0, 0x7461446863746566, 0xEB00000000292861, sub_1A75FC6A8, v4, v2);
}

uint64_t sub_1A75FADD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A75FAEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 80);
  sub_1A7604A60();
  uint64_t v4 = sub_1A7604980();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - v6, a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, v4);
  sub_1A75FA904((void (*)(unsigned char *))sub_1A75FC760, v9);
  return swift_release();
}

uint64_t sub_1A75FB038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1A7604A60();
  uint64_t v6 = sub_1A7604BB0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v8);
  v13 = (char *)&v17 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(a1, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, a3);
    sub_1A7604980();
    return sub_1A7604970();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v10, a1, v5);
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = sub_1A7604980();
    sub_1A75FB290((uint64_t)v10, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_1A75FB290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A7604BB0();
  MEMORY[0x1F4188790](v13);
  char v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_1A7604960();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_1A7604970();
  }
}

void sub_1A75FB4CC(uint64_t a1)
{
  uint64_t v13 = 0;
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v3);
  sub_1A75FB650(v1, a1, &v13);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = v13;
  if (v13)
  {
    sub_1A7604A60();
    FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
    uint64_t v6 = swift_bridgeObjectRetain();
    if (MEMORY[0x1AD0CD760](v6, FunctionTypeMetadata1))
    {
      uint64_t v7 = 0;
      uint64_t v8 = v4 + 40;
      while (1)
      {
        char v9 = sub_1A7604900();
        sub_1A76048E0();
        if ((v9 & 1) == 0) {
          break;
        }
        uint64_t v10 = *(void (**)(uint64_t))(v8 - 8);
        uint64_t v11 = v7 + 1;
        BOOL v12 = __OFADD__(v7, 1);
        swift_retain();
        if (v12) {
          goto LABEL_13;
        }
        v10(a1);
        swift_release();
        ++v7;
        v8 += 16;
        if (v11 == MEMORY[0x1AD0CD760](v4, FunctionTypeMetadata1)) {
          goto LABEL_10;
        }
      }
      sub_1A7604AE0();
      __break(1u);
LABEL_13:
      __break(1u);
    }
    else
    {
LABEL_10:
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1A75FB650(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1A7604A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)v11 - v8;
  swift_beginAccess();
  v11[7] = *(void *)(a1 + 48);
  swift_getFunctionTypeMetadata1();
  sub_1A7604950();
  swift_getWitnessTable();
  if (sub_1A76049A0())
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    swift_beginAccess();
    sub_1A7604950();
    sub_1A7604910();
  }
  else
  {
    swift_beginAccess();
    *a3 = *(void *)(a1 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_1A7604940();
  }
  return swift_endAccess();
}

uint64_t sub_1A75FB850(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  v2[5] = *v1;
  return MEMORY[0x1F4188298](sub_1A75FB898, 0, 0);
}

uint64_t sub_1A75FB898()
{
  uint64_t v1 = v0[4];
  if (!*(void *)(v1 + 32))
  {
    v0[2] = *(void *)(v1 + 24);
    uint64_t v2 = v0[5];
    uint64_t v3 = swift_allocObject();
    swift_weakInit();
    uint64_t v4 = swift_allocObject();
    uint64_t v5 = *(void *)(v2 + 80);
    *(void *)(v4 + 16) = v5;
    *(void *)(v4 + 24) = v3;
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    *(void *)(v7 + 24) = v6;
    sub_1A76047D0();
    swift_retain();
    swift_retain();
    swift_getWitnessTable();
    uint64_t v8 = sub_1A76047E0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(v1 + 32) = v8;
    swift_release();
  }
  char v9 = (void *)swift_task_alloc();
  v0[6] = v9;
  *char v9 = v0;
  v9[1] = sub_1A75FBAE0;
  uint64_t v10 = (void *)v0[4];
  v9[2] = v0[3];
  v9[3] = v10;
  v9[4] = *v10;
  return MEMORY[0x1F4188298](sub_1A75FACEC, 0, 0);
}

uint64_t sub_1A75FBAE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A75FBBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_1A7604A60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - v6;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v7, 1, 1, a3);
    sub_1A75FB4CC((uint64_t)v7);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_1A75FBD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1A7604A60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - v7;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, a3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, a3);
    sub_1A75FB4CC((uint64_t)v8);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t BufferedAsyncSequence.Iterator.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BufferedAsyncSequence.Iterator.__deallocating_deinit()
{
  BufferedAsyncSequence.Iterator.deinit();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1A75FBF1C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1A75FBFF4;
  v5[3] = a1;
  v5[4] = v4;
  v5[5] = *v4;
  return MEMORY[0x1F4188298](sub_1A75FB898, 0, 0);
}

uint64_t sub_1A75FBFF4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A75FC0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v11;
  uint64_t v12 = type metadata accessor for BufferedAsyncSequence.Iterator();
  void *v11 = v6;
  v11[1] = sub_1A75FC1CC;
  return MEMORY[0x1F4187C88](a1, a2, a3, v12, a6);
}

uint64_t sub_1A75FC1CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A75FC2C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = BufferedAsyncSequence.makeAsyncIterator()();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_1A75FC304()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A75FC33C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A75FC374(uint64_t a1)
{
  return sub_1A75FBBD4(a1, *(void *)(v1 + 24), *(void *)(v1 + 16));
}

uint64_t sub_1A75FC37C(uint64_t a1)
{
  return sub_1A75FBD14(a1, *(void *)(v1 + 24), *(void *)(v1 + 16));
}

uint64_t sub_1A75FC384()
{
  return MEMORY[0x1E4FBC278];
}

uint64_t sub_1A75FC390()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A75FC3AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for BufferedAsyncSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A75FC3D0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for BufferedAsyncSequence.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BufferedAsyncSequence.Iterator);
}

uint64_t dispatch thunk of BufferedAsyncSequence.Iterator.next()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 232) + **(int **)(*(void *)v1 + 232));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1A75FC554;
  return v6(a1);
}

uint64_t sub_1A75FC554()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A75FC648()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A75FC680()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_1A75FC6A8(uint64_t a1)
{
  return sub_1A75FAEC4(a1, v1);
}

uint64_t sub_1A75FC6B0()
{
  sub_1A7604A60();
  uint64_t v1 = sub_1A7604980();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1A75FC760(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_1A7604A60();
  uint64_t v4 = *(void *)(sub_1A7604980() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_1A75FB038(a1, v5, v3);
}

uint64_t XPCTarget.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = sub_1A7604A60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)v28 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)v28 - v16;
  MEMORY[0x1F4188790](v15);
  v19 = (id *)((char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, uint64_t, uint64_t))(v20 + 16))(v19, v3, a1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      id v22 = *v19;
      if (objc_msgSend(*v19, sel_remoteTarget))
      {
        sub_1A7604A90();
        swift_unknownObjectRelease();
        sub_1A75FCC94(v29, &v30);
      }
      else
      {
        long long v30 = 0u;
        long long v31 = 0u;
      }
      v28[1] = __swift_instantiateConcreteTypeFromMangledName(qword_1EB5ED4C0);
      int v25 = swift_dynamicCast();
      uint64_t v26 = *(void *)(v6 - 8);
      v28[0] = *(void *)(v26 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t))v28[0])(v17, v25 ^ 1u, 1, v6);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v17, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v14, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
        objc_msgSend(v22, sel_activate);
        if (objc_msgSend(v22, sel_remoteTarget))
        {
          sub_1A7604A90();

          swift_unknownObjectRelease();
          sub_1A75FCC94(v29, &v30);
        }
        else
        {

          long long v30 = 0u;
          long long v31 = 0u;
        }
        int v27 = swift_dynamicCast();
        ((void (*)(char *, void, uint64_t, uint64_t))v28[0])(v11, v27 ^ 1u, 1, v6);
        (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v17, v11, v7);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v17, v7);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a2, 1, 1, v6);
    }
  }
  else
  {
    uint64_t v23 = *(void *)(v6 - 8);
    (*(void (**)(uint64_t, id *, uint64_t))(v23 + 32))(a2, v19, v6);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(a2, 0, 1, v6);
  }
}

_OWORD *sub_1A75FCC94(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A75FCCA4(uint64_t a1)
{
  uint64_t v2 = sub_1A7604A60();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v8 - v3;
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v8 - v3, a1);
  uint64_t v6 = type metadata accessor for XPCTarget();
  return XPCTarget.wrappedValue.setter((uint64_t)v4, v6);
}

uint64_t XPCTarget.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (void **)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = sub_1A7604A60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v22, a2);
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v17(a1, v9);
    v17((uint64_t)v13, v9);
  }
  else
  {
    v21 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v21(v16, v13, v8);
    uint64_t v18 = v22;
    (*(void (**)(void **))(v4 + 32))(v6);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = *v6;
      objc_msgSend(v19, sel_invalidate);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
      (*(void (**)(void **, uint64_t))(v4 + 8))(v6, a2);
    }
    v21(v18, v16, v8);
  }
  return swift_storeEnumTagMultiPayload();
}

void (*XPCTarget.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = sub_1A7604A60();
  v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v5[5] = v9;
  XPCTarget.wrappedValue.getter(a2, (uint64_t)v9);
  return sub_1A75FD18C;
}

void sub_1A75FD18C(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    XPCTarget.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    XPCTarget.wrappedValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t XPCTarget.projectedValue.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (uint64_t *)((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v4 + 16))(v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v8 = *v6;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 8))(v6, a1);
    uint64_t v8 = 0;
  }
  *a2 = v8;
  return result;
}

uint64_t sub_1A75FD344@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t XPCTarget.Connection.isActive.getter()
{
  if (!*v0)
  {
    long long v4 = 0u;
    long long v5 = 0u;
LABEL_8:
    uint64_t v1 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(*v0, sel_remoteTarget))
  {
    sub_1A7604A90();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_1A75FD448((uint64_t)v3, (uint64_t)&v4);
  if (!*((void *)&v5 + 1)) {
    goto LABEL_8;
  }
  uint64_t v1 = 1;
LABEL_9:
  sub_1A75FD3E8((uint64_t)&v4);
  return v1;
}

uint64_t sub_1A75FD3E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB5ED4C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A75FD448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB5ED4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall XPCTarget.Connection.activate()()
{
  objc_msgSend(*v0, sel_activate);
}

Swift::Void __swiftcall XPCTarget.Connection.deactivate()()
{
  objc_msgSend(*v0, sel_invalidate);
}

uint64_t sub_1A75FD4D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for XPCTarget();
  return XPCTarget.wrappedValue.getter(v2, a1);
}

uint64_t sub_1A75FD510()
{
  return 8;
}

void *sub_1A75FD51C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1A75FD528()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_1A75FD5C0(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      uint64_t v14 = *(void **)a2;
      *(void *)__dst = *(void *)a2;
      __dst[v5] = 1;
      id v15 = v14;
    }
    else if (v9)
    {
      memcpy(__dst, a2, v5 + 1);
    }
    else
    {
      (*(void (**)(unsigned char *))(v4 + 16))(__dst);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

void sub_1A75FD750(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1)
  {
  }
  else if (!v3)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

unsigned char *sub_1A75FD858(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    unsigned int v10 = *(void **)a2;
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 1;
    id v11 = v10;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(__dst);
    __dst[v4] = 0;
  }
  return __dst;
}

id *sub_1A75FD9A8(id *__dst, id *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = *((unsigned __int8 *)__dst + v7);
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *(unsigned __int8 *)__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
    }
    else if (!v8)
    {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    unsigned int v13 = *((unsigned __int8 *)__src + v7);
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *(unsigned __int8 *)__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      id v18 = *__src;
      *__dst = *__src;
      *((unsigned char *)__dst + v7) = 1;
      id v19 = v18;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 16))(__dst, __src, v5);
      *((unsigned char *)__dst + v7) = 0;
    }
  }
  return __dst;
}

unsigned char *sub_1A75FDBDC(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 1;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(__dst);
    __dst[v4] = 0;
  }
  return __dst;
}

id *sub_1A75FDD28(id *__dst, id *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = *((unsigned __int8 *)__dst + v7);
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *(unsigned __int8 *)__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (*((unsigned __int8 *)__dst + 2) << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
    }
    else if (!v8)
    {
      (*(void (**)(id *, uint64_t))(v6 + 8))(__dst, v5);
    }
    unsigned int v13 = *((unsigned __int8 *)__src + v7);
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *(unsigned __int8 *)__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (*((unsigned __int8 *)__src + 2) << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *__dst = *__src;
      *((unsigned char *)__dst + v7) = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
      *((unsigned char *)__dst + v7) = 0;
    }
  }
  return __dst;
}

uint64_t sub_1A75FDF5C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 3) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 254;
}

void sub_1A75FE090(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1A75FE258);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_1A75FE280(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_1A75FE33C(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for XPCTarget()
{
  return __swift_instantiateGenericMetadata();
}

void **sub_1A75FE42C(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void sub_1A75FE45C(id *a1)
{
}

void **sub_1A75FE464(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_1A75FE4A8(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_1A75FE4DC(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1A75FE538(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for XPCTarget.Connection()
{
  return __swift_instantiateGenericMetadata();
}

BOOL static TaskRequest.WakeType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TaskRequest.WakeType.hash(into:)()
{
  return sub_1A7604B90();
}

uint64_t TaskRequest.WakeType.hashValue.getter()
{
  return sub_1A7604BA0();
}

BOOL sub_1A75FE630(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1A75FE648()
{
  return sub_1A7604BA0();
}

uint64_t sub_1A75FE690()
{
  return sub_1A7604B90();
}

uint64_t sub_1A75FE6BC()
{
  return sub_1A7604BA0();
}

uint64_t TaskRequest.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1A7604730();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t TaskRequest.wakeType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for TaskRequest();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for TaskRequest()
{
  uint64_t result = qword_1EB5ED180;
  if (!qword_1EB5ED180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TaskRequest.explanation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TaskRequest() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TaskRequest.init(date:wakeType:explanation:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = *a2;
  uint64_t v10 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t result = type metadata accessor for TaskRequest();
  *(unsigned char *)(a5 + *(int *)(result + 20)) = v9;
  int v12 = (void *)(a5 + *(int *)(result + 24));
  void *v12 = a3;
  v12[1] = a4;
  return result;
}

unint64_t sub_1A75FE8C4()
{
  unint64_t result = qword_1E972BF18;
  if (!qword_1E972BF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E972BF18);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TaskRequest(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1A7604730();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    char v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *char v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TaskRequest(uint64_t a1)
{
  uint64_t v2 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  char v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  char v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A7604730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  char v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A75FECD4);
}

uint64_t sub_1A75FECD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1A7604730();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A75FEDAC);
}

uint64_t sub_1A75FEDAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1A7604730();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1A75FEE6C()
{
  uint64_t result = sub_1A7604730();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TaskRequest.WakeType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TaskRequest.WakeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1A75FF078);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1A75FF0A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1A75FF0A8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TaskRequest.WakeType()
{
  return &type metadata for TaskRequest.WakeType;
}

uint64_t dispatch thunk of TaskScheduling.scheduleTask(request:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1A75FF0D8()
{
  uint64_t v0 = sub_1A76049F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A76049D0();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1A7604830();
  MEMORY[0x1F4188790](v5 - 8);
  sub_1A7602304(0, &qword_1EB5ED1E8);
  sub_1A7604820();
  v7[1] = MEMORY[0x1E4FBC860];
  sub_1A7602340(&qword_1EB5ED1E0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5ED1C8);
  sub_1A7602388((unint64_t *)&unk_1EB5ED1D0, &qword_1EB5ED1C8);
  sub_1A7604AA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v0);
  uint64_t result = sub_1A7604A10();
  qword_1EB5ED1A0 = result;
  return result;
}

void sub_1A75FF328()
{
  off_1E972BCA0 = (_UNKNOWN *)MEMORY[0x1E4FBC868];
}

uint64_t KeepAliveTransaction.__allocating_init(reason:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  KeepAliveTransaction.init(reason:)(a1, a2);
  return v4;
}

uint64_t KeepAliveTransaction.init(reason:)(uint64_t a1, unint64_t a2)
{
  int v3 = v2;
  uint64_t v34 = *v2;
  uint64_t v6 = sub_1A7604810();
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v33 = v6;
  MEMORY[0x1F4188790](v6);
  long long v30 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1A7604830();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1A7604760();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unsigned int v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  _OWORD v3[2] = 0;
  v3[4] = a1;
  v3[5] = a2;
  swift_bridgeObjectRetain();
  sub_1A7604750();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))((uint64_t)v3 + OBJC_IVAR____TtC17SessionFoundation20KeepAliveTransaction_logger, v13, v10);
  swift_bridgeObjectRetain_n();
  unsigned int v14 = sub_1A7604740();
  os_log_type_t v15 = sub_1A76049C0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v35 = a1;
  if (v16)
  {
    int v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t aBlock = v18;
    *(_DWORD *)int v17 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1A7600F4C(a1, a2, &aBlock);
    sub_1A7604A70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A75F9000, v14, v15, "Acquiring keep-alive with reason: %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0CDE20](v18, -1, -1);
    MEMORY[0x1AD0CDE20](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1A7602304(0, &qword_1EB5ED1F0);
  if (qword_1EB5ED190 != -1) {
    swift_once();
  }
  v3[3] = sub_1A7604A20();
  swift_getObjectType();
  id v19 = (void *)swift_allocObject();
  uint64_t v20 = v34;
  uint64_t v21 = v35;
  v19[2] = v3;
  v19[3] = v21;
  v19[4] = a2;
  v19[5] = v20;
  v41 = sub_1A75FFB24;
  v42 = v19;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  v39 = (uint64_t (*)(uint64_t))sub_1A75FFB30;
  v40 = &block_descriptor;
  id v22 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A7604820();
  uint64_t v23 = v30;
  sub_1A75FFB34();
  sub_1A7604A30();
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v33);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v31);
  swift_release();
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1A7604A50();
  swift_unknownObjectRelease();
  v24 = qword_1EB5ED1A0;
  int v25 = (void *)swift_allocObject();
  v25[2] = v3;
  v25[3] = v21;
  v25[4] = a2;
  v25[5] = v20;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_1A75FFF10;
  *(void *)(v26 + 24) = v25;
  v41 = sub_1A75FFF2C;
  v42 = (void *)v26;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v38 = 1107296256;
  v39 = sub_1A75FFF54;
  v40 = &block_descriptor_9;
  int v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v24, v27);
  _Block_release(v27);
  LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v27 & 1) == 0) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A75FF98C(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (*(void *)(result + 16))
  {
    uint64_t v5 = result;
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_1A7604740();
    os_log_type_t v7 = sub_1A76049C0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      sub_1A7600F4C(a2, a3, &v10);
      sub_1A7604A70();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A75F9000, v6, v7, "Dropping transaction for SIGTERM: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0CDE20](v9, -1, -1);
      MEMORY[0x1AD0CDE20](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    byte_1E972BF28 = 1;
    *(void *)(v5 + 16) = 0;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1A75FFB24()
{
  return sub_1A75FF98C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1A75FFB34()
{
  return sub_1A7604AA0();
}

void sub_1A75FFBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (byte_1E972BF28)
  {
    *(void *)(a1 + 16) = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1A76048A0();
    uint64_t v6 = os_transaction_create();
    swift_release();
    *(void *)(a1 + 16) = v6;
    swift_unknownObjectRelease();
    if (qword_1E972BCB8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    os_log_type_t v7 = off_1E972BCA0;
    if (*((void *)off_1E972BCA0 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_1A7601874(a2, a3);
      if (v9) {
        uint64_t v10 = *(void *)(v7[7] + 8 * v8);
      }
      else {
        uint64_t v10 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_endAccess();
    if (__OFADD__(v10, 1))
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v19 = off_1E972BCA0;
      off_1E972BCA0 = (_UNKNOWN *)0x8000000000000000;
      sub_1A7601EB0(v10 + 1, a2, a3, isUniquelyReferenced_nonNull_native);
      off_1E972BCA0 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v12 = sub_1A7604740();
      os_log_type_t v13 = sub_1A76049C0();
      if (os_log_type_enabled(v12, v13))
      {
        unsigned int v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        v20[0] = v15;
        *(_DWORD *)unsigned int v14 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_1A7604880();
        unint64_t v18 = v17;
        swift_bridgeObjectRelease();
        sub_1A7600F4C(v16, v18, v20);
        sub_1A7604A70();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A75F9000, v12, v13, "Keep-alive reasons: %{public}s", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AD0CDE20](v15, -1, -1);
        MEMORY[0x1AD0CDE20](v14, -1, -1);
      }
    }
  }
}

void sub_1A75FFF10()
{
  sub_1A75FFBFC(v0[2], v0[3], v0[4]);
}

uint64_t sub_1A75FFF1C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A75FFF2C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A75FFF54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1A75FFF7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  v0[2] = 0;
  swift_unknownObjectRelease();
  swift_getObjectType();
  sub_1A7604A40();
  swift_retain_n();
  int v3 = sub_1A7604740();
  os_log_type_t v4 = sub_1A76049C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = v1[4];
    unint64_t v8 = v1[5];
    swift_bridgeObjectRetain();
    sub_1A7600F4C(v7, v8, aBlock);
    sub_1A7604A70();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A75F9000, v3, v4, "Releasing keep-alive with reason: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AD0CDE20](v6, -1, -1);
    MEMORY[0x1AD0CDE20](v5, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  if (qword_1EB5ED190 != -1) {
    swift_once();
  }
  char v9 = qword_1EB5ED1A0;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A76015DC;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = (uint64_t)sub_1A76023D8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A75FFF54;
  aBlock[3] = (uint64_t)&block_descriptor_19;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
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

void sub_1A7600288(uint64_t a1)
{
  if (qword_1E972BCB8 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v2 = *(void *)(a1 + 40);
  swift_beginAccess();
  os_log_type_t v4 = off_1E972BCA0;
  if (*((void *)off_1E972BCA0 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1A7601874(v3, v2);
    if (v6) {
      uint64_t v7 = *(void *)(v4[7] + 8 * v5);
    }
    else {
      uint64_t v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_endAccess();
  uint64_t v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    if (v8 <= 0)
    {
      if (v7 != 1)
      {
        swift_retain_n();
        uint64_t v10 = sub_1A7604740();
        os_log_type_t v11 = sub_1A76049B0();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          uint64_t v13 = swift_slowAlloc();
          v22[0] = v13;
          *(_DWORD *)uint64_t v12 = 136446210;
          swift_bridgeObjectRetain();
          sub_1A7600F4C(v3, v2, v22);
          sub_1A7604A70();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1A75F9000, v10, v11, "Unbalanced acquire/release for keep-alive with reason: %{public}s", v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1AD0CDE20](v13, -1, -1);
          MEMORY[0x1AD0CDE20](v12, -1, -1);
        }
        else
        {
          swift_release_n();
        }
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_1A76018EC(v3, v2);
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_beginAccess();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v21 = off_1E972BCA0;
      off_1E972BCA0 = (_UNKNOWN *)0x8000000000000000;
      sub_1A7601EB0(v8, v3, v2, isUniquelyReferenced_nonNull_native);
      off_1E972BCA0 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    unsigned int v14 = sub_1A7604740();
    os_log_type_t v15 = sub_1A76049C0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1A7604880();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      sub_1A7600F4C(v18, v20, v22);
      sub_1A7604A70();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A75F9000, v14, v15, "Keep-alive reasons: %{public}s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0CDE20](v17, -1, -1);
      MEMORY[0x1AD0CDE20](v16, -1, -1);
    }
  }
}

uint64_t static KeepAliveTransaction.with<A>(reason:_:)(uint64_t a1, unint64_t a2, void (*a3)(uint64_t))
{
  type metadata accessor for KeepAliveTransaction();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v6 = KeepAliveTransaction.init(reason:)(a1, a2);
  a3(v6);
  sub_1A75FFF7C();
  return swift_release();
}

uint64_t static KeepAliveTransaction.asyncTask(reason:queue:delay:wrapping:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  uint64_t v41 = a3;
  v44 = (char *)a1;
  uint64_t v8 = sub_1A7604810();
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1A7604830();
  uint64_t v42 = *(void *)(v11 - 8);
  uint64_t v43 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1A7604800();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (uint64_t *)((char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_1A7604860();
  uint64_t v36 = *(void *)(v18 - 8);
  uint64_t v37 = v18;
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v36 - v22;
  type metadata accessor for KeepAliveTransaction();
  uint64_t v24 = swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = KeepAliveTransaction.init(reason:)((uint64_t)v44, a2);
  if (a6 <= 0.0)
  {
    uint64_t v33 = (void *)swift_allocObject();
    uint64_t v34 = v39;
    v33[2] = v38;
    v33[3] = v34;
    v33[4] = v24;
    v50 = sub_1A7601644;
    v51 = v33;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v47 = 1107296256;
    v48 = sub_1A75FFB30;
    v49 = &block_descriptor_25;
    uint64_t v35 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    sub_1A7604820();
    uint64_t v45 = MEMORY[0x1E4FBC860];
    sub_1A7602340(&qword_1EB5ED1A8, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5ED1B0);
    sub_1A7602388((unint64_t *)&unk_1EB5ED1B8, &qword_1EB5ED1B0);
    sub_1A7604AA0();
    MEMORY[0x1AD0CD830](0, v13, v10, v35);
    _Block_release(v35);
    swift_release();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v43);
    return swift_release();
  }
  v44 = v10;
  double v26 = a6 * 1000.0;
  if ((~COERCE__INT64(a6 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v26 < 9.22337204e18)
  {
    uint64_t v27 = (uint64_t)v26;
    sub_1A7604840();
    uint64_t *v17 = v27;
    (*(void (**)(uint64_t *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E4FBCAC8], v14);
    sub_1A7604850();
    (*(void (**)(uint64_t *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v36 = *(void *)(v36 + 8);
    ((void (*)(char *, uint64_t))v36)(v21, v37);
    v28 = (void *)swift_allocObject();
    uint64_t v29 = v39;
    void v28[2] = v38;
    v28[3] = v29;
    v28[4] = v24;
    v50 = sub_1A76016E8;
    v51 = v28;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v47 = 1107296256;
    v48 = sub_1A75FFB30;
    v49 = &block_descriptor_31;
    long long v30 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    uint64_t v31 = v13;
    sub_1A7604820();
    uint64_t v45 = MEMORY[0x1E4FBC860];
    sub_1A7602340(&qword_1EB5ED1A8, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5ED1B0);
    sub_1A7602388((unint64_t *)&unk_1EB5ED1B8, &qword_1EB5ED1B0);
    uint64_t v32 = (uint64_t)v44;
    sub_1A7604AA0();
    MEMORY[0x1AD0CD810](v23, v31, v32, v30);
    _Block_release(v30);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v32, v8);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v43);
    ((void (*)(char *, uint64_t))v36)(v23, v37);
    return swift_release();
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1A7600DD4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t KeepAliveTransaction.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SessionFoundation20KeepAliveTransaction_logger;
  uint64_t v2 = sub_1A7604760();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t KeepAliveTransaction.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SessionFoundation20KeepAliveTransaction_logger;
  uint64_t v2 = sub_1A7604760();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1A7600F4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A7601020(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A76022A8((uint64_t)v12, *a3);
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
      sub_1A76022A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1A7601020(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1A7604A80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1A76011DC(a5, a6);
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
  uint64_t v8 = sub_1A7604AF0();
  if (!v8)
  {
    sub_1A7604B00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1A7604B30();
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

uint64_t sub_1A76011DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A7601274(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A7601454(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1A7601454(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A7601274(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1A76013EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1A7604AD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1A7604B00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1A76048D0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1A7604B30();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A7604B00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1A76013EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E972BCE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A7601454(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E972BCE0);
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
  uint64_t result = sub_1A7604B30();
  __break(1u);
  return result;
}

uint64_t sub_1A76015A4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1A76015DC()
{
  sub_1A7600288(*(void *)(v0 + 16));
}

uint64_t sub_1A76015E4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t type metadata accessor for KeepAliveTransaction()
{
  uint64_t result = qword_1E972BCA8;
  if (!qword_1E972BCA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A7601644()
{
  return sub_1A7601700((uint64_t)sub_1A7601870);
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

uint64_t objectdestroy_21Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A76016E8()
{
  return sub_1A7601700((uint64_t)sub_1A76023EC);
}

uint64_t sub_1A7601700(uint64_t a1)
{
  unint64_t v3 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 32);
  swift_retain();
  v3(a1, v4);
  return swift_release();
}

uint64_t sub_1A7601768()
{
  return type metadata accessor for KeepAliveTransaction();
}

uint64_t sub_1A7601770()
{
  uint64_t result = sub_1A7604760();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for KeepAliveTransaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for KeepAliveTransaction);
}

uint64_t dispatch thunk of KeepAliveTransaction.__allocating_init(reason:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of KeepAliveTransaction.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

unint64_t sub_1A7601874(uint64_t a1, uint64_t a2)
{
  sub_1A7604B80();
  sub_1A76048B0();
  uint64_t v4 = sub_1A7604BA0();
  return sub_1A7602014(a1, a2, v4);
}

uint64_t sub_1A76018EC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1A7601874(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A76020F8();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1A7601CD8(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A76019CC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E972BCD8);
  char v37 = a2;
  uint64_t v6 = sub_1A7604B20();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1A7604B80();
    sub_1A76048B0();
    uint64_t result = sub_1A7604BA0();
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
  unint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_1A7601CD8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1A7604AB0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1A7604B80();
        swift_bridgeObjectRetain();
        sub_1A76048B0();
        uint64_t v9 = sub_1A7604BA0();
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
  uint64_t *v17 = v19 & v18;
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

uint64_t sub_1A7601EB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1A7601874(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1A76020F8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1A76019CC(result, a4 & 1);
  uint64_t result = sub_1A7601874(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_1A7604B60();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;
  return swift_bridgeObjectRetain();
}

unint64_t sub_1A7602014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A7604B50() & 1) == 0)
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
      while (!v14 && (sub_1A7604B50() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1A76020F8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E972BCD8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1A7604B10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    BOOL v22 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1A76022A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A7602304(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1A7602340(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A7602388(unint64_t *a1, uint64_t *a2)
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

uint64_t XPCInterfaceDomain.domain.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCInterfaceDomain.machName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

SessionFoundation::XPCInterfaceDomain __swiftcall XPCInterfaceDomain.init(domain:machName:)(Swift::String domain, Swift::String machName)
{
  *uint64_t v2 = domain;
  v2[1] = machName;
  result.machName = machName;
  result.domain = domain;
  return result;
}

void static XPCInterfaceDomain.activitykit.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x80000001A7605AA0;
  a1[2] = 0xD000000000000019;
  a1[3] = 0x80000001A7605AC0;
}

id BSServiceConnectionEndpoint.init<A>(definition:instance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v13, a4, a5);
  swift_bridgeObjectRelease();
  unint64_t v8 = (void *)sub_1A7604890();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  int64_t v9 = (void *)sub_1A7604890();
  swift_bridgeObjectRelease();
  if (a3)
  {
    uint64_t v10 = (void *)sub_1A7604890();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_endpointForMachName_service_instance_, v8, v9, v10);

  return v11;
}

Swift::Void __swiftcall BSServiceConnectionListenerConfiguring.setDomain(_:)(SessionFoundation::XPCInterfaceDomain a1)
{
  id v2 = (id)sub_1A7604890();
  objc_msgSend(v1, sel_setDomain_, v2);
}

id BSServiceConnection.init<A>(endpointedDefinedBy:instance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRelease();
  sub_1A76027A4();
  id v8 = BSServiceConnectionEndpoint.init<A>(definition:instance:)(a1, 0, 0, a4, a5);
  if (v8)
  {
    int64_t v9 = v8;
    id v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_connectionWithEndpoint_, v8);

    if (v10) {
  }
    }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB5ED1F8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1A7605510;
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    sub_1A7604AC0();
    swift_bridgeObjectRelease();
    unint64_t v16 = 0xD000000000000025;
    unint64_t v17 = 0x80000001A7605AE0;
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a5 + 24))(v15, a4, a5);
    swift_bridgeObjectRelease();
    sub_1A76048C0();
    swift_bridgeObjectRelease();
    unint64_t v12 = v16;
    unint64_t v13 = v17;
    *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v13;
    sub_1A7604B70();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

unint64_t sub_1A76027A4()
{
  unint64_t result = qword_1EB5ED628;
  if (!qword_1EB5ED628)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5ED628);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCInterfaceDomain(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for XPCInterfaceDomain()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for XPCInterfaceDomain(void *a1, void *a2)
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

void *assignWithCopy for XPCInterfaceDomain(void *a1, void *a2)
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

void *assignWithTake for XPCInterfaceDomain(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCInterfaceDomain(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCInterfaceDomain(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for XPCInterfaceDomain()
{
  return &type metadata for XPCInterfaceDomain;
}

uint64_t dispatch thunk of static XPCInterfaceDefinition.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static XPCInterfaceDefinition.serviceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

unint64_t static NotificationName.daemonStartup.getter()
{
  return 0xD000000000000023;
}

unint64_t static NotificationName.stuckClient.getter()
{
  return 0xD000000000000021;
}

ValueMetadata *type metadata accessor for NotificationName()
{
  return &type metadata for NotificationName;
}

uint64_t Publisher.catchAndConsume(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v11, v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a3);
  unint64_t v12 = (void *)(a4 + *(int *)(type metadata accessor for CatchAndConsume() + 36));
  void *v12 = a1;
  v12[1] = a2;
  return swift_retain();
}

uint64_t CatchAndConsume.init(upstream:errorHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t result = type metadata accessor for CatchAndConsume();
  uint64_t v9 = (void *)(a5 + *(int *)(result + 36));
  *uint64_t v9 = a2;
  v9[1] = a3;
  return result;
}

uint64_t type metadata accessor for CatchAndConsume()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t CatchAndConsume.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CatchAndConsume.errorHandler.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_retain();
  return v2;
}

uint64_t CatchAndConsume.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  uint64_t v23 = a1;
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v10 + 24);
  uint64_t v24 = *(void *)(v10 + 16);
  uint64_t v25 = v12;
  uint64_t v26 = v11;
  uint64_t v27 = v13;
  uint64_t v14 = type metadata accessor for CatchAndConsume.Inner();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  unint64_t v17 = (char *)&v22 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v23, a3);
  uint64_t v18 = (uint64_t *)(v4 + *(int *)(a2 + 36));
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  swift_retain();
  sub_1A7602E80((uint64_t)v9, v19, v20, a3, (uint64_t)v17);
  swift_getWitnessTable();
  sub_1A76047F0();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t type metadata accessor for CatchAndConsume.Inner()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A7602E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t v8 = (void *)(a5 + *(int *)(type metadata accessor for CatchAndConsume.Inner() + 52));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return sub_1A7604770();
}

void sub_1A7602F38(void *a1@<X8>)
{
  a1[3] = MEMORY[0x1E4FBB1A0];
  *a1 = 0x646E416863746143;
  a1[1] = 0xEF656D75736E6F43;
}

uint64_t sub_1A7602F6C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D68B0](a1, *(void *)(a2 + 24), *(void *)(a2 + 40));
}

uint64_t sub_1A7602F7C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D68B8](a1, *(void *)(a2 + 24), *(void *)(a2 + 40));
}

uint64_t sub_1A7602F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = sub_1A76047C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = &v16[-v10];
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v14 = &v16[-v13];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 32))(v14, v11, AssociatedTypeWitness);
    (*(void (**)(unsigned char *))(v3 + *(int *)(a2 + 52)))(v14);
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
  }
  v16[15] = 1;
  return sub_1A7604790();
}

uint64_t sub_1A76031F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 56);
  uint64_t v5 = sub_1A7604780();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1A7603260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return CatchAndConsume.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t sub_1A7603274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1A760327C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A7603318(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    void *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1A7603410(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_1A7603480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_1A7603500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A760358C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1A7603608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1A760368C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1A76037D8);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1A76037EC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x1A76039CCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_1A76039F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t sub_1A76039FC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1A7604780();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1A7603AD4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1A7604780();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  unsigned int v11 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (((v10 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v10) + *(void *)(*(void *)(v8 - 8) + 64) <= 0x18
      ? (BOOL v12 = v11 > 7)
      : (BOOL v12 = 1),
        v12))
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v13 = v8;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    uint64_t v14 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    int v15 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = ((unint64_t)v14 + v10 + 16) & ~v10;
    uint64_t v18 = ((unint64_t)v15 + v10 + 16) & ~v10;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    swift_retain();
    v19(v17, v18, v13);
  }
  return a1;
}

uint64_t sub_1A7603C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v5 = sub_1A7604780();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v9, v8);
}

uint64_t sub_1A7603D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = sub_1A7604780();
  uint64_t v11 = *(void *)(v10 - 8);
  BOOL v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = ((unint64_t)v7 + v13 + 16) & ~v13;
  uint64_t v15 = ((unint64_t)v8 + v13 + 16) & ~v13;
  swift_retain();
  v12(v14, v15, v10);
  return a1;
}

uint64_t sub_1A7603E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = sub_1A7604780();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_1A7603F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = sub_1A7604780();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(((unint64_t)v7 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_1A7603FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  swift_release();
  uint64_t v9 = sub_1A7604780();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_1A76040A0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_1A7604780();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v12 = v7;
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = v12;
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v13) {
    goto LABEL_28;
  }
  unint64_t v14 = ((v11 + ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v11) + *(void *)(*(void *)(v8 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v18 = ((a2 - v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v18 < 2)
    {
LABEL_28:
      if (v7 == v13)
      {
        uint64_t v22 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
        return v22(a1, v7, v5);
      }
      else
      {
        uint64_t v23 = (unint64_t *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
        if ((v12 & 0x80000000) != 0)
        {
          uint64_t v25 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v25(((unint64_t)v23 + v11 + 16) & ~v11);
        }
        else
        {
          unint64_t v24 = *v23;
          if (v24 >= 0xFFFFFFFF) {
            LODWORD(v24) = -1;
          }
          return (v24 + 1);
        }
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_28;
  }
LABEL_18:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v20 = v14;
    }
    else {
      int v20 = 4;
    }
    switch(v20)
    {
      case 2:
        int v21 = *a1;
        break;
      case 3:
        int v21 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v21 = *(_DWORD *)a1;
        break;
      default:
        int v21 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v21 = 0;
  }
  return v13 + (v21 | v19) + 1;
}

void sub_1A7604360(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v25 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(sub_1A7604780() - 8);
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  if (v9 <= *(_DWORD *)(v10 + 84)) {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  else {
    unsigned int v13 = v9;
  }
  if (v13 <= 0x7FFFFFFF) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  else {
    unsigned int v14 = v13;
  }
  size_t v15 = ((v12 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v12) + *(void *)(v10 + 64);
  if (a3 <= v14)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v14 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v14 < a2)
  {
    unsigned int v17 = ~v14 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_49;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_49:
      __break(1u);
      JUMPOUT(0x1A76046A8);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v9 == v14)
        {
          int v21 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
          v21(a1, a2, v9, v7);
        }
        else
        {
          uint64_t v22 = (void *)((unint64_t)&a1[v11 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((v13 & 0x80000000) != 0)
          {
            unint64_t v24 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
            v24(((unint64_t)v22 + v12 + 16) & ~v12, a2);
          }
          else
          {
            if ((a2 & 0x80000000) != 0)
            {
              uint64_t v23 = a2 ^ 0x80000000;
              v22[1] = 0;
            }
            else
            {
              uint64_t v23 = (a2 - 1);
            }
            *uint64_t v22 = v23;
          }
        }
      }
      return;
  }
}

uint64_t sub_1A76046D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A76046EC()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1A760470C()
{
  return 0x646E416863746143;
}

uint64_t sub_1A7604730()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A7604740()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A7604750()
{
  return MEMORY[0x1F4188690]();
}

uint64_t sub_1A7604760()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A7604770()
{
  return MEMORY[0x1F40D6600]();
}

uint64_t sub_1A7604780()
{
  return MEMORY[0x1F40D6608]();
}

uint64_t sub_1A7604790()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1A76047C0()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1A76047D0()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1A76047E0()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1A76047F0()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1A7604800()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1A7604810()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A7604820()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A7604830()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A7604840()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1A7604850()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1A7604860()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1A7604870()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A7604880()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1A7604890()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A76048A0()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A76048B0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A76048C0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A76048D0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A76048E0()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A76048F0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A7604900()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A7604910()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A7604920()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1A7604930()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A7604940()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1A7604950()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A7604960()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1A7604970()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1A7604980()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1A76049A0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A76049B0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A76049C0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A76049D0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A76049E0()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1A76049F0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A7604A00()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A7604A10()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A7604A20()
{
  return MEMORY[0x1F4187178]();
}

uint64_t sub_1A7604A30()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1A7604A40()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1A7604A50()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1A7604A60()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A7604A70()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A7604A80()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A7604A90()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A7604AA0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A7604AB0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A7604AC0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A7604AD0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A7604AE0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A7604AF0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A7604B00()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A7604B10()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A7604B20()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A7604B30()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A7604B50()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A7604B60()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A7604B70()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1A7604B80()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A7604B90()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A7604BA0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A7604BB0()
{
  return MEMORY[0x1F4185F68]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
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