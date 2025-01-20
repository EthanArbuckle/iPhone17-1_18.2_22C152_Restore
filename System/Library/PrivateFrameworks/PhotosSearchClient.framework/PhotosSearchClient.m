uint64_t sub_259979E14()
{
  uint64_t v0;

  v0 = sub_25997B770();
  __swift_allocate_value_buffer(v0, qword_26A3D5720);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3D5720);
  return sub_25997B760();
}

uint64_t PhotosSearchClientWorker.doWork(context:durationThreshold:)(uint64_t a1, double a2)
{
  *(double *)(v2 + 104) = a2;
  *(void *)(v2 + 96) = a1;
  uint64_t v3 = sub_25997B820();
  *(void *)(v2 + 112) = v3;
  *(void *)(v2 + 120) = *(void *)(v3 - 8);
  *(void *)(v2 + 128) = swift_task_alloc();
  *(void *)(v2 + 136) = swift_task_alloc();
  uint64_t v4 = sub_25997B840();
  *(void *)(v2 + 144) = v4;
  *(void *)(v2 + 152) = *(void *)(v4 - 8);
  *(void *)(v2 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_259979FCC, 0, 0);
}

uint64_t sub_259979FCC()
{
  uint64_t v38 = v0;
  if (sub_25997B7B0())
  {
    if (qword_26A3D5718 != -1) {
      swift_once();
    }
    v1 = *(void **)(v0 + 96);
    uint64_t v2 = sub_25997B770();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A3D5720);
    id v3 = v1;
    uint64_t v4 = sub_25997B750();
    os_log_type_t v5 = sub_25997B7C0();
    BOOL v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 96);
    if (v6)
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v37[0] = v35;
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v9 = sub_25997B730();
      *(void *)(v0 + 80) = sub_25997AF28(v9, v10, v37);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      uint64_t v11 = sub_25997B740();
      *(void *)(v0 + 88) = sub_25997AF28(v11, v12, v37);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_259978000, v4, v5, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2E2BD0](v35, -1, -1);
      MEMORY[0x25A2E2BD0](v8, -1, -1);
    }
    else
    {
    }
    sub_25997B7A0();
    sub_25997B580(&qword_26A3D5708, MEMORY[0x263F8F488]);
    swift_allocError();
    sub_25997B780();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
    return v25(0);
  }
  if (sub_25997B7B0())
  {
    if (qword_26A3D5718 != -1) {
      swift_once();
    }
    v13 = *(void **)(v0 + 96);
    uint64_t v14 = sub_25997B770();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A3D5720);
    id v15 = v13;
    v16 = sub_25997B750();
    os_log_type_t v17 = sub_25997B7C0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    v19 = *(void **)(v0 + 96);
    if (v18)
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v37[0] = v36;
      *(_DWORD *)uint64_t v20 = 136315650;
      uint64_t v21 = sub_25997B730();
      *(void *)(v0 + 56) = sub_25997AF28(v21, v22, v37);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v23 = sub_25997B740();
      *(void *)(v0 + 64) = sub_25997AF28(v23, v24, v37);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 22) = 2048;
      *(void *)(v0 + 72) = 0;
      sub_25997B7E0();
      _os_log_impl(&dword_259978000, v16, v17, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A2E2BD0](v36, -1, -1);
      MEMORY[0x25A2E2BD0](v20, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_18;
  }
  *(void *)(v0 + 168) = 0;
  uint64_t v27 = *(void *)(v0 + 120);
  uint64_t v26 = *(void *)(v0 + 128);
  uint64_t v28 = *(void *)(v0 + 112);
  sub_25997B830();
  *(_OWORD *)(v0 + 40) = xmmword_25997BAC0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v29 = sub_25997B580(&qword_26A3D56F8, MEMORY[0x263F8F710]);
  sub_25997B880();
  sub_25997B580(&qword_26A3D5700, MEMORY[0x263F8F6D8]);
  sub_25997B850();
  v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(void *)(v0 + 176) = v30;
  *(void *)(v0 + 184) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v30(v26, v28);
  v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v31;
  void *v31 = v0;
  v31[1] = sub_25997A61C;
  uint64_t v33 = *(void *)(v0 + 136);
  uint64_t v32 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2380](v33, v0 + 16, v32, v29);
}

