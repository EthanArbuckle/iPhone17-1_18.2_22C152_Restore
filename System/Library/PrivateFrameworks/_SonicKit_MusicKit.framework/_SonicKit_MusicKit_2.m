uint64_t sub_2628EE674()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  __n128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_70_0();
  v2 = *(void **)(v1 + 80);
  sub_2628A57B8();
  v3 = (__n128 *)swift_allocObject();
  v4 = OUTLINED_FUNCTION_13_9(v3, (__n128)xmmword_26290F490);
  OUTLINED_FUNCTION_23_8(v4, v5, v6, v7, v8, v9, v10, v11, v14, v15);
  OUTLINED_FUNCTION_22_9();
  *(void *)(v1 + 40) = v2;
  sub_262903330();
  OUTLINED_FUNCTION_12_8(*v0);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_29_0();
  return v12();
}

uint64_t sub_2628EE754()
{
  OUTLINED_FUNCTION_70_0();
  swift_unknownObjectRelease();
  v2 = *(void **)(v1 + 104);
  sub_2628A57B8();
  v3 = (__n128 *)swift_allocObject();
  uint64_t v4 = OUTLINED_FUNCTION_13_9(v3, (__n128)xmmword_26290F490);
  OUTLINED_FUNCTION_23_8(v4, v5, v6, v7, v8, v9, v10, v11, v14, v15);
  OUTLINED_FUNCTION_22_9();
  *(void *)(v1 + 40) = v2;
  sub_262903330();
  OUTLINED_FUNCTION_12_8(*v0);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_29_0();
  return v12();
}

uint64_t SuzeDRMSession.__deallocating_deinit()
{
  SuzeDRMSession.deinit();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t SuzeDRMSession.add(asset:)()
{
  *(void *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_13_6();
  *(void *)(v1 + 32) = v2;
  return OUTLINED_FUNCTION_0_2((uint64_t)sub_2628EE89C);
}

uint64_t sub_2628EE89C()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_18_7();
  uint64_t v0 = (void *)*(unsigned int *)(MEMORY[0x263F8F5C8] + 4);
  swift_retain();
  uint64_t v1 = swift_task_alloc();
  OUTLINED_FUNCTION_21_8(v1);
  OUTLINED_FUNCTION_14_5();
  void *v0 = v2;
  v0[1] = sub_2628EE944;
  uint64_t v3 = OUTLINED_FUNCTION_10_8();
  return MEMORY[0x270FA1FA8](v3);
}

uint64_t sub_2628EE944()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_unknownObjectRelease();
  }
  swift_release();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628EEA40()
{
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t SuzeDRMSession.prepare(forRate:)(float a1)
{
  *(void *)(v2 + 24) = v1;
  *(float *)(v2 + 80) = a1;
  OUTLINED_FUNCTION_13_6();
  *(void *)(v2 + 32) = v3;
  return OUTLINED_FUNCTION_0_2((uint64_t)sub_2628EEA88);
}

uint64_t sub_2628EEA88()
{
  OUTLINED_FUNCTION_28_0();
  if (*(float *)(v0 + 80) == 0.0)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_2628EEDEC;
    return sub_2628EF308();
  }
  else
  {
    OUTLINED_FUNCTION_18_7();
    uint64_t v3 = (void *)*(unsigned int *)(MEMORY[0x263F8F5C8] + 4);
    swift_retain();
    uint64_t v4 = swift_task_alloc();
    OUTLINED_FUNCTION_21_8(v4);
    OUTLINED_FUNCTION_14_5();
    void *v3 = v5;
    v3[1] = sub_2628EEBA8;
    uint64_t v6 = OUTLINED_FUNCTION_10_8();
    return MEMORY[0x270FA1FA8](v6);
  }
}

uint64_t sub_2628EEBA8()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_unknownObjectRelease();
  }
  swift_release();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628EECA0()
{
  OUTLINED_FUNCTION_52_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2628EED2C;
  return sub_2628EEEC8();
}

uint64_t sub_2628EED2C()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v3();
}

uint64_t sub_2628EEDEC()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_2();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v3();
}

uint64_t sub_2628EEEAC()
{
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628EEEC8()
{
  v1[3] = v0;
  v1[4] = *v0;
  sub_262902170();
  v1[5] = sub_262902160();
  sub_2628F0E88((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  uint64_t v3 = sub_262902FE0();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_2628EEFB8, v3, v2);
}

uint64_t sub_2628EEFB8()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = v0[3];
  if (*(void *)(v1 + 56))
  {
    swift_release();
    OUTLINED_FUNCTION_36_0();
    return v2();
  }
  else
  {
    uint64_t v4 = v0[4];
    v0[8] = *(void *)(v1 + 48);
    swift_retain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[9] = v5;
    v0[10] = *(void *)(v4 + 80);
    sub_262845688();
    OUTLINED_FUNCTION_14_5();
    *uint64_t v5 = v6;
    v5[1] = sub_2628EF0C4;
    uint64_t v7 = OUTLINED_FUNCTION_10_8();
    return MEMORY[0x270FA1FA8](v7);
  }
}

uint64_t sub_2628EF0C4()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v5 = *(void *)(v2 + 56);
  uint64_t v6 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v7 = sub_2628EF2AC;
  }
  else {
    uint64_t v7 = sub_2628EF214;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_2628EF214()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 16);
  type metadata accessor for SuzeDRMSession.LeaseRefresher();
  *(void *)(v1 + 56) = sub_2628EF3D0(v2);
  swift_release();
  OUTLINED_FUNCTION_36_0();
  return v3();
}

uint64_t sub_2628EF2AC()
{
  OUTLINED_FUNCTION_52_0();
  swift_release();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628EF308()
{
  *(void *)(v1 + 16) = v0;
  sub_262902170();
  *(void *)(v1 + 24) = sub_262902160();
  sub_2628F0E88((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  uint64_t v3 = sub_262902FE0();
  return MEMORY[0x270FA2498](sub_2628A7D40, v3, v2);
}

uint64_t *sub_2628EF3D0(uint64_t a1)
{
  return sub_2628EF40C(a1);
}

uint64_t *sub_2628EF40C(uint64_t a1)
{
  uint64_t v2 = *v1;
  v1[2] = a1;
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  uint64_t v5 = *(void *)(v2 + 80);
  swift_unknownObjectRetain();
  v4(v5, v3);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_2628EF49C()
{
  (*(void (**)(void))(*(void *)(*(void *)v0 + 88) + 40))(*(void *)(*(void *)v0 + 80));
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_2628EF50C()
{
  uint64_t v0 = sub_2628EF49C();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2628EF53C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_26286F628;
  return SuzeDRMSession.add(asset:)();
}

uint64_t sub_2628EF5CC(float a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2628A5044;
  return SuzeDRMSession.prepare(forRate:)(a1);
}

uint64_t ICSuzeLeaseSession.start()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_0_2((uint64_t)sub_2628EF67C);
}

uint64_t sub_2628EF67C()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  void *v3 = v0;
  v3[1] = sub_2628EF760;
  uint64_t v4 = OUTLINED_FUNCTION_16_5();
  return MEMORY[0x270FA2360](v4);
}

uint64_t sub_2628EF760()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void sub_2628EF844(uint64_t a1, void *a2)
{
  sub_2628F0C00();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  aBlock[4] = sub_2628F0E20;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2628EFB0C;
  aBlock[3] = &block_descriptor_46;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_startLeaseSessionWithCompletionHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_2628EF9E8(char a1, int a2, id a3)
{
  if (a1)
  {
    sub_2628F0C00();
    return sub_262903000();
  }
  else
  {
    if (!a3)
    {
      char v7 = 1;
      sub_2628F0CE4();
      sub_2628F0E88(&qword_26A966F08, (void (*)(uint64_t))sub_2628F0CE4);
      swift_allocError();
      unint64_t v5 = sub_2628F0D40();
      MEMORY[0x263E552B0](&v7, 0xD00000000000001ALL, 0x800000026290BA40, MEMORY[0x263F8EE78], &type metadata for SuzeLeaseError, v5);
    }
    id v6 = a3;
    sub_2628F0C00();
    return sub_262902FF0();
  }
}

void sub_2628EFB0C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v7 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  swift_retain();
  id v9 = a3;
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

uint64_t ICSuzeLeaseSession.stop()()
{
  *(void *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_0_2((uint64_t)sub_2628EFBB8);
}

uint64_t sub_2628EFBB8()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  void *v3 = v0;
  v3[1] = sub_2628EFC98;
  uint64_t v4 = OUTLINED_FUNCTION_16_5();
  return MEMORY[0x270FA2360](v4);
}

uint64_t sub_2628EFC98()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628EFD7C()
{
  OUTLINED_FUNCTION_52_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

void sub_2628EFDD8(uint64_t a1, void *a2)
{
  sub_2628F0C00();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  aBlock[4] = sub_2628F0C6C;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2628F00A0;
  aBlock[3] = &block_descriptor_6;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_stopLeaseSessionWithCompletionHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_2628EFF7C(char a1, id a2)
{
  if (a1)
  {
    sub_2628F0C00();
    return sub_262903000();
  }
  else
  {
    if (!a2)
    {
      char v6 = 2;
      sub_2628F0CE4();
      sub_2628F0E88(&qword_26A966F08, (void (*)(uint64_t))sub_2628F0CE4);
      swift_allocError();
      unint64_t v4 = sub_2628F0D40();
      MEMORY[0x263E552B0](&v6, 0xD000000000000019, 0x800000026290B9E0, MEMORY[0x263F8EE78], &type metadata for SuzeLeaseError, v4);
    }
    id v5 = a2;
    sub_2628F0C00();
    return sub_262902FF0();
  }
}

void sub_2628F00A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_2628F011C(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithConfiguration_, a1);

  return v2;
}

uint64_t sub_2628F0164()
{
  OUTLINED_FUNCTION_52_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_7(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2628A5044;
  return ICSuzeLeaseSession.start()();
}

uint64_t sub_2628F01E8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2628A5044;
  return ICSuzeLeaseSession.stop()();
}

uint64_t sub_2628F0274()
{
  sub_2628F0ED0();
  swift_allocObject();
  uint64_t result = sub_2629026A0();
  qword_26A966D50 = result;
  return result;
}

uint64_t sub_2628F02B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 85, 7);
}

uint64_t *sub_2628F02FC()
{
  uint64_t v1 = 256;
  if (!*(unsigned char *)(v0 + 81)) {
    uint64_t v1 = 0;
  }
  uint64_t v2 = v1 | *(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = 0x10000;
  if (!*(unsigned char *)(v0 + 82)) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = 0x1000000;
  if (!*(unsigned char *)(v0 + 83)) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v2 | v3 | v4;
  uint64_t v6 = 0x100000000;
  if (!*(unsigned char *)(v0 + 84)) {
    uint64_t v6 = 0;
  }
  return sub_2628EDA4C(*(unsigned char *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), v5 | v6);
}

void sub_2628F0388()
{
  if (!qword_26A964360)
  {
    sub_262903060();
    unint64_t v0 = sub_262903180();
    if (!v1) {
      atomic_store(v0, &qword_26A964360);
    }
  }
}

uint64_t sub_2628F03E0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2628F0420()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = v0[6];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_6_7(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_26286F628;
  return sub_2628EE2AC(v2, v5, v6, v7, v3, v4);
}

uint64_t sub_2628F04E0(uint64_t a1)
{
  sub_2628F0388();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2628F053C(uint64_t a1)
{
  sub_2628EF844(a1, *(void **)(v1 + 16));
}

void sub_2628F0544(uint64_t a1)
{
  sub_2628EFDD8(a1, *(void **)(v1 + 16));
}

unint64_t sub_2628F0550()
{
  unint64_t result = qword_26A966DA0;
  if (!qword_26A966DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A966DA0);
  }
  return result;
}

unint64_t sub_2628F05A0()
{
  unint64_t result = qword_26A966DA8;
  if (!qword_26A966DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A966DA8);
  }
  return result;
}

uint64_t dispatch thunk of SuzeLeaseImpl.init(configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SuzeLeaseImpl.start()()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_7(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_2628A5044;
  uint64_t v3 = OUTLINED_FUNCTION_19_9();
  return v4(v3);
}

uint64_t dispatch thunk of SuzeLeaseImpl.stop()()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_7(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_26286F628;
  uint64_t v3 = OUTLINED_FUNCTION_19_9();
  return v4(v3);
}

uint64_t dispatch thunk of SuzeLeaseImpl.beginAutomaticallyRefreshingLease()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SuzeLeaseImpl.endAutomaticallyRefreshingLease()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unsigned char *storeEnumTagSinglePayload for SuzeLeaseError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2628F08ACLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SuzeLeaseError()
{
  return &type metadata for SuzeLeaseError;
}

uint64_t sub_2628F08E4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SuzeDRMSession()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for SuzeDRMSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SuzeDRMSession);
}

uint64_t sub_2628F0970()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SuzeDRMSession.LeaseRefresher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2628F09CC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_2628F0A1C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 48);
  uint64_t v6 = *(void *)(v1 + 56);
  uint64_t v7 = *(void *)(v1 + 64);
  uint64_t v8 = 256;
  if (!*(unsigned char *)(v1 + 73)) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | *(unsigned __int8 *)(v1 + 72);
  uint64_t v10 = 0x10000;
  if (!*(unsigned char *)(v1 + 74)) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 0x1000000;
  if (!*(unsigned char *)(v1 + 75)) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v9 | v10 | v11;
  uint64_t v13 = 0x100000000;
  if (!*(unsigned char *)(v1 + 76)) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v12 | v13;
  char v15 = *(unsigned char *)(v1 + 80);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v16;
  *uint64_t v16 = v2;
  v16[1] = sub_2628A5044;
  return sub_2628EDD48(a1, v3, v4, v5, v6, v7, v14, v15);
}

id sub_2628F0B74(void *a1, void *a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  id v7 = objc_msgSend(v3, sel_initWithRequestContext_leaseID_mediaType_, a1, sub_262903600(), a3);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  return v7;
}

void sub_2628F0C00()
{
  if (!qword_26A966EF0)
  {
    sub_262845688();
    unint64_t v0 = sub_262903010();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A966EF0);
    }
  }
}

uint64_t sub_2628F0C6C(char a1, void *a2)
{
  sub_2628F0C00();
  OUTLINED_FUNCTION_5_5(v4);
  return sub_2628EFF7C(a1, a2);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_2628F0CE4()
{
  if (!qword_26A966EF8)
  {
    sub_2628F0D40();
    unint64_t v0 = sub_2629021F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A966EF8);
    }
  }
}

unint64_t sub_2628F0D40()
{
  unint64_t result = qword_26A966F00;
  if (!qword_26A966F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A966F00);
  }
  return result;
}

uint64_t objectdestroy_39Tm()
{
  sub_2628F0C00();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2628F0E20(char a1, int a2, void *a3)
{
  sub_2628F0C00();
  OUTLINED_FUNCTION_5_5(v6);
  return sub_2628EF9E8(a1, a2, a3);
}

uint64_t sub_2628F0E88(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2628F0ED0()
{
  if (!qword_26A966F10[0])
  {
    unint64_t v0 = sub_2629026B0();
    if (!v1) {
      atomic_store(v0, qword_26A966F10);
    }
  }
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_8@<X0>(uint64_t a1@<X8>)
{
  v3[7] = v2;
  v3[4] = a1;
  v3[5] = v1;
  return sub_262903680();
}

uint64_t OUTLINED_FUNCTION_13_9(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2629032A0();
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return v0;
}

void OUTLINED_FUNCTION_18_7()
{
  *(void *)(v0 + 40) = *(void *)(*(void *)(v0 + 24) + 48);
}

uint64_t OUTLINED_FUNCTION_19_9()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_21_8(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return sub_262845688();
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  return sub_262902D70();
}

void OUTLINED_FUNCTION_23_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v10 + 16) = a9;
  *(void *)(v10 + 24) = a10;
}

uint64_t sub_2628F1038()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_2628F10E0(char *a1, char **a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *(void *)a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 48) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    a1 = &v9[(v6 & 0xF8 ^ 0x1F8) & (v6 + 16)];
    swift_retain();
  }
  else
  {
    uint64_t v12 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v12;
    uint64_t v13 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v13;
    *((void *)a1 + 5) = a2[5];
    uint64_t v14 = (unint64_t)&a1[v6 + 48] & ~v6;
    uint64_t v15 = ((unint64_t)a2 + v6 + 48) & ~v6;
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v17 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
    *(void *)((v7 + v14) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v15) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2628F124C(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))(((unint64_t)a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void *sub_2628F12FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  uint64_t v11 = v9 + 16;
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = ((unint64_t)a1 + v12 + 48) & ~v12;
  uint64_t v14 = (v12 + 48 + a2) & ~v12;
  id v15 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v13, v14, v8);
  *(void *)((*(void *)(v11 + 48) + 7 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v11 + 48)
                                                                                       + 7
                                                                                       + v14) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2628F13E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 48 + a1) & ~v11;
  uint64_t v13 = (v11 + 48 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  *(void *)((*(void *)(v10 + 40) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v10 + 40)
                                                                                       + 7
                                                                                       + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_2628F1504(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 48) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 48) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v8, v9);
  *(void *)((*(void *)(v6 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v6 + 32) + 7 + v9) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2628F15AC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 48 + a1) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 48) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v12, v13);
  *(void *)((*(void *)(v10 + 24) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v10 + 24)
                                                                                       + 7
                                                                                       + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2628F1694(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(v4 - 8) + 64) + ((v7 + 48) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v8;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2628F17DCLL);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v8 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v6 & 0x80000000) != 0) {
    return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 48) & ~v7, v6, v4);
  }
  uint64_t v18 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

void sub_2628F17F0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((*(void *)(*(void *)(v6 - 8) + 64) + ((v10 + 48) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v9 >= a3)
  {
    int v15 = 0;
  }
  else
  {
    unsigned int v12 = a3 - v9;
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 48) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 48) & ~v10) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v9;
    }
    else {
      int v16 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v6 - 8) + 64) + ((v10 + 48) & ~v10) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x2628F19DCLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v10 + 48] & ~v10;
          __swift_storeEnumTagSinglePayload(v19, a2, v8, v6);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v18 = a2 ^ 0x80000000;
            *((void *)a1 + 5) = 0;
            *(_OWORD *)(a1 + 24) = 0u;
            *(_OWORD *)(a1 + 8) = 0u;
          }
          else
          {
            uint64_t v18 = (a2 - 1);
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for MediaAPIResourceRequest()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_2628F1A1C(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2628F1AE8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t type metadata accessor for MediaAPIResourceRequest.Option()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2628F1B2C(uint64_t a1, uint64_t a2)
{
  sub_262829230(0, (unint64_t *)&qword_26A963F58);
  uint64_t v4 = OUTLINED_FUNCTION_103_0();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_2628F1B98(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_2628F1BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  sub_262902170();
  v6[8] = sub_262902160();
  sub_2628FEE4C((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  uint64_t v8 = sub_262902FE0();
  v6[9] = v8;
  v6[10] = v7;
  return MEMORY[0x270FA2498](sub_2628F1C88, v8, v7);
}

uint64_t sub_2628F1C88()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 88) = v4;
  long long v5 = *(_OWORD *)(v0 + 32);
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = v2;
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  *unsigned int v6 = v0;
  v6[1] = sub_2628F1D7C;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270F76430](v7, &unk_26A9670B0, v4, v8);
}

uint64_t sub_2628F1D7C()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *unsigned int v6 = v5;
  v3[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    unsigned int v9 = sub_2628F1EBC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    unsigned int v9 = sub_2628F1E64;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_2628F1E64()
{
  OUTLINED_FUNCTION_52_0();
  swift_release();
  OUTLINED_FUNCTION_36_0();
  return v0();
}

uint64_t sub_2628F1EBC()
{
  OUTLINED_FUNCTION_52_0();
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628F1F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_2628F1F4C, 0, 0);
}

uint64_t sub_2628F1F4C()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  void *v3 = v0;
  v3[1] = sub_2628F2034;
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270F76470](v6, v4, v5, &unk_26A9670C0, v2, v7);
}

uint64_t sub_2628F2034()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_7_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_29_0();
    return v10();
  }
}

uint64_t sub_2628F2134()
{
  OUTLINED_FUNCTION_52_0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2628F2194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return MEMORY[0x270FA2498](sub_2628F21BC, 0, 0);
}

uint64_t sub_2628F21BC()
{
  OUTLINED_FUNCTION_70_0();
  if (qword_26A963370 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  *(void *)(v0 + 16) = v2;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2628F2324;
  uint64_t v5 = *(void *)(v0 + 24);
  return MEMORY[0x270FA23C8](v5, v0 + 16, &unk_26A9670D0, v3, 0, 0, 0xD00000000000002DLL, 0x80000002629087B0);
}

uint64_t sub_2628F2324()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_7_2();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    return v10();
  }
}

uint64_t sub_2628F244C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2628F2464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  v5[14] = a2;
  v5[15] = a3;
  v5[13] = a1;
  return MEMORY[0x270FA2498](sub_2628F248C, 0, 0);
}

uint64_t sub_2628F248C()
{
  OUTLINED_FUNCTION_52_0();
  uint64_t v1 = v0[16];
  uint64_t v2 = sub_262902280();
  uint64_t v3 = MEMORY[0x263F78580];
  v0[11] = v2;
  v0[12] = v3;
  v0[8] = v1;
  sub_262902170();
  swift_retain();
  v0[18] = sub_262902160();
  sub_2628FEE4C((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  uint64_t v5 = sub_262902FE0();
  return MEMORY[0x270FA2498](sub_2628F2570, v5, v4);
}

uint64_t sub_2628F2570()
{
  OUTLINED_FUNCTION_52_0();
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  *(void *)(v0 + 152) = *(void *)(v1 + 32);
  swift_retain();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_2628F25E0()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(int **)(v0 + 112);
  sub_262891548((long long *)(v0 + 64), v0 + 16);
  *(void *)(v0 + 56) = v1;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v3;
  void *v3 = v0;
  v3[1] = sub_2628F26D8;
  uint64_t v4 = *(void *)(v0 + 104);
  return v6(v4, v0 + 16);
}

uint64_t sub_2628F26D8()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0();
  void *v3 = v2;
  uint64_t v4 = v2 + 16;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v7 + 168) = v0;
  swift_task_dealloc();
  sub_262891560(v4);
  if (v0)
  {
    OUTLINED_FUNCTION_7_2();
    return MEMORY[0x270FA2498](v8, v9, v10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    return v11();
  }
}

uint64_t sub_2628F27DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

BOOL sub_2628F27E8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_2628F2814(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_2628F2824(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_2628F2834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int16 v7 = *(_WORD *)(a3 + 48);
  char v8 = *(unsigned char *)(a3 + 50);
  long long v9 = *(_OWORD *)(a3 + 16);
  v16[0] = *(_OWORD *)a3;
  v16[1] = v9;
  v16[2] = *(_OWORD *)(a3 + 32);
  char v18 = v8;
  __int16 v17 = v7;
  uint64_t result = sub_2628F30B8((uint64_t)v16, (uint64_t)v19);
  unint64_t v11 = v20;
  int v12 = v22 | (v23 << 16);
  if (v20 >> 2 != 0xFFFFFFFF || v22 & 0xFE | (v23 << 16) & 0xFE00FE)
  {
    uint64_t v13 = v21;
    long long v14 = v19[0];
    long long v15 = v19[1];
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    a1 = 0;
    a2 = 0;
    unint64_t v11 = 0;
    uint64_t v13 = 0;
    int v12 = 0;
    long long v14 = 0uLL;
    long long v15 = 0uLL;
  }
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(_OWORD *)(a4 + 16) = v14;
  *(_OWORD *)(a4 + 32) = v15;
  *(void *)(a4 + 48) = v11;
  *(void *)(a4 + 56) = v13;
  *(_WORD *)(a4 + 64) = v12;
  *(unsigned char *)(a4 + 66) = BYTE2(v12);
  return result;
}

uint64_t sub_2628F2904@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_2629000B0(0, &qword_26A9670E8, (uint64_t (*)(void))sub_262900064, (uint64_t)&type metadata for MediAPIResourceRequestError, MEMORY[0x263F78548]);
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = *a1;
  long long v9 = (void *)a1[2];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(v8 + 16);
  if (!v10) {
    goto LABEL_23;
  }
  id v57 = v6;
  v58 = (char *)&v52 - v7;
  v56 = a2;
  unint64_t v11 = (void *)a1[1];
  uint64_t v59 = v8;
  uint64_t v12 = v8 + 96;
  while (1)
  {
    uint64_t v14 = *(void *)(v12 - 24);
    uint64_t v13 = *(void *)(v12 - 16);
    uint64_t v15 = *(void *)(v12 - 8);
    BOOL v16 = *(void **)(v12 - 64) == v11 && v9 == *(void **)(v12 - 56);
    if (v16 || (OUTLINED_FUNCTION_63_6() & 1) != 0) {
      break;
    }
    v12 += 72;
    if (!--v10) {
      goto LABEL_23;
    }
  }
  uint64_t v17 = OUTLINED_FUNCTION_112_3();
  sub_2628D3CB0(v17, v18, v19);
  if (!v15 || (swift_bridgeObjectRetain(), uint64_t v20 = OUTLINED_FUNCTION_112_3(), sub_2628D3D00(v20, v21, v22), !v13))
  {
LABEL_23:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_262900064();
    sub_2629021C0();
    sub_2629021B0();
    char v61 = 1;
    sub_262902180();
    OUTLINED_FUNCTION_111_0();
LABEL_24:
    sub_2629021B0();
    sub_2629000B0(0, &qword_26A9670F8, (uint64_t (*)(void))sub_262900064, (uint64_t)&type metadata for MediAPIResourceRequestError, MEMORY[0x263F78550]);
    sub_2628FEDE8(qword_26A967100, &qword_26A9670F8, (uint64_t (*)(void))sub_262900064, (uint64_t)&type metadata for MediAPIResourceRequestError);
    swift_allocError();
    OUTLINED_FUNCTION_73_5();
    sub_2629021D0();
    return swift_willThrow();
  }
  uint64_t v23 = *(void *)(v59 + 16);
  if (!v23) {
    goto LABEL_36;
  }
  uint64_t v54 = v2;
  uint64_t v55 = v13;
  uint64_t v24 = v59 + 96;
  while (1)
  {
    uint64_t v25 = *(void *)(v24 - 8);
    BOOL v26 = *(void **)(v24 - 64) == v11 && v9 == *(void **)(v24 - 56);
    if (v26 || (OUTLINED_FUNCTION_63_6() & 1) != 0) {
      break;
    }
    v24 += 72;
    if (!--v23) {
      goto LABEL_36;
    }
  }
  uint64_t v28 = OUTLINED_FUNCTION_275();
  sub_2628D3CB0(v28, v29, v25);
  if (!v25
    || (swift_bridgeObjectRetain(),
        uint64_t v30 = OUTLINED_FUNCTION_275(),
        sub_2628D3D00(v30, v31, v25),
        uint64_t v32 = sub_26282DDFC(0x746C7561666564, 0xE700000000000000, v25),
        uint64_t v34 = v33,
        swift_bridgeObjectRelease(),
        uint64_t v35 = v55,
        !v34))
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_262900064();
    sub_2629021C0();
    sub_2629021B0();
    char v60 = 2;
    sub_262902180();
    OUTLINED_FUNCTION_111_0();
    goto LABEL_24;
  }
  uint64_t v36 = *(void *)(v59 + 16);
  if (!v36) {
    goto LABEL_38;
  }
  v37 = (void **)(v59 + 56);
  while (1)
  {
    v38 = *v37;
    BOOL v39 = *(v37 - 3) == v11 && v9 == *(v37 - 2);
    if (v39 || (OUTLINED_FUNCTION_63_6() & 1) != 0) {
      break;
    }
    v37 += 9;
    if (!--v36) {
      goto LABEL_38;
    }
  }
  id v40 = v38;
  if (!v38) {
LABEL_38:
  }
    id v40 = objc_msgSend(self, sel_activeAccount);
  uint64_t v41 = *(void *)(v59 + 16);
  uint64_t v52 = v34;
  uint64_t v53 = v32;
  id v57 = v40;
  if (!v41)
  {
LABEL_50:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v56;
LABEL_51:
    uint64_t result = sub_262902BD0();
    uint64_t v49 = result;
    goto LABEL_52;
  }
  v42 = (char **)(v59 + 96);
  while (1)
  {
    v43 = *(v42 - 8);
    v44 = *(v42 - 7);
    uint64_t v46 = (uint64_t)*(v42 - 3);
    uint64_t v45 = (uint64_t)*(v42 - 2);
    uint64_t v47 = (uint64_t)*(v42 - 1);
    v58 = *v42;
    BOOL v48 = v43 == v11 && v9 == v44;
    if (v48 || (OUTLINED_FUNCTION_63_6() & 1) != 0) {
      break;
    }
    v42 += 9;
    if (!--v41) {
      goto LABEL_50;
    }
  }
  uint64_t v49 = v47;
  sub_2628D3CB0(v46, v45, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v50 = v56;
  if (!v47) {
    goto LABEL_51;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2628D3D00(v46, v45, v47);
LABEL_52:
  void *v50 = v57;
  v50[1] = v14;
  v50[2] = v35;
  v50[3] = v49;
  uint64_t v51 = v52;
  v50[4] = v53;
  v50[5] = v51;
  return result;
}

uint64_t sub_2628F2E3C@<X0>(long long *a1@<X0>, _OWORD *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X8>)
{
  long long v18 = a1[1];
  long long v19 = *a1;
  long long v17 = a1[2];
  uint64_t v15 = *((void *)a1 + 7);
  uint64_t v16 = *((void *)a1 + 6);
  __int16 v20 = *((_WORD *)a1 + 32);
  char v7 = *((unsigned char *)a1 + 66);
  type metadata accessor for MediaAPIResourceRequest.Identifier();
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getTupleTypeMetadata2();
  sub_2629035E0();
  swift_initStackObject();
  uint64_t v8 = sub_262902F20();
  uint64_t v10 = v9;
  *(_OWORD *)uint64_t v9 = v19;
  *(_OWORD *)(v9 + 16) = v18;
  *(_OWORD *)(v9 + 32) = v17;
  *(void *)(v9 + 48) = v16;
  *(void *)(v9 + 56) = v15;
  *(unsigned char *)(v9 + 66) = v7;
  *(_WORD *)(v9 + 64) = v20;
  sub_262902FD0();
  swift_getWitnessTable();
  *(void *)(v10 + 72) = sub_262903100();
  sub_26281DC1C(v8);
  swift_getWitnessTable();
  uint64_t v11 = sub_262902BD0();
  OUTLINED_FUNCTION_93_5();
  uint64_t v12 = type metadata accessor for MediaAPIResourceRequest();
  *(void *)&a5[*(int *)(v12 + 40)] = v11;
  long long v13 = a2[1];
  *(_OWORD *)a5 = *a2;
  *((_OWORD *)a5 + 1) = v13;
  *((_OWORD *)a5 + 2) = a2[2];
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(&a5[*(int *)(v12 + 36)], a3, a4);
}

unint64_t sub_2628F307C(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

unint64_t sub_2628F308C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_2628F307C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_2628F30B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned int v10 = *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16);
  switch(*(unsigned __int8 *)(a1 + 50) >> 5)
  {
    case 1:
    case 3:
    case 4:
      uint64_t result = sub_262843C78(result, v5, v6, v7, v8, v9, v10);
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = xmmword_2629180F0;
      *(unsigned char *)(a2 + 50) = 0;
      goto LABEL_6;
    case 2:
      *(void *)a2 = result;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = v6;
      *(void *)(a2 + 24) = v7;
      *(void *)(a2 + 32) = v8;
      *(void *)(a2 + 40) = v9;
      *(_WORD *)(a2 + 48) = v10 & 0xFF01;
      *(unsigned char *)(a2 + 50) = (v10 & 0xFF01FF01 | 0x400000) >> 16;
      break;
    case 5:
      *(void *)a2 = result;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = v6;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      *(unsigned char *)(a2 + 50) = 0x80;
LABEL_6:
      *(_WORD *)(a2 + 48) = 0;
      break;
    default:
      *(void *)a2 = result;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = v6;
      *(void *)(a2 + 24) = v7;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      *(_DWORD *)(a2 + 47) = 0;
      break;
  }
  return result;
}

uint64_t sub_2628F31AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  if (*((unsigned __int8 *)v1 + 50) >> 6)
  {
    if (*((unsigned __int8 *)v1 + 50) >> 6 == 1)
    {
      uint64_t v5 = v1[3];
      char v6 = *((unsigned char *)v1 + 32) | 0x40;
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      *(unsigned char *)(a1 + 32) = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 24) = 0;
      *(unsigned char *)(a1 + 32) = -96;
    }
  }
  else
  {
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v2;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = 0;
    *(unsigned char *)(a1 + 32) = 0;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_2628F323C@<X0>(unsigned char *a1@<X8>)
{
  sub_2628F31AC((uint64_t)v4);
  unint64_t v2 = 0x50403020001uLL >> ((v5 >> 2) & 0x38);
  uint64_t result = sub_26280B7A4(v4[0], v4[1], v4[2], v4[3], v5);
  *a1 = v2;
  return result;
}

void sub_2628F32BC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  unsigned __int16 v5 = *(unsigned __int8 *)(v1 + 50);
  if (v5 >> 6)
  {
    if (v5 >> 6 == 1)
    {
      __int16 v6 = *(_WORD *)(v1 + 48);
      sub_2629036A0();
      swift_bridgeObjectRetain();
      uint64_t v7 = OUTLINED_FUNCTION_56_6();
      sub_2628FE8A4(v7, v8, v9, v10, v11, v12, v13);
      OUTLINED_FUNCTION_89_6();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_262902D40();
      swift_bridgeObjectRelease();
      sub_26282B86C();
      uint64_t v14 = OUTLINED_FUNCTION_56_6();
      sub_2628D2B98(v14, v15, v16, v17, v18, v19, v20);
      sub_2629036B0();
      if ((v6 & 1) == 0) {
        sub_2629036A0();
      }
      sub_2629036B0();
      if (HIBYTE(v6) != 10) {
        sub_2629036A0();
      }
      sub_2629036B0();
      OUTLINED_FUNCTION_24_2();
      return;
    }
    sub_2629036A0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_89_6();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_262843A2C(a1, v3);
  }
  else
  {
    sub_2629036A0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_89_6();
    sub_26282BA88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_262843A2C(a1, v4);
  }
  OUTLINED_FUNCTION_24_2();
  swift_bridgeObjectRelease();
}

