uint64_t GenericReporter.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD3818(a1, a2, a3, (uint64_t (*)(void))sub_262BD3EF8);
}

uint64_t GenericReporter.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD3818(a1, a2, a3, (uint64_t (*)(void))sub_262BD3EBC);
}

uint64_t sub_262BD3818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void *sub_262BD3884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1, a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = a2;
  *((void *)v11 + 3) = a3;
  *((void *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a3);
  return &unk_26A994F38;
}

uint64_t sub_262BD39B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 24) + **(int **)(a5 + 24));
  v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  void *v9 = v5;
  v9[1] = sub_262BD3AB8;
  return v11(a1, a4, a5);
}

uint64_t sub_262BD3AB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_262BD3BAC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_262BD3BCC, 0, 0);
}

uint64_t sub_262BD3BCC()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[3] + 16) + **(int **)(v0[3] + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_262BD3CA0;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t sub_262BD3CA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t GenericReporter.deinit()
{
  swift_release();
  return v0;
}

uint64_t GenericReporter.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_262BD3DEC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_262BD43BC;
  return MEMORY[0x270FA2498](sub_262BD3BCC, 0, 0);
}

void sub_262BD3E9C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void sub_262BD3EA8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_262BD3EB0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_262BD3EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = sub_262BD3884(a1, *(void *)(*v3 + 80), a2, a3);
  v3[3] = v4;
  return v3;
}

void *sub_262BD3EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for GenericReporter();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = sub_262BD3884(a1, *(void *)(*v6 + 80), a2, a3);
  v6[3] = v7;
  return v6;
}

uint64_t sub_262BD3F70(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t dispatch thunk of Reporter.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_262BD43BC;
  return v9(a1, a2, a3);
}

uint64_t sub_262BD4080()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GenericReporter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for GenericReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenericReporter);
}

uint64_t dispatch thunk of GenericReporter.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of GenericReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 112) + **(int **)(*(void *)v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_262BD3AB8;
  return v6(a1);
}

uint64_t sub_262BD4210()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_262BD4298(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_262BD43BC;
  return sub_262BD39B0(a1, v7, v4, v5, v6);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t GenericWorker.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD43F0(a1, a2, a3, (uint64_t (*)(void))sub_262BD49F8);
}

uint64_t GenericWorker.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD43F0(a1, a2, a3, (uint64_t (*)(void))sub_262BD49A4);
}

uint64_t sub_262BD43F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void *sub_262BD445C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](a1, a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (char *)swift_allocObject();
  *((void *)v13 + 2) = a2;
  *((void *)v13 + 3) = a3;
  *((void *)v13 + 4) = a4;
  *((void *)v13 + 5) = a5;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v13[v12], v11, a4);
  return &unk_26A994FE8;
}

uint64_t sub_262BD4590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 40) + **(int **)(a7 + 40));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v12;
  *unint64_t v12 = v7;
  v12[1] = sub_262BD3AB8;
  return v14(a1, a2, a6, a7);
}

uint64_t sub_262BD46A4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_262BD46C8, 0, 0);
}

uint64_t sub_262BD46C8()
{
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0[4] + 16) + **(int **)(v0[4] + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_262BD479C;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  return v5(v2, v3);
}

uint64_t sub_262BD479C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t GenericWorker.deinit()
{
  swift_release();
  return v0;
}

uint64_t GenericWorker.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_262BD48E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_262BD43BC;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_262BD46C8, 0, 0);
}

void *sub_262BD49A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = sub_262BD445C(a1, *(void *)(*v3 + 80), *(void *)(*v3 + 88), a2, a3);
  v3[3] = v4;
  return v3;
}

void *sub_262BD49F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for GenericWorker();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = sub_262BD445C(a1, *(void *)(*v6 + 80), *(void *)(*v6 + 88), a2, a3);
  v6[3] = v7;
  return v6;
}

uint64_t sub_262BD4A98(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_262BD4AA0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t dispatch thunk of Worker.doWork(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_262BD43BC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_262BD4BB8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GenericWorker()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for GenericWorker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenericWorker);
}

uint64_t dispatch thunk of GenericWorker.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of GenericWorker.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_262BD3AB8;
  return v8(a1, a2);
}

uint64_t sub_262BD4D54()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_262BD4DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = (uint64_t)v2
      + ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80));
  v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_262BD43BC;
  return sub_262BD4590(a1, a2, v10, v6, v7, v8, v9);
}

uint64_t LighthouseRuntimeProcessor.runtime.getter()
{
  return swift_retain();
}

uint64_t *LighthouseRuntimeProcessor.__allocating_init(task:plugin:enforceDiagnosticCheck:)(void *a1, uint64_t a2, char a3)
{
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(a1, a2, a3);
}

uint64_t *LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v4;
  v4[3] = 0;
  if ((a3 & 1) != 0 && (static LighthouseRuntimeProcessor.isDiagnosticsSubmissionAllowed()() & 1) == 0)
  {

    (*(void (**)(uint64_t))(*(void *)(*(void *)(v7 + 80) - 8) + 8))(a2);
    swift_release();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    uint64_t v10 = v7 + 80;
    uint64_t v8 = *(void *)(v7 + 80);
    uint64_t v9 = *(uint64_t **)(v10 + 8);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    type metadata accessor for LighthouseRuntime();
    id v11 = a1;
    sub_262BDF18C(a1);

    uint64_t v12 = LighthouseRuntime.setLighthousePlugin<A>(_:)(a2, v8, v9);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a2, v8);
    v4[2] = v12;
  }
  return v4;
}

uint64_t LighthouseRuntimeProcessor.process()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_262BE4B60();
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PluginContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_262BD8CEC((uint64_t)v7);
  uint64_t result = sub_262BD73D8((uint64_t)v7, &qword_26A994FF0);
  *a1 = 1;
  return result;
}

uint64_t LighthouseRuntimeProcessor.process(withContext:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_262BE4B60();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262BD6BF4(a1, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for PluginContext();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  sub_262BD8CEC((uint64_t)v9);
  uint64_t result = sub_262BD73D8((uint64_t)v9, &qword_26A994FF0);
  *a2 = 1;
  return result;
}

uint64_t LighthouseRuntimeProcessor.processAsync(withContext:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *v2;
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0) - 8);
  v3[6] = v4;
  v3[7] = *(void *)(v4 + 64);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  v3[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BD564C, 0, 0);
}

uint64_t sub_262BD564C()
{
  uint64_t v1 = v0[4];
  if (*(void *)(v1 + 24))
  {
    sub_262BD6C58();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v5 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[3];
    uint64_t v9 = sub_262BE4B80();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    sub_262BD730C(v8, v5, &qword_26A994FF0);
    unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = *(void *)(v7 + 80);
    v12[5] = *(void *)(v7 + 88);
    v12[6] = v10;
    sub_262BD6E50(v5, (uint64_t)v12 + v11);
    uint64_t v13 = sub_262BD5D14(v4, (uint64_t)&unk_26A995020, (uint64_t)v12);
    v0[10] = v13;
    *(void *)(v1 + 24) = v13;
    swift_retain();
    swift_release();
    v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A995028 + dword_26A995028);
    swift_retain();
    v14 = (void *)swift_task_alloc();
    v0[11] = v14;
    void *v14 = v0;
    v14[1] = sub_262BD58B8;
    uint64_t v15 = v0[2];
    return v16(v15, v13);
  }
}

uint64_t sub_262BD58B8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_262BD59B4, 0, 0);
}

uint64_t sub_262BD59B4()
{
  *(void *)(*(void *)(v0 + 32) + 24) = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BD5A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 40) = a4;
  *(void *)(v5 + 48) = a5;
  return MEMORY[0x270FA2498](sub_262BD5A68, 0, 0);
}

uint64_t sub_262BD5A68()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v0[7] = *(void *)(Strong + 16);
    swift_retain();
    swift_release();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[8] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_262BD5B74;
    uint64_t v3 = v0[6];
    return sub_262BD8FF0(1000, v3);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_262BD5B74()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_262BD5CB0, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_262BD5CB0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BD5D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_262BE4B80();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_262BE4B70();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_262BD73D8(a1, &qword_26A995008);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_262BE4B50();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_262BD5E9C(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v4 = sub_262BE4B60();
  v2[5] = v4;
  v2[6] = *(void *)(v4 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[8] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
  v2[9] = v6;
  *uint64_t v5 = v2;
  v5[1] = sub_262BD5FC0;
  uint64_t v7 = MEMORY[0x263F8EE60] + 8;
  uint64_t v8 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v6, a2, v7, v6, v8);
}

uint64_t sub_262BD5FC0()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_262BD6144;
  }
  else {
    uint64_t v2 = sub_262BD60D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BD60D4()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *uint64_t v1 = 1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_262BD6144()
{
  uint64_t v1 = *(void **)(v0 + 80);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  char v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 80);
  if (v3)
  {
    uint64_t v6 = *(void *)(v0 + 48);
    uint64_t v5 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v8 = *(void **)(v0 + 24);

    *uint64_t v8 = 2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

    swift_release();
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 24);

    swift_release();
    void *v9 = v4;
  }
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

Swift::Void __swiftcall LighthouseRuntimeProcessor.stop()()
{
  if (*(void *)(v0 + 24))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BA0();
    swift_release();
  }
}

id static LighthouseRuntimeProcessor.isDiagnosticsSubmissionAllowed()()
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = objc_msgSend(result, sel_effectiveBoolValueForSetting_, *MEMORY[0x263F53878]);

    return (id)(v2 == 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LighthouseRuntimeProcessor.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t LighthouseRuntimeProcessor.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

id LighthouseRuntimeProcessorResult.mlrTaskResult.getter()
{
  uint64_t v1 = *v0;
  if (v1 == (void *)3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A995030);
    uint64_t inited = swift_initStackObject();
    uint64_t v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_262BE55A0;
    *(void *)(inited + 32) = 0x746C75736572;
    *(void *)(inited + 40) = 0xE600000000000000;
    unint64_t v4 = 0xD00000000000001ALL;
    unint64_t v5 = 0x8000000262BE5F00;
  }
  else if (v1 == (void *)2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A995030);
    uint64_t inited = swift_initStackObject();
    uint64_t v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_262BE55A0;
    *(void *)(inited + 32) = 0x746C75736572;
    *(void *)(inited + 40) = 0xE600000000000000;
    unint64_t v4 = 0x656C6C65636E6163;
    unint64_t v5 = 0xE900000000000064;
  }
  else
  {
    if (v1 != (void *)1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A995030);
      uint64_t v3 = swift_initStackObject();
      *(_OWORD *)(v3 + 16) = xmmword_262BE55B0;
      *(void *)(v3 + 32) = 0x746C75736572;
      *(void *)(v3 + 40) = 0xE600000000000000;
      *(void *)(v3 + 48) = 0x6572756C696166;
      *(void *)(v3 + 56) = 0xE700000000000000;
      *(void *)(v3 + 64) = 0x726F727265;
      *(void *)(v3 + 72) = 0xE500000000000000;
      sub_262BD6FA4(v1);
      __swift_instantiateConcreteTypeFromMangledName(qword_26A995038);
      *(void *)(v3 + 80) = sub_262BE4AF0();
      *(void *)(v3 + 88) = v6;
      goto LABEL_9;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A995030);
    uint64_t inited = swift_initStackObject();
    uint64_t v3 = inited;
    *(_OWORD *)(inited + 16) = xmmword_262BE55A0;
    *(void *)(inited + 32) = 0x746C75736572;
    *(void *)(inited + 40) = 0xE600000000000000;
    unint64_t v4 = 0x73736563637573;
    unint64_t v5 = 0xE700000000000000;
  }
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v5;
LABEL_9:
  unint64_t v7 = sub_262BD6720(v3);
  sub_262BD6844(v7);
  swift_bridgeObjectRelease();
  id v8 = objc_allocWithZone(MEMORY[0x263F534A8]);
  uint64_t v9 = (void *)sub_262BE4AB0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithJSONResult_unprivatizedVector_, v9, 0);

  return v10;
}

