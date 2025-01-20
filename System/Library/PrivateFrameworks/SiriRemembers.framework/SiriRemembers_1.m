uint64_t sub_1C6A7B63C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  v6 = a3[14];
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v9 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  v11 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  v12 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1C6A7B750(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v10 = a3[14];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  v15 = (void *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  void *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  uint64_t v20 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  v21 = (void *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1C6A7B8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C6A7B8C0);
}

uint64_t sub_1C6A7B8C0()
{
  OUTLINED_FUNCTION_22_7();
  if (v2) {
    return OUTLINED_FUNCTION_20_5(*(void *)(v0 + 16));
  }
  OUTLINED_FUNCTION_27_4();
  uint64_t v4 = OUTLINED_FUNCTION_41_2(*(int *)(v1 + 56));

  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1C6A7B924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C6A7B938);
}

void sub_1C6A7B938()
{
  OUTLINED_FUNCTION_10_16();
  if (v3)
  {
    *(void *)(v1 + 16) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_51_2();
    uint64_t v4 = OUTLINED_FUNCTION_20_10(*(int *)(v2 + 56));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t type metadata accessor for _Interaction(uint64_t a1)
{
  return sub_1C6A35098(a1, qword_1EBC0A8C8);
}

uint64_t sub_1C6A7B9BC()
{
  uint64_t result = sub_1C6A88BB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_1C6A7BA94(char *a1, char *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = *((void *)a2 + 5);
    *((void *)a1 + 4) = *((void *)a2 + 4);
    *((void *)a1 + 5) = v9;
    uint64_t v10 = *((void *)a2 + 7);
    uint64_t v11 = *(int *)(a3 + 32);
    v16 = &a2[v11];
    uint64_t v17 = &a1[v11];
    *((void *)a1 + 6) = *((void *)a2 + 6);
    *((void *)a1 + 7) = v10;
    uint64_t v12 = sub_1C6A88BB0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v17, v16, v12);
    v13(&v4[*(int *)(a3 + 36)], &a2[*(int *)(a3 + 36)], v12);
  }
  return v4;
}

uint64_t sub_1C6A7BBE0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1C6A88BB0();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);

  return v8(v6, v5);
}

char *sub_1C6A7BCA8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  uint64_t v9 = *((void *)a2 + 7);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v14 = &a2[v10];
  v15 = &a1[v10];
  *((void *)a1 + 6) = *((void *)a2 + 6);
  *((void *)a1 + 7) = v9;
  uint64_t v11 = sub_1C6A88BB0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v15, v14, v11);
  v12(&a1[*(int *)(a3 + 36)], &a2[*(int *)(a3 + 36)], v11);
  return a1;
}

char *sub_1C6A7BDA4(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 6) = *((void *)a2 + 6);
  *((void *)a1 + 7) = *((void *)a2 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1C6A88BB0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[*(int *)(a3 + 36)], &a2[*(int *)(a3 + 36)], v9);
  return a1;
}

char *sub_1C6A7BED0(char *a1, char *a2, uint64_t a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  *((_OWORD *)a1 + 3) = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1C6A88BB0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[*(int *)(a3 + 36)], &a2[*(int *)(a3 + 36)], v11);
  return a1;
}

char *sub_1C6A7BF8C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)a2 + 7);
  *((void *)a1 + 6) = *((void *)a2 + 6);
  *((void *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1C6A88BB0();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40);
  v14(v11, v12, v13);
  v14(&a1[*(int *)(a3 + 36)], &a2[*(int *)(a3 + 36)], v13);
  return a1;
}

uint64_t sub_1C6A7C078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C6A7C08C);
}

uint64_t sub_1C6A7C08C()
{
  OUTLINED_FUNCTION_22_7();
  if (v2) {
    return OUTLINED_FUNCTION_20_5(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_27_4();
  uint64_t v4 = OUTLINED_FUNCTION_41_2(*(int *)(v1 + 32));

  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1C6A7C0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C6A7C104);
}

void sub_1C6A7C104()
{
  OUTLINED_FUNCTION_10_16();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_51_2();
    uint64_t v4 = OUTLINED_FUNCTION_20_10(*(int *)(v2 + 32));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t type metadata accessor for _NewEntity(uint64_t a1)
{
  return sub_1C6A35098(a1, qword_1EBC0A018);
}

uint64_t sub_1C6A7C188()
{
  return sub_1C6A7C194();
}

uint64_t sub_1C6A7C194()
{
  uint64_t result = sub_1C6A88BB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1C6A7C230(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v9;
    uint64_t v10 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v10;
    uint64_t v11 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v11;
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    *(unsigned char *)(a1 + 81) = *((unsigned char *)a2 + 81);
    uint64_t v12 = a3[13];
    uint64_t v23 = (uint64_t)a2 + v12;
    uint64_t v24 = a1 + v12;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    uint64_t v13 = sub_1C6A88BB0();
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22(v24, v23, v13);
    uint64_t v14 = a3[15];
    *(void *)((char *)v4 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
    v15 = (void *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[17];
    *(void *)((char *)v4 + a3[16]) = *(uint64_t *)((char *)a2 + a3[16]);
    *((unsigned char *)v4 + v18) = *((unsigned char *)a2 + v18);
    uint64_t v19 = a3[19];
    *(void *)((char *)v4 + a3[18]) = *(uint64_t *)((char *)a2 + a3[18]);
    *(void *)((char *)v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1C6A7C3D8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C6A7C488(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  uint64_t v11 = a3[13];
  uint64_t v21 = a2 + v11;
  uint64_t v22 = a1 + v11;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v12 = sub_1C6A88BB0();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v22, v21, v12);
  uint64_t v13 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  uint64_t v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[17];
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1C6A7C5E0(uint64_t a1, uint64_t a2, int *a3)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v6 = a3[13];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  uint64_t v10 = a3[15];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  return a1;
}

uint64_t sub_1C6A7C78C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  uint64_t v8 = a3[13];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v11 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[17];
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v14 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  return a1;
}

uint64_t sub_1C6A7C87C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v11 = a3[13];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1C6A88BB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  void *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[17];
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v20) = *(unsigned char *)(a2 + v20);
  uint64_t v21 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  return a1;
}

uint64_t sub_1C6A7C9B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C6A7C9C8);
}

uint64_t sub_1C6A7C9C8()
{
  OUTLINED_FUNCTION_22_7();
  if (v2) {
    return OUTLINED_FUNCTION_20_5(*(void *)(v0 + 8));
  }
  OUTLINED_FUNCTION_27_4();
  uint64_t v4 = OUTLINED_FUNCTION_41_2(*(int *)(v1 + 52));

  return __swift_getEnumTagSinglePayload(v4, v5, v6);
}

uint64_t sub_1C6A7CA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C6A7CA40);
}