uint64_t sub_2628F3480(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned int v8 = *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16);
  uint64_t v10 = *(void *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v11 = *(void **)(a2 + 16);
  unsigned int v12 = *(unsigned __int16 *)(a2 + 48) | (*(unsigned __int8 *)(a2 + 50) << 16);
  uint64_t v14 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v152 = (uint64_t)v4;
  uint64_t v154 = *(void *)a1;
  if (!(*(unsigned __int8 *)(a1 + 50) >> 6))
  {
    if ((v12 & 0xFFFFFF) >= 0x400000) {
      goto LABEL_22;
    }
    v140 = *(void **)(a2 + 24);
    uint64_t v142 = *(void *)(a1 + 32);
    v129 = *(void **)(a1 + 24);
    BOOL v30 = v2 == v10 && v3 == v9;
    uint64_t v135 = *(void *)(a2 + 40);
    uint64_t v148 = *(void *)(a2 + 32);
    uint64_t v120 = *(void *)a2;
    uint64_t v121 = *(void *)(a2 + 8);
    if (!v30)
    {
      uint64_t v31 = *(void *)a2;
      uint64_t v32 = *(void *)(a2 + 8);
      uint64_t v33 = *(void *)(a2 + 32);
      uint64_t v34 = *(void *)(a2 + 40);
      uint64_t v35 = *(void *)a1;
      char v36 = sub_262903620();
      uint64_t v10 = v31;
      uint64_t v2 = v35;
      uint64_t v9 = v32;
      uint64_t v14 = v33;
      uint64_t v13 = v34;
      if ((v36 & 1) == 0)
      {
        sub_2628FE8A4(v31, v32, (uint64_t)v11, (uint64_t)v140, v33, v34, v12);
        OUTLINED_FUNCTION_69_5(v35, v3, v152, (uint64_t)v129, v142);
        sub_2628D2B98(v35, v3, v152, (uint64_t)v129, v142, v6, v8);
        uint64_t v93 = v120;
        uint64_t v94 = v121;
        uint64_t v95 = (uint64_t)v11;
        uint64_t v96 = (uint64_t)v140;
        uint64_t v97 = v148;
        uint64_t v98 = v135;
        goto LABEL_23;
      }
    }
    uint64_t v37 = v2;
    sub_2628FE8A4(v10, v9, (uint64_t)v11, (uint64_t)v140, v14, v13, v12);
    uint64_t v38 = v152;
    BOOL v39 = v129;
    OUTLINED_FUNCTION_69_5(v37, v3, v152, (uint64_t)v129, v142);
    OUTLINED_FUNCTION_69_5(v37, v3, v152, (uint64_t)v129, v142);
    sub_2628FE8A4(v120, v121, (uint64_t)v11, (uint64_t)v140, v148, v135, v12);
    uint64_t v40 = sub_26282AF00(v152, (char)v11);
    if ((v40 & 1) == 0)
    {
      OUTLINED_FUNCTION_48_7(v40, v41, v42, v43, v44, v45, v46, v47, v117, v120, v121, v6, (uint64_t)v129, v131, v132, v135, (uint64_t)v140, v142, v148,
        v152,
        v154);
      OUTLINED_FUNCTION_68_7();
      sub_2628D2B98(v101, v102, v103, v104, v151, v138, v12);
      OUTLINED_FUNCTION_68_7();
      sub_2628D2B98(v105, v106, v107, v108, v151, v138, v12);
      uint64_t v93 = v156;
      uint64_t v94 = v3;
      uint64_t v95 = v38;
      uint64_t v98 = v127;
      uint64_t v96 = v130;
      uint64_t v97 = v145;
      unsigned int v99 = v8;
      goto LABEL_24;
    }
    uint64_t v48 = sub_2628B84B8(v129, v140);
    LODWORD(v132) = v48;
    OUTLINED_FUNCTION_48_7(v48, v49, v50, v51, v52, v53, v54, v55, v117, v120, v121, v6, (uint64_t)v129, v131, v132, v135, (uint64_t)v140, v142, v148,
      v152,
      v154);
    OUTLINED_FUNCTION_55_7();
    sub_2628D2B98(v56, v57, v58, v59, v149, v136, v12);
    OUTLINED_FUNCTION_55_7();
    sub_2628D2B98(v60, v61, v62, v63, v149, v136, v12);
    uint64_t v65 = v153;
    uint64_t v64 = v155;
    uint64_t v66 = v3;
    uint64_t v67 = (uint64_t)v39;
    uint64_t v68 = v143;
    uint64_t v69 = v125;
    unsigned int v70 = v8;
LABEL_20:
    sub_2628D2B98(v64, v66, v65, v67, v68, v69, v70);
    if (v133)
    {
      char v21 = 1;
      return v21 & 1;
    }
LABEL_25:
    char v21 = 0;
    return v21 & 1;
  }
  if (*(unsigned __int8 *)(a1 + 50) >> 6 != 1)
  {
    if ((v12 & 0xC00000) != 0x800000) {
      goto LABEL_22;
    }
    uint64_t v144 = *(void *)(a1 + 32);
    uint64_t v150 = *(void *)(a2 + 32);
    uint64_t v137 = *(void *)(a2 + 40);
    uint64_t v141 = *(void *)(a2 + 24);
    BOOL v71 = v2 == v10 && v3 == v9;
    uint64_t v122 = *(void *)(a2 + 8);
    if (!v71)
    {
      uint64_t v72 = *(void *)(a1 + 16);
      uint64_t v73 = *(void *)a1;
      char v74 = sub_262903620();
      uint64_t v2 = v73;
      uint64_t v4 = (void *)v72;
      if ((v74 & 1) == 0)
      {
        uint64_t v109 = OUTLINED_FUNCTION_69_5(v73, v3, v72, v5, v144);
        OUTLINED_FUNCTION_38_8(v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v122, v123, v128, v131, v132, v137, v141, v144, v150);
        sub_2628D2B98(v154, v3, v152, v5, v146, v6, v8);
        uint64_t v93 = OUTLINED_FUNCTION_71_7();
        goto LABEL_23;
      }
    }
    v75 = v4;
    uint64_t v76 = v2;
    LODWORD(v132) = sub_2628B84B8(v4, v11);
    uint64_t v77 = (uint64_t)v75;
    uint64_t v78 = v144;
    uint64_t v79 = OUTLINED_FUNCTION_69_5(v76, v3, v77, v5, v144);
    OUTLINED_FUNCTION_38_8(v79, v80, v81, v82, v83, v84, v85, v86, v117, v118, v122, v6, v128, v131, v132, v137, v141, v144, v150);
    sub_2628D2B98(v154, v3, v152, v5, v78, v126, v8);
    uint64_t v64 = OUTLINED_FUNCTION_71_7();
    unsigned int v70 = v12;
    goto LABEL_20;
  }
  if ((v12 & 0xC00000) != 0x400000)
  {
LABEL_22:
    sub_2628FE8A4(v2, v3, (uint64_t)v4, v5, v7, v6, v8);
    uint64_t v87 = OUTLINED_FUNCTION_70_7();
    sub_2628FE8A4(v87, v88, v89, v90, v91, v92, v12);
    sub_2628D2B98(v154, v3, v152, v5, v7, v6, v8);
    uint64_t v93 = OUTLINED_FUNCTION_70_7();
LABEL_23:
    unsigned int v99 = v12;
LABEL_24:
    sub_2628D2B98(v93, v94, v95, v96, v97, v98, v99);
    goto LABEL_25;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v134 = *(void *)(a2 + 40);
  uint64_t v139 = *(void *)(a2 + 24);
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v119 = *(void *)a2;
  uint64_t v17 = *(void *)(a2 + 8);
  uint64_t v147 = *(void *)(a2 + 32);
  uint64_t v18 = *(void *)a1;
  sub_2628FE8A4(v10, v9, (uint64_t)v11, v139, v14, v13, v12);
  sub_2628FE8A4(v18, v3, v16, v5, v7, v15, v8);
  sub_2628FE8A4(v18, v3, v16, v5, v7, v15, v8);
  sub_2628FE8A4(v119, v17, (uint64_t)v11, v139, v147, v134, v12);
  static MusicContent.QualifiedIdentifier.CloudLibrary.== infix(_:_:)();
  uint64_t v19 = v15;
  uint64_t v124 = v15;
  char v21 = v20;
  sub_2628D2B98(v154, v3, v152, v5, v7, v19, v8);
  uint64_t v22 = OUTLINED_FUNCTION_101_7();
  sub_2628D2B98(v22, v23, v24, v25, v147, v134, v12);
  uint64_t v26 = OUTLINED_FUNCTION_101_7();
  sub_2628D2B98(v26, v27, v28, v29, v147, v134, v12);
  sub_2628D2B98(v154, v3, v152, v5, v7, v124, v8);
  return v21 & 1;
}

uint64_t sub_2628F3A9C()
{
  __int16 v1 = *((_WORD *)v0 + 24);
  char v2 = *((unsigned char *)v0 + 50);
  long long v3 = v0[1];
  long long v6 = *v0;
  long long v7 = v3;
  long long v8 = v0[2];
  char v10 = v2;
  __int16 v9 = v1;
  sub_262903690();
  sub_2628F32BC((uint64_t)v5);
  return sub_2629036D0();
}

uint64_t sub_2628F3B08()
{
  sub_262903690();
  sub_2628F32BC((uint64_t)v1);
  return sub_2629036D0();
}

__n128 sub_2628F3B48(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_2629025D0();
  swift_bridgeObjectRelease();
  sub_2628F32BC(a1);
  return result;
}

uint64_t sub_2628F3BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 48);
  int v2 = *(unsigned __int8 *)(a1 + 66);
  int v3 = *(unsigned __int16 *)(a1 + 64);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  int v10 = *(unsigned __int8 *)(a2 + 66);
  int v11 = *(unsigned __int16 *)(a2 + 64);
  if (sub_2629025C0())
  {
    v23[0] = v19;
    v23[1] = v18;
    v23[2] = v17;
    v23[3] = v16;
    v23[4] = v15;
    v23[5] = v14;
    __int16 v24 = v3;
    char v25 = (v3 | (v2 << 16)) >> 16;
    v20[0] = v4;
    v20[1] = v5;
    v20[2] = v6;
    v20[3] = v7;
    v20[4] = v8;
    v20[5] = v9;
    char v22 = (v11 | (v10 << 16)) >> 16;
    __int16 v21 = v11;
    char v12 = sub_2628F3480((uint64_t)v23, (uint64_t)v20);
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_2628F3CF0()
{
  uint64_t v1 = *(void *)(v0 + 8);
  __int16 v2 = *(_WORD *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 66);
  v6[9] = *(void *)v0;
  v6[10] = v1;
  long long v4 = *(_OWORD *)(v0 + 32);
  long long v7 = *(_OWORD *)(v0 + 16);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(v0 + 48);
  char v11 = v3;
  __int16 v10 = v2;
  sub_262903690();
  sub_2628F3B48((uint64_t)v6);
  return sub_2629036D0();
}

uint64_t sub_2628F3D70()
{
  sub_262903690();
  sub_2628F3B48((uint64_t)v1);
  return sub_2629036D0();
}

uint64_t sub_2628F3DB8()
{
  return sub_262805F20();
}

uint64_t sub_2628F3DC0()
{
  return sub_2629036D0();
}

void sub_2628F3E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a3;
  uint64_t v41 = a2;
  uint64_t v40 = a1;
  uint64_t v44 = a4;
  uint64_t v42 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v37 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(int *)(v6 + 48);
  uint64_t v39 = v4;
  uint64_t v54 = *(void *)(v4 + v7);
  uint64_t v8 = *(void *)(v6 + 24);
  uint64_t v9 = *(void *)(v6 + 32);
  type metadata accessor for MediaAPIResourceRequest.Identifier();
  uint64_t v36 = v8;
  uint64_t v35 = v9;
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getWitnessTable();
  uint64_t v10 = sub_262902C10();
  swift_getWitnessTable();
  sub_262903130();
  if (!v64)
  {
    __break(1u);
    goto LABEL_8;
  }
  unsigned int v11 = v71;
  uint64_t v12 = v69;
  uint64_t v13 = v70;
  uint64_t v15 = v67;
  uint64_t v14 = v68;
  uint64_t v16 = v65;
  uint64_t v17 = v66;
  swift_bridgeObjectRelease();
  sub_2628FE8A4(v16, v17, v15, v14, v12, v13, v11);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_58_5();
  uint64_t v54 = v16;
  uint64_t v55 = v17;
  uint64_t v56 = v15;
  uint64_t v57 = v14;
  uint64_t v58 = v12;
  uint64_t v59 = v13;
  BYTE2(v60) = BYTE2(v11);
  LOWORD(v60) = v11;
  sub_2628F323C(&v63);
  OUTLINED_FUNCTION_58_5();
  int v38 = v63;
  uint64_t v18 = v43;
  uint64_t v45 = *(void *)(v43 + *(int *)(v44 + 40));
  v34[1] = v10;
  sub_262903130();
  if (!v55)
  {
LABEL_8:
    __break(1u);
    return;
  }
  uint64_t v19 = v18;
  int v20 = v62;
  uint64_t v22 = v60;
  uint64_t v21 = v61;
  uint64_t v24 = v58;
  uint64_t v23 = v59;
  uint64_t v26 = v56;
  uint64_t v25 = v57;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69_5(v26, v25, v24, v23, v22);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62_7();
  uint64_t v45 = v26;
  uint64_t v46 = v25;
  uint64_t v47 = v24;
  uint64_t v48 = v23;
  uint64_t v49 = v22;
  uint64_t v50 = v21;
  char v52 = BYTE2(v20);
  __int16 v51 = v20;
  sub_2628F323C(&v53);
  OUTLINED_FUNCTION_62_7();
  uint64_t v27 = v42;
  uint64_t v28 = *(uint64_t (**)(void))(v42 + 16);
  if (v38 == v53)
  {
    uint64_t v29 = v37;
    OUTLINED_FUNCTION_66_8();
    uint64_t v30 = v28();
    MEMORY[0x270FA5388](v30);
    uint64_t v31 = v35;
    v34[-2] = v36;
    v34[-1] = v31;
    swift_bridgeObjectRetain();
    sub_262902BF0();
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v40, v29, v23);
    uint64_t v32 = 1;
    uint64_t v33 = v41;
  }
  else
  {
    OUTLINED_FUNCTION_66_8();
    v28();
    uint64_t v33 = v41;
    ((void (*)(uint64_t, uint64_t, uint64_t))v28)(v41, v19, v23);
    uint64_t v32 = 0;
  }
  __swift_storeEnumTagSinglePayload(v33, v32, 1, v23);
  OUTLINED_FUNCTION_24_2();
}

uint64_t sub_2628F4240@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getWitnessTable();
  uint64_t result = sub_2629030C0();
  *a1 = result;
  return result;
}

uint64_t sub_2628F4320(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  unsigned __int8 v6 = *a3;
  if (*(void *)(*v3 + 16) && (sub_26283F2B8(*a3), (v7 & 1) != 0)) {
    uint64_t v8 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v8 = MEMORY[0x263F8EE88];
  }
  uint64_t v18 = v8;
  swift_bridgeObjectRetain();
  sub_2628FEA88(&v17, a1, a2);
  swift_bridgeObjectRelease();
  sub_2628FEA08(v18, v6);
  uint64_t v9 = v3[1];
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_26283F2B8(v6), (v11 & 1) != 0))
  {
    uint64_t v17 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v12 = type metadata accessor for MediaAPIResourceRequest.Option();
    uint64_t v13 = sub_262902F60();
    if (MEMORY[0x263E56090](v13, v12))
    {
      uint64_t WitnessTable = swift_getWitnessTable();
      uint64_t v15 = sub_2628FF440(v13, v12, WitnessTable);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = MEMORY[0x263F8EE88];
    }
    uint64_t v17 = v15;
  }
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getWitnessTable();
  sub_2629030E0();
  sub_2628FF7FC();
  sub_262902C10();
  return sub_262902C50();
}

uint64_t sub_2628F4534(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned __int8 v4 = 2 * *(unsigned char *)(a1 + 16);
  return sub_2628F4320(v2, v1, &v4);
}

uint64_t sub_2628F4574(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 24);
  unsigned __int8 v4 = (2 * *(unsigned char *)(a1 + 32)) | 1;
  return sub_2628F4320(v2, v1, &v4);
}

uint64_t sub_2628F45B8()
{
  sub_2628FF848();
  sub_2628FF7FC();
  uint64_t v0 = sub_262902BD0();
  OUTLINED_FUNCTION_95_4();
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getTupleTypeMetadata2();
  sub_262902F60();
  sub_262902BD0();
  return v0;
}

uint64_t sub_2628F46A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  sub_2628FEA88(&v6, v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a2;
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  OUTLINED_FUNCTION_93_5();
  sub_2629030F0();
  swift_getWitnessTable();
  return sub_2629030E0();
}