unint64_t sub_262BD65E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9950C0);
  uint64_t v2 = sub_262BE4D10();
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
    sub_262BD730C(v6, (uint64_t)&v15, &qword_26A9950C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_262BDEE00(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_262BD7370(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_262BD6720(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9950D0);
  uint64_t v2 = (void *)sub_262BE4D10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_262BDEE00(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_262BD6844(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9950C0);
    uint64_t v2 = (void *)sub_262BE4D10();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  uint64_t v11 = MEMORY[0x263F8D310];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_262BD73D0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (int64_t i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_262BD7370(v6, v7);
    sub_262BD7370(v7, v40);
    sub_262BD7370(v40, &v38);
    unint64_t result = sub_262BDEE00(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      long long v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *long long v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      unint64_t result = (unint64_t)sub_262BD7370(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_262BD7370(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
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

uint64_t sub_262BD6BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_262BD6C58()
{
  unint64_t result = qword_26A995010;
  if (!qword_26A995010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A995010);
  }
  return result;
}

uint64_t sub_262BD6CAC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_262BD6CE4()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  unint64_t v5 = (id *)(v0 + v3);
  uint64_t v6 = type metadata accessor for PluginContext();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v0 + v3, 1, v6))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v5 + *(int *)(v6 + 32);
    uint64_t v8 = sub_262BE4930();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_262BD6E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262BD6EB8()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0) - 8);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_262BD3AB8;
  v5[5] = v3;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_262BD5A68, 0, 0);
}

id sub_262BD6FA4(id result)
{
  if ((char *)result - 1 >= (char *)3) {
    return result;
  }
  return result;
}

uint64_t sub_262BD6FB8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LighthouseRuntimeProcessor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LighthouseRuntimeProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LighthouseRuntimeProcessor);
}

uint64_t dispatch thunk of LighthouseRuntimeProcessor.__allocating_init(task:plugin:enforceDiagnosticCheck:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for LighthouseProcessorTaskAlreadyRunning()
{
  return &type metadata for LighthouseProcessorTaskAlreadyRunning;
}

void destroy for LighthouseRuntimeProcessorResult(void **a1)
{
  uint64_t v1 = *a1;
  int v2 = -1;
  if ((unint64_t)v1 < 0xFFFFFFFF) {
    int v2 = (int)v1;
  }
  if ((v2 + 1) <= 1) {
}
  }

void *_s18lighthouse_runtime32LighthouseRuntimeProcessorResultOwCP_0(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  LODWORD(v4) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    uint64_t v4 = *a2;
  }
  if ((v4 + 1) <= 1) {
    id v5 = v3;
  }
  *a1 = v3;
  return a1;
}

void **assignWithCopy for LighthouseRuntimeProcessorResult(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)v3 >= 0xFFFFFFFF) {
    int v5 = -1;
  }
  else {
    int v5 = (int)v3;
  }
  unsigned int v6 = v5 + 1;
  uint64_t v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    uint64_t v4 = *a2;
  }
  unsigned int v8 = v4 + 1;
  if (v6 > 1)
  {
    if (v8 <= 1) {
      id v11 = v7;
    }
    *a1 = v7;
  }
  else if (v8 > 1)
  {

    *a1 = *a2;
  }
  else
  {
    id v9 = v7;
    uint64_t v10 = *a1;
    *a1 = v7;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for LighthouseRuntimeProcessorResult(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)v3 >= 0xFFFFFFFF) {
    int v5 = -1;
  }
  else {
    int v5 = (int)v3;
  }
  unsigned int v6 = v5 + 1;
  uint64_t v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF) {
    uint64_t v4 = *a2;
  }
  unsigned int v8 = v4 + 1;
  if (v6 > 1) {
    goto LABEL_11;
  }
  if (v8 > 1)
  {

LABEL_11:
    *a1 = v7;
    return a1;
  }
  *a1 = v7;

  return a1;
}

uint64_t getEnumTagSinglePayload for LighthouseRuntimeProcessorResult(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 4) {
    return (v3 - 3);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeProcessorResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_262BD72A8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

void *sub_262BD72CC(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *unint64_t result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeProcessorResult()
{
  return &type metadata for LighthouseRuntimeProcessorResult;
}

uint64_t sub_262BD730C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_262BD7370(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_262BD73D0()
{
  return swift_release();
}

uint64_t sub_262BD73D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t GenericDataProvider.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD7464(a1, a2, a3, (uint64_t (*)(void))sub_262BD7940);
}

uint64_t GenericDataProvider.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_262BD7464(a1, a2, a3, (uint64_t (*)(void))sub_262BD7904);
}

uint64_t sub_262BD7464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

void *sub_262BD74D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1, a1);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  id v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = a2;
  *((void *)v11 + 3) = a3;
  *((void *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a3);
  return &unk_26A995180;
}

uint64_t sub_262BD75FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 24) + **(int **)(a5 + 24));
  id v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  void *v9 = v5;
  v9[1] = sub_262BD3AB8;
  return v11(a1, a4, a5);
}

uint64_t sub_262BD7708(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_262BD7728, 0, 0);
}

uint64_t sub_262BD7728()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[3] + 16) + **(int **)(v0[3] + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_262BD3CA0;
  uint64_t v2 = v0[2];
  return v4(v2);
}

uint64_t GenericDataProvider.deinit()
{
  swift_release();
  return v0;
}

uint64_t GenericDataProvider.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_262BD7854(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_262BD43BC;
  return MEMORY[0x270FA2498](sub_262BD7728, 0, 0);
}

void *sub_262BD7904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = sub_262BD74D0(a1, *(void *)(*v3 + 80), a2, a3);
  v3[3] = v4;
  return v3;
}

void *sub_262BD7940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for GenericDataProvider();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = sub_262BD74D0(a1, *(void *)(*v6 + 80), a2, a3);
  v6[3] = v7;
  return v6;
}

uint64_t dispatch thunk of DataProvider.loadData()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_262BD3AB8;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for GenericDataProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for GenericDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenericDataProvider);
}

uint64_t dispatch thunk of GenericDataProvider.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of GenericDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 112) + **(int **)(*(void *)v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_262BD43BC;
  return v6(a1);
}

uint64_t sub_262BD7C0C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_262BD7C94(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_262BD43BC;
  return sub_262BD75FC(a1, v7, v4, v5, v6);
}

void *LighthouseRuntime.__allocating_init(_:)(void *a1)
{
  uint64_t v2 = sub_262BDF18C(a1);

  return v2;
}

uint64_t LighthouseRuntime.setLighthousePlugin<A>(_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_262BDF1E0(a1, a2, a3[1]);
  uint64_t v6 = a3[3];
  swift_retain();
  sub_262BDF274(a1, a2, v6);
  swift_retain();
  swift_release();
  uint64_t v7 = sub_262BDF314(a1, a2, a3[2]);
  swift_retain();
  swift_release();
  return v7;
}

uint64_t sub_262BD7E50(char a1, char a2)
{
  if (*(void *)&aStart_2[8 * a1] == *(void *)&aStart_2[8 * a2]
    && *(void *)&aFinished_1[8 * a1 + 8] == *(void *)&aFinished_1[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_262BE4D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_262BD7ED8(char a1, char a2)
{
  if (*(void *)&aLoaddatadowork[8 * a1] == *(void *)&aLoaddatadowork[8 * a2]
    && *(void *)&aTotalrun[8 * a1 + 8] == *(void *)&aTotalrun[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_262BE4D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_262BD7F60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  MEMORY[0x270FA5388](v0 - 8, v1);
  char v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PluginContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A995338);
  swift_allocObject();
  uint64_t result = sub_262BE4E30();
  qword_26A995188 = result;
  return result;
}

uint64_t static PluginContext.$current.getter()
{
  if (qword_26A994E80 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static PluginContext.current.getter()
{
  if (qword_26A994E80 != -1) {
    swift_once();
  }
  return sub_262BE4E40();
}

void PluginContext.init(trialId:parameters:attachments:trialNamespace:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  uint64_t v8 = type metadata accessor for PluginContext();
  id v9 = a1;
  sub_262BE4920();
  id v10 = objc_allocWithZone((Class)sub_262BE4980());
  uint64_t v11 = sub_262BE4970();

  *(void *)((char *)a6 + *(int *)(v8 + 36)) = v11;
}

uint64_t PluginContext.init(trialId:parameters:attachments:trialNamespace:MLHostContext:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  uint64_t v9 = type metadata accessor for PluginContext();
  uint64_t result = sub_262BE4920();
  *(void *)((char *)a7 + *(int *)(v9 + 36)) = a6;
  return result;
}

id PluginContext.trialId.getter()
{
  return *v0;
}

void PluginContext.trialId.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*PluginContext.trialId.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PluginContext.parameters.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*PluginContext.parameters.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PluginContext.attachments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*PluginContext.attachments.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.trialNamespace.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PluginContext.trialNamespace.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PluginContext.trialNamespace.modify())()
{
  return nullsub_1;
}

uint64_t PluginContext.correlationID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PluginContext() + 32);
  uint64_t v4 = sub_262BE4930();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PluginContext.correlationID.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PluginContext() + 32);
  uint64_t v4 = sub_262BE4930();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*PluginContext.correlationID.modify())()
{
  return nullsub_1;
}

id PluginContext.mlhostContext.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PluginContext() + 36));
  return v1;
}

BOOL static LighthouseRuntimeError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LighthouseRuntimeError.hash(into:)()
{
  return sub_262BE4DD0();
}

uint64_t LighthouseRuntimeError.hashValue.getter()
{
  return sub_262BE4DE0();
}

BOOL sub_262BD856C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_262BD8584()
{
  return sub_262BE4DE0();
}

uint64_t sub_262BD85CC()
{
  return sub_262BE4DD0();
}

uint64_t sub_262BD85F8()
{
  return sub_262BE4DE0();
}

lighthouse_runtime::LHRStates_optional __swiftcall LHRStates.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_262BE4D30();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static LHRStates.allCases.getter()
{
  return &unk_270E0E038;
}

uint64_t LHRStates.rawValue.getter()
{
  return *(void *)&aStart_2[8 * *v0];
}

uint64_t sub_262BD86C8(char *a1, char *a2)
{
  return sub_262BD7E50(*a1, *a2);
}

uint64_t sub_262BD86D4()
{
  return sub_262BD86DC();
}

uint64_t sub_262BD86DC()
{
  return sub_262BE4DE0();
}

uint64_t sub_262BD8748()
{
  return sub_262BE4DE0();
}

uint64_t sub_262BD87B4()
{
  return sub_262BD87BC();
}

