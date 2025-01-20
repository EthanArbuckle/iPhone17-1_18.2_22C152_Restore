uint64_t sub_22F3C8888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_22F3D44D8();
  v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  v4 = sub_22F3D44E8();
  __swift_allocate_value_buffer(v4, qword_2686C1298);
  __swift_project_value_buffer(v4, (uint64_t)qword_2686C1298);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_22F3D44F8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_22F3C8AA8@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_22F3D44D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v8 = sub_22F3D44E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_22F3D44F8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  sub_22F3D4338();
  uint64_t v10 = sub_22F3D4328();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
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

unint64_t sub_22F3C8DF4()
{
  unint64_t result = qword_2686BFB28;
  if (!qword_2686BFB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFB28);
  }
  return result;
}

uint64_t sub_22F3C8E48()
{
  return sub_22F3D41A8();
}

uint64_t sub_22F3C8E6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3D41A8();
  *a1 = result;
  return result;
}

uint64_t sub_22F3C8E98()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BFC20);
  uint64_t v0 = sub_22F3D4348();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22F3D5060;
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v1 + 104))(v3 + v2, *MEMORY[0x263EFBA78], v0);
  qword_2686C12B8 = v3;
  return result;
}

uint64_t sub_22F3C8F74()
{
  return sub_22F3D4188();
}

uint64_t sub_22F3C8F98(uint64_t a1)
{
  uint64_t v2 = sub_22F3D4398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_22F3D4198();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void sub_22F3C9088(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22F3C9090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v5 = sub_22F3D4398();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  sub_22F3D45F8();
  v4[11] = sub_22F3D45E8();
  uint64_t v7 = sub_22F3D45C8();
  v4[12] = v7;
  v4[13] = v6;
  return MEMORY[0x270FA2498](sub_22F3C9188, v7, v6);
}

uint64_t sub_22F3C9188()
{
  sub_22F3D3FE8();
  unsigned int v1 = objc_msgSend(*(id *)(v0 + 16), sel_spotlightIsVisible);
  swift_unknownObjectRelease();
  if (v1)
  {
    sub_22F3D3FE8();
    uint64_t v2 = *(void *)(v0 + 24);
    *(void *)(v0 + 112) = v2;
    if (v2)
    {
      uint64_t v4 = *(void *)(v0 + 72);
      uint64_t v3 = *(void *)(v0 + 80);
      uint64_t v5 = *(void *)(v0 + 64);
      id v6 = objc_msgSend(objc_allocWithZone((Class)SUIUpdateSearchQueryCommand), sel_init);
      *(void *)(v0 + 120) = v6;
      objc_msgSend(v6, sel_setQueryKind_, 1);
      id v7 = v6;
      sub_22F3D4188();
      sub_22F3D4388();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
      uint64_t v8 = (void *)sub_22F3D4588();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_setSearchString_, v8);

      v16 = (uint64_t (*)(id, void, void))((int)*MEMORY[0x263F67BF8] + MEMORY[0x263F67BF8]);
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_22F3C9470;
      return v16(v7, 0, 0);
    }
    else
    {
      swift_release();
      sub_22F3D4048();
      sub_22F3CAB74(&qword_2686BFBD0, MEMORY[0x263EFB650]);
      swift_allocError();
      sub_22F3D4038();
      swift_willThrow();
      swift_task_dealloc();
      v15 = *(uint64_t (**)(void))(v0 + 8);
      return v15();
    }
  }
  else
  {
    v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v11;
    void *v11 = v0;
    v11[1] = sub_22F3C9638;
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v13 = *(void *)(v0 + 56);
    uint64_t v14 = *(void *)(v0 + 40);
    return sub_22F3C98D0(v14, v12, v13);
  }
}

uint64_t sub_22F3C9470()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_22F3C9858;
  }
  else {
    uint64_t v5 = sub_22F3C95AC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22F3C95AC()
{
  uint64_t v2 = (void *)v0[14];
  unsigned int v1 = (void *)v0[15];
  swift_release();
  sub_22F3D4138();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_22F3C9638()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_22F3C97EC;
  }
  else {
    uint64_t v5 = sub_22F3C9774;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22F3C9774()
{
  swift_release();
  sub_22F3D4138();
  swift_task_dealloc();
  unsigned int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3C97EC()
{
  swift_release();
  swift_task_dealloc();
  unsigned int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3C9858()
{
  unsigned int v1 = (void *)v0[14];
  uint64_t v2 = (void *)v0[15];
  swift_release();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_22F3C98D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  sub_22F3D45F8();
  v3[10] = sub_22F3D45E8();
  uint64_t v5 = sub_22F3D45C8();
  v3[11] = v5;
  v3[12] = v4;
  return MEMORY[0x270FA2498](sub_22F3C996C, v5, v4);
}

uint64_t sub_22F3C996C()
{
  sub_22F3D3FE8();
  v0[13] = v0[5];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[14] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22F3C9A20;
  return sub_22F3CD6EC(ObjectType);
}

uint64_t sub_22F3C9A20()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22F3C9B64, v3, v2);
}

uint64_t sub_22F3C9B64()
{
  sub_22F3D3FE8();
  unsigned int v1 = objc_msgSend(*(id *)(v0 + 48), sel_spotlightIsVisible);
  swift_unknownObjectRelease();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 72);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
    *(void *)(v0 + 32) = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v3;
    unint64_t v4 = sub_22F3C8DF4();
    void *v3 = v0;
    v3[1] = sub_22F3C9D04;
    return MEMORY[0x270EE0CF0](v0 + 136, 1, &type metadata for SearchSpotlightIntent, v4);
  }
  else
  {
    swift_release();
    sub_22F3D4048();
    sub_22F3CAB74(&qword_2686BFBD0, MEMORY[0x263EFB650]);
    swift_allocError();
    sub_22F3D4028();
    swift_willThrow();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_22F3C9D04()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 96);
  if (v0) {
    uint64_t v5 = sub_22F3C9E7C;
  }
  else {
    uint64_t v5 = sub_22F3C9E18;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22F3C9E18()
{
  swift_release();
  unsigned int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3C9E7C()
{
  swift_release();
  unsigned int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3C9EE4@<X0>(void *a1@<X8>)
{
  if (qword_2686C0028 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_2686C12B8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22F3C9F64()
{
  return sub_22F3D4188();
}

uint64_t sub_22F3C9F88(uint64_t a1)
{
  uint64_t v2 = sub_22F3D4398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_22F3D4198();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_22F3CA078(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_22F3D4178();
  return sub_22F3CA0D4;
}

void sub_22F3CA0D8(void *a1)
{
  unsigned int v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_22F3CA124@<X0>(uint64_t a1@<X8>)
{
  if (qword_2686C0020 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22F3D44E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2686C1298);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22F3CA1E4()
{
  return byte_2686C12B0;
}

uint64_t sub_22F3CA230()
{
  return sub_22F3D4418();
}

uint64_t sub_22F3CA3C8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22F3CA47C;
  return sub_22F3C9090(a1, v4, v5, v6);
}

uint64_t sub_22F3CA47C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unsigned int v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22F3CA570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3CA5D8();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_22F3CA59C(uint64_t a1)
{
  unint64_t v2 = sub_22F3C8DF4();

  return MEMORY[0x270EE0D28](a1, v2);
}

uint64_t sub_22F3CA5D8()
{
  uint64_t v0 = sub_22F3D4478();
  uint64_t v22 = *(void *)(v0 - 8);
  uint64_t v23 = v0;
  MEMORY[0x270FA5388]();
  v21 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB40);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22F3D44D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v10 = sub_22F3D44E8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB48);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F06D18], v6);
  sub_22F3D44F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
  uint64_t v12 = sub_22F3D4128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, *MEMORY[0x263EFBDC8], v23);
  uint64_t v13 = sub_22F3D41C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB50);
  sub_22F3D4558();
  uint64_t v24 = sub_22F3D4548();
  uint64_t v25 = v14;
  sub_22F3D4648();
  sub_22F3D4078();
  sub_22F3D4068();
  sub_22F3D3FF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFBB8);
  id v15 = objc_msgSend(self, sel_presentationHelperKey);
  uint64_t v16 = sub_22F3D4598();
  uint64_t v18 = v17;

  uint64_t v24 = v16;
  uint64_t v25 = v18;
  sub_22F3D4648();
  sub_22F3D4068();
  sub_22F3D4008();
  return v13;
}

unint64_t sub_22F3CAAD8()
{
  unint64_t result = qword_2686BFBD8;
  if (!qword_2686BFBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFBD8);
  }
  return result;
}

