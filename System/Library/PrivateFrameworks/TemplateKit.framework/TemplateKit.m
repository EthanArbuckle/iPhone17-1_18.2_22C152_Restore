uint64_t TLKSnippetModernizationEnabled()
{
  void *v0;
  uint64_t v1;

  if (TLKSnippetModernizationEnabled_onceToken[0] != -1) {
    dispatch_once(TLKSnippetModernizationEnabled_onceToken, &__block_literal_global_31);
  }
  if (!TLKSnippetModernizationEnabled_snippetModernizationEnabled) {
    return 0;
  }
  v0 = +[TLKTrialManager sharedManager];
  v1 = [v0 snippetModernizationEnabled];

  return v1;
}

uint64_t __TLKSnippetModernizationEnabled_block_invoke()
{
  if (+[TLKUtilities isSiri]) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 1;
  }
  TLKSnippetModernizationEnabled_snippetModernizationEnabled = result;
  return result;
}

void sub_1B08952E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0895520(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t TLKBiggerSuggestionsLayoutEnabled()
{
  if (+[TLKUtilities isMacOS]) {
    return 0;
  }
  uint64_t v1 = +[TLKTrialManager sharedManager];
  uint64_t v2 = [v1 biggerSuggestionsLayoutEnabled];

  return v2;
}

void sub_1B08AC7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B08ACFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double *__SK_RGBtoHSV(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 >= a5) {
    double v6 = a4;
  }
  else {
    double v6 = a5;
  }
  if (v6 < a6) {
    double v6 = a6;
  }
  float v7 = v6;
  double v8 = v7;
  *a3 = v7;
  if (v7 == 0.0)
  {
    *uint64_t result = NAN;
    *a2 = 0.0;
    *a3 = 0.0;
  }
  else
  {
    if (a4 <= a5) {
      double v9 = a4;
    }
    else {
      double v9 = a5;
    }
    if (v9 > a6) {
      double v9 = a6;
    }
    float v10 = v9;
    float v11 = v7 - v10;
    *a2 = (float)(v11 / v7);
    double v12 = v11;
    if (v8 == a4)
    {
      double v13 = (a5 - a6) / v12;
    }
    else
    {
      BOOL v14 = v8 == a5;
      double v15 = (a4 - a5) / v12 + 4.0;
      double v13 = (a6 - a4) / v12 + 2.0;
      if (!v14) {
        double v13 = v15;
      }
    }
    double v16 = v13 * 60.0;
    if (v16 < 0.0) {
      double v16 = v16 + 360.0;
    }
    *uint64_t result = v16;
  }
  return result;
}

void sub_1B08B7BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t sub_1B08C0B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 2, a1);
}

uint64_t sub_1B08C0BA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for ComputationTracker.State();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ComputationTracker.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B08C0C68(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for ComputationTracker.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1B08C0D20())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B08C0D88()
{
  uint64_t v1 = *(void *)(v0 + *(void *)(*(void *)v0 + 104));
  swift_retain();
  return v1;
}

uint64_t sub_1B08C0DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1B08C0E20(a1, a2);
  return v4;
}

uint64_t *sub_1B08C0E20(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(*(void *)(v5 + 80) - 8) + 56))((uint64_t)v2 + *(void *)(*v2 + 96), 1, 2, *(void *)(v5 + 80));
  uint64_t v6 = *(void *)(*v2 + 112);
  sub_1B08CE338();
  *(uint64_t *)((char *)v2 + v6) = sub_1B08CE2B8();
  float v7 = (uint64_t *)((char *)v2 + *(void *)(*v2 + 104));
  *float v7 = a1;
  v7[1] = a2;
  return v2;
}

uint64_t sub_1B08C0F20()
{
  sub_1B08CE338();
  return sub_1B08CE2B8();
}

uint64_t sub_1B08C0F68()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B08C0FC0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + *(void *)(*(void *)v1 + 112));
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B08C1020())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B08C108C(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  v2[5] = v3;
  uint64_t v4 = sub_1B08CE338();
  v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(void *)(v5 + 64);
  v2[9] = swift_task_alloc();
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  type metadata accessor for ComputationTracker.State();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B08C122C, v1, 0);
}

uint64_t sub_1B08C122C()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 40);
  (*(void (**)(void))(**(void **)(v0 + 32) + 120))();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 2, v3);
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v5 = *(void *)(v0 + 104);
      uint64_t v6 = *(void *)(v0 + 80);
      uint64_t v8 = *(void *)(v0 + 32);
      uint64_t v7 = *(void *)(v0 + 40);
      double v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      *(void *)(v0 + 128) = v9;
      *(void *)(v0 + 136) = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v9(v5, 2, 2, v7);
      float v10 = *(void (**)(uint64_t))(*(void *)v8 + 128);
      uint64_t v11 = (*(void *)v8 + 128) & 0xFFFFFFFFFFFFLL | 0x69A7000000000000;
      *(void *)(v0 + 144) = v10;
      *(void *)(v0 + 152) = v11;
      v10(v5);
      v22 = (uint64_t (*)(uint64_t))(*(void *)(v8 + *(void *)(*(void *)v8 + 104))
                                            + **(int **)(v8 + *(void *)(*(void *)v8 + 104)));
      double v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v12;
      *double v12 = v0;
      v12[1] = sub_1B08C16E8;
      uint64_t v13 = *(void *)(v0 + 96);
      return v22(v13);
    }
    else
    {
      uint64_t v16 = *(void *)(v0 + 32);
      type metadata accessor for ComputationTracker();
      uint64_t WitnessTable = swift_getWitnessTable();
      v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v18;
      void *v18 = v0;
      v18[1] = sub_1B08C1548;
      uint64_t v19 = *(void *)(v0 + 32);
      uint64_t v20 = *(void *)(v0 + 40);
      uint64_t v21 = *(void *)(v0 + 24);
      return MEMORY[0x1F41880D8](v21, v16, WitnessTable, 0x28657475706D6F63, 0xE900000000000029, sub_1B08C8C28, v19, v20);
    }
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 80) + 32))(*(void *)(v0 + 24), *(void *)(v0 + 112), *(void *)(v0 + 40));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    double v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t sub_1B08C1548()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B08C1658, v1, 0);
}

uint64_t sub_1B08C1658()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B08C16E8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B08C17F8, v1, 0);
}

uint64_t sub_1B08C17F8()
{
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[18];
  uint64_t v2 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[16];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[4];
  uint64_t v21 = *(void (**)(uint64_t, void, uint64_t))(v0[10] + 16);
  v21(v3, v0[12], v4);
  v2(v3, 0, 2, v4);
  uint64_t v7 = v1(v3);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 152))(v7);
  if (MEMORY[0x1B3E99050](v8, v5))
  {
    uint64_t v9 = 0;
    uint64_t v10 = v0[7];
    uint64_t v20 = v0[8];
    do
    {
      char v11 = sub_1B08CE2C8();
      sub_1B08CE298();
      if (v11)
      {
        (*(void (**)(void, unint64_t, void))(v10 + 16))(v0[9], v8+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v9, v0[6]);
        uint64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t result = sub_1B08CE428();
        if (v20 != 8)
        {
          __break(1u);
          return result;
        }
        uint64_t v16 = result;
        uint64_t v17 = v0[9];
        uint64_t v18 = v0[6];
        v0[2] = v16;
        (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v17, v0 + 2, v18);
        swift_unknownObjectRelease();
        uint64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_10:
          __break(1u);
          break;
        }
      }
      uint64_t v13 = v0[9];
      uint64_t v14 = v0[6];
      v21(v0[11], v0[12], v0[5]);
      sub_1B08CE328();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v14);
      ++v9;
    }
    while (v12 != MEMORY[0x1B3E99050](v8, v14));
  }
  swift_bridgeObjectRelease();
  (*(void (**)(void, void, void))(v0[10] + 32))(v0[3], v0[12], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_1B08C1A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B08CE338();
  MEMORY[0x1F4188790](v4, v5);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(&v10[-v6], a1, v4);
  uint64_t v8 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)a2 + 168))(v10);
  sub_1B08CE308();
  sub_1B08CE2E8();
  return v8(v10, 0);
}

uint64_t sub_1B08C1BD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = type metadata accessor for ComputationTracker.State();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5, v7);
  uint64_t v10 = (char *)&v14 - v9;
  (*(void (**)(uint64_t))(v3 + 120))(v8);
  uint64_t v11 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 2, v4))
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
    uint64_t v12 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v10, v4);
    uint64_t v12 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, v12, 1, v4);
}

uint64_t sub_1B08C1D8C()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = type metadata accessor for ComputationTracker.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B08C1E58()
{
  sub_1B08C1D8C();
  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1B08C1E84()
{
  return v0;
}

uint64_t sub_1B08C1E90()
{
  return sub_1B08C1E84();
}

unint64_t sub_1B08C1EAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46778);
  uint64_t v2 = (void *)sub_1B08CE538();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    id v6 = *v4;
    id v7 = *v4;
    id v8 = v5;
    unint64_t result = sub_1B08C7BC0((uint64_t)v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = 8 * result;
    *(void *)(v2[6] + v11) = v8;
    *(void *)(v2[7] + v11) = v6;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v14;
    if (!--v3)
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

unint64_t sub_1B08C1FB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46768);
  uint64_t v2 = (void *)sub_1B08CE538();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_retain();
    unint64_t result = sub_1B08C7BC0((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_1B08C20BC(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_1B08C7BC0((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void *)(*(void *)(a2 + 56) + 8 * v6);
        swift_retain();
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_1B08CE4C8();

  if (!v4) {
    return 0;
  }
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46720);
  swift_dynamicCast();
  uint64_t v5 = v9;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_1B08C2188()
{
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1B08CE218();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9B47070);
}

uint64_t sub_1B08C21EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return MEMORY[0x1F4188298](sub_1B08C2210, 0, 0);
}

uint64_t sub_1B08C2210()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 10;
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1B08CE218();
  v0[19] = __swift_project_value_buffer(v3, (uint64_t)qword_1E9B47070);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_1B08CE1F8();
  os_log_type_t v5 = sub_1B08CE3B8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v6 = 138412546;
    id v7 = objc_msgSend(self, sel_currentThread);
    v0[10] = v7;
    sub_1B08CE3E8();
    *uint64_t v17 = v7;
    *(_WORD *)(v6 + 12) = 2080;
    unint64_t v8 = sub_1B08CD1CC();
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x1B3E98FD0](v9, v8);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[10] = sub_1B08C7568(v10, v12, &v19);
    sub_1B08CE3E8();
    uint64_t v2 = v0 + 10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, v4, v5, "[%@]: fetching keys %s", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v18, -1, -1);
    MEMORY[0x1B3E99C70](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  BOOL v13 = (void *)v0[18];
  v1[20] = sub_1B08CD1CC();
  uint64_t v14 = sub_1B08CE258();
  v1[21] = v14;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_1B08C2578;
  uint64_t v15 = swift_continuation_init();
  v1[10] = MEMORY[0x1E4F143A8];
  v1[11] = 0x40000000;
  v1[12] = sub_1B08C2A40;
  v1[13] = &block_descriptor;
  v1[14] = v15;
  objc_msgSend(v13, sel_computeObjectsForKeys_completionHandler_, v14, v2);
  return MEMORY[0x1F41881E8](v1 + 2);
}

uint64_t sub_1B08C2578()
{
  return MEMORY[0x1F4188298](sub_1B08C2658, 0, 0);
}