uint64_t sub_262BD87BC()
{
  sub_262BE4B00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_262BD8810()
{
  sub_262BE4B00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_262BD8864()
{
  return sub_262BD88D4();
}

uint64_t sub_262BD886C()
{
  return sub_262BE4DE0();
}

uint64_t sub_262BD88D4()
{
  return sub_262BE4DE0();
}

lighthouse_runtime::LHRStates_optional sub_262BD893C(Swift::String *a1)
{
  return LHRStates.init(rawValue:)(*a1);
}

uint64_t sub_262BD8948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LHRStates.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_262BD8970(void *a1@<X8>)
{
  *a1 = &unk_270E0E060;
}

const char *LRSignpostName.staticString.getter()
{
  uint64_t result = "LoadData";
  switch(*v0)
  {
    case 1:
      uint64_t result = "DoWork";
      break;
    case 2:
      uint64_t result = "Report";
      break;
    case 3:
      uint64_t result = "TotalRuntime";
      break;
    default:
      return result;
  }
  return result;
}

lighthouse_runtime::LRSignpostName_optional __swiftcall LRSignpostName.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_262BE4D30();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t LRSignpostName.rawValue.getter()
{
  return *(void *)&aLoaddatadowork[8 * *v0];
}

uint64_t sub_262BD8A74(char *a1, char *a2)
{
  return sub_262BD7ED8(*a1, *a2);
}

uint64_t sub_262BD8A80()
{
  return sub_262BD8748();
}

uint64_t sub_262BD8A88()
{
  return sub_262BD8810();
}

uint64_t sub_262BD8A90()
{
  return sub_262BD886C();
}

lighthouse_runtime::LRSignpostName_optional sub_262BD8A98(Swift::String *a1)
{
  return LRSignpostName.init(rawValue:)(*a1);
}

uint64_t sub_262BD8AA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LRSignpostName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

const char *sub_262BD8ACC()
{
  uint64_t result = "LoadData";
  switch(*v0)
  {
    case 1:
      uint64_t result = "DoWork";
      break;
    case 2:
      uint64_t result = "Report";
      break;
    case 3:
      uint64_t result = "TotalRuntime";
      break;
    default:
      return result;
  }
  return result;
}

void createSignposter(subsystem:category:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F52768]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_262BE4AD0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithName_, v1);

  id v3 = objc_allocWithZone(MEMORY[0x263F52760]);
  swift_bridgeObjectRetain();
  id v4 = v2;
  char v5 = (void *)sub_262BE4AD0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithName_subsystem_, v5, v4);

  objc_msgSend(v6, sel_setSignpostPersisted_, 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_262BE49D0();
}

uint64_t sub_262BD8C8C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t sub_262BD8C9C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t sub_262BD8CAC(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return swift_release();
}

void *LighthouseRuntime.init(_:)(void *a1)
{
  id v2 = sub_262BDEF5C(a1);

  return v2;
}

void sub_262BD8CEC(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8, v9);
  sub_262BD730C(a1, (uint64_t)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26A994FF0);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = *(void *)(v4 + 80);
  *(_OWORD *)(v11 + 24) = *(_OWORD *)(v5 + 88);
  *(void *)(v11 + 40) = *(void *)(v4 + 104);
  *(void *)(v11 + 48) = v2;
  sub_262BD6E50((uint64_t)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  id v12 = objc_allocWithZone((Class)type metadata accessor for AsyncOperation());
  swift_retain();
  id v13 = sub_262BE3090((uint64_t)&unk_26A995198, v11);
  swift_release();
  uint64_t v14 = (void *)v2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9951A0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_262BE57A0;
  *(void *)(v15 + 32) = v13;
  v20[1] = v15;
  sub_262BE4B40();
  sub_262BDF630();
  uint64_t v16 = (char *)v13;
  long long v17 = (void *)sub_262BE4B20();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_addOperations_waitUntilFinished_, v17, 1);

  v18 = *(void **)&v16[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error];
  if (v18)
  {
    id v19 = v18;
    swift_willThrow();
  }
}

uint64_t sub_262BD8F50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_262BD3AB8;
  return sub_262BD8FF0(1000, a2);
}

uint64_t sub_262BD8FF0(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  v3[12] = *v2;
  uint64_t v4 = sub_262BE49F0();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  v3[16] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for PluginContext();
  v3[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[18] = v6;
  v3[19] = *(void *)(v6 + 64);
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  uint64_t v7 = sub_262BE49B0();
  v3[22] = v7;
  v3[23] = *(void *)(v7 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BD9224, 0, 0);
}

uint64_t sub_262BD9224()
{
  *(void *)(v0 + 216) = qword_26A9951B8;
  sub_262BE49A0();
  uint64_t v1 = sub_262BE49C0();
  os_signpost_type_t v2 = sub_262BE4C80();
  if (sub_262BE4C90())
  {
    uint64_t v3 = *(void *)(v0 + 200);
    uint64_t v4 = *(void *)(v0 + 176);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    unint64_t v7 = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v6(v3, *(void *)(v0 + 208), v4);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    os_signpost_id_t v9 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v1, v2, v9, "TotalRuntime", "", v8, 2u);
    MEMORY[0x263E5E950](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 184);

    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    unint64_t v7 = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v11 = *(void *)(v0 + 200);
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v13 = *(void *)(v0 + 184);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v29 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 128);
  uint64_t v17 = *(void *)(v0 + 80);
  *(void *)(v0 + 224) = v6;
  *(void *)(v0 + 232) = v7;
  v6(v11, v12, v14);
  sub_262BE4A20();
  swift_allocObject();
  *(void *)(v0 + 240) = sub_262BE4A10();
  v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(void *)(v0 + 248) = v18;
  *(void *)(v0 + 256) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v18(v12, v14);
  sub_262BD730C(v17, v16, &qword_26A994FF0);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v16, 1, v29);
  uint64_t v20 = *(void *)(v0 + 128);
  if (v19 == 1)
  {
    sub_262BDD454(*(void **)(v0 + 168));
    sub_262BD73D8(v20, &qword_26A994FF0);
  }
  else
  {
    sub_262BDF89C(*(void *)(v0 + 128), *(void *)(v0 + 168));
  }
  uint64_t v21 = *(void *)(v0 + 168);
  uint64_t v22 = *(void *)(v0 + 136);
  *(void *)(v0 + 264) = *(void *)(*(void *)(v0 + 88) + qword_26A9951C0);
  *(unsigned char *)(v0 + 42) = 0;
  uint64_t v23 = *(int *)(v22 + 36);
  *(_DWORD *)(v0 + 44) = v23;
  v24 = *(void **)(v21 + v23);
  *(void *)(v0 + 272) = v24;
  sub_262BE4960();
  sub_262BDF670();
  id v25 = v24;
  uint64_t v26 = sub_262BE4B50();
  *(void *)(v0 + 280) = v26;
  *(void *)(v0 + 288) = v27;
  return MEMORY[0x270FA2498](sub_262BD94FC, v26, v27);
}

uint64_t sub_262BD94FC()
{
  uint64_t v1 = *(void **)(v0 + 272);
  *(void *)(v0 + 296) = sub_262BDF6C8();
  sub_262BE4940();

  return MEMORY[0x270FA2498](sub_262BD95BC, 0, 0);
}

uint64_t sub_262BD95BC()
{
  uint64_t v1 = sub_262BE4910();
  uint64_t v3 = v2;
  uint64_t v31 = v1;
  *(void *)(v0 + 304) = v1;
  *(void *)(v0 + 312) = v2;
  uint64_t v4 = self;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_262BE4AB0();
  *(void *)(v0 + 48) = 0;
  id v6 = objc_msgSend(v4, sel_dataWithJSONObject_options_error_, v5, 0, v0 + 48);

  id v7 = *(id *)(v0 + 48);
  if (!v6)
  {
    uint64_t v11 = v7;
    uint64_t v12 = (void *)sub_262BE48E0();

    swift_willThrow();
    swift_bridgeObjectRelease();
LABEL_4:
    uint64_t v13 = *(void *)(v0 + 72);
    goto LABEL_5;
  }
  uint64_t v8 = sub_262BE4900();
  unint64_t v10 = v9;

  sub_262BE48D0();
  swift_allocObject();
  sub_262BE48C0();
  sub_262BDFB50();
  sub_262BE48B0();
  sub_262BDFBA4(v8, v10);
  swift_release();
  *(unsigned char *)(v0 + 41) = 0;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v0 + 41) == 1) {
    goto LABEL_4;
  }
  if (*(void *)(v0 + 24))
  {
    if (*(unsigned char *)(v0 + 40)) {
      uint64_t v13 = *(void *)(v0 + 72);
    }
    else {
      uint64_t v13 = *(void *)(v0 + 32);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 16);
  }
LABEL_5:
  if (qword_26A994E88 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_262BE4A60();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A9960C8);
  uint64_t v15 = sub_262BE4A40();
  os_log_type_t v16 = sub_262BE4C00();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134217984;
    *(void *)(v0 + 64) = v13;
    sub_262BE4CB0();
    _os_log_impl(&dword_262BD2000, v15, v16, "Running task with timeout %llu", v17, 0xCu);
    MEMORY[0x263E5E950](v17, -1, -1);
  }
  uint64_t v19 = *(void *)(v0 + 160);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 152);
  uint64_t v23 = *(void *)(v0 + 88);
  uint64_t v22 = *(void *)(v0 + 96);

  sub_262BD6BF4(v18, v19);
  unint64_t v24 = (*(unsigned __int8 *)(v21 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v25 = (v20 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v0 + 320) = v26;
  *(void *)(v26 + 16) = *(void *)(v22 + 80);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)(v22 + 88);
  *(void *)(v26 + 40) = *(void *)(v22 + 104);
  sub_262BDF89C(v19, v26 + v24);
  *(void *)(v26 + v25) = v23;
  uint64_t v27 = (uint64_t *)(v26 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t *v27 = v31;
  v27[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v28;
  v28[2] = &unk_26A9951E0;
  v28[3] = v26;
  v28[4] = v13;
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v29;
  *uint64_t v29 = v0;
  v29[1] = sub_262BD9A14;
  return MEMORY[0x270FA22B8]();
}

uint64_t sub_262BD9A14()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_262BD9B6C;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_262BD9C90;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BD9B6C()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_release();
  sub_262BDFAF4(v1);
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

uint64_t sub_262BD9C90()
{
  uint64_t v29 = v0;
  uint64_t v1 = v0;
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t *)(v0 + 192);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_262BE49C0();
  sub_262BE4A00();
  os_signpost_type_t v4 = sub_262BE4C70();
  if (sub_262BE4C90())
  {
    os_signpost_type_t v27 = v4;
    uint64_t v5 = *(void *)(v1 + 112);
    uint64_t v6 = *(void *)(v1 + 120);
    uint64_t v7 = *(void *)(v1 + 104);
    swift_retain();
    sub_262BE4A30();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v5 + 88))(v6, v7) == *MEMORY[0x263F90238])
    {
      char v8 = 0;
      char v9 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v1 + 112) + 8))(*(void *)(v1 + 120), *(void *)(v1 + 104));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      char v9 = 2;
      char v8 = 1;
    }
    uint64_t v2 = (uint64_t *)(v1 + 200);
    uint64_t v11 = *(void *)(v1 + 304);
    unint64_t v10 = *(void *)(v1 + 312);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v1 + 248);
    uint64_t v23 = *(void *)(v1 + 176);
    uint64_t v24 = *(void *)(v1 + 192);
    (*(void (**)(void))(v1 + 224))(*(void *)(v1 + 200));
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v28[0] = v13;
    *(unsigned char *)uint64_t v12 = v9;
    *(unsigned char *)(v12 + 1) = v8;
    *(_WORD *)(v12 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v1 + 56) = sub_262BDE7A8(v11, v10, v28);
    sub_262BE4CB0();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v14 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v3, v27, v14, "TotalRuntime", format, (uint8_t *)v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E5E950](v13, -1, -1);
    MEMORY[0x263E5E950](v12, -1, -1);

    v26(v24, v23);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v15 = *v2;
  uint64_t v16 = *(int *)(v1 + 44);
  uint64_t v17 = *(void *)(v1 + 168);
  (*(void (**)(uint64_t, void))(v1 + 248))(v15, *(void *)(v1 + 176));
  *(unsigned char *)(v1 + 43) = 4;
  uint64_t v18 = *(void **)(v17 + v16);
  *(void *)(v1 + 352) = v18;
  uint64_t v19 = *(void *)(v1 + 280);
  uint64_t v20 = *(void *)(v1 + 288);
  id v21 = v18;
  return MEMORY[0x270FA2498](sub_262BD9F90, v19, v20);
}