uint64_t sub_22F3CAB2C()
{
  return sub_22F3CAB74(&qword_2686BFBE0, MEMORY[0x263EFBCB8]);
}

uint64_t sub_22F3CAB74(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22F3CABC4()
{
  unint64_t result = qword_2686BFBE8;
  if (!qword_2686BFBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFBE8);
  }
  return result;
}

unint64_t sub_22F3CAC1C()
{
  unint64_t result = qword_2686BFBF0;
  if (!qword_2686BFBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFBF0);
  }
  return result;
}

uint64_t sub_22F3CAC70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22F3CAC8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SearchSpotlightIntent()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s17SpotlightUIShared21SearchSpotlightIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_22F3D41D8();
  sub_22F3D41D8();
  sub_22F3D41D8();
  return a1;
}

void *assignWithCopy for SearchSpotlightIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_22F3D41D8();
  swift_release();
  a1[1] = a2[1];
  sub_22F3D41D8();
  swift_release();
  a1[2] = a2[2];
  sub_22F3D41D8();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SearchSpotlightIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchSpotlightIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchSpotlightIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchSpotlightIntent()
{
  return &type metadata for SearchSpotlightIntent;
}

uint64_t sub_22F3CAEB4()
{
  return sub_22F3CAF74(&qword_2686BFC00, &qword_2686BFC08);
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

uint64_t sub_22F3CAF38()
{
  return sub_22F3CAF74((unint64_t *)&unk_2686BFC10, &qword_2686BFF90);
}

uint64_t sub_22F3CAF74(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22F3CB01C()
{
  return sub_22F3D45A8();
}

uint64_t sub_22F3CB05C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFCF0);
  id v0 = objc_msgSend(self, sel_queryHelperKey);
  sub_22F3D4598();

  sub_22F3D4648();
  sub_22F3D4078();
  sub_22F3D4068();
  uint64_t result = sub_22F3D4008();
  qword_2686C12C0 = result;
  return result;
}

uint64_t sub_22F3CB114()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_22F3D44D8();
  uint64_t v2 = *(void *)(v9[0] - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v5 = sub_22F3D44E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = sub_22F3D44B8();
  __swift_allocate_value_buffer(v7, qword_2686C12C8);
  __swift_project_value_buffer(v7, (uint64_t)qword_2686C12C8);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, *MEMORY[0x263F06D18], v9[0]);
  sub_22F3D44F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_22F3D44A8();
}

uint64_t sub_22F3CB3FC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x270FA2498](sub_22F3CB420, 0, 0);
}

uint64_t sub_22F3CB420()
{
  sub_22F3D3FE8();
  uint64_t v1 = (void *)v0[2];
  v0[5] = v1;
  uint64_t v2 = (*MEMORY[0x263F8EED0] & *v1) + 88;
  v0[6] = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58);
  v0[7] = v2 & 0xFFFFFFFFFFFFLL | 0x68A2000000000000;
  sub_22F3D45F8();
  v0[8] = sub_22F3D45E8();
  uint64_t v4 = sub_22F3D45C8();
  return MEMORY[0x270FA2498](sub_22F3CB4F4, v4, v3);
}

uint64_t sub_22F3CB4F4()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[6];
  uint64_t v3 = swift_release();
  uint64_t v4 = v2(v3);
  uint64_t v6 = v5;

  v0[9] = v4;
  v0[10] = v6;
  return MEMORY[0x270FA2498](sub_22F3CB57C, 0, 0);
}

uint64_t sub_22F3CB57C()
{
  uint64_t v1 = (uint64_t *)v0[3];
  *uint64_t v1 = sub_22F3CBEAC(v0[9], v0[10]);
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_22F3CB5E8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_22F3CC42C();
  *uint64_t v4 = v2;
  v4[1] = sub_22F3CB698;
  return MEMORY[0x270EE1670](a2, v5);
}

uint64_t sub_22F3CB698(uint64_t a1)
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

uint64_t sub_22F3CB7AC@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFCF0);
  id v2 = objc_msgSend(self, sel_queryHelperKey);
  sub_22F3D4598();

  sub_22F3D4648();
  sub_22F3D4078();
  sub_22F3D4068();
  uint64_t result = sub_22F3D4008();
  *a1 = result;
  return result;
}

uint64_t sub_22F3CB86C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_22F3CC42C();
  *uint64_t v5 = v2;
  v5[1] = sub_22F3CB920;
  return MEMORY[0x270EE1680](a1, a2, v6);
}

uint64_t sub_22F3CB920(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_22F3CBA20(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_22F3CC42C();
  *uint64_t v4 = v2;
  v4[1] = sub_22F3CC780;
  return MEMORY[0x270EE1678](a2, v5);
}

uint64_t sub_22F3CBAD0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_22F3CC1A4();
  *unint64_t v5 = v2;
  v5[1] = sub_22F3CA47C;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_22F3CBB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_22F3CA47C;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

uint64_t sub_22F3CBC40@<X0>(void *a1@<X8>)
{
  if (qword_2686C02C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = qword_2686C12C0;
  return sub_22F3D41D8();
}

uint64_t sub_22F3CBCC0@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1028);
  uint64_t result = sub_22F3D45A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22F3CBD08@<X0>(uint64_t a1@<X8>)
{
  if (qword_2686C02C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22F3D44B8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2686C12C8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22F3CBDC8(uint64_t a1)
{
  unint64_t v2 = sub_22F3CC2AC();

  return MEMORY[0x270EE0C68](a1, v2);
}

void sub_22F3CBE14()
{
  sub_22F3CC14C();

  JUMPOUT(0x230FB69B0);
}

uint64_t sub_22F3CBE60(uint64_t a1)
{
  unint64_t v2 = sub_22F3CC648();

  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t sub_22F3CBEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22F3D44D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  sub_22F3D44E8();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFCF8);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_22F3D44F8();
  uint64_t v10 = MEMORY[0x230FB69D0](v9);
  v12[1] = a1;
  v12[2] = a2;
  sub_22F3D41D8();
  sub_22F3D4158();
  swift_release();
  return v10;
}

unint64_t sub_22F3CC0F4()
{
  unint64_t result = qword_2686BFD00;
  if (!qword_2686BFD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD00);
  }
  return result;
}

unint64_t sub_22F3CC14C()
{
  unint64_t result = qword_2686BFD08;
  if (!qword_2686BFD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD08);
  }
  return result;
}