void sub_1C6A7CA40()
{
  OUTLINED_FUNCTION_10_16();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_51_2();
    uint64_t v4 = OUTLINED_FUNCTION_20_10(*(int *)(v2 + 52));
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

uint64_t type metadata accessor for _NewInteraction(uint64_t a1)
{
  return sub_1C6A35098(a1, qword_1EBC0A1A8);
}

uint64_t sub_1C6A7CAC4()
{
  uint64_t result = sub_1C6A88BB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C6A7CB9C(char a1)
{
  return a1 & 1;
}

uint64_t sub_1C6A7CBA4(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1C6A7CBBC(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E20], qword_1EBC0B1C0, MEMORY[0x1E4F62E18]);
}

uint64_t sub_1C6A7CBE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656369766564 && a2 == 0xE800000000000000;
    if (v6 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
      if (v7 || (sub_1C6A8A540() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 1701869940 && a2 == 0xE400000000000000;
        if (v8 || (sub_1C6A8A540() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
          if (v9 || (sub_1C6A8A540() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x727453726F6E6F64 && a2 == 0xEB000000006D6165;
            if (v10 || (sub_1C6A8A540() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x6574616E6F447369 && a2 == 0xEF69726953794264;
              if (v11 || (sub_1C6A8A540() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x6F69746365726964 && a2 == 0xE90000000000006ELL;
                if (v12 || (sub_1C6A8A540() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x676E696C646E6168 && a2 == 0xEE00737574617453;
                  if (v13 || (sub_1C6A8A540() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
                    if (v14 || (sub_1C6A8A540() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x6E6F697461727564 && a2 == 0xEF73646E6F636553;
                      if (v15 || (sub_1C6A8A540() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
                        if (v16 || (sub_1C6A8A540() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x48746E65746E6F63 && a2 == 0xEB00000000687361;
                          if (v17 || (sub_1C6A8A540() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x6C61636F4C7369 && a2 == 0xE700000000000000;
                            if (v18 || (sub_1C6A8A540() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x6C50656369766564 && a2 == 0xEE006D726F667461;
                              if (v19 || (sub_1C6A8A540() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else if (a1 == 0x616E6F4472657375 && a2 == 0xEF65707954726F74)
                              {
                                swift_bridgeObjectRelease();
                                return 15;
                              }
                              else
                              {
                                char v21 = sub_1C6A8A540();
                                swift_bridgeObjectRelease();
                                if (v21) {
                                  return 15;
                                }
                                else {
                                  return 16;
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
        }
      }
    }
  }
}

uint64_t sub_1C6A7D2D0(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x656369766564;
      goto LABEL_6;
    case 2:
      uint64_t result = 0x6E69616D6F64;
      break;
    case 3:
      uint64_t result = 1701869940;
      break;
    case 4:
      uint64_t v3 = 0x656C646E7562;
LABEL_6:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6449000000000000;
      break;
    case 5:
      uint64_t result = 0x727453726F6E6F64;
      break;
    case 6:
      uint64_t result = 0x6574616E6F447369;
      break;
    case 7:
      uint64_t result = 0x6F69746365726964;
      break;
    case 8:
      uint64_t result = 0x676E696C646E6168;
      break;
    case 9:
      uint64_t result = 0x7461447472617473;
      break;
    case 10:
      uint64_t result = 0x6E6F697461727564;
      break;
    case 11:
      uint64_t result = 0x73646C656966;
      break;
    case 12:
      uint64_t result = 0x48746E65746E6F63;
      break;
    case 13:
      uint64_t result = 0x6C61636F4C7369;
      break;
    case 14:
      uint64_t result = 0x6C50656369766564;
      break;
    case 15:
      uint64_t result = 0x616E6F4472657375;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C6A7D4EC()
{
  OUTLINED_FUNCTION_52_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0A5B0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_16_10();
  sub_1C6A83260();
  OUTLINED_FUNCTION_24_4();
  sub_1C6A8A490();
  if (!v0)
  {
    OUTLINED_FUNCTION_2_17(1);
    OUTLINED_FUNCTION_2_17(2);
    OUTLINED_FUNCTION_2_17(3);
    OUTLINED_FUNCTION_2_17(4);
    sub_1C6A189AC();
    OUTLINED_FUNCTION_42_1();
    OUTLINED_FUNCTION_14_9(6);
    OUTLINED_FUNCTION_1_20(7);
    OUTLINED_FUNCTION_1_20(8);
    uint64_t v3 = type metadata accessor for _NewInteraction(0);
    sub_1C6A88BB0();
    sub_1C6A7E068(&qword_1EBC09E68, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_28_5();
    OUTLINED_FUNCTION_1_20(10);
    OUTLINED_FUNCTION_46_2(*(void *)(v1 + *(int *)(v3 + 60)), *(void *)(v1 + *(int *)(v3 + 60) + 8), 11);
    OUTLINED_FUNCTION_1_20(12);
    OUTLINED_FUNCTION_14_9(13);
    OUTLINED_FUNCTION_1_20(14);
    OUTLINED_FUNCTION_1_20(15);
  }
  uint64_t v4 = OUTLINED_FUNCTION_47_2();
  return v5(v4);
}

void sub_1C6A7D780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_53_2();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_122();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446048);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v17);
  uint64_t v18 = OUTLINED_FUNCTION_33_4();
  type metadata accessor for _NewInteraction(v18);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_35();
  v33 = v20;
  char v21 = (uint64_t *)(v15 + v20[15]);
  uint64_t *v21 = 0;
  v21[1] = 0;
  uint64_t v34 = (uint64_t)v13;
  v35 = v21;
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  sub_1C6A83260();
  OUTLINED_FUNCTION_40_2();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_23_10();
    *(void *)uint64_t v15 = sub_1C6A8A400();
    *(void *)(v15 + 8) = v22;
    *(void *)(v15 + 16) = OUTLINED_FUNCTION_3_18(1);
    *(void *)(v15 + 24) = v23;
    *(void *)(v15 + 32) = OUTLINED_FUNCTION_3_18(2);
    *(void *)(v15 + 40) = v24;
    *(void *)(v15 + 48) = OUTLINED_FUNCTION_3_18(3);
    *(void *)(v15 + 56) = v25;
    *(void *)(v15 + 64) = OUTLINED_FUNCTION_3_18(4);
    *(void *)(v15 + 72) = v26;
    sub_1C6A18C24();
    OUTLINED_FUNCTION_25_6();
    *(unsigned char *)(v15 + 80) = a13;
    *(unsigned char *)(v15 + 81) = OUTLINED_FUNCTION_37_2() & 1;
    *(void *)(v15 + 88) = OUTLINED_FUNCTION_13_11(7);
    *(void *)(v15 + 96) = OUTLINED_FUNCTION_13_11(8);
    sub_1C6A7E068(&qword_1EBC09540, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_25_6();
    OUTLINED_FUNCTION_49_2();
    v27();
    *(void *)(v15 + v33[14]) = OUTLINED_FUNCTION_6_17(10);
    uint64_t *v35 = OUTLINED_FUNCTION_44_1(11);
    v35[1] = v28;
    *(void *)(v15 + v33[16]) = OUTLINED_FUNCTION_6_17(12);
    *(unsigned char *)(v15 + v33[17]) = OUTLINED_FUNCTION_45_2(13) & 1;
    *(void *)(v15 + v33[18]) = OUTLINED_FUNCTION_6_17(14);
    uint64_t v29 = OUTLINED_FUNCTION_6_17(15);
    uint64_t v30 = OUTLINED_FUNCTION_4_15();
    v31(v30);
    *(void *)(v15 + v33[19]) = v29;
    sub_1C6A830C8(v15, v32, (void (*)(void))type metadata accessor for _NewInteraction);
    __swift_destroy_boxed_opaque_existential_0(v34);
    sub_1C6A83124(v15, (void (*)(void))type metadata accessor for _NewInteraction);
  }
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A7DC1C()
{
  return sub_1C6A7D2D0(*v0);
}

uint64_t sub_1C6A7DC24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A7CBE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A7DC4C(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83260();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A7DC88(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83260();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A7DCC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C6A7D780(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

uint64_t sub_1C6A7DCDC()
{
  return sub_1C6A7D4EC();
}

uint64_t sub_1C6A7DCF8()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A7DD10()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A7DD2C()
{
  sub_1C6A7E068(&qword_1EBC0A190, (void (*)(uint64_t))type metadata accessor for _NewInteraction);

  return sub_1C6A89310();
}

uint64_t sub_1C6A7DDC0()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A7DE38()
{
  return sub_1C6A894C0();
}

uint64_t sub_1C6A7DE50()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A7DEC8()
{
  return sub_1C6A894A0() & 1;
}

uint64_t sub_1C6A7DEE4()
{
  return sub_1C6A894B0() & 1;
}

uint64_t sub_1C6A7DF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EBC0A1A0, (void (*)(uint64_t))type metadata accessor for _NewInteraction);

  return MEMORY[0x1F411ABF8](a1, a2, a3, v6);
}

uint64_t sub_1C6A7DF8C(uint64_t a1, uint64_t a2)
{
  return sub_1C6A7FAB0(a1, a2, &qword_1EBC0A170, (uint64_t)qword_1EBC0B1C0);
}

uint64_t sub_1C6A7DFB8()
{
  return 0x7463617265746E69;
}

uint64_t sub_1C6A7DFD8()
{
  return sub_1C6A7E068((unint64_t *)&unk_1EBC0A180, (void (*)(uint64_t))type metadata accessor for _NewInteraction);
}

uint64_t sub_1C6A7E020()
{
  return sub_1C6A7E068(&qword_1EBC0A178, (void (*)(uint64_t))type metadata accessor for _NewInteraction);
}

uint64_t sub_1C6A7E068(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C6A7E0B0()
{
  return sub_1C6A7E068(&qword_1EBC0A198, (void (*)(uint64_t))type metadata accessor for _NewInteraction);
}

uint64_t sub_1C6A7E0F8(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E20], qword_1EA451490, MEMORY[0x1E4F62E18]);
}

uint64_t sub_1C6A7E120(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E10], qword_1EBC0B198, MEMORY[0x1E4F62E08]);
}

uint64_t sub_1C6A7E148()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09438);
  MEMORY[0x1F4188790](v0 - 8);
  unint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446050);
  __swift_allocate_value_buffer(v3, qword_1EA4514A8);
  __swift_project_value_buffer(v3, (uint64_t)qword_1EA4514A8);
  type metadata accessor for _Interaction(0);
  uint64_t v4 = sub_1C6A88C70();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v4);
  sub_1C6A7E068(&qword_1EBC0A120, (void (*)(uint64_t))type metadata accessor for _Interaction);
  sub_1C6A453CC();
  sub_1C6A88DF0();
  return sub_1C6A832AC((uint64_t)v2);
}

uint64_t sub_1C6A7E284()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446050);
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_2_0();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09EA0);
  __swift_allocate_value_buffer(v7, qword_1EA4514C0);
  __swift_project_value_buffer(v7, (uint64_t)qword_1EA4514C0);
  type metadata accessor for _Interaction(0);
  type metadata accessor for _Entity(0);
  if (qword_1EA444C68 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA4514A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v6, v8, v0);
  if (qword_1EBC094E8 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC09448);
  __swift_project_value_buffer(v9, (uint64_t)qword_1EBC0B180);
  sub_1C6A7E068(&qword_1EBC0A120, (void (*)(uint64_t))type metadata accessor for _Interaction);
  sub_1C6A20490(&qword_1EA446058, &qword_1EA446050);
  sub_1C6A20490(&qword_1EBC09440, (uint64_t *)&unk_1EBC09448);
  sub_1C6A88E00();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
}

uint64_t sub_1C6A7E4E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6469776F72 && a2 == 0xE500000000000000;
  if (v2 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 25705 && a2 == 0xE200000000000000;
    if (v6 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6449656369766564 && a2 == 0xE800000000000000;
      if (v7 || (sub_1C6A8A540() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
        if (v8 || (sub_1C6A8A540() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1701869940 && a2 == 0xE400000000000000;
          if (v9 || (sub_1C6A8A540() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
            if (v10 || (sub_1C6A8A540() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x6574616E6F447369 && a2 == 0xEF69726953794264;
              if (v11 || (sub_1C6A8A540() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x727453726F6E6F64 && a2 == 0xEB000000006D6165;
                if (v12 || (sub_1C6A8A540() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 0x6F69746365726964 && a2 == 0xE90000000000006ELL;
                  if (v13 || (sub_1C6A8A540() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x676E696C646E6168 && a2 == 0xEE00737574617453;
                    if (v14 || (sub_1C6A8A540() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
                      if (v15 || (sub_1C6A8A540() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x6E6F697461727564 && a2 == 0xEF73646E6F636553;
                        if (v16 || (sub_1C6A8A540() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
                          if (v17 || (sub_1C6A8A540() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x48746E65746E6F63 && a2 == 0xEB00000000687361;
                            if (v18 || (sub_1C6A8A540() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x6C61636F4C7369 && a2 == 0xE700000000000000;
                              if (v19 || (sub_1C6A8A540() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x6C50656369766564 && a2 == 0xEE006D726F667461;
                                if (v20 || (sub_1C6A8A540() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 15;
                                }
                                else
                                {
                                  BOOL v21 = a1 == 0x7355646572616873 && a2 == 0xEC00000064497265;
                                  if (v21 || (sub_1C6A8A540() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 16;
                                  }
                                  else if (a1 == 0x616E6F4472657375 && a2 == 0xEF65707954726F74)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 17;
                                  }
                                  else
                                  {
                                    char v23 = sub_1C6A8A540();
                                    swift_bridgeObjectRelease();
                                    if (v23) {
                                      return 17;
                                    }
                                    else {
                                      return 18;
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
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1C6A7ECA4()
{
  return 18;
}

uint64_t sub_1C6A7ECAC(char a1)
{
  uint64_t result = 0x6469776F72;
  switch(a1)
  {
    case 1:
      uint64_t result = 25705;
      break;
    case 2:
      uint64_t v3 = 0x656369766564;
      goto LABEL_7;
    case 3:
      uint64_t result = 0x6E69616D6F64;
      break;
    case 4:
      uint64_t result = 1701869940;
      break;
    case 5:
      uint64_t v3 = 0x656C646E7562;
LABEL_7:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6449000000000000;
      break;
    case 6:
      uint64_t result = 0x6574616E6F447369;
      break;
    case 7:
      uint64_t result = 0x727453726F6E6F64;
      break;
    case 8:
      uint64_t result = 0x6F69746365726964;
      break;
    case 9:
      uint64_t result = 0x676E696C646E6168;
      break;
    case 10:
      uint64_t result = 0x7461447472617473;
      break;
    case 11:
      uint64_t result = 0x6E6F697461727564;
      break;
    case 12:
      uint64_t result = 0x73646C656966;
      break;
    case 13:
      uint64_t result = 0x48746E65746E6F63;
      break;
    case 14:
      uint64_t result = 0x6C61636F4C7369;
      break;
    case 15:
      uint64_t result = 0x6C50656369766564;
      break;
    case 16:
      uint64_t result = 0x7355646572616873;
      break;
    case 17:
      uint64_t result = 0x616E6F4472657375;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C6A7EF04()
{
  OUTLINED_FUNCTION_52_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446000);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_16_10();
  sub_1C6A831C8();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_54_2();
  sub_1C6A8A4E0();
  if (!v0)
  {
    OUTLINED_FUNCTION_2_17(1);
    OUTLINED_FUNCTION_2_17(2);
    OUTLINED_FUNCTION_2_17(3);
    OUTLINED_FUNCTION_2_17(4);
    OUTLINED_FUNCTION_2_17(5);
    OUTLINED_FUNCTION_14_9(6);
    sub_1C6A189AC();
    OUTLINED_FUNCTION_42_1();
    OUTLINED_FUNCTION_1_20(8);
    OUTLINED_FUNCTION_1_20(9);
    uint64_t v3 = type metadata accessor for _Interaction(0);
    sub_1C6A88BB0();
    sub_1C6A7E068(&qword_1EBC09E68, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_28_5();
    OUTLINED_FUNCTION_1_20(11);
    OUTLINED_FUNCTION_46_2(*(void *)(v1 + *(int *)(v3 + 64)), *(void *)(v1 + *(int *)(v3 + 64) + 8), 12);
    OUTLINED_FUNCTION_1_20(13);
    OUTLINED_FUNCTION_14_9(14);
    OUTLINED_FUNCTION_1_20(15);
    OUTLINED_FUNCTION_2_17(16);
    OUTLINED_FUNCTION_1_20(17);
  }
  uint64_t v4 = OUTLINED_FUNCTION_47_2();
  return v5(v4);
}

void sub_1C6A7F1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_53_2();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_122();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC09980);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v17);
  uint64_t v18 = OUTLINED_FUNCTION_33_4();
  type metadata accessor for _Interaction(v18);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_35();
  BOOL v21 = (uint64_t *)(v15 + v20[16]);
  uint64_t *v21 = 0;
  v21[1] = 0;
  v37 = v21;
  v38 = v20;
  uint64_t v36 = (uint64_t)v13;
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  sub_1C6A831C8();
  OUTLINED_FUNCTION_40_2();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_23_10();
    *(void *)uint64_t v15 = sub_1C6A8A440();
    *(void *)(v15 + 8) = OUTLINED_FUNCTION_3_18(1);
    *(void *)(v15 + 16) = v22;
    *(void *)(v15 + 24) = OUTLINED_FUNCTION_3_18(2);
    *(void *)(v15 + 32) = v23;
    *(void *)(v15 + 40) = OUTLINED_FUNCTION_3_18(3);
    *(void *)(v15 + 48) = v24;
    *(void *)(v15 + 56) = OUTLINED_FUNCTION_3_18(4);
    *(void *)(v15 + 64) = v25;
    *(void *)(v15 + 72) = OUTLINED_FUNCTION_3_18(5);
    *(void *)(v15 + 80) = v26;
    *(unsigned char *)(v15 + 88) = OUTLINED_FUNCTION_37_2() & 1;
    sub_1C6A18C24();
    OUTLINED_FUNCTION_25_6();
    *(unsigned char *)(v15 + 89) = a13;
    *(void *)(v15 + 96) = OUTLINED_FUNCTION_13_11(8);
    *(void *)(v15 + 104) = OUTLINED_FUNCTION_13_11(9);
    sub_1C6A7E068(&qword_1EBC09540, MEMORY[0x1E4F27928]);
    sub_1C6A8A430();
    OUTLINED_FUNCTION_49_2();
    v27();
    *(void *)(v15 + v38[15]) = OUTLINED_FUNCTION_6_17(11);
    uint64_t *v37 = OUTLINED_FUNCTION_44_1(12);
    v37[1] = v28;
    *(void *)(v15 + v38[17]) = OUTLINED_FUNCTION_6_17(13);
    *(unsigned char *)(v15 + v38[18]) = OUTLINED_FUNCTION_45_2(14) & 1;
    *(void *)(v15 + v38[19]) = OUTLINED_FUNCTION_6_17(15);
    uint64_t v29 = sub_1C6A8A400();
    uint64_t v30 = (uint64_t *)(v15 + v38[20]);
    *uint64_t v30 = v29;
    v30[1] = v31;
    uint64_t v32 = OUTLINED_FUNCTION_6_17(17);
    uint64_t v33 = OUTLINED_FUNCTION_4_15();
    v34(v33);
    *(void *)(v15 + v38[21]) = v32;
    sub_1C6A830C8(v15, v35, (void (*)(void))type metadata accessor for _Interaction);
    __swift_destroy_boxed_opaque_existential_0(v36);
    sub_1C6A83124(v15, (void (*)(void))type metadata accessor for _Interaction);
  }
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A7F6CC()
{
  return sub_1C6A7ECAC(*v0);
}

uint64_t sub_1C6A7F6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A7E4E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A7F6FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C6A7ECA4();
  *a1 = result;
  return result;
}

uint64_t sub_1C6A7F724(uint64_t a1)
{
  unint64_t v2 = sub_1C6A831C8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A7F760(uint64_t a1)
{
  unint64_t v2 = sub_1C6A831C8();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A7F79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C6A7F1BC(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

uint64_t sub_1C6A7F7B4()
{
  return sub_1C6A7EF04();
}

uint64_t sub_1C6A7F7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EBC09318, (void (*)(uint64_t))type metadata accessor for _Interaction);

  return MEMORY[0x1F411AC60](a1, a2, a3, v6);
}

uint64_t sub_1C6A7F860(uint64_t a1, uint64_t a2)
{
  return sub_1C6A8190C(a1, a2, &qword_1EBC096B0, (uint64_t)qword_1EBC0B198);
}

uint64_t sub_1C6A7F884()
{
  sub_1C6A7E068(&qword_1EA446008, (void (*)(uint64_t))type metadata accessor for _Interaction);

  return sub_1C6A89310();
}

uint64_t sub_1C6A7F918()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A7F990()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A7FA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EA446010, (void (*)(uint64_t))type metadata accessor for _Interaction);

  return MEMORY[0x1F411ABF8](a1, a2, a3, v6);
}

uint64_t sub_1C6A7FA8C(uint64_t a1, uint64_t a2)
{
  return sub_1C6A7FAB0(a1, a2, qword_1EA444C58, (uint64_t)qword_1EA451490);
}

uint64_t sub_1C6A7FAB0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_1C6A80D24(a3, MEMORY[0x1E4F62E20], a4);
  sub_1C6A894E0();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_33();

  return v5(v4);
}

uint64_t sub_1C6A7FB34(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E20], qword_1EA4514D8, MEMORY[0x1E4F62E18]);
}

uint64_t sub_1C6A7FB5C()
{
  return sub_1C6A89B40();
}

uint64_t sub_1C6A7FC74(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_1C6A8A540() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_1C6A8A540() & 1) == 0) {
    return 0;
  }
  BOOL v6 = a1[4] == a2[4] && a1[5] == a2[5];
  if (!v6 && (sub_1C6A8A540() & 1) == 0) {
    return 0;
  }
  BOOL v7 = a1[6] == a2[6] && a1[7] == a2[7];
  if (!v7 && (sub_1C6A8A540() & 1) == 0) {
    return 0;
  }
  type metadata accessor for _NewEntity(0);
  if ((sub_1C6A88B80() & 1) == 0) {
    return 0;
  }

  return sub_1C6A88B80();
}

uint64_t sub_1C6A7FD74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701869940 && a2 == 0xE400000000000000;
    if (v6 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
      if (v7 || (sub_1C6A8A540() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6F5473646C656966 && a2 == 0xEC000000736E656BLL;
        if (v8 || (sub_1C6A8A540() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x4164657461657263 && a2 == 0xE900000000000074;
          if (v9 || (sub_1C6A8A540() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x4164657461647075 && a2 == 0xE900000000000074)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_1C6A8A540();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1C6A7FFE4()
{
  return 6;
}

uint64_t sub_1C6A7FFEC(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 1701869940;
      break;
    case 2:
      uint64_t result = 0x73646C656966;
      break;
    case 3:
      uint64_t result = 0x6F5473646C656966;
      break;
    case 4:
      unsigned int v3 = 1634038371;
      goto LABEL_7;
    case 5:
      unsigned int v3 = 1633972341;
LABEL_7:
      uint64_t result = v3 | 0x4164657400000000;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1C6A800A0()
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_52_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446028);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_16_10();
  sub_1C6A83214();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_15_10();
  if (!v0)
  {
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_15_10();
    type metadata accessor for _NewEntity(0);
    OUTLINED_FUNCTION_36_3();
    sub_1C6A7E068(&qword_1EBC09E68, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_11_14();
    OUTLINED_FUNCTION_11_14();
  }
  OUTLINED_FUNCTION_45_1();
  v2();
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A80244()
{
  return sub_1C6A8A690();
}

void sub_1C6A80284()
{
  OUTLINED_FUNCTION_51();
  unsigned int v3 = v2;
  uint64_t v31 = v4;
  sub_1C6A88BB0();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v6;
  uint64_t v30 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_35_4();
  MEMORY[0x1F4188790](v7);
  BOOL v9 = (char *)v26 - v8;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446018);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = OUTLINED_FUNCTION_9_10();
  uint64_t v33 = type metadata accessor for _NewEntity(v11);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_32_3(v13, v26[0]);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1C6A83214();
  sub_1C6A8A6C0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    uint64_t v27 = v1;
    uint64_t v28 = v9;
    uint64_t v14 = v31;
    OUTLINED_FUNCTION_48_2();
    uint64_t v15 = OUTLINED_FUNCTION_30_6();
    uint64_t v16 = v34;
    *uint64_t v34 = v15;
    v16[1] = v17;
    OUTLINED_FUNCTION_29_5();
    v16[2] = OUTLINED_FUNCTION_30_6();
    v16[3] = v18;
    OUTLINED_FUNCTION_43_2();
    v16[4] = OUTLINED_FUNCTION_30_6();
    v16[5] = v19;
    v16[6] = OUTLINED_FUNCTION_30_6();
    v16[7] = v20;
    v26[1] = sub_1C6A7E068(&qword_1EBC09540, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_56_2();
    BOOL v21 = (char *)v16 + *(int *)(v33 + 32);
    uint64_t v22 = v28;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    uint64_t v24 = v30;
    uint64_t v28 = (char *)(v29 + 32);
    v26[0] = (uint64_t)v23;
    v23(v21, v22, v30);
    OUTLINED_FUNCTION_56_2();
    OUTLINED_FUNCTION_45_1();
    v25();
    ((void (*)(char *, uint64_t, uint64_t))v26[0])((char *)v16 + *(int *)(v33 + 36), v27, v24);
    sub_1C6A830C8((uint64_t)v16, v14, (void (*)(void))type metadata accessor for _NewEntity);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
    sub_1C6A83124((uint64_t)v16, (void (*)(void))type metadata accessor for _NewEntity);
  }
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A806C4()
{
  return sub_1C6A7FFEC(*v0);
}

uint64_t sub_1C6A806CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A7FD74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A806F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1C6A7FFE4();
  *a1 = result;
  return result;
}

uint64_t sub_1C6A8071C(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83214();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A80758(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83214();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A80794()
{
}

void sub_1C6A807AC()
{
}

uint64_t sub_1C6A807CC()
{
  return sub_1C6A8A690();
}

uint64_t sub_1C6A80808()
{
  sub_1C6A7E068(&qword_1EA446038, (void (*)(uint64_t))type metadata accessor for _NewEntity);

  return sub_1C6A89310();
}

uint64_t sub_1C6A8089C()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A80914()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A80990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EA446040, (void (*)(uint64_t))type metadata accessor for _NewEntity);

  return MEMORY[0x1F411ABF8](a1, a2, a3, v6);
}

uint64_t sub_1C6A80A14(uint64_t a1, uint64_t a2)
{
  return sub_1C6A7FAB0(a1, a2, &qword_1EA444C78, (uint64_t)qword_1EA4514D8);
}

uint64_t sub_1C6A80A38()
{
  return 0x7365697469746E65;
}

uint64_t sub_1C6A80A50()
{
  return sub_1C6A7E068(&qword_1EA445F68, (void (*)(uint64_t))type metadata accessor for _NewEntity);
}

uint64_t sub_1C6A80A98()
{
  return sub_1C6A7E068(&qword_1EA445F70, (void (*)(uint64_t))type metadata accessor for _NewEntity);
}

uint64_t sub_1C6A80AE0()
{
  return sub_1C6A7E068(&qword_1EA445F78, (void (*)(uint64_t))type metadata accessor for _NewEntity);
}

uint64_t sub_1C6A80B28()
{
  return sub_1C6A7E068(&qword_1EA445F80, (void (*)(uint64_t))type metadata accessor for _NewEntity);
}

uint64_t sub_1C6A80B70()
{
  return sub_1C6A7E068(&qword_1EA445F88, (void (*)(uint64_t))type metadata accessor for _Interaction);
}

uint64_t sub_1C6A80BB8()
{
  return sub_1C6A7E068(&qword_1EBC0A120, (void (*)(uint64_t))type metadata accessor for _Interaction);
}

uint64_t sub_1C6A80C00()
{
  return sub_1C6A7E068(&qword_1EA445F90, (void (*)(uint64_t))type metadata accessor for _Interaction);
}

uint64_t sub_1C6A80C48(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E20], qword_1EA4514F0, MEMORY[0x1E4F62E18]);
}

uint64_t sub_1C6A80C70(uint64_t a1)
{
  return sub_1C6A80C98(a1, MEMORY[0x1E4F62E10], qword_1EA451508, MEMORY[0x1E4F62E08]);
}

uint64_t sub_1C6A80C98(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, unsigned int *a4)
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)a3);
  uint64_t v8 = *a4;
  BOOL v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104);

  return v9(v7, v8, v6);
}

uint64_t sub_1C6A80D24(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return __swift_project_value_buffer(v5, a3);
}

uint64_t sub_1C6A80D80()
{
  sub_1C6A88D70();
  swift_allocObject();
  uint64_t result = sub_1C6A88D60();
  qword_1EA451520 = result;
  return result;
}

uint64_t sub_1C6A80DD4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6469776F72 && a2 == 0xE500000000000000;
  if (v2 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 25705 && a2 == 0xE200000000000000;
    if (v6 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1701869940 && a2 == 0xE400000000000000;
      if (v7 || (sub_1C6A8A540() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
        if (v8 || (sub_1C6A8A540() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x4164657461657263 && a2 == 0xE900000000000074;
          if (v9 || (sub_1C6A8A540() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x4164657461647075 && a2 == 0xE900000000000074)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_1C6A8A540();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1C6A81024(char a1)
{
  uint64_t result = 0x6469776F72;
  switch(a1)
  {
    case 1:
      uint64_t result = 25705;
      break;
    case 2:
      uint64_t result = 1701869940;
      break;
    case 3:
      uint64_t result = 0x73646C656966;
      break;
    case 4:
      unsigned int v3 = 1634038371;
      goto LABEL_7;
    case 5:
      unsigned int v3 = 1633972341;
LABEL_7:
      uint64_t result = v3 | 0x4164657400000000;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1C6A810CC()
{
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_52_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA445FE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_16_10();
  sub_1C6A8307C();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_54_2();
  sub_1C6A8A4E0();
  if (!v0)
  {
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_15_10();
    type metadata accessor for _Entity(0);
    OUTLINED_FUNCTION_36_3();
    sub_1C6A7E068(&qword_1EBC09E68, MEMORY[0x1E4F27928]);
    OUTLINED_FUNCTION_11_14();
    OUTLINED_FUNCTION_11_14();
  }
  OUTLINED_FUNCTION_45_1();
  v2();
  OUTLINED_FUNCTION_46();
}

void sub_1C6A81270()
{
  OUTLINED_FUNCTION_51();
  unsigned int v3 = v2;
  uint64_t v29 = v4;
  sub_1C6A88BB0();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v6;
  uint64_t v31 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_35_4();
  MEMORY[0x1F4188790](v7);
  BOOL v9 = (char *)&v27 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA445FD0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = OUTLINED_FUNCTION_9_10();
  uint64_t v33 = type metadata accessor for _Entity(v11);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_32_3(v13, v27);
  uint64_t v14 = v3[3];
  uint64_t v32 = v3;
  __swift_project_boxed_opaque_existential_1(v3, v14);
  sub_1C6A8307C();
  sub_1C6A8A6C0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  }
  else
  {
    uint64_t v28 = v1;
    OUTLINED_FUNCTION_48_2();
    uint64_t v15 = sub_1C6A8A440();
    uint64_t v16 = v34;
    *uint64_t v34 = v15;
    OUTLINED_FUNCTION_29_5();
    v16[1] = OUTLINED_FUNCTION_30_6();
    v16[2] = v17;
    OUTLINED_FUNCTION_43_2();
    v16[3] = OUTLINED_FUNCTION_30_6();
    v16[4] = v18;
    v16[5] = OUTLINED_FUNCTION_30_6();
    v16[6] = v19;
    uint64_t v20 = sub_1C6A7E068(&qword_1EBC09540, MEMORY[0x1E4F27928]);
    uint64_t v21 = v31;
    uint64_t v27 = v20;
    OUTLINED_FUNCTION_56_2();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v22((char *)v16 + *(int *)(v33 + 32), v9, v21);
    uint64_t v23 = v28;
    OUTLINED_FUNCTION_56_2();
    uint64_t v24 = v21;
    OUTLINED_FUNCTION_45_1();
    v25();
    uint64_t v26 = (uint64_t)v34;
    v22((char *)v34 + *(int *)(v33 + 36), v23, v24);
    sub_1C6A830C8(v26, v29, (void (*)(void))type metadata accessor for _Entity);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
    sub_1C6A83124(v26, (void (*)(void))type metadata accessor for _Entity);
  }
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A81674(uint64_t a1)
{
  return sub_1C6A816A0(a1, qword_1EA451528);
}

uint64_t sub_1C6A81688(uint64_t a1)
{
  return sub_1C6A816A0(a1, qword_1EA451540);
}

uint64_t sub_1C6A816A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1C6A88FC0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EA444C90 != -1) {
    swift_once();
  }
  v5[3] = sub_1C6A895C0();
  v5[4] = MEMORY[0x1E4F62E90];
  __swift_allocate_boxed_opaque_existential_1(v5);
  sub_1C6A895D0();
  sub_1C6A88D80();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

uint64_t sub_1C6A8177C()
{
  return sub_1C6A81024(*v0);
}

uint64_t sub_1C6A81784@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A80DD4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A817AC(uint64_t a1)
{
  unint64_t v2 = sub_1C6A8307C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A817E8(uint64_t a1)
{
  unint64_t v2 = sub_1C6A8307C();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A81824()
{
}

void sub_1C6A8183C()
{
}

uint64_t sub_1C6A81854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EA445FC0, (void (*)(uint64_t))type metadata accessor for _Entity);

  return MEMORY[0x1F411AC60](a1, a2, a3, v6);
}

uint64_t sub_1C6A818E8(uint64_t a1, uint64_t a2)
{
  return sub_1C6A8190C(a1, a2, &qword_1EA444C88, (uint64_t)qword_1EA451508);
}

uint64_t sub_1C6A8190C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_1C6A80D24(a3, MEMORY[0x1E4F62E10], a4);
  sub_1C6A894D0();
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_33();

  return v5(v4);
}

uint64_t sub_1C6A81990()
{
  sub_1C6A7E068(&qword_1EA445FE8, (void (*)(uint64_t))type metadata accessor for _Entity);

  return sub_1C6A89310();
}

uint64_t sub_1C6A81A24()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A81A9C()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A81B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EA445FF0, (void (*)(uint64_t))type metadata accessor for _Entity);

  return MEMORY[0x1F411ABF8](a1, a2, a3, v6);
}

uint64_t sub_1C6A81B98(uint64_t a1, uint64_t a2)
{
  return sub_1C6A7FAB0(a1, a2, &qword_1EA444C80, (uint64_t)qword_1EA4514F0);
}

uint64_t sub_1C6A81BBC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000001C6A91FB0 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6F52797469746E65 && a2 == 0xEB00000000646977;
    if (v5 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6574656D61726170 && a2 == 0xE900000000000072)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_1C6A8A540();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1C6A81D2C(char a1)
{
  if (!a1) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 0x6F52797469746E65;
  }
  return 0x6574656D61726170;
}

void sub_1C6A81D94()
{
  OUTLINED_FUNCTION_51();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC0A5B8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_36_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1C6A83D88();
  sub_1C6A8A6E0();
  sub_1C6A8A4E0();
  if (!v0)
  {
    sub_1C6A8A4E0();
    sub_1C6A8A490();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_46();
}

void sub_1C6A81EEC()
{
  OUTLINED_FUNCTION_51();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_36_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_1C6A83D88();
  sub_1C6A8A6C0();
  if (!v0)
  {
    OUTLINED_FUNCTION_48_2();
    sub_1C6A8A440();
    OUTLINED_FUNCTION_29_5();
    sub_1C6A8A440();
    OUTLINED_FUNCTION_43_2();
    sub_1C6A8A400();
    OUTLINED_FUNCTION_45_1();
    v4();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_46();
}

uint64_t sub_1C6A82064()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09438);
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC09448);
  __swift_allocate_value_buffer(v4, qword_1EBC0B180);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBC0B180);
  type metadata accessor for _Entity(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09530);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C6A8B0A0;
  if (qword_1EBC094D8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1C6A895C0();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EBC0B150);
  uint64_t v8 = MEMORY[0x1E4F62E70];
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = v8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v5 + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v7, v6);
  sub_1C6A88C80();
  uint64_t v10 = sub_1C6A88C70();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v10);
  sub_1C6A453CC();
  sub_1C6A7E068(&qword_1EBC09518, (void (*)(uint64_t))type metadata accessor for _Entity);
  sub_1C6A88E10();
  return sub_1C6A832AC(v3);
}

uint64_t sub_1C6A82274(uint64_t a1)
{
  return sub_1C6A54674(a1, qword_1EBC0B168);
}

uint64_t sub_1C6A82298(uint64_t a1)
{
  return sub_1C6A54674(a1, qword_1EBC0B150);
}

uint64_t sub_1C6A822C0()
{
  return sub_1C6A81D2C(*v0);
}

uint64_t sub_1C6A822C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A81BBC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A822F0(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83D88();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A8232C(uint64_t a1)
{
  unint64_t v2 = sub_1C6A83D88();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A82368(void *a1@<X8>)
{
  sub_1C6A81EEC();
  if (!v1)
  {
    *a1 = v3;
    a1[1] = v4;
    a1[2] = v5;
    a1[3] = v6;
  }
}

void sub_1C6A82398()
{
}

uint64_t sub_1C6A823B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C6A83DD4();

  return MEMORY[0x1F411AC60](a1, a2, a3, v6);
}

uint64_t sub_1C6A8241C()
{
  sub_1C6A1A9C8();

  return sub_1C6A89310();
}

uint64_t sub_1C6A82480()
{
  return sub_1C6A89300();
}

uint64_t sub_1C6A824C8()
{
  return sub_1C6A892F0();
}

uint64_t sub_1C6A82510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C6A83E20();

  return MEMORY[0x1F411ABF8](a1, a2, a3, v6);
}

uint64_t sub_1C6A82568(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000001C6A91FB0 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6574656D61726170 && a2 == 0xE900000000000072;
    if (v5 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_1C6A8A540();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1C6A826B8(char a1)
{
  if (!a1) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 0x6574656D61726170;
  }
  return 0x797469746E65;
}

void sub_1C6A82714()
{
  OUTLINED_FUNCTION_51();
  uint64_t v4 = v3;
  uint64_t v17 = v5;
  type metadata accessor for _Entity(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_35();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA445FB0);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for _InteractionWithEntity(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_36_0();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_1C6A82FCC();
  sub_1C6A8A6C0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    OUTLINED_FUNCTION_48_2();
    *unint64_t v2 = sub_1C6A8A440();
    OUTLINED_FUNCTION_29_5();
    v2[1] = sub_1C6A8A400();
    v2[2] = v14;
    sub_1C6A7E068(&qword_1EA445FC0, (void (*)(uint64_t))type metadata accessor for _Entity);
    sub_1C6A8A430();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v11, v19);
    sub_1C6A83018(v1, (uint64_t)v2 + *(int *)(v12 + 24));
    sub_1C6A830C8((uint64_t)v2, v17, (void (*)(void))type metadata accessor for _InteractionWithEntity);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
    uint64_t v15 = OUTLINED_FUNCTION_33();
    sub_1C6A83124(v15, v16);
  }
  OUTLINED_FUNCTION_46();
}

unint64_t sub_1C6A829A8()
{
  return 0xD000000000000013;
}

uint64_t sub_1C6A829C4()
{
  return sub_1C6A826B8(*v0);
}

uint64_t sub_1C6A829CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A82568(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A829F4(uint64_t a1)
{
  unint64_t v2 = sub_1C6A82FCC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A82A30(uint64_t a1)
{
  unint64_t v2 = sub_1C6A82FCC();

  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1C6A82A6C()
{
}

uint64_t sub_1C6A82A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A7E068(&qword_1EA445FC8, (void (*)(uint64_t))type metadata accessor for _InteractionWithEntity);

  return MEMORY[0x1F411AC60](a1, a2, a3, v6);
}

uint64_t sub_1C6A82B18()
{
  return sub_1C6A62804();
}

uint64_t sub_1C6A82B20()
{
  return sub_1C6A62E60();
}

uint64_t sub_1C6A82B28@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1C6A7CBA4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1C6A82B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C6A7CB9C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1C6A82B80()
{
  return sub_1C6A89E50();
}

uint64_t sub_1C6A82BE0()
{
  return sub_1C6A89E30();
}

uint64_t sub_1C6A82C30(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1C6A189AC();
  unint64_t v5 = sub_1C6A82F80();
  uint64_t v6 = MEMORY[0x1E4F62FB8];

  return MEMORY[0x1F411B018](a1, a2, v4, v5, v6);
}

uint64_t sub_1C6A82CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C6A18C24();
  unint64_t v7 = sub_1C6A82F80();
  uint64_t v8 = MEMORY[0x1E4F62FB8];

  return MEMORY[0x1F411B028](a1, a2, a3, v6, v7, v8);
}

uint64_t sub_1C6A82D18(uint64_t a1)
{
  unint64_t v2 = sub_1C6A8317C();

  return MEMORY[0x1F411AFE0](a1, v2);
}

uint64_t sub_1C6A82D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1C6A8317C();

  return MEMORY[0x1F411AFF0](a1, a2, a3, v6);
}

unint64_t sub_1C6A82DBC()
{
  unint64_t result = qword_1EBC0A0B8;
  if (!qword_1EBC0A0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A0B8);
  }
  return result;
}

unint64_t sub_1C6A82E0C()
{
  unint64_t result = qword_1EBC0A0C0;
  if (!qword_1EBC0A0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A0C0);
  }
  return result;
}

unint64_t sub_1C6A82E5C()
{
  unint64_t result = qword_1EA445F98;
  if (!qword_1EA445F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA445F98);
  }
  return result;
}

uint64_t sub_1C6A82EA8()
{
  return sub_1C6A7E068(&qword_1EA445FA0, (void (*)(uint64_t))type metadata accessor for _Entity);
}

uint64_t sub_1C6A82EF0()
{
  return sub_1C6A7E068(&qword_1EBC09518, (void (*)(uint64_t))type metadata accessor for _Entity);
}

uint64_t sub_1C6A82F38()
{
  return sub_1C6A7E068(&qword_1EA445FA8, (void (*)(uint64_t))type metadata accessor for _Entity);
}

unint64_t sub_1C6A82F80()
{
  unint64_t result = qword_1EBC0A0D8;
  if (!qword_1EBC0A0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A0D8);
  }
  return result;
}

unint64_t sub_1C6A82FCC()
{
  unint64_t result = qword_1EA445FB8;
  if (!qword_1EA445FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA445FB8);
  }
  return result;
}

uint64_t sub_1C6A83018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _Entity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C6A8307C()
{
  unint64_t result = qword_1EA445FD8;
  if (!qword_1EA445FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA445FD8);
  }
  return result;
}

uint64_t sub_1C6A830C8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2();
  uint64_t v4 = OUTLINED_FUNCTION_33();
  v5(v4);
  return a2;
}

uint64_t sub_1C6A83124(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_1C6A8317C()
{
  unint64_t result = qword_1EA445FF8;
  if (!qword_1EA445FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA445FF8);
  }
  return result;
}

unint64_t sub_1C6A831C8()
{
  unint64_t result = qword_1EBC09698;
  if (!qword_1EBC09698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC09698);
  }
  return result;
}

unint64_t sub_1C6A83214()
{
  unint64_t result = qword_1EA446020;
  if (!qword_1EA446020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446020);
  }
  return result;
}

unint64_t sub_1C6A83260()
{
  unint64_t result = qword_1EBC0A150;
  if (!qword_1EBC0A150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A150);
  }
  return result;
}

uint64_t sub_1C6A832AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for _InteractionEntity()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _InteractionEntity(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for _InteractionEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for _InteractionEntity(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for _InteractionEntity()
{
  return &type metadata for _InteractionEntity;
}

unsigned char *storeEnumTagSinglePayload for _NewInteraction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *unint64_t result = a2 + 15;
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
        JUMPOUT(0x1C6A834B8);
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
          *unint64_t result = a2 + 15;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _NewInteraction.CodingKeys()
{
  return &type metadata for _NewInteraction.CodingKeys;
}

ValueMetadata *type metadata accessor for _NewEntity.CodingKeys()
{
  return &type metadata for _NewEntity.CodingKeys;
}

uint64_t getEnumTagSinglePayload for _Interaction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEF)
  {
    if (a2 + 17 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 17) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 18;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v5 = v6 - 18;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for _Interaction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *unint64_t result = a2 + 17;
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
        JUMPOUT(0x1C6A8365CLL);
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
          *unint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _Interaction.CodingKeys()
{
  return &type metadata for _Interaction.CodingKeys;
}

uint64_t _s13SiriRemembers10_NewEntityV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s13SiriRemembers10_NewEntityV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C6A837E8);
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

ValueMetadata *type metadata accessor for _Entity.CodingKeys()
{
  return &type metadata for _Entity.CodingKeys;
}

ValueMetadata *type metadata accessor for _InteractionWithEntity.CodingKeys()
{
  return &type metadata for _InteractionWithEntity.CodingKeys;
}

unint64_t sub_1C6A83838()
{
  unint64_t result = qword_1EA446060;
  if (!qword_1EA446060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446060);
  }
  return result;
}

unint64_t sub_1C6A83888()
{
  unint64_t result = qword_1EA446068;
  if (!qword_1EA446068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446068);
  }
  return result;
}

unint64_t sub_1C6A838D8()
{
  unint64_t result = qword_1EA446070;
  if (!qword_1EA446070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446070);
  }
  return result;
}

unint64_t sub_1C6A83928()
{
  unint64_t result = qword_1EA446078;
  if (!qword_1EA446078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446078);
  }
  return result;
}

unint64_t sub_1C6A83978()
{
  unint64_t result = qword_1EA446080;
  if (!qword_1EA446080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446080);
  }
  return result;
}

unint64_t sub_1C6A839C8()
{
  unint64_t result = qword_1EBC0A298;
  if (!qword_1EBC0A298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A298);
  }
  return result;
}

unint64_t sub_1C6A83A1C()
{
  unint64_t result = qword_1EBC0A2B0;
  if (!qword_1EBC0A2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A2B0);
  }
  return result;
}

unint64_t sub_1C6A83A6C()
{
  unint64_t result = qword_1EBC0A160;
  if (!qword_1EBC0A160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A160);
  }
  return result;
}

unint64_t sub_1C6A83ABC()
{
  unint64_t result = qword_1EBC0A158;
  if (!qword_1EBC0A158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A158);
  }
  return result;
}

unint64_t sub_1C6A83B0C()
{
  unint64_t result = qword_1EA446088;
  if (!qword_1EA446088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446088);
  }
  return result;
}

unint64_t sub_1C6A83B5C()
{
  unint64_t result = qword_1EA446090;
  if (!qword_1EA446090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446090);
  }
  return result;
}

unint64_t sub_1C6A83BAC()
{
  unint64_t result = qword_1EBC096A8;
  if (!qword_1EBC096A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC096A8);
  }
  return result;
}

unint64_t sub_1C6A83BFC()
{
  unint64_t result = qword_1EBC096A0;
  if (!qword_1EBC096A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC096A0);
  }
  return result;
}

unint64_t sub_1C6A83C4C()
{
  unint64_t result = qword_1EA446098;
  if (!qword_1EA446098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446098);
  }
  return result;
}

unint64_t sub_1C6A83C9C()
{
  unint64_t result = qword_1EA4460A0;
  if (!qword_1EA4460A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460A0);
  }
  return result;
}

unint64_t sub_1C6A83CEC()
{
  unint64_t result = qword_1EA4460A8;
  if (!qword_1EA4460A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460A8);
  }
  return result;
}

unint64_t sub_1C6A83D3C()
{
  unint64_t result = qword_1EA4460B0;
  if (!qword_1EA4460B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460B0);
  }
  return result;
}

unint64_t sub_1C6A83D88()
{
  unint64_t result = qword_1EBC0A278;
  if (!qword_1EBC0A278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A278);
  }
  return result;
}

unint64_t sub_1C6A83DD4()
{
  unint64_t result = qword_1EA4460C0;
  if (!qword_1EA4460C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460C0);
  }
  return result;
}

unint64_t sub_1C6A83E20()
{
  unint64_t result = qword_1EBC0A2B8;
  if (!qword_1EBC0A2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A2B8);
  }
  return result;
}

unsigned char *_s13SiriRemembers22_InteractionWithEntityV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C6A83F38);
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

ValueMetadata *type metadata accessor for _InteractionEntity.CodingKeys()
{
  return &type metadata for _InteractionEntity.CodingKeys;
}

unint64_t sub_1C6A83F74()
{
  unint64_t result = qword_1EA4460C8;
  if (!qword_1EA4460C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460C8);
  }
  return result;
}

unint64_t sub_1C6A83FC4()
{
  unint64_t result = qword_1EBC0A288;
  if (!qword_1EBC0A288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A288);
  }
  return result;
}

unint64_t sub_1C6A84014()
{
  unint64_t result = qword_1EBC0A280;
  if (!qword_1EBC0A280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBC0A280);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_17@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A490();
}

uint64_t OUTLINED_FUNCTION_3_18@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A400();
}

uint64_t OUTLINED_FUNCTION_4_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_17@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A420();
}

uint64_t OUTLINED_FUNCTION_11_14()
{
  return sub_1C6A8A4C0();
}

uint64_t OUTLINED_FUNCTION_13_11@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A420();
}

uint64_t OUTLINED_FUNCTION_14_9@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A4A0();
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return sub_1C6A8A490();
}

void *OUTLINED_FUNCTION_16_10()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_20_10@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_10()
{
  *(void *)(v2 - 144) = v1;
  *(void *)(v2 - 136) = v0;
  *(unsigned char *)(v2 - 65) = 0;
  return v2 - 65;
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  return sub_1C6A8A6E0();
}

uint64_t OUTLINED_FUNCTION_25_6()
{
  return sub_1C6A8A430();
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  return sub_1C6A88BB0();
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return sub_1C6A8A4C0();
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  *(unsigned char *)(v0 - 66) = 1;
  return v0 - 66;
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  return sub_1C6A8A400();
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return sub_1C6A89C80();
}

void OUTLINED_FUNCTION_32_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 88) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_33_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  *(unsigned char *)(v0 - 69) = 4;
  return sub_1C6A88BB0();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  *(unsigned char *)(v0 - 65) = 6;
  return sub_1C6A8A410();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return sub_1C6A8A6C0();
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return sub_1C6A8A4C0();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  *(unsigned char *)(v0 - 67) = 2;
  return v0 - 67;
}

uint64_t OUTLINED_FUNCTION_44_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  uint64_t v3 = *(void *)(v1 - 128);
  return MEMORY[0x1F41854F8](v1 - 65, v3);
}

uint64_t OUTLINED_FUNCTION_45_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_1C6A8A410();
}