uint64_t sub_262BD9F90()
{
  uint64_t v1 = *(void **)(v0 + 352);
  sub_262BE4940();

  return MEMORY[0x270FA2498](sub_262BDA048, 0, 0);
}

uint64_t sub_262BDA048()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_release();
  sub_262BDFAF4(v1);
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

uint64_t sub_262BDA140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0);
  v5[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BDA1DC, 0, 0);
}

uint64_t sub_262BDA1DC()
{
  if (qword_26A994E80 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  int8x16_t v10 = *(int8x16_t *)(v0 + 3);
  sub_262BD6BF4(v0[3], v1);
  uint64_t v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 0, 1, v4);
  uint64_t v5 = (int8x16_t *)swift_task_alloc();
  v0[8] = v5;
  v5[1] = vextq_s8(v10, v10, 8uLL);
  v5[2].i64[0] = v3;
  v5[2].i64[1] = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_262BDA38C;
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[2];
  return MEMORY[0x270FA23C8](v8, v7, &unk_26A995328, v5, 0, 0, 0xD00000000000002ALL, 0x8000000262BE6250);
}

uint64_t sub_262BDA38C()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *v1;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_262BD73D8(v2, &qword_26A994FF0);
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_262BDA514, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_262BDA514()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BDA578(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(*a2 + 88);
  v5[13] = v7;
  uint64_t v8 = sub_262BE4CA0();
  v5[14] = v8;
  v5[15] = *(void *)(v8 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  uint64_t v9 = sub_262BE49F0();
  v5[19] = v9;
  v5[20] = *(void *)(v9 - 8);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  uint64_t v10 = *(void *)(v6 + 80);
  v5[26] = v10;
  uint64_t v11 = sub_262BE4CA0();
  v5[27] = v11;
  v5[28] = *(void *)(v11 - 8);
  v5[29] = swift_task_alloc();
  v5[30] = *(void *)(v10 - 8);
  v5[31] = swift_task_alloc();
  uint64_t v12 = sub_262BE49B0();
  v5[32] = v12;
  v5[33] = *(void *)(v12 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v5[41] = swift_task_alloc();
  v5[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BDA8D0, 0, 0);
}

uint64_t sub_262BDA8D0()
{
  sub_262BE4BB0();
  *(void *)(v0 + 344) = qword_26A9951B8;
  sub_262BE49A0();
  uint64_t v1 = sub_262BE49C0();
  uint64_t v2 = sub_262BE4C80();
  if (sub_262BE4C90())
  {
    uint64_t v3 = *(void *)(v0 + 328);
    uint64_t v4 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 264);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    unint64_t v7 = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v6(v3, *(void *)(v0 + 336), v4);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    os_signpost_id_t v9 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v1, (os_signpost_type_t)v2, v9, "LoadData", "", v8, 2u);
    MEMORY[0x263E5E950](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 264);

    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    unint64_t v7 = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  uint64_t v12 = *(void *)(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 256);
  uint64_t v14 = *(void *)(v0 + 264);
  uint64_t v16 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 80);
  *(void *)(v0 + 352) = v6;
  *(void *)(v0 + 360) = v7;
  v6(v12, v11, v13);
  *(void *)(v0 + 368) = sub_262BE4A20();
  swift_allocObject();
  *(void *)(v0 + 376) = sub_262BE4A10();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  *(void *)(v0 + 384) = v17;
  *(void *)(v0 + 392) = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v11, v13);
  *(void *)(v0 + 400) = *(void *)(v16 + qword_26A9951C0);
  *(unsigned char *)(v0 + 550) = 1;
  uint64_t v18 = *(int *)(type metadata accessor for PluginContext() + 36);
  *(_DWORD *)(v0 + 544) = v18;
  *(void *)(v0 + 408) = *(void *)(v15 + v18);
  sub_262BE4960();
  sub_262BDF670();
  uint64_t v20 = sub_262BE4B50();
  *(void *)(v0 + 416) = v20;
  *(void *)(v0 + 424) = v19;
  return MEMORY[0x270FA2498](sub_262BDAC2C, v20, v19);
}

uint64_t sub_262BDAC2C()
{
  *(void *)(v0 + 432) = sub_262BDF6C8();
  sub_262BE4940();
  return MEMORY[0x270FA2498](sub_262BDACBC, 0, 0);
}

uint64_t sub_262BDACBC()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 72) + 16);
  *(void *)(v0 + 440) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_262BDB184;
    uint64_t v3 = *(void *)(v0 + 232);
    return sub_262BD7708(v3);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 232);
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v7 = *(void *)(v0 + 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 240) + 56))(v5, 1, 1, *(void *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_262BE49C0();
    sub_262BE4A00();
    os_signpost_type_t v9 = sub_262BE4C70();
    if (sub_262BE4C90())
    {
      os_signpost_type_t v27 = v9;
      uint64_t v10 = *(void *)(v0 + 160);
      uint64_t v11 = *(void *)(v0 + 168);
      uint64_t v12 = *(void *)(v0 + 152);
      swift_retain();
      sub_262BE4A30();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v11, v12) == *MEMORY[0x263F90238])
      {
        char v13 = 0;
        uint64_t v14 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
        uint64_t v14 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\n"
              "errorMessage=%{public, signpost.telemetry:string2, name=errorMessage,public}s\n"
              "enableTelemetry=YES";
        char v13 = 2;
      }
      format = (char *)v14;
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v15 = (void *)(v0 + 328);
      uint64_t v24 = *(void *)(v0 + 256);
      uint64_t v25 = *(void *)(v0 + 320);
      uint64_t v16 = *(void *)(v0 + 88);
      unint64_t v17 = *(void *)(v0 + 96);
      (*(void (**)(void))(v0 + 352))(*(void *)(v0 + 328));
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v28[0] = v19;
      *(unsigned char *)uint64_t v18 = v13;
      *(unsigned char *)(v18 + 1) = v13;
      *(_WORD *)(v18 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_262BDE7A8(v16, v17, v28);
      sub_262BE4CB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2082;
      *(void *)(v0 + 56) = sub_262BDE7A8(0xD000000000000014, 0x8000000262BE62A0, v28);
      sub_262BE4CB0();
      os_signpost_id_t v20 = sub_262BE4990();
      _os_signpost_emit_with_name_impl(&dword_262BD2000, v8, v27, v20, "LoadData", format, (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x263E5E950](v19, -1, -1);
      MEMORY[0x263E5E950](v18, -1, -1);

      v26(v25, v24);
    }
    else
    {
      uint64_t v15 = (void *)(v0 + 320);
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(void, void))(v0 + 384))(*v15, *(void *)(v0 + 256));
    sub_262BE11A0();
    swift_allocError();
    *id v21 = 0;
    swift_willThrow();
    swift_release();
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
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
}

uint64_t sub_262BDB184()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_262BDCFA4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_262BDB2A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BDB2A0()
{
  uint64_t v41 = v0;
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_262BE49C0();
  sub_262BE4A00();
  os_signpost_type_t v6 = sub_262BE4C70();
  if (sub_262BE4C90())
  {
    uint64_t v7 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 160);
    swift_retain();
    sub_262BE4A30();
    swift_release();
    os_signpost_type_t v39 = v6;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x263F90238])
    {
      char v10 = 0;
      char v11 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 152));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      char v11 = 2;
      char v10 = 1;
    }
    long long v38 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v12 = (void *)(v0 + 328);
    uint64_t v36 = *(void *)(v0 + 256);
    uint64_t v37 = *(void *)(v0 + 312);
    uint64_t v14 = *(void *)(v0 + 88);
    unint64_t v13 = *(void *)(v0 + 96);
    (*(void (**)(void))(v0 + 352))(*(void *)(v0 + 328));
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v40 = v16;
    *(unsigned char *)uint64_t v15 = v11;
    *(unsigned char *)(v15 + 1) = v10;
    *(_WORD *)(v15 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = sub_262BDE7A8(v14, v13, &v40);
    sub_262BE4CB0();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v17 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v5, v39, v17, "LoadData", format, (uint8_t *)v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E5E950](v16, -1, -1);
    MEMORY[0x263E5E950](v15, -1, -1);

    v38(v37, v36);
  }
  else
  {
    uint64_t v12 = (void *)(v0 + 312);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v18 = *(void *)(v0 + 456);
  (*(void (**)(void, void))(v0 + 384))(*v12, *(void *)(v0 + 256));
  sub_262BE4BB0();
  if (v18)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 240) + 8))(*(void *)(v0 + 248), *(void *)(v0 + 208));
    swift_release();
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
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  else
  {
    sub_262BE49A0();
    id v21 = sub_262BE49C0();
    uint64_t v22 = sub_262BE4C80();
    if (sub_262BE4C90())
    {
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v24 = *(void *)(v0 + 328);
      uint64_t v25 = *(void *)(v0 + 256);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 352))(v24, *(void *)(v0 + 304), v25);
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      os_signpost_id_t v27 = sub_262BE4990();
      _os_signpost_emit_with_name_impl(&dword_262BD2000, v21, (os_signpost_type_t)v22, v27, "DoWork", "", v26, 2u);
      MEMORY[0x263E5E950](v26, -1, -1);

      v23(v24, v25);
    }
    else
    {
    }
    uint64_t v28 = *(int *)(v0 + 544);
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v30 = *(void *)(v0 + 304);
    uint64_t v31 = *(void *)(v0 + 256);
    uint64_t v32 = *(void *)(v0 + 80);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 352))(*(void *)(v0 + 328), v30, v31);
    swift_allocObject();
    *(void *)(v0 + 464) = sub_262BE4A10();
    v29(v30, v31);
    *(unsigned char *)(v0 + 549) = 2;
    *(void *)(v0 + 472) = *(void *)(v32 + v28);
    uint64_t v33 = *(void *)(v0 + 416);
    uint64_t v34 = *(void *)(v0 + 424);
    return MEMORY[0x270FA2498](sub_262BDB81C, v33, v34);
  }
}