unint64_t sub_22F3CC1A4()
{
  unint64_t result = qword_2686BFD18;
  if (!qword_2686BFD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD18);
  }
  return result;
}

unint64_t sub_22F3CC1FC()
{
  unint64_t result = qword_2686BFD28;
  if (!qword_2686BFD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD28);
  }
  return result;
}

unint64_t sub_22F3CC254()
{
  unint64_t result = qword_2686BFD30[0];
  if (!qword_2686BFD30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2686BFD30);
  }
  return result;
}

unint64_t sub_22F3CC2AC()
{
  unint64_t result = qword_26AFA1050;
  if (!qword_26AFA1050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1050);
  }
  return result;
}

unint64_t sub_22F3CC304()
{
  unint64_t result = qword_2686BFD48;
  if (!qword_2686BFD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD48);
  }
  return result;
}

unint64_t sub_22F3CC35C()
{
  unint64_t result = qword_26AFA1058;
  if (!qword_26AFA1058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1058);
  }
  return result;
}

unint64_t sub_22F3CC3B4()
{
  unint64_t result = qword_2686BFD50;
  if (!qword_2686BFD50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2686BFD58);
    sub_22F3CC35C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD50);
  }
  return result;
}

unint64_t sub_22F3CC42C()
{
  unint64_t result = qword_2686BFD70;
  if (!qword_2686BFD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD70);
  }
  return result;
}

unint64_t sub_22F3CC484()
{
  unint64_t result = qword_26AFA1048;
  if (!qword_26AFA1048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1048);
  }
  return result;
}

unint64_t sub_22F3CC4DC()
{
  unint64_t result = qword_26AFA1060;
  if (!qword_26AFA1060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1060);
  }
  return result;
}

unint64_t sub_22F3CC534()
{
  unint64_t result = qword_26AFA1088;
  if (!qword_26AFA1088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1088);
  }
  return result;
}

uint64_t sub_22F3CC588()
{
  return MEMORY[0x263EFC020];
}

unint64_t sub_22F3CC598()
{
  unint64_t result = qword_26AFA1068;
  if (!qword_26AFA1068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1068);
  }
  return result;
}

unint64_t sub_22F3CC5F0()
{
  unint64_t result = qword_26AFA1070;
  if (!qword_26AFA1070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1070);
  }
  return result;
}

unint64_t sub_22F3CC648()
{
  unint64_t result = qword_26AFA1078;
  if (!qword_26AFA1078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1078);
  }
  return result;
}

uint64_t sub_22F3CC69C()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_22F3CC6AC()
{
  unint64_t result = qword_2686BFD78;
  if (!qword_2686BFD78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2686BFD80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD78);
  }
  return result;
}

unint64_t sub_22F3CC70C()
{
  unint64_t result = qword_26AFA1080;
  if (!qword_26AFA1080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1080);
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchFieldEntity()
{
  return &type metadata for SearchFieldEntity;
}

ValueMetadata *type metadata accessor for SearchFieldEntity.SearchFieldEntityQuery()
{
  return &type metadata for SearchFieldEntity.SearchFieldEntityQuery;
}

uint64_t sub_22F3CC784()
{
  uint64_t v0 = sub_22F3D44D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_22F3D44E8();
  __swift_allocate_value_buffer(v4, qword_2686C12E0);
  __swift_project_value_buffer(v4, (uint64_t)qword_2686C12E0);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_22F3D44F8();
}

uint64_t sub_22F3CC974@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_22F3D44D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v8 = sub_22F3D44E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_22F3D44F8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  sub_22F3D4338();
  uint64_t v10 = sub_22F3D4328();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
}

unint64_t sub_22F3CCC7C()
{
  unint64_t result = qword_2686BFD90;
  if (!qword_2686BFD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFD90);
  }
  return result;
}

uint64_t sub_22F3CCCD0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_22F3CCCF0, 0, 0);
}

uint64_t sub_22F3CCCF0()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)SUIUpdateSearchQueryCommand), sel_init);
  v0[5] = v1;
  objc_msgSend(v1, sel_setQueryKind_, 1);
  objc_msgSend(v1, sel_setSearchString_, 0);
  sub_22F3D3FE8();
  v0[6] = v0[2];
  uint64_t v4 = (uint64_t (*)(id, void, void))((int)*MEMORY[0x263F67BF8] + MEMORY[0x263F67BF8]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22F3CCE00;
  return v4(v1, 0, 0);
}

uint64_t sub_22F3CCE00()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_22F3CCF88;
  }
  else
  {

    uint64_t v3 = sub_22F3CCF1C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_22F3CCF1C()
{
  id v1 = *(void **)(v0 + 40);
  sub_22F3D4138();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_22F3CCF88()
{
  id v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_22F3CCFF0()
{
  return sub_22F3D4018();
}

unint64_t sub_22F3CD038()
{
  unint64_t result = qword_2686BFDA8;
  if (!qword_2686BFDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFDA8);
  }
  return result;
}

unint64_t sub_22F3CD090()
{
  unint64_t result = qword_2686BFDB0;
  if (!qword_2686BFDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFDB0);
  }
  return result;
}

uint64_t sub_22F3CD0E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22F3CD100()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22F3CD11C@<X0>(uint64_t a1@<X8>)
{
  if (qword_2686C0650 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22F3D44E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2686C12E0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22F3CD1E0()
{
  return sub_22F3D4418();
}

uint64_t sub_22F3CD2B4(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22F3CA47C;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_22F3CCCF0, 0, 0);
}

uint64_t sub_22F3CD364@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFD98);
  sub_22F3D4078();
  sub_22F3D4068();
  uint64_t result = sub_22F3D4018();
  *a1 = result;
  return result;
}

uint64_t sub_22F3CD3B8(uint64_t a1)
{
  unint64_t v2 = sub_22F3CCC7C();

  return MEMORY[0x270EE0D28](a1, v2);
}

ValueMetadata *type metadata accessor for ClearSpotlightIntent()
{
  return &type metadata for ClearSpotlightIntent;
}

uint64_t sub_22F3CD404()
{
  return sub_22F3CAF74(&qword_2686BFDC0, &qword_2686BFDC8);
}

uint64_t sub_22F3CD440()
{
  return sub_22F3CAF74((unint64_t *)&unk_2686BFC10, &qword_2686BFF90);
}

uint64_t sub_22F3CD47C()
{
  return 1;
}

uint64_t sub_22F3CD484()
{
  return sub_22F3D46F8();
}

uint64_t sub_22F3CD4C8()
{
  return sub_22F3D46E8();
}