uint64_t sub_2628F477C()
{
  uint64_t v0 = type metadata accessor for MediaAPIResourceRequest.Option();
  OUTLINED_FUNCTION_93_5();
  uint64_t v1 = sub_262902F60();
  if (MEMORY[0x263E56090](v1, v0))
  {
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_2628FF440(v1, v0, WitnessTable);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_2628F4818(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v135 = a2;
  uint64_t v149 = sub_262901F10();
  uint64_t v7 = *(void *)(v149 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v149);
  uint64_t v128 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v127 = (char *)&v125 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v144 = (char *)&v125 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v140 = (char *)&v125 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v143 = (char *)&v125 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v139 = (char *)&v125 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v142 = (char *)&v125 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v138 = (char *)&v125 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v141 = (char *)&v125 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v137 = (char *)&v125 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v136 = (char *)&v125 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v125 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v145 = (char *)&v125 - v33;
  uint64_t v34 = type metadata accessor for MediaAPIResourceRequest.Option();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v147 = v34;
  uint64_t v35 = sub_2629030F0();
  swift_getTupleTypeMetadata2();
  sub_262902F60();
  unint64_t v148 = sub_2628FF7FC();
  uint64_t v152 = sub_262902BD0();
  if ((a4 & 1) == 0)
  {
    uint64_t v36 = a1 + 64;
    uint64_t v37 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v38 = -1;
    if (v37 < 64) {
      uint64_t v38 = ~(-1 << v37);
    }
    unint64_t v39 = v38 & *(void *)(a1 + 64);
    int64_t v40 = (unint64_t)(v37 + 63) >> 6;
    unint64_t v130 = v7 + 32;
    swift_bridgeObjectRetain();
    int64_t v41 = 0;
    uint64_t v42 = MEMORY[0x263F8EE78];
    v129 = "ngs";
    uint64_t v125 = "ary-albums";
    unint64_t v131 = v35;
    uint64_t v126 = v7;
    while (1)
    {
      if (v39)
      {
        unint64_t v43 = __clz(__rbit64(v39));
        v39 &= v39 - 1;
        unint64_t v44 = v43 | (v41 << 6);
      }
      else
      {
        int64_t v45 = v41 + 1;
        if (__OFADD__(v41, 1))
        {
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (v45 >= v40) {
          goto LABEL_32;
        }
        unint64_t v46 = *(void *)(v36 + 8 * v45);
        ++v41;
        if (!v46)
        {
          int64_t v41 = v45 + 1;
          if (v45 + 1 >= v40) {
            goto LABEL_32;
          }
          unint64_t v46 = *(void *)(v36 + 8 * v41);
          if (!v46)
          {
            int64_t v41 = v45 + 2;
            if (v45 + 2 >= v40) {
              goto LABEL_32;
            }
            unint64_t v46 = *(void *)(v36 + 8 * v41);
            if (!v46)
            {
              int64_t v47 = v45 + 3;
              if (v47 >= v40)
              {
LABEL_32:
                swift_release();
                goto LABEL_38;
              }
              unint64_t v46 = *(void *)(v36 + 8 * v47);
              if (!v46)
              {
                while (1)
                {
                  int64_t v41 = v47 + 1;
                  if (__OFADD__(v47, 1)) {
                    break;
                  }
                  if (v41 >= v40) {
                    goto LABEL_32;
                  }
                  unint64_t v46 = *(void *)(v36 + 8 * v41);
                  ++v47;
                  if (v46) {
                    goto LABEL_20;
                  }
                }
LABEL_142:
                __break(1u);
LABEL_143:
                uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
                goto LABEL_133;
              }
              int64_t v41 = v47;
            }
          }
        }
LABEL_20:
        unint64_t v39 = (v46 - 1) & v46;
        unint64_t v44 = __clz(__rbit64(v46)) + (v41 << 6);
      }
      uint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8 * v44);
      if (*(void *)(v48 + 16))
      {
        unint64_t v49 = *(unsigned __int8 *)(*(void *)(a1 + 48) + v44);
        v150[0] = 1534289001;
        v150[1] = 0xE400000000000000;
        unint64_t v134 = v49;
        swift_bridgeObjectRetain();
        sub_262902D70();
        swift_bridgeObjectRelease();
        sub_262902D70();
        unint64_t v133 = v150[0];
        v150[0] = v48;
        sub_2628FF848();
        unint64_t v132 = v50;
        sub_2628FEE4C(&qword_26A9670E0, (void (*)(uint64_t))sub_2628FF848);
        sub_26281EDB4();
        sub_262902E10();
        swift_bridgeObjectRelease();
        sub_262901F00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        uint64_t v7 = v126;
        unint64_t v52 = *(void *)(v42 + 16);
        unint64_t v51 = *(void *)(v42 + 24);
        if (v52 >= v51 >> 1) {
          uint64_t v42 = sub_2628261B4(v51 > 1, v52 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v52 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v52, v145, v149);
        char v53 = v134;
        char v151 = v134;
        MEMORY[0x263E55D10](v150, &v151, v135, &type metadata for MediaAPI.MediaAPIType, v131, v148);
        if (v150[0])
        {
          char v151 = v53;
          sub_262902C10();
          sub_262902C50();
        }
      }
    }
  }
  if (*(void *)(a1 + 16))
  {
    v150[0] = a1;
    sub_2628FF848();
    sub_2628FEE4C(&qword_26A9670E0, (void (*)(uint64_t))sub_2628FF848);
    sub_26281EDB4();
    swift_bridgeObjectRetain();
    sub_262902E10();
    swift_bridgeObjectRelease();
    sub_262901F00();
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_2628261B4(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v55 = *(void *)(v42 + 16);
    unint64_t v54 = *(void *)(v42 + 24);
    if (v55 >= v54 >> 1) {
      uint64_t v42 = sub_2628261B4(v54 > 1, v55 + 1, 1, v42);
    }
    unint64_t v56 = v135;
    *(void *)(v42 + 16) = v55 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v55, v32, v149);
  }
  else
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
    unint64_t v56 = v135;
  }
  uint64_t v57 = *(void *)(a3 + 16);
  if (v57)
  {
    swift_bridgeObjectRetain();
    sub_262902C10();
    uint64_t v58 = 0;
    do
    {
      char v59 = *(unsigned char *)(a3 + v58++ + 32);
      v150[0] = v56;
      char v151 = v59;
      swift_bridgeObjectRetain();
      sub_262902C50();
    }
    while (v57 != v58);
    swift_bridgeObjectRelease();
  }
LABEL_38:
  LODWORD(v145) = 0;
  int64_t v60 = 0;
  uint64_t v61 = MEMORY[0x263F8EE78];
  uint64_t v62 = v152;
  uint64_t v63 = v152 + 64;
  uint64_t v64 = 1 << *(unsigned char *)(v152 + 32);
  uint64_t v65 = -1;
  if (v64 < 64) {
    uint64_t v65 = ~(-1 << v64);
  }
  unint64_t v39 = v65 & *(void *)(v152 + 64);
  int64_t v66 = (unint64_t)(v64 + 63) >> 6;
  unint64_t v148 = v7 + 32;
  v129 = (char *)0x8000000262904220;
  unint64_t v132 = 0x800000026290BD00;
  unint64_t v135 = 0x800000026290BD20;
  unint64_t v131 = 0x800000026290BD40;
  unint64_t v134 = 0x800000026290BD60;
  unint64_t v130 = 0x800000026290BCC0;
  unint64_t v133 = 0x800000026290BCE0;
  while (v39)
  {
    unint64_t v67 = __clz(__rbit64(v39));
    v39 &= v39 - 1;
    unint64_t v68 = v67 | (v60 << 6);
LABEL_55:
    switch(*(unsigned char *)(*(void *)(v62 + 48) + v68))
    {
      case 1:
      case 2:
      case 3:
      case 8:
      case 9:
      case 0xA:
      case 0xB:
        continue;
      case 4:
        LOBYTE(v150[0]) = 3;
        swift_bridgeObjectRetain();
        char v76 = sub_2629030D0();
        swift_bridgeObjectRelease();
        if (v76)
        {
          sub_262825FD0();
          uint64_t v61 = v77;
          unint64_t v78 = *(void *)(v77 + 16);
          if (v78 >= *(void *)(v77 + 24) >> 1)
          {
            sub_262825FD0();
            uint64_t v61 = v111;
          }
          *(void *)(v61 + 16) = v78 + 1;
          uint64_t v79 = v61 + 16 * v78;
          *(void *)(v79 + 32) = 0x736B63617274;
          *(void *)(v79 + 40) = 0xE600000000000000;
          LODWORD(v145) = 1;
        }
        else if (!*(void *)(v61 + 16))
        {
          swift_bridgeObjectRelease();
          goto LABEL_88;
        }
        v150[0] = v61;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        swift_bridgeObjectRelease();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        uint64_t v61 = MEMORY[0x263F8EE78];
        unint64_t v95 = *(void *)(v42 + 16);
        unint64_t v94 = *(void *)(v42 + 24);
        if (v95 >= v94 >> 1) {
          uint64_t v42 = sub_2628261B4(v94 > 1, v95 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v95 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v95, v137, v149);
LABEL_88:
        v150[0] = &unk_270DDB8C8;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        unint64_t v97 = *(void *)(v42 + 16);
        unint64_t v96 = *(void *)(v42 + 24);
        if (v97 >= v96 >> 1) {
          uint64_t v42 = sub_2628261B4(v96 > 1, v97 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v97 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v97, v141, v149);
        break;
      case 5:
        LOBYTE(v150[0]) = 3;
        swift_bridgeObjectRetain();
        char v80 = sub_2629030D0();
        swift_bridgeObjectRelease();
        if (v80)
        {
          sub_262825FD0();
          uint64_t v61 = v81;
          unint64_t v82 = *(void *)(v81 + 16);
          if (v82 >= *(void *)(v81 + 24) >> 1)
          {
            sub_262825FD0();
            uint64_t v61 = v112;
          }
          *(void *)(v61 + 16) = v82 + 1;
          uint64_t v83 = v61 + 16 * v82;
          *(void *)(v83 + 32) = 0x736B63617274;
          *(void *)(v83 + 40) = 0xE600000000000000;
          LODWORD(v145) = 1;
        }
        else if (!*(void *)(v61 + 16))
        {
          swift_bridgeObjectRelease();
          goto LABEL_99;
        }
        v150[0] = v61;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        swift_bridgeObjectRelease();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        uint64_t v61 = MEMORY[0x263F8EE78];
        unint64_t v99 = *(void *)(v42 + 16);
        unint64_t v98 = *(void *)(v42 + 24);
        if (v99 >= v98 >> 1) {
          uint64_t v42 = sub_2628261B4(v98 > 1, v99 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v99 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v99, v139, v149);
LABEL_99:
        v150[0] = &unk_270DDB948;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        unint64_t v101 = *(void *)(v42 + 16);
        unint64_t v100 = *(void *)(v42 + 24);
        if (v101 >= v100 >> 1) {
          uint64_t v42 = sub_2628261B4(v100 > 1, v101 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v101 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v101, v143, v149);
        break;
      case 6:
        LOBYTE(v150[0]) = 3;
        swift_bridgeObjectRetain();
        char v84 = sub_2629030D0();
        swift_bridgeObjectRelease();
        if (v84)
        {
          sub_262825FD0();
          uint64_t v61 = v85;
          unint64_t v86 = *(void *)(v85 + 16);
          if (v86 >= *(void *)(v85 + 24) >> 1)
          {
            sub_262825FD0();
            uint64_t v61 = v113;
          }
          *(void *)(v61 + 16) = v86 + 1;
          uint64_t v87 = v61 + 16 * v86;
          *(void *)(v87 + 32) = 0x736B63617274;
          *(void *)(v87 + 40) = 0xE600000000000000;
          LODWORD(v145) = 1;
        }
        else if (!*(void *)(v61 + 16))
        {
          swift_bridgeObjectRelease();
          goto LABEL_110;
        }
        v150[0] = v61;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        swift_bridgeObjectRelease();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        uint64_t v61 = MEMORY[0x263F8EE78];
        unint64_t v103 = *(void *)(v42 + 16);
        unint64_t v102 = *(void *)(v42 + 24);
        if (v103 >= v102 >> 1) {
          uint64_t v42 = sub_2628261B4(v102 > 1, v103 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v103 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v103, v138, v149);
LABEL_110:
        v150[0] = &unk_270DDB908;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        unint64_t v105 = *(void *)(v42 + 16);
        unint64_t v104 = *(void *)(v42 + 24);
        if (v105 >= v104 >> 1) {
          uint64_t v42 = sub_2628261B4(v104 > 1, v105 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v105 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v105, v142, v149);
        break;
      case 7:
        LOBYTE(v150[0]) = 3;
        swift_bridgeObjectRetain();
        char v88 = sub_2629030D0();
        swift_bridgeObjectRelease();
        if (v88)
        {
          sub_262825FD0();
          uint64_t v61 = v89;
          unint64_t v90 = *(void *)(v89 + 16);
          if (v90 >= *(void *)(v89 + 24) >> 1)
          {
            sub_262825FD0();
            uint64_t v61 = v114;
          }
          *(void *)(v61 + 16) = v90 + 1;
          uint64_t v91 = v61 + 16 * v90;
          *(void *)(v91 + 32) = 0x736B63617274;
          *(void *)(v91 + 40) = 0xE600000000000000;
          LODWORD(v145) = 1;
        }
        else if (!*(void *)(v61 + 16))
        {
          swift_bridgeObjectRelease();
          goto LABEL_121;
        }
        v150[0] = v61;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        swift_bridgeObjectRelease();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        uint64_t v61 = MEMORY[0x263F8EE78];
        unint64_t v107 = *(void *)(v42 + 16);
        unint64_t v106 = *(void *)(v42 + 24);
        if (v107 >= v106 >> 1) {
          uint64_t v42 = sub_2628261B4(v106 > 1, v107 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v107 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v107, v140, v149);
LABEL_121:
        v150[0] = &unk_270DDB988;
        sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
        sub_262895B40();
        sub_262902C80();
        sub_262901F00();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
        }
        unint64_t v109 = *(void *)(v42 + 16);
        unint64_t v108 = *(void *)(v42 + 24);
        if (v109 >= v108 >> 1) {
          uint64_t v42 = sub_2628261B4(v108 > 1, v109 + 1, 1, v42);
        }
        *(void *)(v42 + 16) = v109 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v109, v144, v149);
        break;
      default:
        LOBYTE(v150[0]) = 2;
        swift_bridgeObjectRetain();
        char v72 = sub_2629030D0();
        swift_bridgeObjectRelease();
        if (v72)
        {
          sub_262825FD0();
          uint64_t v61 = v73;
          unint64_t v74 = *(void *)(v73 + 16);
          if (v74 >= *(void *)(v73 + 24) >> 1)
          {
            sub_262825FD0();
            uint64_t v61 = v110;
          }
          *(void *)(v61 + 16) = v74 + 1;
          uint64_t v75 = v61 + 16 * v74;
          *(void *)(v75 + 32) = 0xD000000000000011;
          *(void *)(v75 + 40) = v129;
LABEL_77:
          v150[0] = v61;
          sub_2628FFEAC(0, (unint64_t *)&qword_26A963538, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
          sub_262895B40();
          sub_262902C80();
          swift_bridgeObjectRelease();
          sub_262901F00();
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v42 = sub_2628261B4(0, *(void *)(v42 + 16) + 1, 1, v42);
          }
          uint64_t v61 = MEMORY[0x263F8EE78];
          unint64_t v93 = *(void *)(v42 + 16);
          unint64_t v92 = *(void *)(v42 + 24);
          if (v93 >= v92 >> 1) {
            uint64_t v42 = sub_2628261B4(v92 > 1, v93 + 1, 1, v42);
          }
          *(void *)(v42 + 16) = v93 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v42+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v93, v136, v149);
        }
        else
        {
          if (*(void *)(v61 + 16)) {
            goto LABEL_77;
          }
          uint64_t v61 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRelease();
        }
        break;
    }
  }
  int64_t v69 = v60 + 1;
  if (__OFADD__(v60, 1))
  {
    __break(1u);
LABEL_140:
    __break(1u);
    goto LABEL_141;
  }
  if (v69 >= v66) {
    goto LABEL_131;
  }
  unint64_t v70 = *(void *)(v63 + 8 * v69);
  ++v60;
  if (v70) {
    goto LABEL_54;
  }
  int64_t v60 = v69 + 1;
  if (v69 + 1 >= v66) {
    goto LABEL_131;
  }
  unint64_t v70 = *(void *)(v63 + 8 * v60);
  if (v70)
  {
LABEL_54:
    unint64_t v39 = (v70 - 1) & v70;
    unint64_t v68 = __clz(__rbit64(v70)) + (v60 << 6);
    goto LABEL_55;
  }
  int64_t v71 = v69 + 2;
  if (v71 < v66)
  {
    unint64_t v70 = *(void *)(v63 + 8 * v71);
    if (!v70)
    {
      while (1)
      {
        int64_t v60 = v71 + 1;
        if (__OFADD__(v71, 1)) {
          goto LABEL_140;
        }
        if (v60 >= v66) {
          goto LABEL_131;
        }
        unint64_t v70 = *(void *)(v63 + 8 * v60);
        ++v71;
        if (v70) {
          goto LABEL_54;
        }
      }
    }
    int64_t v60 = v71;
    goto LABEL_54;
  }
LABEL_131:
  swift_release();
  if ((v145 & 1) == 0) {
    return v42;
  }
  unint64_t v39 = (unint64_t)v127;
  sub_262901F00();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_143;
  }
LABEL_133:
  uint64_t v115 = v128;
  unint64_t v117 = *(void *)(v42 + 16);
  unint64_t v116 = *(void *)(v42 + 24);
  if (v117 >= v116 >> 1) {
    uint64_t v42 = sub_2628261B4(v116 > 1, v117 + 1, 1, v42);
  }
  *(void *)(v42 + 16) = v117 + 1;
  unint64_t v118 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v119 = *(void *)(v7 + 72);
  unint64_t v120 = v42 + v118 + v119 * v117;
  uint64_t v121 = *(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 32);
  v121(v120, v39, v149);
  sub_262901F00();
  unint64_t v123 = *(void *)(v42 + 16);
  unint64_t v122 = *(void *)(v42 + 24);
  if (v123 >= v122 >> 1) {
    uint64_t v42 = sub_2628261B4(v122 > 1, v123 + 1, 1, v42);
  }
  *(void *)(v42 + 16) = v123 + 1;
  v121(v42 + v118 + v123 * v119, (unint64_t)v115, v149);
  return v42;
}

uint64_t sub_2628F62BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    goto LABEL_9;
  }
  sub_262903690();
  sub_2629025D0();
  uint64_t v4 = sub_2629036D0();
  uint64_t v5 = -1 << *(unsigned char *)(a3 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a3 + 56;
  if (((*(void *)(a3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  char v8 = sub_2629025C0();
  swift_bridgeObjectRelease();
  if (v8)
  {
    char v9 = 1;
    return v9 & 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
  {
LABEL_9:
    char v9 = 0;
    return v9 & 1;
  }
  do
  {
    swift_bridgeObjectRetain();
    char v9 = sub_2629025C0();
    swift_bridgeObjectRelease();
    if (v9) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return v9 & 1;
}

uint64_t sub_2628F6418()
{
  OUTLINED_FUNCTION_52_0();
  v1[95] = v0;
  v1[94] = v2;
  sub_2629000B0(0, &qword_26A965240, (uint64_t (*)(void))sub_26288E100, (uint64_t)&type metadata for MusicContentError, MEMORY[0x263F78548]);
  v1[96] = v3;
  v1[97] = swift_task_alloc();
  sub_2628FE790(0, (unint64_t *)&qword_26A963D18, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  v1[98] = swift_task_alloc();
  uint64_t v4 = sub_2629020B0();
  v1[99] = v4;
  OUTLINED_FUNCTION_2_0(v4);
  v1[100] = v5;
  v1[101] = swift_task_alloc();
  v1[102] = swift_task_alloc();
  uint64_t v6 = sub_262901F80();
  v1[103] = v6;
  OUTLINED_FUNCTION_2_0(v6);
  v1[104] = v7;
  v1[105] = swift_task_alloc();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

void sub_2628F65BC()
{
  uint64_t v113 = v0;
  uint64_t v1 = *(void *)(v0 + 760);
  uint64_t v2 = *(void *)(v0 + 752);
  sub_2628FE790(0, &qword_26A963F40, MEMORY[0x263F06338], MEMORY[0x263F8E0F8]);
  uint64_t v3 = sub_262901F10();
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_26290F4A0;
  sub_262901F00();
  OUTLINED_FUNCTION_102_6();
  sub_262901F00();
  *(void *)(v0 + 744) = v4;
  type metadata accessor for MediaAPIResourceRequest.Identifier();
  OUTLINED_FUNCTION_93_5();
  swift_getTupleTypeMetadata2();
  sub_262902F60();
  uint64_t v5 = sub_262902BD0();
  uint64_t v6 = MEMORY[0x263F8EE88];
  *(void *)(v0 + 736) = v5;
  *(void *)(v0 + 728) = v6;
  uint64_t v101 = *(void *)(v1 + *(int *)(v2 + 40));
  *(void *)(v0 + 720) = v101;
  type metadata accessor for MediaAPIResourceRequest.Option();
  swift_getWitnessTable();
  sub_2629030F0();
  swift_getWitnessTable();
  sub_262902C10();
  swift_getWitnessTable();
  uint64_t v7 = sub_262903130();
  uint64_t v8 = *(void *)(v0 + 88);
  if (!v8) {
    goto LABEL_75;
  }
  uint64_t v94 = v0 + 296;
  uint64_t v10 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 112);
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 136);
  uint64_t v102 = v0;
  unsigned int v15 = *(_DWORD *)(v0 + 144);
  swift_bridgeObjectRelease();
  int v16 = (v15 >> 22) & 3;
  sub_2628FE8A4(v10, v9, v12, v11, v13, v14, v15);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_7();
  if (v16)
  {
    if (v16 != 1)
    {
      OUTLINED_FUNCTION_7_7();
      sub_2628F477C();
      uint64_t v90 = v101 + 64;
      uint64_t v42 = -1;
      uint64_t v43 = -1 << *(unsigned char *)(v101 + 32);
      if (-v43 < 64) {
        uint64_t v42 = ~(-1 << -(char)v43);
      }
      uint64_t v44 = v42 & *(void *)(v101 + 64);
      int64_t v91 = (unint64_t)(63 - v43) >> 6;
      uint64_t v7 = swift_bridgeObjectRetain();
      uint64_t v45 = 0;
      if (!v44) {
        goto LABEL_39;
      }
LABEL_38:
      OUTLINED_FUNCTION_78_7();
      while (1)
      {
        uint64_t v51 = *(void *)(v101 + 48) + 72 * v46;
        uint64_t v52 = *(void *)(v51 + 8);
        uint64_t v100 = *(void *)v51;
        uint64_t v54 = *(void *)(v51 + 16);
        unint64_t v53 = *(void *)(v51 + 24);
        uint64_t v56 = *(void *)(v51 + 32);
        uint64_t v55 = *(void *)(v51 + 40);
        uint64_t v57 = *(void *)(v51 + 48);
        uint64_t v58 = *(void *)(v51 + 56);
        int v59 = *(unsigned __int16 *)(v51 + 64) | (*(unsigned __int8 *)(v51 + 66) << 16);
        uint64_t v60 = *(void *)(*(void *)(v101 + 56) + 8 * v46);
        if ((v59 & 0xC00000) != 0x800000)
        {
          uint64_t v105 = 0;
          unint64_t v106 = 0xE000000000000000;
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_6_11();
          swift_bridgeObjectRetain();
          sub_2629032A0();
          OUTLINED_FUNCTION_54_7();
          sub_262902D70();
          *(void *)(v102 + 448) = v100;
          *(void *)(v102 + 456) = v52;
          *(void *)(v102 + 464) = v54;
          *(void *)(v102 + 472) = v53;
          *(void *)(v102 + 480) = v56;
          *(void *)(v102 + 488) = v55;
          *(void *)(v102 + 496) = v57;
          *(void *)(v102 + 504) = v58;
          *(unsigned char *)(v94 + 218) = BYTE2(v59);
          *(_WORD *)(v94 + 216) = v59;
          sub_2629035F0();
          goto LABEL_56;
        }
        uint64_t v105 = *(void *)(v51 + 16);
        unint64_t v106 = v53;
        uint64_t v107 = v56;
        uint64_t v98 = v47;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_6_11();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_6_11();
        type metadata accessor for MediaAPIResourceRequest.MediaAPIOpaqueLookupParameters();
        sub_2628F46A0(&v105, v60);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_57_6();
        *(void *)(v102 + 520) = v100;
        *(void *)(v102 + 528) = v52;
        *(void *)(v102 + 536) = v54;
        *(void *)(v102 + 544) = v53;
        *(void *)(v102 + 552) = v56;
        *(void *)(v102 + 560) = v55;
        *(void *)(v102 + 568) = v57;
        *(void *)(v102 + 576) = v58;
        *(unsigned char *)(v94 + 290) = BYTE2(v59);
        *(_WORD *)(v94 + 288) = v59;
        *(void *)(v102 + 648) = v54;
        *(void *)(v102 + 656) = v53;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_6_11();
        sub_262902C10();
        sub_262902C50();
        swift_bridgeObjectRetain();
        sub_2628FEC20(&v105, v100, v52);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_57_6();
        uint64_t v7 = swift_bridgeObjectRelease();
        uint64_t v45 = v98;
        if (v44) {
          goto LABEL_38;
        }
LABEL_39:
        int64_t v48 = v45 + 1;
        uint64_t v17 = v102;
        if (__OFADD__(v45, 1)) {
          goto LABEL_71;
        }
        if (v48 >= v91)
        {
LABEL_59:
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v105 = 0;
          unint64_t v106 = 0xE000000000000000;
          sub_2629032A0();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_24_9();
          sub_262902D70();
          swift_bridgeObjectRelease();
          sub_262902D70();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v65 = OUTLINED_FUNCTION_202_1();
          uint64_t v68 = sub_2628F4818(v65, v66, v67, 1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_26283EDD4(v68);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_60;
        }
        if (!*(void *)(v90 + 8 * v48))
        {
          if (v45 + 2 >= v91) {
            goto LABEL_59;
          }
          if (!*(void *)(v90 + 8 * (v45 + 2)))
          {
            uint64_t v49 = v45 + 3;
            if (v45 + 3 >= v91) {
              goto LABEL_59;
            }
            if (!*(void *)(v90 + 8 * v49)) {
              break;
            }
          }
        }
LABEL_49:
        OUTLINED_FUNCTION_75_6();
      }
      while (1)
      {
        int64_t v50 = v49 + 1;
        if (__OFADD__(v49, 1)) {
          goto LABEL_74;
        }
        if (v50 >= v91) {
          goto LABEL_59;
        }
        ++v49;
        if (*(void *)(v90 + 8 * v50)) {
          goto LABEL_49;
        }
      }
    }
    uint64_t v17 = v102;
    OUTLINED_FUNCTION_7_7();
    sub_2628F45B8();
    uint64_t v7 = OUTLINED_FUNCTION_8_10();
    uint64_t v18 = 0;
    if (!v14) {
      goto LABEL_6;
    }
LABEL_5:
    OUTLINED_FUNCTION_78_7();
    while (1)
    {
      OUTLINED_FUNCTION_44_8();
      uint64_t v25 = *(void *)(v23 + 32);
      uint64_t v24 = *(void *)(v23 + 40);
      uint64_t v27 = *(void *)(v23 + 48);
      uint64_t v26 = *(void *)(v23 + 56);
      unsigned int v28 = *(unsigned __int16 *)(v23 + 64) | (*(unsigned __int8 *)(v23 + 66) << 16);
      if ((v28 & 0xC00000) != 0x400000)
      {
        uint64_t v105 = 0;
        unint64_t v106 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_17_9();
        swift_bridgeObjectRetain();
        sub_2629032A0();
        OUTLINED_FUNCTION_54_7();
        sub_262902D70();
        *(void *)(v102 + 376) = v99;
        *(void *)(v102 + 384) = v11;
        *(void *)(v102 + 392) = v6;
        *(void *)(v102 + 400) = v8;
        *(void *)(v102 + 408) = v25;
        *(void *)(v102 + 416) = v24;
        *(void *)(v102 + 424) = v27;
        *(void *)(v102 + 432) = v26;
        *(unsigned char *)(v94 + 146) = BYTE2(v28);
        *(_WORD *)(v94 + 144) = v28;
        sub_2629035F0();
        goto LABEL_56;
      }
      uint64_t v105 = v6;
      unint64_t v106 = v8;
      uint64_t v107 = v25;
      uint64_t v108 = v24;
      char v109 = v27;
      uint64_t v110 = v26;
      __int16 v111 = v28 & 0xFF01;
      char v112 = BYTE2(v28) & 1;
      uint64_t v96 = v22;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_17_9();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_17_9();
      type metadata accessor for MediaAPIResourceRequest.MediaAPITypedLookupParameters();
      uint64_t v29 = OUTLINED_FUNCTION_92_6();
      sub_2628F4574(v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2628D2B98(v6, v8, v25, v24, v27, v26, v28);
      uint64_t v17 = v102;
      *(void *)(v102 + 304) = v99;
      *(void *)(v102 + 312) = v11;
      *(void *)(v102 + 320) = v6;
      *(void *)(v102 + 328) = v8;
      *(void *)(v102 + 336) = v25;
      *(void *)(v102 + 344) = v24;
      *(void *)(v102 + 352) = v27;
      *(void *)(v102 + 360) = v26;
      *(unsigned char *)(v94 + 74) = BYTE2(v28);
      *(_WORD *)(v94 + 72) = v28;
      *(void *)(v102 + 664) = v25;
      *(void *)(v102 + 672) = v24;
      sub_262902C10();
      uint64_t v7 = sub_262902C50();
      uint64_t v18 = v96;
      if (v95) {
        goto LABEL_5;
      }
LABEL_6:
      uint64_t v19 = v18 + 1;
      if (__OFADD__(v18, 1))
      {
        __break(1u);
        goto LABEL_70;
      }
      if (v19 >= v93) {
        goto LABEL_57;
      }
      if (!*(void *)(v92 + 8 * v19))
      {
        if (v18 + 2 >= v93) {
          goto LABEL_57;
        }
        if (!*(void *)(v92 + 8 * (v18 + 2)))
        {
          uint64_t v20 = v18 + 3;
          if (v18 + 3 >= v93)
          {
LABEL_57:
            swift_release();
            uint64_t v61 = sub_2628F4818(v103, v104, 0, 0);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_26283EDD4(v61);
            goto LABEL_60;
          }
          if (!*(void *)(v92 + 8 * v20)) {
            break;
          }
        }
      }
LABEL_16:
      OUTLINED_FUNCTION_75_6();
    }
    while (1)
    {
      uint64_t v21 = v20 + 1;
      if (__OFADD__(v20, 1)) {
        break;
      }
      if (v21 >= v93) {
        goto LABEL_57;
      }
      ++v20;
      if (*(void *)(v92 + 8 * v21)) {
        goto LABEL_16;
      }
    }
LABEL_72:
    __break(1u);
  }
  else
  {
    uint64_t v17 = v102;
    OUTLINED_FUNCTION_7_7();
    sub_2628F45B8();
    uint64_t v7 = OUTLINED_FUNCTION_8_10();
    uint64_t v30 = 0;
    if (!v14) {
      goto LABEL_22;
    }
    while (1)
    {
      do
      {
LABEL_32:
        OUTLINED_FUNCTION_44_8();
        uint64_t v37 = *(void *)(v35 + 32);
        uint64_t v36 = *(void *)(v35 + 40);
        unsigned int v38 = *(unsigned __int16 *)(v35 + 64) | (*(unsigned __int8 *)(v35 + 66) << 16);
        uint64_t v40 = *(void *)(v35 + 48);
        uint64_t v39 = *(void *)(v35 + 56);
        if ((v38 & 0xC00000) != 0)
        {
          uint64_t v105 = 0;
          unint64_t v106 = 0xE000000000000000;
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_16_6();
          swift_bridgeObjectRetain();
          sub_2629032A0();
          OUTLINED_FUNCTION_54_7();
          sub_262902D70();
          *(void *)(v102 + 232) = v99;
          *(void *)(v102 + 240) = v11;
          *(void *)(v102 + 248) = v6;
          *(void *)(v102 + 256) = v8;
          *(void *)(v102 + 264) = v37;
          *(void *)(v102 + 272) = v36;
          *(void *)(v102 + 280) = v40;
          *(void *)(v102 + 288) = v39;
          *(unsigned char *)(v94 + 2) = BYTE2(v38);
          *(_WORD *)uint64_t v94 = v38;
          sub_2629035F0();
LABEL_56:
          OUTLINED_FUNCTION_96_7();
          OUTLINED_FUNCTION_13_4();
          return;
        }
        uint64_t v105 = v6;
        unint64_t v106 = v8;
        LOBYTE(v107) = v37;
        uint64_t v108 = v36;
        uint64_t v97 = v34;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_16_6();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_16_6();
        type metadata accessor for MediaAPIResourceRequest.MediaAPITypedLookupParameters();
        uint64_t v41 = OUTLINED_FUNCTION_92_6();
        sub_2628F4534(v41);
        swift_bridgeObjectRelease();
        uint64_t v17 = v102;
        *(void *)(v102 + 160) = v99;
        *(void *)(v102 + 168) = v11;
        *(void *)(v102 + 176) = v6;
        *(void *)(v102 + 184) = v8;
        *(void *)(v102 + 192) = v37;
        *(void *)(v102 + 200) = v36;
        *(void *)(v102 + 208) = v40;
        *(void *)(v102 + 216) = v39;
        *(unsigned char *)(v102 + 226) = BYTE2(v38);
        *(_WORD *)(v102 + 224) = v38;
        *(void *)(v102 + 632) = v6;
        *(void *)(v102 + 640) = v8;
        sub_262902C10();
        swift_bridgeObjectRetain();
        sub_262902C50();
        uint64_t v7 = sub_2628D2B98(v6, v8, v37, v36, v40, v39, v38);
        uint64_t v30 = v97;
      }
      while (v95);
LABEL_22:
      uint64_t v31 = v30 + 1;
      if (__OFADD__(v30, 1))
      {
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      if (v31 >= v93)
      {
LABEL_58:
        swift_release();
        OUTLINED_FUNCTION_24_9();
        sub_262902D70();
        swift_bridgeObjectRelease();
        uint64_t v62 = OUTLINED_FUNCTION_202_1();
        uint64_t v64 = sub_2628F4818(v62, v63, 0, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_26283EDD4(v64);
LABEL_60:
        uint64_t v69 = *(void *)(v17 + 792);
        uint64_t v70 = *(void *)(v17 + 784);
        sub_262901F70();
        sub_262901F60();
        swift_bridgeObjectRetain();
        uint64_t v71 = OUTLINED_FUNCTION_202_1();
        MEMORY[0x263E55010](v71);
        OUTLINED_FUNCTION_108_5();
        sub_262901F50();
        sub_262901F20();
        sub_262901F30();
        if (__swift_getEnumTagSinglePayload(v70, 1, v69) == 1)
        {
          uint64_t v72 = *(void *)(v17 + 784);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2628A9D48(v72);
          sub_26288E100();
          sub_2629021C0();
          sub_2629021B0();
          *(unsigned char *)(v17 + 228) = 16;
          OUTLINED_FUNCTION_275();
          sub_262902180();
          OUTLINED_FUNCTION_111_0();
          sub_2629021B0();
          sub_2628FEE4C(&qword_26A967038, MEMORY[0x263F06370]);
          sub_2629021A0();
          sub_2629021B0();
          sub_2629000B0(0, &qword_26A9652B0, (uint64_t (*)(void))sub_26288E100, (uint64_t)&type metadata for MusicContentError, MEMORY[0x263F78550]);
          sub_2628FEDE8(&qword_26A9652B8, &qword_26A9652B0, (uint64_t (*)(void))sub_26288E100, (uint64_t)&type metadata for MusicContentError);
          OUTLINED_FUNCTION_103_0();
          OUTLINED_FUNCTION_107_6();
          swift_willThrow();
          uint64_t v73 = OUTLINED_FUNCTION_108_5();
          v74(v73);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_13_4();
          __asm { BRAA            X1, X16 }
        }
        uint64_t v75 = *(void ***)(v17 + 760);
        (*(void (**)(void, void, void))(*(void *)(v17 + 800) + 32))(*(void *)(v17 + 816), *(void *)(v17 + 784), *(void *)(v17 + 792));
        char v76 = *v75;
        sub_262865FFC(0, &qword_26A967040);
        id v77 = sub_2628F81A0();
        *(void *)(v17 + 848) = v77;
        sub_262865FFC(0, &qword_26A967048);
        id v78 = sub_2628E8CDC(v76, v77);
        *(void *)(v17 + 856) = v78;
        uint64_t v79 = OUTLINED_FUNCTION_108_5();
        v80(v79);
        id v81 = objc_allocWithZone(MEMORY[0x263F891C8]);
        id v82 = v78;
        uint64_t v83 = OUTLINED_FUNCTION_108_5();
        id v85 = sub_2628FE7F4(v83, v84);
        *(void *)(v17 + 864) = v85;
        sub_262903090();
        *(void *)(v17 + 872) = 0;
        id v88 = objc_msgSend(self, sel_highPrioritySession);
        *(void *)(v17 + 880) = v88;
        *(void *)(v17 + 16) = v17;
        *(void *)(v17 + 56) = v17 + 712;
        *(void *)(v17 + 24) = sub_2628F772C;
        *(void *)(v17 + 624) = swift_continuation_init();
        *(void *)(v17 + 592) = MEMORY[0x263EF8330];
        *(void *)(v17 + 600) = 0x40000000;
        *(void *)(v17 + 608) = sub_2628F8234;
        *(void *)(v17 + 616) = &block_descriptor_1;
        objc_msgSend(v88, sel_enqueueDataRequest_withCompletionHandler_, v85, v17 + 592);
        OUTLINED_FUNCTION_13_4();
        goto _swift_continuation_await;
      }
      if (!*(void *)(v92 + 8 * v31))
      {
        if (v30 + 2 >= v93) {
          goto LABEL_58;
        }
        if (!*(void *)(v92 + 8 * (v30 + 2)))
        {
          uint64_t v32 = v30 + 3;
          if (v30 + 3 >= v93) {
            goto LABEL_58;
          }
          if (!*(void *)(v92 + 8 * v32)) {
            break;
          }
        }
      }
    }
    while (1)
    {
      uint64_t v33 = v32 + 1;
      if (__OFADD__(v32, 1)) {
        break;
      }
      if (v33 >= v93) {
        goto LABEL_58;
      }
      ++v32;
      if (*(void *)(v92 + 8 * v33)) {
        goto LABEL_32;
      }
    }
  }
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
_swift_continuation_await:
  MEMORY[0x270FA23F0](v7);
}

uint64_t sub_2628F772C()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_9_0();
  void *v3 = v2;
  void *v3 = *v0;
  uint64_t v5 = *(void *)(v4 + 48);
  *(void *)(v2 + 888) = v5;
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_2628F781C()
{
  uint64_t v1 = *(void **)(v0 + 880);
  uint64_t v2 = *(void **)(v0 + 712);
  *(void *)(v0 + 896) = v2;

  id v3 = objc_msgSend(v2, sel_bodyData);
  if (!v3)
  {
    uint64_t v36 = *(void **)(v0 + 864);
    unsigned int v38 = *(void **)(v0 + 856);
    uint64_t v40 = *(void **)(v0 + 848);
    uint64_t v14 = *(void *)(v0 + 800);
    uint64_t v33 = *(void *)(v0 + 792);
    uint64_t v34 = *(void *)(v0 + 816);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_26288E100();
    sub_2629021C0();
    sub_2629021B0();
    *(unsigned char *)(v0 + 227) = 17;
    sub_262902180();
    OUTLINED_FUNCTION_111_0();
    sub_2629021B0();
    sub_2628FEE4C(&qword_26A9669F0, MEMORY[0x263F06EA8]);
    sub_2629021A0();
    sub_2629021B0();
    OUTLINED_FUNCTION_68_7();
    sub_2629000B0(v15, v16, v17, v18, v19);
    OUTLINED_FUNCTION_68_7();
    sub_2628FEDE8(v20, v21, v22, v23);
    OUTLINED_FUNCTION_103_0();
    OUTLINED_FUNCTION_107_6();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v34, v33);
    OUTLINED_FUNCTION_24();
    v24();
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v0 + 872);
  uint64_t v6 = sub_2629020F0();
  unint64_t v8 = v7;

  *(void *)(v0 + 904) = v6;
  *(void *)(v0 + 912) = v8;
  sub_262901E90();
  OUTLINED_FUNCTION_25_8();
  sub_262901E80();
  sub_2628FEE94();
  sub_262901E70();
  if (v5)
  {
    uint64_t v9 = *(void **)(v0 + 864);
    uint64_t v10 = *(void **)(v0 + 856);
    uint64_t v11 = *(void *)(v0 + 832);
    uint64_t v41 = *(void *)(v0 + 824);
    uint64_t v42 = *(void *)(v0 + 840);
    uint64_t v37 = *(void **)(v0 + 848);
    uint64_t v39 = *(void *)(v0 + 816);
    uint64_t v12 = v2;
    uint64_t v13 = *(void *)(v0 + 800);
    uint64_t v35 = *(void *)(v0 + 792);
    swift_release();
    sub_26285500C(v6, v8);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v39, v35);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v42, v41);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_29_0();
    return v27();
  }
  swift_release();
  uint64_t v25 = *(void *)(v0 + 696);
  *(void *)(v0 + 920) = v25;
  uint64_t v26 = *(void *)(v0 + 704);
  *(void *)(v0 + 928) = v26;
  sub_262903090();
  *(void *)(v0 + 680) = v25;
  *(void *)(v0 + 688) = v26;
  uint64_t v29 = *(void *)(v0 + 736);
  *(void *)(v0 + 936) = v29;
  uint64_t v30 = *(void *)(v0 + 728);
  *(void *)(v0 + 944) = v30;
  uint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 952) = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_2628F7D1C;
  uint64_t v32 = *(void *)(v0 + 752);
  return sub_2628F82B0(v0 + 680, v29, v30, v32);
}

uint64_t sub_2628F7D1C()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 960) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628F7E40()
{
  uint64_t v1 = (void *)v0[112];
  uint64_t v2 = (void *)v0[108];
  uint64_t v3 = (void *)v0[107];
  uint64_t v4 = (void *)v0[106];
  uint64_t v5 = v0[105];
  uint64_t v6 = v0[104];
  uint64_t v7 = v0[102];
  uint64_t v12 = v0[103];
  uint64_t v8 = v0[100];
  uint64_t v9 = v0[99];
  sub_26285500C(v0[113], v0[114]);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_0();
  return v10();
}

uint64_t sub_2628F7F64()
{
  uint64_t v1 = (void *)v0[108];
  uint64_t v2 = (void *)v0[107];
  uint64_t v3 = (void *)v0[106];
  uint64_t v10 = (void *)v0[110];
  uint64_t v4 = v0[102];
  uint64_t v5 = v0[100];
  uint64_t v6 = v0[99];
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  OUTLINED_FUNCTION_24();
  v7();

  OUTLINED_FUNCTION_77_6();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v8();
}

uint64_t sub_2628F8074()
{
  uint64_t v1 = (void *)v0[112];
  uint64_t v2 = (void *)v0[108];
  uint64_t v3 = (void *)v0[107];
  uint64_t v4 = (void *)v0[106];
  uint64_t v11 = v0[105];
  uint64_t v5 = v0[104];
  uint64_t v6 = v0[103];
  sub_26285500C(v0[113], v0[114]);

  uint64_t v7 = OUTLINED_FUNCTION_202_1();
  v8(v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v11, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_77_6();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v9();
}

id sub_2628F81A0()
{
  uint64_t v0 = (void *)sub_262902CA0();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sub_262902CA0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_clientInfoForMusicKitRequestWithClientIdentifier_clientVersion_, v0, v1);

  return v2;
}

uint64_t sub_2628F8234(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = sub_262829230(0, &qword_26A9670D8);
  uint64_t v7 = *(void *)(a1 + 32);
  if (a3) {
    return sub_2628F1B2C(v7, (uint64_t)a3);
  }
  if (a2) {
    return sub_2628F1B98(v7, (uint64_t)a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_2628F82B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[196] = v4;
  v5[195] = a4;
  v5[194] = a3;
  v5[193] = a2;
  uint64_t v7 = *(void *)(a4 + 16);
  v5[197] = v7;
  v5[198] = *(void *)(v7 - 8);
  v5[199] = swift_task_alloc();
  v5[200] = *(void *)(a1 + 8);
  return MEMORY[0x270FA2498](sub_2628F8384, 0, 0);
}

uint64_t sub_2628F8384()
{
  uint64_t v79 = *(void *)(v0 + 1600);
  if (v79)
  {
    unint64_t v86 = (uint64_t *)(v0 + 1536);
    id v1 = objc_msgSend(**(id **)(v0 + 1568), sel_accountDSID);
    if (v1)
    {
      id v2 = v1;
      uint64_t v83 = sub_262902CD0();
      uint64_t v4 = v3;
    }
    else
    {
      uint64_t v83 = sub_262902CD0();
      uint64_t v4 = v7;
    }
    uint64_t v8 = MEMORY[0x263F8EE78];
    *(void *)(v0 + 1608) = v4;
    *(void *)(v0 + 1536) = v8;
    uint64_t v78 = qword_270DDB9D8;
    if (qword_270DDB9D8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = (void *)(v0 + 16);
      uint64_t v11 = v0 + 1424;
      uint64_t v92 = MEMORY[0x263F8EE78];
      uint64_t v82 = v4;
      do
      {
        if (v9 >= qword_270DDB9D8) {
          goto LABEL_96;
        }
        unint64_t v80 = v9;
        unint64_t v12 = MediaAPI.MediaAPIType.rawValue.getter();
        uint64_t v14 = sub_26282DFBC(v12, v13, v79);
        swift_bridgeObjectRelease();
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = sub_262902BD0();
        }
        uint64_t v16 = 0;
        unint64_t v81 = v80 + 1;
        uint64_t v84 = v15 + 64;
        uint64_t v17 = -1 << *(unsigned char *)(v15 + 32);
        if (-v17 < 64) {
          uint64_t v18 = ~(-1 << -(char)v17);
        }
        else {
          uint64_t v18 = -1;
        }
        unint64_t v19 = v18 & *(void *)(v15 + 64);
        int64_t v85 = (unint64_t)(63 - v17) >> 6;
        uint64_t v87 = v15;
        if (v19)
        {
LABEL_18:
          uint64_t v89 = (v19 - 1) & v19;
          int64_t v90 = v16;
          unint64_t v20 = __clz(__rbit64(v19)) | (v16 << 6);
          goto LABEL_39;
        }
        while (1)
        {
          int64_t v21 = v16 + 1;
          if (__OFADD__(v16, 1))
          {
            __break(1u);
            goto LABEL_95;
          }
          if (v21 >= v85) {
            break;
          }
          unint64_t v22 = *(void *)(v84 + 8 * v21);
          int64_t v23 = v16 + 1;
          if (v22) {
            goto LABEL_38;
          }
          OUTLINED_FUNCTION_105_6();
          if (v24 == v25) {
            break;
          }
          OUTLINED_FUNCTION_103_5();
          if (v22) {
            goto LABEL_38;
          }
          OUTLINED_FUNCTION_105_6();
          if (v24 == v25) {
            break;
          }
          OUTLINED_FUNCTION_103_5();
          if (v22) {
            goto LABEL_38;
          }
          OUTLINED_FUNCTION_105_6();
          if (v24 == v25) {
            break;
          }
          OUTLINED_FUNCTION_103_5();
          if (v22) {
            goto LABEL_38;
          }
          int64_t v27 = v26 + 4;
          if (v27 >= v85) {
            break;
          }
          unint64_t v22 = *(void *)(v84 + 8 * v27);
          if (!v22)
          {
            while (!__OFADD__(v27, 1))
            {
              OUTLINED_FUNCTION_105_6();
              if (v24 == v25) {
                goto LABEL_90;
              }
              OUTLINED_FUNCTION_103_5();
              int64_t v27 = v28 + 1;
              if (v22) {
                goto LABEL_38;
              }
            }
LABEL_95:
            __break(1u);
LABEL_96:
            __break(1u);
            JUMPOUT(0x2628F8CD8);
          }
          int64_t v23 = v27;
LABEL_38:
          uint64_t v89 = (v22 - 1) & v22;
          int64_t v90 = v23;
          unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
LABEL_39:
          uint64_t v29 = *(void *)(v0 + 1544);
          memcpy(v10, (const void *)(*(void *)(v15 + 56) + 672 * v20), 0x2A0uLL);
          uint64_t v31 = *(void *)(v0 + 16);
          uint64_t v30 = *(void *)(v0 + 24);
          *(void *)(v0 + 1520) = v31;
          *(void *)(v0 + 1528) = v30;
          swift_bridgeObjectRetain();
          sub_2628096B4((uint64_t)v10);
          OUTLINED_FUNCTION_93_5();
          uint64_t v91 = type metadata accessor for MediaAPIResourceRequest.Identifier();
          MEMORY[0x263E55D10](v0 + 1520, v29, MEMORY[0x263F8D310]);
          swift_bridgeObjectRelease();
          uint64_t v32 = *(void *)(v0 + 1440);
          sub_2628D2B0C(*(void *)(v0 + 1432), v32, *(void *)(v0 + 1448), *(void *)(v0 + 1456), *(void *)(v0 + 1464), *(void *)(v0 + 1472), *(void *)(v0 + 1480), *(void *)(v0 + 1488), *(unsigned __int16 *)(v11 + 72) | (*(unsigned __int8 *)(v11 + 74) << 16));
          if (!v32)
          {
            uint64_t v33 = *(void *)(v0 + 32);
            uint64_t v34 = *(void **)(v0 + 40);
            swift_bridgeObjectRetain();
            v35._countAndFlagsBits = v33;
            v35._object = v34;
            MediaAPI.MediaAPIType.init(rawValue:)(v35);
            uint64_t v36 = v93;
            char v37 = v93;
            uint64_t v38 = v31;
            uint64_t v39 = v30;
            uint64_t v11 = v93;
            switch(v93)
            {
              case 0u:
                goto LABEL_49;
              case 1u:
                swift_bridgeObjectRetain();
                char v37 = 64;
                goto LABEL_48;
              case 2u:
                OUTLINED_FUNCTION_23_9();
                uint64_t v11 = 1;
                goto LABEL_49;
              case 3u:
                swift_bridgeObjectRetain();
                char v37 = 65;
                goto LABEL_48;
              case 4u:
                OUTLINED_FUNCTION_23_9();
                uint64_t v11 = 2;
                goto LABEL_49;
              case 5u:
                swift_bridgeObjectRetain();
                char v37 = 66;
                goto LABEL_48;
              case 6u:
                OUTLINED_FUNCTION_23_9();
                uint64_t v11 = 3;
                goto LABEL_49;
              case 7u:
                swift_bridgeObjectRetain();
                char v37 = 67;
LABEL_48:
                uint64_t v38 = v83;
                uint64_t v39 = v4;
                uint64_t v11 = v31;
                uint64_t v36 = v30;
                goto LABEL_49;
              case 8u:
                OUTLINED_FUNCTION_23_9();
                uint64_t v11 = 4;
LABEL_49:
                swift_bridgeObjectRetain();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  OUTLINED_FUNCTION_87_3();
                  uint64_t v92 = v66;
                }
                unint64_t v41 = *(void *)(v92 + 16);
                unint64_t v40 = *(void *)(v92 + 24);
                if (v41 >= v40 >> 1)
                {
                  char v67 = OUTLINED_FUNCTION_109_5(v40);
                  sub_262825790(v67, v68, v69, v92);
                  uint64_t v92 = v70;
                }
                *(void *)(v92 + 16) = v41 + 1;
                uint64_t v42 = v92 + 40 * v41;
                *(void *)(v42 + 32) = v38;
                *(void *)(v42 + 40) = v39;
                *(void *)(v42 + 48) = v11;
                *(void *)(v42 + 56) = v36;
                *(unsigned char *)(v42 + 64) = v37;
                *unint64_t v86 = v92;
                uint64_t v11 = v0 + 1424;
                break;
              default:
                break;
            }
          }
          uint64_t v43 = *(void *)(v0 + 680);
          if (v43)
          {
            swift_bridgeObjectRetain();
            sub_262809920((uint64_t)v10);
            if (*(void *)(v43 + 16) && (uint64_t v44 = sub_26283F00C(0x736B63617274, 0xE600000000000000), (v45 & 1) != 0))
            {
              uint64_t v46 = (uint64_t *)(*(void *)(v43 + 56) + 40 * v44);
              uint64_t v47 = *v46;
              uint64_t v48 = v46[4];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              if (v48)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v49 = *(void *)(v47 + 16);
                if (v49)
                {
                  uint64_t v50 = v49 - 1;
                  uint64_t v51 = 32;
                  uint64_t v52 = (void *)(v0 + 688);
                  uint64_t v11 = v0 + 1424;
                  uint64_t v53 = v0 + 1504;
                  uint64_t v88 = v47;
                  while (1)
                  {
                    uint64_t v54 = *(void *)(v0 + 1544);
                    memcpy(v52, (const void *)(v47 + v51), 0x2A0uLL);
                    uint64_t v55 = *(void *)(v0 + 688);
                    uint64_t v56 = *(void *)(v0 + 696);
                    *(void *)(v0 + 1504) = v55;
                    *(void *)(v0 + 1512) = v56;
                    swift_bridgeObjectRetain();
                    sub_2628096B4((uint64_t)v52);
                    MEMORY[0x263E55D10](v53, v54, MEMORY[0x263F8D310], v91, MEMORY[0x263F8D320]);
                    swift_bridgeObjectRelease();
                    uint64_t v57 = *(void *)(v0 + 1368);
                    sub_2628D2B0C(*(void *)(v0 + 1360), v57, *(void *)(v0 + 1376), *(void *)(v0 + 1384), *(void *)(v0 + 1392), *(void *)(v0 + 1400), *(void *)(v0 + 1408), *(void *)(v0 + 1416), *(unsigned __int16 *)v11 | (*(unsigned __int8 *)(v11 + 2) << 16));
                    if (v57)
                    {
                      sub_262809920((uint64_t)v52);
                    }
                    else
                    {
                      swift_bridgeObjectRetain();
                      uint64_t v58 = sub_262903400();
                      swift_bridgeObjectRelease();
                      char v59 = 0;
                      uint64_t v60 = v55;
                      uint64_t v52 = (void *)v56;
                      uint64_t v53 = v58;
                      switch(v58)
                      {
                        case 0:
                          goto LABEL_79;
                        case 1:
                          OUTLINED_FUNCTION_114_5();
                          char v59 = 64;
                          goto LABEL_77;
                        case 2:
                          OUTLINED_FUNCTION_34_8();
                          uint64_t v58 = 1;
                          goto LABEL_79;
                        case 3:
                          OUTLINED_FUNCTION_114_5();
                          char v59 = 65;
                          goto LABEL_77;
                        case 4:
                          OUTLINED_FUNCTION_34_8();
                          uint64_t v58 = 2;
                          goto LABEL_79;
                        case 5:
                          OUTLINED_FUNCTION_114_5();
                          char v59 = 66;
                          goto LABEL_77;
                        case 6:
                          OUTLINED_FUNCTION_34_8();
                          uint64_t v58 = 3;
                          goto LABEL_79;
                        case 7:
                          OUTLINED_FUNCTION_114_5();
                          char v59 = 67;
LABEL_77:
                          uint64_t v60 = v83;
                          uint64_t v58 = v55;
                          uint64_t v53 = v56;
                          goto LABEL_79;
                        case 8:
                          OUTLINED_FUNCTION_34_8();
                          uint64_t v58 = 4;
LABEL_79:
                          swift_bridgeObjectRetain();
                          sub_262809920(v0 + 688);
                          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                          {
                            OUTLINED_FUNCTION_87_3();
                            uint64_t v92 = v64;
                          }
                          unint64_t v62 = *(void *)(v92 + 16);
                          unint64_t v61 = *(void *)(v92 + 24);
                          if (v62 >= v61 >> 1)
                          {
                            sub_262825790(v61 > 1, v62 + 1, 1, v92);
                            uint64_t v92 = v65;
                          }
                          *(void *)(v92 + 16) = v62 + 1;
                          uint64_t v63 = v92 + 40 * v62;
                          *(void *)(v63 + 32) = v60;
                          *(void *)(v63 + 40) = v56;
                          *(void *)(v63 + 48) = v58;
                          *(void *)(v63 + 56) = v53;
                          *(unsigned char *)(v63 + 64) = v59;
                          *unint64_t v86 = v92;
                          uint64_t v52 = (void *)(v0 + 688);
                          uint64_t v53 = v0 + 1504;
                          break;
                        default:
                          sub_262809920(v56);
                          break;
                      }
                      uint64_t v11 = v0 + 1424;
                    }
                    uint64_t v47 = v88;
                    if (!v50) {
                      break;
                    }
                    --v50;
                    v51 += 672;
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v4 = v82;
                  uint64_t v10 = (void *)(v0 + 16);
                  goto LABEL_62;
                }
              }
              swift_bridgeObjectRelease();
              uint64_t v11 = v0 + 1424;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            sub_262809920((uint64_t)v10);
          }
LABEL_62:
          uint64_t v15 = v87;
          unint64_t v19 = v89;
          uint64_t v16 = v90;
          if (v89) {
            goto LABEL_18;
          }
        }
LABEL_90:
        swift_release();
        unint64_t v9 = v81;
      }
      while (v81 != v78);
    }
    uint64_t v71 = *(void *)(v0 + 1576);
    uint64_t v72 = *(void *)(v0 + 1568);
    uint64_t v73 = *(void *)(v0 + 1560);
    uint64_t v74 = *(void *)(v0 + 1552);
    uint64_t v75 = *(void *)(v0 + 1544);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0 + 1584) + 16))(*(void *)(v0 + 1592), v72 + *(int *)(v73 + 36), v71);
    char v76 = (void *)swift_task_alloc();
    *(void *)(v0 + 1616) = v76;
    v76[2] = v71;
    v76[3] = *(void *)(v73 + 24);
    v76[4] = v86;
    v76[5] = v74;
    v76[6] = &unk_270DDB9C8;
    v76[7] = v79;
    v76[8] = v75;
    v76[9] = v83;
    v76[10] = v4;
    v76[11] = v72;
    id v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 1624) = v77;
    *id v77 = v0;
    v77[1] = sub_2628F8D20;
    return MEMORY[0x270F76968]();
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_36_0();
    return v5();
  }
}

uint64_t sub_2628F8D20()
{
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0();
  void *v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v5 = v4;
  *(void *)(v6 + 1632) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  v7();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_2628F8E94()
{
  OUTLINED_FUNCTION_52_0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_0();
  return v0();
}

uint64_t sub_2628F8EF4()
{
  OUTLINED_FUNCTION_52_0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628F8F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v153 = a7;
  uint64_t v154 = a8;
  uint64_t v173 = a6;
  uint64_t v143 = a5;
  uint64_t v139 = a4;
  uint64_t v145 = a3;
  uint64_t v175 = a1;
  uint64_t v137 = a9;
  uint64_t v149 = sub_2629028B0();
  uint64_t v177 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  unint64_t v148 = (char *)&v134 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x263F78680];
  sub_2628FFEAC(255, &qword_26A963D98, MEMORY[0x263F78680], MEMORY[0x263F8D8F0]);
  uint64_t v178 = sub_262902A40();
  uint64_t v176 = *(void *)(v178 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v178);
  v159 = (char *)&v134 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v163 = (char *)&v134 - v16;
  MEMORY[0x270FA5388](v15);
  v171 = (char *)&v134 - v17;
  uint64_t v161 = a11;
  uint64_t v18 = type metadata accessor for MediaAPIResourceRequest();
  uint64_t v135 = *(void *)(v18 - 8);
  uint64_t v136 = v18;
  uint64_t v134 = *(void *)(v135 + 64);
  MEMORY[0x270FA5388](v18);
  uint64_t v138 = (char *)&v134 - v19;
  sub_2629000B0(255, (unint64_t *)&qword_26A965260, (uint64_t (*)(void))sub_2628408E8, (uint64_t)&type metadata for MusicContent, MEMORY[0x263F78930]);
  uint64_t v20 = sub_262902A40();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  int64_t v23 = (char *)&v134 - v22;
  sub_2628FFEAC(255, &qword_26A963DA0, v12, MEMORY[0x263F8D488]);
  uint64_t v24 = sub_262902A40();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  int64_t v27 = (char *)&v134 - v26;
  uint64_t v160 = a10;
  uint64_t v28 = sub_262902B10();
  swift_bridgeObjectRetain();
  uint64_t v174 = v28;
  sub_262902AD0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v29 = v145 + 56;
  uint64_t v30 = 1 << *(unsigned char *)(v145 + 32);
  uint64_t v31 = -1;
  if (v30 < 64) {
    uint64_t v31 = ~(-1 << v30);
  }
  unint64_t v32 = v31 & *(void *)(v145 + 56);
  int64_t v33 = (unint64_t)(v30 + 63) >> 6;
  uint64_t v34 = (void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  int64_t v35 = 0;
  if (!v32) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v36 = __clz(__rbit64(v32));
  v32 &= v32 - 1;
  for (unint64_t i = v36 | (v35 << 6); ; unint64_t i = __clz(__rbit64(v39)) + (v35 << 6))
  {
    unint64_t v41 = (void *)(*(void *)(v145 + 48) + 16 * i);
    uint64_t v42 = v41[1];
    v192[0] = *v41;
    v192[1] = v42;
    swift_bridgeObjectRetain();
    sub_262902A80();
    (*v34)(v23, v20);
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v38 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      goto LABEL_120;
    }
    if (v38 >= v33) {
      goto LABEL_21;
    }
    unint64_t v39 = *(void *)(v29 + 8 * v38);
    ++v35;
    if (!v39)
    {
      int64_t v35 = v38 + 1;
      if (v38 + 1 >= v33) {
        goto LABEL_21;
      }
      unint64_t v39 = *(void *)(v29 + 8 * v35);
      if (!v39)
      {
        int64_t v35 = v38 + 2;
        if (v38 + 2 >= v33) {
          goto LABEL_21;
        }
        unint64_t v39 = *(void *)(v29 + 8 * v35);
        if (!v39) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v32 = (v39 - 1) & v39;
  }
  int64_t v40 = v38 + 3;
  if (v40 >= v33) {
    goto LABEL_21;
  }
  unint64_t v39 = *(void *)(v29 + 8 * v40);
  if (v39)
  {
    int64_t v35 = v40;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v35 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      goto LABEL_121;
    }
    if (v35 >= v33) {
      break;
    }
    unint64_t v39 = *(void *)(v29 + 8 * v35);
    ++v40;
    if (v39) {
      goto LABEL_18;
    }
  }
LABEL_21:
  swift_release();
  uint64_t v142 = *(void *)(v139 + 16);
  if (!v142)
  {
    uint64_t v176 = MEMORY[0x263F8EE78];
    goto LABEL_117;
  }
  uint64_t v141 = v139 + 32;
  v165 = (void (**)(char *, uint64_t))(v176 + 8);
  uint64_t v155 = (void (**)(char *, char *, uint64_t))(v176 + 16);
  uint64_t v146 = (void (**)(char *, uint64_t))(v177 + 8);
  uint64_t v147 = &v192[6];
  swift_bridgeObjectRetain();
  uint64_t v43 = 0;
  long long v158 = xmmword_26290F490;
  unint64_t v144 = (unint64_t)" MediaAPI.Resource.type: ";
  uint64_t v176 = MEMORY[0x263F8EE78];
  while (2)
  {
    uint64_t v150 = v43;
    int v140 = *(unsigned __int8 *)(v141 + v43);
    LOBYTE(v192[0]) = v140;
    unint64_t v44 = MediaAPI.MediaAPIType.rawValue.getter();
    uint64_t v46 = sub_26282DFBC(v44, v45, v143);
    swift_bridgeObjectRelease();
    if (!v46) {
      uint64_t v46 = sub_262902BD0();
    }
    int64_t v47 = 0;
    ++v150;
    uint64_t v48 = *(void *)(v46 + 64);
    uint64_t v156 = v46 + 64;
    uint64_t v49 = 1 << *(unsigned char *)(v46 + 32);
    if (v49 < 64) {
      uint64_t v50 = ~(-1 << v49);
    }
    else {
      uint64_t v50 = -1;
    }
    unint64_t v51 = v50 & v48;
    int64_t v157 = (unint64_t)(v49 + 63) >> 6;
    uint64_t v162 = v46;
    if (v51)
    {
LABEL_29:
      uint64_t v169 = (v51 - 1) & v51;
      int64_t v170 = v47;
      unint64_t v52 = __clz(__rbit64(v51)) | (v47 << 6);
      goto LABEL_46;
    }
    while (2)
    {
      int64_t v53 = v47 + 1;
      if (__OFADD__(v47, 1))
      {
        __break(1u);
        goto LABEL_119;
      }
      if (v53 >= v157) {
        goto LABEL_114;
      }
      unint64_t v54 = *(void *)(v156 + 8 * v53);
      int64_t v55 = v47 + 1;
      if (v54) {
        goto LABEL_45;
      }
      int64_t v55 = v47 + 2;
      if (v47 + 2 >= v157) {
        goto LABEL_114;
      }
      unint64_t v54 = *(void *)(v156 + 8 * v55);
      if (v54) {
        goto LABEL_45;
      }
      int64_t v55 = v47 + 3;
      if (v47 + 3 >= v157) {
        goto LABEL_114;
      }
      unint64_t v54 = *(void *)(v156 + 8 * v55);
      if (v54) {
        goto LABEL_45;
      }
      int64_t v55 = v47 + 4;
      if (v47 + 4 >= v157) {
        goto LABEL_114;
      }
      unint64_t v54 = *(void *)(v156 + 8 * v55);
      if (v54)
      {
LABEL_45:
        uint64_t v169 = (v54 - 1) & v54;
        int64_t v170 = v55;
        unint64_t v52 = __clz(__rbit64(v54)) + (v55 << 6);
LABEL_46:
        memcpy(v192, (const void *)(*(void *)(v46 + 56) + 672 * v52), 0x2A0uLL);
        uint64_t v57 = v192[0];
        uint64_t v58 = v192[1];
        v191[0] = v192[0];
        v191[1] = v192[1];
        swift_bridgeObjectRetain();
        sub_2628096B4((uint64_t)v192);
        uint64_t v172 = type metadata accessor for MediaAPIResourceRequest.Identifier();
        MEMORY[0x263E55D10](v190, v191, v173, MEMORY[0x263F8D310]);
        swift_bridgeObjectRelease();
        uint64_t v59 = v190[1];
        if (!v190[1])
        {
          uint64_t v67 = v192[2];
          uint64_t v68 = (void *)v192[3];
          swift_bridgeObjectRetain();
          v69._countAndFlagsBits = v67;
          v69._object = v68;
          MediaAPI.MediaAPIType.init(rawValue:)(v69);
          uint64_t v70 = LOBYTE(v190[0]);
          unsigned __int8 v71 = v190[0];
          uint64_t v72 = v57;
          uint64_t v73 = v58;
          uint64_t v74 = LOBYTE(v190[0]);
          switch(LOBYTE(v190[0]))
          {
            case 0:
              goto LABEL_56;
            case 1:
              uint64_t v73 = v154;
              swift_bridgeObjectRetain();
              unsigned __int8 v71 = 64;
              goto LABEL_55;
            case 2:
              uint64_t v70 = 0;
              unsigned __int8 v71 = 0;
              uint64_t v72 = v57;
              uint64_t v73 = v58;
              uint64_t v74 = 1;
              goto LABEL_56;
            case 3:
              uint64_t v73 = v154;
              swift_bridgeObjectRetain();
              unsigned __int8 v71 = 65;
              goto LABEL_55;
            case 4:
              uint64_t v70 = 0;
              unsigned __int8 v71 = 0;
              uint64_t v72 = v57;
              uint64_t v73 = v58;
              uint64_t v74 = 2;
              goto LABEL_56;
            case 5:
              uint64_t v73 = v154;
              swift_bridgeObjectRetain();
              unsigned __int8 v71 = 66;
              goto LABEL_55;
            case 6:
              uint64_t v70 = 0;
              unsigned __int8 v71 = 0;
              uint64_t v72 = v57;
              uint64_t v73 = v58;
              uint64_t v74 = 3;
              goto LABEL_56;
            case 7:
              uint64_t v73 = v154;
              swift_bridgeObjectRetain();
              unsigned __int8 v71 = 67;
LABEL_55:
              uint64_t v72 = v153;
              uint64_t v74 = v57;
              uint64_t v70 = v58;
              goto LABEL_56;
            case 8:
              uint64_t v70 = 0;
              unsigned __int8 v71 = 0;
              uint64_t v72 = v57;
              uint64_t v73 = v58;
              uint64_t v74 = 4;
LABEL_56:
              sub_2628FFEAC(0, &qword_26A963D80, (uint64_t)&type metadata for MusicContent.RawIdentifier, MEMORY[0x263F8E0F8]);
              uint64_t v75 = swift_allocObject();
              *(_OWORD *)(v75 + 16) = v158;
              *(void *)(v75 + 32) = v72;
              *(void *)(v75 + 40) = v73;
              *(void *)(v75 + 48) = v74;
              *(void *)(v75 + 56) = v70;
              *(unsigned char *)(v75 + 64) = v71;
              swift_bridgeObjectRetain();
              sub_262827674(v72, v73, v74, v70, v71);
              sub_262902A60();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              if (swift_isUniquelyReferenced_nonNull_native())
              {
                uint64_t v76 = v176;
              }
              else
              {
                sub_2628263F0();
                uint64_t v76 = v119;
              }
              unint64_t v77 = *(void *)(v76 + 16);
              if (v77 >= *(void *)(v76 + 24) >> 1)
              {
                sub_2628263F0();
                uint64_t v76 = v120;
              }
              *(void *)(v76 + 16) = v77 + 1;
              uint64_t v176 = v76;
              uint64_t v78 = v76 + 56 * v77;
              *(void *)(v78 + 32) = v57;
              *(void *)(v78 + 40) = v58;
              *(void *)(v78 + 48) = v72;
              *(void *)(v78 + 56) = v73;
              *(void *)(v78 + 64) = v74;
              *(void *)(v78 + 72) = v70;
              *(unsigned char *)(v78 + 80) = v71;
              goto LABEL_61;
            default:
              goto LABEL_122;
          }
        }
        unsigned int v60 = LOWORD(v190[8]) | (BYTE2(v190[8]) << 16);
        uint64_t v61 = v190[6];
        uint64_t v177 = v190[7];
        uint64_t v63 = v190[4];
        uint64_t v62 = v190[5];
        uint64_t v65 = v190[2];
        uint64_t v64 = v190[3];
        uint64_t v66 = v190[0];
        swift_bridgeObjectRetain();
        sub_262902A90();
        sub_2628D2B0C(v66, v59, v65, v64, v63, v62, v61, v177, v60);
        swift_bridgeObjectRelease();
LABEL_61:
        uint64_t v79 = v192[83];
        if (!v192[83])
        {
          sub_262809920((uint64_t)v192);
          (*v165)(v171, v178);
          goto LABEL_70;
        }
        if (*(void *)(v192[83] + 16))
        {
          swift_bridgeObjectRetain();
          uint64_t v80 = sub_26283F00C(0x736B63617274, 0xE600000000000000);
          if (v81)
          {
            uint64_t v82 = (uint64_t *)(*(void *)(v79 + 56) + 40 * v80);
            uint64_t v83 = *v82;
            uint64_t v84 = v82[4];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (!v84)
            {
              sub_2628D365C((uint64_t)v147, (uint64_t)v191);
              if (sub_26280A5F0((uint64_t)v191) == 1)
              {
LABEL_73:
                sub_262809920((uint64_t)v192);
                unint64_t v151 = 0xD000000000000012;
                unint64_t v152 = v144 | 0x8000000000000000;
              }
              else
              {
                sub_262805C78(v191, v190);
                switch(sub_262805C8C((uint64_t)v190))
                {
                  case 2u:
                    uint64_t v85 = sub_262805C98((uint64_t)v190);
                    unint64_t v86 = *(void *)(v85 + 456);
                    if (!v86) {
                      goto LABEL_73;
                    }
                    unint64_t v87 = *(void *)(v85 + 448);
                    break;
                  case 3u:
                    uint64_t v88 = sub_262805C98((uint64_t)v190);
                    unint64_t v86 = *(void *)(v88 + 416);
                    if (!v86) {
                      goto LABEL_73;
                    }
                    unint64_t v87 = *(void *)(v88 + 408);
                    break;
                  case 8u:
                    uint64_t v89 = sub_262805C98((uint64_t)v190);
                    unint64_t v86 = *(void *)(v89 + 400);
                    if (!v86) {
                      goto LABEL_73;
                    }
                    unint64_t v87 = *(void *)(v89 + 392);
                    break;
                  case 9u:
                    uint64_t v90 = sub_262805C98((uint64_t)v190);
                    unint64_t v86 = *(void *)(v90 + 408);
                    if (!v86) {
                      goto LABEL_73;
                    }
                    unint64_t v87 = *(void *)(v90 + 400);
                    break;
                  default:
                    goto LABEL_73;
                }
                unint64_t v151 = v87;
                unint64_t v152 = v86;
                swift_bridgeObjectRetain();
                sub_262809920((uint64_t)v192);
              }
              v190[84] = sub_262902F60();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v91 = *(void *)(v83 + 16);
              if (v91)
              {
                uint64_t v92 = v91 - 1;
                uint64_t v93 = 32;
                uint64_t v164 = v83;
                while (1)
                {
                  memcpy(v190, (const void *)(v83 + v93), 0x2A0uLL);
                  uint64_t v95 = v190[0];
                  uint64_t v94 = v190[1];
                  v179[0] = v190[0];
                  v179[1] = v190[1];
                  swift_bridgeObjectRetain();
                  sub_2628096B4((uint64_t)v190);
                  MEMORY[0x263E55D10](&v180, v179, v173, MEMORY[0x263F8D310], v172, MEMORY[0x263F8D320]);
                  swift_bridgeObjectRelease();
                  uint64_t v96 = v181;
                  uint64_t v177 = v93;
                  if (!v181)
                  {
                    swift_bridgeObjectRetain();
                    uint64_t v106 = sub_262903400();
                    swift_bridgeObjectRelease();
                    uint64_t v168 = v92;
                    int v107 = 0;
                    uint64_t v108 = v95;
                    uint64_t v104 = v94;
                    uint64_t v103 = v106;
                    switch(v106)
                    {
                      case 0:
                        goto LABEL_99;
                      case 1:
                        uint64_t v104 = v154;
                        swift_bridgeObjectRetain();
                        int v107 = 64;
                        goto LABEL_98;
                      case 2:
                        uint64_t v103 = 0;
                        int v107 = 0;
                        uint64_t v108 = v95;
                        uint64_t v104 = v94;
                        uint64_t v106 = 1;
                        goto LABEL_99;
                      case 3:
                        uint64_t v104 = v154;
                        swift_bridgeObjectRetain();
                        int v107 = 65;
                        goto LABEL_98;
                      case 4:
                        uint64_t v103 = 0;
                        int v107 = 0;
                        uint64_t v108 = v95;
                        uint64_t v104 = v94;
                        uint64_t v106 = 2;
                        goto LABEL_99;
                      case 5:
                        uint64_t v104 = v154;
                        swift_bridgeObjectRetain();
                        int v107 = 66;
                        goto LABEL_98;
                      case 6:
                        uint64_t v103 = 0;
                        int v107 = 0;
                        uint64_t v108 = v95;
                        uint64_t v104 = v94;
                        uint64_t v106 = 3;
                        goto LABEL_99;
                      case 7:
                        uint64_t v104 = v154;
                        swift_bridgeObjectRetain();
                        int v107 = 67;
LABEL_98:
                        uint64_t v108 = v153;
                        uint64_t v106 = v95;
                        uint64_t v103 = v94;
                        goto LABEL_99;
                      case 8:
                        uint64_t v103 = 0;
                        int v107 = 0;
                        uint64_t v108 = v95;
                        uint64_t v104 = v94;
                        uint64_t v106 = 4;
LABEL_99:
                        sub_2628FFEAC(0, &qword_26A963D80, (uint64_t)&type metadata for MusicContent.RawIdentifier, MEMORY[0x263F8E0F8]);
                        uint64_t v109 = swift_allocObject();
                        *(_OWORD *)(v109 + 16) = v158;
                        *(void *)(v109 + 32) = v108;
                        *(void *)(v109 + 40) = v104;
                        *(void *)(v109 + 48) = v106;
                        *(void *)(v109 + 56) = v103;
                        *(unsigned char *)(v109 + 64) = v107;
                        swift_bridgeObjectRetain();
                        LODWORD(v167) = v107;
                        sub_262827674(v108, v104, v106, v103, v107);
                        uint64_t v110 = v159;
                        sub_262902A60();
                        swift_bridgeObjectRelease();
                        (*v155)(v163, v110, v178);
                        sub_262902FD0();
                        sub_262902FB0();
                        swift_bridgeObjectRetain();
                        if (swift_isUniquelyReferenced_nonNull_native())
                        {
                          uint64_t v111 = v176;
                        }
                        else
                        {
                          sub_2628263F0();
                          uint64_t v111 = v114;
                        }
                        unint64_t v112 = *(void *)(v111 + 16);
                        if (v112 >= *(void *)(v111 + 24) >> 1)
                        {
                          sub_2628263F0();
                          uint64_t v111 = v115;
                        }
                        *(void *)(v111 + 16) = v112 + 1;
                        uint64_t v176 = v111;
                        uint64_t v113 = v111 + 56 * v112;
                        *(void *)(v113 + 32) = v95;
                        *(void *)(v113 + 40) = v94;
                        *(void *)(v113 + 48) = v108;
                        *(void *)(v113 + 56) = v104;
                        *(void *)(v113 + 64) = v106;
                        *(void *)(v113 + 72) = v103;
                        *(unsigned char *)(v113 + 80) = v167;
                        sub_262809920((uint64_t)v190);
                        (*v165)(v159, v178);
                        uint64_t v83 = v164;
                        uint64_t v103 = v168;
                        uint64_t v104 = v177;
                        if (v168) {
                          goto LABEL_104;
                        }
                        goto LABEL_110;
                      default:
                        sub_262809920((uint64_t)v190);
                        if (v106) {
                          goto LABEL_104;
                        }
                        goto LABEL_110;
                    }
                  }
                  uint64_t v97 = v92;
                  int v98 = v188 | (v189 << 16);
                  uint64_t v167 = v186;
                  uint64_t v168 = v187;
                  uint64_t v99 = v184;
                  uint64_t v166 = v185;
                  uint64_t v101 = v182;
                  uint64_t v100 = v183;
                  uint64_t v102 = v180;
                  sub_262809920((uint64_t)v190);
                  uint64_t v180 = v102;
                  uint64_t v181 = v96;
                  swift_bridgeObjectRetain();
                  sub_262902A90();
                  unsigned int v133 = v98;
                  uint64_t v103 = v97;
                  uint64_t v104 = v177;
                  uint64_t v105 = v102;
                  uint64_t v83 = v164;
                  sub_2628D2B0C(v105, v96, v101, v100, v99, v166, v167, v168, v133);
                  swift_bridgeObjectRelease();
                  sub_262902FD0();
                  sub_262902FB0();
                  if (!v103) {
                    break;
                  }
LABEL_104:
                  uint64_t v92 = v103 - 1;
                  uint64_t v93 = v104 + 672;
                }
              }
LABEL_110:
              swift_bridgeObjectRelease();
              if (qword_26A963360 != -1) {
                swift_once();
              }
              uint64_t v116 = v149;
              __swift_project_value_buffer(v149, (uint64_t)qword_26A97F5E0);
              unint64_t v117 = v148;
              sub_262902870();
              swift_bridgeObjectRelease();
              unint64_t v118 = v171;
              sub_262902AE0();
              swift_bridgeObjectRelease();
              (*v146)(v117, v116);
              (*v165)(v118, v178);
LABEL_70:
              uint64_t v46 = v162;
              unint64_t v51 = v169;
              int64_t v47 = v170;
              if (v169) {
                goto LABEL_29;
              }
              continue;
            }
            (*v165)(v171, v178);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_69:
            sub_262809920((uint64_t)v192);
            goto LABEL_70;
          }
          swift_bridgeObjectRelease();
        }
        (*v165)(v171, v178);
        goto LABEL_69;
      }
      break;
    }
    uint64_t v56 = v47 + 5;
    if (v47 + 5 < v157)
    {
      unint64_t v54 = *(void *)(v156 + 8 * v56);
      if (!v54)
      {
        while (1)
        {
          int64_t v55 = v56 + 1;
          if (__OFADD__(v56, 1)) {
            break;
          }
          if (v55 >= v157) {
            goto LABEL_114;
          }
          unint64_t v54 = *(void *)(v156 + 8 * v55);
          ++v56;
          if (v54) {
            goto LABEL_45;
          }
        }
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        v190[0] = 0;
        v190[1] = 0xE000000000000000;
        sub_2629032A0();
        sub_262902D70();
        LOBYTE(v191[0]) = v140;
        sub_262903330();
        sub_262902D70();
        swift_bridgeObjectRetain();
        sub_262902D70();
        swift_bridgeObjectRelease();
        sub_262903390();
        __break(1u);
        JUMPOUT(0x2628FA334);
      }
      int64_t v55 = v47 + 5;
      goto LABEL_45;
    }
LABEL_114:
    swift_release();
    uint64_t v43 = v150;
    if (v150 != v142) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
LABEL_117:
  uint64_t v121 = v135;
  uint64_t v122 = v136;
  (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v138, v137, v136);
  unint64_t v123 = (*(unsigned __int8 *)(v121 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
  unint64_t v124 = (v134 + v123 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v125 = (v124 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v126 = (v125 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v127 = (char *)swift_allocObject();
  uint64_t v128 = v161;
  *((void *)v127 + 2) = v160;
  *((void *)v127 + 3) = v128;
  uint64_t v129 = v176;
  *((void *)v127 + 4) = v173;
  *((void *)v127 + 5) = v129;
  (*(void (**)(char *, char *, uint64_t))(v121 + 32))(&v127[v123], v138, v122);
  *(void *)&v127[v124] = v139;
  *(void *)&v127[v125] = v143;
  *(void *)&v127[v126] = v145;
  unint64_t v130 = (uint64_t *)&v127[(v126 + 15) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v131 = v154;
  *unint64_t v130 = v153;
  v130[1] = v131;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_262902AB0();
  return swift_release();
}

uint64_t sub_2628FA39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = v12;
  v8[16] = v13;
  v8[13] = a8;
  v8[14] = v11;
  v8[11] = a6;
  v8[12] = a7;
  v8[9] = a4;
  v8[10] = a5;
  v8[7] = a2;
  v8[8] = a3;
  v8[6] = a1;
  v8[17] = *(void *)(v12 - 8);
  v8[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2628FA470, 0, 0);
}

uint64_t sub_2628FA470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = v14[7];
  uint64_t v16 = sub_262902BD0();
  v14[4] = v16;
  uint64_t v17 = v14 + 4;
  uint64_t v80 = v14;
  uint64_t v81 = v15 + 64;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << *(unsigned char *)(v15 + 32);
  if (-v19 < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  unint64_t v20 = v18 & *(void *)(v15 + 64);
  int64_t v82 = (unint64_t)(63 - v19) >> 6;
  uint64_t v84 = v15;
  uint64_t v21 = swift_bridgeObjectRetain();
  int64_t v29 = 0;
  uint64_t v83 = v17;
  while (1)
  {
    uint64_t v91 = (void *)v16;
    if (v20)
    {
      uint64_t v85 = (v20 - 1) & v20;
      int64_t v86 = v29;
      unint64_t v30 = __clz(__rbit64(v20)) | (v29 << 6);
      goto LABEL_18;
    }
    int64_t v31 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      goto LABEL_39;
    }
    if (v31 >= v82) {
      break;
    }
    unint64_t v32 = *(void *)(v81 + 8 * v31);
    int64_t v33 = v29 + 1;
    if (!v32)
    {
      int64_t v33 = v29 + 2;
      if (v29 + 2 >= v82) {
        break;
      }
      unint64_t v32 = *(void *)(v81 + 8 * v33);
      if (!v32)
      {
        uint64_t v34 = v29 + 3;
        if (v29 + 3 >= v82) {
          break;
        }
        unint64_t v32 = *(void *)(v81 + 8 * v34);
        if (!v32)
        {
          while (1)
          {
            int64_t v33 = v34 + 1;
            if (__OFADD__(v34, 1)) {
              goto LABEL_40;
            }
            if (v33 >= v82) {
              goto LABEL_27;
            }
            unint64_t v32 = *(void *)(v81 + 8 * v33);
            ++v34;
            if (v32) {
              goto LABEL_17;
            }
          }
        }
        int64_t v33 = v29 + 3;
      }
    }
LABEL_17:
    uint64_t v85 = (v32 - 1) & v32;
    int64_t v86 = v33;
    unint64_t v30 = __clz(__rbit64(v32)) + (v33 << 6);
LABEL_18:
    int64_t v35 = (uint64_t *)(*(void *)(v84 + 48) + 16 * v30);
    uint64_t v37 = *v35;
    uint64_t v36 = v35[1];
    uint64_t v38 = *(void *)(v84 + 56) + 72 * v30;
    uint64_t v39 = *(void *)(v38 + 8);
    uint64_t v90 = *(void *)v38;
    uint64_t v40 = *(void *)(v38 + 16);
    uint64_t v41 = *(void *)(v38 + 24);
    uint64_t v42 = *(void *)(v38 + 32);
    uint64_t v43 = *(void *)(v38 + 40);
    uint64_t v45 = *(void *)(v38 + 48);
    uint64_t v44 = *(void *)(v38 + 56);
    int v46 = *(unsigned __int16 *)(v38 + 64) | (*(unsigned __int8 *)(v38 + 66) << 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v89 = v40;
    uint64_t v87 = v44;
    uint64_t v88 = v45;
    uint64_t v47 = v44;
    unsigned int v48 = v46;
    uint64_t v49 = v37;
    sub_2628FE8A4(v40, v41, v42, v43, v45, v47, v48);
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v83 = 0x8000000000000000;
    uint64_t v21 = sub_26283F00C(v37, v36);
    if (__OFADD__(v91[2], (v22 & 1) == 0))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      return MEMORY[0x270F76978](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
    unint64_t v50 = v21;
    char v51 = v22;
    sub_262900010(0, &qword_26A967088);
    uint64_t v21 = sub_262903340();
    uint64_t v16 = (uint64_t)v91;
    if (v21)
    {
      uint64_t v21 = sub_26283F00C(v49, v36);
      if ((v51 & 1) != (v22 & 1))
      {
        OUTLINED_FUNCTION_74_7();
        return sub_262903670();
      }
      unint64_t v50 = v21;
    }
    if (v51)
    {
      unint64_t v52 = (void *)(v91[7] + 16 * v50);
      swift_bridgeObjectRelease();
      *unint64_t v52 = v90;
      v52[1] = v39;
    }
    else
    {
      v91[(v50 >> 6) + 8] |= 1 << v50;
      int64_t v53 = (uint64_t *)(v91[6] + 16 * v50);
      *int64_t v53 = v49;
      v53[1] = v36;
      unint64_t v54 = (void *)(v91[7] + 16 * v50);
      *unint64_t v54 = v90;
      v54[1] = v39;
      uint64_t v55 = v91[2];
      BOOL v56 = __OFADD__(v55, 1);
      uint64_t v57 = v55 + 1;
      if (v56) {
        goto LABEL_38;
      }
      v91[2] = v57;
      swift_bridgeObjectRetain();
    }
    *uint64_t v83 = v91;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_2628D2B98(v89, v41, v42, v43, v88, v87, v48);
    unint64_t v20 = v85;
    int64_t v29 = v86;
  }
LABEL_27:
  uint64_t v58 = v80[8];
  swift_release();
  uint64_t v59 = *(void *)(v58 + 16);
  v80[19] = v59;
  if (v59)
  {
    uint64_t v60 = v80[8];
    v80[20] = 0;
    v80[21] = *(void *)(v60 + 32);
    v80[22] = *(void *)(v60 + 40);
    uint64_t v62 = *(void *)(v60 + 64);
    uint64_t v61 = *(void *)(v60 + 72);
    uint64_t v64 = *(void *)(v60 + 48);
    uint64_t v63 = *(void *)(v60 + 56);
    unsigned __int8 v65 = *(unsigned char *)(v60 + 80);
    swift_bridgeObjectRetain();
    sub_2628FFEAC(0, &qword_26A963D80, (uint64_t)&type metadata for MusicContent.RawIdentifier, MEMORY[0x263F8E0F8]);
    uint64_t v66 = swift_allocObject();
    v80[23] = v66;
    *(_OWORD *)(v66 + 16) = xmmword_26290F490;
    *(void *)(v66 + 32) = v64;
    *(void *)(v66 + 40) = v63;
    *(void *)(v66 + 48) = v62;
    *(void *)(v66 + 56) = v61;
    *(unsigned char *)(v66 + 64) = v65;
    swift_bridgeObjectRetain();
    sub_262827674(v64, v63, v62, v61, v65);
    uint64_t v67 = (void *)swift_task_alloc();
    v80[24] = v67;
    sub_262902B10();
    *uint64_t v67 = v80;
    v67[1] = sub_2628FAA30;
    OUTLINED_FUNCTION_74_7();
    return MEMORY[0x270F76978](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
  }
  uint64_t v71 = v80[17];
  uint64_t v70 = v80[18];
  uint64_t v72 = v80[15];
  uint64_t v73 = v80[16];
  uint64_t v74 = v80[9];
  uint64_t v75 = type metadata accessor for MediaAPIResourceRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16))(v70, v74 + *(int *)(v75 + 36), v72);
  v80[26] = *(void *)(v73 + 64);
  v80[27] = (v73 + 64) & 0xFFFFFFFFFFFFLL | 0x22BE000000000000;
  sub_262902170();
  v80[28] = sub_262902160();
  sub_2628FEE4C((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  sub_262902FE0();
  OUTLINED_FUNCTION_74_7();
  return MEMORY[0x270FA2498](v76, v77, v78);
}

uint64_t sub_2628FAA30()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_120_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2628FAB50()
{
  OUTLINED_FUNCTION_70_0();
  id v1 = (uint64_t (*)(uint64_t, uint64_t))v0[26];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  swift_release();
  v0[29] = v1(v3, v2);
  OUTLINED_FUNCTION_24();
  v4();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_2628FABF0()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 240) = v5;
  long long v6 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v0 + 120);
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = v0 + 32;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 72) = v2;
  *(void *)(v5 + 80) = v1;
  uint64_t v9 = (uint64_t (*)(void))((char *)&dword_26A9670A0 + dword_26A9670A0);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2628FAD10;
  return v9();
}

uint64_t sub_2628FAD10()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *long long v6 = v5;
  *(void *)(v3 + 256) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628FADFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_96_3();
  uint64_t v16 = v14[2];
  uint64_t v15 = v14[3];
  uint64_t v17 = v14[22];
  if (v15)
  {
    uint64_t v18 = v14[21];
    uint64_t v19 = v14[4];
    swift_isUniquelyReferenced_nonNull_native();
    v14[4] = 0x8000000000000000;
    v14[5] = v19;
    uint64_t v20 = sub_26283F00C(v18, v17);
    if (__OFADD__(*(void *)(v19 + 16), (v21 & 1) == 0))
    {
      __break(1u);
    }
    else
    {
      unint64_t v28 = v20;
      char v29 = v21;
      sub_262900010(0, &qword_26A967088);
      uint64_t v20 = sub_262903340();
      if (v20)
      {
        uint64_t v20 = sub_26283F00C(v14[21], v14[22]);
        if ((v29 & 1) != (v21 & 1))
        {
          OUTLINED_FUNCTION_5_3();
          return sub_262903670();
        }
        unint64_t v28 = v20;
      }
      unint64_t v32 = (void *)v14[5];
      if (v29)
      {
        int64_t v33 = (void *)(v32[7] + 16 * v28);
        swift_bridgeObjectRelease();
        *int64_t v33 = v16;
        v33[1] = v15;
LABEL_13:
        v14[4] = v32;
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      uint64_t v35 = v14[21];
      uint64_t v34 = v14[22];
      v32[(v28 >> 6) + 8] |= 1 << v28;
      uint64_t v36 = (void *)(v32[6] + 16 * v28);
      *uint64_t v36 = v35;
      v36[1] = v34;
      uint64_t v37 = (void *)(v32[7] + 16 * v28);
      *uint64_t v37 = v16;
      v37[1] = v15;
      uint64_t v38 = v32[2];
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (!v39)
      {
        v32[2] = v40;
        swift_bridgeObjectRetain();
        goto LABEL_13;
      }
    }
    __break(1u);
    return MEMORY[0x270F76978](v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14);
  }
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v41 = v14[20] + 1;
  if (v41 != v14[19])
  {
    v14[20] = v41;
    uint64_t v52 = v14[8] + 56 * v41;
    v14[21] = *(void *)(v52 + 32);
    v14[22] = *(void *)(v52 + 40);
    uint64_t v54 = *(void *)(v52 + 64);
    uint64_t v53 = *(void *)(v52 + 72);
    uint64_t v56 = *(void *)(v52 + 48);
    uint64_t v55 = *(void *)(v52 + 56);
    unsigned __int8 v57 = *(unsigned char *)(v52 + 80);
    sub_2628FFEAC(0, &qword_26A963D80, (uint64_t)&type metadata for MusicContent.RawIdentifier, MEMORY[0x263F8E0F8]);
    uint64_t v58 = swift_allocObject();
    v14[23] = v58;
    *(_OWORD *)(v58 + 16) = xmmword_26290F490;
    *(void *)(v58 + 32) = v56;
    *(void *)(v58 + 40) = v55;
    *(void *)(v58 + 48) = v54;
    *(void *)(v58 + 56) = v53;
    *(unsigned char *)(v58 + 64) = v57;
    swift_bridgeObjectRetain();
    sub_262827674(v56, v55, v54, v53, v57);
    uint64_t v59 = (void *)swift_task_alloc();
    v14[24] = v59;
    sub_262902B10();
    *uint64_t v59 = v14;
    v59[1] = sub_2628FAA30;
    OUTLINED_FUNCTION_5_3();
    return MEMORY[0x270F76978](v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14);
  }
  swift_bridgeObjectRelease();
  uint64_t v43 = v14[17];
  uint64_t v42 = v14[18];
  uint64_t v45 = v14[15];
  uint64_t v44 = v14[16];
  uint64_t v46 = v14[9];
  uint64_t v47 = type metadata accessor for MediaAPIResourceRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v42, v46 + *(int *)(v47 + 36), v45);
  v14[26] = *(void *)(v44 + 64);
  v14[27] = (v44 + 64) & 0xFFFFFFFFFFFFLL | 0x22BE000000000000;
  sub_262902170();
  v14[28] = sub_262902160();
  sub_2628FEE4C((unint64_t *)&qword_26A9633A0, MEMORY[0x263F78538]);
  sub_262902FE0();
  OUTLINED_FUNCTION_5_3();
  return MEMORY[0x270FA2498](v48, v49, v50);
}

uint64_t sub_2628FB1DC()
{
  OUTLINED_FUNCTION_52_0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628FB244()
{
  OUTLINED_FUNCTION_52_0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_36_0();
  return v0();
}

uint64_t sub_2628FB2A8()
{
  OUTLINED_FUNCTION_52_0();
  swift_release();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628FB320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 19456) = v15;
  *(_OWORD *)(v8 + 19440) = v14;
  *(void *)(v8 + 19432) = a8;
  *(void *)(v8 + 19424) = a7;
  *(void *)(v8 + 19416) = a6;
  *(void *)(v8 + 19408) = a5;
  *(void *)(v8 + 19400) = a4;
  *(void *)(v8 + 19392) = a3;
  *(void *)(v8 + 19384) = a2;
  sub_2629000B0(0, &qword_26A965240, (uint64_t (*)(void))sub_26288E100, (uint64_t)&type metadata for MusicContentError, MEMORY[0x263F78548]);
  *(void *)(v8 + 19464) = v9;
  *(void *)(v8 + 19472) = swift_task_alloc();
  sub_2629000B0(0, &qword_26A965258, (uint64_t (*)(void))sub_2628408E8, (uint64_t)&type metadata for MusicContent, MEMORY[0x263F78928]);
  *(void *)(v8 + 19480) = v10;
  *(void *)(v8 + 19488) = *(void *)(v10 - 8);
  *(void *)(v8 + 19496) = swift_task_alloc();
  *(void *)(v8 + 19504) = swift_task_alloc();
  sub_2629000B0(0, (unint64_t *)&qword_26A965260, (uint64_t (*)(void))sub_2628408E8, (uint64_t)&type metadata for MusicContent, MEMORY[0x263F78930]);
  *(void *)(v8 + 19512) = v11;
  *(void *)(v8 + 19520) = *(void *)(v11 - 8);
  *(void *)(v8 + 19528) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2628FB54C, 0, 0);
}

uint64_t sub_2628FB54C()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 19392) + 16);
  *(void *)(v0 + 19536) = v2;
  if (!v2)
  {
LABEL_53:
    OUTLINED_FUNCTION_61_6();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_84_0();
    __asm { BRAA            X1, X16 }
  }
  OUTLINED_FUNCTION_98_7();
  __dst = v3;
  uint64_t v62 = v4;
  *(_DWORD *)(v0 + 19268) = *MEMORY[0x263F78920];
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
LABEL_3:
  *(void *)(v0 + 19544) = v6;
  uint64_t v7 = v5 + v6;
  uint64_t v8 = 0xE500000000000000;
  uint64_t v9 = 0x73676E6F73;
  switch(*(unsigned char *)(v7 + 32))
  {
    case 1:
      uint64_t v8 = 0xED000073676E6F73;
      goto LABEL_9;
    case 2:
      uint64_t v8 = 0xEC000000736F6564;
      uint64_t v9 = OUTLINED_FUNCTION_52_7();
      break;
    case 3:
      uint64_t v9 = OUTLINED_FUNCTION_82_6();
      uint64_t v8 = 0x8000000262903FD0;
      break;
    case 4:
      uint64_t v8 = 0xE600000000000000;
      uint64_t v9 = OUTLINED_FUNCTION_269_0();
      break;
    case 5:
      uint64_t v8 = 0xEE00736D75626C61;
LABEL_9:
      uint64_t v9 = OUTLINED_FUNCTION_51_8();
      break;
    case 6:
      uint64_t v8 = 0xE900000000000073;
      uint64_t v9 = OUTLINED_FUNCTION_97_1();
      break;
    case 7:
      uint64_t v8 = 0x8000000262904010;
      uint64_t v9 = OUTLINED_FUNCTION_102_6();
      break;
    case 8:
      uint64_t v8 = 0xE800000000000000;
      uint64_t v9 = OUTLINED_FUNCTION_147_0();
      break;
    case 9:
      uint64_t v8 = 0xE600000000000000;
      uint64_t v9 = OUTLINED_FUNCTION_76_6();
      break;
    case 0xA:
      uint64_t v9 = OUTLINED_FUNCTION_46_6();
      uint64_t v8 = 0xEF736973796C616ELL;
      break;
    case 0xB:
      uint64_t v9 = OUTLINED_FUNCTION_45_8();
      uint64_t v8 = 0xEE00736973796C61;
      break;
    default:
      break;
  }
  uint64_t v10 = *(void *)(v0 + 19400);
  if (*(void *)(v10 + 16) && (sub_26283F00C(v9, v8), (v11 & 1) != 0))
  {
    OUTLINED_FUNCTION_43_8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_262902BD0();
  }
  uint64_t v12 = 0;
  *(void *)(v0 + 19552) = v10;
  *(unsigned char *)(v0 + 19266) = *(unsigned char *)(v10 + 32);
  OUTLINED_FUNCTION_40_7();
  unint64_t v15 = v13 & v14;
  while (1)
  {
    do
    {
      if (v15)
      {
        unint64_t v16 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v17 = v16 | (v12 << 6);
        uint64_t v18 = *(void *)(v0 + 19552);
        goto LABEL_40;
      }
      if (__OFADD__(v12, 1))
      {
        __break(1u);
        goto LABEL_74;
      }
      uint64_t v19 = OUTLINED_FUNCTION_91_6();
      if (v22 == v23) {
        goto LABEL_43;
      }
      uint64_t v24 = v19 + 64;
      uint64_t v12 = v21;
      if (!*(void *)(v19 + 64 + 8 * v21))
      {
        int64_t v25 = v20 >> 6;
        uint64_t v12 = v21 + 1;
        if (v21 + 1 >= v25) {
          goto LABEL_43;
        }
        if (!*(void *)(v24 + 8 * v12))
        {
          uint64_t v12 = v21 + 2;
          if (v21 + 2 >= v25) {
            goto LABEL_43;
          }
          if (!*(void *)(v24 + 8 * v12))
          {
            uint64_t v12 = v21 + 3;
            if (v21 + 3 >= v25) {
              goto LABEL_43;
            }
            if (!*(void *)(v24 + 8 * v12))
            {
              uint64_t v26 = v21 + 4;
              if (v26 >= v25)
              {
LABEL_43:
                uint64_t v36 = *(void *)(v0 + 19544);
                uint64_t v37 = *(void *)(v0 + 19536);
                swift_release();
                if (v36 + 1 == v37)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_53;
                }
                uint64_t v6 = *(void *)(v0 + 19544) + 1;
                uint64_t v5 = *(void *)(v0 + 19392);
                goto LABEL_3;
              }
              if (!*(void *)(v24 + 8 * v26))
              {
                while (1)
                {
                  uint64_t v12 = v26 + 1;
                  if (__OFADD__(v26, 1)) {
                    break;
                  }
                  if (v12 >= v25) {
                    goto LABEL_43;
                  }
                  ++v26;
                  if (*(void *)(v24 + 8 * v12)) {
                    goto LABEL_39;
                  }
                }
LABEL_74:
                __break(1u);
                JUMPOUT(0x2628FBC30);
              }
              uint64_t v12 = v26;
            }
          }
        }
      }
LABEL_39:
      OUTLINED_FUNCTION_90_6();
      unint64_t v15 = v27 & v28;
      unint64_t v17 = v29 + (v12 << 6);
LABEL_40:
      *(void *)(v0 + 19568) = v12;
      *(void *)(v0 + 19560) = v15;
      uint64_t v30 = *(uint64_t **)(v0 + 19408);
      memcpy(v1, (const void *)(*(void *)(v18 + 56) + 672 * v17), 0x2A0uLL);
      uint64_t v31 = *v30;
    }
    while (!*(void *)(v31 + 16));
    uint64_t v33 = *(void *)(v0 + 16);
    uint64_t v32 = *(void *)(v0 + 24);
    *(void *)(v0 + 19576) = v33;
    *(void *)(v0 + 19584) = v32;
    sub_2628096B4((uint64_t)v1);
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_26283F00C(v33, v32);
    if (v35) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_262809920((uint64_t)v1);
  }
  uint64_t v38 = *(void *)(v0 + 19416);
  OUTLINED_FUNCTION_53_7(v34);
  uint64_t v40 = *(void *)(v39 + 8);
  *(void *)(v0 + 19600) = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_2628F62BC(v31, v40, v38))
  {
    *(void *)(v0 + 19328) = v31;
    *(void *)(v0 + 19336) = v40;
    uint64_t v41 = (void *)swift_task_alloc();
    *(void *)(v0 + 19608) = v41;
    sub_262902B10();
    *uint64_t v41 = v0;
    v41[1] = sub_2628FBC90;
    OUTLINED_FUNCTION_110_6();
    OUTLINED_FUNCTION_84_0();
    return MEMORY[0x270F76988]();
  }
  else
  {
    uint64_t v43 = *(void *)(v0 + 32);
    uint64_t v44 = *(void *)(v0 + 40);
    *(void *)(v0 + 19640) = v43;
    *(void *)(v0 + 19648) = v44;
    OUTLINED_FUNCTION_60_5();
    sub_2629032A0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 19312) = v43;
    *(void *)(v0 + 19320) = v44;
    OUTLINED_FUNCTION_59_7();
    sub_262902D70();
    swift_bridgeObjectRetain();
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_7();
    sub_2628D365C(v0 + 64, (uint64_t)v62);
    if (sub_26280A5F0((uint64_t)v62) == 1)
    {
LABEL_66:
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_262805C78(v62, __dst);
      switch(sub_262805C8C((uint64_t)__dst))
      {
        case 1u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v49 + 360);
          goto LABEL_64;
        case 2u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v50 + 224);
          goto LABEL_64;
        case 3u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v51 + 208);
          goto LABEL_64;
        case 4u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v52 + 296);
          goto LABEL_64;
        case 5u:
          uint64_t v46 = (void *)(sub_262805C98((uint64_t)__dst) + 8);
          goto LABEL_64;
        case 7u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v53 + 216);
          goto LABEL_64;
        case 8u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v54 + 200);
          goto LABEL_64;
        case 9u:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v55 + 192);
          goto LABEL_64;
        case 0xAu:
          OUTLINED_FUNCTION_100_6();
          goto LABEL_72;
        case 0xBu:
          OUTLINED_FUNCTION_99_6();
LABEL_72:
          sub_262805C98((uint64_t)__dst);
          break;
        default:
          OUTLINED_FUNCTION_18_8();
          uint64_t v46 = (void *)(v45 + 392);
LABEL_64:
          if (!*v46) {
            goto LABEL_66;
          }
          swift_bridgeObjectRetain();
          break;
      }
    }
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_9();
    uint64_t v56 = swift_task_alloc();
    unsigned __int8 v57 = (void *)OUTLINED_FUNCTION_88_7(v56);
    *unsigned __int8 v57 = v58;
    v57[1] = sub_2628FC7F4;
    OUTLINED_FUNCTION_4_12();
    OUTLINED_FUNCTION_84_0();
    return MusicContentStorage.Operations.updateDebugDescription(_:for:)();
  }
}