uint64_t sub_262BDB81C()
{
  sub_262BE4940();
  return MEMORY[0x270FA2498](sub_262BDB898, 0, 0);
}

uint64_t sub_262BDB898()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 72) + 24);
  *(void *)(v0 + 480) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_262BDBD9C;
    uint64_t v3 = *(void *)(v0 + 248);
    uint64_t v4 = *(void *)(v0 + 128);
    return sub_262BD46A4(v4, v3);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 120);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 136) + 56))(v6, 1, 1, *(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_262BE49C0();
    sub_262BE4A00();
    os_signpost_type_t v10 = sub_262BE4C70();
    if (sub_262BE4C90())
    {
      os_signpost_type_t v32 = v10;
      uint64_t v11 = *(void *)(v0 + 176);
      uint64_t v13 = *(void *)(v0 + 152);
      uint64_t v12 = *(void *)(v0 + 160);
      swift_retain();
      sub_262BE4A30();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 88))(v11, v13) == *MEMORY[0x263F90238])
      {
        char v14 = 0;
        uint64_t v15 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 152));
        uint64_t v15 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\n"
              "errorMessage=%{public, signpost.telemetry:string2, name=errorMessage,public}s\n"
              "enableTelemetry=YES";
        char v14 = 2;
      }
      uint64_t v28 = v15;
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v29 = *(void *)(v0 + 256);
      uint64_t v30 = *(void *)(v0 + 296);
      uint64_t v17 = *(void *)(v0 + 88);
      unint64_t v18 = *(void *)(v0 + 96);
      (*(void (**)(void))(v0 + 352))(*(void *)(v0 + 328));
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v33[0] = v20;
      *(unsigned char *)uint64_t v19 = v14;
      *(unsigned char *)(v19 + 1) = v14;
      *(_WORD *)(v19 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 16) = sub_262BDE7A8(v17, v18, v33);
      sub_262BE4CB0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2082;
      *(void *)(v0 + 64) = sub_262BDE7A8(0xD000000000000015, 0x8000000262BE6280, v33);
      sub_262BE4CB0();
      os_signpost_id_t v21 = sub_262BE4990();
      uint64_t v16 = (uint64_t *)(v0 + 328);
      _os_signpost_emit_with_name_impl(&dword_262BD2000, v9, v32, v21, "LoadData", v28, (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x263E5E950](v20, -1, -1);
      MEMORY[0x263E5E950](v19, -1, -1);

      v31(v30, v29);
    }
    else
    {
      uint64_t v16 = (uint64_t *)(v0 + 296);
      swift_bridgeObjectRelease_n();
    }
    uint64_t v22 = *v16;
    uint64_t v23 = *(void *)(v0 + 248);
    uint64_t v24 = *(void *)(v0 + 240);
    uint64_t v25 = *(void *)(v0 + 208);
    (*(void (**)(uint64_t, void))(v0 + 384))(v22, *(void *)(v0 + 256));
    sub_262BE11A0();
    swift_allocError();
    *uint64_t v26 = 1;
    swift_willThrow();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
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
    os_signpost_id_t v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
}

uint64_t sub_262BDBD9C()
{
  *(void *)(*(void *)v1 + 496) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_262BDD110;
  }
  else {
    uint64_t v2 = sub_262BDBED0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BDBED0()
{
  uint64_t v47 = v0;
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 104);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v3, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_262BE49C0();
  sub_262BE4A00();
  os_signpost_type_t v6 = sub_262BE4C70();
  if (sub_262BE4C90())
  {
    uint64_t v7 = *(void *)(v0 + 192);
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v8 = *(void *)(v0 + 160);
    swift_retain();
    sub_262BE4A30();
    swift_release();
    os_signpost_type_t v45 = v6;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x263F90238])
    {
      char v10 = 0;
      char v11 = 0;
      format = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 192), *(void *)(v0 + 152));
      format = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      char v11 = 2;
      char v10 = 1;
    }
    v44 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v12 = (void *)(v0 + 328);
    uint64_t v42 = *(void *)(v0 + 256);
    uint64_t v43 = *(void *)(v0 + 288);
    uint64_t v14 = *(void *)(v0 + 88);
    unint64_t v13 = *(void *)(v0 + 96);
    (*(void (**)(void))(v0 + 352))(*(void *)(v0 + 328));
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v46 = v16;
    *(unsigned char *)uint64_t v15 = v11;
    *(unsigned char *)(v15 + 1) = v10;
    *(_WORD *)(v15 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 48) = sub_262BDE7A8(v14, v13, &v46);
    sub_262BE4CB0();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v17 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v5, v45, v17, "DoWork", format, (uint8_t *)v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E5E950](v16, -1, -1);
    MEMORY[0x263E5E950](v15, -1, -1);

    v44(v43, v42);
  }
  else
  {
    uint64_t v12 = (void *)(v0 + 288);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v18 = *(void *)(v0 + 496);
  (*(void (**)(void, void))(v0 + 384))(*v12, *(void *)(v0 + 256));
  sub_262BE4BB0();
  if (v18)
  {
    uint64_t v20 = *(void *)(v0 + 240);
    uint64_t v19 = *(void *)(v0 + 248);
    uint64_t v21 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 136);
    uint64_t v22 = *(void *)(v0 + 144);
    uint64_t v24 = *(void *)(v0 + 104);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
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
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  else
  {
    sub_262BE49A0();
    os_signpost_id_t v27 = sub_262BE49C0();
    uint64_t v28 = sub_262BE4C80();
    if (sub_262BE4C90())
    {
      uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v30 = *(void *)(v0 + 328);
      uint64_t v31 = *(void *)(v0 + 256);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 352))(v30, *(void *)(v0 + 280), v31);
      os_signpost_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_signpost_type_t v32 = 0;
      os_signpost_id_t v33 = sub_262BE4990();
      _os_signpost_emit_with_name_impl(&dword_262BD2000, v27, (os_signpost_type_t)v28, v33, "Report", "", v32, 2u);
      MEMORY[0x263E5E950](v32, -1, -1);

      v29(v30, v31);
    }
    else
    {
    }
    uint64_t v34 = *(int *)(v0 + 544);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v36 = *(void *)(v0 + 280);
    uint64_t v37 = *(void *)(v0 + 256);
    uint64_t v38 = *(void *)(v0 + 80);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 352))(*(void *)(v0 + 328), v36, v37);
    swift_allocObject();
    *(void *)(v0 + 504) = sub_262BE4A10();
    v35(v36, v37);
    *(unsigned char *)(v0 + 548) = 3;
    *(void *)(v0 + 512) = *(void *)(v38 + v34);
    uint64_t v39 = *(void *)(v0 + 416);
    uint64_t v40 = *(void *)(v0 + 424);
    return MEMORY[0x270FA2498](sub_262BDC478, v39, v40);
  }
}

uint64_t sub_262BDC478()
{
  sub_262BE4940();
  return MEMORY[0x270FA2498](sub_262BDC4F4, 0, 0);
}

uint64_t sub_262BDC4F4()
{
  uint64_t v43 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 72) + 32);
  *(void *)(v0 + 520) = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 528) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_262BDC9FC;
    uint64_t v3 = *(void *)(v0 + 144);
    return sub_262BD3BAC(v3);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_262BE49C0();
    sub_262BE4A00();
    os_signpost_type_t v6 = sub_262BE4C70();
    if (sub_262BE4C90())
    {
      os_signpost_type_t v38 = v6;
      uint64_t v40 = v5;
      uint64_t v7 = *(void *)(v0 + 184);
      uint64_t v9 = *(void *)(v0 + 152);
      uint64_t v8 = *(void *)(v0 + 160);
      swift_retain();
      sub_262BE4A30();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x263F90238])
      {
        char v10 = 0;
        char v11 = 0;
        uint64_t v12 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 152));
        uint64_t v12 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
        char v11 = 2;
        char v10 = 1;
      }
      format = (char *)v12;
      os_signpost_id_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v19 = *(void *)(v0 + 328);
      uint64_t v29 = *(void *)(v0 + 256);
      uint64_t v30 = *(void *)(v0 + 272);
      uint64_t v37 = *(void *)(v0 + 248);
      uint64_t v20 = *(void *)(v0 + 240);
      uint64_t v35 = *(void *)(v0 + 208);
      uint64_t v21 = *(void *)(v0 + 136);
      unint64_t v22 = *(void *)(v0 + 96);
      uint64_t v31 = *(void *)(v0 + 104);
      uint64_t v32 = *(void *)(v0 + 144);
      uint64_t v23 = *(void *)(v0 + 88);
      (*(void (**)(uint64_t))(v0 + 352))(v19);
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v42 = v25;
      *(unsigned char *)uint64_t v24 = v11;
      *(unsigned char *)(v24 + 1) = v10;
      *(_WORD *)(v24 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 40) = sub_262BDE7A8(v23, v22, &v42);
      sub_262BE4CB0();
      swift_bridgeObjectRelease_n();
      os_signpost_id_t v26 = sub_262BE4990();
      _os_signpost_emit_with_name_impl(&dword_262BD2000, v40, v38, v26, "Report", format, (uint8_t *)v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E5E950](v25, -1, -1);
      MEMORY[0x263E5E950](v24, -1, -1);

      swift_release();
      swift_release();
      v33(v30, v29);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v32, v31);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v37, v35);
      swift_release();
      v33(v19, v29);
    }
    else
    {
      uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
      uint64_t v13 = *(void *)(v0 + 272);
      uint64_t v14 = *(void *)(v0 + 256);
      uint64_t v15 = *(void *)(v0 + 240);
      uint64_t v39 = *(void *)(v0 + 208);
      uint64_t v41 = *(void *)(v0 + 248);
      uint64_t v16 = *(void *)(v0 + 136);
      uint64_t v34 = *(void *)(v0 + 144);
      os_signpost_id_t v17 = (void *)v5;
      uint64_t v18 = *(void *)(v0 + 104);

      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      v36(v13, v14);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v34, v18);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v41, v39);
      swift_release();
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
    os_signpost_id_t v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
}