uint64_t OUTLINED_FUNCTION_46_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W8>)
{
  *(unsigned char *)(v4 - 65) = a3;
  return MEMORY[0x1F4185628](a1, a2, v4 - 65, v3);
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  *(unsigned char *)(v0 - 65) = 0;
  return v0 - 65;
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_2()
{
  return sub_1C6A88BB0();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  return sub_1C6A88BB0();
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  uint64_t result = *v0;
  *(unsigned char *)(v1 - 65) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return sub_1C6A8A430();
}

uint64_t OUTLINED_FUNCTION_57_2@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_1C6A84548@<X0>(void *a1@<X8>)
{
  unint64_t v2 = (unint64_t)a1;
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = MEMORY[0x1E4FBC868];
  type metadata accessor for Entity();
  sub_1C6A88BA0();
  sub_1C6A059A4(v1, (SEL *)&selRef_identifier);
  if (v3)
  {
    sub_1C6A8A250();
    swift_bridgeObjectRelease();
    sub_1C6A89CF0();
    swift_bridgeObjectRelease();
    *(void *)unint64_t v2 = 0xD000000000000015;
    *(void *)(v2 + 8) = 0x80000001C6A940F0;
    strcpy((char *)(v2 + 16), "GetSuggestions");
    *(unsigned char *)(v2 + 31) = -18;
    uint64_t result = sub_1C6A8498C(v1);
    if (result)
    {
      unint64_t v5 = result;
      uint64_t v6 = sub_1C6A89B10();
      if (v5 >> 62)
      {
LABEL_31:
        swift_bridgeObjectRetain_n();
        uint64_t v7 = sub_1C6A8A380();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      unint64_t v30 = v2;
      if (!v7)
      {
LABEL_25:
        swift_bridgeObjectRelease_n();
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v36 = *(void *)(v30 + 32);
        *(void *)(v30 + 32) = 0x8000000000000000;
        sub_1C6A6EB3C();
        *(void *)(v30 + 32) = v36;
        return swift_bridgeObjectRelease();
      }
      unint64_t v8 = v5 & 0xC000000000000001;
      unint64_t v2 = (unint64_t)&selRef_key;
      uint64_t v9 = 4;
      unint64_t v31 = v5 & 0xC000000000000001;
      unint64_t v32 = v5;
      while (1)
      {
        if (v8) {
          id v10 = (id)MEMORY[0x1C87A9740](v9 - 4, v5);
        }
        else {
          id v10 = *(id *)(v5 + 8 * v9);
        }
        uint64_t v11 = v10;
        uint64_t v12 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
        uint64_t v37 = sub_1C6A059A4(v10, (SEL *)&selRef_key);
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = sub_1C6A059A4(v11, (SEL *)&selRef_value);
          if (v16)
          {
            uint64_t v33 = v15;
            uint64_t v34 = v16;
            swift_isUniquelyReferenced_nonNull_native();
            uint64_t v35 = (void *)v6;
            unint64_t v17 = sub_1C6A447B0();
            uint64_t v19 = *(void *)(v6 + 16);
            BOOL v20 = (v18 & 1) == 0;
            uint64_t v6 = v19 + v20;
            if (__OFADD__(v19, v20)) {
              goto LABEL_29;
            }
            unint64_t v2 = v17;
            unint64_t v5 = v18;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC09970);
            if (sub_1C6A8A350())
            {
              unint64_t v21 = sub_1C6A447B0();
              if ((v5 & 1) != (v22 & 1))
              {
                uint64_t result = sub_1C6A8A600();
                __break(1u);
                return result;
              }
              unint64_t v2 = v21;
            }
            uint64_t v6 = (uint64_t)v35;
            if (v5)
            {
              uint64_t v23 = v35[7] + 24 * v2;
              sub_1C6A02C78(*(void *)v23, *(void *)(v23 + 8), *(unsigned char *)(v23 + 16));
              *(void *)uint64_t v23 = v33;
              *(void *)(v23 + 8) = v34;
              *(unsigned char *)(v23 + 16) = 3;
            }
            else
            {
              v35[(v2 >> 6) + 8] |= 1 << v2;
              uint64_t v24 = (uint64_t *)(v35[6] + 16 * v2);
              *uint64_t v24 = v37;
              v24[1] = v14;
              uint64_t v25 = v35[7] + 24 * v2;
              *(void *)uint64_t v25 = v33;
              *(void *)(v25 + 8) = v34;
              *(unsigned char *)(v25 + 16) = 3;
              uint64_t v26 = v35[2];
              BOOL v27 = __OFADD__(v26, 1);
              uint64_t v28 = v26 + 1;
              if (v27) {
                goto LABEL_30;
              }
              v35[2] = v28;
              swift_bridgeObjectRetain();
            }

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v8 = v31;
            unint64_t v5 = v32;
            unint64_t v2 = (unint64_t)&selRef_key;
            uint64_t v12 = v9 - 3;
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {
        }
        ++v9;
        if (v12 == v7) {
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    sub_1C6A05A58();
    swift_allocError();
    *uint64_t v29 = 1;
    swift_willThrow();
    return sub_1C6A0684C(v2);
  }
  return result;
}

uint64_t sub_1C6A8498C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_parameters);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_1C6A89980();
  uint64_t v3 = sub_1C6A89E80();

  return v3;
}

void UserDonator.type.getter(unsigned char *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 8);
  BOOL v3 = v2 >= 3;
  unsigned int v4 = 0x30200u >> (8 * v2);
  if (v3) {
    LOBYTE(v4) = 1;
  }
  *a1 = v4;
}

uint64_t UserDonatorType.rawValue.getter()
{
  return *v0;
}

uint64_t static UserDonator.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (!v3)
  {
    if (v5) {
      goto LABEL_12;
    }
    unint64_t v3 = 0;
LABEL_10:
    char v6 = 1;
    goto LABEL_14;
  }
  if (v3 == 1)
  {
    if (v5 != 1) {
      goto LABEL_12;
    }
    unint64_t v3 = 1;
    goto LABEL_10;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5) {
        char v6 = 1;
      }
      else {
        char v6 = sub_1C6A8A540();
      }
      goto LABEL_13;
    }
LABEL_12:
    char v6 = 0;
LABEL_13:
    sub_1C69F6310(v4, v5);
    sub_1C69F6310(v2, v3);
    goto LABEL_14;
  }
  if (v5 != 2) {
    goto LABEL_12;
  }
  char v6 = 1;
  unint64_t v3 = 2;