uint64_t sub_1B08C2658()
{
  uint64_t v29 = v0;
  unint64_t v1 = *(void *)(v0 + 136);
  unint64_t v2 = *(void *)(v0 + 120);

  if (!v2) {
    unint64_t v2 = MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = sub_1B08C2AC0(v2);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B08CE4F8();
  }
  else
  {
    uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (*(void *)(v3 + 16) < v4) {
    uint64_t v4 = *(void *)(v3 + 16);
  }
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46778);
    uint64_t v5 = sub_1B08CE538();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4FBC868];
  }
  uint64_t v6 = *(void *)(v0 + 136);
  v28[0] = v5;
  sub_1B08CA1DC(v6, v3, 1, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v28[0];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B08CE1F8();
  os_log_type_t v9 = sub_1B08CE3B8();
  if (os_log_type_enabled(v8, v9))
  {
    log = v8;
    uint64_t v10 = *(void *)(v0 + 160);
    uint64_t v24 = v7;
    uint64_t v11 = swift_slowAlloc();
    v25 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v28[0] = v27;
    *(_DWORD *)uint64_t v11 = 138412802;
    id v12 = objc_msgSend(self, sel_currentThread);
    *(void *)(v0 + 80) = v12;
    sub_1B08CE3E8();
    void *v25 = v12;
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x1B3E98FD0](v13, v10);
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 80) = sub_1B08C7568(v14, v16, v28);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2080;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x1B3E98FD0](v17, v10);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 80) = sub_1B08C7568(v18, v20, v28);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    unint64_t v8 = log;
    _os_log_impl(&dword_1B088B000, log, v9, "[%@]: fetched keys %s, %s", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v27, -1, -1);
    uint64_t v21 = v11;
    uint64_t v7 = v24;
    MEMORY[0x1B3E99C70](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  **(void **)(v0 + 128) = v7;
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_1B08C2A40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_1B08CD1CC();
    uint64_t v3 = sub_1B08CE268();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v5 = v3;
  sub_1B08CDED0((uint64_t)&v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_1E9B46700);
  return swift_continuation_resume();
}

uint64_t sub_1B08C2AC0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1B08CE478();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v4 = 0;
        do
        {
          uint64_t v5 = v4 + 1;
          uint64_t v10 = (void *)MEMORY[0x1B3E99190]();
          sub_1B08CD1CC();
          id v6 = v10;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_1B08CE458();
          sub_1B08CE488();
          sub_1B08CE498();
          sub_1B08CE468();
          uint64_t v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        uint64_t v7 = (void **)(a1 + 32);
        sub_1B08CD1CC();
        do
        {
          unint64_t v8 = *v7++;
          id v9 = v8;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
          swift_dynamicCast();

          sub_1B08CE458();
          sub_1B08CE488();
          sub_1B08CE498();
          sub_1B08CE468();
          --v2;
        }
        while (v2);
      }
      return v11;
    }
  }
  return result;
}

uint64_t sub_1B08C2CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[29] = a2;
  v3[30] = a3;
  v3[28] = a1;
  return MEMORY[0x1F4188298](sub_1B08C2D34, 0, 0);
}

uint64_t sub_1B08C2D34()
{
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[29];
  uint64_t v2 = sub_1B08CE218();
  v0[31] = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B47070);
  id v3 = v1;
  uint64_t v4 = sub_1B08CE1F8();
  os_log_type_t v5 = sub_1B08CE3B8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[29];
  if (v6)
  {
    os_log_type_t type = v5;
    uint64_t v8 = swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = objc_msgSend(self, sel_currentThread);
    v0[26] = v10;
    sub_1B08CE3E8();
    *id v9 = v10;
    *(_WORD *)(v8 + 12) = 2112;
    v0[27] = v7;
    id v11 = v7;
    sub_1B08CE3E8();
    v9[1] = v7;

    _os_log_impl(&dword_1B088B000, v4, type, "[%@]: fetching key %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v9, -1, -1);
    MEMORY[0x1B3E99C70](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v0[29];
  id v12 = (void *)v0[30];
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_1B08C3024;
  uint64_t v14 = swift_continuation_init();
  v0[16] = MEMORY[0x1E4F143A8];
  v0[17] = 0x40000000;
  v0[18] = sub_1B08C3408;
  v0[19] = &block_descriptor_85;
  v0[20] = v14;
  objc_msgSend(v12, sel_computeObjectForKey_completionHandler_, v13, v0 + 16);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1B08C3024()
{
  return MEMORY[0x1F4188298](sub_1B08C3130, 0, 0);
}

uint64_t sub_1B08C3130()
{
  uint64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = *(void **)(v0 + 168);
  id v3 = v2;
  id v4 = v1;
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = sub_1B08CE1F8();
  os_log_type_t v8 = sub_1B08CE3B8();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v23 = v8;
    uint64_t v22 = v7;
    id v9 = *(void **)(v0 + 232);
    uint64_t v10 = swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412802;
    id v12 = objc_msgSend(self, sel_currentThread);
    *(void *)(v0 + 176) = v12;
    sub_1B08CE3E8();
    *id v11 = v12;
    *(_WORD *)(v10 + 12) = 2112;
    *(void *)(v0 + 184) = v9;
    id v13 = v9;
    sub_1B08CE3E8();
    v11[1] = v9;

    *(_WORD *)(v10 + 22) = 2112;
    if (v2)
    {
      *(void *)(v0 + 200) = v5;
      id v14 = v5;
    }
    else
    {
      *(void *)(v0 + 192) = 0;
    }
    sub_1B08CE3E8();
    unint64_t v16 = v22;
    v11[2] = v2;

    _os_log_impl(&dword_1B088B000, v22, v23, "[%@]: fetched key %@, %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v11, -1, -1);
    MEMORY[0x1B3E99C70](v10, -1, -1);
    unint64_t v15 = *(NSObject **)(v0 + 232);
  }
  else
  {

    unint64_t v15 = *(NSObject **)(v0 + 232);
    unint64_t v16 = v15;
  }
  uint64_t v17 = *(unint64_t **)(v0 + 224);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B466F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B08D3AB0;
  *(void *)(inited + 32) = v15;
  *(void *)(inited + 40) = v2;
  unint64_t v19 = v15;
  *uint64_t v17 = sub_1B08C1EAC(inited);
  unint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_1B08C3408(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_1B08CDED0((uint64_t)&v6, v3, (uint64_t *)&unk_1E9B46758);
  return swift_continuation_resume();
}

uint64_t sub_1B08C346C(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v6) {
      break;
    }
    uint64_t v13 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1B08CE478();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1B3E99190](v8, a3);
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return swift_release();
      }
      ++v8;
      sub_1B08CE458();
      sub_1B08CE488();
      sub_1B08CE498();
      sub_1B08CE468();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B08C35DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46750);
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B08C36E4, 0, 0);
}

uint64_t sub_1B08C36E4()
{
  unint64_t v1 = *(void *)(v0 + 120);
  unint64_t v25 = sub_1B08C1EAC(MEMORY[0x1E4FBC860]);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B08CE4F8();
    uint64_t v2 = v3;
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46740);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46788);
    sub_1B08CE398();
    *(void *)(v0 + 168) = v25;
    os_log_type_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v23;
    *os_log_type_t v23 = v0;
    v23[1] = sub_1B08C3AAC;
    uint64_t v6 = *(void *)(v0 + 128);
    uint64_t v3 = v0 + 72;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v7 = v0 + 80;
    return MEMORY[0x1F4187E48](v3, v4, v5, v6, v7);
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v3 = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v8 = 0;
    unint64_t v27 = v1 & 0xC000000000000001;
    uint64_t v26 = *(void *)(v0 + 120) + 32;
    uint64_t v28 = v2;
    while (1)
    {
      if (v27)
      {
        uint64_t v10 = MEMORY[0x1B3E99190](v8, *(void *)(v0 + 120));
      }
      else
      {
        uint64_t v10 = *(void *)(v26 + 8 * v8);
        swift_retain();
      }
      uint64_t v12 = *(void *)(v0 + 152);
      uint64_t v11 = *(void *)(v0 + 160);
      uint64_t v13 = sub_1B08CE388();
      uint64_t v14 = *(void *)(v13 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1, 1, v13);
      unint64_t v15 = (void *)swift_allocObject();
      v15[2] = 0;
      unint64_t v16 = v15 + 2;
      v15[3] = 0;
      v15[4] = v10;
      sub_1B08CD72C(v11, v12);
      LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
      swift_retain();
      uint64_t v17 = *(void *)(v0 + 152);
      if (v12 == 1)
      {
        sub_1B08CD0B4(*(void *)(v0 + 152));
        if (!*v16) {
          goto LABEL_13;
        }
      }
      else
      {
        sub_1B08CE378();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
        if (!*v16)
        {
LABEL_13:
          uint64_t v18 = 0;
          uint64_t v20 = 0;
          goto LABEL_14;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v18 = sub_1B08CE318();
      uint64_t v20 = v19;
      swift_unknownObjectRelease();
LABEL_14:
      uint64_t v21 = **(void **)(v0 + 112);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46740);
      uint64_t v22 = v20 | v18;
      if (v20 | v18)
      {
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        uint64_t v22 = v0 + 16;
        *(void *)(v0 + 32) = v18;
        *(void *)(v0 + 40) = v20;
      }
      ++v8;
      uint64_t v9 = *(void *)(v0 + 160);
      *(void *)(v0 + 48) = 1;
      *(void *)(v0 + 56) = v22;
      *(void *)(v0 + 64) = v21;
      swift_task_create();
      swift_release();
      swift_release();
      sub_1B08CD0B4(v9);
      if (v28 == v8) {
        goto LABEL_17;
      }
    }
  }
  __break(1u);
  return MEMORY[0x1F4187E48](v3, v4, v5, v6, v7);
}