uint64_t sub_262BDC9FC()
{
  *(void *)(*(void *)v1 + 536) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_262BDD29C;
  }
  else {
    uint64_t v2 = sub_262BDCB30;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BDCB30()
{
  uint64_t v40 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_262BE49C0();
  sub_262BE4A00();
  os_signpost_type_t v2 = sub_262BE4C70();
  if (sub_262BE4C90())
  {
    os_signpost_type_t v35 = v2;
    uint64_t v37 = v1;
    uint64_t v3 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 152);
    uint64_t v4 = *(void *)(v0 + 160);
    swift_retain();
    sub_262BE4A30();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5) == *MEMORY[0x263F90238])
    {
      char v6 = 0;
      char v7 = 0;
      uint64_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 152));
      uint64_t v8 = "correlationID=%{public, signpost.telemetry:string1, name=correlationID,public}s\nenableTelemetry=YES";
      char v7 = 2;
      char v6 = 1;
    }
    format = (char *)v8;
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v26 = *(void *)(v0 + 256);
    uint64_t v27 = *(void *)(v0 + 272);
    uint64_t v34 = *(void *)(v0 + 248);
    uint64_t v16 = *(void *)(v0 + 240);
    uint64_t v32 = *(void *)(v0 + 208);
    uint64_t v17 = *(void *)(v0 + 136);
    unint64_t v18 = *(void *)(v0 + 96);
    uint64_t v28 = *(void *)(v0 + 104);
    uint64_t v29 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 88);
    (*(void (**)(uint64_t))(v0 + 352))(v15);
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v39 = v21;
    *(unsigned char *)uint64_t v20 = v7;
    *(unsigned char *)(v20 + 1) = v6;
    *(_WORD *)(v20 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 40) = sub_262BDE7A8(v19, v18, &v39);
    sub_262BE4CB0();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v22 = sub_262BE4990();
    _os_signpost_emit_with_name_impl(&dword_262BD2000, v37, v35, v22, "Report", format, (uint8_t *)v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E5E950](v21, -1, -1);
    MEMORY[0x263E5E950](v20, -1, -1);

    swift_release();
    swift_release();
    v30(v27, v26);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v29, v28);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v34, v32);
    swift_release();
    v30(v15, v26);
  }
  else
  {
    os_signpost_id_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v10 = *(void *)(v0 + 256);
    uint64_t v11 = *(void *)(v0 + 240);
    uint64_t v36 = *(void *)(v0 + 208);
    uint64_t v38 = *(void *)(v0 + 248);
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v31 = *(void *)(v0 + 144);
    uint64_t v13 = (void *)v1;
    uint64_t v14 = *(void *)(v0 + 104);

    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    v33(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v31, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v38, v36);
    swift_release();
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
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_262BDCFA4()
{
  swift_release();
  swift_release();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BDD110()
{
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = v0[26];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_262BDD29C()
{
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = v0[26];
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = v0[13];
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  char v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_262BDD454@<X0>(void *a1@<X8>)
{
  LighthouseRuntime.trialId.getter();
  uint64_t v3 = v2;
  unint64_t v4 = LighthouseRuntime.parameters.getter();
  uint64_t v5 = LighthouseRuntime.attachments.getter();
  uint64_t v6 = LighthouseRuntime.trialNamespace.getter();
  uint64_t v8 = v7;
  id v9 = objc_allocWithZone((Class)sub_262BE4980());
  uint64_t v10 = sub_262BE4970();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v8;
  uint64_t v11 = type metadata accessor for PluginContext();
  uint64_t result = sub_262BE4920();
  *(void *)((char *)a1 + *(int *)(v11 + 36)) = v10;
  return result;
}

void LighthouseRuntime.trialId.getter()
{
  id v0 = LighthouseRuntime.trialClient.getter();

  if (!v0)
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F80E10]);
    uint64_t v7 = (void *)sub_262BE4AD0();
    uint64_t v8 = (void *)sub_262BE4AD0();
    objc_msgSend(v6, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v7, 0, v8);

    return;
  }
  id v1 = LighthouseRuntime.trialClient.getter();
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = v1;
  LighthouseRuntime.trialNamespace.getter();
  if (!v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v4 = (void *)sub_262BE4AD0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_backgroundMLTaskIdentifiersWithNamespaceName_, v4);

  if (!v5) {
LABEL_9:
  }
    __break(1u);
}

unint64_t LighthouseRuntime.parameters.getter()
{
  id v1 = *(void **)(v0 + qword_26A9960C0);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_parameters);
    id v3 = objc_msgSend(v2, sel_dictionaryRepresentation);

    uint64_t v4 = sub_262BE4AC0();
    unint64_t v5 = sub_262BDD8F8(v4);
    swift_bridgeObjectRelease();
    if (v5) {
      return v5;
    }
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  return sub_262BD65E8(v7);
}

uint64_t LighthouseRuntime.attachments.getter()
{
  id v1 = *(void **)(v0 + qword_26A9960C0);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  id v2 = objc_msgSend(v1, sel_attachments);
  id v3 = objc_msgSend(v2, sel_attachmentURLs);

  sub_262BE48F0();
  uint64_t v4 = sub_262BE4B30();

  return v4;
}

uint64_t LighthouseRuntime.trialNamespace.getter()
{
  uint64_t v1 = *(void *)(v0 + qword_26A9960C0);
  if (v1)
  {
    id v2 = objc_msgSend(self, sel_mlr_namespaceNameWithMLRTask_, v1);
    if (v2)
    {
      id v3 = v2;
      uint64_t v1 = sub_262BE4AE0();
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t LighthouseRuntime.deinit()
{
  swift_release();
  swift_release();
  swift_release();

  uint64_t v1 = v0 + qword_26A9951B8;
  uint64_t v2 = sub_262BE49E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return v0;
}

uint64_t LighthouseRuntime.__deallocating_deinit()
{
  LighthouseRuntime.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

unint64_t sub_262BDD8F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9950C0);
    uint64_t v2 = (void *)sub_262BE4D10();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_262BD73D0();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_262BE0DE4(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_262BE0E40(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_262BE0DE4((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_262BD73D8((uint64_t)v30, &qword_26A9952E0);
      swift_bridgeObjectRelease();
      sub_262BD73D0();
      swift_release();
      return 0;
    }
    sub_262BE0E40((uint64_t)v31 + 8, (uint64_t)v25);
    sub_262BD73D8((uint64_t)v30, &qword_26A9952E0);
    sub_262BD7370(v25, v26);
    long long v27 = v24;
    sub_262BD7370(v26, v28);
    long long v16 = v27;
    sub_262BD7370(v28, v29);
    sub_262BD7370(v29, &v27);
    unint64_t result = sub_262BDEE00(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v16;
      id v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_262BD7370(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_262BD7370(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id LighthouseRuntime.trialClient.getter()
{
  uint64_t v1 = *(void *)(v0 + qword_26A9960C0);
  if (v1) {
    return objc_msgSend(self, sel_mlr_clientWithMLRTask_, v1);
  }
  else {
    return 0;
  }
}

uint64_t sub_262BDDD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262BD730C(a1, (uint64_t)v10, &qword_26A995008);
  uint64_t v11 = sub_262BE4B80();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_262BD73D8((uint64_t)v10, &qword_26A995008);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_262BE4B50();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_262BE4B70();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  unint64_t v17 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    unint64_t v17 = v20;
    void v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_262BDDF04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  v5[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BDDF9C, 0, 0);
}

uint64_t sub_262BDDF9C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = sub_262BE4B80();
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v1, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v4;
  v7[5] = v3;
  swift_retain();
  sub_262BDDD24(v1, (uint64_t)&unk_26A9952F8, (uint64_t)v7);
  sub_262BD73D8(v1, &qword_26A995008);
  v6(v1, 1, 1, v5);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v2;
  sub_262BDDD24(v1, (uint64_t)&unk_26A995308, (uint64_t)v8);
  sub_262BD73D8(v1, &qword_26A995008);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[7] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995310);
  void *v9 = v0;
  v9[1] = sub_262BDE18C;
  return MEMORY[0x270FA2048](v0 + 9, 0, 0, v10);
}

uint64_t sub_262BDE18C()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_262BDE348;
  }
  else {
    uint64_t v2 = sub_262BDE2A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BDE2A0()
{
  if (*(unsigned char *)(v0 + 72))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BE0();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  return result;
}

uint64_t sub_262BDE348()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
  sub_262BE4BE0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BDE3E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *id v6 = v4;
  v6[1] = sub_262BD43BC;
  return v8(a1);
}

uint64_t sub_262BDE4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_262BDE4E0, 0, 0);
}

uint64_t sub_262BDE4E0(uint64_t a1)
{
  unint64_t v2 = *(void *)(v1 + 16);
  if (is_mul_ok(v2, 0xF4240uLL))
  {
    uint64_t v3 = 1000000 * v2;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v1 + 24) = v4;
    *uint64_t v4 = v1;
    v4[1] = sub_262BDE594;
    a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA1FF0](a1);
}

uint64_t sub_262BDE594()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_262BDE6C4, 0, 0);
  }
}

uint64_t sub_262BDE6C4()
{
  sub_262BE108C();
  swift_allocError();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BDE74C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_262BDE75C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_262BDE798(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_262BDE7A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_262BDE87C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_262BE0E40((uint64_t)v12, *a3);
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
      sub_262BE0E40((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_262BDE87C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_262BE4CC0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_262BDEA38(a5, a6);
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
  uint64_t v8 = sub_262BE4CF0();
  if (!v8)
  {
    sub_262BE4D00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_262BE4D20();
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

uint64_t sub_262BDEA38(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_262BDEAD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_262BDECB0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_262BDECB0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_262BDEAD0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_262BDEC48(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_262BE4CE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_262BE4D00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_262BE4B10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_262BE4D20();
    __break(1u);
LABEL_14:
    uint64_t result = sub_262BE4D00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_262BDEC48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9952E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_262BDECB0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9952E8);
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
  uint64_t result = sub_262BE4D20();
  __break(1u);
  return result;
}

unint64_t sub_262BDEE00(uint64_t a1, uint64_t a2)
{
  sub_262BE4DC0();
  sub_262BE4B00();
  uint64_t v4 = sub_262BE4DE0();
  return sub_262BDEE78(a1, a2, v4);
}

unint64_t sub_262BDEE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_262BE4D70() & 1) == 0)
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
      while (!v14 && (sub_262BE4D70() & 1) == 0);
    }
  }
  return v6;
}

void *sub_262BDEF5C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_262BE49E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  *(void *)((char *)v2 + qword_26A9960C0) = a1;
  id v9 = objc_allocWithZone(MEMORY[0x263F08A48]);
  id v10 = a1;
  v2[5] = objc_msgSend(v9, sel_init);
  id v11 = objc_allocWithZone(MEMORY[0x263F52768]);
  uint64_t v12 = (void *)sub_262BE4AD0();
  id v13 = objc_msgSend(v11, sel_initWithName_, v12);

  id v14 = objc_allocWithZone(MEMORY[0x263F52760]);
  id v15 = v13;
  uint64_t v16 = (void *)sub_262BE4AD0();
  id v17 = objc_msgSend(v14, sel_initWithName_subsystem_, v16, v15);

  objc_msgSend(v17, sel_setSignpostPersisted_, 1);
  sub_262BE49D0();

  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v2 + qword_26A9951B8, v8, v4);
  sub_262BE4960();
  *(void *)((char *)v2 + qword_26A9951C0) = sub_262BE4950();
  return v2;
}

void *sub_262BDF18C(void *a1)
{
  return sub_262BDEF5C(a1);
}

uint64_t sub_262BDF1E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for GenericDataProvider();
  *(void *)(v4 + 16) = sub_262BD7940(a1, a2, a3);
  swift_release();
  return v4;
}

uint64_t sub_262BDF274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for GenericWorker();
  *(void *)(v4 + 24) = sub_262BD49F8(a1, a2, a3);
  swift_release();
  return v4;
}

uint64_t sub_262BDF314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  type metadata accessor for GenericReporter();
  *(void *)(v4 + 32) = sub_262BD3EF8(a1, a2, a3);
  swift_release();
  return v4;
}

uint64_t type metadata accessor for PluginContext()
{
  uint64_t result = qword_26A995248;
  if (!qword_26A995248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_262BDF3F4()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = (id *)(v0 + v3);
  uint64_t v6 = type metadata accessor for PluginContext();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v0 + v3, 1, v6))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v5 + *(int *)(v6 + 32);
    uint64_t v8 = sub_262BE4930();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_262BDF558()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF0) - 8);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_262BD43BC;
  return sub_262BD8F50(v3, v4);
}

