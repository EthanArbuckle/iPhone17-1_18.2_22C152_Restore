uint64_t JPKIPassContents.userIdentity.getter@<X0>(void *a1@<X8>)
{
  void *v1;

  *a1 = *v1;
  return swift_retain();
}

uint64_t JPKIPassContents.signingIdentity.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
  return swift_retain();
}

uint64_t JPKIPassContents.init(_:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_22D3BDE50();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_22D3BDE30();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B138);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22D3B5A1C, 0, 0);
}

uint64_t sub_22D3B5A1C()
{
  sub_22D3B881C(*(void **)(v0 + 24));
  if (v1)
  {
    sub_22D3BDEE0();
    swift_allocObject();
    *(void *)(v0 + 104) = sub_22D3BDE90();
    swift_retain();
    v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v2;
    void *v2 = v0;
    v2[1] = sub_22D3B5BAC;
    uint64_t v3 = *(void *)(v0 + 96);
    return MEMORY[0x270F5C0A8](v3);
  }
  else
  {
    sub_22D3B8908();
    swift_allocError();
    *uint64_t v4 = 4;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_22D3B5BAC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22D3B5CA8, 0, 0);
}

uint64_t sub_22D3B5CA8()
{
  uint64_t v1 = *(void *)(v0 + 96);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v2 = *(void *)(v0 + 80);
    uint64_t v4 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
    sub_22D3B98D4(&qword_26856B148, MEMORY[0x263F65FB8]);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_22D3B8908();
    swift_allocError();
    unsigned char *v5 = 4;
    swift_willThrow();
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)(*(void *)v1 + 16);
  if (!v7)
  {

    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t v20 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)(v0 + 40);
  v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
  uint64_t v9 = v8 + 16;
  v10 = v11;
  unint64_t v12 = *(void *)v1 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
  uint64_t v30 = *(void *)(v9 + 56);
  int v29 = *MEMORY[0x263F65FC8];
  int v27 = *MEMORY[0x263F65FD0];
  v13 = (void (**)(void, void))(v9 - 8);
  swift_bridgeObjectRetain();
  char v26 = 0;
  char v28 = 0;
  do
  {
    uint64_t v16 = *(void *)(v0 + 48);
    unint64_t v15 = *(void *)(v0 + 56);
    uint64_t v17 = *(void *)(v0 + 32);
    v10(v15, v12, v17);
    v10(v16, v15, v17);
    int v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 72))(v16, v17);
    if (v18 == v29)
    {
      v14 = *v13;
      char v28 = 1;
    }
    else
    {
      v14 = *v13;
      if (v18 == v27) {
        char v26 = 1;
      }
      else {
        v14(*(void *)(v0 + 48), *(void *)(v0 + 32));
      }
    }
    v14(*(void *)(v0 + 56), *(void *)(v0 + 32));
    v12 += v30;
    --v7;
  }
  while (v7);
  v19 = *(void **)(v0 + 24);
  swift_bridgeObjectRelease_n();

  if ((v28 & 1) == 0)
  {
    if (v26)
    {
      uint64_t v21 = 0;
      uint64_t v20 = *(void *)(v0 + 104);
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v20 = swift_retain();
  if ((v26 & 1) == 0)
  {
LABEL_19:
    uint64_t v22 = 0;
    goto LABEL_20;
  }
  uint64_t v21 = v20;
LABEL_17:
  uint64_t v22 = v20;
  swift_retain();
  uint64_t v20 = v21;
LABEL_20:
  uint64_t v23 = *(void *)(v0 + 104);
  v24 = *(uint64_t **)(v0 + 16);
  uint64_t *v24 = v20;
  v24[1] = v22;
  v24[2] = v23;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
LABEL_21:
  return v6();
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

uint64_t JPKIPassContents.UserIdentity.certificate(using:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = sub_22D3BDE30();
  *(void *)(v3 + 24) = v5;
  *(void *)(v3 + 32) = *(void *)(v5 - 8);
  *(void *)(v3 + 40) = swift_task_alloc();
  uint64_t v6 = sub_22D3BDE80();
  *(void *)(v3 + 48) = v6;
  *(void *)(v3 + 56) = *(void *)(v6 - 8);
  *(void *)(v3 + 64) = swift_task_alloc();
  uint64_t v7 = sub_22D3BDE50();
  *(void *)(v3 + 72) = v7;
  *(void *)(v3 + 80) = *(void *)(v7 - 8);
  *(void *)(v3 + 88) = swift_task_alloc();
  *(void *)(v3 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B158);
  uint64_t v8 = swift_task_alloc();
  *(unsigned char *)(v3 + 144) = *(unsigned char *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  *(void *)(v3 + 104) = v8;
  *(void *)(v3 + 112) = v9;
  uint64_t v11 = *v2;
  *(void *)(v3 + 120) = v10;
  *(void *)(v3 + 128) = v11;
  return MEMORY[0x270FA2498](sub_22D3B6228, 0, 0);
}

uint64_t sub_22D3B6228()
{
  int v1 = *(unsigned __int8 *)(v0 + 144);
  (*(void (**)(void, void, void))(*(void *)(v0 + 80) + 104))(*(void *)(v0 + 88), *MEMORY[0x263F65FC8], *(void *)(v0 + 72));
  if (v1 == 1)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 56) + 104))(*(void *)(v0 + 64), *MEMORY[0x263F65FD8], *(void *)(v0 + 48));
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v3 = *(void **)(v0 + 64);
    *uint64_t v3 = *(void *)(v0 + 112);
    v3[1] = v2;
    (*(void (**)(void))(v4 + 104))();
    swift_bridgeObjectRetain();
  }
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  void *v5 = v0;
  v5[1] = sub_22D3B6358;
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 64);
  return MEMORY[0x270F5C0B0](v6, v7, v8);
}

uint64_t sub_22D3B6358()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 72);
  uint64_t v4 = *(void *)(*(void *)v0 + 64);
  uint64_t v5 = *(void *)(*(void *)v0 + 56);
  uint64_t v6 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_22D3B650C, 0, 0);
}

uint64_t sub_22D3B650C()
{
  uint64_t v1 = v0[13];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = v0[4];
    uint64_t v2 = v0[5];
    uint64_t v4 = v0[3];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
    sub_22D3B98D4(&qword_26856B148, MEMORY[0x263F65FB8]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_22D3B8908();
    swift_allocError();
    unsigned char *v5 = 4;
    swift_willThrow();
  }
  else
  {
    uint64_t v7 = (uint64_t *)v0[2];
    uint64_t v8 = sub_22D3BDE40();
    uint64_t v10 = v9;
    swift_release();
    *uint64_t v7 = v8;
    v7[1] = v10;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t JPKIPassContents.UserIdentity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 16) = a1;
  uint64_t v7 = sub_22D3BDE30();
  *(void *)(v5 + 40) = v7;
  *(void *)(v5 + 48) = *(void *)(v7 - 8);
  *(void *)(v5 + 56) = swift_task_alloc();
  uint64_t v8 = sub_22D3BDE80();
  *(void *)(v5 + 64) = v8;
  *(void *)(v5 + 72) = *(void *)(v8 - 8);
  *(void *)(v5 + 80) = swift_task_alloc();
  uint64_t v9 = sub_22D3BDE50();
  *(void *)(v5 + 88) = v9;
  *(void *)(v5 + 96) = *(void *)(v9 - 8);
  *(void *)(v5 + 104) = swift_task_alloc();
  *(void *)(v5 + 112) = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B168);
  uint64_t v10 = swift_task_alloc();
  *(unsigned char *)(v5 + 160) = *(unsigned char *)a4;
  uint64_t v11 = *(void *)(a4 + 8);
  uint64_t v12 = *(void *)(a4 + 16);
  *(void *)(v5 + 120) = v10;
  *(void *)(v5 + 128) = v11;
  uint64_t v13 = *v4;
  *(void *)(v5 + 136) = v12;
  *(void *)(v5 + 144) = v13;
  return MEMORY[0x270FA2498](sub_22D3B689C, 0, 0);
}