uint64_t sub_2628FBC90()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 19616) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_262809920(v3 + 16);
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628FBD80()
{
  OUTLINED_FUNCTION_96_3();
  uint64_t v57 = v0;
  int v1 = *(_DWORD *)(v0 + 19268);
  uint64_t v2 = *(void *)(v0 + 19504);
  uint64_t v3 = *(void *)(v0 + 19488);
  uint64_t v4 = *(void *)(v0 + 19480);
  sub_262902930();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4) != v1)
  {
    uint64_t v52 = *(void *)(v0 + 19528);
    uint64_t v53 = *(void *)(v0 + 19520);
    uint64_t v55 = *(void *)(v0 + 19512);
    uint64_t v17 = *(void *)(v0 + 19504);
    uint64_t v18 = *(void *)(v0 + 19488);
    uint64_t v19 = *(void *)(v0 + 19480);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_262809920(v0 + 16);
    unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v20(v17, v19);
    sub_26288E100();
    sub_2629021C0();
    sub_2629021B0();
    *(unsigned char *)(v0 + 19265) = 1;
    sub_262902180();
    OUTLINED_FUNCTION_111_0();
    sub_2629021B0();
    sub_262902930();
    uint64_t v21 = sub_262902920();
    uint64_t v23 = v22;
    uint64_t v24 = OUTLINED_FUNCTION_202_1();
    ((void (*)(uint64_t))v20)(v24);
    *(void *)(v0 + 19344) = v21;
    *(void *)(v0 + 19352) = v23;
    sub_2629021A0();
    swift_bridgeObjectRelease();
    sub_2629021B0();
    OUTLINED_FUNCTION_95_4();
    sub_2629000B0(v25, v26, v27, (uint64_t)&type metadata for MusicContentError, v28);
    OUTLINED_FUNCTION_95_4();
    sub_2628FEDE8(v29, v30, v31, (uint64_t)&type metadata for MusicContentError);
    OUTLINED_FUNCTION_103_0();
    sub_2629021D0();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v55);
    swift_release();
    OUTLINED_FUNCTION_15_8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_5_3();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v5 = *(uint64_t **)(v0 + 19504);
  (*(void (**)(uint64_t *, void))(*(void *)(v0 + 19488) + 96))(v5, *(void *)(v0 + 19480));
  uint64_t v6 = *v5;
  memcpy(__dst, (const void *)(v0 + 16), sizeof(__dst));
  MediaAPI.Resource.rawIdentifier(forPersonID:)(v0 + 19272);
  unint64_t v7 = *(unsigned __int8 *)(v0 + 19304);
  if (v7 > 0xFB)
  {
LABEL_5:
    OUTLINED_FUNCTION_97_7();
    swift_bridgeObjectRelease();
    uint64_t v12 = OUTLINED_FUNCTION_21_9();
    v13(v12);
    OUTLINED_FUNCTION_36_8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_49_6();
    swift_bridgeObjectRetain();
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_7();
    uint64_t v14 = OUTLINED_FUNCTION_275();
    sub_2628D365C(v14, v15);
    if (sub_26280A5F0(v0 + 688) == 1)
    {
LABEL_30:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_113_3();
    }
    else
    {
      sub_262805C78((void *)(v0 + 688), (void *)(v0 + 5616));
      switch(sub_262805C8C(v0 + 5616))
      {
        case 1u:
          OUTLINED_FUNCTION_28_6(v0 + 5616);
          goto LABEL_28;
        case 2u:
          OUTLINED_FUNCTION_26_7(v0 + 5616);
          goto LABEL_28;
        case 3u:
          OUTLINED_FUNCTION_33_8(v0 + 5616);
          goto LABEL_28;
        case 4u:
          OUTLINED_FUNCTION_32_10(v0 + 5616);
          goto LABEL_28;
        case 5u:
          unint64_t v16 = (void *)(sub_262805C98(v0 + 5616) + 8);
          goto LABEL_28;
        case 7u:
          OUTLINED_FUNCTION_31_7(v0 + 5616);
          goto LABEL_28;
        case 8u:
          OUTLINED_FUNCTION_30_10(v0 + 5616);
          goto LABEL_28;
        case 9u:
          OUTLINED_FUNCTION_29_6(v0 + 5616);
          goto LABEL_28;
        case 0xAu:
          sub_262805C98(v0 + 5616);
          OUTLINED_FUNCTION_42_8();
          break;
        case 0xBu:
          sub_262805C98(v0 + 5616);
          OUTLINED_FUNCTION_41_7();
          break;
        default:
          OUTLINED_FUNCTION_27_7(v0 + 5616);
LABEL_28:
          if (!*v16) {
            goto LABEL_30;
          }
          swift_bridgeObjectRetain();
          break;
      }
    }
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_9();
    uint64_t v46 = swift_task_alloc();
    uint64_t v47 = (void *)OUTLINED_FUNCTION_88_7(v46);
    *uint64_t v47 = v48;
    v47[1] = sub_2628FC7F4;
    OUTLINED_FUNCTION_4_12();
    OUTLINED_FUNCTION_5_3();
    return MusicContentStorage.Operations.updateDebugDescription(_:for:)();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 19272);
    uint64_t v9 = *(void *)(v0 + 19280);
    uint64_t v10 = *(void *)(v0 + 19288);
    uint64_t v11 = *(void *)(v0 + 19296);
    switch(v7 >> 5)
    {
      case 1u:
      case 3u:
      case 4u:
      case 5u:
        sub_26280B790(*(void *)(v0 + 19272), *(void *)(v0 + 19280), *(void *)(v0 + 19288), *(void *)(v0 + 19296), v7);
        goto LABEL_5;
      case 2u:
        unint64_t v34 = v7 & 0x1F;
        int v35 = 4196865;
        break;
      default:
        unint64_t v34 = 0;
        int v35 = 0;
        uint64_t v10 = *(void *)(v0 + 19288);
        uint64_t v11 = MEMORY[0x263F8EE78];
        break;
    }
    unint64_t v54 = v34;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2628259D8();
      uint64_t v6 = v50;
    }
    unint64_t v37 = *(void *)(v6 + 16);
    unint64_t v36 = *(void *)(v6 + 24);
    if (v37 >= v36 >> 1)
    {
      OUTLINED_FUNCTION_109_5(v36);
      sub_2628259D8();
      uint64_t v6 = v51;
    }
    uint64_t v38 = *(unsigned int *)(v0 + 19268);
    uint64_t v39 = *(void **)(v0 + 19496);
    uint64_t v40 = *(void *)(v0 + 19488);
    uint64_t v41 = *(void *)(v0 + 19480);
    *(void *)(v6 + 16) = v37 + 1;
    uint64_t v42 = v6 + 56 * v37;
    *(void *)(v42 + 32) = v8;
    *(void *)(v42 + 40) = v9;
    *(void *)(v42 + 48) = v10;
    *(void *)(v42 + 56) = v11;
    *(void *)(v42 + 64) = v54;
    *(void *)(v42 + 72) = 0;
    *(unsigned char *)(v42 + 82) = BYTE2(v35);
    *(_WORD *)(v42 + 80) = v35;
    *uint64_t v39 = v6;
    (*(void (**)(void *, uint64_t, uint64_t))(v40 + 104))(v39, v38, v41);
    sub_262902940();
    uint64_t v43 = (void *)swift_task_alloc();
    *(void *)(v0 + 19624) = v43;
    void *v43 = v0;
    v43[1] = sub_2628FC4A4;
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_5_3();
    return MusicContentStorage.Operations.registerContent(_:in:)();
  }
}