uint64_t sub_22F3CD4F0()
{
  return sub_22F3D46F8();
}

uint64_t sub_22F3CD540()
{
  uint64_t v0 = sub_22F3D44D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_22F3D44F8();
}

uint64_t sub_22F3CD6EC(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_22F3D45F8();
  v2[5] = sub_22F3D45E8();
  uint64_t v4 = sub_22F3D45C8();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_22F3CD788, v4, v3);
}

uint64_t sub_22F3CD788()
{
  long long v4 = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 64) = sub_22F3D45E8();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *(_OWORD *)(v1 + 16) = v4;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22F3CD898;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_22F3CD898()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_22F3CD9F8, v3, v2);
}

uint64_t sub_22F3CD9F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_22F3CDA58(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFDE0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_22F3CDE3C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22F3CDEA4;
  aBlock[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_presentSpotlightWithCompletionHandler_, v9);
  _Block_release(v9);
}

void sub_22F3CDC00(uint64_t a1)
{
  sub_22F3CDA58(a1, *(void **)(v1 + 24));
}

unint64_t sub_22F3CDC0C()
{
  unint64_t result = qword_2686BFDD8;
  if (!qword_2686BFDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFDD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStringResourceTable()
{
  return &type metadata for LocalizedStringResourceTable;
}

uint64_t getEnumTagSinglePayload for SUIAppIntentError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SUIAppIntentError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22F3CDD64);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22F3CDD8C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SUIAppIntentError()
{
  return &type metadata for SUIAppIntentError;
}

uint64_t sub_22F3CDDA8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFDE0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22F3CDE3C()
{
  return sub_22F3D45D8();
}

uint64_t sub_22F3CDEA4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_22F3D41D8();
  v1(v2);

  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return sub_22F3D41D8();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for SpotlightUISharedPackage()
{
  return &type metadata for SpotlightUISharedPackage;
}

uint64_t sub_22F3CDF14()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22F3CDF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

id AppIntentsQueryHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id AppIntentsQueryHelper.init()()
{
  id v1 = &v0[OBJC_IVAR___SUIAppIntentsQueryHelper_searchString];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0xE000000000000000;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for AppIntentsQueryHelper()
{
  return self;
}

uint64_t sub_22F3CE0C0(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  sub_22F3D45F8();
  v3[8] = sub_22F3D45E8();
  uint64_t v5 = sub_22F3D45C8();
  return MEMORY[0x270FA2498](sub_22F3CE15C, v5, v4);
}

uint64_t sub_22F3CE15C()
{
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  swift_release();
  uint64_t v4 = (void *)(v1 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_22F3CE380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v3[8] = sub_22F3D45F8();
  v3[9] = sub_22F3D45E8();
  uint64_t v5 = sub_22F3D45C8();
  return MEMORY[0x270FA2498](sub_22F3CE420, v5, v4);
}

uint64_t sub_22F3CE420()
{
  uint64_t v1 = (const void *)v0[6];
  uint64_t v2 = (void *)v0[7];
  swift_release();
  v0[10] = _Block_copy(v1);
  v0[11] = sub_22F3D4598();
  v0[12] = v3;
  id v4 = v2;
  v0[13] = sub_22F3D45E8();
  uint64_t v6 = sub_22F3D45C8();
  return MEMORY[0x270FA2498](sub_22F3CE4DC, v6, v5);
}

uint64_t sub_22F3CE4DC()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = (void (**)(void))v0[10];
  uint64_t v3 = v0[11];
  id v4 = (char *)v0[7];
  swift_release();
  uint64_t v5 = &v4[OBJC_IVAR___SUIAppIntentsQueryHelper_searchString];
  swift_beginAccess();
  *(void *)uint64_t v5 = v3;
  *((void *)v5 + 1) = v1;
  swift_bridgeObjectRelease();

  v2[2](v2);
  _Block_release(v2);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

id AppIntentsQueryHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AppIntentsQueryHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppIntentsQueryHelper);
}

uint64_t dispatch thunk of AppIntentsQueryHelper.update(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x70);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_22F3CA47C;
  return v9(a1, a2);
}

uint64_t sub_22F3CE71C()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22F3CE764()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_22F3CF04C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2686BFE00 + dword_2686BFE00);
  return v6(v2, v3, v4);
}

uint64_t sub_22F3CE818(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_22F3CF04C;
  return v6();
}

uint64_t sub_22F3CE8E8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_22F3CF04C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2686BFE10 + dword_2686BFE10);
  return v6(v2, v3, v4);
}

uint64_t sub_22F3CE9A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_22F3CF04C;
  return v7();
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22F3CEAB8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22F3CF04C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2686BFE20 + dword_2686BFE20);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_22F3CEB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22F3D4618();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22F3D4608();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22F3CED28(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22F3D45C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22F3CED28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F3CED88(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22F3CEE64;
  return v6(a1);
}

uint64_t sub_22F3CEE64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22F3CEF5C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F3CEF94(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22F3CA47C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686BFE30 + dword_2686BFE30);
  return v6(a1, v4);
}

uint64_t sub_22F3CF050()
{
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE98);
  uint64_t v0 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22F3D41E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFEA0);
  MEMORY[0x270FA5388]();
  sub_22F3D03BC();
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  unsigned int v23 = *MEMORY[0x263EFB9F0];
  uint64_t v22 = *(void (**)(char *))(v4 + 104);
  uint64_t v19 = v3;
  v22(v6);
  sub_22F3D4298();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v20 = v4 + 8;
  v21 = v7;
  v7(v6, v3);
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v24 = sub_22F3D4208();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v8 = v25;
  v17(v2, v25);
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v18 = sub_22F3D4208();
  uint64_t v9 = v17;
  v17(v2, v8);
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  uint64_t v10 = v19;
  ((void (*)(char *, void, uint64_t))v22)(v6, v23, v19);
  sub_22F3D4298();
  v21(v6, v10);
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v11 = sub_22F3D4208();
  v9(v2, v25);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686BFEA8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22F3D58B0;
  uint64_t v13 = v18;
  *(void *)(v12 + 32) = v24;
  *(void *)(v12 + 40) = v13;
  *(void *)(v12 + 48) = v11;
  uint64_t v14 = sub_22F3D41F8();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_22F3CF4F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22F3D1BD0();
  *a1 = result;
  return result;
}

uint64_t sub_22F3CF524()
{
  return sub_22F3D1C04();
}