uint64_t sub_22D3B689C()
{
  int v1 = *(unsigned __int8 *)(v0 + 160);
  (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 104))(*(void *)(v0 + 104), *MEMORY[0x263F65FC8], *(void *)(v0 + 88));
  if (v1 == 1)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 72) + 104))(*(void *)(v0 + 80), *MEMORY[0x263F65FD8], *(void *)(v0 + 64));
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 136);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v3 = *(void **)(v0 + 80);
    *uint64_t v3 = *(void *)(v0 + 128);
    v3[1] = v2;
    (*(void (**)(void))(v4 + 104))();
    swift_bridgeObjectRetain();
  }
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v5;
  void *v5 = v0;
  v5[1] = sub_22D3B69D0;
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v9 = *(void *)(v0 + 24);
  uint64_t v10 = *(void *)(v0 + 32);
  return MEMORY[0x270F5C0B8](v6, v9, v10, v7, v8);
}

uint64_t sub_22D3B69D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 104);
  uint64_t v2 = *(void *)(*(void *)v0 + 96);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  uint64_t v5 = *(void *)(*(void *)v0 + 72);
  uint64_t v6 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_22D3B6B84, 0, 0);
}

uint64_t sub_22D3B6B84()
{
  uint64_t v1 = v0[15];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = v0[6];
    uint64_t v2 = v0[7];
    uint64_t v4 = v0[5];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v4);
    sub_22D3B98D4(&qword_26856B148, MEMORY[0x263F65FB8]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_22D3B8908();
    swift_allocError();
    unsigned char *v5 = 4;
    swift_willThrow();
  }
  else
  {
    uint64_t v7 = (uint64_t *)v0[2];
    uint64_t v8 = sub_22D3BDE70();
    uint64_t v10 = v9;
    sub_22D3BDE60();
    uint64_t v11 = sub_22D3BDE40();
    uint64_t v13 = v12;
    swift_release();
    swift_release();
    *uint64_t v7 = v8;
    v7[1] = v10;
    v7[2] = v11;
    v7[3] = v13;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t JPKIPassContents.UserIdentity.changePIN(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  uint64_t v6 = sub_22D3BDE30();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  uint64_t v7 = sub_22D3BDE50();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B178);
  v5[13] = swift_task_alloc();
  uint64_t v8 = sub_22D3BDE80();
  v5[14] = v8;
  v5[15] = *(void *)(v8 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = *v4;
  v5[17] = v9;
  v5[18] = v10;
  return MEMORY[0x270FA2498](sub_22D3B6F38, 0, 0);
}

uint64_t sub_22D3B6F38()
{
  uint64_t v2 = (void *)v0[16];
  uint64_t v1 = (void *)v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[10];
  uint64_t v17 = v0[9];
  uint64_t v18 = v0[11];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];
  *uint64_t v1 = v0[2];
  v1[1] = v8;
  uint64_t v9 = *MEMORY[0x263F65FE0];
  uint64_t v10 = *(void (**)(void))(v4 + 104);
  v10();
  void *v2 = v6;
  v2[1] = v7;
  ((void (*)(void *, uint64_t, uint64_t))v10)(v2, v9, v3);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v18, *MEMORY[0x263F65FC8], v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[19] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_22D3B7090;
  uint64_t v12 = v0[17];
  uint64_t v13 = v0[16];
  uint64_t v14 = v0[13];
  uint64_t v15 = v0[11];
  return MEMORY[0x270F5C0A0](v14, v15, v12, v13);
}

uint64_t sub_22D3B7090()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_22D3B71E8, 0, 0);
}

uint64_t sub_22D3B71E8()
{
  uint64_t v1 = v0[13];
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[8];
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = v0[6];
    uint64_t v9 = v0[7];
    (*(void (**)(void, uint64_t, uint64_t))(v9 + 32))(v0[8], v1, v8);
    sub_22D3B98D4(&qword_26856B148, MEMORY[0x263F65FB8]);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    sub_22D3B8908();
    swift_allocError();
    *uint64_t v10 = 1;
    swift_willThrow();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(v3, v5);
    v11(v4, v5);
  }
  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v13(v0[16], v0[14]);
    v13(v4, v5);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_22D3B73F0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22D3B7498;
  return JPKIPassContents.UserIdentity.certificate(using:)(a1, a2);
}

uint64_t sub_22D3B7498()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22D3B758C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_22D3B9958;
  return JPKIPassContents.UserIdentity.signature(for:using:)(a1, a2, a3, a4);
}

uint64_t JPKIPassContents.SigningIdentity.certificate(using:)(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  uint64_t v5 = sub_22D3BDE30();
  v3[3] = v5;
  v3[4] = *(void *)(v5 - 8);
  v3[5] = swift_task_alloc();
  uint64_t v6 = sub_22D3BDE80();
  v3[6] = v6;
  v3[7] = *(void *)(v6 - 8);
  v3[8] = swift_task_alloc();
  uint64_t v7 = sub_22D3BDE50();
  v3[9] = v7;
  v3[10] = *(void *)(v7 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B158);
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  v3[13] = v8;
  v3[14] = v9;
  uint64_t v11 = *v2;
  v3[15] = v10;
  v3[16] = v11;
  return MEMORY[0x270FA2498](sub_22D3B7808, 0, 0);
}

uint64_t sub_22D3B7808()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = (void *)v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  (*(void (**)(void, void, void))(v0[10] + 104))(v0[11], *MEMORY[0x263F65FD0], v0[9]);
  *uint64_t v3 = v2;
  v3[1] = v1;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v3, *MEMORY[0x263F65FE0], v4);
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[17] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_22D3B6358;
  uint64_t v7 = v0[13];
  uint64_t v8 = v0[11];
  uint64_t v9 = v0[8];
  return MEMORY[0x270F5C0B0](v7, v8, v9);
}

uint64_t JPKIPassContents.SigningIdentity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v7 = sub_22D3BDE30();
  v5[5] = v7;
  v5[6] = *(void *)(v7 - 8);
  v5[7] = swift_task_alloc();
  uint64_t v8 = sub_22D3BDE80();
  v5[8] = v8;
  v5[9] = *(void *)(v8 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v9 = sub_22D3BDE50();
  v5[11] = v9;
  v5[12] = *(void *)(v9 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B168);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = *(void *)(a4 + 8);
  uint64_t v12 = *(void *)(a4 + 16);
  v5[15] = v10;
  v5[16] = v11;
  uint64_t v13 = *v4;
  v5[17] = v12;
  v5[18] = v13;
  return MEMORY[0x270FA2498](sub_22D3B7ADC, 0, 0);
}

uint64_t sub_22D3B7ADC()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = (void *)v0[10];
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  (*(void (**)(void, void, void))(v0[12] + 104))(v0[13], *MEMORY[0x263F65FD0], v0[11]);
  *uint64_t v3 = v2;
  v3[1] = v1;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v3, *MEMORY[0x263F65FE0], v4);
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[19] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_22D3B69D0;
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[3];
  uint64_t v11 = v0[4];
  return MEMORY[0x270F5C0B8](v7, v10, v11, v8, v9);
}

uint64_t JPKIPassContents.SigningIdentity.changePassword(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  uint64_t v6 = sub_22D3BDE30();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  uint64_t v7 = sub_22D3BDE50();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B178);
  v5[13] = swift_task_alloc();
  uint64_t v8 = sub_22D3BDE80();
  v5[14] = v8;
  v5[15] = *(void *)(v8 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = *v4;
  v5[17] = v9;
  v5[18] = v10;
  return MEMORY[0x270FA2498](sub_22D3B7DB8, 0, 0);
}

uint64_t sub_22D3B7DB8()
{
  uint64_t v2 = (void *)v0[16];
  uint64_t v1 = (void *)v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[10];
  uint64_t v17 = v0[9];
  uint64_t v18 = v0[11];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];
  *uint64_t v1 = v0[2];
  v1[1] = v8;
  uint64_t v9 = *MEMORY[0x263F65FE0];
  uint64_t v10 = *(void (**)(void))(v4 + 104);
  v10();
  void *v2 = v6;
  v2[1] = v7;
  ((void (*)(void *, uint64_t, uint64_t))v10)(v2, v9, v3);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v18, *MEMORY[0x263F65FD0], v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[19] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_22D3B7F10;
  uint64_t v12 = v0[17];
  uint64_t v13 = v0[16];
  uint64_t v14 = v0[13];
  uint64_t v15 = v0[11];
  return MEMORY[0x270F5C0A0](v14, v15, v12, v13);
}

uint64_t sub_22D3B7F10()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_22D3B9950, 0, 0);
}