LABEL_14:
  sub_1C69F5AF8(v2, v3);
  sub_1C69F5AF8(v4, v5);
  return v6 & 1;
}

SiriRemembers::UserDonatorType_optional __swiftcall UserDonatorType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (SiriRemembers::UserDonatorType_optional)rawValue;
}

uint64_t sub_1C6A84B1C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_1C6A8A540() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7A696E676F636572 && a2 == 0xEE00726573556465;
    if (v6 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001C6A94110 || (sub_1C6A8A540() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x55746C7561666564 && a2 == 0xEB00000000726573)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_1C6A8A540();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_1C6A84D04(char a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7A696E676F636572;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x55746C7561666564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C6A84DB0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7355646572616873 && a2 == 0xEC00000064497265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1C6A8A540();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1C6A84E50()
{
  return 0x7355646572616873;
}

unint64_t sub_1C6A84E70()
{
  return sub_1C6A84D04(*v0);
}

uint64_t sub_1C6A84E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A84B1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C6A84EA0(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85468();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A84EDC(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85468();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C6A84F18(uint64_t a1)
{
  unint64_t v2 = sub_1C6A854B4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A84F54(uint64_t a1)
{
  unint64_t v2 = sub_1C6A854B4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C6A84F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C6A84DB0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1C6A84FC0(uint64_t a1)
{
  unint64_t v2 = sub_1C6A8554C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A84FFC(uint64_t a1)
{
  unint64_t v2 = sub_1C6A8554C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C6A85038(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85598();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A85074(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85598();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C6A850B0(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85500();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A850EC(uint64_t a1)
{
  unint64_t v2 = sub_1C6A85500();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t UserDonator.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460D0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_5_16(v5, v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460D8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460E0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460E8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4460F0);
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_2_0();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = *(void *)(v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C6A85468();
  sub_1C6A8A6E0();
  switch(v15)
  {
    case 0:
      sub_1C6A85598();
      OUTLINED_FUNCTION_4_16();
LABEL_8:
      OUTLINED_FUNCTION_72();
      v16();
      OUTLINED_FUNCTION_72();
      return v17();
    case 1:
      sub_1C6A85500();
      OUTLINED_FUNCTION_4_16();
      goto LABEL_7;
    case 2:
      sub_1C6A854B4();
      OUTLINED_FUNCTION_4_16();
LABEL_7:
      OUTLINED_FUNCTION_6_18();
      goto LABEL_8;
  }
  sub_1C6A8554C();
  OUTLINED_FUNCTION_4_16();
  sub_1C6A8A490();
  OUTLINED_FUNCTION_6_18();
  OUTLINED_FUNCTION_72();
  v19();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v14, v9);
}

unint64_t sub_1C6A85468()
{
  unint64_t result = qword_1EA4460F8;
  if (!qword_1EA4460F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4460F8);
  }
  return result;
}

unint64_t sub_1C6A854B4()
{
  unint64_t result = qword_1EA446100;
  if (!qword_1EA446100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446100);
  }
  return result;
}

unint64_t sub_1C6A85500()
{
  unint64_t result = qword_1EA446108;
  if (!qword_1EA446108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446108);
  }
  return result;
}

unint64_t sub_1C6A8554C()
{
  unint64_t result = qword_1EA446110;
  if (!qword_1EA446110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446110);
  }
  return result;
}

unint64_t sub_1C6A85598()
{
  unint64_t result = qword_1EA446118;
  if (!qword_1EA446118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446118);
  }
  return result;
}

uint64_t UserDonator.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446120);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_11_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446128);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_5_16(v5, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446130);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446138);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA446140);
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_2_0();
  uint64_t v14 = v13 - v12;
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C6A85468();
  sub_1C6A8A6C0();
  if (v43) {
    goto LABEL_11;
  }
  uint64_t v44 = v10;
  uint64_t v15 = v14;
  uint64_t v16 = sub_1C6A8A450();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
LABEL_7:
    uint64_t v27 = sub_1C6A8A2B0();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4450A8);
    *uint64_t v29 = &type metadata for UserDonator;
    sub_1C6A8A3D0();
    sub_1C6A8A2A0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x1E4FBBA70], v27);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v15, v8);