uint64_t sub_22F3CF534(uint64_t a1)
{
  uint64_t v29 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE80);
  uint64_t v30 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22F3D41E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE88);
  MEMORY[0x270FA5388]();
  sub_22F3C8DF4();
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  unint64_t v28 = sub_22F3D0410();
  sub_22F3D41D8();
  swift_release();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  LODWORD(v25) = *MEMORY[0x263EFB9F0];
  uint64_t v24 = *(void (**)(char *))(v4 + 104);
  uint64_t v20 = v3;
  v24(v6);
  sub_22F3D4298();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v22 = v4 + 8;
  unsigned int v23 = v7;
  v7(v6, v3);
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v27 = sub_22F3D4208();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v30 + 8);
  v30 += 8;
  v21 = v8;
  uint64_t v9 = v26;
  v8(v2, v26);
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  sub_22F3D41D8();
  swift_release();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  uint64_t v10 = v20;
  ((void (*)(char *, void, uint64_t))v24)(v6, v25, v20);
  sub_22F3D4298();
  v23(v6, v10);
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v25 = sub_22F3D4208();
  uint64_t v11 = v9;
  uint64_t v12 = v9;
  uint64_t v13 = v21;
  v21(v2, v12);
  sub_22F3D42C8();
  sub_22F3D42B8();
  swift_getKeyPath();
  sub_22F3D41D8();
  swift_release();
  sub_22F3D42A8();
  swift_release();
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v14 = sub_22F3D4208();
  v13(v2, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE90);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_22F3D58B0;
  uint64_t v16 = v25;
  *(void *)(v15 + 32) = v27;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_22F3D41F8();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_22F3CFA8C()
{
  return sub_22F3C8F74();
}

uint64_t sub_22F3CFA9C(uint64_t a1)
{
  sub_22F3D4398();
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return sub_22F3C8F98((uint64_t)v3);
}

uint64_t sub_22F3CFB6C()
{
  uint64_t v0 = sub_22F3D4278();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_22F3D0410();
  sub_22F3D41D8();
  swift_release();
  sub_22F3C8DF4();
  sub_22F3D4268();
  uint64_t v4 = sub_22F3D4258();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE70);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_22F3D5060;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_22F3D4248();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_22F3CFCD4()
{
  uint64_t v0 = sub_22F3D4228();
  uint64_t v1 = sub_22F3D4228();
  uint64_t v2 = sub_22F3D4228();
  uint64_t v3 = sub_22F3D4228();
  uint64_t v4 = sub_22F3D4228();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE78);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_22F3D58C0;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_22F3D4218();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_22F3CFDE8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE50);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22F3D41E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE58);
  MEMORY[0x270FA5388]();
  sub_22F3CCC7C();
  sub_22F3D42C8();
  sub_22F3D42B8();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263EFB9F0], v4);
  sub_22F3D4298();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_22F3D42B8();
  sub_22F3D42D8();
  uint64_t v8 = sub_22F3D4208();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  sub_22F3D4288();
  uint64_t v10 = sub_22F3D4208();
  v9(v3, v0);
  sub_22F3D4288();
  uint64_t v11 = sub_22F3D4208();
  v9(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE60);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22F3D58B0;
  *(void *)(v12 + 32) = v8;
  *(void *)(v12 + 40) = v10;
  *(void *)(v12 + 48) = v11;
  uint64_t v13 = sub_22F3D41F8();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_22F3D0144()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_22F3D0150()
{
  uint64_t v0 = sub_22F3D4308();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22F3D1FFC(v2);
  uint64_t v17 = v5;
  sub_22F3D03BC();
  sub_22F3D4318();
  uint64_t v6 = sub_22F3D42F8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  uint64_t v16 = sub_22F3C9EE0();
  uint64_t v17 = v8;
  uint64_t v18 = v9;
  sub_22F3C8DF4();
  sub_22F3D4318();
  uint64_t v10 = sub_22F3D42F8();
  v7(v4, v0);
  uint64_t v16 = sub_22F3CCFF0();
  sub_22F3CCC7C();
  sub_22F3D4318();
  uint64_t v11 = sub_22F3D42F8();
  v7(v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFE48);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22F3D58B0;
  *(void *)(v12 + 32) = v6;
  *(void *)(v12 + 40) = v10;
  *(void *)(v12 + 48) = v11;
  uint64_t v13 = sub_22F3D42E8();
  swift_bridgeObjectRelease();
  return v13;
}

ValueMetadata *type metadata accessor for SpotlightUIAssistantIntents()
{
  return &type metadata for SpotlightUIAssistantIntents;
}

unint64_t sub_22F3D03BC()
{
  unint64_t result = qword_2686BFE40;
  if (!qword_2686BFE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFE40);
  }
  return result;
}

unint64_t sub_22F3D0410()
{
  unint64_t result = qword_2686BFE68;
  if (!qword_2686BFE68)
  {
    sub_22F3D4398();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFE68);
  }
  return result;
}

uint64_t sub_22F3D046C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_22F3D44D8();
  uint64_t v2 = *(void *)(v9[0] - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v5 = sub_22F3D44E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = sub_22F3D44B8();
  __swift_allocate_value_buffer(v7, qword_2686C12F8);
  __swift_project_value_buffer(v7, (uint64_t)qword_2686C12F8);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, *MEMORY[0x263F06D18], v9[0]);
  sub_22F3D44F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_22F3D44A8();
}

unint64_t sub_22F3D0754()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFF98);
  MEMORY[0x270FA5388]();
  v61 = (char *)&v42 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_22F3D44D8();
  uint64_t v3 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_22F3D44E8();
  uint64_t v8 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388]();
  v65 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFA0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFA8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v64 = v10 - 8;
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v50 = v12;
  uint64_t v53 = 2 * v12;
  uint64_t v14 = swift_allocObject();
  uint64_t v54 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_22F3D58B0;
  unint64_t v63 = v14 + v13;
  *(unsigned char *)(v14 + v13) = 0;
  v42 = v7;
  sub_22F3D4568();
  sub_22F3D4508();
  unsigned int v55 = *MEMORY[0x263F06D18];
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v60 = v3 + 104;
  v67 = v15;
  v43 = v5;
  ((void (*)(char *))v15)(v5);
  sub_22F3D44F8();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t v57 = v8 + 56;
  v62 = v16;
  uint64_t v17 = v2;
  uint64_t v18 = v59;
  v16(v2, 1, 1, v59);
  uint64_t v58 = sub_22F3D43A8();
  uint64_t v19 = *(void *)(v58 - 8);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v21 = v19 + 56;
  uint64_t v22 = v61;
  v20(v61, 1, 1, v58);
  uint64_t v51 = v21;
  v52 = v20;
  unsigned int v23 = v17;
  v56 = v17;
  sub_22F3D43C8();
  uint64_t v24 = (unsigned char *)(v63 + v50);
  v50 += v63 + *(int *)(v64 + 56);
  *uint64_t v24 = 1;
  sub_22F3D4568();
  sub_22F3D4508();
  uint64_t v25 = v43;
  uint64_t v26 = v55;
  v67(v43, v55, v66);
  sub_22F3D44F8();
  uint64_t v27 = v23;
  uint64_t v28 = v57;
  v62(v27, 1, 1, v18);
  v20(v22, 1, 1, v58);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFB0);
  uint64_t v29 = *(void *)(v28 + 16);
  uint64_t v30 = *(unsigned __int8 *)(v28 + 24);
  uint64_t v47 = ((v30 + 32) & ~v30) + 2 * v29;
  uint64_t v45 = (v30 + 32) & ~v30;
  uint64_t v49 = v29;
  uint64_t v46 = v30 | 7;
  uint64_t v31 = swift_allocObject();
  long long v44 = xmmword_22F3D5990;
  *(_OWORD *)(v31 + 16) = xmmword_22F3D5990;
  sub_22F3D4568();
  sub_22F3D4508();
  uint64_t v32 = v66;
  v33 = v67;
  v67(v25, v26, v66);
  sub_22F3D44F8();
  sub_22F3D4568();
  sub_22F3D4508();
  uint64_t v34 = v26;
  v33(v25, v26, v32);
  sub_22F3D44F8();
  v35 = v56;
  v36 = v61;
  sub_22F3D43B8();
  uint64_t v64 = v63 + v53 + *(int *)(v64 + 56);
  *(unsigned char *)(v63 + v53) = 2;
  sub_22F3D4568();
  sub_22F3D4508();
  uint64_t v37 = v34;
  uint64_t v38 = v66;
  v33(v25, v37, v66);
  sub_22F3D44F8();
  v62(v35, 1, 1, v59);
  v52(v36, 1, 1, v58);
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_22F3D4568();
  sub_22F3D4508();
  uint64_t v39 = v55;
  v40 = v67;
  v67(v25, v55, v38);
  sub_22F3D44F8();
  sub_22F3D4568();
  sub_22F3D4508();
  v40(v25, v39, v38);
  sub_22F3D44F8();
  sub_22F3D43B8();
  unint64_t result = sub_22F3D1060(v54);
  qword_2686C1310 = result;
  return result;
}