uint64_t sub_1B08C3AAC()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    unint64_t v1 = sub_1B08C40B8;
  }
  else
  {
    unint64_t v1 = sub_1B08C3BC4;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1B08C3BC4()
{
  uint64_t v2 = v0 + 9;
  uint64_t v1 = v0[9];
  if (v1)
  {
    v51 = v0 + 11;
    v52 = v0 + 12;
    uint64_t v3 = -1;
    uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
    if (-v4 < 64) {
      uint64_t v3 = ~(-1 << -(char)v4);
    }
    unint64_t v5 = v3 & *(void *)(v1 + 64);
    int64_t v53 = (unint64_t)(63 - v4) >> 6;
    uint64_t v6 = (void *)v0[21];
    uint64_t v7 = v1 + 64;
    uint64_t v8 = swift_bridgeObjectRetain();
    int64_t v13 = 0;
    while (1)
    {
      while (1)
      {
        if (v5)
        {
          unint64_t v17 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
          unint64_t v18 = v17 | (v13 << 6);
        }
        else
        {
          int64_t v19 = v13 + 1;
          if (__OFADD__(v13, 1))
          {
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v19 >= v53) {
            goto LABEL_44;
          }
          unint64_t v20 = *(void *)(v7 + 8 * v19);
          ++v13;
          if (!v20)
          {
            int64_t v13 = v19 + 1;
            if (v19 + 1 >= v53) {
              goto LABEL_44;
            }
            unint64_t v20 = *(void *)(v7 + 8 * v13);
            if (!v20)
            {
              int64_t v13 = v19 + 2;
              if (v19 + 2 >= v53) {
                goto LABEL_44;
              }
              unint64_t v20 = *(void *)(v7 + 8 * v13);
              if (!v20)
              {
                int64_t v13 = v19 + 3;
                if (v19 + 3 >= v53) {
                  goto LABEL_44;
                }
                unint64_t v20 = *(void *)(v7 + 8 * v13);
                if (!v20)
                {
                  int64_t v13 = v19 + 4;
                  if (v19 + 4 >= v53) {
                    goto LABEL_44;
                  }
                  unint64_t v20 = *(void *)(v7 + 8 * v13);
                  if (!v20)
                  {
                    int64_t v21 = v19 + 5;
                    if (v21 >= v53)
                    {
LABEL_44:
                      swift_release();
                      swift_bridgeObjectRelease();
                      v50[21] = v6;
                      v43 = (void *)swift_task_alloc();
                      v50[22] = v43;
                      void *v43 = v50;
                      v43[1] = sub_1B08C3AAC;
                      uint64_t v11 = v50[16];
                      uint64_t v8 = (uint64_t)v2;
                      uint64_t v9 = 0;
                      uint64_t v10 = 0;
                      uint64_t v12 = v50 + 10;
                      return MEMORY[0x1F4187E48](v8, v9, v10, v11, v12);
                    }
                    unint64_t v20 = *(void *)(v7 + 8 * v21);
                    if (!v20)
                    {
                      while (1)
                      {
                        int64_t v13 = v21 + 1;
                        if (__OFADD__(v21, 1)) {
                          break;
                        }
                        if (v13 >= v53) {
                          goto LABEL_44;
                        }
                        unint64_t v20 = *(void *)(v7 + 8 * v13);
                        ++v21;
                        if (v20) {
                          goto LABEL_30;
                        }
                      }
LABEL_55:
                      __break(1u);
LABEL_56:
                      __break(1u);
                      return MEMORY[0x1F4187E48](v8, v9, v10, v11, v12);
                    }
                    int64_t v13 = v21;
                  }
                }
              }
            }
          }
LABEL_30:
          unint64_t v5 = (v20 - 1) & v20;
          unint64_t v18 = __clz(__rbit64(v20)) + (v13 << 6);
        }
        uint64_t v24 = *(void *)(v1 + 16);
        id v25 = *(id *)(*(void *)(v1 + 48) + 8 * v18);
        uint64_t v26 = v25;
        if (v24) {
          break;
        }
LABEL_6:
        swift_bridgeObjectRetain();
        unint64_t v14 = sub_1B08C7BC0((uint64_t)v26);
        char v16 = v15;
        swift_bridgeObjectRelease();
        if (v16)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          void *v51 = v6;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_1B08C8A68();
            uint64_t v6 = (void *)*v51;
          }

          os_log_type_t v23 = *(void **)(v6[7] + 8 * v14);
          sub_1B08C85A4(v14, (uint64_t)v6);
          swift_bridgeObjectRelease();
        }
        else
        {
        }
      }
      id v27 = v25;
      unint64_t v28 = sub_1B08C7BC0((uint64_t)v27);
      if ((v29 & 1) == 0)
      {

        goto LABEL_6;
      }
      v48 = v2;
      uint64_t v49 = v7;
      uint64_t v30 = *(void **)(*(void *)(v1 + 56) + 8 * v28);
      id v31 = v30;

      char v32 = swift_isUniquelyReferenced_nonNull_native();
      void *v52 = v6;
      unint64_t v33 = sub_1B08C7BC0((uint64_t)v27);
      uint64_t v34 = v6[2];
      BOOL v35 = (v9 & 1) == 0;
      uint64_t v8 = v34 + v35;
      if (__OFADD__(v34, v35)) {
        goto LABEL_54;
      }
      char v36 = v9;
      if (v6[3] >= v8)
      {
        if ((v32 & 1) == 0) {
          uint64_t v8 = (uint64_t)sub_1B08C8A68();
        }
      }
      else
      {
        sub_1B08C82D0(v8, v32);
        uint64_t v8 = sub_1B08C7BC0((uint64_t)v27);
        if ((v36 & 1) != (v9 & 1))
        {
          sub_1B08CD1CC();
          return sub_1B08CE578();
        }
        unint64_t v33 = v8;
      }
      uint64_t v6 = (void *)*v52;
      if (v36)
      {
        uint64_t v37 = v6[7];

        *(void *)(v37 + 8 * v33) = v30;
      }
      else
      {
        v6[(v33 >> 6) + 8] |= 1 << v33;
        uint64_t v38 = 8 * v33;
        *(void *)(v6[6] + v38) = v27;
        *(void *)(v6[7] + v38) = v30;
        uint64_t v39 = v6[2];
        BOOL v40 = __OFADD__(v39, 1);
        uint64_t v41 = v39 + 1;
        if (v40) {
          goto LABEL_56;
        }
        v6[2] = v41;
        id v42 = v27;
      }
      swift_bridgeObjectRelease();

      uint64_t v2 = v48;
      uint64_t v7 = v49;
    }
  }
  uint64_t v44 = v0[21];
  v45 = (void *)v0[13];
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  void *v45 = v44;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v46 = (uint64_t (*)(void))v0[1];
  return v46();
}

uint64_t sub_1B08C40B8()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1B08C4154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)a4 + 176) + **(int **)(*(void *)a4 + 176));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_1B08C4260;
  return v8(a1);
}

uint64_t sub_1B08C4260()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B08C4358()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1B08C4390()
{
  type metadata accessor for SingleCallingActor();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = sub_1B08C1FB0(MEMORY[0x1E4FBC860]);
  return v0;
}

unint64_t sub_1B08C43D8()
{
  return sub_1B08C1EAC(MEMORY[0x1E4FBC860]);
}

uint64_t sub_1B08C43E4()
{
  uint64_t v0 = sub_1B08CE218();
  __swift_allocate_value_buffer(v0, qword_1E9B47070);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9B47070);
  return sub_1B08CE208();
}

uint64_t sub_1B08C4460@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B08CE218();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B47070);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

id TLKAsyncCache.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id TLKAsyncCache.init()()
{
  uint64_t v1 = OBJC_IVAR___TLKAsyncCache_cache;
  type metadata accessor for SingleCallingActor();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v0;
  swift_defaultActor_initialize();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  *(void *)(v2 + 112) = sub_1B08C1FB0(MEMORY[0x1E4FBC860]);
  *(void *)&v0[v1] = v2;
  uint64_t v5 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
  *(void *)&v3[v5] = sub_1B08C1EAC(v4);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for TLKAsyncCache();
  id v6 = objc_msgSendSuper2(&v12, sel_init);
  uint64_t v7 = self;
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_clear, *MEMORY[0x1E4FB2650], 0);

  id v10 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v8, sel_clear, *MEMORY[0x1E4FB2640], 0);

  return v8;
}

uint64_t sub_1B08C46B4(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  sub_1B08CE358();
  v3[6] = sub_1B08CE348();
  uint64_t v5 = sub_1B08CE318();
  return MEMORY[0x1F4188298](sub_1B08C4750, v5, v4);
}

uint64_t sub_1B08C4750()
{
  unint64_t v96 = v0;
  unint64_t v1 = v0;
  swift_release();
  if (qword_1E9B46F00 != -1) {
LABEL_44:
  }
    swift_once();
  uint64_t v2 = (uint64_t *)(v1 + 16);
  v89 = (void *)v1;
  v1 += 24;
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = sub_1B08CE218();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9B47070);
  id v5 = v3;
  swift_bridgeObjectRetain_n();
  id v6 = v5;
  uint64_t v7 = sub_1B08CE1F8();
  os_log_type_t v8 = sub_1B08CE3B8();
  BOOL v9 = os_log_type_enabled(v7, v8);
  id v10 = *(void **)(v1 + 16);
  os_log_t log = (os_log_t)v1;
  v80 = v2;
  if (v9)
  {
    uint64_t v11 = swift_slowAlloc();
    v85 = (void *)swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    v95 = (void *)v92;
    *(_DWORD *)uint64_t v11 = 136315650;
    id v12 = v10;
    id v13 = objc_msgSend(v12, sel_description);
    uint64_t v14 = sub_1B08CE228();
    unint64_t v16 = v15;

    uint64_t v17 = v14;
    unint64_t v1 = (unint64_t)log;
    *uint64_t v2 = sub_1B08C7568(v17, v16, (uint64_t *)&v95);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2112;
    id v18 = objc_msgSend(self, sel_currentThread);
    *uint64_t v2 = (uint64_t)v18;
    sub_1B08CE3E8();
    void *v85 = v18;
    *(_WORD *)(v11 + 22) = 2080;
    unint64_t v19 = sub_1B08CD1CC();
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = MEMORY[0x1B3E98FD0](v20, v19);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    *uint64_t v2 = sub_1B08C7568(v21, v23, (uint64_t *)&v95);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, v7, v8, "[%s|%@]: Began lookahead update for %s", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v85, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v92, -1, -1);
    MEMORY[0x1B3E99C70](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  uint64_t v83 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
  uint64_t v84 = v89[5];
  uint64_t v24 = *(void **)(v84 + OBJC_IVAR___TLKAsyncCache_lookaheadCache);
  unint64_t v25 = v89[3];
  if (!(v25 >> 62))
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v26) {
      goto LABEL_7;
    }
LABEL_46:
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1B08CE4F8();
  uint64_t v26 = result;
  if (!result) {
    goto LABEL_46;
  }