uint64_t sub_25997A61C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 176))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    id v3 = sub_25997ABA0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v6 = *(void *)(v2 + 144);
    (*(void (**)(void, void))(v2 + 176))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    id v3 = sub_25997A774;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25997A774()
{
  uint64_t v27 = v0;
  double v1 = *(double *)(v0 + 104);
  double v2 = *(double *)(v0 + 168) + 0.25;
  if (v2 >= v1 || (sub_25997B7B0() & 1) != 0)
  {
    if (qword_26A3D5718 != -1) {
      swift_once();
    }
    id v3 = *(void **)(v0 + 96);
    uint64_t v4 = sub_25997B770();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A3D5720);
    id v5 = v3;
    uint64_t v6 = sub_25997B750();
    os_log_type_t v7 = sub_25997B7C0();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void **)(v0 + 96);
    if (v8)
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v26 = v11;
      *(_DWORD *)uint64_t v10 = 136315650;
      uint64_t v12 = sub_25997B730();
      *(void *)(v0 + 56) = sub_25997AF28(v12, v13, &v26);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v14 = sub_25997B740();
      *(void *)(v0 + 64) = sub_25997AF28(v14, v15, &v26);
      sub_25997B7E0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 22) = 2048;
      *(double *)(v0 + 72) = v2;
      sub_25997B7E0();
      _os_log_impl(&dword_259978000, v6, v7, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A2E2BD0](v11, -1, -1);
      MEMORY[0x25A2E2BD0](v10, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v16 = *(uint64_t (**)(BOOL))(v0 + 8);
    return v16(v2 >= v1);
  }
  else
  {
    *(double *)(v0 + 168) = v2;
    uint64_t v19 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v20 = *(void *)(v0 + 112);
    sub_25997B830();
    *(_OWORD *)(v0 + 40) = xmmword_25997BAC0;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v21 = sub_25997B580(&qword_26A3D56F8, MEMORY[0x263F8F710]);
    sub_25997B880();
    sub_25997B580(&qword_26A3D5700, MEMORY[0x263F8F6D8]);
    sub_25997B850();
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    *(void *)(v0 + 176) = v22;
    *(void *)(v0 + 184) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v22(v18, v20);
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_25997A61C;
    uint64_t v25 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 144);
    return MEMORY[0x270FA2380](v25, v0 + 16, v24, v21);
  }
}

uint64_t sub_25997ABA0()
{
  uint64_t v21 = v0;
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  if (qword_26A3D5718 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25997B770();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A3D5720);
  double v2 = sub_25997B750();
  os_log_type_t v3 = sub_25997B7D0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_259978000, v2, v3, "Task interruped while sleeping.", v4, 2u);
    MEMORY[0x25A2E2BD0](v4, -1, -1);
  }
  MEMORY[0x25A2E2B50](v0[25]);

  uint64_t v5 = v0[21];
  if (qword_26A3D5718 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)v0[12];
  __swift_project_value_buffer(v1, (uint64_t)qword_26A3D5720);
  id v7 = v6;
  BOOL v8 = sub_25997B750();
  os_log_type_t v9 = sub_25997B7C0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[12];
  if (v10)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v14 = sub_25997B730();
    v0[7] = sub_25997AF28(v14, v15, &v20);
    sub_25997B7E0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v16 = sub_25997B740();
    v0[8] = sub_25997AF28(v16, v17, &v20);
    sub_25997B7E0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 22) = 2048;
    v0[9] = v5;
    sub_25997B7E0();
    _os_log_impl(&dword_259978000, v8, v9, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25A2E2BD0](v13, -1, -1);
    MEMORY[0x25A2E2BD0](v12, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18(0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25997AF28(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25997AFFC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25997B628((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25997B628((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_25997AFFC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25997B7F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25997B1B8(a5, a6);
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
  uint64_t v8 = sub_25997B810();
  if (!v8)
  {
    sub_25997B860();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25997B870();
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

uint64_t sub_25997B1B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25997B250(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25997B430(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25997B430(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25997B250(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25997B3C8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25997B800();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25997B860();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25997B790();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25997B870();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25997B860();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25997B3C8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D5710);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25997B430(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D5710);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25997B870();
  __break(1u);
  return result;
}

uint64_t sub_25997B580(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for PhotosSearchClientWorker()
{
  return &type metadata for PhotosSearchClientWorker;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25997B628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_25997B730()
{
  return MEMORY[0x270F472A0]();
}

uint64_t sub_25997B740()
{
  return MEMORY[0x270F472A8]();
}

uint64_t sub_25997B750()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25997B760()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25997B770()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25997B780()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_25997B790()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25997B7A0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_25997B7B0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25997B7C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25997B7D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25997B7E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25997B7F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25997B800()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25997B810()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25997B820()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25997B830()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25997B840()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25997B850()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25997B860()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25997B870()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25997B880()
{
  return MEMORY[0x270FA2378]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}