unint64_t sub_22F3D1060(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFA8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFB8);
  uint64_t v6 = sub_22F3D4658();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  sub_22F3D41D8();
  while (1)
  {
    sub_22F3D3484(v12, (uint64_t)v5);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_22F3D2394(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_22F3D43D8();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_22F3D1250(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22F3D125C(*a1, *a2);
}

uint64_t sub_22F3D125C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 1852141679;
    }
    else {
      uint64_t v3 = 0x65736F6C63;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 1852141679;
      }
      else {
        uint64_t v6 = 0x65736F6C63;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x656C67676F74;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x656C67676F74)
  {
LABEL_21:
    char v8 = sub_22F3D4688();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22F3D1358()
{
  return sub_22F3D46F8();
}

uint64_t sub_22F3D13EC()
{
  sub_22F3D45B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22F3D146C()
{
  return sub_22F3D46F8();
}

uint64_t sub_22F3D14FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22F3D25D0();
  *a1 = result;
  return result;
}

void sub_22F3D152C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = 1852141679;
  if (v2 != 1)
  {
    uint64_t v5 = 0x65736F6C63;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656C67676F74;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_22F3D157C@<X0>(uint64_t a1@<X8>)
{
  return sub_22F3D2038(&qword_2686C0AF0, MEMORY[0x263EFBE48], (uint64_t)qword_2686C12F8, a1);
}

uint64_t sub_22F3D15B4(uint64_t a1)
{
  unint64_t v2 = sub_22F3D261C();

  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_22F3D1600()
{
  if (qword_2686C0AF8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_22F3D1678(uint64_t a1)
{
  unint64_t v2 = sub_22F3D2DD4();

  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_22F3D16C4(void *a1@<X8>)
{
  *a1 = &unk_26E2AB300;
}

uint64_t sub_22F3D16D4()
{
  uint64_t v0 = sub_22F3D44D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_22F3D44E8();
  __swift_allocate_value_buffer(v4, qword_2686C1318);
  __swift_project_value_buffer(v4, (uint64_t)qword_2686C1318);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_22F3D44F8();
}

uint64_t sub_22F3D18C8@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388]();
  unint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_22F3D44D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22F3D4518();
  MEMORY[0x270FA5388]();
  sub_22F3D4578();
  MEMORY[0x270FA5388]();
  uint64_t v8 = sub_22F3D44E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_22F3D44F8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  sub_22F3D4338();
  uint64_t v10 = sub_22F3D4328();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
}

uint64_t sub_22F3D1BD0()
{
  sub_22F3D4188();
  return v1;
}

uint64_t sub_22F3D1C04()
{
  return sub_22F3D4198();
}

uint64_t sub_22F3D1C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  sub_22F3D45F8();
  v3[8] = sub_22F3D45E8();
  uint64_t v5 = sub_22F3D45C8();
  v3[9] = v5;
  v3[10] = v4;
  return MEMORY[0x270FA2498](sub_22F3D1CD4, v5, v4);
}

uint64_t sub_22F3D1CD4()
{
  sub_22F3D4188();
  sub_22F3D4188();
  if (*(unsigned char *)(v0 + 105))
  {
    if (*(unsigned char *)(v0 + 105) == 1)
    {
LABEL_3:
      sub_22F3D3FE8();
      *(void *)(v0 + 88) = *(void *)(v0 + 24);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v2 = (void *)swift_task_alloc();
      *(void *)(v0 + 96) = v2;
      *uint64_t v2 = v0;
      v2[1] = sub_22F3D1E4C;
      return sub_22F3CD6EC(ObjectType);
    }
  }
  else
  {
    sub_22F3D3FE8();
    unsigned __int8 v4 = objc_msgSend(*(id *)(v0 + 32), sel_spotlightIsVisible);
    swift_unknownObjectRelease();
    if ((v4 & 1) == 0) {
      goto LABEL_3;
    }
  }
  swift_release();
  sub_22F3D3FE8();
  objc_msgSend(*(id *)(v0 + 16), sel_dismissSpotlight);
  swift_unknownObjectRelease();
  sub_22F3D4138();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_22F3D1E4C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_22F3D1F90, v3, v2);
}

uint64_t sub_22F3D1F90()
{
  swift_release();
  sub_22F3D4138();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22F3D2000@<X0>(uint64_t a1@<X8>)
{
  return sub_22F3D2038(qword_2686C0B00, MEMORY[0x263F06D40], (uint64_t)qword_2686C1318, a1);
}

uint64_t sub_22F3D2038@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_22F3D20EC()
{
  return sub_22F3D4418();
}

uint64_t sub_22F3D2284(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_22F3CA47C;
  return sub_22F3D1C38(a1, v5, v4);
}

uint64_t sub_22F3D2330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22F3D2670();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22F3D2358(uint64_t a1)
{
  unint64_t v2 = sub_22F3D03BC();

  return MEMORY[0x270EE0D28](a1, v2);
}

unint64_t sub_22F3D2394(unsigned __int8 a1)
{
  sub_22F3D46D8();
  sub_22F3D45B8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_22F3D46F8();

  return sub_22F3D244C(a1, v2);
}

unint64_t sub_22F3D244C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1852141679;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x65736F6C63;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xE600000000000000;
            if (v8 != 0x656C67676F74) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v7 = 0xE600000000000000;
        uint64_t v8 = 0x656C67676F74;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        uint64_t v10 = 1852141679;
      }
      else {
        uint64_t v10 = 0x65736F6C63;
      }
      if (v9 == 1) {
        unint64_t v11 = 0xE400000000000000;
      }
      else {
        unint64_t v11 = 0xE500000000000000;
      }
      if (v8 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_22F3D4688();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_22F3D25D0()
{
  unint64_t v0 = sub_22F3D4668();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_22F3D261C()
{
  unint64_t result = qword_2686BFEE0;
  if (!qword_2686BFEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFEE0);
  }
  return result;
}

uint64_t sub_22F3D2670()
{
  uint64_t v0 = sub_22F3D4478();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v27 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB40);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v26 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v25 - v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFB10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22F3D44D8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22F3D4518();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_22F3D4578();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v15 = sub_22F3D44E8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  v25[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFED8);
  sub_22F3D4568();
  sub_22F3D4508();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F06D18], v9);
  sub_22F3D44F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v32 = 1;
  uint64_t v17 = sub_22F3D4128();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v26, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v27, *MEMORY[0x263EFBDC8], v29);
  sub_22F3D261C();
  uint64_t v19 = sub_22F3D41B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFBB8);
  id v20 = objc_msgSend(self, sel_presentationHelperKey);
  uint64_t v21 = sub_22F3D4598();
  uint64_t v23 = v22;

  uint64_t v30 = v21;
  uint64_t v31 = v23;
  sub_22F3D4648();
  sub_22F3D4078();
  sub_22F3D4068();
  sub_22F3D4008();
  return v19;
}