LABEL_7:
  unint64_t v28 = v25 & 0xC000000000000001;
  if ((v25 & 0xC000000000000001) != 0)
  {
    id v29 = (id)MEMORY[0x1B3E99190](0, *(void *)v1);
  }
  else
  {
    if (!*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v29 = *(id *)(*(void *)v1 + 32);
  }
  uint64_t v30 = v29;
  uint64_t v31 = v89[4];
  uint64_t v86 = *(void *)(v31 + 16);
  if (!v86)
  {

    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    v59 = (void *)v89[5];
    *(void *)(v84 + v83) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v60 = v59;
    swift_bridgeObjectRetain_n();
    id v61 = v60;
    v62 = sub_1B08CE1F8();
    os_log_type_t v63 = sub_1B08CE3B8();
    BOOL v64 = os_log_type_enabled(v62, v63);
    v65 = (void *)v89[5];
    if (v64)
    {
      uint64_t v66 = swift_slowAlloc();
      v87 = (void *)swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      v95 = (void *)v94;
      *(_DWORD *)uint64_t v66 = 136315650;
      os_log_type_t typea = v63;
      id v67 = v65;
      id v68 = objc_msgSend(v67, sel_description);
      uint64_t v69 = sub_1B08CE228();
      unint64_t v71 = v70;

      uint64_t *v80 = sub_1B08C7568(v69, v71, (uint64_t *)&v95);
      sub_1B08CE3E8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v66 + 12) = 2112;
      id v72 = objc_msgSend(self, sel_currentThread);
      uint64_t *v80 = (uint64_t)v72;
      sub_1B08CE3E8();
      void *v87 = v72;
      *(_WORD *)(v66 + 22) = 2080;
      unint64_t v73 = sub_1B08CD1CC();
      uint64_t v74 = swift_bridgeObjectRetain();
      uint64_t v75 = MEMORY[0x1B3E98FD0](v74, v73);
      unint64_t v77 = v76;
      swift_bridgeObjectRelease();
      uint64_t *v80 = sub_1B08C7568(v75, v77, (uint64_t *)&v95);
      sub_1B08CE3E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B088B000, v62, typea, "[%s|%@]: Completed lookahead update for %s", (uint8_t *)v66, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
      swift_arrayDestroy();
      MEMORY[0x1B3E99C70](v87, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1B3E99C70](v94, -1, -1);
      MEMORY[0x1B3E99C70](v66, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    uint64_t v78 = *(void *)(v84 + v83);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v79 = (uint64_t (*)(uint64_t))v89[1];
    return v79(v78);
  }
  uint64_t v32 = 0;
  uint64_t v81 = v89[3] + 40;
  uint64_t v82 = v25 & 0xFFFFFFFFFFFFFF8;
  *(void *)os_log_type_t type = v26 - 1;
  uint64_t v93 = v31 + 32;
  uint64_t v33 = *(void *)(v31 + 16);
  while (1)
  {
    BOOL v35 = *(void **)(v93 + 8 * v32);
    if (!v35)
    {

      goto LABEL_31;
    }
    uint64_t v36 = v24[2];
    id v37 = v35;
    if (v36)
    {
      id v38 = v30;
      sub_1B08C7BC0((uint64_t)v38);
      char v40 = v39;

      if (v40)
      {

        goto LABEL_31;
      }
    }
    unint64_t v41 = v28;
    id v42 = v37;
    id v43 = v30;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v95 = v24;
    unint64_t v1 = sub_1B08C7BC0((uint64_t)v43);
    uint64_t v46 = v24[2];
    BOOL v47 = (v45 & 1) == 0;
    uint64_t v48 = v46 + v47;
    if (__OFADD__(v46, v47))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    char v49 = v45;
    if (v24[3] < v48) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v52 = 8 * v1;
      if ((v45 & 1) == 0) {
        goto LABEL_28;
      }
    }
    else
    {
      sub_1B08C8A68();
      uint64_t v24 = v95;
      uint64_t v52 = 8 * v1;
      if ((v49 & 1) == 0)
      {
LABEL_28:
        v24[(v1 >> 6) + 8] |= 1 << v1;
        *(void *)(v24[6] + v52) = v43;
        *(void *)(v24[7] + v52) = v35;
        uint64_t v54 = v24[2];
        BOOL v55 = __OFADD__(v54, 1);
        uint64_t v56 = v54 + 1;
        if (v55) {
          goto LABEL_43;
        }
        v24[2] = v56;
        id v57 = v43;
        goto LABEL_30;
      }
    }
LABEL_26:
    uint64_t v53 = v24[7];

    *(void *)(v53 + v52) = v35;
LABEL_30:
    swift_bridgeObjectRelease();

    uint64_t v33 = v86;
    unint64_t v1 = (unint64_t)log;
    unint64_t v28 = v41;
LABEL_31:
    if (*(void *)type == v32) {
      goto LABEL_46;
    }
    unint64_t v58 = v32 + 1;
    if (v28)
    {
      id v34 = (id)MEMORY[0x1B3E99190](v32 + 1, *(void *)v1);
    }
    else
    {
      if (v58 >= *(void *)(v82 + 16)) {
        goto LABEL_42;
      }
      id v34 = *(id *)(v81 + 8 * v32);
    }
    uint64_t v30 = v34;
    ++v32;
    if (v33 == v58)
    {

      goto LABEL_46;
    }
  }
  sub_1B08C82D0(v48, isUniquelyReferenced_nonNull_native);
  uint64_t v24 = v95;
  unint64_t v50 = sub_1B08C7BC0((uint64_t)v43);
  if ((v49 & 1) == (v51 & 1))
  {
    unint64_t v1 = v50;
    uint64_t v52 = 8 * v50;
    if ((v49 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  sub_1B08CD1CC();
  return sub_1B08CE578();
}

void *sub_1B08C509C(void *a1)
{
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1B08CE218();
  __swift_project_value_buffer(v3, (uint64_t)qword_1E9B47070);
  id v4 = v1;
  id v5 = a1;
  id v6 = (char *)v4;
  id v7 = v5;
  os_log_type_t v8 = sub_1B08CE1F8();
  os_log_type_t v9 = sub_1B08CE3B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v28 = v26;
    *(_DWORD *)uint64_t v10 = 136315650;
    id v12 = v6;
    id v13 = objc_msgSend(v12, sel_description);
    uint64_t v14 = sub_1B08CE228();
    id v27 = v6;
    unint64_t v16 = v15;

    sub_1B08C7568(v14, v16, &v28);
    sub_1B08CE3E8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    id v17 = objc_msgSend(self, sel_currentThread);
    sub_1B08CE3E8();
    *uint64_t v11 = v17;
    *(_WORD *)(v10 + 22) = 2112;
    id v18 = v7;
    id v6 = v27;
    sub_1B08CE3E8();
    v11[1] = v7;

    _os_log_impl(&dword_1B088B000, v8, v9, "[%s|%@]: Get lookahead value for %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v26, -1, -1);
    MEMORY[0x1B3E99C70](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v19 = *(void *)&v6[OBJC_IVAR___TLKAsyncCache_lookaheadCache];
  if (!*(void *)(v19 + 16)) {
    return 0;
  }
  id v20 = v7;
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_1B08C7BC0((uint64_t)v20);
  if (v22)
  {
    unint64_t v23 = *(void **)(*(void *)(v19 + 56) + 8 * v21);
    id v24 = v23;
  }
  else
  {
    unint64_t v23 = 0;
  }

  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_1B08C5418(void *a1, void (*a2)(void), uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46710);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B08D3AC0;
  *(void *)(v7 + 32) = a1;
  unint64_t v10 = v7;
  sub_1B08CE288();
  sub_1B08CBCB0((uint64_t)a2);
  id v8 = a1;
  sub_1B08CA8E4(v10, v3, a2, a3);
  sub_1B08CD250((uint64_t)a2);
  return swift_bridgeObjectRelease();
}

void sub_1B08C54D8(unint64_t a1, void (*a2)(void))
{
  if (!a2) {
    return;
  }
  unint64_t v4 = a1 >> 62;
  if (a1)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      id v5 = (void *)sub_1B08CE4F8();
      if (v5) {
        goto LABEL_5;
      }
    }
    else
    {
      id v5 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_5:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x1B3E99190](0, a1);
        }
        else
        {
          if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_33;
          }
          id v6 = *(id *)(a1 + 32);
        }
        id v5 = v6;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  id v5 = 0;
LABEL_12:
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
  id v8 = v7;
  if (!v5)
  {

    if (!a1) {
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  sub_1B08CD1CC();
  id v9 = v5;
  char v10 = sub_1B08CE3D8();

  id v11 = 0;
  if (a1 && (v10 & 1) == 0)
  {
LABEL_17:
    if (v4)
    {
      swift_bridgeObjectRetain();
      if (sub_1B08CE4F8())
      {
LABEL_19:
        if ((a1 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v13 = *(id *)(a1 + 32);
          goto LABEL_22;
        }
LABEL_33:
        id v13 = (id)MEMORY[0x1B3E99190](0, a1);
LABEL_22:
        id v14 = v13;
        swift_bridgeObjectRelease();
        id v11 = v14;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v12) {
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
LABEL_27:
    id v11 = 0;
  }
LABEL_28:
  id v15 = v11;
  a2();
}

uint64_t sub_1B08C5800(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    *(void *)(v7 + 24) = a3;
    id v8 = (void (*)(uint64_t *))sub_1B08CBCF8;
  }
  else
  {
    id v8 = (void (*)(uint64_t *))nullsub_1;
    uint64_t v7 = 0;
  }
  swift_retain();
  sub_1B08CBCB0(a2);
  sub_1B08CB2C8(a1, v3, v8, v7);
  return swift_release_n();
}

void sub_1B08C59FC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    sub_1B08CD1CC();
    uint64_t v3 = sub_1B08CE258();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1B08C5A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  sub_1B08CE358();
  v7[10] = sub_1B08CE348();
  uint64_t v9 = sub_1B08CE318();
  v7[11] = v9;
  v7[12] = v8;
  return MEMORY[0x1F4188298](sub_1B08C5B10, v9, v8);
}

uint64_t sub_1B08C5B10()
{
  uint64_t v30 = v0;
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[3].i64[0];
  uint64_t v2 = sub_1B08CE218();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9B47070);
  id v3 = v1;
  swift_bridgeObjectRetain_n();
  id v4 = v3;
  id v5 = sub_1B08CE1F8();
  os_log_type_t v6 = sub_1B08CE3B8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[3].i64[0];
  if (v7)
  {
    os_log_t log = v5;
    uint64_t v9 = swift_slowAlloc();
    unint64_t v25 = (void *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = v28;
    *(_DWORD *)uint64_t v9 = 136315650;
    id v10 = v8;
    os_log_type_t type = v6;
    id v11 = objc_msgSend(v10, sel_description);
    uint64_t v12 = sub_1B08CE228();
    unint64_t v14 = v13;

    v0[1].i64[1] = sub_1B08C7568(v12, v14, &v29);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2112;
    id v15 = objc_msgSend(self, sel_currentThread);
    v0[2].i64[0] = (uint64_t)v15;
    sub_1B08CE3E8();
    void *v25 = v15;
    *(_WORD *)(v9 + 22) = 2080;
    unint64_t v16 = sub_1B08CD1CC();
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x1B3E98FD0](v17, v16);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[2].i64[1] = sub_1B08C7568(v18, v20, &v29);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, log, type, "[%s|%@]: Dispatching cache task for %s", (uint8_t *)v9, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v28, -1, -1);
    MEMORY[0x1B3E99C70](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v21 = *(void *)(v0[3].i64[0] + OBJC_IVAR___TLKAsyncCache_cache);
  char v22 = (int8x16_t *)swift_task_alloc();
  v0[6].i64[1] = (uint64_t)v22;
  v22->i64[0] = (uint64_t)v0;
  v22->i64[1] = (uint64_t)sub_1B08C5ECC;
  int8x16_t v23 = v0[3];
  v22[5].i64[0] = v21;
  v22[4] = vextq_s8(v23, v23, 8uLL);
  return MEMORY[0x1F4188298](sub_1B08C8D18, v21, 0);
}

uint64_t sub_1B08C5ECC(uint64_t a1)
{
  id v3 = (void *)*v1;
  id v4 = (void *)*v1;
  v3[14] = a1;
  swift_task_dealloc();
  id v5 = (void *)swift_task_alloc();
  v3[15] = v5;
  *id v5 = v4;
  v5[1] = sub_1B08C6038;
  uint64_t v6 = v3[7];
  return sub_1B08C46B4(v6, a1);
}

uint64_t sub_1B08C6038(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  return MEMORY[0x1F4188298](sub_1B08C6184, v4, v3);
}

uint64_t sub_1B08C6184()
{
  uint64_t v1 = v0[16];
  unint64_t v2 = v0[7];
  uint64_t v3 = (void (*)(uint64_t))v0[8];
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1B08CA74C(v2, v1);
  swift_bridgeObjectRelease_n();
  v3(v4);
  swift_bridgeObjectRelease();
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1B08C6240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B08CE388();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B08CE378();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B08CD0B4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B08CE318();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B08C63E4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  MEMORY[0x1F4188790](v1 - 8, v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B08CE388();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_1B08CE358();
  id v6 = v0;
  uint64_t v7 = sub_1B08CE348();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x1E4FBCFD8];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  sub_1B08C6240((uint64_t)v4, (uint64_t)&unk_1E9B46BE8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1B08C64FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  sub_1B08CE358();
  v4[7] = sub_1B08CE348();
  uint64_t v6 = sub_1B08CE318();
  v4[8] = v6;
  v4[9] = v5;
  return MEMORY[0x1F4188298](sub_1B08C6594, v6, v5);
}

uint64_t sub_1B08C6594()
{
  uint64_t v21 = v0;
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_1B08CE218();
  v0[10] = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B47070);
  id v3 = v1;
  uint64_t v4 = sub_1B08CE1F8();
  os_log_type_t v5 = sub_1B08CE3B8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[6];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v8 = 136315394;
    id v10 = v7;
    id v11 = objc_msgSend(v10, sel_description);
    uint64_t v12 = sub_1B08CE228();
    unint64_t v14 = v13;

    v0[2] = sub_1B08C7568(v12, v14, &v20);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v8 + 12) = 2112;
    id v15 = objc_msgSend(self, sel_currentThread);
    v0[2] = v15;
    sub_1B08CE3E8();
    *uint64_t v9 = v15;
    _os_log_impl(&dword_1B088B000, v4, v5, "[%s|%@]: Clearing lookahead", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v19, -1, -1);
    MEMORY[0x1B3E99C70](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v16 = v0[6];
  *(void *)(v16 + OBJC_IVAR___TLKAsyncCache_lookaheadCache) = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + OBJC_IVAR___TLKAsyncCache_cache);
  v0[11] = v17;
  return MEMORY[0x1F4188298](sub_1B08C6860, v17, 0);
}

uint64_t sub_1B08C6860()
{
  uint64_t v1 = v0[11];
  swift_beginAccess();
  *(void *)(v1 + 112) = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return MEMORY[0x1F4188298](sub_1B08C68E8, v2, v3);
}

uint64_t sub_1B08C68E8()
{
  uint64_t v20 = v0;
  uint64_t v2 = (id *)(v0 + 6);
  uint64_t v1 = (void *)v0[6];
  swift_release();
  id v3 = v1;
  uint64_t v4 = sub_1B08CE1F8();
  os_log_type_t v5 = sub_1B08CE3B8();
  if (os_log_type_enabled(v4, v5))
  {
    BOOL v6 = (void *)v0[6];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v7 = 136315394;
    id v8 = v6;
    id v9 = objc_msgSend(v8, sel_description);
    uint64_t v10 = sub_1B08CE228();
    unint64_t v12 = v11;

    v0[5] = sub_1B08C7568(v10, v12, &v19);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v7 + 12) = 2112;
    id v13 = objc_msgSend(self, sel_currentThread);
    v0[5] = v13;
    sub_1B08CE3E8();
    *uint64_t v17 = v13;
    _os_log_impl(&dword_1B088B000, v4, v5, "[%s|%@]: Cleared cache", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v18, -1, -1);
    MEMORY[0x1B3E99C70](v7, -1, -1);
  }
  else
  {
    id v14 = *v2;
  }
  id v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

id TLKAsyncCache.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TLKAsyncCache();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t TLKAsyncCache.computeObject(forKey:)()
{
  sub_1B08CE358();
  *(void *)(v0 + 16) = sub_1B08CE348();
  uint64_t v2 = sub_1B08CE318();
  return MEMORY[0x1F4188298](sub_1B08C6D80, v2, v1);
}

uint64_t sub_1B08C6D80()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1B08C6F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_1B08CE358();
  v3[6] = sub_1B08CE348();
  uint64_t v5 = sub_1B08CE318();
  return MEMORY[0x1F4188298](sub_1B08C7000, v5, v4);
}

uint64_t sub_1B08C7000()
{
  uint64_t v1 = (const void *)v0[3];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v1);
  id v4 = v3;
  id v5 = v2;
  v0[8] = sub_1B08CE348();
  uint64_t v7 = sub_1B08CE318();
  return MEMORY[0x1F4188298](sub_1B08C70B4, v7, v6);
}

uint64_t sub_1B08C70B4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  swift_release();

  if (v1)
  {
    id v4 = (void (**)(void, void))v0[7];
    v4[2](v4, 0);
    _Block_release(v4);
  }
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1B08C7150(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_1B08CE1F4;
  return v6(a1);
}

uint64_t sub_1B08C722C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_1B08CE1D4;
  return v6();
}

uint64_t sub_1B08C72F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_1B08CE1D4;
  return v7();
}