LABEL_11:
    uint64_t v32 = (uint64_t)v42;
    return __swift_destroy_boxed_opaque_existential_0(v32);
  }
  uint64_t v18 = *(unsigned __int8 *)(v16 + 32);
  sub_1C6A1868C(1, v17, v16, v16 + 32, 0, (2 * v17) | 1);
  uint64_t v20 = v19;
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (v20 != v22 >> 1)
  {
    uint64_t v15 = v14;
    goto LABEL_7;
  }
  switch(v18)
  {
    case 1:
      sub_1C6A8554C();
      OUTLINED_FUNCTION_3_19();
      uint64_t v25 = sub_1C6A8A400();
      uint64_t v26 = v36;
      OUTLINED_FUNCTION_72();
      v37();
      swift_unknownObjectRelease();
      uint64_t v38 = OUTLINED_FUNCTION_7_14();
      v39(v38);
      break;
    case 2:
      sub_1C6A85500();
      OUTLINED_FUNCTION_3_19();
      OUTLINED_FUNCTION_6_18();
      OUTLINED_FUNCTION_72();
      v30();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_72();
      v31();
      uint64_t v25 = 0;
      uint64_t v26 = 1;
      break;
    case 3:
      sub_1C6A854B4();
      OUTLINED_FUNCTION_3_19();
      OUTLINED_FUNCTION_6_18();
      OUTLINED_FUNCTION_72();
      v34();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_72();
      v35();
      uint64_t v25 = 0;
      uint64_t v26 = 2;
      break;
    default:
      sub_1C6A85598();
      OUTLINED_FUNCTION_3_19();
      OUTLINED_FUNCTION_6_18();
      OUTLINED_FUNCTION_72();
      v23();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_72();
      v24();
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      break;
  }
  uint64_t v32 = (uint64_t)v42;
  *a2 = v25;
  a2[1] = v26;
  return __swift_destroy_boxed_opaque_existential_0(v32);
}

uint64_t sub_1C6A85BA8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UserDonator.init(from:)(a1, a2);
}

uint64_t sub_1C6A85BC0(void *a1)
{
  return UserDonator.encode(to:)(a1);
}

SiriRemembers::UserDonatorType_optional sub_1C6A85BDC(Swift::Int *a1)
{
  return UserDonatorType.init(rawValue:)(*a1);
}

uint64_t sub_1C6A85BE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UserDonatorType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1C6A85C0C()
{
  return sub_1C6A89E50();
}

uint64_t sub_1C6A85C6C()
{
  return sub_1C6A89E30();
}

unint64_t sub_1C6A85CC0()
{
  unint64_t result = qword_1EA446148;
  if (!qword_1EA446148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446148);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for UserDonator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UserDonator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDonator()
{
  return &type metadata for UserDonator;
}

ValueMetadata *type metadata accessor for UserDonatorType()
{
  return &type metadata for UserDonatorType;
}

unsigned char *_s13SiriRemembers15UserDonatorTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x1C6A85EACLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDonator.CodingKeys()
{
  return &type metadata for UserDonator.CodingKeys;
}

ValueMetadata *type metadata accessor for UserDonator.UnknownCodingKeys()
{
  return &type metadata for UserDonator.UnknownCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UserDonator.RecognizedUserCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C6A85F90);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDonator.RecognizedUserCodingKeys()
{
  return &type metadata for UserDonator.RecognizedUserCodingKeys;
}

ValueMetadata *type metadata accessor for UserDonator.UnrecognizedUserCodingKeys()
{
  return &type metadata for UserDonator.UnrecognizedUserCodingKeys;
}

ValueMetadata *type metadata accessor for UserDonator.DefaultUserCodingKeys()
{
  return &type metadata for UserDonator.DefaultUserCodingKeys;
}

unint64_t sub_1C6A85FEC()
{
  unint64_t result = qword_1EA446150;
  if (!qword_1EA446150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446150);
  }
  return result;
}

unint64_t sub_1C6A8603C()
{
  unint64_t result = qword_1EA446158;
  if (!qword_1EA446158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446158);
  }
  return result;
}

unint64_t sub_1C6A8608C()
{
  unint64_t result = qword_1EA446160;
  if (!qword_1EA446160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446160);
  }
  return result;
}

unint64_t sub_1C6A860DC()
{
  unint64_t result = qword_1EA446168;
  if (!qword_1EA446168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446168);
  }
  return result;
}

unint64_t sub_1C6A8612C()
{
  unint64_t result = qword_1EA446170;
  if (!qword_1EA446170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446170);
  }
  return result;
}

unint64_t sub_1C6A8617C()
{
  unint64_t result = qword_1EA446178;
  if (!qword_1EA446178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446178);
  }
  return result;
}

unint64_t sub_1C6A861CC()
{
  unint64_t result = qword_1EA446180;
  if (!qword_1EA446180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446180);
  }
  return result;
}

unint64_t sub_1C6A8621C()
{
  unint64_t result = qword_1EA446188;
  if (!qword_1EA446188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446188);
  }
  return result;
}