uint64_t sub_2628FC4A4()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 19632) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_262809920(v3 + 16);
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628FC5A8()
{
  OUTLINED_FUNCTION_97_7();
  uint64_t v2 = OUTLINED_FUNCTION_21_9();
  v3(v2);
  OUTLINED_FUNCTION_36_8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_49_6();
  swift_bridgeObjectRetain();
  sub_262902D70();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_7();
  sub_2628D365C(v1, v0 + 688);
  if (sub_26280A5F0(v0 + 688) == 1)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_113_3();
  }
  else
  {
    sub_262805C78((void *)(v0 + 688), (void *)(v0 + 5616));
    switch(sub_262805C8C(v0 + 5616))
    {
      case 1u:
        OUTLINED_FUNCTION_28_6(v0 + 5616);
        goto LABEL_12;
      case 2u:
        OUTLINED_FUNCTION_26_7(v0 + 5616);
        goto LABEL_12;
      case 3u:
        OUTLINED_FUNCTION_33_8(v0 + 5616);
        goto LABEL_12;
      case 4u:
        OUTLINED_FUNCTION_32_10(v0 + 5616);
        goto LABEL_12;
      case 5u:
        uint64_t v4 = (void *)(sub_262805C98(v0 + 5616) + 8);
        goto LABEL_12;
      case 7u:
        OUTLINED_FUNCTION_31_7(v0 + 5616);
        goto LABEL_12;
      case 8u:
        OUTLINED_FUNCTION_30_10(v0 + 5616);
        goto LABEL_12;
      case 9u:
        OUTLINED_FUNCTION_29_6(v0 + 5616);
        goto LABEL_12;
      case 0xAu:
        sub_262805C98(v0 + 5616);
        OUTLINED_FUNCTION_42_8();
        break;
      case 0xBu:
        sub_262805C98(v0 + 5616);
        OUTLINED_FUNCTION_41_7();
        break;
      default:
        OUTLINED_FUNCTION_27_7(v0 + 5616);
LABEL_12:
        if (!*v4) {
          goto LABEL_14;
        }
        swift_bridgeObjectRetain();
        break;
    }
  }
  sub_262902D70();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_37_9();
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)OUTLINED_FUNCTION_88_7(v5);
  *uint64_t v6 = v7;
  v6[1] = sub_2628FC7F4;
  OUTLINED_FUNCTION_4_12();
  return MusicContentStorage.Operations.updateDebugDescription(_:for:)();
}