uint64_t sub_1B08C73C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B08CE388();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B08CE378();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B08CD0B4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B08CE318();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B08C7568(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B08C763C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B08CE0CC((uint64_t)v12, *a3);
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
      sub_1B08CE0CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B08C763C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B08CE3F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B08C77F8(a5, a6);
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
  uint64_t v8 = sub_1B08CE448();
  if (!v8)
  {
    sub_1B08CE4E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B08CE548();
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

uint64_t sub_1B08C77F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B08C7890(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B08C7A70(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B08C7A70(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B08C7890(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B08C7A08(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B08CE418();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B08CE4E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B08CE238();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B08CE548();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B08CE4E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B08C7A08(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46708);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B08C7A70(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46708);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_1B08CE548();
  __break(1u);
  return result;
}

unint64_t sub_1B08C7BC0(uint64_t a1)
{
  uint64_t v2 = sub_1B08CE3C8();
  return sub_1B08C7C04(a1, v2);
}

unint64_t sub_1B08C7C04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1B08CD1CC();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1B08CE3D8();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1B08CE3D8();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_1B08C7D10(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_1B08CE4B8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_1B08C7DC4(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1B08C8758(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B08C7DC4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46768);
    uint64_t v2 = sub_1B08CE528();
    uint64_t v18 = v2;
    sub_1B08CE4A8();
    uint64_t v3 = sub_1B08CE4D8();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1B08CD1CC();
      do
      {
        swift_dynamicCast();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46720);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1B08C7FF8(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_1B08CE3C8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_1B08CE4D8();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t sub_1B08C7FF8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46768);
  uint64_t v6 = sub_1B08CE518();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  BOOL v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int8x16_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_retain();
    }
    uint64_t result = sub_1B08CE3C8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
          goto LABEL_41;
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int8x16_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int8x16_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B08C82D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46778);
  uint64_t v6 = sub_1B08CE518();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int8x16_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
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
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v32;
      id v34 = v31;
    }
    uint64_t result = sub_1B08CE3C8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
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
          goto LABEL_41;
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  int8x16_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int8x16_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_1B08C85A4(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_1B08CE408();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_1B08CE3C8();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *unint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            unint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *unint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_1B08C8758(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_1B08C7BC0((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1B08C88BC();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1B08C7FF8(v12, a3 & 1);
  unint64_t v18 = sub_1B08C7BC0((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_1B08CD1CC();
    id result = (id)sub_1B08CE578();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

void *sub_1B08C88BC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46768);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B08CE508();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1B08C8A68()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46778);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B08CE508();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v18;
    id result = v17;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ComputationTracker()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B08C8C28(uint64_t a1)
{
  return sub_1B08C1A84(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for SingleCallingActor()
{
  return self;
}

uint64_t type metadata accessor for TLKAsyncCache()
{
  return self;
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

uint64_t sub_1B08C8CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return MEMORY[0x1F4188298](sub_1B08C8D18, a3, 0);
}

uint64_t sub_1B08C8D18()
{
  uint64_t v1 = sub_1B08C9744(*(void *)(v0 + 64), *(void **)(v0 + 72), *(uint64_t **)(v0 + 80));
  *(void *)(v0 + 88) = v1;
  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B08CE218();
  *(void *)(v0 + 96) = __swift_project_value_buffer(v2, (uint64_t)qword_1E9B47070);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_1B08CE1F8();
  os_log_type_t v4 = sub_1B08CE3B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    int64_t v20 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v5 = 138412546;
    uint64_t v22 = v1;
    id v6 = objc_msgSend(self, sel_currentThread);
    *(void *)(v0 + 48) = v6;
    sub_1B08CE3E8();
    *int64_t v20 = v6;
    *(_WORD *)(v5 + 12) = 2080;
    unint64_t v7 = sub_1B08CD1CC();
    uint64_t v8 = swift_bridgeObjectRetain();
    uint64_t v9 = MEMORY[0x1B3E98FD0](v8, v7);
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v12 = v9;
    uint64_t v1 = v22;
    *(void *)(v0 + 56) = sub_1B08C7568(v12, v11, &v24);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, v3, v4, "[%@]: Dispatching trackers for %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v21, -1, -1);
    MEMORY[0x1B3E99C70](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v13 = *(void *)(v0 + 80);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46740);
  unint64_t v15 = sub_1B08CD454();
  uint64_t v16 = swift_task_alloc();
  *(void *)(v0 + 104) = v16;
  *(void *)(v16 + 16) = v1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46798);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v18;
  void *v18 = v0;
  v18[1] = sub_1B08C9098;
  return MEMORY[0x1F4188080](v0 + 16, v14, v17, v13, v15, &unk_1E9B46CE0, v16, v14);
}

uint64_t sub_1B08C9098()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  if (v0)
  {

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    os_log_type_t v4 = sub_1B08C94D0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    os_log_type_t v4 = sub_1B08C9220;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B08C9220()
{
  uint64_t v21 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[2];
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_1B08CE1F8();
  os_log_type_t v4 = sub_1B08CE3B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v5 = 138412546;
    id v6 = objc_msgSend(self, sel_currentThread);
    v1[4] = v6;
    sub_1B08CE3E8();
    void *v18 = v6;
    *(_WORD *)(v5 + 12) = 2080;
    unint64_t v7 = sub_1B08CD1CC();
    uint64_t v8 = swift_bridgeObjectRetain();
    uint64_t v9 = MEMORY[0x1B3E98FD0](v8, v7);
    unint64_t v10 = v3;
    uint64_t v11 = v2;
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v1[5] = sub_1B08C7568(v9, v13, &v20);
    sub_1B08CE3E8();
    uint64_t v2 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, v10, v4, "[%@]: Completed trackers for %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v19, -1, -1);
    MEMORY[0x1B3E99C70](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  unint64_t v14 = v1[8];
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1B08CA5C4(v14, v2);
  swift_bridgeObjectRelease_n();
  uint64_t v16 = (uint64_t (*)(uint64_t))v1[1];
  return v16(v15);
}

uint64_t sub_1B08C94D0()
{
  uint64_t v16 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_1B08CE1F8();
  os_log_type_t v2 = sub_1B08CE3B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    unint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)uint64_t v3 = 138412546;
    id v4 = objc_msgSend(self, sel_currentThread);
    v0[4] = v4;
    sub_1B08CE3E8();
    *unint64_t v13 = v4;
    *(_WORD *)(v3 + 12) = 2080;
    unint64_t v5 = sub_1B08CD1CC();
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x1B3E98FD0](v6, v5);
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    v0[5] = sub_1B08C7568(v7, v9, &v15);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B088B000, v1, v2, "[%@]: Completed trackers for %s", (uint8_t *)v3, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v14, -1, -1);
    MEMORY[0x1B3E99C70](v3, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = sub_1B08CA5C4(v0[8], 0);
  swift_bridgeObjectRelease_n();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v10);
}

uint64_t sub_1B08C9744(unint64_t a1, void *a2, uint64_t *a3)
{
  swift_retain();
  unint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  unint64_t v8 = sub_1B08C9FA4(v6, a3);
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_1E9B46F00 != -1) {
LABEL_43:
  }
    swift_once();
  uint64_t v9 = sub_1B08CE218();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1E9B47070);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1B08CE1F8();
  os_log_type_t v12 = sub_1B08CE3B8();
  unint64_t v13 = v8 >> 62;
  unint64_t v71 = v8;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v70 = v10;
    uint64_t v68 = (uint64_t)a2;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    v73[0] = v65;
    *(_DWORD *)uint64_t v14 = 138412802;
    id v72 = objc_msgSend(self, sel_currentThread);
    sub_1B08CE3E8();
    *uint64_t v15 = v72;
    *(_WORD *)(v14 + 12) = 2048;
    unint64_t v66 = v8 >> 62;
    unint64_t v67 = v7;
    uint64_t v69 = a3;
    if (v13)
    {
      swift_bridgeObjectRetain();
      sub_1B08CE4F8();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    unint64_t v16 = sub_1B08CD1CC();
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x1B3E98FD0](v17, v16);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    id v72 = (void *)sub_1B08C7568(v18, v20, v73);
    unint64_t v8 = v71;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v11, v12, "[%@]: Found %ld unfetched keys for %s", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v65, -1, -1);
    MEMORY[0x1B3E99C70](v14, -1, -1);

    a2 = (void *)v68;
    a3 = v69;
    unint64_t v13 = v66;
    unint64_t v7 = v67;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v21 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v21)
    {
LABEL_38:
      uint64_t v60 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v60, v61);
      v63[2] = a3;
      v63[3] = a1;
      v63[4] = a2;
      return sub_1B08C346C((void (*)(uint64_t *__return_ptr, id *))sub_1B08CD794, (uint64_t)v63, a1);
    }
  }
  if ((objc_msgSend(a2, sel_respondsToSelector_, sel_computeObjectsForKeys_completionHandler_, v64) & 1) == 0) {
    goto LABEL_38;
  }
  uint64_t v69 = a3;
  uint64_t v70 = v21;
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_1B08CE1F8();
  os_log_type_t v23 = sub_1B08CE3B8();
  unint64_t v64 = a1;
  unint64_t v67 = v7;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    BOOL v25 = (void *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    v73[0] = v68;
    *(_DWORD *)uint64_t v24 = 138412546;
    id v26 = objc_msgSend(self, sel_currentThread);
    sub_1B08CE3E8();
    void *v25 = v26;
    *(_WORD *)(v24 + 12) = 2080;
    unint64_t v27 = sub_1B08CD1CC();
    uint64_t v28 = swift_bridgeObjectRetain();
    uint64_t v29 = MEMORY[0x1B3E98FD0](v28, v27);
    uint64_t v30 = a2;
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    id v72 = (void *)sub_1B08C7568(v29, v32, v73);
    unint64_t v8 = v71;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    a2 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v22, v23, "[%@]: Creating combined ComputationTracker for %s", (uint8_t *)v24, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v68, -1, -1);
    MEMORY[0x1B3E99C70](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v8;
  *(void *)(v33 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46720);
  id v34 = a2;
  a2 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v68 = (uint64_t)v34;
  id v35 = v34;
  swift_defaultActor_initialize();
  a2[14] = 0;
  uint64_t v36 = MEMORY[0x1E4FBC860];
  a2[16] = v33;
  a2[17] = v36;
  a3 = v69 + 14;
  a2[15] = &unk_1E9B46D08;
  unint64_t v7 = v8 & 0xC000000000000001;
  a1 = 4;
  while (1)
  {
    if (v7) {
      id v38 = (id)MEMORY[0x1B3E99190](a1 - 4, v8);
    }
    else {
      id v38 = *(id *)(v8 + 8 * a1);
    }
    char v39 = v38;
    unint64_t v40 = a1 - 3;
    if (__OFADD__(a1 - 4, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    swift_beginAccess();
    uint64_t v41 = *a3;
    if ((*a3 & 0xC000000000000001) != 0)
    {
      if (v41 >= 0) {
        v41 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      id v42 = v39;
      swift_retain();
      uint64_t v43 = sub_1B08CE4B8();
      if (__OFADD__(v43, 1)) {
        goto LABEL_41;
      }
      *a3 = sub_1B08C7DC4(v41, v43 + 1);
    }
    else
    {
      id v44 = v39;
      swift_retain();
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v72 = (void *)*a3;
    uint64_t v46 = v72;
    *a3 = 0x8000000000000000;
    unint64_t v8 = sub_1B08C7BC0((uint64_t)v39);
    uint64_t v48 = v46[2];
    BOOL v49 = (v47 & 1) == 0;
    uint64_t v50 = v48 + v49;
    if (__OFADD__(v48, v49)) {
      goto LABEL_40;
    }
    char v51 = v47;
    if (v46[3] < v50) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v54 = v72;
      if (v47) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_1B08C88BC();
      uint64_t v54 = v72;
      if (v51)
      {
LABEL_14:
        uint64_t v37 = v54[7];
        swift_release();
        *(void *)(v37 + 8 * v8) = a2;
        goto LABEL_15;
      }
    }
LABEL_33:
    v54[(v8 >> 6) + 8] |= 1 << v8;
    uint64_t v55 = 8 * v8;
    *(void *)(v54[6] + v55) = v39;
    *(void *)(v54[7] + v55) = a2;
    uint64_t v56 = v54[2];
    BOOL v57 = __OFADD__(v56, 1);
    uint64_t v58 = v56 + 1;
    if (v57) {
      goto LABEL_42;
    }
    v54[2] = v58;
    id v59 = v39;
LABEL_15:
    *a3 = (uint64_t)v54;

    swift_bridgeObjectRelease();
    swift_endAccess();

    ++a1;
    unint64_t v8 = v71;
    if (v40 == v70)
    {
      swift_release();
      a1 = v64;
      a2 = (void *)v68;
      a3 = v69;
      goto LABEL_38;
    }
  }
  sub_1B08C7FF8(v50, isUniquelyReferenced_nonNull_native);
  unint64_t v52 = sub_1B08C7BC0((uint64_t)v39);
  if ((v51 & 1) == (v53 & 1))
  {
    unint64_t v8 = v52;
    uint64_t v54 = v72;
    if (v51) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
  sub_1B08CD1CC();
  uint64_t result = sub_1B08CE578();
  __break(1u);
  return result;
}

uint64_t sub_1B08C9FA4(unint64_t a1, uint64_t *a2)
{
  uint64_t v16 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t v14 = a2 + 14;
  swift_beginAccess();
  if (v4)
  {
    for (unint64_t i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x1B3E99190](i, a1);
      }
      else
      {
        if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          uint64_t v4 = sub_1B08CE4F8();
          goto LABEL_3;
        }
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      unint64_t v7 = v6;
      unint64_t v8 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_24;
      }
      uint64_t v9 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        a2 = (uint64_t *)v6;
        swift_bridgeObjectRetain();
        if (!sub_1B08CE4C8()) {
          goto LABEL_5;
        }
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46720);
        swift_dynamicCast();
        uint64_t v10 = v15;
        swift_unknownObjectRelease();
      }
      else
      {
        if (!*(void *)(v9 + 16)) {
          goto LABEL_6;
        }
        a2 = (uint64_t *)v6;
        swift_bridgeObjectRetain();
        unint64_t v11 = sub_1B08C7BC0((uint64_t)a2);
        if ((v12 & 1) == 0)
        {
LABEL_5:

          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v11);
        swift_retain();
      }

      swift_bridgeObjectRelease();
      if (v10)
      {

        swift_release();
        goto LABEL_7;
      }
LABEL_6:
      sub_1B08CE458();
      a2 = *(uint64_t **)(v16 + 16);
      sub_1B08CE488();
      sub_1B08CE498();
      sub_1B08CE468();
LABEL_7:
      if (v8 == v4) {
        return v16;
      }
    }
  }
  return MEMORY[0x1E4FBC860];
}

void sub_1B08CA1DC(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      unint64_t v4 = a1;
    }
    else {
      unint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_26;
    }
  }
  unint64_t v56 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x1B3E99190](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    id v12 = *(id *)(a1 + 32);
  }
  unint64_t v5 = v12;
  if (!*(void *)(a2 + 16))
  {
LABEL_32:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v51 = *(void *)(a2 + 16);
  unint64_t v13 = (void *)*a4;
  uint64_t v54 = *(void **)(a2 + 32);
  id v53 = v54;
  unint64_t v4 = sub_1B08C7BC0((uint64_t)v5);
  uint64_t v15 = v13[2];
  BOOL v16 = (v14 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  char v6 = v14;
  if (v13[3] >= v17)
  {
    if (a3)
    {
      unint64_t v20 = (void *)*a4;
      if (v14) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
LABEL_23:
    sub_1B08C8A68();
    unint64_t v20 = (void *)*a4;
    if (v6)
    {
LABEL_14:
      uint64_t v21 = 8 * v4;
      uint64_t v22 = *(void **)(v20[7] + v21);
      id v23 = v22;

      uint64_t v24 = v20[7];
      *(void *)(v24 + v21) = v22;
      if (v11 != 1)
      {
LABEL_27:
        if (v56)
        {
          id v29 = (id)MEMORY[0x1B3E99190](1, a1);
        }
        else
        {
          if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
          id v29 = *(id *)(a1 + 40);
        }
        unint64_t v5 = v29;
        uint64_t v55 = v51 - 1;
        if (v51 == 1) {
          goto LABEL_32;
        }
        uint64_t v30 = 0;
        uint64_t v52 = v11 - 2;
        while (1)
        {
          unint64_t v32 = *(void **)(a2 + 40 + 8 * v30);
          uint64_t v33 = (void *)*a4;
          id v34 = v32;
          unint64_t v35 = sub_1B08C7BC0((uint64_t)v5);
          uint64_t v37 = v33[2];
          BOOL v38 = (v36 & 1) == 0;
          BOOL v27 = __OFADD__(v37, v38);
          uint64_t v39 = v37 + v38;
          if (v27) {
            goto LABEL_47;
          }
          char v40 = v36;
          if (v33[3] < v39)
          {
            sub_1B08C82D0(v39, 1);
            unint64_t v35 = sub_1B08C7BC0((uint64_t)v5);
            if ((v40 & 1) != (v41 & 1)) {
              goto LABEL_50;
            }
          }
          id v42 = (void *)*a4;
          if (v40)
          {
            uint64_t v43 = 8 * v35;
            id v44 = *(void **)(v42[7] + 8 * v35);
            id v45 = v44;

            uint64_t v46 = v42[7];
            *(void *)(v46 + v43) = v44;
          }
          else
          {
            v42[(v35 >> 6) + 8] |= 1 << v35;
            uint64_t v47 = 8 * v35;
            *(void *)(v42[6] + v47) = v5;
            *(void *)(v42[7] + v47) = v32;
            uint64_t v48 = v42[2];
            BOOL v27 = __OFADD__(v48, 1);
            uint64_t v49 = v48 + 1;
            if (v27) {
              goto LABEL_48;
            }
            v42[2] = v49;
          }
          if (v52 == v30) {
            break;
          }
          unint64_t v50 = v30 + 2;
          if (v56)
          {
            id v31 = (id)MEMORY[0x1B3E99190](v50, a1);
          }
          else
          {
            if (v50 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_49;
            }
            id v31 = *(id *)(a1 + 8 * v30 + 48);
          }
          unint64_t v5 = v31;
          if (v55 == ++v30) {
            goto LABEL_32;
          }
        }
      }
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
LABEL_24:
    v20[(v4 >> 6) + 8] |= 1 << v4;
    uint64_t v25 = 8 * v4;
    *(void *)(v20[6] + v25) = v5;
    *(void *)(v20[7] + v25) = v54;
    uint64_t v26 = v20[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    v20[2] = v28;
    if (v11 == 1) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  sub_1B08C82D0(v17, a3 & 1);
  unint64_t v18 = sub_1B08C7BC0((uint64_t)v5);
  if ((v6 & 1) == (v19 & 1))
  {
    unint64_t v4 = v18;
    unint64_t v20 = (void *)*a4;
    if ((v6 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_14;
  }
LABEL_50:
  sub_1B08CD1CC();
  sub_1B08CE578();
  __break(1u);
}

uint64_t sub_1B08CA5C4(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v4)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1B08CE478();
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t v6 = 0;
      while (1)
      {
        if (v4 == v6)
        {
          __break(1u);
          goto LABEL_19;
        }
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v7 = (id)MEMORY[0x1B3E99190](v6, a1);
          if (a2) {
            goto LABEL_12;
          }
        }
        else
        {
          id v7 = *(id *)(a1 + 8 * v6 + 32);
          if (a2)
          {
LABEL_12:
            if (*(void *)(a2 + 16))
            {
              id v8 = v7;
              unint64_t v9 = sub_1B08C7BC0((uint64_t)v8);
              if (v10) {
                id v11 = *(id *)(*(void *)(a2 + 56) + 8 * v9);
              }
            }
          }
        }
        ++v6;

        sub_1B08CE458();
        sub_1B08CE488();
        sub_1B08CE498();
        sub_1B08CE468();
        if (v4 == v6) {
          return v12;
        }
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1B08CA74C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v4)
  {
    uint64_t v14 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1B08CE478();
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t v6 = 0;
      while (1)
      {
        if (v4 == v6)
        {
          __break(1u);
          goto LABEL_20;
        }
        if ((a1 & 0xC000000000000001) != 0) {
          id v7 = (id)MEMORY[0x1B3E99190](v6, a1);
        }
        else {
          id v7 = *(id *)(a1 + 8 * v6 + 32);
        }
        id v8 = v7;
        if (*(void *)(a2 + 16))
        {
          id v9 = v7;
          unint64_t v10 = sub_1B08C7BC0((uint64_t)v9);
          if (v11)
          {
            uint64_t v12 = *(void **)(*(void *)(a2 + 56) + 8 * v10);
            id v13 = v12;

            if (v12) {
              goto LABEL_8;
            }
          }
          else
          {
          }
        }
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
LABEL_8:
        ++v6;

        sub_1B08CE458();
        sub_1B08CE488();
        sub_1B08CE498();
        sub_1B08CE468();
        if (v4 == v6) {
          return v14;
        }
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1B08CA8E4(unint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  MEMORY[0x1F4188790](v8 - 8, v9);
  v88 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  uint64_t v89 = v11;
  uint64_t v92 = MEMORY[0x1E4FBC860];
  uint64_t v90 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_19:
    sub_1B08CBCB0((uint64_t)a3);
    uint64_t v24 = a2;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B08CE4F8();
    uint64_t v86 = a4;
    v87 = a3;
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_1B08CBCB0((uint64_t)a3);
    id v13 = a2;
    swift_bridgeObjectRetain();
    uint64_t v86 = a4;
    v87 = a3;
    if (v12)
    {
LABEL_3:
      uint64_t v14 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
      uint64_t v15 = 4;
      while (1)
      {
        a4 = v15 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v16 = (id)MEMORY[0x1B3E99190](v15 - 4, a1);
          uint64_t v17 = v15 - 3;
          if (__OFADD__(a4, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v16 = *(id *)(a1 + 8 * v15);
          uint64_t v17 = v15 - 3;
          if (__OFADD__(a4, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v18 = *(void *)&a2[v14];
        if (*(void *)(v18 + 16))
        {
          id v19 = v16;
          swift_bridgeObjectRetain();
          unint64_t v20 = sub_1B08C7BC0((uint64_t)v19);
          if (v21)
          {
            a3 = (void (*)(void))*(id *)(*(void *)(v18 + 56) + 8 * v20);

            uint64_t v22 = swift_bridgeObjectRelease();
            MEMORY[0x1B3E98FA0](v22);
            if (*(void *)(v92 + 16) >= *(void *)(v92 + 24) >> 1) {
              sub_1B08CE2A8();
            }
            sub_1B08CE2D8();
            sub_1B08CE288();
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {
        }
        ++v15;
        if (v17 == v12)
        {
          swift_bridgeObjectRelease();
          uint64_t v23 = v92;
          goto LABEL_21;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v23 = MEMORY[0x1E4FBC860];
LABEL_21:

  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1B08CE218();
  uint64_t v26 = __swift_project_value_buffer(v25, (uint64_t)qword_1E9B47070);
  BOOL v27 = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v28 = v27;
  id v29 = sub_1B08CE1F8();
  os_log_type_t v30 = sub_1B08CE3B8();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v82 = (void *)swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    uint64_t v92 = v83;
    *(_DWORD *)uint64_t v31 = 136315906;
    uint64_t v84 = v26;
    unint64_t v32 = v28;
    id v33 = objc_msgSend(v32, sel_description);
    v85 = v28;
    id v34 = v33;
    uint64_t v35 = sub_1B08CE228();
    unint64_t v37 = v36;

    uint64_t v91 = sub_1B08C7568(v35, v37, &v92);
    sub_1B08CE3E8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2112;
    id v38 = objc_msgSend(self, sel_currentThread);
    uint64_t v91 = (uint64_t)v38;
    sub_1B08CE3E8();
    uint64_t v39 = v82;
    *uint64_t v82 = v38;
    *(_WORD *)(v31 + 22) = 2048;
    uint64_t v40 = *(void *)(v23 + 16);
    swift_bridgeObjectRelease();
    uint64_t v91 = v40;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 32) = 2080;
    unint64_t v41 = sub_1B08CD1CC();
    uint64_t v42 = swift_bridgeObjectRetain();
    uint64_t v43 = MEMORY[0x1B3E98FD0](v42, v41);
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_1B08C7568(v43, v45, &v92);
    uint64_t v28 = v85;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v29, v30, "[%s|%@]: Found %ld hits in lookahead for %s", (uint8_t *)v31, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v39, -1, -1);
    uint64_t v46 = v83;
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v46, -1, -1);
    MEMORY[0x1B3E99C70](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v47 = *(void *)(v23 + 16);
  if (v90)
  {
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
    if (v47 != v56) {
      goto LABEL_28;
    }
  }
  else if (v47 != *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v48 = (uint64_t)v88;
    sub_1B08CE368();
    uint64_t v49 = sub_1B08CE388();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
    sub_1B08CE358();
    unint64_t v50 = v28;
    swift_bridgeObjectRetain();
    uint64_t v51 = v89;
    swift_retain();
    uint64_t v52 = sub_1B08CE348();
    id v53 = (void *)swift_allocObject();
    uint64_t v54 = MEMORY[0x1E4FBCFD8];
    v53[2] = v52;
    v53[3] = v54;
    v53[4] = v50;
    v53[5] = a1;
    v53[6] = sub_1B08CDF74;
    v53[7] = v51;
    sub_1B08C6240(v48, (uint64_t)&unk_1E9B46D30, (uint64_t)v53);
    swift_release();
    return swift_release();
  }
  BOOL v57 = v28;
  swift_bridgeObjectRetain_n();
  uint64_t v58 = v57;
  id v59 = sub_1B08CE1F8();
  os_log_type_t v60 = sub_1B08CE3B8();
  int v61 = v60;
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v62 = swift_slowAlloc();
    v85 = (char *)swift_slowAlloc();
    uint64_t v90 = swift_slowAlloc();
    uint64_t v92 = v90;
    *(_DWORD *)uint64_t v62 = 136315650;
    os_log_type_t v63 = v58;
    LODWORD(v88) = v61;
    unint64_t v64 = v63;
    id v65 = objc_msgSend(v63, sel_description);
    uint64_t v66 = sub_1B08CE228();
    unint64_t v68 = v67;

    uint64_t v91 = sub_1B08C7568(v66, v68, &v92);
    sub_1B08CE3E8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2112;
    id v69 = objc_msgSend(self, sel_currentThread);
    uint64_t v91 = (uint64_t)v69;
    sub_1B08CE3E8();
    uint64_t v70 = v85;
    *(void *)v85 = v69;
    *(_WORD *)(v62 + 22) = 2080;
    unint64_t v71 = sub_1B08CD1CC();
    uint64_t v72 = swift_bridgeObjectRetain();
    uint64_t v73 = MEMORY[0x1B3E98FD0](v72, v71);
    unint64_t v75 = v74;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_1B08C7568(v73, v75, &v92);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v59, (os_log_type_t)v88, "[%s|%@]: Returning hits in lookahead synchronously for %s", (uint8_t *)v62, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v70, -1, -1);
    uint64_t v76 = v90;
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v76, -1, -1);
    MEMORY[0x1B3E99C70](v62, -1, -1);

    if (v47) {
      goto LABEL_32;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    unint64_t v80 = MEMORY[0x1E4FBC860];
LABEL_41:
    sub_1B08C54D8(v80, v87);
    swift_release();
    return swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease_n();
  if (!v47) {
    goto LABEL_40;
  }
LABEL_32:
  uint64_t v92 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B08CE478();
  if (v47 >= 1)
  {
    uint64_t v77 = 0;
    do
    {
      uint64_t v78 = *(void **)(v23 + 8 * v77 + 32);
      if (!v78)
      {
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
        uint64_t v78 = 0;
      }
      ++v77;
      id v79 = v78;
      sub_1B08CE458();
      sub_1B08CE488();
      sub_1B08CE498();
      sub_1B08CE468();
    }
    while (v47 != v77);
    unint64_t v80 = v92;
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B08CB2C8(unint64_t a1, char *a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v89 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  v88 = (void (*)(uint64_t *))a3;
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  uint64_t v90 = v11;
  uint64_t v93 = MEMORY[0x1E4FBC860];
  uint64_t v91 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_19:
    swift_retain();
    uint64_t v25 = a2;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B08CE4F8();
    uint64_t v87 = a4;
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    id v13 = a2;
    swift_bridgeObjectRetain();
    uint64_t v87 = a4;
    if (v12)
    {
LABEL_3:
      uint64_t v14 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
      uint64_t v15 = 4;
      while (1)
      {
        a4 = v15 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v16 = (id)MEMORY[0x1B3E99190](v15 - 4, a1);
          uint64_t v17 = v15 - 3;
          if (__OFADD__(a4, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v16 = *(id *)(a1 + 8 * v15);
          uint64_t v17 = v15 - 3;
          if (__OFADD__(a4, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v18 = *(void *)&a2[v14];
        if (*(void *)(v18 + 16))
        {
          id v19 = v16;
          swift_bridgeObjectRetain();
          unint64_t v20 = sub_1B08C7BC0((uint64_t)v19);
          if (v21)
          {
            id v22 = *(id *)(*(void *)(v18 + 56) + 8 * v20);

            uint64_t v23 = swift_bridgeObjectRelease();
            MEMORY[0x1B3E98FA0](v23);
            if (*(void *)(v93 + 16) >= *(void *)(v93 + 24) >> 1) {
              sub_1B08CE2A8();
            }
            sub_1B08CE2D8();
            sub_1B08CE288();
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {
        }
        ++v15;
        if (v17 == v12)
        {
          swift_bridgeObjectRelease();
          uint64_t v24 = v93;
          goto LABEL_21;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = MEMORY[0x1E4FBC860];
LABEL_21:

  if (qword_1E9B46F00 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1B08CE218();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_1E9B47070);
  uint64_t v28 = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v29 = v28;
  os_log_type_t v30 = sub_1B08CE1F8();
  os_log_type_t v31 = sub_1B08CE3B8();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v83 = (void *)swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    uint64_t v93 = v84;
    *(_DWORD *)uint64_t v32 = 136315906;
    uint64_t v85 = v27;
    id v33 = v29;
    id v34 = objc_msgSend(v33, sel_description);
    uint64_t v86 = v29;
    id v35 = v34;
    uint64_t v36 = sub_1B08CE228();
    unint64_t v38 = v37;

    uint64_t v92 = sub_1B08C7568(v36, v38, &v93);
    sub_1B08CE3E8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    id v39 = objc_msgSend(self, sel_currentThread);
    uint64_t v92 = (uint64_t)v39;
    sub_1B08CE3E8();
    uint64_t v40 = v83;
    *uint64_t v83 = v39;
    *(_WORD *)(v32 + 22) = 2048;
    uint64_t v41 = *(void *)(v24 + 16);
    swift_bridgeObjectRelease();
    uint64_t v92 = v41;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 32) = 2080;
    unint64_t v42 = sub_1B08CD1CC();
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x1B3E98FD0](v43, v42);
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_1B08C7568(v44, v46, &v93);
    id v29 = v86;
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v30, v31, "[%s|%@]: Found %ld hits in lookahead for %s", (uint8_t *)v32, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v40, -1, -1);
    uint64_t v47 = v84;
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v47, -1, -1);
    MEMORY[0x1B3E99C70](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v48 = *(void *)(v24 + 16);
  if (v91)
  {
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_1B08CE4F8();
    swift_bridgeObjectRelease();
    if (v48 != v57) {
      goto LABEL_28;
    }
  }
  else if (v48 != *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v49 = (uint64_t)v89;
    sub_1B08CE368();
    uint64_t v50 = sub_1B08CE388();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
    sub_1B08CE358();
    uint64_t v51 = v29;
    swift_bridgeObjectRetain();
    uint64_t v52 = v90;
    swift_retain();
    uint64_t v53 = sub_1B08CE348();
    uint64_t v54 = (void *)swift_allocObject();
    uint64_t v55 = MEMORY[0x1E4FBCFD8];
    v54[2] = v53;
    v54[3] = v55;
    v54[4] = v51;
    v54[5] = a1;
    v54[6] = sub_1B08CD36C;
    v54[7] = v52;
    sub_1B08C6240(v49, (uint64_t)&unk_1E9B46CC0, (uint64_t)v54);
    swift_release();
    return swift_release();
  }
  uint64_t v58 = v29;
  swift_bridgeObjectRetain_n();
  id v59 = v58;
  os_log_type_t v60 = sub_1B08CE1F8();
  os_log_type_t v61 = sub_1B08CE3B8();
  int v62 = v61;
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v63 = swift_slowAlloc();
    uint64_t v86 = (char *)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    uint64_t v93 = v91;
    *(_DWORD *)uint64_t v63 = 136315650;
    unint64_t v64 = v59;
    LODWORD(v89) = v62;
    id v65 = v64;
    id v66 = objc_msgSend(v64, sel_description);
    uint64_t v67 = sub_1B08CE228();
    unint64_t v69 = v68;

    uint64_t v92 = sub_1B08C7568(v67, v69, &v93);
    sub_1B08CE3E8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2112;
    id v70 = objc_msgSend(self, sel_currentThread);
    uint64_t v92 = (uint64_t)v70;
    sub_1B08CE3E8();
    unint64_t v71 = v86;
    *(void *)uint64_t v86 = v70;
    *(_WORD *)(v63 + 22) = 2080;
    unint64_t v72 = sub_1B08CD1CC();
    uint64_t v73 = swift_bridgeObjectRetain();
    uint64_t v74 = MEMORY[0x1B3E98FD0](v73, v72);
    unint64_t v76 = v75;
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_1B08C7568(v74, v76, &v93);
    sub_1B08CE3E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B088B000, v60, (os_log_type_t)v89, "[%s|%@]: Returning hits in lookahead synchronously for %s", (uint8_t *)v63, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v71, -1, -1);
    uint64_t v77 = v91;
    swift_arrayDestroy();
    MEMORY[0x1B3E99C70](v77, -1, -1);
    MEMORY[0x1B3E99C70](v63, -1, -1);

    if (v48) {
      goto LABEL_32;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    uint64_t v81 = MEMORY[0x1E4FBC860];
LABEL_41:
    uint64_t v93 = v81;
    v88(&v93);
    swift_release();
    return swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease_n();
  if (!v48) {
    goto LABEL_40;
  }
LABEL_32:
  uint64_t v93 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B08CE478();
  if (v48 >= 1)
  {
    uint64_t v78 = 0;
    do
    {
      id v79 = *(void **)(v24 + 8 * v78 + 32);
      if (!v79)
      {
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA98]), sel_init);
        id v79 = 0;
      }
      ++v78;
      id v80 = v79;
      sub_1B08CE458();
      sub_1B08CE488();
      sub_1B08CE498();
      sub_1B08CE468();
    }
    while (v48 != v78);
    uint64_t v81 = v93;
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B08CBCB0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B08CBCC0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B08CBCF8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1B08CBD28()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B08CE1D4;
  return sub_1B08C64FC((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_1B08CBDC0()
{
  uint64_t result = type metadata accessor for ComputationTracker.State();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B08CBE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 8);
}

uint64_t sub_1B08CBE84()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_1B08CBF00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  unint64_t v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    unint64_t v9 = v10 + v8;
  }
  uint64_t v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          unsigned int v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            uint64_t v18 = 4;
          }
          else
          {
            BOOL v20 = v19 != 0;
            BOOL v13 = v19 >= 0xFF;
            uint64_t v18 = 2;
            if (!v13) {
              uint64_t v18 = v20;
            }
          }
        }
        else
        {
          uint64_t v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t sub_1B08CC0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 2, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_1B08CC1BC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_1B08CC30C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *sub_1B08CC4DC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_1B08CC62C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t sub_1B08CC7FC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 2;
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 1)
  {
    unsigned int v6 = 0;
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        uint64_t v8 = 4;
      }
      else
      {
        BOOL v10 = v9 != 0;
        BOOL v11 = v9 >= 0xFF;
        uint64_t v8 = 2;
        if (!v11) {
          uint64_t v8 = v10;
        }
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    v7 += v8;
  }
  if (!a2) {
    return 0;
  }
  int v12 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_30;
  }
  char v13 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)((char *)a1 + v7);
      if (!v14) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v7);
      if (!*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_30:
      if (v6)
      {
        unsigned int v19 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v19 >= 3) {
          return v19 - 2;
        }
        else {
          return 0;
        }
      }
      return 0;
    }
  }
  int v14 = *((unsigned __int8 *)a1 + v7);
  if (!*((unsigned char *)a1 + v7)) {
    goto LABEL_30;
  }
LABEL_20:
  int v16 = (v14 - 1) << v13;
  if (v7 > 3) {
    int v16 = 0;
  }
  if (v7)
  {
    if (v7 <= 3) {
      int v17 = v7;
    }
    else {
      int v17 = 4;
    }
    switch(v17)
    {
      case 2:
        int v18 = *a1;
        break;
      case 3:
        int v18 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v18 = *(_DWORD *)a1;
        break;
      default:
        int v18 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v18 = 0;
  }
  return v6 + (v18 | v16) + 1;
}

void sub_1B08CC9F0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v8 = v7 - 2;
  size_t v9 = *(void *)(v6 + 64);
  if (v7 <= 1)
  {
    unsigned int v8 = 0;
    if (v9 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    v9 += v10;
  }
  BOOL v13 = a3 >= v8;
  unsigned int v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v16 = ~v8 + a2;
    if (v9 < 4)
    {
      int v17 = (v16 >> (8 * v9)) + 1;
      if (v9)
      {
        int v19 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v9] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v9] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1B08CCC74);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        BOOL v20 = *(void (**)(void))(v6 + 56);
        v20();
      }
      return;
  }
}

uint64_t sub_1B08CCC9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t sub_1B08CCCCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t method lookup function for TLKAsyncCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TLKAsyncCache);
}

uint64_t dispatch thunk of TLKAsyncCache.getCachedObject(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TLKAsyncCache.getObject(forKey:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TLKAsyncCache.getObjects(forKeys:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TLKAsyncCache.clear()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t sub_1B08CCDE4()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B08CCE2C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unsigned int v5 = v1;
  v5[1] = sub_1B08CE1D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1E9B46C60 + dword_1E9B46C60);
  return v6(v2, v3, v4);
}

uint64_t sub_1B08CCEE4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unsigned int v5 = v1;
  v5[1] = sub_1B08CE1D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E9B46C70 + dword_1E9B46C70);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_25Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B08CCFE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unsigned int v7 = v2;
  v7[1] = sub_1B08CE1D4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9B46C80 + dword_1E9B46C80);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B08CD0B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B08CD114(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B08CE1D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9B46C90 + dword_1E9B46C90);
  return v6(a1, v4);
}

unint64_t sub_1B08CD1CC()
{
  unint64_t result = qword_1E9B46730;
  if (!qword_1E9B46730)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9B46730);
  }
  return result;
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B08CD250(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1B08CD260()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B08CD298(uint64_t a1)
{
  sub_1B08C59FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1B08CD2A0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1B08CD2B4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B08CE1D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9B46CA8 + dword_1E9B46CA8);
  return v6(a1, v4);
}

uint64_t sub_1B08CD36C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_1B08CD3A8()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1B08CE1D4;
  return sub_1B08C5A74((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

unint64_t sub_1B08CD454()
{
  unint64_t result = qword_1E9B46F90[0];
  if (!qword_1E9B46F90[0])
  {
    type metadata accessor for SingleCallingActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9B46F90);
  }
  return result;
}

uint64_t sub_1B08CD4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1B08CE1D4;
  return sub_1B08C35DC(a1, a2, v6);
}

uint64_t sub_1B08CD558()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B08CD598(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B08CD638;
  return sub_1B08C4154(a1, v5, v6, v4);
}

uint64_t sub_1B08CD638()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B08CD72C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B46718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B08CD794(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 32);
  uint64_t v6 = *a1;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v4 + 112);
  id v8 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_1B08C20BC(v8, v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    if (qword_1E9B46F00 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1B08CE218();
    __swift_project_value_buffer(v10, (uint64_t)qword_1E9B47070);
    unsigned int v11 = v8;
    BOOL v12 = sub_1B08CE1F8();
    os_log_type_t v13 = sub_1B08CE3B8();
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t typea = v13;
      uint64_t v14 = swift_slowAlloc();
      id v34 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412546;
      id v15 = objc_msgSend(self, sel_currentThread);
      sub_1B08CE3E8();
      *id v34 = v15;
      *(_WORD *)(v14 + 12) = 2112;
      unint64_t v37 = v11;
      unsigned int v16 = v11;
      sub_1B08CE3E8();
      v34[1] = v11;

      _os_log_impl(&dword_1B088B000, v12, typea, "[%@]: Found cached value for %@", (uint8_t *)v14, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
      swift_arrayDestroy();
      MEMORY[0x1B3E99C70](v34, -1, -1);
      MEMORY[0x1B3E99C70](v14, -1, -1);
    }
    else
    {

      BOOL v12 = v11;
    }
  }
  else
  {
    if (qword_1E9B46F00 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1B08CE218();
    __swift_project_value_buffer(v17, (uint64_t)qword_1E9B47070);
    swift_bridgeObjectRetain_n();
    unsigned int v18 = sub_1B08CE1F8();
    os_log_type_t v19 = sub_1B08CE3B8();
    os_log_type_t type = v18;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      os_log_type_t v31 = (void *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      unint64_t v37 = v32;
      *(_DWORD *)uint64_t v20 = 138412546;
      uint64_t v33 = v5;
      id v38 = objc_msgSend(self, sel_currentThread);
      sub_1B08CE3E8();
      *os_log_type_t v31 = v38;
      *(_WORD *)(v20 + 12) = 2080;
      unint64_t v21 = sub_1B08CD1CC();
      uint64_t v22 = swift_bridgeObjectRetain();
      uint64_t v23 = MEMORY[0x1B3E98FD0](v22, v21);
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      uint64_t v26 = v23;
      uint64_t v5 = v33;
      id v38 = (id)sub_1B08C7568(v26, v25, (uint64_t *)&v37);
      sub_1B08CE3E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B088B000, type, v19, "[%@]: Creating individual ComputationTracker for %s", (uint8_t *)v20, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46758);
      swift_arrayDestroy();
      MEMORY[0x1B3E99C70](v31, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1B3E99C70](v32, -1, -1);
      MEMORY[0x1B3E99C70](v20, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v8;
    *(void *)(v27 + 24) = v5;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B46720);
    uint64_t v9 = (void *)swift_allocObject();
    id v28 = v8;
    swift_unknownObjectRetain();
    swift_defaultActor_initialize();
    uint64_t v29 = MEMORY[0x1E4FBC860];
    v9[16] = v27;
    v9[17] = v29;
    v9[14] = 0;
    v9[15] = &unk_1E9B46D20;
    swift_beginAccess();
    BOOL v12 = v28;
    uint64_t v30 = swift_retain();
    sub_1B08C7D10(v30, v12);
    swift_endAccess();
  }

  *a2 = v9;
}

uint64_t sub_1B08CDCE8()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B08CDD28(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1B08CE1D4;
  *(_OWORD *)(v4 + 136) = v5;
  *(void *)(v4 + 128) = a1;
  return MEMORY[0x1F4188298](sub_1B08C2210, 0, 0);
}

uint64_t sub_1B08CDDDC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B08CDE1C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1B08CE1D4;
  *(_OWORD *)(v4 + 232) = v5;
  *(void *)(v4 + 224) = a1;
  return MEMORY[0x1F4188298](sub_1B08C2D34, 0, 0);
}

uint64_t sub_1B08CDED0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B08CDF34()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B08CDF74(unint64_t a1)
{
  sub_1B08C54D8(a1, *(void (**)(void))(v1 + 16));
}

uint64_t objectdestroy_63Tm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B08CDFD0()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1B08CD638;
  return sub_1B08C5A74((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1B08CE0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_1B08CE1C0()
{
}

uint64_t sub_1B08CE1F8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B08CE208()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B08CE218()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B08CE228()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B08CE238()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B08CE248()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B08CE258()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B08CE268()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B08CE278()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B08CE288()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B08CE298()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1B08CE2A8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B08CE2B8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B08CE2C8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1B08CE2D8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B08CE2E8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B08CE2F8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1B08CE308()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B08CE318()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B08CE328()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1B08CE338()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1B08CE348()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B08CE358()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B08CE368()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1B08CE378()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B08CE388()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B08CE398()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1B08CE3B8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B08CE3C8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B08CE3D8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B08CE3E8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B08CE3F8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B08CE408()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B08CE418()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B08CE428()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1B08CE438()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B08CE448()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B08CE458()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B08CE468()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B08CE478()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1B08CE488()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B08CE498()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B08CE4A8()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B08CE4B8()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1B08CE4C8()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1B08CE4D8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B08CE4E8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B08CE4F8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B08CE508()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B08CE518()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B08CE528()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1B08CE538()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B08CE548()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B08CE578()
{
  return MEMORY[0x1F4185DE0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1F40DF330]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4166EC0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x1F4166FD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
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