uint64_t sub_22D3B8068(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22D3B9958;
  return JPKIPassContents.SigningIdentity.certificate(using:)(a1, a2);
}

uint64_t sub_22D3B8110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_22D3B9958;
  return JPKIPassContents.SigningIdentity.signature(for:using:)(a1, a2, a3, a4);
}

uint64_t JPKIPassContents.Certificate.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_22D3B895C(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t JPKIPassContents.Signature.signatureData.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_22D3B895C(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t JPKIPassContents.Signature.certificate.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_22D3B895C(v2, v3);
}

BOOL static JPKIPassContents.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t JPKIPassContents.Error.hash(into:)()
{
  return sub_22D3BE100();
}

uint64_t JPKIPassContents.Error.hashValue.getter()
{
  return sub_22D3BE120();
}

BOOL sub_22D3B82CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D3B82E0()
{
  return sub_22D3BE120();
}

uint64_t sub_22D3B8328()
{
  return sub_22D3BE100();
}

uint64_t sub_22D3B8354()
{
  return sub_22D3BE120();
}

uint64_t *JPKIPassContents.AuthenticationRequest<>.init(type:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t v3 = *result;
    unint64_t v4 = result[1];
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0xE000000000000000;
  }
  *(unsigned char *)a2 = v2 == 0;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v4;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_22D3B83E8(uint64_t a1, uint64_t a2)
{
  return sub_22D3B8684(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_22D3B8400(uint64_t a1, id *a2)
{
  uint64_t result = sub_22D3BDF00();
  *a2 = 0;
  return result;
}

uint64_t sub_22D3B8478(uint64_t a1, id *a2)
{
  char v3 = sub_22D3BDF10();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22D3B84F8@<X0>(uint64_t *a1@<X8>)
{
  sub_22D3BDF20();
  uint64_t v2 = sub_22D3BDEF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22D3B853C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22D3BDEF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22D3B8584@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22D3BDF20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22D3B85B0(uint64_t a1)
{
  uint64_t v2 = sub_22D3B98D4(&qword_26856B370, (void (*)(uint64_t))type metadata accessor for PKPaymentNetwork);
  uint64_t v3 = sub_22D3B98D4(&qword_26856B378, (void (*)(uint64_t))type metadata accessor for PKPaymentNetwork);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22D3B866C(uint64_t a1, uint64_t a2)
{
  return sub_22D3B8684(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_22D3B8684(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_22D3BDF20();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22D3B86C8()
{
  sub_22D3BDF20();
  sub_22D3BDF50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_22D3B871C()
{
  sub_22D3BDF20();
  sub_22D3BE0F0();
  sub_22D3BDF50();
  uint64_t v0 = sub_22D3BE120();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22D3B8790()
{
  uint64_t v0 = sub_22D3BDF20();
  uint64_t v2 = v1;
  if (v0 == sub_22D3BDF20() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_22D3BE080();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22D3B881C(void *a1)
{
  id v2 = [a1 sel_secureElementPass];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (!objc_msgSend(v2, sel_isDevicePrimaryPaymentApplicationPersonalized)) {
    goto LABEL_7;
  }
  id v4 = [v3 sel_devicePrimaryPaymentApplication];
  char v5 = v4;
  if (!v4)
  {

    return 0;
  }
  id v6 = [v4 sel_paymentNetworkIdentifier];

  if (v6 != (id)138 || (id v7 = objc_msgSend(a1, sel_uniqueID)) == 0)
  {
LABEL_7:

    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_22D3BDF20();

  return v9;
}

unint64_t sub_22D3B8908()
{
  unint64_t result = qword_26856B140;
  if (!qword_26856B140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26856B140);
  }
  return result;
}

uint64_t sub_22D3B895C(uint64_t a1, unint64_t a2)
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

_UNKNOWN **sub_22D3B89B4()
{
  return &protocol witness table for JPKIPassContents.UserIdentity;
}

_UNKNOWN **sub_22D3B89C0()
{
  return &protocol witness table for JPKIPassContents.SigningIdentity;
}

unint64_t sub_22D3B89D0()
{
  unint64_t result = qword_26856B1B8;
  if (!qword_26856B1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26856B1B8);
  }
  return result;
}

uint64_t destroy for JPKIPassContents()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s7PassKit16JPKIPassContentsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for JPKIPassContents(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
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

uint64_t assignWithTake for JPKIPassContents(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for JPKIPassContents()
{
  return &type metadata for JPKIPassContents;
}

uint64_t dispatch thunk of JPKIPassContents.Identity.certificate(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_22D3B7498;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of JPKIPassContents.Identity.signature(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 32)
                                                                                     + **(int **)(a6 + 32));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_22D3B9958;
  return v15(a1, a2, a3, a4, a5, a6);
}

ValueMetadata *type metadata accessor for JPKIPassContents.UserIdentity()
{
  return &type metadata for JPKIPassContents.UserIdentity;
}

void *initializeBufferWithCopyOfBuffer for JPKIPassContents.UserIdentity.AuthenticationType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for JPKIPassContents.UserIdentity.AuthenticationType()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for JPKIPassContents.UserIdentity.AuthenticationType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.UserIdentity.AuthenticationType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for JPKIPassContents.UserIdentity.AuthenticationType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_22D3B8F18(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_22D3B8F34(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for JPKIPassContents.UserIdentity.AuthenticationType()
{
  return &type metadata for JPKIPassContents.UserIdentity.AuthenticationType;
}

ValueMetadata *type metadata accessor for JPKIPassContents.SigningIdentity()
{
  return &type metadata for JPKIPassContents.SigningIdentity;
}

void *_s7PassKit16JPKIPassContentsV12UserIdentityV18AuthenticationTypeOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.SigningIdentity.AuthenticationType(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JPKIPassContents.SigningIdentity.AuthenticationType(uint64_t result, int a2, int a3)
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

uint64_t sub_22D3B903C()
{
  return 0;
}

ValueMetadata *type metadata accessor for JPKIPassContents.SigningIdentity.AuthenticationType()
{
  return &type metadata for JPKIPassContents.SigningIdentity.AuthenticationType;
}

uint64_t sub_22D3B9054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t *sub_22D3B905C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_22D3B895C(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_22D3B909C(uint64_t a1)
{
  return sub_22D3B90A8(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_22D3B90A8(uint64_t a1, unint64_t a2)
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

uint64_t *sub_22D3B9100(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_22D3B895C(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_22D3B90A8(v5, v6);
  return a1;
}

uint64_t *sub_22D3B9148(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_22D3B90A8(v3, v4);
  return a1;
}

uint64_t sub_22D3B9184(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t sub_22D3B91D8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for JPKIPassContents.Certificate()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D3B923C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22D3B9270(uint64_t *a1)
{
  sub_22D3B90A8(*a1, a1[1]);
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];

  return sub_22D3B90A8(v2, v3);
}

uint64_t *sub_22D3B92B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_22D3B895C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_22D3B895C(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *sub_22D3B9308(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_22D3B895C(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_22D3B90A8(v6, v7);
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_22D3B895C(v9, v8);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_22D3B90A8(v10, v11);
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

uint64_t *sub_22D3B937C(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_22D3B90A8(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_22D3B90A8(v6, v7);
  return a1;
}

uint64_t sub_22D3B93C8(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t sub_22D3B941C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for JPKIPassContents.Signature()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22D3B9488()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D3B9490(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D3B94C8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D3B9514(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7PassKit16JPKIPassContentsVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D3B9598(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for JPKIPassContents.AuthenticationRequest()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JPKIPassContents.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for JPKIPassContents.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x22D3B975CLL);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_22D3B9784(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22D3B978C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JPKIPassContents.Error()
{
  return &type metadata for JPKIPassContents.Error;
}

void type metadata accessor for PKPaymentNetwork()
{
  if (!qword_26856B350)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26856B350);
    }
  }
}

uint64_t sub_22D3B97FC()
{
  return sub_22D3B98D4(&qword_26856B358, (void (*)(uint64_t))type metadata accessor for PKPaymentNetwork);
}

uint64_t sub_22D3B9844()
{
  return sub_22D3B98D4(&qword_26856B360, (void (*)(uint64_t))type metadata accessor for PKPaymentNetwork);
}

uint64_t sub_22D3B988C()
{
  return sub_22D3B98D4(&qword_26856B368, (void (*)(uint64_t))type metadata accessor for PKPaymentNetwork);
}

uint64_t sub_22D3B98D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id sub_22D3B9964(void *a1)
{
  return [a1 sel_isBlacklisted];
}

id static PKStoredValuePassBalance.== infix(_:_:)(void *a1, uint64_t a2)
{
  return [a1 isEqualToBalance:a2];
}

uint64_t PKStoredValuePassBalance.amount.getter()
{
  id v1 = [v0 sel_amount];
  uint64_t v2 = MEMORY[0x230F7D710]();

  return v2;
}

id static PKPaymentRequest.paymentCouponCodeInvalidError(localizedDescription:)(uint64_t a1, uint64_t a2)
{
  return sub_22D3B9A0C(a1, a2, (SEL *)&selRef_paymentCouponCodeInvalidErrorWithLocalizedDescription_);
}

id static PKPaymentRequest.paymentCouponCodeExpiredError(localizedDescription:)(uint64_t a1, uint64_t a2)
{
  return sub_22D3B9A0C(a1, a2, (SEL *)&selRef_paymentCouponCodeExpiredErrorWithLocalizedDescription_);
}

id sub_22D3B9A0C(uint64_t a1, uint64_t a2, SEL *a3)
{
  if (a2) {
    unsigned int v4 = (void *)sub_22D3BDEF0();
  }
  else {
    unsigned int v4 = 0;
  }
  id v5 = [swift_getObjCClassFromMetadata() *a3:v4];

  return v5;
}

unint64_t PKPaymentRequest.applePayLaterAvailability.getter@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (unint64_t)[v1 sel_applePayLaterAvailability];
  if (result >= 3)
  {
    unint64_t result = sub_22D3BE050();
    __break(1u);
  }
  else
  {
    *a1 = 0x10002u >> (8 * result);
  }
  return result;
}

unint64_t sub_22D3B9B10@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = (unint64_t)[*a1 sel_applePayLaterAvailability];
  if (result >= 3)
  {
    unint64_t result = sub_22D3BE050();
    __break(1u);
  }
  else
  {
    *a2 = 0x10002u >> (8 * result);
  }
  return result;
}

id sub_22D3B9BB0(unsigned __int8 *a1, id *a2)
{
  int v2 = *a1;
  if (v2 == 2)
  {
    uint64_t v3 = 0;
  }
  else if (v2)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  return [*a2 sel_setApplePayLaterAvailability_:v3];
}

id PKPaymentRequest.applePayLaterAvailability.setter(unsigned __int8 *a1)
{
  int v2 = *a1;
  if (v2 == 2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = v1;
    if (v2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  return [v3 sel_setApplePayLaterAvailability_:v4];
}

id (*PKPaymentRequest.applePayLaterAvailability.modify(uint64_t a1))(uint64_t a1)
{
  int v2 = v1;
  *(void *)a1 = v2;
  unint64_t v4 = (unint64_t)[v2 sel_applePayLaterAvailability];
  if (v4 >= 3)
  {
    unint64_t result = (id (*)(uint64_t))sub_22D3BE050();
    __break(1u);
  }
  else
  {
    *(unsigned char *)(a1 + 8) = 0x10002u >> (8 * v4);
    return sub_22D3B9CF4;
  }
  return result;
}

id sub_22D3B9CF4(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v2 = 1;
  if (v1) {
    uint64_t v2 = 2;
  }
  if (v1 == 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  return [*(id *)a1 sel_setApplePayLaterAvailability_:v3];
}

BOOL static PKPaymentRequest.ApplePayLaterAvailability.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PKPaymentRequest.ApplePayLaterAvailability.Reason.hash(into:)()
{
  return sub_22D3BE100();
}

uint64_t PKPaymentRequest.ApplePayLaterAvailability.Reason.hashValue.getter()
{
  return sub_22D3BE120();
}

BOOL sub_22D3B9DA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id PKPaymentRequest.merchantCategoryCode.getter@<X0>(uint64_t a1@<X8>)
{
  id result = [v1 sel_merchantCategoryCode];
  *(_WORD *)a1 = (_WORD)result;
  *(unsigned char *)(a1 + 2) = 0;
  return result;
}

id PKPaymentRequest.merchantCategoryCode.setter(__int16 *a1)
{
  if (*((unsigned char *)a1 + 2)) {
    uint64_t v2 = (__int16 *)MEMORY[0x263F5C5B0];
  }
  else {
    uint64_t v2 = a1;
  }
  return [v1 setMerchantCategoryCode:*v2];
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(rawValue:)@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id (*PKPaymentRequest.merchantCategoryCode.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)[v1 sel_merchantCategoryCode];
  *(unsigned char *)(a1 + 10) = 0;
  return sub_22D3B9E80;
}

id sub_22D3B9E80(uint64_t a1)
{
  int v1 = (__int16 *)(a1 + 8);
  if (*(unsigned char *)(a1 + 10)) {
    int v1 = (__int16 *)MEMORY[0x263F5C5B0];
  }
  return [*(id *)a1 sel_setMerchantCategoryCode_:*v1];
}

uint64_t PKPaymentRequest.MerchantCategoryCode.rawValue.getter()
{
  return *v0;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(_:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
    id result = swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unsigned int v10 = sub_22D3BC834(result, a2, 10);
    id result = swift_bridgeObjectRelease();
    if ((v10 & 0x10000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_54;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      int v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      int v8 = (unsigned __int8 *)sub_22D3BE040();
    }
    unsigned int v9 = sub_22D3BC9F8(v8, v6, 10);
    LOWORD(v10) = v9;
    int v11 = HIWORD(v9) & 1;
LABEL_44:
    id result = swift_bridgeObjectRelease();
    if (!v11)
    {
LABEL_45:
      char v22 = 0;
LABEL_55:
      *(_WORD *)a3 = v10;
      *(unsigned char *)(a3 + 2) = v22;
      return result;
    }
LABEL_54:
    LOWORD(v10) = 0;
    char v22 = 1;
    goto LABEL_55;
  }
  v26[0] = result;
  v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v5) {
      goto LABEL_58;
    }
    if (v5 == 1) {
      goto LABEL_31;
    }
    unsigned int v10 = (BYTE1(result) - 48);
    if (v10 > 9) {
      goto LABEL_31;
    }
    if (v5 != 2)
    {
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_31;
      }
      LOWORD(v10) = 10 * v10 + (BYTE2(result) - 48);
      uint64_t v13 = v5 - 3;
      if (v13)
      {
        uint64_t v14 = (unsigned __int8 *)v26 + 3;
        while (1)
        {
          unsigned int v15 = *v14 - 48;
          if (v15 > 9) {
            goto LABEL_31;
          }
          int v16 = (__int16)(10 * v10);
          if (v16 != 10 * (__int16)v10) {
            goto LABEL_31;
          }
          unsigned int v10 = v16 + v15;
          if ((__int16)(v16 + v15) != v10) {
            goto LABEL_31;
          }
          int v11 = 0;
          ++v14;
          if (!--v13) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    int v11 = 0;
    goto LABEL_44;
  }
  if (result != 45)
  {
    if (!v5) {
      goto LABEL_31;
    }
    unsigned int v10 = (result - 48);
    if (v10 > 9) {
      goto LABEL_31;
    }
    if (v5 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_31;
      }
      LOWORD(v10) = 10 * v10 + (BYTE1(result) - 48);
      uint64_t v17 = v5 - 2;
      if (v17)
      {
        uint64_t v18 = (unsigned __int8 *)v26 + 2;
        while (1)
        {
          unsigned int v19 = *v18 - 48;
          if (v19 > 9) {
            goto LABEL_31;
          }
          int v20 = (__int16)(10 * v10);
          if (v20 != 10 * (__int16)v10) {
            goto LABEL_31;
          }
          unsigned int v10 = v20 + v19;
          if ((__int16)(v20 + v19) != v10) {
            goto LABEL_31;
          }
          int v11 = 0;
          ++v18;
          if (!--v17) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v5)
  {
    if (v5 != 1)
    {
      unsigned int v12 = (BYTE1(result) - 48);
      if (v12 <= 9)
      {
        if (v5 == 2)
        {
          int v11 = 0;
          unsigned int v10 = -v12;
          goto LABEL_44;
        }
        if ((BYTE2(result) - 48) <= 9u)
        {
          LOWORD(v10) = -10 * v12 - (BYTE2(result) - 48);
          uint64_t v21 = v5 - 3;
          if (!v21) {
            goto LABEL_43;
          }
          uint64_t v23 = (unsigned __int8 *)v26 + 3;
          while (1)
          {
            unsigned int v24 = *v23 - 48;
            if (v24 > 9) {
              break;
            }
            int v25 = (__int16)(10 * v10);
            if (v25 != 10 * (__int16)v10) {
              break;
            }
            unsigned int v10 = v25 - v24;
            if ((__int16)(v25 - v24) != v10) {
              break;
            }
            int v11 = 0;
            ++v23;
            if (!--v21) {
              goto LABEL_44;
            }
          }
        }
      }
    }
LABEL_31:
    LOWORD(v10) = 0;
    int v11 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.description.getter()
{
  unsigned int v1 = *v0;
  if (v1 > 0x3E7) {
    return sub_22D3BE070();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26856B380);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22D3BEA40;
  uint64_t v4 = MEMORY[0x263F8E538];
  *(void *)(v3 + 56) = MEMORY[0x263F8E4F0];
  *(void *)(v3 + 64) = v4;
  *(_WORD *)(v3 + 32) = v1;

  return sub_22D3BDF30();
}

uint64_t PKPaymentRequest.MerchantCategoryCode.init(from:)@<X0>(void *a1@<X0>, _WORD *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D3BE130();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  uint64_t result = sub_22D3BE090();
  uint64_t v6 = result;
  uint64_t v8 = v7;
  uint64_t v9 = HIBYTE(v7) & 0xF;
  uint64_t v10 = result & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v11) {
    goto LABEL_55;
  }
  if ((v8 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    unsigned int v14 = sub_22D3BC834(v6, v8, 10);
    swift_bridgeObjectRelease();
    if ((v14 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_55;
  }
  if ((v8 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      unsigned int v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unsigned int v12 = (unsigned __int8 *)sub_22D3BE040();
    }
    unsigned int v13 = sub_22D3BC9F8(v12, v10, 10);
    if ((v13 & 0x10000) == 0)
    {
      LOWORD(v14) = v13;
LABEL_37:
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      *a2 = v14;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
LABEL_55:
    uint64_t v28 = 0;
    uint64_t v29 = 0xE000000000000000;
    sub_22D3BE010();
    swift_bridgeObjectRelease();
    uint64_t v28 = 39;
    uint64_t v29 = 0xE100000000000000;
    sub_22D3BDF60();
    swift_bridgeObjectRelease();
    sub_22D3BDF60();
    sub_22D3BE030();
    swift_allocError();
    sub_22D3BE020();
    swift_bridgeObjectRelease();
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v28 = result;
  uint64_t v29 = v8 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v9) {
      goto LABEL_60;
    }
    if (v9 == 1) {
      goto LABEL_58;
    }
    unsigned int v14 = (BYTE1(result) - 48);
    if (v14 <= 9)
    {
      if (v9 == 2) {
        goto LABEL_35;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        LOWORD(v14) = 10 * v14 + (BYTE2(result) - 48);
        uint64_t v16 = v9 - 3;
        if (v9 != 3)
        {
          uint64_t v17 = (unsigned __int8 *)&v28 + 3;
          while (1)
          {
            unsigned int v18 = *v17 - 48;
            if (v18 > 9) {
              goto LABEL_33;
            }
            int v19 = (__int16)(10 * v14);
            if (v19 != 10 * (__int16)v14) {
              goto LABEL_33;
            }
            unsigned int v14 = v19 + v18;
            if ((__int16)(v19 + v18) != v14) {
              goto LABEL_33;
            }
            LODWORD(v9) = 0;
            ++v17;
            if (!--v16) {
              goto LABEL_36;
            }
          }
        }
        goto LABEL_35;
      }
    }
LABEL_33:
    LOWORD(v14) = 0;
    LODWORD(v9) = 1;
    goto LABEL_36;
  }
  if (result != 45)
  {
    if (!v9) {
      goto LABEL_33;
    }
    unsigned int v14 = (result - 48);
    if (v14 > 9) {
      goto LABEL_33;
    }
    if (v9 == 1)
    {
LABEL_35:
      LODWORD(v9) = 0;
      goto LABEL_36;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      LOWORD(v14) = 10 * v14 + (BYTE1(result) - 48);
      uint64_t v20 = v9 - 2;
      if (v9 != 2)
      {
        uint64_t v21 = (unsigned __int8 *)&v28 + 2;
        while (1)
        {
          unsigned int v22 = *v21 - 48;
          if (v22 > 9) {
            goto LABEL_33;
          }
          int v23 = (__int16)(10 * v14);
          if (v23 != 10 * (__int16)v14) {
            goto LABEL_33;
          }
          unsigned int v14 = v23 + v22;
          if ((__int16)(v23 + v22) != v14) {
            goto LABEL_33;
          }
          LODWORD(v9) = 0;
          ++v21;
          if (!--v20) {
            goto LABEL_36;
          }
        }
      }
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (v9)
  {
    if (v9 != 1)
    {
      unsigned int v15 = (BYTE1(result) - 48);
      if (v15 > 9) {
        goto LABEL_33;
      }
      if (v9 == 2)
      {
        LODWORD(v9) = 0;
        unsigned int v14 = -v15;
        goto LABEL_36;
      }
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_33;
      }
      LOWORD(v14) = -10 * v15 - (BYTE2(result) - 48);
      uint64_t v24 = v9 - 3;
      if (v9 != 3)
      {
        int v25 = (unsigned __int8 *)&v28 + 3;
        while (1)
        {
          unsigned int v26 = *v25 - 48;
          if (v26 > 9) {
            goto LABEL_33;
          }
          int v27 = (__int16)(10 * v14);
          if (v27 != 10 * (__int16)v14) {
            goto LABEL_33;
          }
          unsigned int v14 = v27 - v26;
          if ((__int16)(v27 - v26) != v14) {
            goto LABEL_33;
          }
          LODWORD(v9) = 0;
          ++v25;
          if (!--v24) {
            goto LABEL_36;
          }
        }
      }
      goto LABEL_35;
    }
LABEL_58:
    LOWORD(v14) = 0;
LABEL_36:
    if (!v9) {
      goto LABEL_37;
    }
    goto LABEL_55;
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t PKPaymentRequest.MerchantCategoryCode.encode(to:)(void *a1)
{
  unsigned int v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D3BE140();
  if (v2 <= 0x3E7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26856B380);
    uint64_t v3 = swift_allocObject();
    uint64_t v4 = MEMORY[0x263F8E4F0];
    *(_OWORD *)(v3 + 16) = xmmword_22D3BEA40;
    uint64_t v5 = MEMORY[0x263F8E538];
    *(void *)(v3 + 56) = v4;
    *(void *)(v3 + 64) = v5;
    *(_WORD *)(v3 + 32) = v2;
    sub_22D3BDF30();
  }
  else
  {
    __int16 v9 = v2;
    sub_22D3BE070();
  }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  sub_22D3BE0A0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_22D3BA7A0@<X0>(void *a1@<X0>, _WORD *a2@<X8>)
{
  return PKPaymentRequest.MerchantCategoryCode.init(from:)(a1, a2);
}

uint64_t sub_22D3BA7B8(void *a1)
{
  __int16 v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D3BE140();
  __int16 v6 = v2;
  PKPaymentRequest.MerchantCategoryCode.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  sub_22D3BE0A0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_22D3BA870()
{
  return sub_22D3BE120();
}

uint64_t sub_22D3BA8B8()
{
  return sub_22D3BE110();
}

uint64_t sub_22D3BA8E4()
{
  return sub_22D3BE120();
}

_WORD *sub_22D3BA928@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void sub_22D3BA938(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_22D3BA948(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t static PKMerchantCapability.capability3DS.getter()
{
  return 1;
}

uint64_t static PKMerchantCapability.capabilityEMV.getter()
{
  return 2;
}

uint64_t static PKMerchantCapability.capabilityCredit.getter()
{
  return 4;
}

uint64_t static PKMerchantCapability.capabilityDebit.getter()
{
  return 8;
}

uint64_t PKDisbursementRequest.region.getter()
{
  return sub_22D3BB880((SEL *)&selRef_regionCode, MEMORY[0x263F075C0]);
}

uint64_t PKDisbursementRequest.region.setter(uint64_t a1)
{
  return sub_22D3BBAE4(a1, MEMORY[0x263F07590], (SEL *)&selRef_setRegionCode_, MEMORY[0x263F07598]);
}

void (*PKDisbursementRequest.region.modify(void *a1))(void ***a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_22D3BDDE0();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  id v7 = [v1 sel_regionCode];
  sub_22D3BDF20();

  sub_22D3BDDF0();
  return sub_22D3BAAD8;
}

void sub_22D3BAAD8(void ***a1, char a2)
{
}

uint64_t PKDisbursementRequest.currency.getter()
{
  return sub_22D3BB880((SEL *)&selRef_currencyCode, MEMORY[0x263F07640]);
}

uint64_t PKDisbursementRequest.currency.setter(uint64_t a1)
{
  return sub_22D3BBAE4(a1, MEMORY[0x263F07618], (SEL *)&selRef_setCurrencyCode_, MEMORY[0x263F07620]);
}

void (*PKDisbursementRequest.currency.modify(void *a1))(void ***a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_22D3BDE10();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  id v7 = [v1 sel_currencyCode];
  sub_22D3BDF20();

  sub_22D3BDE20();
  return sub_22D3BAC50;
}

void sub_22D3BAC50(void ***a1, char a2)
{
}

void *PKDisbursementRequest.supportedRegions.getter()
{
  uint64_t v1 = sub_22D3BDDE0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = [v0 sel_supportedRegions];
  if (v5)
  {
    uint64_t v6 = sub_22D3BDFF0();

    int64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      unsigned int v13 = (void *)MEMORY[0x263F8EE78];
      sub_22D3BD27C(0, v7, 0);
      uint64_t v5 = v13;
      uint64_t v8 = v6 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_22D3BDDF0();
        unsigned int v13 = v5;
        unint64_t v10 = v5[2];
        unint64_t v9 = v5[3];
        if (v10 >= v9 >> 1)
        {
          sub_22D3BD27C(v9 > 1, v10 + 1, 1);
          uint64_t v5 = v13;
        }
        v8 += 16;
        v5[2] = v10 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))((unint64_t)v5+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v10, v4, v1);
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

void sub_22D3BAE4C(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if (*a1)
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    sub_22D3BAF5C(v4);
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)sub_22D3BDFE0();
    swift_bridgeObjectRelease();
  }
  [v3 setSupportedRegions:v2];
}

void PKDisbursementRequest.supportedRegions.setter(uint64_t a1)
{
  uint64_t v2 = (void *)a1;
  if (a1)
  {
    sub_22D3BAF5C(a1);
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)sub_22D3BDFE0();
    swift_bridgeObjectRelease();
  }
  [v1 setSupportedRegions:v2];
}

uint64_t sub_22D3BAF5C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_22D3BDACC(0, v1, 0);
    uint64_t v2 = v14;
    uint64_t v4 = *(void *)(sub_22D3BDDE0() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      uint64_t v7 = sub_22D3BDDD0();
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_22D3BDACC((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void (*PKDisbursementRequest.supportedRegions.modify(void *a1))(uint64_t a1, char a2)
{
  a1[3] = v1;
  *a1 = PKDisbursementRequest.supportedRegions.getter();
  return sub_22D3BB0DC;
}

void sub_22D3BB0DC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = swift_bridgeObjectRetain();
      sub_22D3BAF5C(v4);
      swift_bridgeObjectRelease();
      uint64_t v3 = (void *)sub_22D3BDFE0();
      swift_bridgeObjectRelease();
    }
    [*(id *)(a1 + 24) setSupportedRegions:v3];

    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3)
    {
      sub_22D3BAF5C(*(void *)a1);
      swift_bridgeObjectRelease();
      id v5 = (id)sub_22D3BDFE0();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v5 = 0;
    }
    [*(id *)(a1 + 24) setSupportedRegions:v5, v5];
  }
}

id PKDisbursementRequest.init(merchantIdentifier:currency:region:supportedNetworks:merchantCapabilities:summaryItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v10 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  sub_22D3BDDD0();
  unint64_t v11 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  sub_22D3BDDD0();
  uint64_t v12 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  type metadata accessor for PKPaymentNetwork();
  unsigned int v13 = (void *)sub_22D3BDFE0();
  swift_bridgeObjectRelease();
  sub_22D3BD29C();
  uint64_t v14 = (void *)sub_22D3BDFE0();
  swift_bridgeObjectRelease();
  id v15 = [v9 initWithMerchantIdentifier:v10 currencyCode:v11 regionCode:v12 supportedNetworks:v13 merchantCapabilities:a6 summaryItems:v14];

  uint64_t v16 = sub_22D3BDDE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a4, v16);
  uint64_t v17 = sub_22D3BDE10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a3, v17);
  return v15;
}

id PKPayLaterView.init(amount:currency:)(unint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __int16 v4 = a3;
  __int16 v5 = a2;
  int v6 = a1;
  unint64_t v7 = HIDWORD(a1);
  unint64_t v8 = HIWORD(a1);
  unint64_t v9 = a2 >> 16;
  unint64_t v10 = HIDWORD(a2);
  unint64_t v11 = HIWORD(a2);
  unsigned int v12 = HIWORD(a3);
  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int v20 = v6;
  __int16 v21 = v7;
  __int16 v22 = v8;
  __int16 v23 = v5;
  __int16 v24 = v9;
  __int16 v25 = v10;
  __int16 v26 = v11;
  __int16 v27 = v4;
  __int16 v28 = v12;
  id v14 = [objc_allocWithZone(MEMORY[0x263F087B0]) initWithDecimal:&v20];
  sub_22D3BDDD0();
  id v15 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  id v16 = [v13 initWithAmount:v14 currencyCode:v15];

  uint64_t v17 = sub_22D3BDE10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a4, v17);
  return v16;
}

uint64_t PKPayLaterView.amount.getter()
{
  id v1 = [v0 sel_amount];
  [v1 decimalValue];

  return v3;
}

__n128 sub_22D3BB568@<Q0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 sel_amount];
  [v3 decimalValue];
  int v4 = v7;
  __n128 v6 = v8;

  *(_DWORD *)a2 = v4;
  __n128 result = v6;
  *(__n128 *)(a2 + 4) = v6;
  return result;
}

void sub_22D3BB5E0(int *a1, void **a2)
{
  int v3 = *a1;
  int v4 = *a2;
  id v5 = objc_allocWithZone(MEMORY[0x263F087B0]);
  int v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 1);
  id v6 = [v5 initWithDecimal:&v7];
  [v4 setAmount:v6];
}

void PKPayLaterView.amount.setter(uint64_t a1, uint64_t a2, int a3)
{
  v5[0] = a1;
  v5[1] = a2;
  int v6 = a3;
  id v4 = [objc_allocWithZone(MEMORY[0x263F087B0]) initWithDecimal:v5];
  [v3 setAmount:v4];
}

void (*PKPayLaterView.amount.modify(void *a1))(uint64_t a1)
{
  int v3 = (char *)malloc(0x30uLL);
  *a1 = v3;
  *(void *)int v3 = v1;
  id v4 = [v1 sel_amount];
  [v4 decimalValue];

  *((_DWORD *)v3 + 2) = v6;
  *(_OWORD *)(v3 + 12) = v7;
  return sub_22D3BB7C8;
}

void sub_22D3BB7C8(uint64_t a1)
{
  id v1 = *(_DWORD **)a1;
  int v2 = *(_DWORD *)(*(void *)a1 + 8);
  long long v6 = *(_OWORD *)(*(void *)a1 + 12);
  id v3 = objc_allocWithZone(MEMORY[0x263F087B0]);
  id v4 = *(void **)v1;
  v1[7] = v2;
  *((_OWORD *)v1 + 2) = v6;
  id v5 = [v3 initWithDecimal:v1 + 7];
  [v4 setAmount:v5];

  free(v1);
}

uint64_t PKPayLaterView.currency.getter()
{
  return sub_22D3BB880((SEL *)&selRef_currencyCode, MEMORY[0x263F07640]);
}

uint64_t sub_22D3BB880(SEL *a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  id v3 = [v2 *a1];
  uint64_t v4 = sub_22D3BDF20();
  uint64_t v6 = v5;

  return a2(v4, v6);
}

uint64_t sub_22D3BB900(id *a1, uint64_t a2, uint64_t a3, SEL *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  id v5 = [*a1 *a4];
  uint64_t v6 = sub_22D3BDF20();
  uint64_t v8 = v7;

  return a5(v6, v8);
}

uint64_t sub_22D3BB980(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(uint64_t), SEL *a7)
{
  uint64_t v11 = a5(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  id v14 = (char *)&v19 - v13;
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - v13, a1, v11);
  id v16 = *a2;
  a6(v15);
  uint64_t v17 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  [v16 *a7:v17];

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t PKPayLaterView.currency.setter(uint64_t a1)
{
  return sub_22D3BBAE4(a1, MEMORY[0x263F07618], (SEL *)&selRef_setCurrencyCode_, MEMORY[0x263F07620]);
}

uint64_t sub_22D3BBAE4(uint64_t a1, void (*a2)(void), SEL *a3, uint64_t (*a4)(void))
{
  uint64_t v7 = v4;
  a2();
  unint64_t v9 = (void *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  [v7 *a3:v9];

  uint64_t v10 = a4(0);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(a1, v10);
}

void (*PKPayLaterView.currency.modify(void *a1))(void ***a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  *id v3 = v1;
  uint64_t v4 = sub_22D3BDE10();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  id v7 = [v1 sel_currencyCode];
  sub_22D3BDF20();

  sub_22D3BDE20();
  return sub_22D3BAC50;
}

void sub_22D3BBC9C(void ***a1, char a2, void (*a3)(void), SEL *a4)
{
  size_t v6 = *a1;
  id v7 = (*a1)[3];
  uint64_t v8 = (*a1)[4];
  unint64_t v9 = (*a1)[1];
  uint64_t v10 = (uint64_t (**)(void *, void *, void *))(*a1)[2];
  uint64_t v11 = **a1;
  if (a2)
  {
    uint64_t v12 = v10[2]((*a1)[3], v8, v9);
    ((void (*)(uint64_t))a3)(v12);
    uint64_t v13 = (void *)sub_22D3BDEF0();
    swift_bridgeObjectRelease();
    [v11 *a4:v13];

    id v14 = v10[1];
    ((void (*)(void *, void *))v14)(v7, v9);
    ((void (*)(void *, void *))v14)(v8, v9);
  }
  else
  {
    a3();
    uint64_t v15 = (void *)sub_22D3BDEF0();
    swift_bridgeObjectRelease();
    [v11 *a4:v15];

    ((void (*)(void *, void *))v10[1])(v8, v9);
  }
  free(v8);
  free(v7);

  free(v6);
}

uint64_t static PKPayLater.validate(amount:currency:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = a4;
  *(_DWORD *)(v4 + 104) = a3;
  *(void *)(v4 + 80) = a1;
  return MEMORY[0x270FA2498](sub_22D3BBE10, 0, 0);
}

uint64_t sub_22D3BBE10()
{
  uint64_t v1 = *(void *)(v0 + 88);
  int v2 = *(_DWORD *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 108;
  *(void *)(v0 + 24) = sub_22D3BBED4;
  uint64_t v4 = swift_continuation_init();
  sub_22D3BBFAC(v4, v3, v1, v2);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_22D3BBED4()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)v0 + 108);
  int v2 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 8);
  return v2(v1);
}

void sub_22D3BBFAC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t aBlock = a2;
  uint64_t v11 = a3;
  LODWORD(v12) = a4;
  id v4 = [objc_allocWithZone(MEMORY[0x263F087B0]) initWithDecimal:&aBlock];
  sub_22D3BDDD0();
  uint64_t v5 = (NSDecimalNumber *)v4;
  uint64_t v6 = (NSString *)sub_22D3BDEF0();
  swift_bridgeObjectRelease();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  id v14 = sub_22D3BDA8C;
  uint64_t v15 = v7;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_22D3BC138;
  uint64_t v13 = &block_descriptor;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_release();
  PKPayLaterValidateAmount(v5, v6, v8);
  _Block_release(v8);
}

uint64_t sub_22D3BC138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t PKIdentityNationalIDCardDescriptor.region.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = [v1 sel_regionCode];
  if (v3)
  {
    id v4 = v3;
    sub_22D3BDF20();
  }
  sub_22D3BDDF0();
  uint64_t v5 = sub_22D3BDDE0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(a1, 0, 1, v5);
}

uint64_t sub_22D3BC24C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [*a1 sel_regionCode];
  if (v3)
  {
    id v4 = v3;
    sub_22D3BDF20();
  }
  sub_22D3BDDF0();
  uint64_t v5 = sub_22D3BDDE0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(a2, 0, 1, v5);
}

uint64_t sub_22D3BC30C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26856B398);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D3BD2DC(a1, (uint64_t)v3);
  return PKIdentityNationalIDCardDescriptor.region.setter((uint64_t)v3);
}

uint64_t PKIdentityNationalIDCardDescriptor.region.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26856B398);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D3BD2DC(a1, (uint64_t)v5);
  uint64_t v6 = sub_22D3BDDE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_22D3BD344((uint64_t)v5);
    uint64_t v8 = 0;
  }
  else
  {
    sub_22D3BDDD0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    uint64_t v8 = (void *)sub_22D3BDEF0();
    swift_bridgeObjectRelease();
  }
  [v2 setRegionCode:v8];

  return sub_22D3BD344(a1);
}

void (*PKIdentityNationalIDCardDescriptor.region.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x38uLL);
  *a1 = v4;
  *uint64_t v4 = v2;
  size_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26856B398) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  uint64_t v6 = malloc(v5);
  v4[4] = v6;
  id v7 = [v2 sel_regionCode];
  if (v7)
  {
    uint64_t v8 = v7;
    sub_22D3BDF20();
  }
  sub_22D3BDDF0();
  uint64_t v9 = sub_22D3BDDE0();
  v4[5] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[6] = v10;
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  return sub_22D3BC65C;
}

void sub_22D3BC65C(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 40);
  uint64_t v4 = *(void *)(*a1 + 48);
  uint64_t v5 = *(void *)(*a1 + 32);
  if (a2)
  {
    uint64_t v7 = *(void *)(v2 + 8);
    uint64_t v6 = *(void *)(v2 + 16);
    sub_22D3BD2DC(v5, v6);
    sub_22D3BD2DC(v6, v7);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3) == 1)
    {
      sub_22D3BD344(*(void *)(v2 + 8));
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v11 = *(void *)(v2 + 40);
      uint64_t v12 = *(void *)(v2 + 48);
      uint64_t v13 = *(void *)(v2 + 8);
      sub_22D3BDDD0();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v11);
      uint64_t v8 = (void *)sub_22D3BDEF0();
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = *(void **)(v2 + 24);
    id v14 = *(void **)(v2 + 32);
    uint64_t v17 = *(void **)(v2 + 8);
    id v16 = *(void **)(v2 + 16);
    [*(id *)v2 setRegionCode:v8];

    sub_22D3BD344((uint64_t)v16);
  }
  else
  {
    uint64_t v9 = *(void *)(v2 + 24);
    sub_22D3BD2DC(v5, v9);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
    {
      sub_22D3BD344(*(void *)(v2 + 24));
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v18 = *(void *)(v2 + 40);
      uint64_t v19 = *(void *)(v2 + 48);
      uint64_t v20 = *(void *)(v2 + 24);
      sub_22D3BDDD0();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      uint64_t v10 = (void *)sub_22D3BDEF0();
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = *(void **)(v2 + 24);
    id v14 = *(void **)(v2 + 32);
    uint64_t v17 = *(void **)(v2 + 8);
    id v16 = *(void **)(v2 + 16);
    [*(id *)v2 sel_setRegionCode_:v10];
  }
  sub_22D3BD344((uint64_t)v14);
  free(v14);
  free(v15);
  free(v16);
  free(v17);

  free((void *)v2);
}

uint64_t sub_22D3BC834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22D3BDFC0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22D3BCCAC();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_22D3BE040();
  }
LABEL_7:
  unsigned int v11 = sub_22D3BC9F8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 & 0x1FFFF;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unsigned __int8 *sub_22D3BC9F8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            int v23 = (__int16)v8 * (__int16)a3;
            __int16 v24 = v23;
            if ((__int16)v23 != v23) {
              goto LABEL_72;
            }
            int v8 = (__int16)v23 + (v21 + v22);
            if ((__int16)(v24 + (v21 + v22)) != v8) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          int v13 = 0;
          unsigned __int16 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int16 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          LOWORD(v28) = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            int v31 = (__int16)v28 * (__int16)a3;
            __int16 v32 = v31;
            if ((__int16)v31 != v31) {
              goto LABEL_72;
            }
            int v28 = (__int16)v31 + (v29 + v30);
            if ((__int16)(v32 + (v29 + v30)) != v28) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int16 v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOWORD(v8) = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int16 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            int v14 = (__int16)v8 * (__int16)a3;
            __int16 v15 = v14;
            if ((__int16)v14 != v14) {
              goto LABEL_72;
            }
            int v8 = (__int16)v14 - (v10 + v11);
            if ((__int16)(v15 - (v10 + v11)) != v8) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int16 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22D3BCCAC()
{
  unint64_t v0 = sub_22D3BDFD0();
  uint64_t v4 = sub_22D3BCD2C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22D3BCD2C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22D3BCE84(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_22D3BCF84(v9, 0);
      unint64_t v12 = sub_22D3BCFEC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22D3BE040();
LABEL_4:
        JUMPOUT(0x230F7D650);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230F7D650](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x230F7D650]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22D3BCE84(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22D3BD200(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22D3BD200(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_22D3BCF84(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26856B3C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_22D3BCFEC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_22D3BD200(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_22D3BDFA0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_22D3BE040();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_22D3BD200(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22D3BDF70();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22D3BD200(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22D3BDFB0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x230F7D690](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

size_t sub_22D3BD27C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_22D3BDAEC(a1, a2, a3, (void *)*v3);
  *char v3 = result;
  return result;
}

unint64_t sub_22D3BD29C()
{
  unint64_t result = qword_26856B388;
  if (!qword_26856B388)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26856B388);
  }
  return result;
}

uint64_t sub_22D3BD2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B398);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D3BD344(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26856B398);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22D3BD3A8()
{
  unint64_t result = qword_26856B3A0;
  if (!qword_26856B3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26856B3A0);
  }
  return result;
}

unint64_t sub_22D3BD400()
{
  unint64_t result = qword_26856B3A8;
  if (!qword_26856B3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26856B3A8);
  }
  return result;
}

unint64_t sub_22D3BD458()
{
  unint64_t result = qword_26856B3B0;
  if (!qword_26856B3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26856B3B0);
  }
  return result;
}

id sub_22D3BD4B4@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id result = [*a1 sel_merchantCategoryCode];
  *(_WORD *)a2 = (_WORD)result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

id sub_22D3BD4EC(__int16 *a1, id *a2)
{
  if (*((unsigned char *)a1 + 2)) {
    uint64_t v2 = (__int16 *)MEMORY[0x263F5C5B0];
  }
  else {
    uint64_t v2 = a1;
  }
  return [*a2 setMerchantCategoryCode:*v2];
}

uint64_t sub_22D3BD518(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_22D3BB900(a1, a2, a3, (SEL *)&selRef_regionCode, MEMORY[0x263F075C0]);
}

uint64_t sub_22D3BD54C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_22D3BB980(a1, a2, a3, a4, MEMORY[0x263F07598], MEMORY[0x263F07590], (SEL *)&selRef_setRegionCode_);
}

uint64_t sub_22D3BD594(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_22D3BB900(a1, a2, a3, (SEL *)&selRef_currencyCode, MEMORY[0x263F07640]);
}

uint64_t sub_22D3BD5C8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_22D3BB980(a1, a2, a3, a4, MEMORY[0x263F07620], MEMORY[0x263F07618], (SEL *)&selRef_setCurrencyCode_);
}

void *sub_22D3BD610@<X0>(void *a1@<X8>)
{
  id result = PKDisbursementRequest.supportedRegions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22D3BD648(id *a1, uint64_t a2, uint64_t a3)
{
  return sub_22D3BB900(a1, a2, a3, (SEL *)&selRef_currencyCode, MEMORY[0x263F07640]);
}

uint64_t sub_22D3BD67C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_22D3BB980(a1, a2, a3, a4, MEMORY[0x263F07620], MEMORY[0x263F07618], (SEL *)&selRef_setCurrencyCode_);
}

uint64_t _s25ApplePayLaterAvailabilityOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D3BD778);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = v7 - 2;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *_s25ApplePayLaterAvailabilityOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *id result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x22D3BD860);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_22D3BD888(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_22D3BD89C(unsigned char *result, int a2)
{
  if (a2) {
    *id result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.ApplePayLaterAvailability()
{
  return &type metadata for PKPaymentRequest.ApplePayLaterAvailability;
}

uint64_t _s25ApplePayLaterAvailabilityO6ReasonOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s25ApplePayLaterAvailabilityO6ReasonOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x22D3BDA18);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_22D3BDA40(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.ApplePayLaterAvailability.Reason()
{
  return &type metadata for PKPaymentRequest.ApplePayLaterAvailability.Reason;
}

ValueMetadata *type metadata accessor for PKPaymentRequest.MerchantCategoryCode()
{
  return &type metadata for PKPaymentRequest.MerchantCategoryCode;
}

ValueMetadata *type metadata accessor for PKPayLater()
{
  return &type metadata for PKPayLater;
}

uint64_t sub_22D3BDA7C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22D3BDA8C(char a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  **(unsigned char **)(*(void *)(v2 + 64) + 40) = a1;
  return MEMORY[0x270FA2400](v2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

char *sub_22D3BDACC(char *a1, int64_t a2, char a3)
{
  id result = sub_22D3BDCC0(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

size_t sub_22D3BDAEC(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26856B3C0);
  uint64_t v10 = *(void *)(sub_22D3BDDE0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  id result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_22D3BDDE0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_22D3BDCC0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26856B3B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

uint64_t sub_22D3BDDD0()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_22D3BDDE0()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_22D3BDDF0()
{
  return MEMORY[0x270EF0F78]();
}

uint64_t sub_22D3BDE00()
{
  return MEMORY[0x270EF0FB0]();
}

uint64_t sub_22D3BDE10()
{
  return MEMORY[0x270EF0FC8]();
}

uint64_t sub_22D3BDE20()
{
  return MEMORY[0x270EF0FD0]();
}

uint64_t sub_22D3BDE30()
{
  return MEMORY[0x270F5C028]();
}

uint64_t sub_22D3BDE40()
{
  return MEMORY[0x270F5C030]();
}

uint64_t sub_22D3BDE50()
{
  return MEMORY[0x270F5C038]();
}

uint64_t sub_22D3BDE60()
{
  return MEMORY[0x270F5C040]();
}

uint64_t sub_22D3BDE70()
{
  return MEMORY[0x270F5C048]();
}

uint64_t sub_22D3BDE80()
{
  return MEMORY[0x270F5C050]();
}

uint64_t sub_22D3BDE90()
{
  return MEMORY[0x270F5C098]();
}

uint64_t sub_22D3BDEE0()
{
  return MEMORY[0x270F5C0C0]();
}

uint64_t sub_22D3BDEF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22D3BDF00()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22D3BDF10()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22D3BDF20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22D3BDF30()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22D3BDF40()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22D3BDF50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22D3BDF60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22D3BDF70()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22D3BDF80()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22D3BDFA0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22D3BDFB0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22D3BDFC0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22D3BDFD0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22D3BDFE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22D3BDFF0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22D3BE000()
{
  return MEMORY[0x270EF2298]();
}

uint64_t sub_22D3BE010()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22D3BE020()
{
  return MEMORY[0x270F9EA68]();
}

uint64_t sub_22D3BE030()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22D3BE040()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22D3BE050()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22D3BE070()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22D3BE080()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22D3BE090()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_22D3BE0A0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_22D3BE0B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22D3BE0C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22D3BE0D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22D3BE0E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22D3BE0F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22D3BE100()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22D3BE110()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_22D3BE120()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22D3BE130()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_22D3BE140()
{
  return MEMORY[0x270F9FD88]();
}

void PKPayLaterValidateAmount(NSDecimalNumber *amount, NSString *currencyCode, void *completion)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}