unint64_t sub_22F3D2B60()
{
  unint64_t result = qword_2686BFEF8;
  if (!qword_2686BFEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFEF8);
  }
  return result;
}

unint64_t sub_22F3D2BB8()
{
  unint64_t result = qword_2686BFF00;
  if (!qword_2686BFF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF00);
  }
  return result;
}

unint64_t sub_22F3D2C10()
{
  unint64_t result = qword_2686BFF08;
  if (!qword_2686BFF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF08);
  }
  return result;
}

unint64_t sub_22F3D2C68()
{
  unint64_t result = qword_2686BFF10;
  if (!qword_2686BFF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF10);
  }
  return result;
}

uint64_t sub_22F3D2CBC()
{
  return MEMORY[0x263F8D380];
}

unint64_t sub_22F3D2CCC()
{
  unint64_t result = qword_2686BFF18;
  if (!qword_2686BFF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF18);
  }
  return result;
}

unint64_t sub_22F3D2D24()
{
  unint64_t result = qword_2686BFF20;
  if (!qword_2686BFF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF20);
  }
  return result;
}

unint64_t sub_22F3D2D7C()
{
  unint64_t result = qword_2686BFF28;
  if (!qword_2686BFF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF28);
  }
  return result;
}

unint64_t sub_22F3D2DD4()
{
  unint64_t result = qword_2686BFF30;
  if (!qword_2686BFF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF30);
  }
  return result;
}

uint64_t sub_22F3D2E28()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22F3D2E7C()
{
  unint64_t result = qword_2686BFF38;
  if (!qword_2686BFF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF38);
  }
  return result;
}

unint64_t sub_22F3D2ED4()
{
  unint64_t result = qword_2686BFF40;
  if (!qword_2686BFF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF40);
  }
  return result;
}

unint64_t sub_22F3D2F2C()
{
  unint64_t result = qword_2686BFF48;
  if (!qword_2686BFF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF48);
  }
  return result;
}

uint64_t sub_22F3D2F80()
{
  return sub_22F3CAF74(&qword_2686BFF50, &qword_2686BFF58);
}

unint64_t sub_22F3D2FC0()
{
  unint64_t result = qword_2686BFF60;
  if (!qword_2686BFF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF60);
  }
  return result;
}

unint64_t sub_22F3D3018()
{
  unint64_t result = qword_2686BFF68;
  if (!qword_2686BFF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686BFF68);
  }
  return result;
}

uint64_t sub_22F3D306C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22F3D3088()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ToggleSpotlightIntent()
{
  swift_release();

  return swift_release();
}

void *_s17SpotlightUIShared21ToggleSpotlightIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_22F3D41D8();
  sub_22F3D41D8();
  return a1;
}

void *assignWithCopy for ToggleSpotlightIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_22F3D41D8();
  swift_release();
  a1[1] = a2[1];
  sub_22F3D41D8();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ToggleSpotlightIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ToggleSpotlightIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ToggleSpotlightIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ToggleSpotlightIntent()
{
  return &type metadata for ToggleSpotlightIntent;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ToggleSpotlightIntent.Action(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ToggleSpotlightIntent.Action(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x22F3D33C4);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_22F3D33EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22F3D33F4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToggleSpotlightIntent.Action()
{
  return &type metadata for ToggleSpotlightIntent.Action;
}

uint64_t sub_22F3D340C()
{
  return sub_22F3CAF74(&qword_2686BFF78, (uint64_t *)&unk_2686BFF80);
}

uint64_t sub_22F3D3448()
{
  return sub_22F3CAF74((unint64_t *)&unk_2686BFC10, &qword_2686BFF90);
}

uint64_t sub_22F3D3484(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686BFFA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F3D35A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  sub_22F3D45F8();
  v6[12] = sub_22F3D45E8();
  uint64_t v8 = sub_22F3D45C8();
  return MEMORY[0x270FA2498](sub_22F3D3644, v8, v7);
}

uint64_t sub_22F3D3644()
{
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  swift_release();
  sub_22F3D4078();
  sub_22F3D4068();
  v0[7] = v3;
  v0[8] = v2;
  swift_bridgeObjectRetain();
  sub_22F3D4648();
  *(void *)(swift_allocObject() + 16) = v1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1038);
  sub_22F3D4058();
  swift_release();
  swift_release();
  sub_22F3D3EC8((uint64_t)(v0 + 2), (uint64_t *)&unk_26AFA10A0);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_22F3D3774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22F3D4618();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22F3D4608();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22F3D3EC8(a1, &qword_26AFA1030);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22F3D45C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

SUIAppIntentsAnnotator __swiftcall SUIAppIntentsAnnotator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (SUIAppIntentsAnnotator)objc_msgSend(v0, sel_init);
}

id SUIAppIntentsAnnotator.init()()
{
  v1.super_class = (Class)SUIAppIntentsAnnotator;
  return objc_msgSendSuper2(&v1, sel_init);
}

void sub_22F3D3B24()
{
  uint64_t v0 = sub_22F3D4088();
  MEMORY[0x270FA5388](v0);
  if (objc_msgSend(self, sel_isAppIntentsSupportEnabled))
  {
    sub_22F3CB01C();
    sub_22F3D3F24();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1090);
    sub_22F3D3F7C();
    sub_22F3D4638();
    id v1 = objc_allocWithZone((Class)sub_22F3D4538());
    sub_22F3CC2AC();
    uint64_t v2 = (void *)sub_22F3D4528();
    sub_22F3D4628();
  }
}

unint64_t type metadata accessor for SUIAppIntentsAnnotator()
{
  unint64_t result = qword_2686C1290;
  if (!qword_2686C1290)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686C1290);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22F3D3CEC()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_22F3CA47C;
  return sub_22F3D35A8((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_22F3D3D94()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F3D3DCC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_22F3CA47C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686BFFD0 + dword_2686BFFD0);
  return v6(a1, v4);
}

uint64_t sub_22F3D3E84()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F3D3EBC@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_22F3D3EC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22F3D3F24()
{
  unint64_t result = qword_26AFA1040;
  if (!qword_26AFA1040)
  {
    sub_22F3D4088();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1040);
  }
  return result;
}

unint64_t sub_22F3D3F7C()
{
  unint64_t result = qword_26AFA1098;
  if (!qword_26AFA1098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AFA1090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AFA1098);
  }
  return result;
}

uint64_t sub_22F3D3FD8()
{
  return MEMORY[0x270EE0998]();
}