uint64_t sub_2628FC7F4()
{
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_120_2();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 19672) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_262809920(v3 + 16);
  }
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

void sub_2628FC920()
{
  uint64_t v119 = v0 + 64;
  sub_2628D365C(v0 + 64, v0 + 1304);
  if (sub_26280A5F0(v0 + 1304) == 1)
  {
    uint64_t v115 = (void *)(v0 + 688);
    unint64_t v112 = (void *)(v0 + 5616);
    swift_bridgeObjectRelease();
    sub_262809920(v0 + 16);
    uint64_t v1 = *(void *)(v0 + 19568);
    for (unint64_t i = *(void *)(v0 + 19560); ; unint64_t i = v30 & v31)
    {
      while (i)
      {
        unint64_t v3 = __clz(__rbit64(i));
        i &= i - 1;
        unint64_t v4 = v3 | (v1 << 6);
        uint64_t v5 = *(void *)(v0 + 19552);
LABEL_5:
        *(void *)(v0 + 19568) = v1;
        *(void *)(v0 + 19560) = i;
        uint64_t v6 = *(uint64_t **)(v0 + 19408);
        memcpy((void *)(v0 + 16), (const void *)(*(void *)(v5 + 56) + 672 * v4), 0x2A0uLL);
        uint64_t v7 = *v6;
        if (*(void *)(v7 + 16))
        {
          uint64_t v9 = *(void *)(v0 + 16);
          uint64_t v8 = *(void *)(v0 + 24);
          *(void *)(v0 + 19576) = v9;
          *(void *)(v0 + 19584) = v8;
          sub_2628096B4(v0 + 16);
          swift_bridgeObjectRetain();
          uint64_t v10 = sub_26283F00C(v9, v8);
          if (v11)
          {
            uint64_t v32 = *(void *)(v0 + 19416);
            OUTLINED_FUNCTION_53_7(v10);
            uint64_t v34 = *(void *)(v33 + 8);
            *(void *)(v0 + 19600) = v34;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (sub_2628F62BC(v7, v34, v32))
            {
              *(void *)(v0 + 19328) = v7;
              *(void *)(v0 + 19336) = v34;
              int v35 = (void *)swift_task_alloc();
              *(void *)(v0 + 19608) = v35;
              sub_262902B10();
              *int v35 = v0;
              v35[1] = sub_2628FBC90;
              OUTLINED_FUNCTION_110_6();
              OUTLINED_FUNCTION_44_7();
              MEMORY[0x270F76988]();
            }
            else
            {
              uint64_t v37 = *(void *)(v0 + 32);
              uint64_t v38 = *(void *)(v0 + 40);
              *(void *)(v0 + 19640) = v37;
              *(void *)(v0 + 19648) = v38;
              OUTLINED_FUNCTION_60_5();
              sub_2629032A0();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              *(void *)(v0 + 19312) = v37;
              *(void *)(v0 + 19320) = v38;
              OUTLINED_FUNCTION_59_7();
              sub_262902D70();
              swift_bridgeObjectRetain();
              sub_262902D70();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_9_7();
              sub_2628D365C(v119, (uint64_t)v115);
              if (sub_26280A5F0((uint64_t)v115) == 1)
              {
LABEL_94:
                swift_bridgeObjectRelease();
              }
              else
              {
                sub_262805C78(v115, v112);
                switch(sub_262805C8C((uint64_t)v112))
                {
                  case 1u:
                    OUTLINED_FUNCTION_28_6((uint64_t)v112);
                    goto LABEL_92;
                  case 2u:
                    OUTLINED_FUNCTION_26_7((uint64_t)v112);
                    goto LABEL_92;
                  case 3u:
                    OUTLINED_FUNCTION_33_8((uint64_t)v112);
                    goto LABEL_92;
                  case 4u:
                    OUTLINED_FUNCTION_32_10((uint64_t)v112);
                    goto LABEL_92;
                  case 5u:
                    uint64_t v39 = (void *)(sub_262805C98((uint64_t)v112) + 8);
                    goto LABEL_92;
                  case 7u:
                    OUTLINED_FUNCTION_31_7((uint64_t)v112);
                    goto LABEL_92;
                  case 8u:
                    OUTLINED_FUNCTION_30_10((uint64_t)v112);
                    goto LABEL_92;
                  case 9u:
                    OUTLINED_FUNCTION_29_6((uint64_t)v112);
                    goto LABEL_92;
                  case 0xAu:
                    OUTLINED_FUNCTION_104_7();
                    goto LABEL_100;
                  case 0xBu:
                    OUTLINED_FUNCTION_106_4();
LABEL_100:
                    sub_262805C98((uint64_t)v112);
                    break;
                  default:
                    OUTLINED_FUNCTION_27_7((uint64_t)v112);
LABEL_92:
                    if (!*v39) {
                      goto LABEL_94;
                    }
                    swift_bridgeObjectRetain();
                    break;
                }
              }
              sub_262902D70();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_37_9();
              uint64_t v99 = swift_task_alloc();
              uint64_t v100 = (void *)OUTLINED_FUNCTION_88_7(v99);
              *uint64_t v100 = v101;
              v100[1] = sub_2628FC7F4;
              OUTLINED_FUNCTION_4_12();
              OUTLINED_FUNCTION_44_7();
              MusicContentStorage.Operations.updateDebugDescription(_:for:)();
            }
            return;
          }
          swift_bridgeObjectRelease();
          sub_262809920(v0 + 16);
        }
      }
      if (__OFADD__(v1, 1))
      {
        __break(1u);
        goto LABEL_102;
      }
      uint64_t v12 = OUTLINED_FUNCTION_91_6();
      if (v15 != v16)
      {
        uint64_t v17 = v12 + 64;
        uint64_t v1 = v14;
        if (*(void *)(v12 + 64 + 8 * v14)) {
          goto LABEL_12;
        }
        int64_t v21 = v13 >> 6;
        uint64_t v1 = v14 + 1;
        if (v14 + 1 < v21)
        {
          if (*(void *)(v17 + 8 * v1)) {
            goto LABEL_12;
          }
          uint64_t v1 = v14 + 2;
          if (v14 + 2 < v21)
          {
            if (*(void *)(v17 + 8 * v1)) {
              goto LABEL_12;
            }
            uint64_t v1 = v14 + 3;
            if (v14 + 3 < v21)
            {
              if (*(void *)(v17 + 8 * v1)) {
                goto LABEL_12;
              }
              uint64_t v22 = v14 + 4;
              if (v22 < v21) {
                break;
              }
            }
          }
        }
      }
LABEL_26:
      uint64_t v23 = *(void *)(v0 + 19544);
      uint64_t v24 = *(void *)(v0 + 19536);
      swift_release();
      if (v23 + 1 == v24)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_61_6();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_36_0();
        goto LABEL_73;
      }
      OUTLINED_FUNCTION_72_6();
      uint64_t v25 = 0xE500000000000000;
      uint64_t v26 = 0x73676E6F73;
      switch(v27)
      {
        case 1:
          uint64_t v25 = 0xED000073676E6F73;
          goto LABEL_33;
        case 2:
          uint64_t v25 = 0xEC000000736F6564;
          uint64_t v26 = OUTLINED_FUNCTION_52_7();
          break;
        case 3:
          uint64_t v26 = OUTLINED_FUNCTION_82_6();
          uint64_t v25 = 0x8000000262903FD0;
          break;
        case 4:
          uint64_t v25 = 0xE600000000000000;
          uint64_t v26 = OUTLINED_FUNCTION_269_0();
          break;
        case 5:
          uint64_t v25 = 0xEE00736D75626C61;
LABEL_33:
          uint64_t v26 = OUTLINED_FUNCTION_51_8();
          break;
        case 6:
          uint64_t v25 = 0xE900000000000073;
          uint64_t v26 = OUTLINED_FUNCTION_97_1();
          break;
        case 7:
          uint64_t v25 = 0x8000000262904010;
          uint64_t v26 = OUTLINED_FUNCTION_102_6();
          break;
        case 8:
          uint64_t v25 = 0xE800000000000000;
          uint64_t v26 = OUTLINED_FUNCTION_147_0();
          break;
        case 9:
          uint64_t v25 = 0xE600000000000000;
          uint64_t v26 = OUTLINED_FUNCTION_76_6();
          break;
        case 10:
          OUTLINED_FUNCTION_46_6();
          OUTLINED_FUNCTION_104_7();
          break;
        case 11:
          OUTLINED_FUNCTION_45_8();
          OUTLINED_FUNCTION_106_4();
          break;
        default:
          break;
      }
      uint64_t v28 = *(void *)(v0 + 19400);
      if (*(void *)(v28 + 16) && (sub_26283F00C(v26, v25), (v29 & 1) != 0))
      {
        OUTLINED_FUNCTION_43_8();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v28 = sub_262902BD0();
      }
      uint64_t v1 = 0;
      *(void *)(v0 + 19552) = v28;
      *(unsigned char *)(v0 + 19266) = *(unsigned char *)(v28 + 32);
      OUTLINED_FUNCTION_40_7();
    }
    if (!*(void *)(v17 + 8 * v22))
    {
      while (1)
      {
        uint64_t v1 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          break;
        }
        if (v1 >= v21) {
          goto LABEL_26;
        }
        ++v22;
        if (*(void *)(v17 + 8 * v1)) {
          goto LABEL_12;
        }
      }
LABEL_102:
      __break(1u);
      JUMPOUT(0x2628FDA04);
    }
    uint64_t v1 = v22;