unint64_t sub_1C6A8626C()
{
  unint64_t result = qword_1EA446190;
  if (!qword_1EA446190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446190);
  }
  return result;
}

unint64_t sub_1C6A862BC()
{
  unint64_t result = qword_1EA446198;
  if (!qword_1EA446198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA446198);
  }
  return result;
}

unint64_t sub_1C6A8630C()
{
  unint64_t result = qword_1EA4461A0;
  if (!qword_1EA4461A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461A0);
  }
  return result;
}

unint64_t sub_1C6A8635C()
{
  unint64_t result = qword_1EA4461A8;
  if (!qword_1EA4461A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461A8);
  }
  return result;
}

unint64_t sub_1C6A863A8()
{
  unint64_t result = qword_1EA4461B0;
  if (!qword_1EA4461B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_19()
{
  return sub_1C6A8A3C0();
}

uint64_t OUTLINED_FUNCTION_4_16()
{
  return sub_1C6A8A470();
}

void OUTLINED_FUNCTION_5_16(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_14()
{
  return v0;
}

unsigned char *storeEnumTagSinglePayload for UnwrapError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C6A86508);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnwrapError()
{
  return &type metadata for UnwrapError;
}

unint64_t sub_1C6A86540(uint64_t a1)
{
  unint64_t result = sub_1C6A1A97C();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1C6A86568@<X0>(uint64_t a1@<X8>)
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0A9F0);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = &v19[-v6];
  id v8 = objc_msgSend(self, sel_defaultManager);
  v20[0] = 0;
  id v9 = objc_msgSend(v8, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 1, 0, 1, v20);

  id v10 = v20[0];
  if (v9)
  {
    sub_1C6A889D0();
    id v11 = v10;

    uint64_t v12 = sub_1C6A88A20();
    uint64_t v13 = (uint64_t)v7;
    uint64_t v14 = 0;
  }
  else
  {
    id v15 = v20[0];
    uint64_t v16 = (void *)sub_1C6A88970();

    swift_willThrow();
    uint64_t v12 = sub_1C6A88A20();
    uint64_t v13 = (uint64_t)v7;
    uint64_t v14 = 1;
  }
  __swift_storeEnumTagSinglePayload(v13, v14, 1, v12);
  sub_1C6A48FFC((uint64_t)v7, (uint64_t)v5);
  sub_1C6A88A20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v12) == 1)
  {
    sub_1C6A86A90((uint64_t)v7);
    sub_1C6A86A90((uint64_t)v5);
    uint64_t v17 = 1;
  }
  else
  {
    sub_1C6A889B0();
    sub_1C6A86A90((uint64_t)v7);
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v12 - 8) + 8))(v5, v12);
    uint64_t v17 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v17, 1, v12);
}

BOOL sub_1C6A867B8()
{
  uint64_t v0 = sub_1C6A8A3B0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_1C6A86810@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_1C6A867B8();
  *a1 = result;
  return result;
}

void sub_1C6A86848(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

unint64_t sub_1C6A86870()
{
  unint64_t result = qword_1EA4461C0;
  if (!qword_1EA4461C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461C0);
  }
  return result;
}

uint64_t sub_1C6A868BC()
{
  uint64_t result = sub_1C6A89C90();
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v1 = result;
  uint64_t v2 = sub_1C6A86A1C(result, 0);
  uint64_t v3 = sub_1C6A86960(&v4, v2 + 4, v1, 0xD000000000000010, 0x80000001C6A94130);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 != (void *)v1)
  {
    __break(1u);
LABEL_4:
    uint64_t v2 = (void *)MEMORY[0x1E4FBC860];
  }
  off_1EBC09600 = v2;
  return result;
}

void *sub_1C6A86960(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *uint64_t v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    id v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_1C6A89D30();
      if (!v11) {
        break;
      }
      ++v9;
      *id v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_1C6A86A1C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC099A0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
  return v4;
}

uint64_t sub_1C6A86A90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0A9F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C6A86AF0(uint64_t a1, void *a2)
{
  if (qword_1EBC0A9D8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C6A899E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBC0B270);
  uint64_t v6 = sub_1C6A899D0();
  os_log_type_t v7 = sub_1C6A8A000();
  if (OUTLINED_FUNCTION_6_19(v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C69F1000, v6, v2, "Report unknown error to viewService", v8, 2u);
    OUTLINED_FUNCTION_3_0();
  }

  if (qword_1EBC0A9A8 != -1) {
    uint64_t v9 = swift_once();
  }
  MEMORY[0x1F4188790](v9);
  swift_retain();
  sub_1C69F6E9C();
  swift_release();
  sub_1C6A89960();
  uint64_t v10 = (void *)sub_1C6A89930();
  OUTLINED_FUNCTION_3_20();
  sub_1C6A89950();

  if (a2)
  {
    id v11 = a2;
    id v12 = a2;
    unint64_t v13 = sub_1C6A899D0();
    os_log_type_t v14 = sub_1C6A8A020();
    if (os_log_type_enabled(v13, v14))
    {
      OUTLINED_FUNCTION_21_0();
      id v15 = (void *)OUTLINED_FUNCTION_10_17();
      OUTLINED_FUNCTION_8_17(5.7779e-34);
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_4_17(v16);
      void *v15 = v3;

      OUTLINED_FUNCTION_12_12(&dword_1C69F1000, v17, v18, "Fail to report unknown error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC093C0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
    }
  }
}

void sub_1C6A86D6C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0AB18);
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v7 = v6 - v5;
  if (qword_1EBC0A9A8 != -1) {
    swift_once();
  }
  swift_retain();
  uint64_t v8 = sub_1C6A6C444();
  swift_release();
  swift_bridgeObjectRetain();
  sub_1C6A6C7FC(v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1C6A89910();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v7, 1, v9);
  sub_1C6A4C904(v7);
  if (EnumTagSinglePayload == 1)
  {
    sub_1C6A89960();
    id v30 = (id)sub_1C6A89930();
    MEMORY[0x1F4188790](v30);
    *(&v28 - 4) = a1;
    *(&v28 - 3) = a2;
    *(&v28 - 2) = (uint64_t)&v30;
    swift_retain();
    sub_1C6A46774();
    swift_release();
    if (qword_1EBC0A9D8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1C6A899E0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EBC0B270);
    swift_bridgeObjectRetain_n();
    unint64_t v21 = (void *)sub_1C6A899D0();
    os_log_type_t v22 = sub_1C6A8A000();
    if (OUTLINED_FUNCTION_6_19(v22))
    {
      OUTLINED_FUNCTION_21_0();
      uint64_t v29 = swift_slowAlloc();
      OUTLINED_FUNCTION_9_19(4.8149e-34);
      uint64_t v24 = v23 | 0x6C0000u;
      if (v16)
      {
        a1 = v24;
        unint64_t v25 = 0xE300000000000000;
      }
      else
      {
        unint64_t v25 = a2;
      }
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_1C69F5A0C(a1, v25, &v29);
      sub_1C6A8A180();
      OUTLINED_FUNCTION_5_17();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_13_12(&dword_1C69F1000, v26, v27, "Succeed to get siriRemembersView for accountId: %s");
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      OUTLINED_FUNCTION_5_17();
    }
  }
  else
  {
    if (qword_1EBC0A9D8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1C6A899E0();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EBC0B270);
    swift_bridgeObjectRetain_n();
    id v12 = (void *)sub_1C6A899D0();
    os_log_type_t v13 = sub_1C6A8A000();
    if (OUTLINED_FUNCTION_6_19(v13))
    {
      OUTLINED_FUNCTION_21_0();
      id v30 = (id)swift_slowAlloc();
      OUTLINED_FUNCTION_9_19(4.8149e-34);
      uint64_t v15 = v14 | 0x6C0000u;
      if (v16)
      {
        a1 = v15;
        unint64_t v17 = 0xE300000000000000;
      }
      else
      {
        unint64_t v17 = a2;
      }
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1C69F5A0C(a1, v17, (uint64_t *)&v30);
      sub_1C6A8A180();
      OUTLINED_FUNCTION_5_17();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_13_12(&dword_1C69F1000, v18, v19, "Skip to get siriRemembersView for %s");
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {

      OUTLINED_FUNCTION_5_17();
    }
  }
}

void sub_1C6A87384(void *a1)
{
  if (qword_1EBC0A9D8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1C6A899E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EBC0B270);
  uint64_t v4 = sub_1C6A899D0();
  os_log_type_t v5 = sub_1C6A8A000();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v1 = 8;
    uint64_t v6 = (uint8_t *)OUTLINED_FUNCTION_10_17();
    *(_DWORD *)uint64_t v6 = 67109120;
    sub_1C6A8A180();
    _os_log_impl(&dword_1C69F1000, v4, v5, "Report SQLite error to viewService with %d", v6, 8u);
    OUTLINED_FUNCTION_3_0();
  }

  if (qword_1EBC0A9A8 != -1) {
    uint64_t v7 = swift_once();
  }
  MEMORY[0x1F4188790](v7);
  swift_retain();
  sub_1C69F6E9C();
  swift_release();
  sub_1C6A89960();
  uint64_t v8 = (void *)sub_1C6A89930();
  OUTLINED_FUNCTION_3_20();
  sub_1C6A89940();

  if (a1)
  {
    id v9 = a1;
    id v10 = a1;
    uint64_t v11 = sub_1C6A899D0();
    os_log_type_t v12 = sub_1C6A8A020();
    if (os_log_type_enabled(v11, v12))
    {
      OUTLINED_FUNCTION_21_0();
      os_log_type_t v13 = (void *)OUTLINED_FUNCTION_10_17();
      OUTLINED_FUNCTION_8_17(5.7779e-34);
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_4_17(v14);
      *os_log_type_t v13 = v1;

      OUTLINED_FUNCTION_12_12(&dword_1C69F1000, v15, v16, "Fail to report SQLite error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC093C0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_3_0();
    }
    else
    {
    }
  }
}

uint64_t sub_1C6A87634@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_1C6A89900();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA4461D0);
  OUTLINED_FUNCTION_0();
  uint64_t v22 = v10;
  uint64_t v23 = v9;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for IPInteractionWithEntity();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_2_0();
  unint64_t v17 = (uint64_t *)(v16 - v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C6A88250();
  sub_1C6A8A6C0();
  if (v24) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  *unint64_t v17 = sub_1C6A8A440();
  v17[1] = sub_1C6A8A400();
  v17[2] = v18;
  sub_1C6A8829C(&qword_1EA4461E0, MEMORY[0x1E4F6FAF8]);
  sub_1C6A8A430();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v13, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))((char *)v17 + *(int *)(v14 + 24), v8, v3);
  sub_1C6A882E4((uint64_t)v17, a2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1C6A88348((uint64_t)v17);
}

uint64_t sub_1C6A878F4(uint64_t a1)
{
  unint64_t v2 = sub_1C6A88250();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C6A87930(uint64_t a1)
{
  unint64_t v2 = sub_1C6A88250();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C6A8796C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C6A87634(a1, a2);
}

uint64_t sub_1C6A87984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C6A8829C(&qword_1EA4461C8, (void (*)(uint64_t))type metadata accessor for IPInteractionWithEntity);

  return MEMORY[0x1F411AC60](a1, a2, a3, v6);
}

uint64_t sub_1C6A87A18()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBC0AB20);
  sub_1C6A89910();
  sub_1C6A1A2D8();
  uint64_t v0 = sub_1C6A89B10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0A9E8);
  swift_allocObject();
  uint64_t result = sub_1C69F867C(v0);
  qword_1EBC0B268 = result;
  return result;
}

void sub_1C6A87A9C(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0AB18);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *a4;
  sub_1C6A89920();

  if (!v4)
  {
    uint64_t v12 = sub_1C6A89910();
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    swift_bridgeObjectRetain();
    sub_1C6A6C68C((uint64_t)v10, a2, a3);
  }
}

uint64_t sub_1C6A87B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBC0AB18);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1C6A89910();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  swift_bridgeObjectRetain();
  return sub_1C6A6C68C(v8, a2, a3);
}

uint64_t sub_1C6A87C34(uint64_t a1)
{
  return sub_1C6A87B88(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1C6A87C50(uint64_t a1)
{
  sub_1C6A87A9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(id **)(v1 + 32));
}

uint64_t *sub_1C6A87C70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1C6A89900();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    swift_bridgeObjectRetain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1C6A87D60(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1C6A89900();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1C6A87DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1C6A89900();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_1C6A87E78(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C6A89900();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1C6A87F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1C6A89900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1C6A87FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1C6A89900();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_1C6A88034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C6A88048);
}

uint64_t sub_1C6A88048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1C6A89900();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_1C6A880D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C6A880E4);
}

uint64_t sub_1C6A880E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1C6A89900();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for IPInteractionWithEntity()
{
  uint64_t result = qword_1EBC09780;
  if (!qword_1EBC09780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C6A881AC()
{
  uint64_t result = sub_1C6A89900();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1C6A88250()
{
  unint64_t result = qword_1EA4461D8;
  if (!qword_1EA4461D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461D8);
  }
  return result;
}

uint64_t sub_1C6A8829C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C6A882E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IPInteractionWithEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C6A88348(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IPInteractionWithEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for IPInteractionWithEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1C6A88470);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IPInteractionWithEntity.CodingKeys()
{
  return &type metadata for IPInteractionWithEntity.CodingKeys;
}

unint64_t sub_1C6A884AC()
{
  unint64_t result = qword_1EA4461E8;
  if (!qword_1EA4461E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461E8);
  }
  return result;
}

unint64_t sub_1C6A884FC()
{
  unint64_t result = qword_1EA4461F0;
  if (!qword_1EA4461F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461F0);
  }
  return result;
}