uint64_t sub_22F3D3FE8()
{
  return MEMORY[0x270EE0A18]();
}

uint64_t sub_22F3D3FF8()
{
  return MEMORY[0x270EE0A40]();
}

uint64_t sub_22F3D4008()
{
  return MEMORY[0x270EE0A48]();
}

uint64_t sub_22F3D4018()
{
  return MEMORY[0x270F5CF28]();
}

uint64_t sub_22F3D4028()
{
  return MEMORY[0x270EE0A80]();
}

uint64_t sub_22F3D4038()
{
  return MEMORY[0x270EE0A90]();
}

uint64_t sub_22F3D4048()
{
  return MEMORY[0x270EE0A98]();
}

uint64_t sub_22F3D4058()
{
  return MEMORY[0x270EE0B68]();
}

uint64_t sub_22F3D4068()
{
  return MEMORY[0x270EE0B70]();
}

uint64_t sub_22F3D4078()
{
  return MEMORY[0x270EE0B80]();
}

uint64_t sub_22F3D4088()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_22F3D40B8()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_22F3D40C8()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_22F3D40E8()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_22F3D4108()
{
  return MEMORY[0x270EE0DA0]();
}

uint64_t sub_22F3D4128()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_22F3D4138()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_22F3D4148()
{
  return MEMORY[0x270EE1028]();
}

uint64_t sub_22F3D4158()
{
  return MEMORY[0x270EE1060]();
}

uint64_t sub_22F3D4168()
{
  return MEMORY[0x270EE1100]();
}

uint64_t sub_22F3D4178()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_22F3D4188()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_22F3D4198()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_22F3D41A8()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_22F3D41B8()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_22F3D41C8()
{
  return MEMORY[0x270EE12A0]();
}

uint64_t sub_22F3D41D8()
{
  return MEMORY[0x270EE1410]();
}

uint64_t sub_22F3D41E8()
{
  return MEMORY[0x270EE1420]();
}

uint64_t sub_22F3D41F8()
{
  return MEMORY[0x270EE1428]();
}

uint64_t sub_22F3D4208()
{
  return MEMORY[0x270EE1438]();
}

uint64_t sub_22F3D4218()
{
  return MEMORY[0x270EE1450]();
}

uint64_t sub_22F3D4228()
{
  return MEMORY[0x270EE1458]();
}

uint64_t sub_22F3D4238()
{
  return MEMORY[0x270EE1470]();
}

uint64_t sub_22F3D4248()
{
  return MEMORY[0x270EE1480]();
}

uint64_t sub_22F3D4258()
{
  return MEMORY[0x270EE1488]();
}

uint64_t sub_22F3D4268()
{
  return MEMORY[0x270EE1498]();
}

uint64_t sub_22F3D4278()
{
  return MEMORY[0x270EE14A8]();
}

uint64_t sub_22F3D4288()
{
  return MEMORY[0x270EE14B8]();
}

uint64_t sub_22F3D4298()
{
  return MEMORY[0x270EE14C8]();
}

uint64_t sub_22F3D42A8()
{
  return MEMORY[0x270EE14D8]();
}

uint64_t sub_22F3D42B8()
{
  return MEMORY[0x270EE14E0]();
}

uint64_t sub_22F3D42C8()
{
  return MEMORY[0x270EE14F8]();
}

uint64_t sub_22F3D42D8()
{
  return MEMORY[0x270EE1500]();
}

uint64_t sub_22F3D42E8()
{
  return MEMORY[0x270EE1510]();
}

uint64_t sub_22F3D42F8()
{
  return MEMORY[0x270EE1518]();
}

uint64_t sub_22F3D4308()
{
  return MEMORY[0x270EE1520]();
}

uint64_t sub_22F3D4318()
{
  return MEMORY[0x270EE1530]();
}

uint64_t sub_22F3D4328()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_22F3D4338()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_22F3D4348()
{
  return MEMORY[0x270EE15F0]();
}

uint64_t sub_22F3D4388()
{
  return MEMORY[0x270EE1858]();
}

uint64_t sub_22F3D4398()
{
  return MEMORY[0x270EE1868]();
}

uint64_t sub_22F3D43A8()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_22F3D43B8()
{
  return MEMORY[0x270EE1930]();
}

uint64_t sub_22F3D43C8()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_22F3D43D8()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_22F3D43E8()
{
  return MEMORY[0x270EE1980]();
}

uint64_t sub_22F3D4408()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_22F3D4418()
{
  return MEMORY[0x270EE1A50]();
}

uint64_t sub_22F3D4428()
{
  return MEMORY[0x270EE1AB0]();
}

uint64_t sub_22F3D4438()
{
  return MEMORY[0x270EE1AB8]();
}

uint64_t sub_22F3D4448()
{
  return MEMORY[0x270EE1AC0]();
}

uint64_t sub_22F3D4458()
{
  return MEMORY[0x270EE1AC8]();
}

uint64_t sub_22F3D4468()
{
  return MEMORY[0x270EE1AD0]();
}

uint64_t sub_22F3D4478()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_22F3D4498()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_22F3D44A8()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_22F3D44B8()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_22F3D44D8()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_22F3D44E8()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_22F3D44F8()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_22F3D4508()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22F3D4518()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22F3D4528()
{
  return MEMORY[0x270F07E98]();
}

uint64_t sub_22F3D4538()
{
  return MEMORY[0x270F07EA8]();
}

uint64_t sub_22F3D4548()
{
  return MEMORY[0x270F5CF40]();
}

uint64_t sub_22F3D4558()
{
  return MEMORY[0x270F5CF48]();
}

uint64_t sub_22F3D4568()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_22F3D4578()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_22F3D4588()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22F3D4598()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22F3D45A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22F3D45B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22F3D45C8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22F3D45D8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22F3D45E8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22F3D45F8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22F3D4608()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22F3D4618()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22F3D4628()
{
  return MEMORY[0x270F07EC8]();
}

uint64_t sub_22F3D4638()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22F3D4648()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22F3D4658()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22F3D4668()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22F3D4688()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22F3D4698()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22F3D46A8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22F3D46B8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22F3D46C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22F3D46D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22F3D46E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22F3D46F8()
{
  return MEMORY[0x270F9FC90]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SSDefaultsGetResources()
{
  return MEMORY[0x270F76ED0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void free(void *a1)
{
}

uint64_t isMacOS()
{
  return MEMORY[0x270F76FE8]();
}

uint64_t json_writer_add_key()
{
  return MEMORY[0x270F77000]();
}

uint64_t json_writer_add_string()
{
  return MEMORY[0x270F77010]();
}

uint64_t json_writer_begin_array()
{
  return MEMORY[0x270F77020]();
}

uint64_t json_writer_begin_dictionary()
{
  return MEMORY[0x270F77028]();
}

uint64_t json_writer_create_with_path()
{
  return MEMORY[0x270F77030]();
}

uint64_t json_writer_dispose()
{
  return MEMORY[0x270F77038]();
}

uint64_t json_writer_end_array()
{
  return MEMORY[0x270F77040]();
}

uint64_t json_writer_end_dictionary()
{
  return MEMORY[0x270F77048]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}