LABEL_12:
    OUTLINED_FUNCTION_90_6();
    unint64_t i = v18 & v19;
    unint64_t v4 = v20 + (v1 << 6);
    goto LABEL_5;
  }
  uint64_t v118 = v0 + 3152;
  uint64_t v111 = (void *)(v0 + 3768);
  uint64_t v117 = v0 + 4384;
  uint64_t v109 = (void *)(v0 + 5000);
  int v107 = (void *)(v0 + 6848);
  uint64_t v116 = v0 + 7464;
  uint64_t v105 = (void *)(v0 + 8080);
  uint64_t v114 = v0 + 8696;
  uint64_t v103 = (void *)(v0 + 9312);
  uint64_t v113 = (void *)(v0 + 9928);
  uint64_t v110 = v0 + 10544;
  uint64_t v108 = v0 + 12392;
  uint64_t v106 = v0 + 13624;
  uint64_t v104 = v0 + 14240;
  sub_262805C78((void *)(v0 + 1304), (void *)(v0 + 1920));
  switch(sub_262805C8C(v0 + 1920))
  {
    case 1u:
      uint64_t v51 = (void *)OUTLINED_FUNCTION_22_10();
      sub_262805C78(v51, v105);
      uint64_t v52 = sub_262805C98((uint64_t)v105);
      sub_2627F10C4(v52);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v53 = OUTLINED_FUNCTION_67_7();
      sub_2628D365C(v53, (uint64_t)v113);
      sub_2628D36E4(v113, sub_262806CD0);
      sub_262901EB0();
      unint64_t v54 = (void *)OUTLINED_FUNCTION_73_5();
      memcpy(v54, v55, 0x248uLL);
      sub_26280A9B8();
      goto LABEL_64;
    case 2u:
      uint64_t v56 = *(void *)(v0 + 19672);
      uint64_t v57 = (const void *)sub_262805C98(v0 + 1920);
      uint64_t v58 = (void *)OUTLINED_FUNCTION_73_5();
      sub_262805C78(v58, v59);
      uint64_t v60 = sub_262805C98(v0 + 11776);
      sub_2627F5734(v60);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v61 = OUTLINED_FUNCTION_39_6();
      sub_2628D365C(v61, v106);
      sub_2628D36E4(v106, sub_262806CD0);
      sub_262901EB0();
      memcpy((void *)(v0 + 17152), v57, 0x1D0uLL);
      sub_26280A96C();
      uint64_t v62 = sub_262901EA0();
      if (v56) {
        goto LABEL_71;
      }
      uint64_t v46 = v62;
      uint64_t v47 = v63;
      goto LABEL_78;
    case 3u:
      uint64_t v64 = (void *)OUTLINED_FUNCTION_22_10();
      sub_262805C78(v64, (void *)(v0 + 14856));
      unsigned __int8 v65 = (uint64_t *)sub_262805C98(v0 + 14856);
      sub_2627F9310(v65);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v66 = OUTLINED_FUNCTION_67_7();
      sub_2628D365C(v66, v104);
      sub_2628D36E4(v104, sub_262806CD0);
      sub_262901EB0();
      uint64_t v67 = (void *)OUTLINED_FUNCTION_73_5();
      memcpy(v67, v68, 0x1A8uLL);
      sub_26280A920();
      goto LABEL_64;
    case 4u:
      Swift::String v69 = (void *)OUTLINED_FUNCTION_22_10();
      sub_262805C78(v69, (void *)(v0 + 13008));
      uint64_t v70 = sub_262805C98(v0 + 13008);
      sub_2627FD734(v70);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v71 = OUTLINED_FUNCTION_67_7();
      sub_2628D365C(v71, v108);
      sub_2628D36E4(v108, sub_262806CD0);
      sub_262901EB0();
      uint64_t v72 = (void *)OUTLINED_FUNCTION_73_5();
      memcpy(v72, v73, 0x1E8uLL);
      sub_26280A8D4();
      goto LABEL_64;
    case 5u:
    case 0xAu:
    case 0xBu:
      sub_262805C98(v0 + 1920);
      sub_2628D365C(v119, v0 + 2536);
      sub_2628D36E4(v0 + 2536, sub_262806CD0);
      sub_2629032A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_262902D70();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_96_7();
      OUTLINED_FUNCTION_44_7();
      return;
    case 6u:
      uint64_t v74 = (void *)OUTLINED_FUNCTION_22_10();
      sub_262805C78(v74, (void *)(v0 + 11160));
      uint64_t v75 = sub_262805C98(v0 + 11160);
      sub_2627EDF4C(v75);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v76 = OUTLINED_FUNCTION_67_7();
      sub_2628D365C(v76, v110);
      sub_2628D36E4(v110, sub_262806CD0);
      sub_262901EB0();
      uint64_t v77 = (void *)OUTLINED_FUNCTION_73_5();
      memcpy(v77, v78, 0x260uLL);
      sub_26280A83C();
LABEL_64:
      uint64_t v79 = sub_262901EA0();
      if (v0 != -18456)
      {
        swift_bridgeObjectRelease();
        swift_release();
        sub_2628D36E4(v0 + 13008, sub_262807B0C);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v81 = v0 + 13008;
LABEL_72:
        sub_2628D36E4(v81, sub_262807B0C);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_29_0();
LABEL_73:
        OUTLINED_FUNCTION_44_7();
        __asm { BRAA            X1, X16 }
      }
      uint64_t v46 = v79;
      uint64_t v47 = v80;
      swift_release();
      sub_2628D36E4(-5448, sub_262807B0C);
      uint64_t v82 = -5448;
      goto LABEL_80;
    case 7u:
      uint64_t v83 = *(void *)(v0 + 19672);
      uint64_t v84 = (const void *)sub_262805C98(v0 + 1920);
      sub_262805C78((void *)(v0 + 1304), v103);
      uint64_t v85 = sub_262805C98((uint64_t)v103);
      sub_2627F2EA0(v85);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v86 = OUTLINED_FUNCTION_39_6();
      sub_2628D365C(v86, v114);
      sub_2628D36E4(v114, sub_262806CD0);
      sub_262901EB0();
      memcpy((void *)(v0 + 18864), v84, 0x191uLL);
      sub_26280A7F0();
      goto LABEL_70;
    case 8u:
      uint64_t v83 = *(void *)(v0 + 19672);
      uint64_t v87 = (const void *)sub_262805C98(v0 + 1920);
      sub_262805C78((void *)(v0 + 1304), v109);
      uint64_t v88 = sub_262805C98((uint64_t)v109);
      sub_2627F728C(v88);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v89 = OUTLINED_FUNCTION_39_6();
      sub_2628D365C(v89, v117);
      sub_2628D36E4(v117, sub_262806CD0);
      sub_262901EB0();
      memcpy((void *)(v0 + 18456), v87, 0x198uLL);
      sub_26280A7A4();
      goto LABEL_70;
    case 9u:
      uint64_t v83 = *(void *)(v0 + 19672);
      uint64_t v90 = (const void *)sub_262805C98(v0 + 1920);
      sub_262805C78((void *)(v0 + 1304), v111);
      uint64_t v91 = (uint64_t *)sub_262805C98((uint64_t)v111);
      sub_2627FB040(v91);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v92 = OUTLINED_FUNCTION_39_6();
      sub_2628D365C(v92, v118);
      sub_2628D36E4(v118, sub_262806CD0);
      sub_262901EB0();
      memcpy((void *)(v0 + 18040), v90, 0x1A0uLL);
      sub_26280A758();
LABEL_70:
      uint64_t v93 = sub_262901EA0();
      if (v83) {
        goto LABEL_71;
      }
      uint64_t v46 = v93;
      uint64_t v47 = v94;
LABEL_78:
      swift_release();
      goto LABEL_79;
    default:
      uint64_t v40 = *(void *)(v0 + 19672);
      uint64_t v41 = (void *)sub_262805C98(v0 + 1920);
      sub_262805C78((void *)(v0 + 1304), v107);
      uint64_t v42 = sub_262805C98((uint64_t)v107);
      sub_2627EA650(v42);
      sub_262809920(v0 + 16);
      sub_262901EC0();
      OUTLINED_FUNCTION_25_8();
      uint64_t v43 = OUTLINED_FUNCTION_39_6();
      sub_2628D365C(v43, v116);
      sub_2628D36E4(v116, sub_262806CD0);
      sub_262901EB0();
      memcpy((void *)(v0 + 6232), v41, 0x268uLL);
      sub_26280AA04();
      uint64_t v44 = sub_262901EA0();
      if (v40)
      {
LABEL_71:
        swift_bridgeObjectRelease();
        swift_release();
        sub_2628D36E4(v0 + 1920, sub_262807B0C);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v81 = v0 + 1920;
        goto LABEL_72;
      }
      uint64_t v46 = v44;
      uint64_t v47 = v45;
      swift_release();
      uint64_t v48 = v41[37];
      if (v48)
      {
        swift_bridgeObjectRetain();
        sub_2628D36E4(v0 + 1920, sub_262807B0C);
        uint64_t v49 = *(void *)(v48 + 16);
        swift_bridgeObjectRelease();
        sub_2628D36E4(v0 + 1920, sub_262807B0C);
        BOOL v50 = v49 != 0;
      }
      else
      {
LABEL_79:
        sub_2628D36E4(v0 + 1920, sub_262807B0C);
        uint64_t v82 = v0 + 1920;
LABEL_80:
        sub_2628D36E4(v82, sub_262807B0C);
        BOOL v50 = 0;
      }
      *(void *)(v0 + 19680) = v47;
      *(void *)(v0 + 19688) = v46;
      *(void *)(v0 + 19376) = v50;
      uint64_t v97 = (void *)swift_task_alloc();
      *(void *)(v0 + 19696) = v97;
      *uint64_t v97 = v0;
      v97[1] = sub_2628FDA94;
      OUTLINED_FUNCTION_275();
      OUTLINED_FUNCTION_44_7();
      MusicContentStorage.Operations.storeMediaAPIAttributes(_:attributesMask:for:)();
      return;
  }
}

uint64_t sub_2628FDA94()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_9_0();
  *unint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_1_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 19704) = v0;
  swift_task_dealloc();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_2();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2628FDB8C()
{
  OUTLINED_FUNCTION_98_7();
  __dst = v2;
  uint64_t v51 = v3;
  sub_26285500C(*(void *)(v0 + 19688), *(void *)(v0 + 19680));
  uint64_t v4 = *(void *)(v0 + 19568);
  unint64_t v5 = *(void *)(v0 + 19560);
  while (1)
  {
    do
    {
      while (1)
      {
        if (v5)
        {
          unint64_t v6 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
          unint64_t v7 = v6 | (v4 << 6);
          uint64_t v8 = *(void *)(v0 + 19552);
          goto LABEL_4;
        }
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_72;
        }
        uint64_t v15 = OUTLINED_FUNCTION_91_6();
        if (v18 != v19) {
          break;
        }
LABEL_25:
        uint64_t v26 = *(void *)(v0 + 19544);
        uint64_t v27 = *(void *)(v0 + 19536);
        swift_release();
        if (v26 + 1 == v27)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_61_6();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          OUTLINED_FUNCTION_36_0();
          OUTLINED_FUNCTION_84_0();
          __asm { BRAA            X1, X16 }
        }
        OUTLINED_FUNCTION_72_6();
        uint64_t v28 = 0xE500000000000000;
        uint64_t v29 = 0x73676E6F73;
        switch(v30)
        {
          case 1:
            uint64_t v28 = 0xED000073676E6F73;
            goto LABEL_32;
          case 2:
            uint64_t v28 = 0xEC000000736F6564;
            uint64_t v29 = OUTLINED_FUNCTION_52_7();
            break;
          case 3:
            uint64_t v29 = OUTLINED_FUNCTION_82_6();
            uint64_t v28 = 0x8000000262903FD0;
            break;
          case 4:
            uint64_t v28 = 0xE600000000000000;
            uint64_t v29 = OUTLINED_FUNCTION_269_0();
            break;
          case 5:
            uint64_t v28 = 0xEE00736D75626C61;
LABEL_32:
            uint64_t v29 = OUTLINED_FUNCTION_51_8();
            break;
          case 6:
            uint64_t v28 = 0xE900000000000073;
            uint64_t v29 = OUTLINED_FUNCTION_97_1();
            break;
          case 7:
            uint64_t v28 = 0x8000000262904010;
            uint64_t v29 = OUTLINED_FUNCTION_102_6();
            break;
          case 8:
            uint64_t v28 = 0xE800000000000000;
            uint64_t v29 = OUTLINED_FUNCTION_147_0();
            break;
          case 9:
            uint64_t v28 = 0xE600000000000000;
            uint64_t v29 = OUTLINED_FUNCTION_76_6();
            break;
          case 10:
            uint64_t v29 = OUTLINED_FUNCTION_46_6();
            uint64_t v28 = 0xEF736973796C616ELL;
            break;
          case 11:
            uint64_t v29 = OUTLINED_FUNCTION_45_8();
            uint64_t v28 = 0xEE00736973796C61;
            break;
          default:
            break;
        }
        uint64_t v31 = *(void *)(v0 + 19400);
        if (*(void *)(v31 + 16) && (sub_26283F00C(v29, v28), (v32 & 1) != 0))
        {
          OUTLINED_FUNCTION_43_8();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v31 = sub_262902BD0();
        }
        uint64_t v4 = 0;
        *(void *)(v0 + 19552) = v31;
        *(unsigned char *)(v0 + 19266) = *(unsigned char *)(v31 + 32);
        OUTLINED_FUNCTION_40_7();
        unint64_t v5 = v33 & v34;
      }
      uint64_t v20 = v15 + 64;
      uint64_t v4 = v17;
      if (!*(void *)(v15 + 64 + 8 * v17))
      {
        int64_t v24 = v16 >> 6;
        uint64_t v4 = v17 + 1;
        if (v17 + 1 >= v24) {
          goto LABEL_25;
        }
        if (!*(void *)(v20 + 8 * v4))
        {
          uint64_t v4 = v17 + 2;
          if (v17 + 2 >= v24) {
            goto LABEL_25;
          }
          if (!*(void *)(v20 + 8 * v4))
          {
            uint64_t v4 = v17 + 3;
            if (v17 + 3 >= v24) {
              goto LABEL_25;
            }
            if (!*(void *)(v20 + 8 * v4))
            {
              uint64_t v25 = v17 + 4;
              if (v25 >= v24) {
                goto LABEL_25;
              }
              if (!*(void *)(v20 + 8 * v25))
              {
                while (1)
                {
                  uint64_t v4 = v25 + 1;
                  if (__OFADD__(v25, 1)) {
                    break;
                  }
                  if (v4 >= v24) {
                    goto LABEL_25;
                  }
                  ++v25;
                  if (*(void *)(v20 + 8 * v4)) {
                    goto LABEL_11;
                  }
                }
LABEL_72:
                __break(1u);
                JUMPOUT(0x2628FE238);
              }
              uint64_t v4 = v25;
            }
          }
        }
      }
LABEL_11:
      OUTLINED_FUNCTION_90_6();
      unint64_t v5 = v21 & v22;
      unint64_t v7 = v23 + (v4 << 6);
LABEL_4:
      *(void *)(v0 + 19568) = v4;
      *(void *)(v0 + 19560) = v5;
      uint64_t v9 = *(uint64_t **)(v0 + 19408);
      memcpy(v1, (const void *)(*(void *)(v8 + 56) + 672 * v7), 0x2A0uLL);
      uint64_t v10 = *v9;
    }
    while (!*(void *)(v10 + 16));
    uint64_t v11 = *(void *)(v0 + 16);
    uint64_t v12 = *(void *)(v0 + 24);
    *(void *)(v0 + 19576) = v11;
    *(void *)(v0 + 19584) = v12;
    sub_2628096B4((uint64_t)v1);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_26283F00C(v11, v12);
    if (v14) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_262809920((uint64_t)v1);
  }
  uint64_t v35 = *(void *)(v0 + 19416);
  OUTLINED_FUNCTION_53_7(v13);
  uint64_t v37 = *(void *)(v36 + 8);
  *(void *)(v0 + 19600) = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_2628F62BC(v10, v37, v35))
  {
    *(void *)(v0 + 19328) = v10;
    *(void *)(v0 + 19336) = v37;
    uint64_t v38 = (void *)swift_task_alloc();
    *(void *)(v0 + 19608) = v38;
    sub_262902B10();
    void *v38 = v0;
    v38[1] = sub_2628FBC90;
    OUTLINED_FUNCTION_84_0();
    return MEMORY[0x270F76988]();
  }
  else
  {
    uint64_t v40 = *(void *)(v0 + 32);
    uint64_t v41 = *(void *)(v0 + 40);
    *(void *)(v0 + 19640) = v40;
    *(void *)(v0 + 19648) = v41;
    OUTLINED_FUNCTION_60_5();
    sub_2629032A0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 19312) = v40;
    *(void *)(v0 + 19320) = v41;
    OUTLINED_FUNCTION_59_7();
    sub_262902D70();
    swift_bridgeObjectRetain();
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_7();
    sub_2628D365C(v0 + 64, (uint64_t)v51);
    if (sub_26280A5F0((uint64_t)v51) == 1)
    {
LABEL_64:
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_262805C78(v51, __dst);
      switch(sub_262805C8C((uint64_t)__dst))
      {
        case 1u:
          OUTLINED_FUNCTION_28_6((uint64_t)__dst);
          goto LABEL_62;
        case 2u:
          OUTLINED_FUNCTION_26_7((uint64_t)__dst);
          goto LABEL_62;
        case 3u:
          OUTLINED_FUNCTION_33_8((uint64_t)__dst);
          goto LABEL_62;
        case 4u:
          OUTLINED_FUNCTION_32_10((uint64_t)__dst);
          goto LABEL_62;
        case 5u:
          uint64_t v42 = (void *)(sub_262805C98((uint64_t)__dst) + 8);
          goto LABEL_62;
        case 7u:
          OUTLINED_FUNCTION_31_7((uint64_t)__dst);
          goto LABEL_62;
        case 8u:
          OUTLINED_FUNCTION_30_10((uint64_t)__dst);
          goto LABEL_62;
        case 9u:
          OUTLINED_FUNCTION_29_6((uint64_t)__dst);
          goto LABEL_62;
        case 0xAu:
          OUTLINED_FUNCTION_100_6();
          goto LABEL_70;
        case 0xBu:
          OUTLINED_FUNCTION_99_6();
LABEL_70:
          sub_262805C98((uint64_t)__dst);
          break;
        default:
          OUTLINED_FUNCTION_27_7((uint64_t)__dst);
LABEL_62:
          if (!*v42) {
            goto LABEL_64;
          }
          swift_bridgeObjectRetain();
          break;
      }
    }
    sub_262902D70();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_9();
    uint64_t v45 = swift_task_alloc();
    uint64_t v46 = (void *)OUTLINED_FUNCTION_88_7(v45);
    *uint64_t v46 = v47;
    v46[1] = sub_2628FC7F4;
    OUTLINED_FUNCTION_4_12();
    OUTLINED_FUNCTION_84_0();
    return MusicContentStorage.Operations.updateDebugDescription(_:for:)();
  }
}

uint64_t sub_2628FE298()
{
  OUTLINED_FUNCTION_28_0();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628FE324()
{
  OUTLINED_FUNCTION_28_0();
  uint64_t v0 = OUTLINED_FUNCTION_21_9();
  v1(v0);
  swift_release();
  OUTLINED_FUNCTION_15_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v2();
}

uint64_t sub_2628FE3B0()
{
  OUTLINED_FUNCTION_28_0();
  swift_release();
  OUTLINED_FUNCTION_15_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v0();
}

uint64_t sub_2628FE430()
{
  OUTLINED_FUNCTION_28_0();
  sub_26285500C(*(void *)(v0 + 19688), *(void *)(v0 + 19680));
  swift_release();
  OUTLINED_FUNCTION_15_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_29_0();
  return v1();
}

uint64_t sub_2628FE4C0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_262829230(0, &qword_26A967020);
  OUTLINED_FUNCTION_95_4();
  uint64_t v3 = swift_dynamicCast();
  if (v3)
  {
    sub_262891548(v5, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  else
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    sub_2628FE6CC((uint64_t)v5);
  }
  return v3;
}

uint64_t sub_2628FE5DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_26286F628;
  return sub_2628F6418();
}

uint64_t sub_2628FE670(uint64_t a1)
{
  return sub_2628FE4C0(a1) & 1;
}

uint64_t sub_2628FE694()
{
  return swift_getWitnessTable();
}