unint64_t sub_1C6A8854C()
{
  unint64_t result = qword_1EA4461F8;
  if (!qword_1EA4461F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA4461F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  return 0x656D655269726973;
}

uint64_t OUTLINED_FUNCTION_4_17(uint64_t a1)
{
  *(void *)(v1 - 80) = a1;
  return sub_1C6A8A180();
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_6_19(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_8_17(float a1)
{
  *uint64_t v1 = a1;
  return v2;
}

void OUTLINED_FUNCTION_9_19(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t OUTLINED_FUNCTION_10_17()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_12_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_13_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_1C6A886B0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1C6A886C0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1C6A886D0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1C6A886E0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C6A886F0()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C6A88700()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C6A88710()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1C6A88720()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1C6A88730()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1C6A88740()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1C6A88750()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1C6A88760()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1C6A88770()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1C6A88780()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C6A88790()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C6A887A0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C6A887B0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1C6A887C0()
{
  return MEMORY[0x1F40E3858]();
}

uint64_t sub_1C6A887D0()
{
  return MEMORY[0x1F40E3868]();
}

uint64_t sub_1C6A887E0()
{
  return MEMORY[0x1F40E3890]();
}

uint64_t sub_1C6A887F0()
{
  return MEMORY[0x1F40E38A0]();
}

uint64_t sub_1C6A88800()
{
  return MEMORY[0x1F40E38B8]();
}

uint64_t sub_1C6A88810()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1C6A88820()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1C6A88830()
{
  return MEMORY[0x1F40E3920]();
}

uint64_t sub_1C6A88840()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1C6A88850()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1C6A88860()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1C6A88870()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1C6A88880()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1C6A88890()
{
  return MEMORY[0x1F40E39E8]();
}

uint64_t sub_1C6A888A0()
{
  return MEMORY[0x1F40E39F8]();
}

uint64_t sub_1C6A888B0()
{
  return MEMORY[0x1F40E3A20]();
}

uint64_t sub_1C6A888C0()
{
  return MEMORY[0x1F40E3A40]();
}

uint64_t sub_1C6A888D0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1C6A888E0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1C6A888F0()
{
  return MEMORY[0x1F40E42C0]();
}

uint64_t sub_1C6A88900()
{
  return MEMORY[0x1F40E42D8]();
}

uint64_t sub_1C6A88910()
{
  return MEMORY[0x1F40E4300]();
}

uint64_t sub_1C6A88920()
{
  return MEMORY[0x1F40E4330]();
}

uint64_t sub_1C6A88930()
{
  return MEMORY[0x1F40E4340]();
}

uint64_t sub_1C6A88940()
{
  return MEMORY[0x1F40E4388]();
}

uint64_t sub_1C6A88950()
{
  return MEMORY[0x1F40E4390]();
}

uint64_t sub_1C6A88960()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1C6A88970()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C6A88980()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1C6A88990()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1C6A889A0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C6A889B0()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1C6A889C0()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1C6A889D0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C6A889E0()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1C6A889F0()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1C6A88A00()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C6A88A10()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1C6A88A20()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C6A88A30()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1C6A88A40()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1C6A88A50()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1C6A88A60()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1C6A88A70()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1C6A88A80()
{
  return MEMORY[0x1F40E4CC8]();
}

uint64_t sub_1C6A88A90()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1C6A88AA0()
{
  return MEMORY[0x1F40E4D00]();
}

uint64_t sub_1C6A88AB0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C6A88AC0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C6A88AD0()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1C6A88AE0()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1C6A88AF0()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1C6A88B00()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1C6A88B10()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1C6A88B20()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1C6A88B30()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1C6A88B40()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1C6A88B50()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1C6A88B60()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1C6A88B70()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1C6A88B80()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1C6A88B90()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1C6A88BA0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1C6A88BB0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1C6A88BC0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C6A88BD0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C6A88BE0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C6A88BF0()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1C6A88C00()
{
  return MEMORY[0x1F40E58C0]();
}

uint64_t sub_1C6A88C10()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1C6A88C20()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1C6A88C30()
{
  return MEMORY[0x1F4187498]();
}

uint64_t sub_1C6A88C40()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1C6A88C50()
{
  return MEMORY[0x1F411A4A8]();
}

uint64_t sub_1C6A88C60()
{
  return MEMORY[0x1F411A4B0]();
}

uint64_t sub_1C6A88C70()
{
  return MEMORY[0x1F411A4B8]();
}

uint64_t sub_1C6A88C80()
{
  return MEMORY[0x1F411A4C0]();
}

uint64_t sub_1C6A88C90()
{
  return MEMORY[0x1F411A4C8]();
}

uint64_t sub_1C6A88CA0()
{
  return MEMORY[0x1F411A4D8]();
}

uint64_t sub_1C6A88CB0()
{
  return MEMORY[0x1F411A4E8]();
}

uint64_t sub_1C6A88CC0()
{
  return MEMORY[0x1F411A500]();
}

uint64_t sub_1C6A88CD0()
{
  return MEMORY[0x1F411A560]();
}

uint64_t sub_1C6A88CE0()
{
  return MEMORY[0x1F411A570]();
}

uint64_t sub_1C6A88CF0()
{
  return MEMORY[0x1F411A5C8]();
}

uint64_t sub_1C6A88D00()
{
  return MEMORY[0x1F411A728]();
}

uint64_t sub_1C6A88D20()
{
  return MEMORY[0x1F411A800]();
}

uint64_t sub_1C6A88D30()
{
  return MEMORY[0x1F411A808]();
}

uint64_t sub_1C6A88D40()
{
  return MEMORY[0x1F411A810]();
}

uint64_t sub_1C6A88D50()
{
  return MEMORY[0x1F411A818]();
}

uint64_t sub_1C6A88D60()
{
  return MEMORY[0x1F411A820]();
}

uint64_t sub_1C6A88D70()
{
  return MEMORY[0x1F411A828]();
}

uint64_t sub_1C6A88D80()
{
  return MEMORY[0x1F411A830]();
}

uint64_t sub_1C6A88D90()
{
  return MEMORY[0x1F411A878]();
}

uint64_t sub_1C6A88DA0()
{
  return MEMORY[0x1F411A898]();
}

uint64_t sub_1C6A88DB0()
{
  return MEMORY[0x1F411A8A0]();
}

uint64_t sub_1C6A88DC0()
{
  return MEMORY[0x1F411A8B0]();
}

uint64_t sub_1C6A88DD0()
{
  return MEMORY[0x1F411A8B8]();
}

uint64_t sub_1C6A88DE0()
{
  return MEMORY[0x1F411A8C8]();
}

uint64_t sub_1C6A88DF0()
{
  return MEMORY[0x1F411A8D0]();
}

uint64_t sub_1C6A88E00()
{
  return MEMORY[0x1F411A8D8]();
}

uint64_t sub_1C6A88E10()
{
  return MEMORY[0x1F411A8E8]();
}

uint64_t sub_1C6A88E20()
{
  return MEMORY[0x1F411A9A0]();
}

uint64_t sub_1C6A88E30()
{
  return MEMORY[0x1F411A9A8]();
}

uint64_t sub_1C6A88E40()
{
  return MEMORY[0x1F411A9B0]();
}

uint64_t sub_1C6A88E50()
{
  return MEMORY[0x1F411AA00]();
}

uint64_t sub_1C6A88E60()
{
  return MEMORY[0x1F411AA10]();
}

uint64_t sub_1C6A88E70()
{
  return MEMORY[0x1F411AA28]();
}

uint64_t sub_1C6A88E80()
{
  return MEMORY[0x1F411AA30]();
}

uint64_t sub_1C6A88E90()
{
  return MEMORY[0x1F411AA38]();
}

uint64_t sub_1C6A88EA0()
{
  return MEMORY[0x1F411AA60]();
}

uint64_t sub_1C6A88EB0()
{
  return MEMORY[0x1F411AA68]();
}

uint64_t sub_1C6A88EC0()
{
  return MEMORY[0x1F411AA70]();
}

uint64_t sub_1C6A88ED0()
{
  return MEMORY[0x1F411AA78]();
}

uint64_t sub_1C6A88EE0()
{
  return MEMORY[0x1F411AA80]();
}

uint64_t sub_1C6A88EF0()
{
  return MEMORY[0x1F411AA88]();
}

uint64_t sub_1C6A88F00()
{
  return MEMORY[0x1F411AA90]();
}

uint64_t sub_1C6A88F10()
{
  return MEMORY[0x1F411AAC0]();
}

uint64_t sub_1C6A88F20()
{
  return MEMORY[0x1F411AAE8]();
}

uint64_t sub_1C6A88F30()
{
  return MEMORY[0x1F411AAF0]();
}

uint64_t sub_1C6A88F40()
{
  return MEMORY[0x1F411AAF8]();
}

uint64_t sub_1C6A88F50()
{
  return MEMORY[0x1F411AB00]();
}

uint64_t sub_1C6A88F60()
{
  return MEMORY[0x1F411AB08]();
}

uint64_t sub_1C6A88F70()
{
  return MEMORY[0x1F411AB10]();
}

uint64_t sub_1C6A88F80()
{
  return MEMORY[0x1F411AB18]();
}

uint64_t sub_1C6A88F90()
{
  return MEMORY[0x1F411AB20]();
}

uint64_t sub_1C6A88FA0()
{
  return MEMORY[0x1F411AB38]();
}

uint64_t sub_1C6A88FB0()
{
  return MEMORY[0x1F411AB40]();
}

uint64_t sub_1C6A88FC0()
{
  return MEMORY[0x1F411AB68]();
}

uint64_t sub_1C6A88FD0()
{
  return MEMORY[0x1F411AB70]();
}

uint64_t sub_1C6A88FE0()
{
  return MEMORY[0x1F411AB98]();
}

uint64_t sub_1C6A88FF0()
{
  return MEMORY[0x1F411ABD0]();
}

uint64_t sub_1C6A89000()
{
  return MEMORY[0x1F411ABD8]();
}

uint64_t sub_1C6A89010()
{
  return MEMORY[0x1F411ABE0]();
}

uint64_t sub_1C6A89020()
{
  return MEMORY[0x1F411ABE8]();
}

uint64_t sub_1C6A89030()
{
  return MEMORY[0x1F411ABF0]();
}

uint64_t sub_1C6A89050()
{
  return MEMORY[0x1F411AC18]();
}

uint64_t sub_1C6A89060()
{
  return MEMORY[0x1F411AC20]();
}

uint64_t sub_1C6A89070()
{
  return MEMORY[0x1F411AC28]();
}

uint64_t sub_1C6A89080()
{
  return MEMORY[0x1F411AC30]();
}

uint64_t sub_1C6A890A0()
{
  return MEMORY[0x1F411AC68]();
}

uint64_t sub_1C6A890B0()
{
  return MEMORY[0x1F411AC70]();
}

uint64_t sub_1C6A890C0()
{
  return MEMORY[0x1F411AC80]();
}

uint64_t sub_1C6A890D0()
{
  return MEMORY[0x1F411AC88]();
}

uint64_t sub_1C6A890E0()
{
  return MEMORY[0x1F411AC90]();
}

uint64_t sub_1C6A890F0()
{
  return MEMORY[0x1F411AC98]();
}

uint64_t sub_1C6A89100()
{
  return MEMORY[0x1F411ACA0]();
}

uint64_t sub_1C6A89110()
{
  return MEMORY[0x1F411ACB8]();
}

uint64_t sub_1C6A89120()
{
  return MEMORY[0x1F411ACC0]();
}

uint64_t sub_1C6A89130()
{
  return MEMORY[0x1F411ACC8]();
}

uint64_t sub_1C6A89140()
{
  return MEMORY[0x1F411ACD0]();
}

uint64_t sub_1C6A89150()
{
  return MEMORY[0x1F411ACD8]();
}

uint64_t sub_1C6A89160()
{
  return MEMORY[0x1F411ACE0]();
}

uint64_t sub_1C6A89170()
{
  return MEMORY[0x1F411ACE8]();
}

uint64_t sub_1C6A89180()
{
  return MEMORY[0x1F411ACF8]();
}

uint64_t sub_1C6A89190()
{
  return MEMORY[0x1F411AD00]();
}

uint64_t sub_1C6A891A0()
{
  return MEMORY[0x1F411AD08]();
}

uint64_t sub_1C6A891B0()
{
  return MEMORY[0x1F411AD10]();
}

uint64_t sub_1C6A891C0()
{
  return MEMORY[0x1F411AD20]();
}

uint64_t sub_1C6A891D0()
{
  return MEMORY[0x1F411AD28]();
}

uint64_t sub_1C6A891E0()
{
  return MEMORY[0x1F411AD30]();
}

uint64_t sub_1C6A891F0()
{
  return MEMORY[0x1F411AD58]();
}

uint64_t sub_1C6A89200()
{
  return MEMORY[0x1F411AD68]();
}

uint64_t sub_1C6A89210()
{
  return MEMORY[0x1F411AD70]();
}

uint64_t sub_1C6A89220()
{
  return MEMORY[0x1F411AD78]();
}

uint64_t sub_1C6A89230()
{
  return MEMORY[0x1F411AD80]();
}

uint64_t sub_1C6A89240()
{
  return MEMORY[0x1F411AD90]();
}

uint64_t sub_1C6A89250()
{
  return MEMORY[0x1F411ADA8]();
}

uint64_t sub_1C6A89260()
{
  return MEMORY[0x1F411ADB0]();
}

uint64_t sub_1C6A89270()
{
  return MEMORY[0x1F411ADB8]();
}

uint64_t sub_1C6A89280()
{
  return MEMORY[0x1F411ADC0]();
}

uint64_t sub_1C6A89290()
{
  return MEMORY[0x1F411ADD0]();
}

uint64_t sub_1C6A892A0()
{
  return MEMORY[0x1F411ADD8]();
}

uint64_t sub_1C6A892B0()
{
  return MEMORY[0x1F411ADE0]();
}

uint64_t sub_1C6A892C0()
{
  return MEMORY[0x1F411ADE8]();
}

uint64_t sub_1C6A892D0()
{
  return MEMORY[0x1F411ADF0]();
}

uint64_t sub_1C6A892E0()
{
  return MEMORY[0x1F411ADF8]();
}

uint64_t sub_1C6A892F0()
{
  return MEMORY[0x1F411AE10]();
}

uint64_t sub_1C6A89300()
{
  return MEMORY[0x1F411AE18]();
}

uint64_t sub_1C6A89310()
{
  return MEMORY[0x1F411AE20]();
}

uint64_t sub_1C6A89320()
{
  return MEMORY[0x1F411AE30]();
}

uint64_t sub_1C6A89330()
{
  return MEMORY[0x1F411AE50]();
}

uint64_t sub_1C6A89340()
{
  return MEMORY[0x1F411AE68]();
}

uint64_t sub_1C6A89350()
{
  return MEMORY[0x1F411AE70]();
}

uint64_t sub_1C6A89360()
{
  return MEMORY[0x1F411AE88]();
}

uint64_t sub_1C6A89370()
{
  return MEMORY[0x1F411AEA0]();
}

uint64_t sub_1C6A89380()
{
  return MEMORY[0x1F411AEA8]();
}

uint64_t sub_1C6A89390()
{
  return MEMORY[0x1F411AED0]();
}

uint64_t sub_1C6A893A0()
{
  return MEMORY[0x1F411AEF8]();
}

uint64_t sub_1C6A893B0()
{
  return MEMORY[0x1F411AF00]();
}

uint64_t sub_1C6A893C0()
{
  return MEMORY[0x1F411AF10]();
}

uint64_t sub_1C6A893D0()
{
  return MEMORY[0x1F411AF28]();
}

uint64_t sub_1C6A893E0()
{
  return MEMORY[0x1F411AF58]();
}

uint64_t sub_1C6A893F0()
{
  return MEMORY[0x1F411AF78]();
}

uint64_t sub_1C6A89400()
{
  return MEMORY[0x1F411AF90]();
}

uint64_t sub_1C6A89410()
{
  return MEMORY[0x1F411AF98]();
}

uint64_t sub_1C6A89420()
{
  return MEMORY[0x1F411AFC8]();
}

uint64_t sub_1C6A89440()
{
  return MEMORY[0x1F411AFE8]();
}

uint64_t sub_1C6A89460()
{
  return MEMORY[0x1F411B008]();
}

uint64_t sub_1C6A89490()
{
  return MEMORY[0x1F411B048]();
}

uint64_t sub_1C6A894A0()
{
  return MEMORY[0x1F411B058]();
}

uint64_t sub_1C6A894B0()
{
  return MEMORY[0x1F411B060]();
}

uint64_t sub_1C6A894C0()
{
  return MEMORY[0x1F411B070]();
}

uint64_t sub_1C6A894D0()
{
  return MEMORY[0x1F411B090]();
}

uint64_t sub_1C6A894E0()
{
  return MEMORY[0x1F411B098]();
}

uint64_t sub_1C6A894F0()
{
  return MEMORY[0x1F411B0B0]();
}

uint64_t sub_1C6A89500()
{
  return MEMORY[0x1F411B110]();
}

uint64_t sub_1C6A89510()
{
  return MEMORY[0x1F411B120]();
}

uint64_t sub_1C6A89520()
{
  return MEMORY[0x1F411B128]();
}

uint64_t sub_1C6A89530()
{
  return MEMORY[0x1F411B130]();
}

uint64_t sub_1C6A89540()
{
  return MEMORY[0x1F411B158]();
}

uint64_t sub_1C6A89550()
{
  return MEMORY[0x1F411B160]();
}

uint64_t sub_1C6A89560()
{
  return MEMORY[0x1F411B178]();
}

uint64_t sub_1C6A89570()
{
  return MEMORY[0x1F411B180]();
}

uint64_t sub_1C6A89580()
{
  return MEMORY[0x1F411B190]();
}

uint64_t sub_1C6A89590()
{
  return MEMORY[0x1F411B1A0]();
}

uint64_t sub_1C6A895A0()
{
  return MEMORY[0x1F411B1A8]();
}

uint64_t sub_1C6A895B0()
{
  return MEMORY[0x1F411B228]();
}

uint64_t sub_1C6A895C0()
{
  return MEMORY[0x1F411B230]();
}

uint64_t sub_1C6A895D0()
{
  return MEMORY[0x1F411B238]();
}

uint64_t sub_1C6A895E0()
{
  return MEMORY[0x1F411B290]();
}

uint64_t sub_1C6A895F0()
{
  return MEMORY[0x1F411B298]();
}

uint64_t sub_1C6A89600()
{
  return MEMORY[0x1F411B2A0]();
}

uint64_t sub_1C6A89610()
{
  return MEMORY[0x1F411B2A8]();
}

uint64_t sub_1C6A89620()
{
  return MEMORY[0x1F411B2B0]();
}

uint64_t sub_1C6A89630()
{
  return MEMORY[0x1F411B2B8]();
}

uint64_t sub_1C6A89640()
{
  return MEMORY[0x1F411B2C8]();
}

uint64_t sub_1C6A89650()
{
  return MEMORY[0x1F411B2E0]();
}

uint64_t sub_1C6A89660()
{
  return MEMORY[0x1F411B2E8]();
}

uint64_t sub_1C6A89670()
{
  return MEMORY[0x1F411B2F0]();
}

uint64_t sub_1C6A89680()
{
  return MEMORY[0x1F411B308]();
}

uint64_t sub_1C6A89690()
{
  return MEMORY[0x1F411B348]();
}

uint64_t sub_1C6A896A0()
{
  return MEMORY[0x1F411B358]();
}

uint64_t sub_1C6A896B0()
{
  return MEMORY[0x1F411B368]();
}

uint64_t sub_1C6A896C0()
{
  return MEMORY[0x1F411B388]();
}

uint64_t sub_1C6A896D0()
{
  return MEMORY[0x1F411B398]();
}

uint64_t sub_1C6A896E0()
{
  return MEMORY[0x1F411B3A8]();
}

uint64_t sub_1C6A896F0()
{
  return MEMORY[0x1F411B3B0]();
}

uint64_t sub_1C6A89700()
{
  return MEMORY[0x1F411B3C8]();
}

uint64_t sub_1C6A89710()
{
  return MEMORY[0x1F411B3D8]();
}

uint64_t sub_1C6A89720()
{
  return MEMORY[0x1F411B418]();
}

uint64_t sub_1C6A89730()
{
  return MEMORY[0x1F411B420]();
}

uint64_t sub_1C6A89740()
{
  return MEMORY[0x1F411B428]();
}

uint64_t sub_1C6A89750()
{
  return MEMORY[0x1F411B430]();
}

uint64_t sub_1C6A89760()
{
  return MEMORY[0x1F4125790]();
}

uint64_t sub_1C6A89770()
{
  return MEMORY[0x1F4125798]();
}

uint64_t sub_1C6A89780()
{
  return MEMORY[0x1F41257A8]();
}

uint64_t sub_1C6A89790()
{
  return MEMORY[0x1F41257C8]();
}

uint64_t sub_1C6A897A0()
{
  return MEMORY[0x1F41257D0]();
}

uint64_t sub_1C6A897B0()
{
  return MEMORY[0x1F41257D8]();
}

uint64_t sub_1C6A897C0()
{
  return MEMORY[0x1F41257E8]();
}

uint64_t sub_1C6A897D0()
{
  return MEMORY[0x1F41257F0]();
}

uint64_t sub_1C6A897E0()
{
  return MEMORY[0x1F41257F8]();
}

uint64_t sub_1C6A897F0()
{
  return MEMORY[0x1F4125808]();
}

uint64_t sub_1C6A89800()
{
  return MEMORY[0x1F4125810]();
}

uint64_t sub_1C6A89810()
{
  return MEMORY[0x1F4125818]();
}

uint64_t sub_1C6A89820()
{
  return MEMORY[0x1F4125820]();
}

uint64_t sub_1C6A89830()
{
  return MEMORY[0x1F4125828]();
}

uint64_t sub_1C6A89840()
{
  return MEMORY[0x1F4125830]();
}

uint64_t sub_1C6A89850()
{
  return MEMORY[0x1F4125838]();
}

uint64_t sub_1C6A89860()
{
  return MEMORY[0x1F4125840]();
}

uint64_t sub_1C6A89870()
{
  return MEMORY[0x1F4125848]();
}

uint64_t sub_1C6A89880()
{
  return MEMORY[0x1F4125860]();
}

uint64_t sub_1C6A89890()
{
  return MEMORY[0x1F4125870]();
}

uint64_t sub_1C6A898A0()
{
  return MEMORY[0x1F4125878]();
}

uint64_t sub_1C6A898B0()
{
  return MEMORY[0x1F41258A0]();
}

uint64_t sub_1C6A898C0()
{
  return MEMORY[0x1F41258A8]();
}

uint64_t sub_1C6A898D0()
{
  return MEMORY[0x1F41258B0]();
}

uint64_t sub_1C6A898E0()
{
  return MEMORY[0x1F41258D0]();
}

uint64_t sub_1C6A898F0()
{
  return MEMORY[0x1F41258D8]();
}

uint64_t sub_1C6A89900()
{
  return MEMORY[0x1F41258E8]();
}

uint64_t sub_1C6A89910()
{
  return MEMORY[0x1F41258F0]();
}

uint64_t sub_1C6A89920()
{
  return MEMORY[0x1F41258F8]();
}

uint64_t sub_1C6A89930()
{
  return MEMORY[0x1F41259F8]();
}

uint64_t sub_1C6A89940()
{
  return MEMORY[0x1F4125A10]();
}

uint64_t sub_1C6A89950()
{
  return MEMORY[0x1F4125A18]();
}

uint64_t sub_1C6A89960()
{
  return MEMORY[0x1F4125A20]();
}

uint64_t sub_1C6A89970()
{
  return MEMORY[0x1F4150DA8]();
}

uint64_t sub_1C6A89980()
{
  return MEMORY[0x1F4150DB0]();
}

uint64_t sub_1C6A89990()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1C6A899A0()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1C6A899B0()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1C6A899C0()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C6A899D0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C6A899E0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C6A899F0()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1C6A89A00()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1C6A89A10()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1C6A89A20()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1C6A89A30()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C6A89A40()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1C6A89A50()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C6A89A60()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C6A89A70()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C6A89A80()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1C6A89A90()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1C6A89AA0()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1C6A89AB0()
{
  return MEMORY[0x1F40E0490]();
}

uint64_t sub_1C6A89AC0()
{
  return MEMORY[0x1F40E04A0]();
}

uint64_t sub_1C6A89AD0()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1C6A89AE0()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1C6A89AF0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C6A89B00()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C6A89B10()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C6A89B20()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1C6A89B30()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1C6A89B40()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C6A89B50()
{
  return MEMORY[0x1F4183690]();
}

uint64_t sub_1C6A89B60()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1C6A89B70()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C6A89B80()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1C6A89B90()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1C6A89BA0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C6A89BB0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C6A89BC0()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1C6A89BD0()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C6A89BE0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C6A89BF0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C6A89C00()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C6A89C10()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1C6A89C20()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1C6A89C30()
{
  return MEMORY[0x1F411B448]();
}

uint64_t sub_1C6A89C40()
{
  return MEMORY[0x1F411B450]();
}

uint64_t sub_1C6A89C50()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C6A89C60()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1C6A89C70()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1C6A89C80()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C6A89C90()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C6A89CA0()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1C6A89CB0()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1C6A89CC0()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C6A89CD0()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1C6A89CE0()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1C6A89CF0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C6A89D00()
{
  return MEMORY[0x1F4183A50]();
}

uint64_t sub_1C6A89D10()
{
  return MEMORY[0x1F4183A58]();
}

uint64_t sub_1C6A89D20()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1C6A89D30()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1C6A89D40()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C6A89D50()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1C6A89D60()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1C6A89D80()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1C6A89D90()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1C6A89DA0()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1C6A89DB0()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1C6A89DC0()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1C6A89DD0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1C6A89DE0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1C6A89DF0()
{
  return MEMORY[0x1F411B460]();
}

uint64_t sub_1C6A89E00()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1C6A89E10()
{
  return MEMORY[0x1F4183BC0]();
}

uint64_t sub_1C6A89E20()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1C6A89E30()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1C6A89E40()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1C6A89E50()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1C6A89E60()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1C6A89E70()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C6A89E80()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C6A89E90()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C6A89EA0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C6A89EB0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1C6A89EC0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1C6A89ED0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C6A89EE0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1C6A89EF0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1C6A89F00()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C6A89F10()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1C6A89F20()
{
  return MEMORY[0x1F411B470]();
}

uint64_t sub_1C6A89F30()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1C6A89F40()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1C6A89F50()
{
  return MEMORY[0x1F411B480]();
}

uint64_t sub_1C6A89F60()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1C6A89F70()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1C6A89F80()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1C6A89F90()
{
  return MEMORY[0x1F411B498]();
}

uint64_t sub_1C6A89FA0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1C6A89FB0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1C6A89FC0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1C6A89FD0()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1C6A89FE0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1C6A89FF0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1C6A8A000()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C6A8A010()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C6A8A020()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C6A8A030()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1C6A8A040()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1C6A8A050()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C6A8A060()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C6A8A070()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1C6A8A080()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1C6A8A090()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C6A8A0A0()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1C6A8A0B0()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1C6A8A0C0()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1C6A8A0D0()
{
  return MEMORY[0x1F41871F0]();
}

uint64_t sub_1C6A8A0E0()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1C6A8A0F0()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1C6A8A100()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C6A8A110()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C6A8A120()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1C6A8A130()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1C6A8A140()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1C6A8A150()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1C6A8A160()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1C6A8A170()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C6A8A180()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C6A8A190()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C6A8A1A0()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1C6A8A1B0()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1C6A8A1C0()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1C6A8A1D0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C6A8A1E0()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1C6A8A1F0()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1C6A8A200()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C6A8A210()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1C6A8A220()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1C6A8A230()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1C6A8A240()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1C6A8A250()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C6A8A260()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C6A8A270()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1C6A8A280()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C6A8A290()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1C6A8A2A0()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C6A8A2B0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C6A8A2C0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C6A8A2D0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C6A8A2E0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C6A8A2F0()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1C6A8A300()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C6A8A310()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C6A8A320()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1C6A8A330()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1C6A8A340()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1C6A8A350()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C6A8A360()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1C6A8A370()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C6A8A380()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C6A8A390()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C6A8A3A0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C6A8A3B0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C6A8A3C0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C6A8A3D0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C6A8A3F0()
{
  return MEMORY[0x1F4185530]();
}

uint64_t sub_1C6A8A400()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C6A8A410()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1C6A8A420()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C6A8A430()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C6A8A440()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1C6A8A450()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C6A8A460()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1C6A8A470()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C6A8A490()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C6A8A4A0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1C6A8A4B0()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C6A8A4C0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C6A8A4D0()
{
  return MEMORY[0x1F41856D0]();
}

uint64_t sub_1C6A8A4E0()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1C6A8A4F0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1C6A8A500()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1C6A8A510()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C6A8A520()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1C6A8A530()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C6A8A540()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C6A8A550()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1C6A8A560()
{
  return MEMORY[0x1F4185A60]();
}

uint64_t sub_1C6A8A570()
{
  return MEMORY[0x1F4185A68]();
}

uint64_t sub_1C6A8A580()
{
  return MEMORY[0x1F4185A78]();
}

uint64_t sub_1C6A8A590()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1C6A8A5A0()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1C6A8A5B0()
{
  return MEMORY[0x1F4185AF8]();
}

uint64_t sub_1C6A8A5C0()
{
  return MEMORY[0x1F4185B00]();
}

uint64_t sub_1C6A8A5D0()
{
  return MEMORY[0x1F4185B10]();
}

uint64_t sub_1C6A8A5E0()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1C6A8A5F0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1C6A8A600()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C6A8A610()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C6A8A620()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C6A8A630()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C6A8A640()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C6A8A650()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C6A8A660()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C6A8A670()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C6A8A680()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C6A8A690()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C6A8A6A0()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t sub_1C6A8A6B0()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1C6A8A6C0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C6A8A6D0()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1C6A8A6E0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1C6A8A710()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

uint64_t INMediaItemTypeGetName()
{
  return MEMORY[0x1F40E9B48]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x1F40E9BB0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log1p(long double __x)
{
  MEMORY[0x1F40CC890](__x);
  return result;
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1F40CEB98]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}