unint64_t sub_262BDF630()
{
  unint64_t result = qword_26A9951A8;
  if (!qword_26A9951A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A9951A8);
  }
  return result;
}

unint64_t sub_262BDF670()
{
  unint64_t result = qword_26A9951C8;
  if (!qword_26A9951C8)
  {
    sub_262BE4960();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9951C8);
  }
  return result;
}

unint64_t sub_262BDF6C8()
{
  unint64_t result = qword_26A9951D0;
  if (!qword_26A9951D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A9951D0);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_262BDF754()
{
  uint64_t v1 = (int *)(type metadata accessor for PluginContext() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[10];
  uint64_t v8 = sub_262BE4930();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5 + 16, v4);
}

uint64_t sub_262BDF89C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_262BDF900(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PluginContext() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v6);
  uint64_t v8 = v1 + v5;
  id v9 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_262BD43BC;
  return sub_262BDA140(a1, v8, v7, v10, v11);
}

uint64_t sub_262BDFA30(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  void *v9 = v3;
  v9[1] = sub_262BD43BC;
  return sub_262BDDF04(a1, a2, v6, v7, v8);
}

uint64_t sub_262BDFAF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PluginContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_262BDFB50()
{
  unint64_t result = qword_26A9951F8;
  if (!qword_26A9951F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9951F8);
  }
  return result;
}

uint64_t sub_262BDFBA4(uint64_t a1, unint64_t a2)
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

unint64_t sub_262BDFC00()
{
  unint64_t result = qword_26A995200;
  if (!qword_26A995200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995200);
  }
  return result;
}

unint64_t sub_262BDFC58()
{
  unint64_t result = qword_26A995208;
  if (!qword_26A995208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995208);
  }
  return result;
}

unint64_t sub_262BDFCB0()
{
  unint64_t result = qword_26A995210;
  if (!qword_26A995210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995210);
  }
  return result;
}

unint64_t sub_262BDFD08()
{
  unint64_t result = qword_26A995218;
  if (!qword_26A995218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995218);
  }
  return result;
}

unint64_t sub_262BDFD60()
{
  unint64_t result = qword_26A995220;
  if (!qword_26A995220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A995228);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995220);
  }
  return result;
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

unint64_t sub_262BDFE08()
{
  unint64_t result = qword_26A995230;
  if (!qword_26A995230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995230);
  }
  return result;
}

unint64_t sub_262BDFE60()
{
  unint64_t result = qword_26A995238;
  if (!qword_26A995238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995238);
  }
  return result;
}

unint64_t sub_262BDFEB4(uint64_t a1)
{
  unint64_t result = sub_262BDFEDC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_262BDFEDC()
{
  unint64_t result = qword_26A995240;
  if (!qword_26A995240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995240);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for PluginContext(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v8;
    id v9 = a2[4];
    *((void *)a1 + 3) = a2[3];
    *((void *)a1 + 4) = v9;
    uint64_t v10 = *(int *)(a3 + 32);
    uint64_t v18 = (uint64_t)a2 + v10;
    uint64_t v19 = &a1[v10];
    uint64_t v11 = sub_262BE4930();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    id v13 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v19, v18, v11);
    uint64_t v14 = *(int *)(a3 + 36);
    id v15 = *(char **)((char *)a2 + v14);
    *(void *)&v7[v14] = v15;
    id v16 = v15;
  }
  return v7;
}

void destroy for PluginContext(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_262BE4930();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(id *)((char *)a1 + *(int *)(a2 + 36));
}

void *initializeWithCopy for PluginContext(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  a1[4] = *(void *)(a2 + 32);
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v17 = a2 + v9;
  uint64_t v18 = (char *)a1 + v9;
  uint64_t v10 = sub_262BE4930();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v18, v17, v10);
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = *(void **)(a2 + v13);
  *(void *)((char *)a1 + v13) = v14;
  id v15 = v14;
  return a1;
}

uint64_t assignWithCopy for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_262BE4930();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 36);
  uint64_t v14 = *(void **)(a2 + v13);
  id v15 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = v14;
  id v16 = v14;

  return a1;
}

uint64_t initializeWithTake for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_262BE4930();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)(a1 + *(int *)(a3 + 36)) = *(void *)(a2 + *(int *)(a3 + 36));
  return a1;
}

uint64_t assignWithTake for PluginContext(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_262BE4930();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = *(void *)((char *)a2 + v12);

  return a1;
}

uint64_t getEnumTagSinglePayload for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_262BE047C);
}

uint64_t sub_262BE047C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_262BE4930();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PluginContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_262BE0540);
}

void *sub_262BE0540(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_262BE4930();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 32);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_262BE05E8()
{
  uint64_t result = sub_262BE4930();
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

uint64_t getEnumTagSinglePayload for LighthouseRuntimeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LighthouseRuntimeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x262BE0808);
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

uint64_t sub_262BE0830(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_262BE0838(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeError()
{
  return &type metadata for LighthouseRuntimeError;
}

uint64_t getEnumTagSinglePayload for LHRStates(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LHRStates(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x262BE09B0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LHRStates()
{
  return &type metadata for LHRStates;
}

uint64_t dispatch thunk of StaticStringConvertible.staticString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for LRSignpostName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LRSignpostName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x262BE0B58);
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

unsigned char *sub_262BE0B80(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LRSignpostName()
{
  return &type metadata for LRSignpostName;
}

uint64_t sub_262BE0B98()
{
  uint64_t result = sub_262BE49E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for LighthouseRuntime()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for LighthouseRuntime(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LighthouseRuntime);
}

uint64_t dispatch thunk of LighthouseRuntime.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of LighthouseRuntime.process(withContext:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of LighthouseRuntime.processAsync(withTimeoutInMilliseconds:withContext:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 256) + **(int **)(*(void *)v2 + 256));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unsigned int v6 = v3;
  v6[1] = sub_262BD3AB8;
  return v8(a1, a2);
}

uint64_t sub_262BE0DE4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_262BE0E40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_262BE0EA0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_262BE0EE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_262BD43BC;
  int v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A9952F0 + dword_26A9952F0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_262BE0FAC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_262BE0FE4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_262BD43BC;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_262BDE4E0, 0, 0);
}

unint64_t sub_262BE108C()
{
  unint64_t result = qword_26A995318;
  if (!qword_26A995318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A995318);
  }
  return result;
}

uint64_t sub_262BE10E0(uint64_t a1)
{
  uint64_t v4 = (uint64_t *)v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_262BD43BC;
  return sub_262BDA578(a1, v4, v5, v7, v6);
}

unint64_t sub_262BE11A0()
{
  unint64_t result = qword_26A995330;
  if (!qword_26A995330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995330);
  }
  return result;
}

uint64_t Dictionary<>.toObject<A>()@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_262BE4AB0();
  v15[0] = 0;
  id v6 = objc_msgSend(v4, sel_dataWithJSONObject_options_error_, v5, 0, v15);

  id v7 = v15[0];
  if (v6)
  {
    uint64_t v8 = sub_262BE4900();
    unint64_t v10 = v9;

    sub_262BE48D0();
    swift_allocObject();
    sub_262BE48C0();
    sub_262BE48B0();
    sub_262BDFBA4(v8, v10);
    swift_release();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = v7;
    uint64_t v12 = (void *)sub_262BE48E0();

    swift_willThrow();
    uint64_t v13 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, v13, 1, a1);
}

uint64_t LighthouseRuntimeParams.processTimeoutInMilliseconds.getter()
{
  return *(void *)v0;
}

unint64_t sub_262BE13D8()
{
  if (*v0) {
    return 0xD00000000000001BLL;
  }
  else {
    return 0xD00000000000001CLL;
  }
}

uint64_t sub_262BE1414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_262BE1B84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_262BE143C()
{
  return 0;
}

void sub_262BE1448(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_262BE1454(uint64_t a1)
{
  unint64_t v2 = sub_262BE187C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_262BE1490(uint64_t a1)
{
  unint64_t v2 = sub_262BE187C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LighthouseRuntimeParams.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995340);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  id v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(void *)(v1 + 16);
  int v11 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262BE187C();
  sub_262BE4E00();
  char v13 = 0;
  uint64_t v8 = v10[1];
  sub_262BE4D60();
  if (!v8)
  {
    char v12 = 1;
    sub_262BE4D60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t LighthouseRuntimeParams.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995350);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_262BE187C();
  sub_262BE4DF0();
  if (!v2)
  {
    char v20 = 0;
    uint64_t v10 = sub_262BE4D50();
    char v12 = v11;
    char v19 = 1;
    uint64_t v14 = sub_262BE4D50();
    id v15 = v9;
    char v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
    *(void *)a2 = v10;
    *(unsigned char *)(a2 + 8) = v12 & 1;
    *(void *)(a2 + 16) = v14;
    *(unsigned char *)(a2 + 24) = v17 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_262BE1808@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LighthouseRuntimeParams.init(from:)(a1, a2);
}

uint64_t sub_262BE1820(void *a1)
{
  return LighthouseRuntimeParams.encode(to:)(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_262BE187C()
{
  unint64_t result = qword_26A995348;
  if (!qword_26A995348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995348);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LighthouseRuntimeParams(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for LighthouseRuntimeParams(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LighthouseRuntimeParams(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeParams()
{
  return &type metadata for LighthouseRuntimeParams;
}

unsigned char *storeEnumTagSinglePayload for LighthouseRuntimeParams.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x262BE1A44);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LighthouseRuntimeParams.CodingKeys()
{
  return &type metadata for LighthouseRuntimeParams.CodingKeys;
}

unint64_t sub_262BE1A80()
{
  unint64_t result = qword_26A995358;
  if (!qword_26A995358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995358);
  }
  return result;
}

unint64_t sub_262BE1AD8()
{
  unint64_t result = qword_26A995360;
  if (!qword_26A995360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995360);
  }
  return result;
}

unint64_t sub_262BE1B30()
{
  unint64_t result = qword_26A995368;
  if (!qword_26A995368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A995368);
  }
  return result;
}

uint64_t sub_262BE1B84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001CLL && a2 == 0x8000000262BE62E0 || (sub_262BE4D70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000262BE6300)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_262BE4D70();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id AsyncOperation.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_262BE3090(a1, a2);
  swift_release();
  return v6;
}

uint64_t sub_262BE1CC8()
{
  uint64_t v0 = sub_262BE4A60();
  __swift_allocate_value_buffer(v0, qword_26A9960C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A9960C8);
  return sub_262BE4A50();
}

id AsyncOperation.init(_:)(uint64_t a1, uint64_t a2)
{
  id v2 = sub_262BE3090(a1, a2);
  swift_release();
  return v2;
}

id AsyncOperation.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task])
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BA0();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_262BE1F0C()
{
  return 1;
}

uint64_t sub_262BE1F2C()
{
  return sub_262BE2098();
}

void sub_262BE1FC8(int a1)
{
}

uint64_t sub_262BE2014(void *a1)
{
  id v1 = a1;
  sub_262BE4C50();

  return v3;
}

uint64_t sub_262BE2080()
{
  return sub_262BE2098();
}

uint64_t sub_262BE2098()
{
  sub_262BE4C50();
  return v1;
}

void sub_262BE2174(int a1)
{
}

void sub_262BE21A4(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = a4;
  id v5 = v4;
  HIDWORD(v14) = a1;
  uint64_t v6 = sub_262BE4A80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)sub_262BE4AD0();
  objc_msgSend(v4, sel_willChangeValueForKey_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9953B8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_262BE55A0;
  sub_262BE4A70();
  uint64_t v18 = v12;
  sub_262BE3748(&qword_26A9953C0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9953C8);
  sub_262BE3790(&qword_26A9953D0, &qword_26A9953C8);
  sub_262BE4CD0();
  char v16 = v5;
  char v17 = BYTE4(v14);
  sub_262BE4C40();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  char v13 = (void *)sub_262BE4AD0();
  objc_msgSend(v5, sel_didChangeValueForKey_, v13);
}

id sub_262BE23F0()
{
  if (objc_msgSend(v0, sel_isCancelled))
  {
    objc_msgSend(v0, sel_setExecuting_, 0);
    unsigned __int8 v1 = sel_setFinished_;
    objc_super v2 = v0;
    uint64_t v3 = 1;
  }
  else
  {
    objc_msgSend(v0, sel_setFinished_, 0);
    objc_msgSend(v0, sel_setExecuting_, 1);
    unsigned __int8 v1 = sel_main;
    objc_super v2 = v0;
  }
  return objc_msgSend(v2, v1, v3);
}

uint64_t sub_262BE2544()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  MEMORY[0x270FA5388](v1 - 8, v2);
  unsigned int v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_262BE4B80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v6;
  uint64_t v8 = sub_262BE2BD0((uint64_t)v4, (uint64_t)&unk_26A995388, (uint64_t)v7);
  sub_262BE3490((uint64_t)v4);
  *(void *)(v0 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task) = v8;
  return swift_release();
}