uint64_t sub_2628FE6B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2628FE6CC(uint64_t a1)
{
  sub_2628FE728();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2628FE728()
{
  if (!qword_26A967028)
  {
    sub_262829230(255, &qword_26A967020);
    unint64_t v0 = sub_262903180();
    if (!v1) {
      atomic_store(v0, &qword_26A967028);
    }
  }
}

void sub_2628FE790(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id sub_2628FE7F4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (void *)sub_262902050();
  id v7 = objc_msgSend(v3, sel_initWithURL_requestContext_, v6, a2);

  uint64_t v8 = sub_2629020B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

uint64_t type metadata accessor for MediaAPIResourceRequest.Identifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2628FE8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  if (((a7 >> 22) & 3) != 3)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for MediaAPIResourceRequest.MediaAPIOpaqueLookupParameters()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2628FE918(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_81_7();
  sub_2628FEEF8(a1, a2, a3);
  void *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2628FE998(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_81_7();
  sub_2628FF048(a1, v4);
  void *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2628FEA08(uint64_t a1, char a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  sub_2628FF1B4(a1, a2);
  uint64_t *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2628FEA88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_262903690();
  swift_bridgeObjectRetain();
  sub_262902D40();
  uint64_t v8 = sub_2629036D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  uint64_t v10 = v8 & ~v9;
  OUTLINED_FUNCTION_94_5();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    uint64_t v13 = (void *)(v12 + 16 * v10);
    BOOL v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (sub_262903620() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (void *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      uint64_t v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_94_5();
      if ((v19 & 1) == 0) {
        break;
      }
      uint64_t v20 = (void *)(v12 + 16 * v10);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_262903620() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_262843530();
  uint64_t *v3 = v22;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2628FEC20(void *a1, uint64_t a2, uint64_t a3)
{
  char v4 = v3;
  uint64_t v8 = *v3;
  sub_262903690();
  swift_bridgeObjectRetain();
  sub_2629025D0();
  uint64_t v9 = sub_2629036D0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    swift_bridgeObjectRetain();
    char v12 = sub_2629025C0();
    swift_bridgeObjectRelease();
    if (v12)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (void *)(*(void *)(*v4 + 48) + 16 * v11);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v13 = ~v10;
    while (1)
    {
      unint64_t v11 = (v11 + 1) & v13;
      if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain();
      char v14 = sub_2629025C0();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_6;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v4;
  *char v4 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_262843810();
  *char v4 = v18;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2628FEDE8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2629000B0(255, a2, a3, a4, MEMORY[0x263F78550]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2628FEE4C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2628FEE94()
{
  unint64_t result = qword_26A967050;
  if (!qword_26A967050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A967050);
  }
  return result;
}

uint64_t type metadata accessor for MediaAPIResourceRequest.MediaAPITypedLookupParameters()
{
  return __swift_instantiateGenericMetadata();
}

_OWORD *sub_2628FEEF8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  uint64_t v9 = sub_26283F00C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_262900010(0, &qword_26A966C90);
  if ((sub_262903340() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v13 = sub_26283F00C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    unint64_t result = (_OWORD *)sub_262903670();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_26286C068(a1, v16);
  }
  else
  {
    sub_2628FF2F8(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_2628FF048(uint64_t a1, char a2)
{
  uint64_t v3 = (void **)v2;
  char v5 = a2 & 1;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_26283F274(a2 & 1);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  sub_2628FFF2C(0, (unint64_t *)&qword_26A966C88, (void (*)(uint64_t))type metadata accessor for MusicContent.Environment.Account.Bag.KeyServerInfo, (void (*)(void))sub_2628EC908);
  if ((sub_262903340() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_26283F274(v5);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_13:
    uint64_t result = sub_262903670();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  uint64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    uint64_t v15 = v14
        + *(void *)(*(void *)(type metadata accessor for MusicContent.Environment.Account.Bag.KeyServerInfo() - 8)
                    + 72)
        * v9;
    return sub_2628FFFAC(a1, v15);
  }
  else
  {
    return sub_2628FF364(v9, v5, a1, v13);
  }
}

unint64_t sub_2628FF1B4(uint64_t a1, char a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_26283F2B8(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  sub_2628FFF2C(0, &qword_26A967068, (void (*)(uint64_t))sub_2628FF848, (void (*)(void))sub_2628FF7FC);
  if ((sub_262903340() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_26283F2B8(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    unint64_t result = sub_262903670();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  uint64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    return sub_2628FF3FC(v9, a2, a1, v13);
  }
  return result;
}

_OWORD *sub_2628FF2F8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_26286C068(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_2628FF364(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2 & 1;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for MusicContent.Environment.Account.Bag.KeyServerInfo();
  uint64_t result = sub_2628EC9A8(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_2628FF3FC(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_2628FF440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  BOOL v9 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  BOOL v50 = (char *)&v38 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v38 - v13;
  if (MEMORY[0x263E56060](v12))
  {
    sub_262903290();
    uint64_t v15 = sub_262903280();
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F8EE88];
  }
  uint64_t v43 = MEMORY[0x263E56090](v5, a2);
  if (v43)
  {
    uint64_t v39 = v7;
    uint64_t v40 = v6;
    uint64_t v16 = 0;
    uint64_t v48 = (uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
    uint64_t v49 = v15 + 56;
    uint64_t v45 = v6 + 32;
    uint64_t v47 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v41 = v5;
    uint64_t v42 = v14;
    while (1)
    {
      char v17 = sub_262902F80();
      sub_262902F40();
      if (v17)
      {
        uint64_t v18 = *(uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
        uint64_t result = v18(v14, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v16), a2);
      }
      else
      {
        uint64_t result = sub_2629032C0();
        if (v39 != 8) {
          goto LABEL_24;
        }
        uint64_t v51 = result;
        uint64_t v18 = *v48;
        (*v48)(v14, &v51, a2);
        uint64_t result = swift_unknownObjectRelease();
      }
      BOOL v20 = __OFADD__(v16, 1);
      uint64_t v21 = v16 + 1;
      if (v20) {
        break;
      }
      uint64_t v46 = v21;
      uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v44(v50, v14, a2);
      uint64_t v22 = sub_262902C60();
      uint64_t v23 = v15;
      uint64_t v24 = -1 << *(unsigned char *)(v15 + 32);
      unint64_t v25 = v22 & ~v24;
      unint64_t v26 = v25 >> 6;
      uint64_t v27 = *(void *)(v49 + 8 * (v25 >> 6));
      uint64_t v28 = 1 << v25;
      uint64_t v29 = *(void *)(v6 + 72);
      if (((1 << v25) & v27) != 0)
      {
        uint64_t v30 = ~v24;
        while (1)
        {
          v18(v9, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
          uint64_t v31 = a3;
          char v32 = sub_262902C90();
          uint64_t v33 = *v47;
          (*v47)(v9, a2);
          if (v32) {
            break;
          }
          unint64_t v25 = (v25 + 1) & v30;
          unint64_t v26 = v25 >> 6;
          uint64_t v27 = *(void *)(v49 + 8 * (v25 >> 6));
          uint64_t v28 = 1 << v25;
          a3 = v31;
          if ((v27 & (1 << v25)) == 0)
          {
            uint64_t v6 = v40;
            uint64_t v5 = v41;
            goto LABEL_14;
          }
        }
        v33(v50, a2);
        a3 = v31;
        uint64_t v6 = v40;
        uint64_t v5 = v41;
        uint64_t v15 = v23;
      }
      else
      {
LABEL_14:
        uint64_t v34 = v50;
        *(void *)(v49 + 8 * v26) = v28 | v27;
        unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
        uint64_t v15 = v23;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v44)(v35, v34, a2);
        uint64_t v36 = *(void *)(v23 + 16);
        BOOL v20 = __OFADD__(v36, 1);
        uint64_t v37 = v36 + 1;
        if (v20) {
          goto LABEL_23;
        }
        *(void *)(v23 + 16) = v37;
      }
      uint64_t v14 = v42;
      uint64_t v16 = v46;
      if (v46 == v43) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

unint64_t sub_2628FF7FC()
{
  unint64_t result = qword_26A967060;
  if (!qword_26A967060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A967060);
  }
  return result;
}

void sub_2628FF848()
{
  if (!qword_26A967070)
  {
    unint64_t v0 = sub_2629030F0();
    if (!v1) {
      atomic_store(v0, &qword_26A967070);
    }
  }
}

uint64_t sub_2628FF89C(uint64_t a1)
{
  return sub_2628F8F5C(a1, v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[2], v1[3]);
}

uint64_t sub_2628FF8D8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for MediaAPIResourceRequest() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (id *)(v0 + v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 8))((char *)v4 + v2[11], v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_2();
  return MEMORY[0x270FA0238](v5, v6, v7);
}

uint64_t sub_2628FFA4C()
{
  OUTLINED_FUNCTION_96_3();
  uint64_t v22 = v2;
  uint64_t v3 = type metadata accessor for MediaAPIResourceRequest();
  OUTLINED_FUNCTION_2_0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v20 = *(void *)(v0 + 32);
  uint64_t v13 = *(void *)(v0 + v9);
  uint64_t v14 = *(void *)(v0 + v10);
  uint64_t v15 = *(void *)(v0 + v11);
  uint64_t v16 = v0 + v8;
  uint64_t v17 = *(void *)(v0 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v18;
  *uint64_t v18 = v1;
  v18[1] = sub_2628A5044;
  return sub_2628FA39C(v22, v20, v12, v16, v13, v14, v15, v17);
}

uint64_t sub_2628FFBA8()
{
  OUTLINED_FUNCTION_96_3();
  uint64_t v15 = v1;
  uint64_t v13 = v2;
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v9 = swift_task_alloc();
  unint64_t v10 = (void *)OUTLINED_FUNCTION_58_0(v9);
  *unint64_t v10 = v11;
  v10[1] = sub_2628A5044;
  return sub_2628FB320(v13, v15, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_2628FFC94()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_58_0(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_2628A5044;
  OUTLINED_FUNCTION_55_7();
  return sub_2628F1F24(v6, v7, v8, v9, v1, v2);
}

uint64_t sub_2628FFD48()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = v0[4];
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = (void *)OUTLINED_FUNCTION_58_0(v8);
  *uint64_t v9 = v10;
  v9[1] = sub_2628A5044;
  return sub_2628F2194(v4, v2, v5, v6, v7);
}

uint64_t sub_2628FFE00()
{
  OUTLINED_FUNCTION_70_0();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_58_0(v2);
  void *v3 = v4;
  v3[1] = sub_26286F628;
  OUTLINED_FUNCTION_55_7();
  return sub_2628F2464(v5, v6, v7, v8, v1);
}

void sub_2628FFEAC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t type metadata accessor for MediaAPIResourceRequest.Identifier.LookupIdentifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2628FFF10@<X0>(uint64_t *a1@<X8>)
{
  return sub_2628F4240(a1);
}

void sub_2628FFF2C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    unint64_t v6 = sub_262903370();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_2628FFFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MusicContent.Environment.Account.Bag.KeyServerInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_262900010(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_262903370();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unint64_t sub_262900064()
{
  unint64_t result = qword_26A9670F0;
  if (!qword_26A9670F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9670F0);
  }
  return result;
}

void sub_2629000B0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for MediAPIResourceRequestError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2629001E4);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediAPIResourceRequestError()
{
  return &type metadata for MediAPIResourceRequestError;
}

uint64_t sub_26290021C(uint64_t a1)
{
  return sub_2628D2B98(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16));
}

uint64_t sub_26290023C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  int v9 = *(unsigned __int8 *)(a2 + 50);
  int v10 = *(unsigned __int16 *)(a2 + 48);
  sub_2628FE8A4(*(void *)a2, v4, v5, v6, v7, v8, v10 | (v9 << 16));
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 50) = v9;
  *(_WORD *)(a1 + 48) = v10;
  return a1;
}

uint64_t sub_2629002C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  int v9 = *(unsigned __int8 *)(a2 + 50);
  int v10 = *(unsigned __int16 *)(a2 + 48);
  sub_2628FE8A4(*(void *)a2, v4, v5, v6, v7, v8, v10 | (v9 << 16));
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  unsigned int v17 = *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(_WORD *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 50) = v9;
  sub_2628D2B98(v11, v12, v13, v14, v15, v16, v17);
  return a1;
}

uint64_t sub_262900374(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 50);
  __int16 v4 = *(_WORD *)(a2 + 48);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  unsigned int v11 = *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 50) = v3;
  sub_2628D2B98(v5, v7, v6, v8, v9, v10, v11);
  return a1;
}

uint64_t sub_2629003E0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 51))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 32) >> 2;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

double sub_262900428(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 40) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(unsigned char *)(a1 + 50) = 0;
    *(_WORD *)(a1 + 48) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 51) = 1;
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
      double result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 32) = 4 * -a2;
      *(void *)(a1 + 40) = 0;
      *(unsigned char *)(a1 + 50) = 0;
      *(_WORD *)(a1 + 48) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 51) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_262900490(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 50) >> 6;
}

uint64_t sub_26290049C(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(a1 + 48);
  uint64_t result = a1 + 48;
  *(unsigned char *)(result + 2) = ((v2 | (*(unsigned __int8 *)(result + 2) << 16)) >> 16) & 0x3F;
  *(_WORD *)uint64_t result = v2;
  return result;
}

uint64_t sub_2629004B8(uint64_t a1, int a2)
{
  int v3 = *(unsigned __int16 *)(a1 + 48);
  uint64_t result = a1 + 48;
  unsigned int v4 = (v3 | (*(unsigned __int8 *)(result + 2) << 16)) & 0xFF01FF01;
  *(void *)(result - 16) &= 3uLL;
  *(_WORD *)uint64_t result = v4;
  *(unsigned char *)(result + 2) = (v4 | (a2 << 22)) >> 16;
  return result;
}

void *sub_2629004E8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262900548()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_26290058C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262900604(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262900654(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  unsigned int v8 = *(unsigned __int16 *)(a1 + 64) | (*(unsigned __int8 *)(a1 + 66) << 16);
  return sub_2628D2B98(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_2629006A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  int v10 = *(unsigned __int8 *)(a2 + 66);
  int v11 = *(unsigned __int16 *)(a2 + 64);
  swift_bridgeObjectRetain();
  sub_2628FE8A4(v4, v5, v6, v7, v8, v9, v11 | (v10 << 16));
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 66) = v10;
  *(_WORD *)(a1 + 64) = v11;
  return a1;
}

uint64_t sub_262900740(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  int v10 = *((unsigned __int8 *)v2 + 66);
  LODWORD(v2) = *((unsigned __int16 *)v2 + 32);
  sub_2628FE8A4(v4, v5, v6, v7, v8, v9, v2 | (v10 << 16));
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  unsigned int v17 = *(unsigned __int16 *)(a1 + 64) | (*(unsigned __int8 *)(a1 + 66) << 16);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(_WORD *)(a1 + 64) = (_WORD)v2;
  *(unsigned char *)(a1 + 66) = v10;
  sub_2628D2B98(v11, v12, v13, v14, v15, v16, v17);
  return a1;
}

void *__swift_memcpy67_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x43uLL);
}

uint64_t sub_262900818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 66);
  __int16 v6 = *(_WORD *)(a2 + 64);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  unsigned int v13 = *(unsigned __int16 *)(a1 + 64) | (*(unsigned __int8 *)(a1 + 66) << 16);
  long long v14 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v14;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = v6;
  *(unsigned char *)(a1 + 66) = v5;
  sub_2628D2B98(v7, v8, v9, v10, v11, v12, v13);
  return a1;
}

uint64_t sub_262900890(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 67))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2629008D0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 66) = 0;
    *(_WORD *)(result + 64) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 67) = 1;
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
    *(unsigned char *)(result + 67) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_262900928(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_262900974(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2629009D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262900A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_262900AD8(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_262900B18(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for MediaAPIResourceRequest.Configuration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_262900B7C()
{
  return swift_getWitnessTable();
}

unint64_t sub_262900B9C()
{
  unint64_t result = qword_26A967388;
  if (!qword_26A967388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A967388);
  }
  return result;
}

unint64_t sub_262900BEC()
{
  unint64_t result = qword_26A967390;
  if (!qword_26A967390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A967390);
  }
  return result;
}

uint64_t sub_262900C38()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return sub_2628FE8A4(v3, v2, v4, v0, v1, v5, v6);
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return sub_2628D2B98(v6, v5, v4, v2, v0, v1, v3);
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return sub_262902D70();
}

uint64_t OUTLINED_FUNCTION_15_8()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_16_6()
{
  return sub_2628FE8A4(v6, v5, v4, v2, v3, v0, v1);
}

uint64_t OUTLINED_FUNCTION_17_9()
{
  return sub_2628FE8A4(v6, v5, v2, v1, v4, v3, v0);
}

uint64_t OUTLINED_FUNCTION_18_8()
{
  return sub_262805C98(v0);
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  return *(void *)(v0 + 19528);
}

uint64_t OUTLINED_FUNCTION_22_10()
{
  sub_262805C98(v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_9()
{
  strcpy((char *)(v0 - 144), "/v1/catalog/");
  *(unsigned char *)(v0 - 131) = 0;
  *(_WORD *)(v0 - 130) = -5120;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26_7(uint64_t a1)
{
  return sub_262805C98(a1) + 216;
}

uint64_t OUTLINED_FUNCTION_27_7(uint64_t a1)
{
  return sub_262805C98(a1) + 384;
}

uint64_t OUTLINED_FUNCTION_28_6(uint64_t a1)
{
  return sub_262805C98(a1) + 352;
}

uint64_t OUTLINED_FUNCTION_29_6(uint64_t a1)
{
  return sub_262805C98(a1) + 184;
}

uint64_t OUTLINED_FUNCTION_30_10(uint64_t a1)
{
  return sub_262805C98(a1) + 192;
}

uint64_t OUTLINED_FUNCTION_31_7(uint64_t a1)
{
  return sub_262805C98(a1) + 208;
}

uint64_t OUTLINED_FUNCTION_32_10(uint64_t a1)
{
  return sub_262805C98(a1) + 288;
}

uint64_t OUTLINED_FUNCTION_33_8(uint64_t a1)
{
  return sub_262805C98(a1) + 200;
}

uint64_t OUTLINED_FUNCTION_36_8()
{
  uint64_t v2 = v0[5];
  v0[2455] = v0[4];
  v0[2456] = v2;
  v0[2420] = 0;
  v0[2421] = 0xE000000000000000;
  return sub_2629032A0();
}

void OUTLINED_FUNCTION_37_9()
{
  *(void *)(v0 + 19656) = *(void *)(v0 + 19320);
}

uint64_t OUTLINED_FUNCTION_38_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return sub_2628FE8A4(v20, v22, v21, a17, a19, a16, v19);
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_45_8()
{
  return 0x6E612D6F69647561;
}

uint64_t OUTLINED_FUNCTION_46_6()
{
  return 0x612D6C6D78656C66;
}

uint64_t OUTLINED_FUNCTION_48_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return sub_2628D2B98(a21, v24, v23, v25, a18, v22, v21);
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  *(void *)(v0 + 19312) = v2;
  *(void *)(v0 + 19320) = v1;
  return sub_262902D70();
}

uint64_t OUTLINED_FUNCTION_51_8()
{
  return 0x2D7972617262696CLL;
}

uint64_t OUTLINED_FUNCTION_52_7()
{
  return 0x69762D636973756DLL;
}

uint64_t OUTLINED_FUNCTION_53_7(uint64_t result)
{
  *(void *)(v2 + 19592) = *(void *)(*(void *)(v1 + 56) + 16 * result);
  return result;
}

void OUTLINED_FUNCTION_54_7()
{
  uint64_t v1 = *(void *)(v0 - 136);
  *(void *)(v0 - 144) = *(void *)(v0 - 144);
  *(void *)(v0 - 136) = v1;
}

uint64_t OUTLINED_FUNCTION_56_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_57_6()
{
  return sub_2628D2B98(v3, v2, v4, v0, v1, v5, v6);
}

uint64_t OUTLINED_FUNCTION_58_5()
{
  return sub_2628D2B98(v0, v6, v5, v3, v1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_59_7()
{
  return 0x203A6469203ALL;
}

uint64_t OUTLINED_FUNCTION_60_5()
{
  *(void *)(v0 + 19360) = 0;
  *(void *)(v0 + 19368) = 0xE000000000000000;
  return 19;
}

uint64_t OUTLINED_FUNCTION_61_6()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_62_7()
{
  return sub_2628D2B98(v6, v5, v4, v3, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_63_6()
{
  return sub_262903620();
}

uint64_t OUTLINED_FUNCTION_67_7()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_69_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2628FE8A4(a1, a2, a3, a4, a5, v6, v5);
}

uint64_t OUTLINED_FUNCTION_70_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_71_7()
{
  return v0;
}

void OUTLINED_FUNCTION_72_6()
{
  ++*(void *)(v0 + 19544);
}

uint64_t OUTLINED_FUNCTION_73_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_76_6()
{
  return 0x7365726E6567;
}

uint64_t OUTLINED_FUNCTION_77_6()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_81_7()
{
  void *v0 = 0x8000000000000000;
}

unint64_t OUTLINED_FUNCTION_82_6()
{
  return 0xD000000000000014;
}

void OUTLINED_FUNCTION_87_3()
{
  uint64_t v2 = *(void *)(v0 - 96);
  uint64_t v3 = *(void *)(v2 + 16) + 1;
  sub_262825790(0, v3, 1, v2);
}

uint64_t OUTLINED_FUNCTION_88_7(uint64_t result)
{
  *(void *)(v1 + 19664) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_89_6()
{
  return sub_262902D40();
}

uint64_t OUTLINED_FUNCTION_91_6()
{
  return *(void *)(v0 + 19552);
}

uint64_t OUTLINED_FUNCTION_92_6()
{
  return v0 - 144;
}

uint64_t OUTLINED_FUNCTION_93_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_96_7()
{
  return sub_262903390();
}

uint64_t OUTLINED_FUNCTION_101_7()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_102_6()
{
  return 0xD000000000000011;
}

uint64_t OUTLINED_FUNCTION_107_6()
{
  return sub_2629021D0();
}

uint64_t OUTLINED_FUNCTION_108_5()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_109_5@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_110_6()
{
  return *(void *)(v0 + 19528);
}

uint64_t OUTLINED_FUNCTION_112_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_114_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t FacetCollection<>.contentType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v7, v2, a1);
  return sub_26286D138((uint64_t)v7, a2);
}

uint64_t FacetCollection<>.ContentType.id.getter()
{
  OUTLINED_FUNCTION_50_0();
  sub_262902840();
  uint64_t v0 = sub_262902590();
  swift_bridgeObjectRelease();
  sub_262902D70();
  return v0;
}

uint64_t FacetCollection<>.ContentType.context.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_16_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t FacetCollection<>.ContentType.context.setter(uint64_t a1)
{
  sub_262902850();
  OUTLINED_FUNCTION_16_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*FacetCollection<>.ContentType.context.modify())()
{
  return nullsub_1;
}

uint64_t FacetCollection<>.ContentType.builders.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (void *)v7;
  swift_getExtendedExistentialTypeMetadata();
  sub_2629035E0();
  swift_allocObject();
  uint64_t v10 = sub_262902F20();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v2, a1);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = type metadata accessor for FacetCollection<>.FullyQualifiedContentRegistrationElement();
  uint64_t v19 = v15;
  uint64_t v20 = &v19;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  *(void *)(v16 + 24) = v14;
  swift_getWitnessTable();
  v12[3] = sub_262902720();
  v12[4] = swift_getWitnessTable();
  __swift_allocate_boxed_opaque_existential_1(v12);
  v18[1] = v15;
  v18[0] = swift_getWitnessTable();
  sub_262902710();
  return sub_26281DC1C(v10);
}

uint64_t sub_262901A48(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(unsigned char *)(v2 + 24) = *(unsigned char *)(*(void *)a2 + 16);
  return MEMORY[0x270FA2498](sub_262901A74, 0, 0);
}

uint64_t sub_262901A74()
{
  **(unsigned char **)(v0 + 16) = *(unsigned char *)(v0 + 24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_262901AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v5 = v2;
  v5[1] = sub_2628AA7D8;
  return MEMORY[0x270F76800](a1, a2, WitnessTable);
}

uint64_t sub_262901B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v5 = v2;
  v5[1] = sub_2628AAB0C;
  return MEMORY[0x270F76808](a1, a2, WitnessTable);
}

uint64_t sub_262901C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FacetCollection<>.ContentType.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_262901C60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_262901C70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2628AA7D8;
  return sub_262901A48(a1, a2);
}

uint64_t sub_262901D24()
{
  return swift_getWitnessTable();
}

uint64_t sub_262901D40()
{
  return swift_getWitnessTable();
}

uint64_t sub_262901D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_262901D70);
}

uint64_t sub_262901D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_50_0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_262901DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_262901DCC);
}

uint64_t sub_262901DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_50_0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FacetCollection<>.ContentType()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_262901E30()
{
  return MEMORY[0x270EEDBE8]();
}

uint64_t sub_262901E40()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_262901E50()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_262901E60()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_262901E70()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_262901E80()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_262901E90()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_262901EA0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_262901EB0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_262901EC0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_262901ED0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_262901EE0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_262901EF0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_262901F00()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_262901F10()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_262901F20()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_262901F30()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_262901F40()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_262901F50()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_262901F60()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_262901F70()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_262901F80()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_262901F90()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_262901FA0()
{
  return MEMORY[0x270F76388]();
}

uint64_t sub_262901FB0()
{
  return MEMORY[0x270F76390]();
}

uint64_t sub_262901FC0()
{
  return MEMORY[0x270F76398]();
}

uint64_t sub_262901FD0()
{
  return MEMORY[0x270F763A0]();
}

uint64_t sub_262901FE0()
{
  return MEMORY[0x270F763A8]();
}

uint64_t sub_262901FF0()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_262902000()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_262902010()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_262902020()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_262902030()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_262902040()
{
  return MEMORY[0x270EEFD10]();
}

uint64_t sub_262902050()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_262902060()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_262902070()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_262902080()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_262902090()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2629020A0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_2629020B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2629020C0()
{
  return MEMORY[0x270EF0050]();
}

uint64_t sub_2629020D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2629020E0()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_2629020F0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_262902100()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_262902110()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_262902120()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_262902130()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_262902140()
{
  return MEMORY[0x270F9C7E0]();
}

uint64_t sub_262902150()
{
  return MEMORY[0x270F9C850]();
}

uint64_t sub_262902160()
{
  return MEMORY[0x270F763C8]();
}

uint64_t sub_262902170()
{
  return MEMORY[0x270F763D0]();
}

uint64_t sub_262902180()
{
  return MEMORY[0x270F763D8]();
}

uint64_t sub_262902190()
{
  return MEMORY[0x270F763E0]();
}

uint64_t sub_2629021A0()
{
  return MEMORY[0x270F763E8]();
}

uint64_t sub_2629021B0()
{
  return MEMORY[0x270F763F8]();
}

uint64_t sub_2629021C0()
{
  return MEMORY[0x270F76400]();
}

uint64_t sub_2629021D0()
{
  return MEMORY[0x270F76408]();
}

uint64_t sub_2629021E0()
{
  return MEMORY[0x270F76410]();
}

uint64_t sub_2629021F0()
{
  return MEMORY[0x270F76418]();
}

uint64_t sub_262902200()
{
  return MEMORY[0x270F76420]();
}

uint64_t sub_262902210()
{
  return MEMORY[0x270F76428]();
}

uint64_t sub_262902230()
{
  return MEMORY[0x270F76438]();
}

uint64_t sub_262902240()
{
  return MEMORY[0x270F76440]();
}

uint64_t sub_262902250()
{
  return MEMORY[0x270F76448]();
}

uint64_t sub_262902260()
{
  return MEMORY[0x270F76450]();
}

uint64_t sub_262902280()
{
  return MEMORY[0x270F76460]();
}

uint64_t sub_2629022A0()
{
  return MEMORY[0x270F76478]();
}

uint64_t sub_2629022B0()
{
  return MEMORY[0x270F76480]();
}

uint64_t sub_2629022C0()
{
  return MEMORY[0x270F76488]();
}

uint64_t sub_2629022D0()
{
  return MEMORY[0x270F76490]();
}

uint64_t sub_2629022E0()
{
  return MEMORY[0x270F76498]();
}

uint64_t sub_2629022F0()
{
  return MEMORY[0x270F764A0]();
}

uint64_t sub_262902300()
{
  return MEMORY[0x270F764A8]();
}

uint64_t sub_262902310()
{
  return MEMORY[0x270F764B8]();
}

uint64_t sub_262902320()
{
  return MEMORY[0x270F764C0]();
}

uint64_t sub_262902340()
{
  return MEMORY[0x270F764D8]();
}

uint64_t sub_2629023B0()
{
  return MEMORY[0x270F76538]();
}

uint64_t sub_2629023C0()
{
  return MEMORY[0x270F76540]();
}

uint64_t sub_2629023D0()
{
  return MEMORY[0x270F76548]();
}

uint64_t sub_2629023E0()
{
  return MEMORY[0x270F76550]();
}

uint64_t sub_2629023F0()
{
  return MEMORY[0x270F76558]();
}

uint64_t sub_262902400()
{
  return MEMORY[0x270F76560]();
}

uint64_t sub_262902420()
{
  return MEMORY[0x270F76570]();
}

uint64_t sub_262902440()
{
  return MEMORY[0x270F76580]();
}

uint64_t sub_262902460()
{
  return MEMORY[0x270F765A0]();
}

uint64_t sub_262902470()
{
  return MEMORY[0x270F765A8]();
}

uint64_t sub_262902480()
{
  return MEMORY[0x270F765B0]();
}

uint64_t sub_262902490()
{
  return MEMORY[0x270F765B8]();
}

uint64_t sub_2629024A0()
{
  return MEMORY[0x270F765C0]();
}

uint64_t sub_2629024B0()
{
  return MEMORY[0x270F765C8]();
}

uint64_t sub_2629024C0()
{
  return MEMORY[0x270F765D0]();
}

uint64_t sub_2629024D0()
{
  return MEMORY[0x270F765D8]();
}

uint64_t sub_2629024E0()
{
  return MEMORY[0x270F765E0]();
}

uint64_t sub_2629024F0()
{
  return MEMORY[0x270F765E8]();
}

uint64_t sub_262902500()
{
  return MEMORY[0x270F765F0]();
}

uint64_t sub_262902510()
{
  return MEMORY[0x270F765F8]();
}

uint64_t sub_262902520()
{
  return MEMORY[0x270F76600]();
}

uint64_t sub_262902530()
{
  return MEMORY[0x270F76610]();
}

uint64_t sub_262902540()
{
  return MEMORY[0x270F76620]();
}

uint64_t sub_262902550()
{
  return MEMORY[0x270F76628]();
}

uint64_t sub_262902560()
{
  return MEMORY[0x270F76630]();
}

uint64_t sub_262902570()
{
  return MEMORY[0x270F76638]();
}

uint64_t sub_262902580()
{
  return MEMORY[0x270F76648]();
}

uint64_t sub_262902590()
{
  return MEMORY[0x270F76650]();
}

uint64_t sub_2629025A0()
{
  return MEMORY[0x270F76660]();
}

uint64_t sub_2629025B0()
{
  return MEMORY[0x270F76668]();
}

uint64_t sub_2629025C0()
{
  return MEMORY[0x270F76670]();
}

uint64_t sub_2629025D0()
{
  return MEMORY[0x270F76678]();
}

uint64_t sub_2629025F0()
{
  return MEMORY[0x270F76690]();
}

uint64_t sub_262902610()
{
  return MEMORY[0x270F766A0]();
}

uint64_t sub_262902620()
{
  return MEMORY[0x270F766A8]();
}

uint64_t sub_262902630()
{
  return MEMORY[0x270F766B0]();
}

uint64_t sub_262902640()
{
  return MEMORY[0x270F766B8]();
}

uint64_t sub_262902650()
{
  return MEMORY[0x270F766C0]();
}

uint64_t sub_262902680()
{
  return MEMORY[0x270F766D8]();
}

uint64_t sub_262902690()
{
  return MEMORY[0x270F766E0]();
}

uint64_t sub_2629026A0()
{
  return MEMORY[0x270F766E8]();
}

uint64_t sub_2629026B0()
{
  return MEMORY[0x270F766F0]();
}

uint64_t sub_2629026D0()
{
  return MEMORY[0x270F76700]();
}

uint64_t sub_2629026E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2629026F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_262902700()
{
  return MEMORY[0x270F767A0]();
}

uint64_t sub_262902710()
{
  return MEMORY[0x270F767A8]();
}

uint64_t sub_262902720()
{
  return MEMORY[0x270F767B0]();
}

uint64_t sub_262902730()
{
  return MEMORY[0x270F767B8]();
}

uint64_t sub_262902740()
{
  return MEMORY[0x270F767C0]();
}

uint64_t sub_262902750()
{
  return MEMORY[0x270F767C8]();
}

uint64_t sub_262902760()
{
  return MEMORY[0x270F767D0]();
}

uint64_t sub_262902770()
{
  return MEMORY[0x270F767D8]();
}

uint64_t sub_262902780()
{
  return MEMORY[0x270F767E0]();
}

uint64_t sub_262902790()
{
  return MEMORY[0x270F767E8]();
}

uint64_t sub_2629027B0()
{
  return MEMORY[0x270F767F8]();
}

uint64_t sub_2629027F0()
{
  return MEMORY[0x270F76818]();
}

uint64_t sub_262902800()
{
  return MEMORY[0x270F76830]();
}

uint64_t sub_262902810()
{
  return MEMORY[0x270F76838]();
}

uint64_t sub_262902820()
{
  return MEMORY[0x270F76840]();
}

uint64_t sub_262902830()
{
  return MEMORY[0x270F76848]();
}

uint64_t sub_262902840()
{
  return MEMORY[0x270F76850]();
}

uint64_t sub_262902850()
{
  return MEMORY[0x270F76858]();
}

uint64_t sub_262902860()
{
  return MEMORY[0x270F76860]();
}

uint64_t sub_262902870()
{
  return MEMORY[0x270F76868]();
}

uint64_t sub_262902880()
{
  return MEMORY[0x270F76870]();
}

uint64_t sub_262902890()
{
  return MEMORY[0x270F76878]();
}

uint64_t sub_2629028A0()
{
  return MEMORY[0x270F76880]();
}

uint64_t sub_2629028B0()
{
  return MEMORY[0x270F76888]();
}

uint64_t sub_2629028C0()
{
  return MEMORY[0x270F76890]();
}

uint64_t sub_2629028D0()
{
  return MEMORY[0x270F76898]();
}

uint64_t sub_2629028E0()
{
  return MEMORY[0x270F768B8]();
}

uint64_t sub_2629028F0()
{
  return MEMORY[0x270F768C8]();
}

uint64_t sub_262902900()
{
  return MEMORY[0x270F768D0]();
}

uint64_t sub_262902910()
{
  return MEMORY[0x270F768D8]();
}

uint64_t sub_262902920()
{
  return MEMORY[0x270F768E0]();
}

uint64_t sub_262902930()
{
  return MEMORY[0x270F768E8]();
}

uint64_t sub_262902940()
{
  return MEMORY[0x270F768F0]();
}

uint64_t sub_262902950()
{
  return MEMORY[0x270F768F8]();
}

uint64_t sub_262902960()
{
  return MEMORY[0x270F76900]();
}

uint64_t sub_262902970()
{
  return MEMORY[0x270F76908]();
}

uint64_t sub_262902980()
{
  return MEMORY[0x270F76910]();
}

uint64_t sub_262902990()
{
  return MEMORY[0x270F76918]();
}

uint64_t sub_2629029A0()
{
  return MEMORY[0x270F76920]();
}

uint64_t sub_2629029B0()
{
  return MEMORY[0x270F76928]();
}

uint64_t sub_2629029C0()
{
  return MEMORY[0x270F76930]();
}

uint64_t sub_2629029D0()
{
  return MEMORY[0x270F76938]();
}

uint64_t sub_2629029F0()
{
  return MEMORY[0x270F76948]();
}

uint64_t sub_262902A00()
{
  return MEMORY[0x270F76950]();
}

uint64_t sub_262902A10()
{
  return MEMORY[0x270F76958]();
}

uint64_t sub_262902A20()
{
  return MEMORY[0x270F76960]();
}

uint64_t sub_262902A40()
{
  return MEMORY[0x270F76970]();
}

uint64_t sub_262902A60()
{
  return MEMORY[0x270F76980]();
}

uint64_t sub_262902A80()
{
  return MEMORY[0x270F76990]();
}

uint64_t sub_262902A90()
{
  return MEMORY[0x270F76998]();
}

uint64_t sub_262902AA0()
{
  return MEMORY[0x270F769A0]();
}

uint64_t sub_262902AB0()
{
  return MEMORY[0x270F769A8]();
}

uint64_t sub_262902AD0()
{
  return MEMORY[0x270F769B8]();
}

uint64_t sub_262902AE0()
{
  return MEMORY[0x270F769C0]();
}

uint64_t sub_262902AF0()
{
  return MEMORY[0x270F769C8]();
}

uint64_t sub_262902B00()
{
  return MEMORY[0x270F769D0]();
}

uint64_t sub_262902B10()
{
  return MEMORY[0x270F769D8]();
}

uint64_t sub_262902B20()
{
  return MEMORY[0x270F769E0]();
}

uint64_t sub_262902B40()
{
  return MEMORY[0x270F76A00]();
}

uint64_t sub_262902B50()
{
  return MEMORY[0x270F76A08]();
}

uint64_t sub_262902B60()
{
  return MEMORY[0x270F76A10]();
}

uint64_t sub_262902B80()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_262902B90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_262902BA0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_262902BB0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_262902BC0()
{
  return MEMORY[0x270F9D090]();
}

uint64_t sub_262902BD0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_262902BE0()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_262902BF0()
{
  return MEMORY[0x270F9D130]();
}

uint64_t sub_262902C00()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_262902C10()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_262902C20()
{
  return MEMORY[0x270F9D1E8]();
}

uint64_t sub_262902C30()
{
  return MEMORY[0x270F9D1F0]();
}

uint64_t sub_262902C40()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_262902C50()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_262902C60()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_262902C70()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_262902C80()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_262902C90()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_262902CA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_262902CB0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_262902CC0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_262902CD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_262902CE0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_262902CF0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_262902D00()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_262902D10()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_262902D20()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_262902D30()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_262902D40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_262902D50()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_262902D60()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_262902D70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_262902D80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_262902D90()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_262902DA0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_262902DC0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_262902DD0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_262902DE0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_262902DF0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_262902E00()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_262902E10()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_262902E20()
{
  return MEMORY[0x270F76728]();
}

uint64_t sub_262902E30()
{
  return MEMORY[0x270F76730]();
}

uint64_t sub_262902E40()
{
  return MEMORY[0x270F76738]();
}

uint64_t sub_262902E50()
{
  return MEMORY[0x270F76740]();
}

uint64_t sub_262902E60()
{
  return MEMORY[0x270F76748]();
}

uint64_t sub_262902E70()
{
  return MEMORY[0x270F76750]();
}

uint64_t sub_262902E80()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_262902E90()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_262902EA0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_262902EE0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_262902EF0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_262902F00()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_262902F10()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_262902F20()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_262902F30()
{
  return MEMORY[0x270F76758]();
}

uint64_t sub_262902F40()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_262902F50()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_262902F60()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_262902F70()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_262902F80()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_262902F90()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_262902FA0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_262902FB0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_262902FC0()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_262902FD0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_262902FE0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_262902FF0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_262903000()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_262903010()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_262903020()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_262903030()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_262903050()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_262903060()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_262903080()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_262903090()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2629030A0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2629030B0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2629030C0()
{
  return MEMORY[0x270F9DF48]();
}

uint64_t sub_2629030D0()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_2629030E0()
{
  return MEMORY[0x270F9DFB8]();
}

uint64_t sub_2629030F0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_262903100()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_262903110()
{
  return MEMORY[0x270F76778]();
}

uint64_t sub_262903120()
{
  return MEMORY[0x270F76A98]();
}

uint64_t sub_262903130()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_262903140()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_262903150()
{
  return MEMORY[0x270F76AA0]();
}

uint64_t sub_262903160()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_262903180()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_262903190()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_2629031A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2629031B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2629031C0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2629031D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2629031E0()
{
  return MEMORY[0x270F9E6B0]();
}

uint64_t sub_262903200()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_262903210()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_262903220()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_262903230()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_262903240()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_262903250()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_262903260()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_262903270()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_262903280()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_262903290()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_2629032A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2629032B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2629032C0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2629032D0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2629032F0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_262903300()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_262903310()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_262903330()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_262903340()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_262903350()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_262903360()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_262903370()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_262903380()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_262903390()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2629033A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2629033B0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2629033C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2629033D0()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_2629033E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_262903400()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_262903410()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_262903420()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_262903430()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_262903440()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_262903450()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_262903460()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_262903470()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_262903480()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_262903490()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2629034A0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2629034B0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2629034C0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2629034D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2629034E0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2629034F0()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_262903500()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_262903510()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_262903520()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_262903530()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_262903540()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_262903550()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_262903560()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_262903570()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_262903580()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_262903590()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2629035A0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2629035B0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2629035C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2629035D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2629035E0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2629035F0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_262903600()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_262903610()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_262903620()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_262903660()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_262903670()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_262903680()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_262903690()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2629036A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2629036B0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2629036C0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2629036D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2629036E0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_2629036F0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_262903700()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_262903730()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_262903740()
{
  return MEMORY[0x270FA23B8]();
}

uint64_t sub_262903760()
{
  return MEMORY[0x270FA0128]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x270FA0368]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}