uint64_t sub_262BE2674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_262BE2694, 0, 0);
}

uint64_t sub_262BE2694()
{
  uint64_t v1 = v0[6] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x263E5E9F0](v1);
  v0[7] = v2;
  if (v2)
  {
    uint64_t v3 = *(int **)(v2 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action);
    v0[8] = *(void *)(v2 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action + 8);
    uint64_t v7 = (uint64_t (*)(void))((char *)v3 + *v3);
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_262BE27E0;
    return v7();
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_262BE27E0()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_262BE2988;
  }
  else {
    uint64_t v2 = sub_262BE28F4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BE28F4()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 56);
  objc_msgSend(v1, sel_setExecuting_, 0);
  objc_msgSend(v1, sel_setFinished_, 1);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_262BE2988()
{
  swift_release();
  if (qword_26A994E88 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = sub_262BE4A60();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A9960C8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_262BE4A40();
  os_log_type_t v6 = sub_262BE4C10();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[10];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v12;
    sub_262BE4CB0();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_262BD2000, v5, v6, "Error while running async operation. %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9953D8);
    swift_arrayDestroy();
    MEMORY[0x263E5E950](v10, -1, -1);
    MEMORY[0x263E5E950](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v0[10];
  uint64_t v14 = v0[7];

  uint64_t v15 = *(void **)(v14 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error);
  *(void *)(v14 + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error) = v13;

  char v16 = (void *)v0[7];
  objc_msgSend(v16, sel_setExecuting_, 0);
  objc_msgSend(v16, sel_setFinished_, 1);

  char v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_262BE2BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262BE363C(a1, (uint64_t)v8);
  uint64_t v9 = sub_262BE4B80();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_262BE3490((uint64_t)v8);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_262BE4B70();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v11 = sub_262BE4B50();
  uint64_t v13 = v12;
  swift_unknownObjectRelease();
  if (v13 | v11)
  {
    v15[0] = 0;
    v15[1] = 0;
    id v15[2] = v11;
    v15[3] = v13;
  }
  return swift_task_create();
}

id sub_262BE2ED8()
{
  if (*(void *)&v0[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task])
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BA0();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncOperation();
  return objc_msgSendSuper2(&v2, sel_cancel);
}

id AsyncOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AsyncOperation.init()()
{
}

id sub_262BE3090(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v18 = sub_262BE4C30();
  uint64_t v3 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_262BE4C20();
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v9 = sub_262BE4AA0();
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v17 = OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_lockQueue;
  v16[1] = sub_262BE3708();
  uint64_t v11 = v2;
  sub_262BE4A90();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_262BE3748(&qword_26A9953E8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9953F0);
  sub_262BE3790(&qword_26A9953F8, &qword_26A9953F0);
  sub_262BE4CD0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8F130], v18);
  *(void *)(v16[2] + v17) = sub_262BE4C60();
  *(void *)&v11[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_task] = 0;
  *(void *)&v11[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_error] = 0;
  v11[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting] = 0;
  v11[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished] = 0;
  uint64_t v12 = &v11[OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation_action];
  uint64_t v13 = v20;
  *uint64_t v12 = v19;
  v12[1] = v13;
  swift_retain();

  uint64_t v14 = (objc_class *)type metadata accessor for AsyncOperation();
  v21.receiver = v11;
  v21.super_class = v14;
  return objc_msgSendSuper2(&v21, sel_init);
}

uint64_t type metadata accessor for AsyncOperation()
{
  return self;
}

void sub_262BE3378(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting);
}

void sub_262BE3390(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished);
}

uint64_t sub_262BE33A8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_262BE33E4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_262BD43BC;
  v3[6] = v2;
  return MEMORY[0x270FA2498](sub_262BE2694, 0, 0);
}

uint64_t sub_262BE3490(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for AsyncOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncOperation);
}

uint64_t dispatch thunk of AsyncOperation.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_262BE3560()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_262BD3AB8;
  v3[6] = v2;
  return MEMORY[0x270FA2498](sub_262BE2694, 0, 0);
}

void sub_262BE360C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isFinished) = *(unsigned char *)(v0 + 24);
}

void sub_262BE3624()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC18lighthouse_runtime14AsyncOperation__isExecuting) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_262BE363C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

unint64_t sub_262BE3708()
{
  unint64_t result = qword_26A9953E0;
  if (!qword_26A9953E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A9953E0);
  }
  return result;
}

uint64_t sub_262BE3748(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_262BE3790(unint64_t *a1, uint64_t *a2)
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

void sub_262BE37E0(unsigned char *a1@<X8>)
{
}

void sub_262BE37F8(unsigned char *a1@<X8>)
{
}

uint64_t waitForTaskCompletion<A>(withTimeoutInMilliseconds:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_262BE3838, 0, 0);
}

uint64_t sub_262BE3838()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_262BE3934;
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x270FA22B8](v6);
}

uint64_t sub_262BE3934()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_262BE3A70, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_262BE3A70()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BE3AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262BE363C(a1, (uint64_t)v10);
  uint64_t v11 = sub_262BE4B80();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_262BE3490((uint64_t)v10);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_262BE4B50();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_262BE4B70();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    uint64_t v17 = v20;
    void v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t static TimedOutError.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_262BE3CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  sub_262BE4CA0();
  v6[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A995008);
  v6[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_262BE3D7C, 0, 0);
}

uint64_t sub_262BE3D7C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v13 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = sub_262BE4B80();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v1, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v2;
  v7[5] = v4;
  v7[6] = v3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A994FF8);
  uint64_t v8 = sub_262BE4BF0();
  sub_262BE3AD4(v1, (uint64_t)&unk_26A995420, (uint64_t)v7);
  sub_262BE3490(v1);
  v6(v1, 1, 1, v5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = v13;
  sub_262BE3AD4(v1, (uint64_t)&unk_26A995430, (uint64_t)v9);
  sub_262BE3490(v1);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[10] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_262BE3F84;
  uint64_t v11 = v0[8];
  return MEMORY[0x270FA2048](v11, 0, 0, v8);
}

uint64_t sub_262BE3F84()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_262BE41CC;
  }
  else {
    uint64_t v2 = sub_262BE4098;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_262BE4098()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[2], v2, v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
    sub_262BE4BE0();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  return result;
}

uint64_t sub_262BE41CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A994FF8);
  sub_262BE4BE0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BE4274(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_262BD3AB8;
  return sub_262BE3CB0(a1, a2, v7, v9, v8, v6);
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

uint64_t sub_262BE434C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_262BD3AB8;
  return v8(a1);
}

uint64_t sub_262BE4428()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_262BE4468(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_262BD43BC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A995418 + dword_26A995418);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_262BE4544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_262BE4564, 0, 0);
}

uint64_t sub_262BE4564(uint64_t a1)
{
  unint64_t v2 = *(void *)(v1 + 16);
  if (is_mul_ok(v2, 0xF4240uLL))
  {
    uint64_t v3 = 1000000 * v2;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v1 + 24) = v4;
    *uint64_t v4 = v1;
    v4[1] = sub_262BE4618;
    a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA1FF0](a1);
}

uint64_t sub_262BE4618()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_262BE4748, 0, 0);
  }
}

uint64_t sub_262BE4748()
{
  sub_262BE108C();
  swift_allocError();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_262BE47D0()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_262BE4808()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_262BD43BC;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_262BE4564, 0, 0);
}

uint64_t sub_262BE48B0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_262BE48C0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_262BE48D0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_262BE48E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_262BE48F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_262BE4900()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_262BE4910()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_262BE4920()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_262BE4930()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_262BE4940()
{
  return MEMORY[0x270F47260]();
}

uint64_t sub_262BE4950()
{
  return MEMORY[0x270F47268]();
}

uint64_t sub_262BE4960()
{
  return MEMORY[0x270F47270]();
}

uint64_t sub_262BE4970()
{
  return MEMORY[0x270F47298]();
}

uint64_t sub_262BE4980()
{
  return MEMORY[0x270F472B0]();
}

uint64_t sub_262BE4990()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_262BE49A0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_262BE49B0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_262BE49C0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_262BE49D0()
{
  return MEMORY[0x270FA2D68]();
}

uint64_t sub_262BE49E0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_262BE49F0()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_262BE4A00()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_262BE4A10()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_262BE4A20()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_262BE4A30()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_262BE4A40()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_262BE4A50()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_262BE4A60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_262BE4A70()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_262BE4A80()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_262BE4A90()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_262BE4AA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_262BE4AB0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_262BE4AC0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_262BE4AD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_262BE4AE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_262BE4AF0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_262BE4B00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_262BE4B10()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_262BE4B20()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_262BE4B30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_262BE4B40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_262BE4B50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_262BE4B60()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_262BE4B70()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_262BE4B80()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_262BE4BA0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_262BE4BB0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_262BE4BE0()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_262BE4BF0()
{
  return MEMORY[0x270FA2070]();
}

uint64_t sub_262BE4C00()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_262BE4C10()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_262BE4C20()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_262BE4C30()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_262BE4C40()
{
  return MEMORY[0x270FA0D78]();
}

uint64_t sub_262BE4C50()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_262BE4C60()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_262BE4C70()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_262BE4C80()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_262BE4C90()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_262BE4CA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_262BE4CB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_262BE4CC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_262BE4CD0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_262BE4CE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_262BE4CF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_262BE4D00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_262BE4D10()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_262BE4D20()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_262BE4D30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_262BE4D50()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_262BE4D60()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_262BE4D70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_262BE4D80()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_262BE4D90()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_262BE4DA0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_262BE4DB0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_262BE4DC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_262BE4DD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_262BE4DE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_262BE4DF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_262BE4E00()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_262BE4E30()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_262BE4E40()
{
  return MEMORY[0x270FA23B8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
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