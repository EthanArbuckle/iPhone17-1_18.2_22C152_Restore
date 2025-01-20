uint64_t sub_237AD1ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD1EE4);
}

void *sub_237AD1EE4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_237AEE6F0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      v11 = (char *)v5 + *(int *)(a4 + 32);
      v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
      v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      v16 = (char *)v5 + *(int *)(a4 + 36);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_237AD2014(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_237AD2040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  sub_237AEE6F0();
  if (v8 <= 0x3F)
  {
    sub_237A9910C(319, a5, a6);
    if (v9 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_237AD2134(uint64_t *a1, uint64_t *a2, int *a3)
{
  v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    uint64_t *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[7];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_237AEE6F0();
    v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = v12;
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    v14 = (_OWORD *)((char *)v4 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for PBUUID(0);
    uint64_t v17 = *(void *)(v16 - 8);
    v18 = *(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48);
    if (v18(v15, 1, v16))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
      v20 = v30;
    }
    else
    {
      _OWORD *v14 = *v15;
      uint64_t v22 = *(int *)(v16 + 24);
      v23 = (char *)v14 + v22;
      v29 = v14;
      v20 = v30;
      v30(v23, (char *)v15 + v22, v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v29, 0, 1, v16);
    }
    uint64_t v24 = a3[9];
    v25 = (_OWORD *)((char *)v4 + v24);
    v26 = (_OWORD *)((char *)a2 + v24);
    if (v18(v26, 1, v16))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      _OWORD *v25 = *v26;
      v20((char *)v25 + *(int *)(v16 + 24), (char *)v26 + *(int *)(v16 + 24), v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v25, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_237AD23D0(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_237AEE6F0();
  v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v12(v4, v5);
  uint64_t v6 = a1 + a2[8];
  uint64_t v7 = type metadata accessor for PBUUID(0);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48);
  if (!v8(v6, 1, v7)) {
    v12(v6 + *(int *)(v7 + 24), v5);
  }
  uint64_t v9 = a1 + a2[9];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(v9, 1, v7);
  if (!result)
  {
    uint64_t v11 = v9 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v5);
  }
  return result;
}

uint64_t sub_237AD253C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_237AEE6F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v27 = a3;
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = (_OWORD *)(a1 + v12);
  v14 = (_OWORD *)(a2 + v12);
  uint64_t v15 = type metadata accessor for PBUUID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    uint64_t v19 = v11;
    uint64_t v20 = v10;
  }
  else
  {
    *uint64_t v13 = *v14;
    v11((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    uint64_t v21 = v11;
    uint64_t v20 = v10;
    uint64_t v19 = v21;
  }
  uint64_t v22 = *(int *)(v27 + 36);
  v23 = (_OWORD *)(a1 + v22);
  uint64_t v24 = (_OWORD *)(a2 + v22);
  if (v17(v24, 1, v15))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    _OWORD *v23 = *v24;
    v19((char *)v23 + *(int *)(v15 + 24), (char *)v24 + *(int *)(v15 + 24), v20);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v23, 0, 1, v15);
  }
  return a1;
}

uint64_t sub_237AD27A4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v27 + 24);
  v25(v7, v8);
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)(a1 + v10);
  uint64_t v12 = (char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for PBUUID(0);
  uint64_t v26 = *(void *)(v13 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v15 = v14(v11, 1, v13);
  int v16 = v14(v12, 1, v13);
  if (v15)
  {
    if (!v16)
    {
      *(void *)uint64_t v11 = *(void *)v12;
      *((void *)v11 + 1) = *((void *)v12 + 1);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(&v11[*(int *)(v13 + 24)], &v12[*(int *)(v13 + 24)], v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_237A95938((uint64_t)v11, type metadata accessor for PBUUID);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  ((void (*)(char *, char *, uint64_t))v25)(&v11[*(int *)(v13 + 24)], &v12[*(int *)(v13 + 24)], v28);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (char *)(a2 + v18);
  int v21 = v14((char *)(a1 + v18), 1, v13);
  int v22 = v14(v20, 1, v13);
  if (!v21)
  {
    if (!v22)
    {
      *uint64_t v19 = *(void *)v20;
      v19[1] = *((void *)v20 + 1);
      ((void (*)(char *, char *, uint64_t))v25)((char *)v19 + *(int *)(v13 + 24), &v20[*(int *)(v13 + 24)], v28);
      return a1;
    }
    sub_237A95938((uint64_t)v19, type metadata accessor for PBUUID);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  *uint64_t v19 = *(void *)v20;
  v19[1] = *((void *)v20 + 1);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v19 + *(int *)(v13 + 24), &v20[*(int *)(v13 + 24)], v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v13);
  return a1;
}

uint64_t sub_237AD2B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v24 = a3;
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  int v16 = *(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = v15;
  uint64_t v19 = *(int *)(v24 + 36);
  uint64_t v20 = (_OWORD *)(a1 + v19);
  int v21 = (_OWORD *)(a2 + v19);
  if (v16(v21, 1, v14))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    *uint64_t v20 = *v21;
    v10((char *)v20 + *(int *)(v14 + 24), (char *)v21 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_237AD2D5C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v27 + 40);
  v25(v7, v8);
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)(a1 + v10);
  uint64_t v12 = (char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for PBUUID(0);
  uint64_t v26 = *(void *)(v13 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v15 = v14(v11, 1, v13);
  int v16 = v14(v12, 1, v13);
  if (v15)
  {
    if (!v16)
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v11[*(int *)(v13 + 24)], &v12[*(int *)(v13 + 24)], v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_237A95938((uint64_t)v11, type metadata accessor for PBUUID);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  ((void (*)(char *, char *, uint64_t))v25)(&v11[*(int *)(v13 + 24)], &v12[*(int *)(v13 + 24)], v28);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = (_OWORD *)(a1 + v18);
  uint64_t v20 = (char *)(a2 + v18);
  int v21 = v14((char *)(a1 + v18), 1, v13);
  int v22 = v14(v20, 1, v13);
  if (!v21)
  {
    if (!v22)
    {
      *uint64_t v19 = *(_OWORD *)v20;
      ((void (*)(char *, char *, uint64_t))v25)((char *)v19 + *(int *)(v13 + 24), &v20[*(int *)(v13 + 24)], v28);
      return a1;
    }
    sub_237A95938((uint64_t)v19, type metadata accessor for PBUUID);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  *uint64_t v19 = *(_OWORD *)v20;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))((char *)v19 + *(int *)(v13 + 24), &v20[*(int *)(v13 + 24)], v28);
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v13);
  return a1;
}

uint64_t sub_237AD309C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD30B0);
}

uint64_t sub_237AD30B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_54Tm(a1, a2, a3, &qword_26893AFD0);
}

uint64_t sub_237AD30BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD30D0);
}

uint64_t sub_237AD30D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_55Tm(a1, a2, a3, a4, &qword_26893AFD0);
}

void sub_237AD30DC()
{
}

void sub_237AD30FC()
{
  sub_237AEE6F0();
  if (v0 <= 0x3F)
  {
    sub_237A9910C(319, &qword_26893B7B8, (void (*)(uint64_t))type metadata accessor for PBUUID);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_237AD31E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_237A2D3FC(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_237AEE6F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return v4;
}

uint64_t sub_237AD32D8(uint64_t a1, uint64_t a2)
{
  sub_237A2D4F8(*(void *)(a1 + 8), *(void *)(a1 + 16));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_237AEE6F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_237AD3354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_237A2D3FC(v6, v7);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t sub_237AD33F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_237A2D3FC(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_237A2D4F8(v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_237AD349C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_237AD3520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_237A2D4F8(v6, v7);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_237AD35B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD35CC);
}

uint64_t sub_237AD35CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 16) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_237AEE6F0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_237AD3688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD369C);
}

uint64_t sub_237AD369C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = sub_237AEE6F0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_237AD374C()
{
  return sub_237AD3764();
}

uint64_t sub_237AD3764()
{
  uint64_t result = sub_237AEE6F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_237AD37F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_237AEE6F0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (_OWORD *)((char *)v4 + v13);
    int v15 = (_OWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for PBUUID(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      _OWORD *v14 = *v15;
      v12((char *)v14 + *(int *)(v16 + 24), (char *)v15 + *(int *)(v16 + 24), v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_237AD39C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for PBUUID(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_237AD3AD4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_237AEE6F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (_OWORD *)((char *)a1 + v12);
  uint64_t v14 = (_OWORD *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for PBUUID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    *uint64_t v13 = *v14;
    v11((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v10);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

void *sub_237AD3C58(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v20 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  uint64_t v10 = *(void (**)(char *, char *))(v20 + 24);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      ((void (*)(char *, char *, uint64_t))v10)((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v21);
      return a1;
    }
    sub_237A95938((uint64_t)v12, type metadata accessor for PBUUID);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

_OWORD *sub_237AD3E84(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

void *sub_237AD3FF8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_237AEE6F0();
  uint64_t v21 = *(void *)(v10 - 8);
  uint64_t v22 = v10;
  uint64_t v11 = *(void (**)(char *, char *))(v21 + 40);
  v11(v8, v9);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (_OWORD *)((char *)a1 + v12);
  uint64_t v14 = (_OWORD *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for PBUUID(0);
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v9) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (!v9)
  {
    if (!v18)
    {
      *uint64_t v13 = *v14;
      ((void (*)(char *, char *, uint64_t))v11)((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v22);
      return a1;
    }
    sub_237A95938((uint64_t)v13, type metadata accessor for PBUUID);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  *uint64_t v13 = *v14;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v13 + *(int *)(v15 + 24), (char *)v14 + *(int *)(v15 + 24), v22);
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_237AD420C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD4220);
}

uint64_t sub_237AD4220(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_237AEE6F0();
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_237AD4350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD4364);
}

uint64_t sub_237AD4364(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_237AEE6F0();
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
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_237AD4494(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_237AD44BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, void (*a6)(uint64_t))
{
  sub_237AEE6F0();
  if (v8 <= 0x3F)
  {
    sub_237A9910C(319, a5, a6);
    if (v9 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for OwnershipChangeType()
{
  return &type metadata for OwnershipChangeType;
}

uint64_t *sub_237AD45B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a2[4];
    a1[3] = a2[3];
    a1[4] = v8;
    uint64_t v9 = a2[6];
    a1[5] = a2[5];
    a1[6] = v9;
    uint64_t v21 = a2[8];
    uint64_t v10 = *(int *)(a3 + 52);
    uint64_t v22 = (char *)a2 + v10;
    uint64_t v23 = (char *)a1 + v10;
    a1[7] = a2[7];
    a1[8] = v21;
    uint64_t v11 = sub_237AEE6F0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v23, v22, v11);
    uint64_t v13 = *(int *)(a3 + 56);
    uint64_t v14 = (_OWORD *)((char *)v4 + v13);
    uint64_t v15 = (_OWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for PBUUID(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      _OWORD *v14 = *v15;
      v12((char *)v14 + *(int *)(v16 + 24), (char *)v15 + *(int *)(v16 + 24), v11);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_237AD47EC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 56);
  uint64_t v7 = type metadata accessor for PBUUID(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

uint64_t sub_237AD4930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v18 = *(void *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 52);
  uint64_t v19 = (char *)(a2 + v8);
  uint64_t v20 = (char *)(a1 + v8);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v18;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v20, v19, v9);
  uint64_t v11 = *(int *)(a3 + 56);
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_237AD4B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v20 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v20 + 24);
  ((void (*)(uint64_t, uint64_t))v10)(v7, v8);
  uint64_t v11 = *(int *)(a3 + 56);
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *((void *)v12 + 1) = *((void *)v13 + 1);
      v10(&v12[*(int *)(v14 + 24)], &v13[*(int *)(v14 + 24)], v21);
      return a1;
    }
    sub_237A95938((uint64_t)v12, type metadata accessor for PBUUID);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(&v12[*(int *)(v14 + 24)], &v13[*(int *)(v14 + 24)], v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_237AD4DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 56);
  uint64_t v12 = (_OWORD *)(a1 + v11);
  uint64_t v13 = (_OWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_237AD4F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 52);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v21 = *(void *)(v9 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 56);
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for PBUUID(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  uint64_t v22 = v12;
  LODWORD(v12) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (v12)
  {
    if (!v17)
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v13;
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v22[*(int *)(v14 + 24)], &v13[*(int *)(v14 + 24)], v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v22, 0, 1, v14);
      return a1;
    }
    size_t v18 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0) - 8) + 64);
    uint64_t v19 = v22;
  }
  else
  {
    if (!v17)
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v13;
      v10((uint64_t)&v22[*(int *)(v14 + 24)], (uint64_t)&v13[*(int *)(v14 + 24)], v9);
      return a1;
    }
    sub_237A95938((uint64_t)v22, type metadata accessor for PBUUID);
    size_t v18 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0) - 8) + 64);
    uint64_t v19 = v22;
  }
  memcpy(v19, v13, v18);
  return a1;
}

uint64_t sub_237AD5250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD5264);
}

uint64_t sub_237AD5264(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_237AEE6F0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 56);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_237AD5394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD53A8);
}

uint64_t sub_237AD53A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_237AEE6F0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 56);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_237AD54D8()
{
  sub_237AEE6F0();
  if (v0 <= 0x3F)
  {
    sub_237A9910C(319, &qword_26893B7B8, (void (*)(uint64_t))type metadata accessor for PBUUID);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_237AD55E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_237AEE6F0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 32);
    uint64_t v14 = (_DWORD *)((char *)v4 + v13);
    uint64_t v15 = (_DWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for LamportTimestamp(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      _DWORD *v14 = *v15;
      v12((char *)v14 + *(int *)(v16 + 20), (char *)v15 + *(int *)(v16 + 20), v11);
      uint64_t v20 = *(int *)(v16 + 24);
      __dst = (_OWORD *)((char *)v14 + v20);
      uint64_t v21 = (_OWORD *)((char *)v15 + v20);
      uint64_t v22 = type metadata accessor for PBUUID(0);
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
        memcpy(__dst, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        _OWORD *__dst = *v21;
        v12((char *)__dst + *(int *)(v22 + 24), (char *)v21 + *(int *)(v22 + 24), v11);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
      }
      (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_237AD58B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_237AEE6F0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v12(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = type metadata accessor for LamportTimestamp(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v12(v6 + *(int *)(v7 + 20), v5);
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    uint64_t v10 = type metadata accessor for PBUUID(0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10);
    if (!result)
    {
      uint64_t v11 = v9 + *(int *)(v10 + 24);
      return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v5);
    }
  }
  return result;
}

uint64_t sub_237AD5A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_237AEE6F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = (_DWORD *)(a1 + v12);
  uint64_t v14 = (_DWORD *)(a2 + v12);
  uint64_t v15 = type metadata accessor for LamportTimestamp(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    *uint64_t v13 = *v14;
    v11((char *)v13 + *(int *)(v15 + 20), (char *)v14 + *(int *)(v15 + 20), v10);
    uint64_t v18 = *(int *)(v15 + 24);
    __dst = (_OWORD *)((char *)v13 + v18);
    uint64_t v19 = (_OWORD *)((char *)v14 + v18);
    uint64_t v20 = type metadata accessor for PBUUID(0);
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      _OWORD *__dst = *v19;
      v11((char *)__dst + *(int *)(v20 + 24), (char *)v19 + *(int *)(v20 + 24), v10);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

uint64_t sub_237AD5CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v37 + 24);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for LamportTimestamp(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      uint64_t v27 = (void (*)(char *, char *, uint64_t))v10;
      *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
      ((void (*)(char *, char *, uint64_t))v10)(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v39);
      uint64_t v28 = *(int *)(v14 + 24);
      v29 = &v12[v28];
      v30 = &v13[v28];
      uint64_t v31 = type metadata accessor for PBUUID(0);
      uint64_t v32 = *(void *)(v31 - 8);
      v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
      int v34 = v33(v29, 1, v31);
      int v35 = v33(v30, 1, v31);
      if (v34)
      {
        if (!v35)
        {
          *(void *)v29 = *(void *)v30;
          *((void *)v29 + 1) = *((void *)v30 + 1);
          (*(void (**)(char *, char *, uint64_t))(v37 + 16))(&v29[*(int *)(v31 + 24)], &v30[*(int *)(v31 + 24)], v39);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
          return a1;
        }
      }
      else
      {
        if (!v35)
        {
          *(void *)v29 = *(void *)v30;
          *((void *)v29 + 1) = *((void *)v30 + 1);
          v27(&v29[*(int *)(v31 + 24)], &v30[*(int *)(v31 + 24)], v39);
          return a1;
        }
        sub_237A95938((uint64_t)v29, type metadata accessor for PBUUID);
      }
      size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0) - 8) + 64);
      uint64_t v25 = v29;
      uint64_t v26 = v30;
      goto LABEL_8;
    }
    sub_237A95938((uint64_t)v12, type metadata accessor for LamportTimestamp);
LABEL_7:
    size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0) - 8) + 64);
    uint64_t v25 = v12;
    uint64_t v26 = v13;
LABEL_8:
    memcpy(v25, v26, v24);
    return a1;
  }
  if (v17) {
    goto LABEL_7;
  }
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v38 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v38(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v39);
  uint64_t v18 = *(int *)(v14 + 24);
  uint64_t v19 = &v12[v18];
  uint64_t v20 = &v13[v18];
  uint64_t v21 = type metadata accessor for PBUUID(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = *((void *)v20 + 1);
    v38(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_237AD613C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (_DWORD *)(a1 + v11);
  uint64_t v13 = (_DWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for LamportTimestamp(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 20), (char *)v13 + *(int *)(v14 + 20), v9);
    uint64_t v17 = *(int *)(v14 + 24);
    __dst = (_OWORD *)((char *)v12 + v17);
    uint64_t v18 = (_OWORD *)((char *)v13 + v17);
    uint64_t v19 = type metadata accessor for PBUUID(0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
      memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      _OWORD *__dst = *v18;
      v10((char *)__dst + *(int *)(v19 + 24), (char *)v18 + *(int *)(v19 + 24), v9);
      (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_237AD63AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_237AEE6F0();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v37 + 40);
  v10(v7, v8);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for LamportTimestamp(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v16(v12, 1, v14);
  int v17 = v16(v13, 1, v14);
  if (!v8)
  {
    if (!v17)
    {
      uint64_t v27 = (void (*)(char *, char *, uint64_t))v10;
      *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
      ((void (*)(char *, char *, uint64_t))v10)(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v39);
      uint64_t v28 = *(int *)(v14 + 24);
      v29 = &v12[v28];
      v30 = &v13[v28];
      uint64_t v31 = type metadata accessor for PBUUID(0);
      uint64_t v32 = *(void *)(v31 - 8);
      v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
      int v34 = v33(v29, 1, v31);
      int v35 = v33(v30, 1, v31);
      if (v34)
      {
        if (!v35)
        {
          *(_OWORD *)v29 = *(_OWORD *)v30;
          (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v29[*(int *)(v31 + 24)], &v30[*(int *)(v31 + 24)], v39);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
          return a1;
        }
      }
      else
      {
        if (!v35)
        {
          *(_OWORD *)v29 = *(_OWORD *)v30;
          v27(&v29[*(int *)(v31 + 24)], &v30[*(int *)(v31 + 24)], v39);
          return a1;
        }
        sub_237A95938((uint64_t)v29, type metadata accessor for PBUUID);
      }
      size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0) - 8) + 64);
      uint64_t v25 = v29;
      uint64_t v26 = v30;
      goto LABEL_8;
    }
    sub_237A95938((uint64_t)v12, type metadata accessor for LamportTimestamp);
LABEL_7:
    size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0) - 8) + 64);
    uint64_t v25 = v12;
    uint64_t v26 = v13;
LABEL_8:
    memcpy(v25, v26, v24);
    return a1;
  }
  if (v17) {
    goto LABEL_7;
  }
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v38 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v38(&v12[*(int *)(v14 + 20)], &v13[*(int *)(v14 + 20)], v39);
  uint64_t v18 = *(int *)(v14 + 24);
  uint64_t v19 = &v12[v18];
  uint64_t v20 = &v13[v18];
  uint64_t v21 = type metadata accessor for PBUUID(0);
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    v38(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_237AD680C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD6820);
}

uint64_t sub_237AD6820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_54Tm(a1, a2, a3, &qword_26893AFE0);
}

uint64_t __swift_get_extra_inhabitant_index_54Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v10 = sub_237AEE6F0();
    uint64_t v11 = *(void *)(v10 - 8);
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v12 = v10;
      uint64_t v13 = a1 + *(int *)(a3 + 28);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
      return v14(v13, a2, v12);
    }
    else
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a4);
      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
      uint64_t v17 = v15;
      uint64_t v18 = a1 + *(int *)(a3 + 32);
      return v16(v18, a2, v17);
    }
  }
}

uint64_t sub_237AD695C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD6970);
}

uint64_t sub_237AD6970(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_55Tm(a1, a2, a3, a4, &qword_26893AFE0);
}

uint64_t __swift_store_extra_inhabitant_index_55Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v10 = sub_237AEE6F0();
    uint64_t v11 = *(void *)(v10 - 8);
    if (*(_DWORD *)(v11 + 84) == a3)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v6 + *(int *)(a4 + 28);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
      return v14(v13, a2, a2, v12);
    }
    else
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
      uint64_t v17 = v15;
      uint64_t v18 = v6 + *(int *)(a4 + 32);
      return v16(v18, a2, a2, v17);
    }
  }
  return result;
}

void sub_237AD6ABC()
{
  sub_237AEE6F0();
  if (v0 <= 0x3F)
  {
    sub_237A9910C(319, &qword_26893B868, (void (*)(uint64_t))type metadata accessor for LamportTimestamp);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for OwnershipChangeResultType()
{
  return &type metadata for OwnershipChangeResultType;
}

uint64_t sub_237AD6BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_237AD6C3C(uint64_t a1)
{
  uint64_t v2 = sub_237AEE6F0();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_237AD6CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_237AD6D04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_237AD6D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_237AD6DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_237AD6E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237AD6E44);
}

uint64_t sub_237AD6E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_237AD6EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237AD6EC4);
}

uint64_t sub_237AD6EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_237AEE6F0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_237AD6F34()
{
  uint64_t result = sub_237AEE6F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_237AD6FC4()
{
  unint64_t result = qword_26893BD50;
  if (!qword_26893BD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD50);
  }
  return result;
}

unint64_t sub_237AD701C()
{
  unint64_t result = qword_26893BD58;
  if (!qword_26893BD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD58);
  }
  return result;
}

unint64_t sub_237AD7074()
{
  unint64_t result = qword_26893BD60;
  if (!qword_26893BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD60);
  }
  return result;
}

unint64_t sub_237AD70CC()
{
  unint64_t result = qword_26893BD68;
  if (!qword_26893BD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD68);
  }
  return result;
}

unint64_t sub_237AD7124()
{
  unint64_t result = qword_26893BD70;
  if (!qword_26893BD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD70);
  }
  return result;
}

unint64_t sub_237AD717C()
{
  unint64_t result = qword_26893BD78;
  if (!qword_26893BD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26893BD78);
  }
  return result;
}

uint64_t sub_237AD7200(unint64_t a1, uint64_t a2)
{
  uint64_t v129 = a2;
  uint64_t v4 = *v2;
  uint64_t v6 = *(void *)(*v2 + 304);
  uint64_t v7 = *(void *)(*v2 + 328);
  uint64_t v8 = *(void *)(*v2 + 336);
  *(void *)v173 = *(void *)(*v2 + 280);
  uint64_t v5 = *(void *)v173;
  long long v171 = *(_OWORD *)(v4 + 288);
  *(_OWORD *)&v173[8] = v171;
  uint64_t v174 = v6;
  long long v172 = *(_OWORD *)(v4 + 312);
  long long v175 = v172;
  uint64_t v176 = v7;
  uint64_t v177 = v8;
  uint64_t v138 = v8;
  type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26893AE00);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v127 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v125 = (_OWORD *)((char *)&v123 - v10);
  MEMORY[0x270FA5388](v9);
  v124 = (char *)&v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v171;
  uint64_t v13 = sub_237AEEE50();
  uint64_t v170 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v142 = (char *)&v123 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v139 = (char *)&v123 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v144 = (char *)&v123 - v19;
  uint64_t v146 = *(void *)(v12 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v137 = (char *)&v123 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v140 = (char *)&v123 - v23;
  uint64_t v145 = *(void *)(v5 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v148 = (char *)&v123 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v158 = (char *)&v123 - v27;
  MEMORY[0x270FA5388](v26);
  v155 = (char *)&v123 - v28;
  uint64_t v150 = swift_getTupleTypeMetadata2();
  uint64_t v167 = sub_237AEEE50();
  uint64_t v29 = *(void *)(v167 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v167);
  v149 = (char *)&v123 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  int v34 = (char *)&v123 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  v154 = (char *)&v123 - v36;
  MEMORY[0x270FA5388](v35);
  v159 = (char *)&v123 - v37;
  uint64_t v38 = sub_237AEEC60();
  uint64_t v39 = sub_237AEEC60();
  uint64_t v40 = sub_237AEEC60();
  v133 = &v173[8];
  *(void *)v173 = v38;
  *(void *)&v173[8] = v39;
  v136 = &v173[16];
  *(void *)&v173[16] = v40;
  v126 = v2;
  v41 = (unint64_t *)((char *)v2 + qword_26893BDA8);
  swift_beginAccess();
  v147 = v41;
  unint64_t v42 = *v41;
  BOOL v43 = (*v41 & 0xC000000000000001) == 0;
  v131 = v34;
  if (v43)
  {
    uint64_t v48 = -1 << *(unsigned char *)(v42 + 32);
    uint64_t v45 = ~v48;
    uint64_t v49 = *(void *)(v42 + 64);
    unint64_t v132 = v42 + 64;
    uint64_t v50 = -v48;
    if (v50 < 64) {
      uint64_t v51 = ~(-1 << v50);
    }
    else {
      uint64_t v51 = -1;
    }
    unint64_t v46 = v51 & v49;
    unint64_t v47 = v42;
  }
  else
  {
    uint64_t v44 = sub_237AEEFB0();
    unint64_t v132 = 0;
    uint64_t v45 = 0;
    unint64_t v46 = 0;
    unint64_t v47 = v44 | 0x8000000000000000;
  }
  uint64_t v135 = v47 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v52 = v150;
  uint64_t v153 = v150 - 8;
  uint64_t v130 = v45;
  v168 = (void (**)(char *, char *, uint64_t))(v145 + 16);
  uint64_t v141 = v146 + 16;
  v166 = (char **)(v29 + 32);
  v163 = (void (**)(char *, char *, void))(v145 + 32);
  v143 = (void (**)(char *, char *, uint64_t))(v146 + 32);
  *(void *)&long long v171 = v146 + 48;
  v169 = (void (**)(char *, uint64_t))(v146 + 8);
  v162 = (void (**)(char *, uint64_t))(v145 + 8);
  v160 = (void (**)(char *, uint64_t))(v170 + 8);
  int64_t v134 = (unint64_t)(v45 + 64) >> 6;
  uint64_t v123 = v134 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v170 = v172;
  unint64_t v157 = a1;
  uint64_t v54 = 0;
  *(void *)&long long v172 = v5;
  uint64_t v161 = v13;
  v55 = v140;
  v56 = v155;
  v57 = v154;
  unint64_t v58 = v47;
  uint64_t v156 = v47;
  while (1)
  {
    int64_t v152 = v46;
    uint64_t v151 = v54;
    if ((v58 & 0x8000000000000000) != 0)
    {
      if (sub_237AEEFC0())
      {
        sub_237AEF150();
        swift_unknownObjectRelease();
        sub_237AEF150();
        swift_unknownObjectRelease();
        uint64_t v60 = 0;
      }
      else
      {
        uint64_t v60 = 1;
      }
      uint64_t v165 = v54;
      uint64_t v164 = v46;
      goto LABEL_23;
    }
    if (v46)
    {
      uint64_t v164 = (v46 - 1) & v46;
      unint64_t v59 = __clz(__rbit64(v46)) | (v54 << 6);
      uint64_t v165 = v54;
LABEL_13:
      (*(void (**)(char *, unint64_t, uint64_t))(v145 + 16))(v57, *(void *)(v58 + 48) + *(void *)(v145 + 72) * v59, v5);
      (*(void (**)(char *, unint64_t, uint64_t))(v146 + 16))(&v57[*(int *)(v52 + 48)], *(void *)(v58 + 56) + *(void *)(v146 + 72) * v59, v12);
      uint64_t v60 = 0;
      goto LABEL_23;
    }
    int64_t v61 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      break;
    }
    if (v61 >= v134)
    {
      uint64_t v164 = 0;
      uint64_t v60 = 1;
      uint64_t v165 = v54;
      goto LABEL_23;
    }
    unint64_t v62 = *(void *)(v132 + 8 * v61);
    if (v62) {
      goto LABEL_19;
    }
    v63 = v159;
    if (v54 + 2 < v134)
    {
      unint64_t v62 = *(void *)(v132 + 8 * (v54 + 2));
      if (v62)
      {
        int64_t v61 = v54 + 2;
LABEL_36:
        uint64_t v5 = v172;
        unint64_t v58 = v156;
LABEL_19:
        uint64_t v164 = (v62 - 1) & v62;
        uint64_t v165 = v61;
        unint64_t v59 = __clz(__rbit64(v62)) + (v61 << 6);
        goto LABEL_13;
      }
      uint64_t v85 = v54 + 3;
      if (v54 + 3 < v134)
      {
        unint64_t v62 = *(void *)(v132 + 8 * v85);
        if (v62)
        {
          int64_t v61 = v54 + 3;
          goto LABEL_36;
        }
        uint64_t v5 = v172;
        unint64_t v58 = v156;
        while (1)
        {
          int64_t v61 = v85 + 1;
          if (__OFADD__(v85, 1)) {
            goto LABEL_84;
          }
          if (v61 >= v134) {
            break;
          }
          unint64_t v62 = *(void *)(v132 + 8 * v61);
          ++v85;
          if (v62) {
            goto LABEL_19;
          }
        }
        uint64_t v164 = 0;
        uint64_t v60 = 1;
        uint64_t v165 = v123;
LABEL_23:
        v63 = v159;
        goto LABEL_24;
      }
      uint64_t v164 = 0;
      uint64_t v60 = 1;
      uint64_t v165 = v54 + 2;
    }
    else
    {
      uint64_t v165 = v54 + 1;
      uint64_t v164 = 0;
      uint64_t v60 = 1;
    }
LABEL_24:
    uint64_t v64 = *(void *)(v52 - 8);
    uint64_t v65 = v64;
    v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56);
    uint64_t v67 = v64 + 56;
    v66(v57, v60, 1, v52);
    v68 = *v166;
    ((void (*)(char *, char *, uint64_t))*v166)(v63, v57, v167);
    v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v65 + 48);
    if (v69(v63, 1, v52) == 1)
    {
      v155 = v68;
      uint64_t v153 = v67;
      v154 = (char *)v66;
      sub_237A6483C();
      if ((v157 & 0xC000000000000001) != 0)
      {
        uint64_t v86 = sub_237AEEFB0();
        uint64_t v151 = 0;
        uint64_t v87 = 0;
        unint64_t v88 = 0;
        unint64_t v89 = v86 | 0x8000000000000000;
      }
      else
      {
        uint64_t v90 = -1 << *(unsigned char *)(v157 + 32);
        uint64_t v87 = ~v90;
        uint64_t v91 = *(void *)(v157 + 64);
        uint64_t v151 = v157 + 64;
        uint64_t v92 = -v90;
        if (v92 < 64) {
          uint64_t v93 = ~(-1 << v92);
        }
        else {
          uint64_t v93 = -1;
        }
        unint64_t v88 = v93 & v91;
        unint64_t v89 = v157;
      }
      v94 = v149;
      v95 = v131;
      uint64_t v156 = v89 & 0x7FFFFFFFFFFFFFFFLL;
      v144 = (char *)v87;
      int64_t v152 = (unint64_t)(v87 + 64) >> 6;
      v143 = (void (**)(char *, char *, uint64_t))(v152 - 1);
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v96 = 0;
      while (1)
      {
        v159 = (char *)v96;
        if ((v89 & 0x8000000000000000) != 0)
        {
          if (sub_237AEEFC0())
          {
            sub_237AEF150();
            swift_unknownObjectRelease();
            sub_237AEF150();
            swift_unknownObjectRelease();
            v99 = v94;
            uint64_t v100 = 0;
          }
          else
          {
            v99 = v94;
            uint64_t v100 = 1;
          }
          ((void (*)(char *, uint64_t, uint64_t, uint64_t))v154)(v99, v100, 1, v52);
          uint64_t v164 = (uint64_t)v159;
          uint64_t v165 = v88;
        }
        else
        {
          if (v88)
          {
            uint64_t v165 = (v88 - 1) & v88;
            unint64_t v97 = __clz(__rbit64(v88)) | (v96 << 6);
            int64_t v98 = v96;
            goto LABEL_58;
          }
          int64_t v98 = v96 + 1;
          if (__OFADD__(v96, 1)) {
            goto LABEL_83;
          }
          v101 = (void (**)(void, void, void))v96;
          if (v98 < v152)
          {
            unint64_t v102 = *(void *)(v151 + 8 * v98);
            if (v102) {
              goto LABEL_64;
            }
            v101 = (void (**)(void, void, void))(v96 + 1);
            if (v96 + 2 < v152)
            {
              unint64_t v102 = *(void *)(v151 + 8 * (v96 + 2));
              if (v102)
              {
                int64_t v98 = v96 + 2;
LABEL_64:
                uint64_t v165 = (v102 - 1) & v102;
                unint64_t v97 = __clz(__rbit64(v102)) + (v98 << 6);
LABEL_58:
                (*(void (**)(char *, unint64_t, void))(v145 + 16))(v94, *(void *)(v89 + 48) + *(void *)(v145 + 72) * v97, v172);
                (*(void (**)(char *, unint64_t, uint64_t))(v146 + 16))(&v94[*(int *)(v52 + 48)], *(void *)(v89 + 56) + *(void *)(v146 + 72) * v97, v12);
                ((void (*)(char *, void, uint64_t, uint64_t))v154)(v94, 0, 1, v52);
                uint64_t v164 = v98;
                goto LABEL_78;
              }
              int64_t v98 = v96 + 3;
              v101 = (void (**)(void, void, void))(v96 + 2);
              if (v96 + 3 < v152)
              {
                unint64_t v102 = *(void *)(v151 + 8 * v98);
                if (v102) {
                  goto LABEL_64;
                }
                uint64_t v103 = v96 + 4;
                while (v152 != v103)
                {
                  unint64_t v102 = *(void *)(v151 + 8 * v103++);
                  if (v102)
                  {
                    int64_t v98 = v103 - 1;
                    goto LABEL_64;
                  }
                }
                v101 = (void (**)(void, void, void))v143;
              }
            }
          }
          uint64_t v164 = (uint64_t)v101;
          ((void (*)(char *, uint64_t, uint64_t, uint64_t))v154)(v94, 1, 1, v52);
          uint64_t v165 = 0;
        }
LABEL_78:
        ((void (*)(char *, char *, uint64_t))v155)(v95, v94, v167);
        int v104 = v69(v95, 1, v52);
        v105 = v148;
        if (v104 == 1)
        {
          sub_237A6483C();
          unint64_t *v147 = v157;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v115 = *(void *)&v173[16];
          uint64_t v116 = sub_237AEE6A0();
          uint64_t v117 = *(void *)(v116 - 8);
          v118 = *(void (**)(char *, uint64_t, uint64_t))(v117 + 16);
          long long v172 = *(_OWORD *)v173;
          uint64_t v119 = (uint64_t)v124;
          v118(v124, v129, v116);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v117 + 56))(v119, 0, 1, v116);
          uint64_t v120 = TupleTypeMetadata2;
          v121 = v125;
          uint64_t v122 = (uint64_t)v125 + *(int *)(TupleTypeMetadata2 + 48);
          _OWORD *v125 = v172;
          *((void *)v121 + 2) = v115;
          sub_237A39C38(v119, v122, &qword_26893AE00);
          sub_237AEE9B0();
          return (*(uint64_t (**)(_OWORD *, uint64_t))(v127 + 8))(v121, v120);
        }
        v106 = v69;
        unint64_t v107 = v89;
        uint64_t v108 = *(int *)(v52 + 48);
        uint64_t v109 = v12;
        uint64_t v110 = v172;
        (*v163)(v148, v95, v172);
        v111 = v147;
        swift_beginAccess();
        unint64_t v112 = *v111;
        v113 = v142;
        MEMORY[0x237E281B0](v105, v112, v110, v109, v170);
        swift_endAccess();
        int v114 = (*(uint64_t (**)(char *, uint64_t, uint64_t))v171)(v113, 1, v109);
        (*v160)(v113, v161);
        if (v114 == 1)
        {
          (*v168)(v158, v105, v110);
          sub_237AEECC0();
          sub_237AEECA0();
        }
        (*v162)(v105, v110);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v169)(&v95[v108], v109);
        uint64_t v96 = v164;
        unint64_t v88 = v165;
        uint64_t v12 = v109;
        uint64_t v52 = v150;
        v94 = v149;
        unint64_t v89 = v107;
        v69 = v106;
      }
    }
    v70 = &v63[*(int *)(v52 + 48)];
    uint64_t v5 = v172;
    (*v163)(v56, v63, v172);
    v71 = *v143;
    (*v143)(v55, v70, v12);
    v72 = v144;
    v73 = v56;
    v74 = v55;
    unint64_t v75 = v157;
    MEMORY[0x237E281B0](v73, v157, v5, v12, v170);
    v76 = *(uint64_t (**)(char *, uint64_t, uint64_t))v171;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v171)(v72, 1, v12) == 1)
    {
      v77 = v160;
      uint64_t v78 = v161;
      (*v160)(v72, v161);
    }
    else
    {
      v79 = v137;
      v71(v137, v72, v12);
      char v80 = sub_237AEEBA0();
      uint64_t v78 = v161;
      v77 = v160;
      if ((v80 & 1) == 0)
      {
        v83 = v155;
        (*v168)(v158, v155, v5);
        sub_237AEECC0();
        sub_237AEECA0();
        v84 = *v169;
        (*v169)(v79, v12);
        v84(v74, v12);
        v55 = v74;
        v56 = v83;
        goto LABEL_9;
      }
      (*v169)(v79, v12);
    }
    v81 = v139;
    v56 = v155;
    MEMORY[0x237E281B0](v155, v75, v5, v12, v170);
    int v82 = v76(v81, 1, v12);
    (*v77)(v81, v78);
    if (v82 == 1)
    {
      (*v168)(v158, v56, v5);
      sub_237AEECC0();
      sub_237AEECA0();
    }
    v55 = v140;
    (*v169)(v140, v12);
LABEL_9:
    v57 = v154;
    unint64_t v58 = v156;
    uint64_t v54 = v165;
    unint64_t v46 = v164;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*v162)(v56, v5);
  }
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_237AD8660(void (*a1)(int *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v6 = type metadata accessor for LamportTimestamp(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_237A8CB4C(0, v10, 0);
    uint64_t v11 = v21;
    uint64_t v12 = (int *)(a3 + 32);
    while (1)
    {
      int v13 = *v12++;
      int v20 = v13;
      v18(&v20);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v21 = v11;
      unint64_t v15 = *(void *)(v11 + 16);
      unint64_t v14 = *(void *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_237A8CB4C(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v21;
      }
      *(void *)(v11 + 16) = v15 + 1;
      sub_237A67E68((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v15, type metadata accessor for LamportTimestamp);
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_237AD8804(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v8 = type metadata accessor for LamportTimestamp(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a3;
  uint64_t v13 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (!v13) {
    return v14;
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t result = sub_237A8CB4C(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = v25;
    uint64_t v15 = v23;
    if (a4 <= v23) {
      uint64_t v16 = v23;
    }
    else {
      uint64_t v16 = a4;
    }
    uint64_t v20 = v16;
    while (a4 != v15)
    {
      uint64_t v24 = v15;
      v21(&v24);
      if (v5)
      {
        swift_release();
        return v14;
      }
      uint64_t v5 = 0;
      uint64_t v25 = v14;
      unint64_t v18 = *(void *)(v14 + 16);
      unint64_t v17 = *(void *)(v14 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_237A8CB4C(v17 > 1, v18 + 1, 1);
        uint64_t v14 = v25;
      }
      *(void *)(v14 + 16) = v18 + 1;
      uint64_t result = sub_237A67E68((uint64_t)v12, v14+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v18, type metadata accessor for LamportTimestamp);
      if (a4 < v23) {
        goto LABEL_19;
      }
      if (v20 == v15) {
        goto LABEL_20;
      }
      if (a4 == ++v15) {
        return v14;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_237AD89F8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x616E6F6974636964 && a2 == 0xEA00000000007972 || (sub_237AEF160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F7473626D6F74 && a2 == 0xEA00000000007365 || (sub_237AEF160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_237AEF160();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_237AD8B70(char a1)
{
  if (!a1) {
    return 0x616E6F6974636964;
  }
  if (a1 == 1) {
    return 0x6E6F7473626D6F74;
  }
  return 0x6D617473656D6974;
}

uint64_t sub_237AD8BD0(char a1)
{
  uint64_t result = 0x65756C6176;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6D617473656D6974;
      break;
    case 2:
      uint64_t result = 25705;
      break;
    case 3:
      uint64_t result = 0x72656E776FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237AD8C50(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 16);
  long long v11 = *(_OWORD *)(a2 + 24);
  long long v14 = v11;
  long long v15 = *(_OWORD *)(a2 + 40);
  uint64_t v16 = v3;
  long long v10 = *(_OWORD *)(a2 + 64);
  long long v17 = v10;
  type metadata accessor for SyncedDictionary.Element.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_237AEF0E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237AEF2B0();
  LOBYTE(v13) = 0;
  uint64_t v8 = v12;
  sub_237AEF0D0();
  if (!v8)
  {
    LOBYTE(v13) = 1;
    type metadata accessor for LamportTimestamp(0);
    sub_237AEE1AC(&qword_26893AFC0, (void (*)(uint64_t))type metadata accessor for LamportTimestamp);
    sub_237AEF0D0();
    LOBYTE(v13) = 2;
    sub_237AEE520();
    sub_237AEE1AC(&qword_26893AF48, MEMORY[0x263F07508]);
    sub_237AEF0B0();
    LOBYTE(v13) = 3;
    sub_237AEF0B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_237AD8F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char *a10)
{
  uint64_t v49 = a2;
  uint64_t v60 = (void *)a1;
  uint64_t v39 = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v40 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v41 = (char *)&v39 - v20;
  uint64_t v45 = type metadata accessor for LamportTimestamp(0);
  uint64_t v21 = MEMORY[0x270FA5388](v45);
  uint64_t v44 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v21);
  unint64_t v47 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  uint64_t v24 = a4;
  uint64_t v56 = a6;
  uint64_t v57 = a7;
  uint64_t v58 = a8;
  unint64_t v59 = a10;
  type metadata accessor for SyncedDictionary.Element.CodingKeys();
  swift_getWitnessTable();
  uint64_t v48 = sub_237AEF090();
  uint64_t v43 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v26 = (char *)&v39 - v25;
  uint64_t v52 = v49;
  uint64_t v53 = a3;
  uint64_t v49 = a3;
  uint64_t v54 = v24;
  uint64_t v55 = a5;
  uint64_t v56 = a6;
  uint64_t v57 = a7;
  uint64_t v46 = a7;
  uint64_t v58 = a8;
  unint64_t v59 = v50;
  uint64_t v27 = v60;
  uint64_t v28 = (int *)type metadata accessor for SyncedDictionary.Element();
  uint64_t v29 = *((void *)v28 - 1);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v39 - v30;
  __swift_project_boxed_opaque_existential_1(v27, v27[3]);
  uint64_t v50 = v26;
  uint64_t v32 = v51;
  sub_237AEF290();
  if (v32) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  }
  uint64_t v33 = (uint64_t)v44;
  uint64_t v51 = v29;
  LOBYTE(v52) = 0;
  uint64_t v34 = v49;
  sub_237AEF080();
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v31, v47, v34);
  LOBYTE(v52) = 1;
  sub_237AEE1AC(&qword_26893AFB0, (void (*)(uint64_t))type metadata accessor for LamportTimestamp);
  sub_237AEF080();
  sub_237A67E68(v33, (uint64_t)&v31[v28[21]], type metadata accessor for LamportTimestamp);
  sub_237AEE520();
  LOBYTE(v52) = 2;
  sub_237AEE1AC(&qword_26893AF30, MEMORY[0x263F07508]);
  uint64_t v35 = (uint64_t)v41;
  sub_237AEF060();
  sub_237A39C38(v35, (uint64_t)&v31[v28[22]], &qword_26893AFA8);
  LOBYTE(v52) = 3;
  uint64_t v36 = (uint64_t)v40;
  sub_237AEF060();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v50, v48);
  sub_237A39C38(v36, v28[23], &qword_26893AFA8);
  uint64_t v37 = v51;
  (*(void (**)(uint64_t, void, int *))(v51 + 16))(v39, 0, v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  return (*(uint64_t (**)(void, int *))(v37 + 8))(0, v28);
}

uint64_t sub_237AD95E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a1, a5);
  long long v10 = (int *)type metadata accessor for SyncedDictionary.Element();
  sub_237A67E68(a2, a6 + v10[21], type metadata accessor for LamportTimestamp);
  sub_237A39C38(a3, a6 + v10[22], &qword_26893AFA8);
  return sub_237A39C38(a4, a6 + v10[23], &qword_26893AFA8);
}

uint64_t sub_237AD96FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D6E8];
  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_237AD9770(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D6D8];
  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_237AD97DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D6D8];
  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_237AD984C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D6D8];
  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

unint64_t sub_237AD98BC@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_237A571B0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_237AD98F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_237A321A4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_237AD9924()
{
  return sub_237AD8B70(*v0);
}

uint64_t sub_237AD9948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237AD89F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237AD9978()
{
  return sub_237A32198(*v0);
}

unint64_t sub_237AD99A0@<X0>(unint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_237A571B0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_237AD99D0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_237AD9A24(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

BOOL sub_237AD9A78(char *a1, char *a2)
{
  return sub_237A57378(*a1, *a2);
}

uint64_t sub_237AD9ABC()
{
  return sub_237A573B0();
}

uint64_t sub_237AD9AF4()
{
  return sub_237A57388();
}

uint64_t sub_237AD9B2C()
{
  return sub_237AEF240();
}

uint64_t sub_237AD9B84()
{
  return sub_237AD8BD0(*v0);
}

uint64_t sub_237AD9BBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_237A31FF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237AD9C04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_237A64C00();
  *a1 = result;
  return result;
}

uint64_t sub_237AD9C40(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_237AD9C94(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_237AD9CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_237AD8F64(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 64), a3, *(char **)(a2 + 72));
}

uint64_t sub_237AD9D20(void *a1, uint64_t a2)
{
  return sub_237AD8C50(a1, a2);
}

uint64_t SyncedDictionary.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  SyncedDictionary.init(from:)(a1);
  return v2;
}

uint64_t SyncedDictionary.init(from:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v130 = a1;
  v121 = (void *)*v1;
  uint64_t v3 = v121;
  uint64_t v157 = type metadata accessor for LamportTimestamp(0);
  v139 = *(void (***)(uint64_t, void, uint64_t, uint64_t))(v157 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v157);
  uint64_t v111 = (uint64_t)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v112 = (char *)&v108 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  MEMORY[0x270FA5388](v7 - 8);
  v148 = (char *)&v108 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v133 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v132 = (uint64_t)&v108 - v12;
  uint64_t v136 = sub_237AEE520();
  uint64_t v138 = *(void (***)(char *, uint64_t))(v136 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v136);
  v131 = (char *)&v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v3[36];
  v140 = *(void (***)(char *, void, uint64_t, uint64_t))(v15 - 8);
  MEMORY[0x270FA5388](v13);
  v149 = (char *)&v108 - v16;
  uint64_t v17 = sub_237AEEE50();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v156 = (char *)&v108 - v18;
  uint64_t v20 = v3[37];
  uint64_t v21 = v3[38];
  uint64_t v22 = v3[39];
  uint64_t v23 = v3[40];
  uint64_t v24 = v3[41];
  uint64_t v25 = (void (**)(char *, char *, uint64_t))v3[42];
  uint64_t v176 = v3[35];
  uint64_t v19 = v176;
  uint64_t v177 = v15;
  uint64_t v178 = v20;
  uint64_t v179 = v21;
  uint64_t v129 = v20;
  uint64_t v26 = v21;
  uint64_t v163 = v21;
  uint64_t v180 = v22;
  uint64_t v181 = v23;
  uint64_t v27 = v23;
  uint64_t v158 = v23;
  uint64_t v182 = v24;
  v183 = v25;
  uint64_t v28 = v24;
  uint64_t v147 = v24;
  uint64_t v29 = v25;
  uint64_t v146 = v25;
  uint64_t v30 = type metadata accessor for SyncedDictionary.Element();
  uint64_t v153 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v161 = (char *)&v108 - v32;
  uint64_t v155 = *(void *)(v19 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v162 = (char *)&v108 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  v160 = (char *)&v108 - v35;
  uint64_t v165 = v36;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v152 = sub_237AEEE50();
  uint64_t v144 = *(void *)(v152 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v152);
  uint64_t v150 = (char *)&v108 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v151 = (char *)&v108 - v39;
  uint64_t v176 = v19;
  uint64_t v177 = v15;
  uint64_t v178 = v20;
  uint64_t v179 = v26;
  uint64_t v180 = v22;
  uint64_t v181 = v27;
  uint64_t v182 = v28;
  v183 = v29;
  type metadata accessor for SyncedDictionary.CodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v119 = sub_237AEF090();
  uint64_t v118 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v41 = (char *)&v108 - v40;
  uint64_t v42 = (void *)((char *)v2 + qword_26893BD80);
  swift_retain();
  swift_getTupleTypeMetadata2();
  sub_237AEEC60();
  uint64_t v43 = sub_237AEEB10();
  uint64_t v122 = v42;
  *uint64_t v42 = v43;
  uint64_t v44 = (void *)((char *)v2 + qword_26893BD88);
  sub_237AEEC60();
  uint64_t v45 = sub_237AEEB10();
  v124 = v44;
  *uint64_t v44 = v45;
  v126 = (void *)((char *)v2 + qword_26893BD90);
  *(void *)((char *)v2 + qword_26893BD90) = 0;
  v125 = (void *)((char *)v2 + qword_26893BD98);
  *(void *)((char *)v2 + qword_26893BD98) = 0;
  if (swift_conformsToProtocol2()) {
    uint64_t v46 = v15;
  }
  else {
    uint64_t v46 = 0;
  }
  *((unsigned char *)v2 + qword_26893BDA0) = v46 != 0;
  uint64_t v47 = qword_26893C3D0;
  uint64_t v176 = v19;
  uint64_t v177 = v15;
  uint64_t v178 = v129;
  uint64_t v179 = v163;
  uint64_t v163 = v22;
  uint64_t v180 = v22;
  uint64_t v181 = v158;
  uint64_t v182 = v147;
  v183 = v146;
  type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26893AE00);
  swift_getTupleTypeMetadata2();
  sub_237AEE9E0();
  uint64_t v48 = sub_237AEE9D0();
  uint64_t v123 = v2;
  uint64_t v120 = v47;
  *(void *)((char *)v2 + v47) = v48;
  __swift_project_boxed_opaque_existential_1(v130, v130[3]);
  uint64_t v49 = v164;
  sub_237AEF290();
  if (!v49)
  {
    uint64_t v50 = v144;
    sub_237AEEB50();
    char v170 = 0;
    uint64_t v51 = swift_getWitnessTable();
    uint64_t v174 = v129;
    uint64_t v175 = v51;
    swift_getWitnessTable();
    sub_237AEF080();
    uint64_t v109 = 0;
    uint64_t v110 = v41;
    uint64_t v54 = v176;
    uint64_t v184 = sub_237AEEAE0();
    uint64_t v173 = sub_237AEEAE0();
    uint64_t v172 = sub_237AEEAE0();
    uint64_t result = sub_237AEEAE0();
    uint64_t v55 = 0;
    uint64_t v56 = *(void *)(v54 + 64);
    uint64_t v117 = v54 + 64;
    uint64_t v135 = v54;
    uint64_t v57 = 1 << *(unsigned char *)(v54 + 32);
    uint64_t v171 = result;
    uint64_t v58 = -1;
    if (v57 < 64) {
      uint64_t v58 = ~(-1 << v57);
    }
    unint64_t v59 = v58 & v56;
    uint64_t v60 = TupleTypeMetadata2;
    uint64_t v147 = TupleTypeMetadata2 - 8;
    uint64_t v61 = v155;
    uint64_t v164 = (void (**)(char *, char *, uint64_t))(v155 + 16);
    uint64_t v62 = v153;
    uint64_t v134 = v153 + 16;
    uint64_t v146 = (void (**)(char *, char *, uint64_t))(v50 + 32);
    v143 = (void (**)(char *, char *, uint64_t))(v155 + 32);
    v142 = (void (**)(char *, char *, uint64_t))(v153 + 32);
    uint64_t v141 = (void (**)(char *, char *, uint64_t))(v140 + 2);
    v140 += 7;
    uint64_t v127 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 6);
    uint64_t v116 = (void (**)(char *, uint64_t, uint64_t))(v138 + 4);
    uint64_t v115 = (void (**)(uint64_t, char *, uint64_t))(v138 + 2);
    int v114 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v138 + 7);
    v113 = v138 + 1;
    v139 += 7;
    uint64_t v138 = (void (**)(char *, uint64_t))(v153 + 8);
    v137 = (uint64_t (**)(char *, uint64_t))(v155 + 8);
    int64_t v128 = (unint64_t)(v57 + 63) >> 6;
    int64_t v108 = v128 - 1;
    uint64_t v144 = v19;
    uint64_t v145 = v15;
    while (1)
    {
      v70 = v156;
      v71 = v162;
      if (v59)
      {
        uint64_t v72 = v15;
        uint64_t v158 = (v59 - 1) & v59;
        uint64_t WitnessTable = v55;
        unint64_t v73 = __clz(__rbit64(v59)) | (v55 << 6);
        goto LABEL_16;
      }
      int64_t v77 = v55 + 1;
      if (__OFADD__(v55, 1))
      {
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
      if (v77 >= v128)
      {
        uint64_t WitnessTable = v55;
      }
      else
      {
        unint64_t v78 = *(void *)(v117 + 8 * v77);
        if (v78) {
          goto LABEL_20;
        }
        if (v55 + 2 >= v128)
        {
          uint64_t v158 = 0;
          uint64_t v76 = 1;
LABEL_32:
          uint64_t WitnessTable = v77;
          goto LABEL_23;
        }
        unint64_t v78 = *(void *)(v117 + 8 * (v55 + 2));
        if (v78)
        {
          int64_t v77 = v55 + 2;
          goto LABEL_20;
        }
        uint64_t v91 = v55 + 3;
        if (v55 + 3 < v128)
        {
          unint64_t v78 = *(void *)(v117 + 8 * v91);
          if (!v78)
          {
            while (1)
            {
              int64_t v77 = v91 + 1;
              if (__OFADD__(v91, 1)) {
                goto LABEL_46;
              }
              if (v77 >= v128)
              {
                uint64_t v158 = 0;
                uint64_t v76 = 1;
                int64_t v77 = v108;
                goto LABEL_32;
              }
              unint64_t v78 = *(void *)(v117 + 8 * v77);
              ++v91;
              if (v78) {
                goto LABEL_20;
              }
            }
          }
          int64_t v77 = v55 + 3;
LABEL_20:
          uint64_t v72 = v15;
          uint64_t v158 = (v78 - 1) & v78;
          unint64_t v73 = __clz(__rbit64(v78)) + (v77 << 6);
          uint64_t WitnessTable = v77;
LABEL_16:
          uint64_t v74 = v135;
          unint64_t v75 = v150;
          (*(void (**)(char *, unint64_t, uint64_t))(v61 + 16))(v150, *(void *)(v135 + 48) + *(void *)(v61 + 72) * v73, v19);
          (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(&v75[*(int *)(v60 + 48)], *(void *)(v74 + 56) + *(void *)(v62 + 72) * v73, v165);
          uint64_t v76 = 0;
          uint64_t v15 = v72;
          goto LABEL_24;
        }
        uint64_t WitnessTable = v55 + 2;
      }
      uint64_t v158 = 0;
      uint64_t v76 = 1;
LABEL_23:
      unint64_t v75 = v150;
LABEL_24:
      uint64_t v79 = *(void *)(v60 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v75, v76, 1, v60);
      char v80 = v151;
      (*v146)(v151, v75, v152);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v80, 1, v60) == 1)
      {
        swift_release();
        uint64_t v52 = v123;
        *(void *)((char *)v123 + qword_26893BDA8) = v184;
        uint64_t v92 = v173;
        uint64_t v93 = v126;
        swift_beginAccess();
        *uint64_t v93 = v92;
        swift_bridgeObjectRelease();
        uint64_t v94 = v172;
        v95 = v125;
        swift_beginAccess();
        uint64_t *v95 = v94;
        swift_bridgeObjectRelease();
        uint64_t v96 = v171;
        unint64_t v97 = v124;
        swift_beginAccess();
        *unint64_t v97 = v96;
        swift_bridgeObjectRelease();
        sub_237AEEB50();
        char v166 = 1;
        uint64_t v98 = sub_237AEE1AC(&qword_26893AFB0, (void (*)(uint64_t))type metadata accessor for LamportTimestamp);
        uint64_t v167 = v129;
        uint64_t v168 = v98;
        swift_getWitnessTable();
        uint64_t v99 = v119;
        uint64_t v100 = v110;
        uint64_t v101 = v109;
        sub_237AEF080();
        if (!v101)
        {
          uint64_t v102 = v169;
          uint64_t v103 = v122;
          swift_beginAccess();
          *uint64_t v103 = v102;
          swift_bridgeObjectRelease();
          LOBYTE(v169) = 2;
          uint64_t v104 = (uint64_t)v112;
          sub_237AEF080();
          uint64_t v105 = v118;
          swift_release();
          uint64_t v106 = v111;
          sub_237AEE124(v104, v111, type metadata accessor for LamportTimestamp);
          *(void *)((char *)v52 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller) = 0;
          *(_DWORD *)((char *)v52 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__parentPropertyID) = -1;
          *(_DWORD *)((char *)v52 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__propertyID) = -1;
          uint64_t v107 = OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__pendingModelControllers;
          *(void *)((char *)v52 + v107) = sub_237A30FF8(MEMORY[0x263F8EE78]);
          sub_237A67E68(v106, (uint64_t)v52 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__timestamp, type metadata accessor for LamportTimestamp);
          sub_237AEE1F4(v104, type metadata accessor for LamportTimestamp);
          (*(void (**)(char *, uint64_t))(v105 + 8))(v100, v99);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
          return (uint64_t)v52;
        }
        (*(void (**)(char *, uint64_t))(v118 + 8))(v100, v99);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      v81 = &v80[*(int *)(v60 + 48)];
      int v82 = v160;
      (*v143)(v160, v80, v19);
      v83 = v161;
      uint64_t v84 = v165;
      (*v142)(v161, v81, v165);
      uint64_t v85 = *v164;
      (*v164)(v71, v82, v19);
      uint64_t v86 = *v141;
      (*v141)(v70, v83, v15);
      (*v140)(v70, 0, 1, v15);
      sub_237AEEB50();
      sub_237AEEB70();
      v86(v149, v83, v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
      if (swift_dynamicCast())
      {
        swift_unknownObjectRelease();
        uint64_t v87 = v132;
        sub_237A2D334((uint64_t)&v83[*(int *)(v84 + 88)], v132, &qword_26893AFA8);
        uint64_t v88 = v136;
        int v89 = (*v127)(v87, 1, v136);
        uint64_t v90 = (uint64_t)v133;
        if (v89 == 1)
        {
          sub_237A2D868(v87, &qword_26893AFA8);
        }
        else
        {
          v63 = v131;
          (*v116)(v131, v87, v88);
          uint64_t v64 = v162;
          uint64_t v65 = v160;
          v85(v162, v160, v19);
          (*v115)(v90, v63, v88);
          (*v114)(v90, 0, 1, v88);
          sub_237AEEB50();
          sub_237AEEB70();
          v85(v64, v65, v19);
          sub_237A2D334((uint64_t)&v161[*(int *)(v84 + 92)], v90, &qword_26893AFA8);
          sub_237AEEB70();
          (*v113)(v131, v136);
        }
      }
      uint64_t v66 = (uint64_t)v148;
      uint64_t v62 = v153;
      uint64_t v67 = v160;
      uint64_t v19 = v144;
      v85(v162, v160, v144);
      uint64_t v68 = v165;
      v69 = v161;
      sub_237AEE124((uint64_t)&v161[*(int *)(v165 + 84)], v66, type metadata accessor for LamportTimestamp);
      (*v139)(v66, 0, 1, v157);
      sub_237AEEB50();
      sub_237AEEB70();
      (*v138)(v69, v68);
      uint64_t result = (*v137)(v67, v19);
      uint64_t v15 = v145;
      uint64_t v61 = v155;
      uint64_t v60 = TupleTypeMetadata2;
      uint64_t v55 = WitnessTable;
      unint64_t v59 = v158;
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v130);
  uint64_t v52 = v123;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_deallocPartialClassInstance();
  return (uint64_t)v52;
}

uint64_t type metadata accessor for SyncedDictionary.Element()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for SyncedDictionary.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t SyncedDictionary.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  char v170 = a1;
  uint64_t v3 = (void *)*v1;
  uint64_t v157 = type metadata accessor for LamportTimestamp(0);
  int64_t v171 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  uint64_t v120 = (uint64_t)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v147 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v146 = (char *)&v119 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v136 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v150 = (uint64_t)&v119 - v12;
  uint64_t v13 = v3[35];
  uint64_t v14 = v3[36];
  uint64_t v15 = v3[37];
  uint64_t v16 = v3[38];
  uint64_t v169 = v3[39];
  uint64_t v17 = v3[40];
  uint64_t v18 = v3[41];
  uint64_t v19 = v3[42];
  uint64_t v181 = v13;
  uint64_t v182 = v14;
  uint64_t v183 = v15;
  uint64_t v184 = v16;
  uint64_t v185 = v169;
  uint64_t v186 = v17;
  uint64_t v187 = v18;
  uint64_t v188 = v19;
  uint64_t v166 = type metadata accessor for SyncedDictionary.Element();
  uint64_t v20 = sub_237AEEE50();
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v131 = (uint64_t)&v119 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v130 = (uint64_t)&v119 - v24;
  uint64_t v134 = *(void *)(v14 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v132 = (char *)&v119 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v151 = (char *)&v119 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v156 = (char *)&v119 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v162 = (char *)&v119 - v32;
  uint64_t v133 = *(void *)(v13 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v149 = (char *)&v119 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v148 = (char *)&v119 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v172 = (char *)&v119 - v37;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v161 = sub_237AEEE50();
  unint64_t v164 = *(void *)(v161 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v161);
  uint64_t v40 = (char *)&v119 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  v160 = (char *)&v119 - v41;
  uint64_t v181 = v13;
  uint64_t v182 = v14;
  uint64_t v135 = v14;
  uint64_t v145 = v15;
  uint64_t v183 = v15;
  uint64_t v184 = v16;
  uint64_t v163 = v16;
  uint64_t v185 = v169;
  uint64_t v186 = v17;
  uint64_t v144 = v17;
  uint64_t v143 = v18;
  uint64_t v187 = v18;
  uint64_t v188 = v19;
  uint64_t v142 = v19;
  type metadata accessor for SyncedDictionary.CodingKeys();
  swift_getWitnessTable();
  uint64_t v125 = sub_237AEF0E0();
  uint64_t v122 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v43 = (char *)&v119 - v42;
  __swift_project_boxed_opaque_existential_1(v170, v170[3]);
  v124 = v43;
  sub_237AEF2B0();
  uint64_t v44 = v13;
  uint64_t v189 = sub_237AEEAE0();
  uint64_t v45 = (void *)((char *)v2 + qword_26893BDA8);
  swift_beginAccess();
  unint64_t v46 = *v45;
  if ((*v45 & 0xC000000000000001) != 0)
  {
    uint64_t v47 = sub_237AEEFB0();
    unint64_t v127 = 0;
    uint64_t v48 = 0;
    unint64_t v49 = 0;
    unint64_t v50 = v47 | 0x8000000000000000;
  }
  else
  {
    uint64_t v51 = -1 << *(unsigned char *)(v46 + 32);
    uint64_t v48 = ~v51;
    uint64_t v52 = *(void *)(v46 + 64);
    unint64_t v127 = v46 + 64;
    uint64_t v53 = -v51;
    if (v53 < 64) {
      uint64_t v54 = ~(-1 << v53);
    }
    else {
      uint64_t v54 = -1;
    }
    unint64_t v49 = v54 & v52;
    unint64_t v50 = v46;
  }
  v121 = v2;
  uint64_t v155 = (void *)((char *)v2 + qword_26893BD88);
  uint64_t v129 = v50 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v159 = TupleTypeMetadata2 - 8;
  uint64_t v123 = v48;
  uint64_t v168 = (void (**)(char *, char *, uint64_t))(v133 + 16);
  uint64_t v167 = (void (**)(char *, char *, uint64_t))(v134 + 16);
  uint64_t v158 = (void (**)(void))(v164 + 32);
  v154 = (void (**)(char *, char *, uint64_t))(v133 + 32);
  uint64_t v153 = (void (**)(char *, char *, uint64_t))(v134 + 32);
  uint64_t v152 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v171 + 48);
  uint64_t v140 = v166 - 8;
  v139 = (void (**)(char *, uint64_t))(v134 + 8);
  uint64_t v138 = (uint64_t (**)(char *, uint64_t))(v133 + 8);
  int64_t v128 = (unint64_t)(v48 + 64) >> 6;
  int64_t v119 = v128 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v56 = 0;
  uint64_t v57 = v136;
  uint64_t v58 = v135;
  unint64_t v59 = v162;
  unint64_t v60 = v50;
  unint64_t v164 = v50;
  uint64_t v141 = v40;
  while (1)
  {
    if ((v60 & 0x8000000000000000) != 0)
    {
      if (sub_237AEEFC0())
      {
        sub_237AEF150();
        swift_unknownObjectRelease();
        uint64_t v66 = TupleTypeMetadata2;
        sub_237AEF150();
        swift_unknownObjectRelease();
        uint64_t v64 = v66;
        uint64_t v65 = 0;
        int64_t v171 = v56;
        char v170 = (void *)v49;
        uint64_t v57 = v136;
        goto LABEL_22;
      }
      uint64_t v65 = 1;
      int64_t v171 = v56;
      char v170 = (void *)v49;
      uint64_t v57 = v136;
    }
    else
    {
      if (v49)
      {
        char v170 = (void *)((v49 - 1) & v49);
        unint64_t v61 = __clz(__rbit64(v49)) | (v56 << 6);
        int64_t v171 = v56;
        goto LABEL_12;
      }
      int64_t v67 = v56 + 1;
      if (__OFADD__(v56, 1))
      {
        __break(1u);
        goto LABEL_49;
      }
      if (v67 >= v128)
      {
        char v170 = 0;
        uint64_t v65 = 1;
        int64_t v171 = v56;
      }
      else
      {
        unint64_t v68 = *(void *)(v127 + 8 * v67);
        if (v68) {
          goto LABEL_18;
        }
        if (v56 + 2 >= v128)
        {
          int64_t v171 = v56 + 1;
          char v170 = 0;
          uint64_t v65 = 1;
        }
        else
        {
          unint64_t v68 = *(void *)(v127 + 8 * (v56 + 2));
          if (v68)
          {
            int64_t v67 = v56 + 2;
LABEL_31:
            unint64_t v60 = v164;
LABEL_18:
            char v170 = (void *)((v68 - 1) & v68);
            int64_t v171 = v67;
            unint64_t v61 = __clz(__rbit64(v68)) + (v67 << 6);
LABEL_12:
            (*(void (**)(char *, unint64_t, uint64_t))(v133 + 16))(v40, *(void *)(v60 + 48) + *(void *)(v133 + 72) * v61, v44);
            unint64_t v62 = *(void *)(v60 + 56) + *(void *)(v134 + 72) * v61;
            uint64_t v63 = TupleTypeMetadata2;
            (*(void (**)(char *, unint64_t, uint64_t))(v134 + 16))(&v40[*(int *)(TupleTypeMetadata2 + 48)], v62, v58);
            uint64_t v64 = v63;
            uint64_t v65 = 0;
            goto LABEL_22;
          }
          uint64_t v108 = v56 + 3;
          if (v56 + 3 < v128)
          {
            unint64_t v68 = *(void *)(v127 + 8 * v108);
            if (!v68)
            {
              uint64_t v64 = TupleTypeMetadata2;
              unint64_t v60 = v164;
              while (1)
              {
                int64_t v67 = v108 + 1;
                if (__OFADD__(v108, 1)) {
                  break;
                }
                if (v67 >= v128)
                {
                  char v170 = 0;
                  uint64_t v65 = 1;
                  int64_t v171 = v119;
                  goto LABEL_22;
                }
                unint64_t v68 = *(void *)(v127 + 8 * v67);
                ++v108;
                if (v68) {
                  goto LABEL_18;
                }
              }
LABEL_49:
              __break(1u);
LABEL_50:
              __break(1u);
LABEL_51:
              __break(1u);
              return result;
            }
            int64_t v67 = v56 + 3;
            goto LABEL_31;
          }
          char v170 = 0;
          uint64_t v65 = 1;
          int64_t v171 = v56 + 2;
        }
      }
    }
    uint64_t v64 = TupleTypeMetadata2;
LABEL_22:
    uint64_t v69 = *(void *)(v64 - 8);
    v70 = v40;
    uint64_t v71 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 56))(v70, v65, 1);
    uint64_t v72 = v160;
    (*v158)();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v72, 1, v71) == 1) {
      break;
    }
    unint64_t v73 = &v72[*(int *)(v71 + 48)];
    uint64_t v74 = v172;
    uint64_t v75 = v44;
    (*v154)(v172, v72, v44);
    (*v153)(v59, v73, v58);
    uint64_t v76 = *v167;
    (*v167)(v156, v59, v58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
    if (swift_dynamicCast())
    {
      int64_t v77 = v74;
      uint64_t v79 = v177;
      uint64_t v78 = v178;
      (*v168)(v148, v77, v75);
      v76(v151, v59, v58);
      char v80 = v155;
      swift_beginAccess();
      uint64_t v81 = *v80;
      uint64_t v82 = v150;
      v83 = v77;
      uint64_t v84 = v157;
      MEMORY[0x237E281B0](v83, v81, v75, v157, v169);
      swift_endAccess();
      uint64_t result = (*v152)(v82, 1, v84);
      if (result == 1) {
        goto LABEL_50;
      }
      uint64_t v85 = v75;
      uint64_t v137 = v79;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v87 = sub_237A51A38(ObjectType, v78) + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__uuid;
      swift_beginAccess();
      uint64_t v88 = sub_237AEE520();
      uint64_t v89 = *(void *)(v88 - 8);
      uint64_t v90 = (uint64_t)v146;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v146, v87, v88);
      swift_release();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v89 + 56))(v90, 0, 1, v88);
      uint64_t v91 = sub_237A51A38(ObjectType, v78) + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownerUUID;
      swift_beginAccess();
      uint64_t v92 = v91;
      uint64_t v93 = (uint64_t)v147;
      sub_237A2D334(v92, (uint64_t)v147, &qword_26893AFA8);
      swift_release();
      uint64_t v94 = v130;
      uint64_t v95 = v135;
      sub_237AD95E0((uint64_t)v151, v150, v90, v93, v135, v130);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v166 - 8) + 56))(v94, 0, 1, v166);
      sub_237AEEB50();
      sub_237AEEB70();
      swift_unknownObjectRelease();
      uint64_t v75 = v85;
      uint64_t v57 = v136;
      uint64_t v58 = v95;
    }
    else
    {
      uint64_t v96 = v59;
      (*v168)(v149, v74, v44);
      uint64_t v97 = (uint64_t)v132;
      v76(v132, v96, v58);
      uint64_t v98 = v155;
      swift_beginAccess();
      uint64_t v99 = *v98;
      uint64_t v100 = v157;
      MEMORY[0x237E281B0](v74, v99, v44, v157, v169);
      swift_endAccess();
      uint64_t result = (*v152)((uint64_t)v57, 1, v100);
      if (result == 1) {
        goto LABEL_51;
      }
      uint64_t v101 = (uint64_t)v57;
      uint64_t v102 = v58;
      uint64_t v103 = sub_237AEE520();
      uint64_t v104 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56);
      uint64_t v105 = (uint64_t)v146;
      v104(v146, 1, 1, v103);
      uint64_t v106 = (uint64_t)v147;
      v104(v147, 1, 1, v103);
      uint64_t v107 = v131;
      sub_237AD95E0(v97, v101, v105, v106, v102, v131);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v166 - 8) + 56))(v107, 0, 1, v166);
      sub_237AEEB50();
      sub_237AEEB70();
      uint64_t v57 = (char *)v101;
      uint64_t v58 = v102;
    }
    unint64_t v59 = v162;
    (*v139)(v162, v58);
    uint64_t v44 = v75;
    uint64_t result = (*v138)(v172, v75);
    int64_t v56 = v171;
    unint64_t v49 = (unint64_t)v170;
    uint64_t v40 = v141;
    unint64_t v60 = v164;
  }
  sub_237A6483C();
  uint64_t v177 = v189;
  LOBYTE(v173) = 0;
  sub_237AEEB50();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v179 = v163;
  uint64_t v180 = WitnessTable;
  swift_getWitnessTable();
  uint64_t v110 = v125;
  uint64_t v111 = v124;
  uint64_t v112 = v126;
  sub_237AEF0D0();
  if (v112)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v113 = v121;
    int v114 = (void *)((char *)v121 + qword_26893BD80);
    swift_beginAccess();
    uint64_t v173 = *v114;
    char v176 = 1;
    sub_237AEEB50();
    uint64_t v115 = sub_237AEE1AC(&qword_26893AFC0, (void (*)(uint64_t))type metadata accessor for LamportTimestamp);
    uint64_t v174 = v163;
    uint64_t v175 = v115;
    swift_getWitnessTable();
    sub_237AEF0D0();
    uint64_t v116 = (uint64_t)v113 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__timestamp;
    swift_beginAccess();
    uint64_t v117 = v116;
    uint64_t v118 = v120;
    sub_237AEE124(v117, v120, type metadata accessor for LamportTimestamp);
    char v176 = 2;
    sub_237AEF0D0();
    sub_237AEE1F4(v118, type metadata accessor for LamportTimestamp);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v111, v110);
}

void *SyncedDictionary.__allocating_init(wrappedValue:)(unint64_t a1)
{
  swift_allocObject();
  uint64_t v2 = sub_237AEAEB8(a1);
  swift_bridgeObjectRelease();
  return v2;
}

void *SyncedDictionary.init(wrappedValue:)(unint64_t a1)
{
  unint64_t v1 = sub_237AEAEB8(a1);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_237ADC9C0(unint64_t a1)
{
  unint64_t v389 = a1;
  uint64_t v3 = *(void *)(*(void *)v1 + 288);
  uint64_t v4 = *(void *)(*(void *)v1 + 296);
  uint64_t v5 = *(void *)(*(void *)v1 + 304);
  uint64_t v6 = *(char **)(*(void *)v1 + 312);
  uint64_t v7 = *(void *)(*(void *)v1 + 320);
  uint64_t v8 = *(void *)(*(void *)v1 + 328);
  uint64_t v9 = *(void *)(*(void *)v1 + 336);
  v430[0] = *(void *)(*(void *)v1 + 280);
  uint64_t v2 = v430[0];
  v430[1] = v3;
  uint64_t v363 = v4;
  v430[2] = v4;
  uint64_t v431 = v5;
  uint64_t v362 = v5;
  v416 = v6;
  v432 = v6;
  uint64_t v433 = v7;
  uint64_t v361 = v7;
  uint64_t v360 = v8;
  uint64_t v434 = v8;
  uint64_t v435 = v9;
  uint64_t v374 = v9;
  type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26893AE00);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v334 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v333 = (_OWORD *)((char *)&v329 - v11);
  MEMORY[0x270FA5388](v10);
  v332 = (char *)&v329 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ValueData(0);
  uint64_t v341 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v346 = (uint64_t)&v329 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v338 = (uint64_t)&v329 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v354 = (char *)&v329 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v359 = (char *)&v329 - v21;
  MEMORY[0x270FA5388](v20);
  v345 = (char *)&v329 - v22;
  uint64_t v400 = type metadata accessor for LamportTimestamp(0);
  uint64_t v419 = *(void *)(v400 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v400);
  v364 = (char *)&v329 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v358 = (uint64_t)&v329 - v26;
  MEMORY[0x270FA5388](v25);
  v373 = (int *)((char *)&v329 - v27);
  uint64_t v411 = sub_237AEEE50();
  v418 = *(void (***)(char *, uint64_t))(v411 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v411);
  v337 = (char *)&v329 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v368 = (char *)&v329 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v371 = (char *)&v329 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v336 = (char *)&v329 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v384 = (char *)&v329 - v37;
  uint64_t v376 = *(void *)(v3 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v413 = (char *)&v329 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v378 = (char *)&v329 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v44 = (char *)&v329 - v43;
  uint64_t v375 = *(void *)(v2 - 8);
  uint64_t v45 = MEMORY[0x270FA5388](v42);
  v396 = (char *)&v329 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v383 = (char *)&v329 - v48;
  MEMORY[0x270FA5388](v47);
  v426 = (char *)&v329 - v49;
  uint64_t v405 = v2;
  uint64_t v417 = v3;
  uint64_t v424 = swift_getTupleTypeMetadata2();
  uint64_t v414 = sub_237AEEE50();
  v422 = *(void (***)(void, void))(v414 - 8);
  uint64_t v50 = MEMORY[0x270FA5388](v414);
  v402 = (char *)&v329 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v370 = (char *)&v329 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  int64_t v56 = (char *)&v329 - v55;
  MEMORY[0x270FA5388](v54);
  v404 = (char *)&v329 - v57;
  uint64_t v394 = type metadata accessor for PBUUID(0);
  uint64_t v393 = *(void *)(v394 - 8);
  MEMORY[0x270FA5388](v394);
  v388 = (unint64_t *)((char *)&v329 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v60 = MEMORY[0x270FA5388](v59 - 8);
  v353 = (char *)&v329 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v357 = (char *)&v329 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v350 = (char *)&v329 - v65;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v349 = (char *)&v329 - v67;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  v344 = (char *)&v329 - v69;
  MEMORY[0x270FA5388](v68);
  unint64_t v71 = (unint64_t)&v329 - v70;
  uint64_t v72 = sub_237AEE520();
  v420 = *(void **)(v72 - 8);
  uint64_t v73 = MEMORY[0x270FA5388](v72);
  uint64_t v75 = (char *)&v329 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = MEMORY[0x270FA5388](v73);
  v356 = (char *)&v329 - v77;
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  v343 = (char *)&v329 - v79;
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  v387 = (char *)&v329 - v81;
  uint64_t v82 = MEMORY[0x270FA5388](v80);
  v386 = (char *)&v329 - v83;
  MEMORY[0x270FA5388](v82);
  uint64_t v85 = (char *)&v329 - v84;
  uint64_t v86 = type metadata accessor for DictionaryChangedMessage(0);
  MEMORY[0x270FA5388](v86);
  uint64_t v399 = (uint64_t)&v329 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v423 = v1;
  uint64_t v421 = OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller;
  uint64_t v88 = *(void *)(v1 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller);
  *(void *)&long long v427 = v72;
  if (v88)
  {
    uint64_t v89 = *(uint64_t (**)(uint64_t))(*(void *)v88 + 744);
    uint64_t v90 = swift_retain();
    if ((v89(v90) & 1) == 0)
    {
      if (qword_26893ACC8 != -1) {
        goto LABEL_205;
      }
      goto LABEL_8;
    }
    swift_release();
    uint64_t v72 = v427;
  }
  uint64_t v91 = sub_237AEEC60();
  uint64_t v92 = sub_237AEEC60();
  uint64_t v93 = sub_237AEEC60();
  *(void *)&long long v428 = v91;
  *((void *)&v428 + 1) = v92;
  uint64_t v429 = v93;
  uint64_t v94 = v423;
  uint64_t v95 = *(void *)(v423 + v421);
  v352 = v75;
  uint64_t v425 = (uint64_t)v44;
  if (!v95)
  {
    uint64_t v96 = (char *)v420;
    v398 = (void (*)(unint64_t, uint64_t, uint64_t, uint64_t))v420[7];
    v398(v71, 1, 1, v72);
LABEL_13:
    uint64_t v100 = (void (*)(char *, uint64_t))v85;
    if (qword_26893AD10 != -1) {
      goto LABEL_203;
    }
    goto LABEL_14;
  }
  uint64_t v96 = (char *)v420;
  unint64_t v97 = (unint64_t)(v420 + 2);
  uint64_t v98 = (void (*)(unint64_t, uint64_t, uint64_t))v420[2];
  v98(v71, v95 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID, v72);
  v398 = (void (*)(unint64_t, uint64_t, uint64_t, uint64_t))*((void *)v96 + 7);
  v398(v71, 0, 1, v72);
  if ((*((unsigned int (**)(unint64_t, uint64_t, uint64_t))v96 + 6))(v71, 1, v72) == 1) {
    goto LABEL_13;
  }
  unint64_t v99 = v97 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v100 = (void (*)(char *, uint64_t))v85;
  (*((void (**)(char *, unint64_t, uint64_t))v96 + 4))(v85, v71, v72);
  uint64_t v101 = v98;
LABEL_15:
  v342 = (char *)&v428 + 8;
  v351 = &v429;
  LODWORD(v415) = *(_DWORD *)(v94 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__propertyID);
  uint64_t v107 = v399;
  *(_DWORD *)uint64_t v399 = 0;
  uint64_t v108 = MEMORY[0x263F8EE78];
  *(void *)(v107 + 8) = MEMORY[0x263F8EE78];
  *(void *)(v107 + 16) = v108;
  *(void *)(v107 + 24) = v108;
  *(void *)(v107 + 32) = v108;
  *(void *)(v107 + 40) = v108;
  *(void *)(v107 + 48) = v108;
  *(void *)(v107 + 56) = v108;
  *(void *)(v107 + 64) = v108;
  sub_237AEE6E0();
  uint64_t v109 = v107 + *(int *)(v86 + 56);
  uint64_t v110 = v393 + 56;
  uint64_t v111 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v393 + 56);
  v111(v109, 1, 1, v394);
  uint64_t v112 = v386;
  v412 = (char **)v100;
  v101((unint64_t)v386, (uint64_t)v100, v72);
  uint64_t v113 = (uint64_t)v387;
  v407 = (void (*)(char *, char *, uint64_t))v101;
  unint64_t v401 = v99;
  v101((unint64_t)v387, (uint64_t)v112, v72);
  int v114 = v388;
  sub_237A6DFD4(v113, v388);
  sub_237A2D868(v109, &qword_26893AFD0);
  sub_237A67E68((uint64_t)v114, v109, type metadata accessor for PBUUID);
  uint64_t v393 = v110;
  v390 = v111;
  v111(v109, 0, 1, v394);
  uint64_t v115 = v420 + 1;
  uint64_t v116 = (void (*)(char *, uint64_t))v420[1];
  v116(v112, v72);
  v381 = (void (*)(char *, uint64_t))v115;
  v380 = v116;
  v116((char *)v412, v72);
  *(_DWORD *)uint64_t v107 = v415;
  uint64_t v100 = (void (*)(char *, uint64_t))(v423 + qword_26893BDA8);
  swift_beginAccess();
  v369 = (unint64_t *)v100;
  uint64_t v117 = *(void *)v100;
  if ((*(void *)v100 & 0xC000000000000001) != 0)
  {
    uint64_t v118 = sub_237AEEFB0();
    uint64_t v339 = 0;
    uint64_t v119 = 0;
    uint64_t v86 = 0;
    uint64_t v72 = v118 | 0x8000000000000000;
  }
  else
  {
    uint64_t v120 = -1 << *(unsigned char *)(v117 + 32);
    uint64_t v119 = ~v120;
    uint64_t v121 = *(void *)(v117 + 64);
    uint64_t v339 = v117 + 64;
    uint64_t v122 = -v120;
    if (v122 < 64) {
      uint64_t v123 = ~(-1 << v122);
    }
    else {
      uint64_t v123 = -1;
    }
    uint64_t v86 = v123 & v121;
    uint64_t v72 = v117;
  }
  uint64_t v94 = v405;
  uint64_t v124 = v417;
  uint64_t v125 = v424;
  uint64_t v366 = v423 + qword_26893BD88;
  uint64_t v355 = v72 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v377 = qword_26893BDA0;
  uint64_t v385 = v424 - 8;
  uint64_t v331 = v119;
  v415 = (void (**)(char *, uint64_t, uint64_t))(v375 + 16);
  v406 = (void (**)(uint64_t *, uint64_t, uint64_t))(v376 + 16);
  v412 = (char **)(v422 + 4);
  v410 = (void (**)(char *, char *, uint64_t))(v375 + 32);
  uint64_t v96 = (char *)(v376 + 32);
  v422 = (void (**)(void, void))(v376 + 48);
  v379 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v419 + 48);
  v397 = v420 + 7;
  v365 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v420 + 6);
  v347 = (void (**)(char *, uint64_t, uint64_t))(v420 + 4);
  v340 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v376 + 56);
  v392 = v418 + 1;
  v418 = (void (**)(char *, uint64_t))(v376 + 8);
  v408 = (void (**)(uint64_t, uint64_t))(v375 + 8);
  int64_t v348 = (unint64_t)(v119 + 64) >> 6;
  v330 = (void *)(v348 - 1);
  swift_bridgeObjectRetain();
  uint64_t v126 = 0;
  v372 = 0;
  v409 = v96;
  unint64_t v127 = v404;
  unint64_t v391 = v72;
  unint64_t v71 = v72;
  uint64_t v382 = (uint64_t)v56;
  while (1)
  {
    v395 = (uint64_t *)v86;
    v403 = v126;
    if ((v71 & 0x8000000000000000) == 0)
    {
      if (v86)
      {
        uint64_t v419 = (v86 - 1) & v86;
        unint64_t v128 = __clz(__rbit64(v86)) | ((void)v126 << 6);
        v420 = v126;
LABEL_27:
        (*(void (**)(char *, unint64_t, uint64_t))(v375 + 16))(v56, *(void *)(v71 + 48) + *(void *)(v375 + 72) * v128, v94);
        (*(void (**)(char *, unint64_t, uint64_t))(v376 + 16))(&v56[*(int *)(v125 + 48)], *(void *)(v71 + 56) + *(void *)(v376 + 72) * v128, v124);
        uint64_t v129 = 0;
        goto LABEL_37;
      }
      int64_t v130 = (int64_t)v126 + 1;
      if (!__OFADD__(v126, 1))
      {
        if (v130 >= v348)
        {
          uint64_t v419 = 0;
          uint64_t v129 = 1;
          v420 = v126;
          goto LABEL_37;
        }
        unint64_t v131 = *(void *)(v339 + 8 * v130);
        if (v131) {
          goto LABEL_33;
        }
        if ((uint64_t)v126 + 2 >= v348)
        {
          v420 = (void *)((char *)v126 + 1);
          uint64_t v419 = 0;
          uint64_t v129 = 1;
          goto LABEL_37;
        }
        unint64_t v131 = *(void *)(v339 + 8 * ((void)v126 + 2));
        if (v131)
        {
          int64_t v130 = (int64_t)v126 + 2;
LABEL_33:
          uint64_t v419 = (v131 - 1) & v131;
          v420 = (void *)v130;
          unint64_t v128 = __clz(__rbit64(v131)) + (v130 << 6);
          goto LABEL_27;
        }
        v237 = (char *)v126 + 3;
        if ((uint64_t)v126 + 3 >= v348)
        {
          uint64_t v419 = 0;
          uint64_t v129 = 1;
          v420 = (void *)((char *)v126 + 2);
          goto LABEL_37;
        }
        unint64_t v131 = *(void *)(v339 + 8 * (void)v237);
        if (v131)
        {
          int64_t v130 = (int64_t)v126 + 3;
          goto LABEL_33;
        }
        while (1)
        {
          int64_t v130 = (int64_t)(v237 + 1);
          if (__OFADD__(v237, 1)) {
            break;
          }
          if (v130 >= v348)
          {
            uint64_t v419 = 0;
            uint64_t v129 = 1;
            v420 = v330;
            goto LABEL_37;
          }
          unint64_t v131 = *(void *)(v339 + 8 * v130);
          ++v237;
          if (v131) {
            goto LABEL_33;
          }
        }
        __break(1u);
LABEL_205:
        swift_once();
LABEL_8:
        uint64_t v102 = sub_237AEE970();
        __swift_project_value_buffer(v102, (uint64_t)qword_26893C038);
        uint64_t v103 = sub_237AEE950();
        os_log_type_t v104 = sub_237AEEDB0();
        if (os_log_type_enabled(v103, v104))
        {
          uint64_t v105 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v105 = 0;
          _os_log_impl(&dword_237A22000, v103, v104, "SyncedDictionary: Property not registered or is owned by somebody else", v105, 2u);
          MEMORY[0x237E28EF0](v105, -1, -1);
        }

LABEL_11:
        swift_release();
        return;
      }
LABEL_201:
      __break(1u);
LABEL_202:
      __break(1u);
LABEL_203:
      swift_once();
LABEL_14:
      uint64_t v106 = __swift_project_value_buffer(v72, (uint64_t)qword_26893C0C8);
      uint64_t v101 = (void (*)(unint64_t, uint64_t, uint64_t))*((void *)v96 + 2);
      unint64_t v99 = (unint64_t)(v96 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v101((unint64_t)v100, v106, v72);
      sub_237A2D868(v71, &qword_26893AFA8);
      goto LABEL_15;
    }
    if (sub_237AEEFC0())
    {
      sub_237AEF150();
      swift_unknownObjectRelease();
      uint64_t v125 = v424;
      sub_237AEF150();
      swift_unknownObjectRelease();
      uint64_t v129 = 0;
      v420 = v403;
      uint64_t v419 = v86;
    }
    else
    {
      uint64_t v129 = 1;
      v420 = v403;
      uint64_t v419 = v86;
      uint64_t v125 = v424;
    }
    unint64_t v127 = v404;
LABEL_37:
    uint64_t v132 = v56;
    uint64_t v133 = *(void *)(v125 - 8);
    uint64_t v134 = v133;
    uint64_t v135 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v133 + 56);
    uint64_t v136 = v133 + 56;
    v135(v132, v129, 1, v125);
    uint64_t v137 = *v412;
    ((void (*)(char *, char *, uint64_t))*v412)(v127, v132, v414);
    v139 = *(void **)(v134 + 48);
    uint64_t v86 = v134 + 48;
    uint64_t v138 = v139;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v139)(v127, 1, v125) == 1) {
      break;
    }
    uint64_t v140 = v127;
    uint64_t v141 = &v127[*(int *)(v125 + 48)];
    uint64_t v142 = (uint64_t)v426;
    (*v410)(v426, v140, v94);
    uint64_t v143 = *(void (**)(char *, char *, uint64_t))v409;
    uint64_t v124 = v417;
    (*(void (**)(uint64_t, char *, uint64_t))v409)(v425, v141, v417);
    uint64_t v144 = v384;
    unint64_t v145 = v389;
    uint64_t v96 = v416;
    MEMORY[0x237E281B0](v142, v389, v94, v124, v416);
    uint64_t v100 = (void (*)(char *, uint64_t))*v422;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))*v422)(v144, 1, v124) == 1)
    {
      uint64_t v146 = v392;
      uint64_t v147 = v411;
      (*v392)(v144, v411);
      goto LABEL_42;
    }
    v148 = v144;
    v149 = v378;
    v143(v378, v148, v124);
    if (sub_237AEEBA0())
    {
      (*v418)(v149, v124);
      uint64_t v146 = v392;
      uint64_t v147 = v411;
LABEL_42:
      uint64_t v150 = v371;
      uint64_t v72 = (uint64_t)v426;
      MEMORY[0x237E281B0](v426, v145, v94, v124, v96);
      int v151 = ((uint64_t (*)(char *, uint64_t, uint64_t))v100)(v150, 1, v124);
      (*v146)(v150, v147);
      if (v151 != 1)
      {
        (*v418)((char *)v425, v124);
        int64_t v56 = (char *)v382;
        unint64_t v127 = v404;
        uint64_t v125 = v424;
        uint64_t v86 = v419;
        unint64_t v71 = v391;
        goto LABEL_23;
      }
      (*v415)(v383, v72, v94);
      sub_237AEECC0();
      sub_237AEECA0();
      uint64_t v152 = (uint64_t *)v366;
      swift_beginAccess();
      uint64_t v153 = *v152;
      uint64_t v154 = (uint64_t)v359;
      uint64_t v155 = v400;
      MEMORY[0x237E281B0](v72, v153, v94, v400, v96);
      int v156 = (*v379)(v154, 1, v155);
      uint64_t v86 = v358;
      if (v156 == 1)
      {
        sub_237A2D868(v154, &qword_26893AFE0);
        swift_endAccess();
LABEL_208:
        sub_237AEEFE0();
        __break(1u);
        return;
      }
      sub_237A67E68(v154, v358, type metadata accessor for LamportTimestamp);
      swift_endAccess();
      uint64_t v157 = *(void *)(v423 + v421);
      if (v157)
      {
        uint64_t v158 = (uint64_t)v357;
        uint64_t v159 = v427;
        v407(v357, (char *)(v157 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID), v427);
        v398(v158, 0, 1, v159);
        if ((*v365)(v158, 1, v159) != 1)
        {
          int64_t v56 = v356;
          (*v347)(v356, v158, v159);
          v160 = v407;
          goto LABEL_55;
        }
      }
      else
      {
        uint64_t v158 = (uint64_t)v357;
        v398((unint64_t)v357, 1, 1, v427);
      }
      if (qword_26893AD10 != -1) {
        swift_once();
      }
      uint64_t v159 = v427;
      uint64_t v173 = __swift_project_value_buffer(v427, (uint64_t)qword_26893C0C8);
      int64_t v56 = v356;
      v160 = v407;
      v407(v356, (char *)v173, v159);
      sub_237A2D868(v158, &qword_26893AFA8);
LABEL_55:
      uint64_t v94 = (uint64_t)v386;
      v160(v386, v56, v159);
      uint64_t v174 = (uint64_t)v387;
      v160(v387, (char *)v94, v159);
      uint64_t v72 = (uint64_t)v388;
      sub_237A6DFD4(v174, v388);
      uint64_t v175 = v86 + *(int *)(v155 + 24);
      sub_237A2D868(v175, &qword_26893AFD0);
      unint64_t v71 = v427;
      sub_237A67E68(v72, v175, type metadata accessor for PBUUID);
      v390(v175, 0, 1, v394);
      uint64_t v100 = v381;
      char v176 = (void (*)(char *, unint64_t))v380;
      v380((char *)v94, v71);
      if (*(_DWORD *)v86 == -1)
      {
        __break(1u);
LABEL_199:
        __break(1u);
LABEL_200:
        __break(1u);
        goto LABEL_201;
      }
      ++*(_DWORD *)v86;
      v176(v56, v71);
      uint64_t v72 = (uint64_t)v426;
      uint64_t v177 = v423;
      sub_237AE1088((uint64_t)v426, v86);
      if (*(unsigned char *)(v177 + v377))
      {
        uint64_t v431 = v124;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v430);
        (*v406)(boxed_opaque_existential_0, v425, v124);
        sub_237A31CD0((uint64_t)v430);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v430);
      }
      uint64_t v94 = v405;
      unint64_t v71 = v391;
      if (*(void *)(v177 + v421))
      {
        uint64_t Strong = swift_weakLoadStrong();
        uint64_t v125 = v424;
        uint64_t v100 = (void (*)(char *, uint64_t))v425;
        if (Strong)
        {
          swift_release();
          uint64_t v180 = v372;
          uint64_t v181 = sub_237AEAD20(v72, v94);
          v372 = v180;
          if (!v180)
          {
            uint64_t v183 = v181;
            uint64_t v184 = v182;
            uint64_t v185 = *(void **)(v399 + 8);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v185 = sub_237A8BC68(0, v185[2] + 1, 1, v185);
            }
            unint64_t v187 = v185[2];
            unint64_t v186 = v185[3];
            if (v187 >= v186 >> 1) {
              uint64_t v185 = sub_237A8BC68((void *)(v186 > 1), v187 + 1, 1, v185);
            }
            unint64_t v71 = v391;
            v185[2] = v187 + 1;
            uint64_t v188 = &v185[2 * v187];
            v188[4] = v183;
            v188[5] = v184;
            uint64_t v189 = v399;
            *(void *)(v399 + 8) = v185;
            int v190 = *(_DWORD *)v86;
            v191 = *(char **)(v189 + 16);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v191 = sub_237A8C170(0, *((void *)v191 + 2) + 1, 1, v191);
            }
            uint64_t v192 = v405;
            uint64_t v124 = v417;
            unint64_t v194 = *((void *)v191 + 2);
            unint64_t v193 = *((void *)v191 + 3);
            if (v194 >= v193 >> 1) {
              v191 = sub_237A8C170((char *)(v193 > 1), v194 + 1, 1, v191);
            }
            *((void *)v191 + 2) = v194 + 1;
            *(_DWORD *)&v191[4 * v194 + 32] = v190;
            *(void *)(v399 + 16) = v191;
            uint64_t v100 = (void (*)(char *, uint64_t))v425;
            uint64_t v94 = v192;
            uint64_t v125 = v424;
            uint64_t v72 = (uint64_t)v426;
            goto LABEL_71;
          }
          sub_237AEE1F4(v86, type metadata accessor for LamportTimestamp);
          (*v418)((char *)v100, v417);
          (*v408)(v72, v94);
          sub_237A6483C();
          uint64_t v316 = v399;
          v212 = v372;
LABEL_193:
          sub_237AEE1F4(v316, type metadata accessor for DictionaryChangedMessage);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_26893ACC8 != -1) {
            swift_once();
          }
          uint64_t v319 = sub_237AEE970();
          __swift_project_value_buffer(v319, (uint64_t)qword_26893C038);
          id v320 = v212;
          id v321 = v212;
          v322 = sub_237AEE950();
          os_log_type_t v323 = sub_237AEEDC0();
          if (os_log_type_enabled(v322, v323))
          {
            v324 = (uint8_t *)swift_slowAlloc();
            uint64_t v325 = swift_slowAlloc();
            v430[0] = v325;
            *(_DWORD *)v324 = 136315138;
            *(void *)&long long v428 = v212;
            id v326 = v212;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD8);
            uint64_t v327 = sub_237AEEBB0();
            *(void *)&long long v428 = sub_237A38B30(v327, v328, v430);
            sub_237AEEE60();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_237A22000, v322, v323, "SyncedDictionary: failed to encode data in setter: %s", v324, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x237E28EF0](v325, -1, -1);
            MEMORY[0x237E28EF0](v324, -1, -1);
          }
          else
          {
          }
          return;
        }
      }
      else
      {
        uint64_t v125 = v424;
        uint64_t v100 = (void (*)(char *, uint64_t))v425;
      }
LABEL_71:
      sub_237AEE1F4(v86, type metadata accessor for LamportTimestamp);
      (*v418)((char *)v100, v124);
      int64_t v56 = (char *)v382;
      unint64_t v127 = v404;
      uint64_t v86 = v419;
      goto LABEL_23;
    }
    uint64_t v161 = (uint64_t)v426;
    (*v415)(v383, (uint64_t)v426, v94);
    sub_237AEECC0();
    sub_237AEECA0();
    v162 = (uint64_t *)v366;
    swift_beginAccess();
    uint64_t v163 = *v162;
    uint64_t v164 = (uint64_t)v345;
    uint64_t v165 = v400;
    MEMORY[0x237E281B0](v161, v163, v94, v400, v96);
    int v166 = (*v379)(v164, 1, v165);
    uint64_t v167 = v427;
    if (v166 == 1)
    {
      sub_237A2D868(v164, &qword_26893AFE0);
      swift_endAccess();
      goto LABEL_208;
    }
    sub_237A67E68(v164, (uint64_t)v373, type metadata accessor for LamportTimestamp);
    swift_endAccess();
    uint64_t v168 = *(void *)(v423 + v421);
    int64_t v56 = (char *)v382;
    uint64_t v169 = (uint64_t)v344;
    if (v168)
    {
      v407(v344, (char *)(v168 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID), v167);
      v398(v169, 0, 1, v167);
      unsigned int v170 = (*v365)(v169, 1, v167);
      int64_t v171 = v343;
      if (v170 != 1)
      {
        (*v347)(v343, v169, v167);
        uint64_t v172 = v407;
        goto LABEL_76;
      }
    }
    else
    {
      v398((unint64_t)v344, 1, 1, v167);
      int64_t v171 = v343;
    }
    if (qword_26893AD10 != -1) {
      swift_once();
    }
    uint64_t v195 = __swift_project_value_buffer(v167, (uint64_t)qword_26893C0C8);
    uint64_t v172 = v407;
    v407(v171, (char *)v195, v167);
    sub_237A2D868(v169, &qword_26893AFA8);
LABEL_76:
    uint64_t v94 = (uint64_t)v386;
    v172(v386, v171, v167);
    uint64_t v86 = (uint64_t)v387;
    v172(v387, (char *)v94, v167);
    v196 = v388;
    sub_237A6DFD4(v86, v388);
    uint64_t v197 = *(int *)(v165 + 24);
    uint64_t v198 = (uint64_t)v373;
    uint64_t v199 = (uint64_t)v373 + v197;
    sub_237A2D868((uint64_t)v373 + v197, &qword_26893AFD0);
    uint64_t v200 = (uint64_t)v196;
    uint64_t v72 = v198;
    unint64_t v71 = v427;
    sub_237A67E68(v200, v199, type metadata accessor for PBUUID);
    v390(v199, 0, 1, v394);
    uint64_t v100 = v381;
    v201 = (void (*)(char *, unint64_t))v380;
    v380((char *)v94, v71);
    if (*(_DWORD *)v72 == -1) {
      goto LABEL_200;
    }
    ++*(_DWORD *)v72;
    v201(v171, v71);
    uint64_t v202 = v423;
    sub_237AE07EC((uint64_t)v426, v72);
    if (*(unsigned char *)(v202 + v377))
    {
      uint64_t v431 = v124;
      v203 = __swift_allocate_boxed_opaque_existential_0(v430);
      v204 = *v406;
      (*v406)(v203, v425, v124);
      sub_237A31CD0((uint64_t)v430);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v430);
      uint64_t v431 = v124;
      v205 = __swift_allocate_boxed_opaque_existential_0(v430);
      v204(v205, (uint64_t)v378, v124);
      uint64_t v206 = (uint64_t)v349;
      v207 = v398;
      v398((unint64_t)v349, 1, 1, v427);
      uint64_t v208 = (uint64_t)v350;
      v207((unint64_t)v350, 1, 1, v427);
      uint64_t v202 = v423;
      sub_237A31628((uint64_t)v430, v206, v208);
      sub_237A2D868(v208, &qword_26893AFA8);
      sub_237A2D868(v206, &qword_26893AFA8);
      sub_237A2D868((uint64_t)v430, &qword_26893AFC8);
    }
    uint64_t v94 = v405;
    uint64_t v209 = (uint64_t)v426;
    if (*(void *)(v202 + v421))
    {
      uint64_t v210 = swift_weakLoadStrong();
      uint64_t v125 = v424;
      uint64_t v211 = v425;
      if (v210)
      {
        swift_release();
        v212 = v372;
        uint64_t v213 = sub_237AEAD20(v209, v94);
        if (v212)
        {
          sub_237AEE1F4((uint64_t)v373, type metadata accessor for LamportTimestamp);
          v317 = *v418;
          uint64_t v318 = v417;
          (*v418)(v378, v417);
          v317((char *)v211, v318);
          (*v408)(v209, v94);
LABEL_192:
          sub_237A6483C();
          uint64_t v316 = v399;
          goto LABEL_193;
        }
        uint64_t v215 = v213;
        uint64_t v216 = v214;
        v217 = *(void **)(v399 + 24);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v217 = sub_237A8BC68(0, v217[2] + 1, 1, v217);
        }
        unint64_t v219 = v217[2];
        unint64_t v218 = v217[3];
        if (v219 >= v218 >> 1) {
          v217 = sub_237A8BC68((void *)(v218 > 1), v219 + 1, 1, v217);
        }
        v217[2] = v219 + 1;
        v220 = &v217[2 * v219];
        v220[4] = v215;
        v220[5] = v216;
        uint64_t v221 = v399;
        *(void *)(v399 + 24) = v217;
        uint64_t v222 = v221;
        uint64_t v223 = (uint64_t)v336;
        uint64_t v124 = v417;
        (*v406)((uint64_t *)v336, (uint64_t)v378, v417);
        (*v340)(v223, 0, 1, v124);
        sub_237AE09D8(v223, v338);
        v372 = 0;
        (*v392)((char *)v223, v411);
        unint64_t v224 = *(void *)(v222 + 32);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v226 = v405;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v224 = sub_237A8C13C(0, *(void *)(v224 + 16) + 1, 1, v224);
        }
        v227 = v373;
        uint64_t v86 = v419;
        unint64_t v229 = *(void *)(v224 + 16);
        unint64_t v228 = *(void *)(v224 + 24);
        if (v229 >= v228 >> 1) {
          unint64_t v224 = sub_237A8C13C(v228 > 1, v229 + 1, 1, v224);
        }
        unint64_t v71 = v391;
        *(void *)(v224 + 16) = v229 + 1;
        sub_237A67E68(v338, v224+ ((*(unsigned __int8 *)(v341 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v341 + 80))+ *(void *)(v341 + 72) * v229, type metadata accessor for ValueData);
        uint64_t v230 = v399;
        *(void *)(v399 + 32) = v224;
        int v231 = *v227;
        v232 = *(char **)(v230 + 40);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v232 = sub_237A8C170(0, *((void *)v232 + 2) + 1, 1, v232);
        }
        unint64_t v234 = *((void *)v232 + 2);
        unint64_t v233 = *((void *)v232 + 3);
        uint64_t v96 = v56;
        if (v234 >= v233 >> 1) {
          v232 = sub_237A8C170((char *)(v233 > 1), v234 + 1, 1, v232);
        }
        *((void *)v232 + 2) = v234 + 1;
        *(_DWORD *)&v232[4 * v234 + 32] = v231;
        *(void *)(v399 + 40) = v232;
        uint64_t v235 = v425;
        uint64_t v94 = v226;
        uint64_t v125 = v424;
        uint64_t v236 = (uint64_t)v426;
      }
      else
      {
        uint64_t v96 = v56;
        uint64_t v236 = v209;
        unint64_t v71 = v391;
        uint64_t v86 = v419;
        uint64_t v235 = v425;
      }
    }
    else
    {
      uint64_t v96 = v56;
      uint64_t v236 = (uint64_t)v426;
      uint64_t v125 = v424;
      uint64_t v235 = v425;
      unint64_t v71 = v391;
      uint64_t v86 = v419;
    }
    sub_237AEE1F4((uint64_t)v373, type metadata accessor for LamportTimestamp);
    uint64_t v100 = *v418;
    (*v418)(v378, v124);
    v100((char *)v235, v124);
    unint64_t v127 = v404;
    uint64_t v72 = v236;
    int64_t v56 = v96;
LABEL_23:
    (*v408)(v72, v94);
    uint64_t v126 = v420;
  }
  v420 = v138;
  v384 = v137;
  uint64_t v385 = v136;
  sub_237A6483C();
  v367 = v135;
  if ((v389 & 0xC000000000000001) != 0)
  {
    uint64_t v238 = sub_237AEEFB0();
    v373 = 0;
    uint64_t v239 = 0;
    uint64_t v419 = 0;
    unint64_t v71 = v238 | 0x8000000000000000;
  }
  else
  {
    uint64_t v240 = -1 << *(unsigned char *)(v389 + 32);
    uint64_t v239 = ~v240;
    uint64_t v241 = *(void *)(v389 + 64);
    v373 = (int *)(v389 + 64);
    uint64_t v242 = -v240;
    if (v242 < 64) {
      uint64_t v243 = ~(-1 << v242);
    }
    else {
      uint64_t v243 = -1;
    }
    uint64_t v419 = v243 & v241;
    unint64_t v71 = v389;
  }
  int64_t v56 = v396;
  uint64_t v96 = (char *)v392;
  v395 = (uint64_t *)(v423 + qword_26893BD80);
  uint64_t v382 = v71 & 0x7FFFFFFFFFFFFFFFLL;
  v371 = (char *)v239;
  v378 = (char *)((unint64_t)(v239 + 64) >> 6);
  uint64_t v366 = (uint64_t)(v378 - 1);
  swift_bridgeObjectRetain();
  uint64_t v244 = 0;
  uint64_t v100 = (void (*)(char *, uint64_t))v402;
  uint64_t v72 = (uint64_t)v384;
  uint64_t v245 = v417;
  unint64_t v391 = v71;
  v246 = (unsigned int (*)(char *, uint64_t, uint64_t))v420;
  unint64_t v247 = v419;
  while (2)
  {
    uint64_t v419 = v247;
    v404 = (char *)v244;
    if ((v71 & 0x8000000000000000) != 0)
    {
      if (sub_237AEEFC0())
      {
        v250 = v402;
        sub_237AEF150();
        swift_unknownObjectRelease();
        uint64_t v245 = v417;
        sub_237AEF150();
        swift_unknownObjectRelease();
        v367(v250, 0, 1, v125);
        v426 = v404;
        uint64_t v425 = v419;
      }
      else
      {
        v367(v402, 1, 1, v125);
        v426 = v404;
        uint64_t v425 = v419;
        uint64_t v245 = v417;
      }
      goto LABEL_131;
    }
    if (v247)
    {
      uint64_t v425 = (v247 - 1) & v247;
      v426 = (char *)v244;
      unint64_t v248 = __clz(__rbit64(v247)) | (v244 << 6);
      goto LABEL_123;
    }
    uint64_t v251 = v244 + 1;
    if (__OFADD__(v244, 1)) {
      goto LABEL_202;
    }
    if (v251 >= (uint64_t)v378)
    {
      v426 = (char *)v244;
LABEL_166:
      v367((char *)v100, 1, 1, v125);
      uint64_t v425 = 0;
      goto LABEL_132;
    }
    unint64_t v252 = *(void *)&v373[2 * v251];
    if (!v252)
    {
      if (v244 + 2 >= (uint64_t)v378)
      {
        v426 = (char *)(v244 + 1);
      }
      else
      {
        unint64_t v252 = *(void *)&v373[2 * v244 + 4];
        if (v252)
        {
          uint64_t v251 = v244 + 2;
          goto LABEL_129;
        }
        uint64_t v251 = v244 + 3;
        if (v244 + 3 >= (uint64_t)v378)
        {
          v426 = (char *)(v244 + 2);
        }
        else
        {
          unint64_t v252 = *(void *)&v373[2 * v251];
          if (v252) {
            goto LABEL_129;
          }
          v303 = (char *)(v244 + 4);
          while (v378 != v303)
          {
            unint64_t v252 = *(void *)&v373[2 * (void)v303++];
            if (v252)
            {
              uint64_t v251 = (uint64_t)(v303 - 1);
              goto LABEL_129;
            }
          }
          v426 = (char *)v366;
        }
      }
      goto LABEL_166;
    }
LABEL_129:
    uint64_t v425 = (v252 - 1) & v252;
    v426 = (char *)v251;
    unint64_t v248 = __clz(__rbit64(v252)) + (v251 << 6);
LABEL_123:
    v249 = v402;
    (*(void (**)(char *, unint64_t, uint64_t))(v375 + 16))(v402, *(void *)(v71 + 48) + *(void *)(v375 + 72) * v248, v94);
    (*(void (**)(char *, unint64_t, uint64_t))(v376 + 16))(&v249[*(int *)(v125 + 48)], *(void *)(v71 + 56) + *(void *)(v376 + 72) * v248, v245);
    v367(v249, 0, 1, v125);
LABEL_131:
    v246 = (unsigned int (*)(char *, uint64_t, uint64_t))v420;
LABEL_132:
    v253 = v370;
    ((void (*)(void))v72)();
    if (v246(v253, 1, v125) != 1)
    {
      v254 = &v253[*(int *)(v125 + 48)];
      (*v410)(v56, v253, v94);
      (*(void (**)(char *, char *, uint64_t))v409)(v413, v254, v245);
      v255 = v369;
      swift_beginAccess();
      unint64_t v256 = *v255;
      uint64_t v257 = v94;
      v258 = v368;
      v259 = v56;
      v260 = v56;
      v261 = v416;
      MEMORY[0x237E281B0](v259, v256, v257, v245, v416);
      swift_endAccess();
      LODWORD(v254) = ((uint64_t (*)(char *, uint64_t, uint64_t))*v422)(v258, 1, v245);
      v403 = *(void **)v96;
      ((void (*)(char *, uint64_t))v403)(v258, v411);
      if (v254 == 1)
      {
        (*v415)(v383, (uint64_t)v260, v257);
        sub_237AEECC0();
        sub_237AEECA0();
        v262 = v395;
        swift_beginAccess();
        uint64_t v263 = *v262;
        uint64_t v264 = (uint64_t)v354;
        uint64_t v265 = v400;
        MEMORY[0x237E281B0](v260, v263, v257, v400, v261);
        swift_endAccess();
        if ((*v379)(v264, 1, v265) == 1)
        {
          int64_t v56 = v364;
          *(_DWORD *)v364 = 0;
          sub_237AEE6E0();
          v390((uint64_t)&v56[*(int *)(v265 + 24)], 1, 1, v394);
          sub_237A2D868(v264, &qword_26893AFE0);
        }
        else
        {
          int64_t v56 = v364;
          sub_237A67E68(v264, (uint64_t)v364, type metadata accessor for LamportTimestamp);
        }
        uint64_t v266 = (uint64_t)v353;
        uint64_t v267 = v427;
        v268 = v407;
        uint64_t v269 = *(void *)(v423 + v421);
        unint64_t v71 = v400;
        if (v269)
        {
          v407(v353, (char *)(v269 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID), v427);
          v398(v266, 0, 1, v267);
          if ((*v365)(v266, 1, v267) != 1)
          {
            uint64_t v72 = v245;
            uint64_t v96 = v352;
            (*v347)(v352, v266, v267);
            goto LABEL_144;
          }
        }
        else
        {
          v398((unint64_t)v353, 1, 1, v427);
        }
        if (qword_26893AD10 != -1) {
          swift_once();
        }
        uint64_t v72 = v245;
        uint64_t v270 = __swift_project_value_buffer(v267, (uint64_t)qword_26893C0C8);
        uint64_t v96 = v352;
        v268 = v407;
        v407(v352, (char *)v270, v267);
        sub_237A2D868(v266, &qword_26893AFA8);
LABEL_144:
        v271 = v386;
        v268(v386, v96, v267);
        v272 = v387;
        v268(v387, v271, v427);
        v273 = v388;
        uint64_t v274 = (uint64_t)v272;
        uint64_t v94 = v427;
        sub_237A6DFD4(v274, v388);
        uint64_t v275 = (uint64_t)&v56[*(int *)(v71 + 24)];
        sub_237A2D868(v275, &qword_26893AFD0);
        sub_237A67E68((uint64_t)v273, v275, type metadata accessor for PBUUID);
        v390(v275, 0, 1, v394);
        uint64_t v100 = v381;
        v276 = v380;
        v380(v271, v94);
        if (*(_DWORD *)v56 == -1) {
          goto LABEL_199;
        }
        ++*(_DWORD *)v56;
        v276(v96, v94);
        uint64_t v277 = v423;
        sub_237AE12CC((uint64_t)v396, (uint64_t)v56);
        uint64_t v245 = v72;
        if (*(unsigned char *)(v277 + v377))
        {
          uint64_t v431 = v72;
          v278 = __swift_allocate_boxed_opaque_existential_0(v430);
          (*v406)(v278, (uint64_t)v413, v72);
          uint64_t v279 = (uint64_t)v349;
          v280 = v398;
          v398((unint64_t)v349, 1, 1, v427);
          uint64_t v281 = (uint64_t)v350;
          v280((unint64_t)v350, 1, 1, v427);
          sub_237A31628((uint64_t)v430, v279, v281);
          sub_237A2D868(v281, &qword_26893AFA8);
          sub_237A2D868(v279, &qword_26893AFA8);
          sub_237A2D868((uint64_t)v430, &qword_26893AFC8);
        }
        uint64_t v94 = v405;
        uint64_t v125 = v424;
        if (*(void *)(v277 + v421))
        {
          uint64_t v282 = swift_weakLoadStrong();
          uint64_t v96 = (char *)v392;
          if (v282)
          {
            swift_release();
            v212 = v372;
            uint64_t v283 = sub_237AEAD20((uint64_t)v396, v94);
            if (v212)
            {
              sub_237AEE1F4((uint64_t)v364, type metadata accessor for LamportTimestamp);
              (*v418)(v413, v245);
              (*v408)((uint64_t)v396, v94);
              goto LABEL_192;
            }
            uint64_t v285 = v283;
            uint64_t v286 = v284;
            v287 = *(void **)(v399 + 48);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v287 = sub_237A8BC68(0, v287[2] + 1, 1, v287);
            }
            unint64_t v289 = v287[2];
            unint64_t v288 = v287[3];
            if (v289 >= v288 >> 1) {
              v287 = sub_237A8BC68((void *)(v288 > 1), v289 + 1, 1, v287);
            }
            v287[2] = v289 + 1;
            v290 = &v287[2 * v289];
            v290[4] = v285;
            v290[5] = v286;
            uint64_t v291 = v399;
            *(void *)(v399 + 48) = v287;
            uint64_t v292 = v291;
            uint64_t v293 = (uint64_t)v337;
            uint64_t v294 = v417;
            (*v406)((uint64_t *)v337, (uint64_t)v413, v417);
            (*v340)(v293, 0, 1, v294);
            sub_237AE09D8(v293, v346);
            ((void (*)(uint64_t, uint64_t))v403)(v293, v411);
            unint64_t v295 = *(void *)(v292 + 56);
            char v296 = swift_isUniquelyReferenced_nonNull_native();
            int64_t v56 = v364;
            if ((v296 & 1) == 0) {
              unint64_t v295 = sub_237A8C13C(0, *(void *)(v295 + 16) + 1, 1, v295);
            }
            unint64_t v298 = *(void *)(v295 + 16);
            unint64_t v297 = *(void *)(v295 + 24);
            if (v298 >= v297 >> 1) {
              unint64_t v295 = sub_237A8C13C(v297 > 1, v298 + 1, 1, v295);
            }
            *(void *)(v295 + 16) = v298 + 1;
            sub_237A67E68(v346, v295+ ((*(unsigned __int8 *)(v341 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v341 + 80))+ *(void *)(v341 + 72) * v298, type metadata accessor for ValueData);
            *(void *)(v292 + 56) = v295;
            int v299 = *(_DWORD *)v56;
            v300 = *(char **)(v292 + 64);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v300 = sub_237A8C170(0, *((void *)v300 + 2) + 1, 1, v300);
            }
            unint64_t v302 = *((void *)v300 + 2);
            unint64_t v301 = *((void *)v300 + 3);
            v372 = 0;
            if (v302 >= v301 >> 1) {
              v300 = sub_237A8C170((char *)(v301 > 1), v302 + 1, 1, v300);
            }
            *((void *)v300 + 2) = v302 + 1;
            *(_DWORD *)&v300[4 * v302 + 32] = v299;
            *(void *)(v399 + 64) = v300;
            uint64_t v94 = v405;
            uint64_t v245 = v417;
            uint64_t v125 = v424;
          }
        }
        else
        {
          uint64_t v96 = (char *)v392;
        }
        uint64_t v72 = (uint64_t)v384;
        unint64_t v71 = v391;
        sub_237AEE1F4((uint64_t)v56, type metadata accessor for LamportTimestamp);
        uint64_t v100 = (void (*)(char *, uint64_t))v402;
      }
      else
      {
        uint64_t v100 = (void (*)(char *, uint64_t))v402;
        uint64_t v94 = v257;
        uint64_t v125 = v424;
      }
      v246 = (unsigned int (*)(char *, uint64_t, uint64_t))v420;
      (*v418)(v413, v245);
      int64_t v56 = v396;
      (*v408)((uint64_t)v396, v94);
      unint64_t v247 = v425;
      uint64_t v244 = (uint64_t)v426;
      continue;
    }
    break;
  }
  sub_237A6483C();
  unint64_t *v369 = v389;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v304 = v423;
  uint64_t v305 = v429;
  uint64_t v306 = sub_237AEE6A0();
  v307 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v306 - 8) + 56);
  long long v427 = v428;
  uint64_t v308 = (uint64_t)v332;
  v307(v332, 1, 1, v306);
  uint64_t v309 = TupleTypeMetadata2;
  v310 = v333;
  uint64_t v311 = (uint64_t)v333 + *(int *)(TupleTypeMetadata2 + 48);
  _OWORD *v333 = v427;
  *((void *)v310 + 2) = v305;
  sub_237A39C38(v308, v311, &qword_26893AE00);
  sub_237AEE9B0();
  (*(void (**)(_OWORD *, uint64_t))(v334 + 8))(v310, v309);
  if (*(void *)(v304 + v421))
  {
    uint64_t v312 = swift_weakLoadStrong();
    uint64_t v313 = v399;
    if (v312)
    {
      uint64_t v314 = v312;
      if (*(void *)(v312 + 24))
      {
        swift_retain();
        swift_retain();
        sub_237AEE9F0();
        uint64_t v315 = swift_release();
        if (LOBYTE(v430[0]) == 1 && *(unsigned char *)(v314 + OBJC_IVAR____TtC12SyncedModels18SyncedModelManager_options) != 1)
        {
          sub_237AEE1F4(v313, type metadata accessor for DictionaryChangedMessage);
          swift_release();
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v315 = swift_retain();
      }
      MEMORY[0x270FA5388](v315);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFF0);
      sub_237AEE530();
      swift_release();
      swift_release();
    }
    sub_237AEE1F4(v313, type metadata accessor for DictionaryChangedMessage);
  }
  else
  {
    sub_237AEE1F4(v399, type metadata accessor for DictionaryChangedMessage);
  }
}

uint64_t SyncedDictionary.wrappedValue.getter()
{
  sub_237AEB254();
  return swift_bridgeObjectRetain();
}

uint64_t SyncedDictionary.wrappedValue.setter(unint64_t a1)
{
  sub_237AEB29C(a1);
  return swift_bridgeObjectRelease();
}

void (*SyncedDictionary.wrappedValue.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = (void *)(v1 + qword_26893BDA8);
  swift_beginAccess();
  v3[3] = *v4;
  swift_bridgeObjectRetain();
  return sub_237AE0710;
}

void sub_237AE0710(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  unint64_t v3 = *(void *)(*(void *)a1 + 24);
  if (a2)
  {
    unint64_t v4 = swift_bridgeObjectRetain();
    sub_237ADC9C0(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_237ADC9C0(v3);
  }
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t SyncedDictionary.projectedValue.getter()
{
  return swift_retain();
}

uint64_t sub_237AE078C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_237AEEC60();
  uint64_t v3 = sub_237AEEC60();
  uint64_t result = sub_237AEEC60();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

uint64_t sub_237AE07EC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v5 + 280);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v15 - v11, a1, v10);
  sub_237AEE124(a2, (uint64_t)v9, type metadata accessor for LamportTimestamp);
  uint64_t v13 = type metadata accessor for LamportTimestamp(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  swift_beginAccess();
  sub_237AEEB50();
  sub_237AEEB70();
  return swift_endAccess();
}

uint64_t sub_237AE09D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v74 = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  uint64_t v71 = v3;
  uint64_t v72 = v5;
  uint64_t v6 = *(void *)(v4 + 288);
  uint64_t v7 = sub_237AEEE50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v63 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v70 = (char *)&v63 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v63 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v63 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v33 = (char *)&v63 - v32;
  if (*((unsigned char *)v2 + qword_26893BDA0))
  {
    uint64_t v67 = v23;
    uint64_t v68 = v31;
    uint64_t v64 = v30;
    uint64_t v65 = v29;
    uint64_t v69 = v11;
    uint64_t v66 = v14;
    uint64_t v34 = v74;
    uint64_t v70 = *(char **)(v8 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v70)(v17, v74, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v17, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v17, v7);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
      if (swift_dynamicCast())
      {
        uint64_t v45 = v78;
        uint64_t v69 = v77;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v47 = sub_237A51A38(ObjectType, v45) + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__uuid;
        swift_beginAccess();
        uint64_t v48 = sub_237AEE520();
        uint64_t v49 = *(void *)(v48 - 8);
        uint64_t v50 = v64;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v64, v47, v48);
        swift_release();
        uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56);
        v51(v50, 0, 1, v48);
        uint64_t v52 = (uint64_t)v66;
        ((void (*)(char *, uint64_t, uint64_t))v70)(v66, v74, v7);
        uint64_t v53 = v65;
        v51(v65, 1, 1, v48);
        uint64_t v54 = v72;
        uint64_t v76 = *(void *)(v72 + 320);
        swift_getWitnessTable();
        uint64_t v75 = *(void *)(v54 + 328);
        uint64_t WitnessTable = swift_getWitnessTable();
        sub_237A69038(v50, v52, v53, v7, WitnessTable, v73);
        return swift_unknownObjectRelease();
      }
    }
    uint64_t v57 = sub_237AEE520();
    uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56);
    uint64_t v59 = (uint64_t)v67;
    v58(v67, 1, 1, v57);
    uint64_t v60 = (uint64_t)v69;
    ((void (*)(char *, uint64_t, uint64_t))v70)(v69, v34, v7);
    uint64_t v61 = v68;
    v58((char *)v68, 1, 1, v57);
    uint64_t v62 = v72;
    uint64_t v80 = *(void *)(v72 + 320);
    swift_getWitnessTable();
    uint64_t v79 = *(void *)(v62 + 328);
    uint64_t v39 = swift_getWitnessTable();
    uint64_t v40 = v73;
    uint64_t v41 = v59;
    uint64_t v42 = v60;
    uint64_t v43 = v61;
    uint64_t v44 = v7;
  }
  else
  {
    uint64_t v35 = sub_237AEE520();
    uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
    v36(v33, 1, 1, v35);
    uint64_t v37 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v70, v74, v7);
    v36(v28, 1, 1, v35);
    uint64_t v38 = v72;
    uint64_t v82 = *(void *)(v72 + 320);
    swift_getWitnessTable();
    uint64_t v81 = *(void *)(v38 + 328);
    uint64_t v39 = swift_getWitnessTable();
    uint64_t v40 = v73;
    uint64_t v41 = (uint64_t)v33;
    uint64_t v42 = (uint64_t)v37;
    uint64_t v43 = (uint64_t)v28;
    uint64_t v44 = v7;
  }
  return sub_237A69038(v41, v42, v43, v44, v39, v40);
}

uint64_t sub_237AE1088(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v5 + 280);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v15 - v11, a1, v10);
  sub_237AEE124(a2, (uint64_t)v9, type metadata accessor for LamportTimestamp);
  uint64_t v13 = type metadata accessor for LamportTimestamp(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  swift_beginAccess();
  sub_237AEEB50();
  sub_237AEEB70();
  swift_endAccess();
  swift_beginAccess();
  sub_237AEEB00();
  swift_endAccess();
  return sub_237A2D868((uint64_t)v9, &qword_26893AFE0);
}

uint64_t sub_237AE12CC(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a2;
  uint64_t v4 = *(void *)(*(void *)v2 + 280);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v13 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v11 = type metadata accessor for LamportTimestamp(255);
  sub_237AEEB50();
  sub_237AEEB00();
  swift_endAccess();
  sub_237A2D868((uint64_t)v10, &qword_26893AFE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_237AEE124(v13, (uint64_t)v10, type metadata accessor for LamportTimestamp);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  swift_beginAccess();
  sub_237AEEB70();
  return swift_endAccess();
}

uint64_t sub_237AE1510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 280);
  uint64_t v6 = sub_237AEEE50();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v11 - v7;
  if (qword_26893ACE0 != -1) {
    swift_once();
  }
  sub_237AEECC0();
  v11[1] = *(void *)(v4 + 296);
  swift_getWitnessTable();
  uint64_t result = sub_237AEE400();
  if (!v2)
  {
    v11[0] = v11[3];
    swift_getWitnessTable();
    sub_237AEED90();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v5);
    if (result == 1) {
      __break(1u);
    }
    else {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v8, v5);
    }
  }
  return result;
}

uint64_t sub_237AE1738@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_237AE1748(uint64_t *a1, uint64_t a2)
{
  uint64_t v304 = a2;
  v345 = a1;
  *(void *)&long long v349 = 0;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 304);
  uint64_t v5 = *(void *)(*v2 + 312);
  uint64_t v6 = *(void *)(*v2 + 320);
  uint64_t v353 = *(void *)(*v2 + 280);
  long long v348 = *(_OWORD *)(v3 + 288);
  long long v354 = v348;
  uint64_t v355 = v4;
  uint64_t v356 = v5;
  uint64_t v346 = v5;
  uint64_t v324 = v6;
  uint64_t v357 = v6;
  long long v289 = *(_OWORD *)(v3 + 328);
  long long v358 = v289;
  type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26893AE00);
  uint64_t v7 = v353;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v302 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  unint64_t v301 = (_OWORD *)((char *)&v273 - v9);
  MEMORY[0x270FA5388](v8);
  v300 = (char *)&v273 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v307 = type metadata accessor for PBUUID(0);
  uint64_t v288 = *(void *)(v307 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v307);
  v287 = (uint64_t *)((char *)&v273 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v286 = (uint64_t *)((char *)&v273 - v14);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v285 = (uint64_t *)((char *)&v273 - v16);
  MEMORY[0x270FA5388](v15);
  uint64_t v284 = (uint64_t *)((char *)&v273 - v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v283 = (uint64_t)&v273 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v296 = (uint64_t)&v273 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v282 = (uint64_t)&v273 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v295 = (uint64_t)&v273 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v281 = (uint64_t)&v273 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v294 = (uint64_t)&v273 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v280 = (uint64_t)&v273 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v293 = (uint64_t)&v273 - v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v35 = MEMORY[0x270FA5388](v34 - 8);
  uint64_t v291 = (char *)&v273 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v306 = (uint64_t)&v273 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v279 = (uint64_t)&v273 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  uint64_t v278 = (uint64_t)&v273 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v290 = (char *)&v273 - v44;
  MEMORY[0x270FA5388](v43);
  uint64_t v305 = (uint64_t)&v273 - v45;
  uint64_t v314 = type metadata accessor for ValueData(0);
  uint64_t v323 = *(void *)(v314 - 8);
  MEMORY[0x270FA5388](v314);
  uint64_t v340 = (uint64_t)&v273 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = v348;
  uint64_t v317 = sub_237AEEE50();
  v310 = *(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v317 - 8);
  uint64_t v48 = MEMORY[0x270FA5388](v317);
  uint64_t v292 = (char *)&v273 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  uint64_t v329 = (char *)&v273 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  uint64_t v308 = (char *)&v273 - v53;
  uint64_t v347 = v47;
  uint64_t v309 = *(char **)(v47 - 8);
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  uint64_t v277 = (char *)&v273 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v333 = (char *)&v273 - v57;
  MEMORY[0x270FA5388](v56);
  unint64_t v297 = (char *)&v273 - v58;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v60 = MEMORY[0x270FA5388](v59 - 8);
  uint64_t v62 = (char *)&v273 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = MEMORY[0x270FA5388](v60);
  uint64_t v65 = (char *)&v273 - v64;
  uint64_t v66 = MEMORY[0x270FA5388](v63);
  uint64_t v319 = (uint64_t)&v273 - v67;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  unint64_t v328 = (char *)&v273 - v69;
  MEMORY[0x270FA5388](v68);
  uint64_t v327 = (char *)&v273 - v70;
  uint64_t v343 = type metadata accessor for LamportTimestamp(0);
  uint64_t v71 = *(void *)(v343 - 8);
  uint64_t v72 = MEMORY[0x270FA5388](v343 - 8);
  uint64_t v311 = (unsigned int *)((char *)&v273 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  id v321 = (unsigned int *)((char *)&v273 - v75);
  uint64_t v76 = MEMORY[0x270FA5388](v74);
  uint64_t v78 = (unsigned int *)((char *)&v273 - v77);
  uint64_t v79 = MEMORY[0x270FA5388](v76);
  uint64_t v318 = (unsigned int *)((char *)&v273 - v80);
  uint64_t v81 = MEMORY[0x270FA5388](v79);
  unint64_t v338 = (unint64_t)&v273 - v82;
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  *(void *)&long long v348 = (char *)&v273 - v84;
  uint64_t v85 = *(void *)(v7 - 8);
  uint64_t v86 = MEMORY[0x270FA5388](v83);
  id v320 = (char *)&v273 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = MEMORY[0x270FA5388](v86);
  uint64_t v334 = (char *)&v273 - v89;
  MEMORY[0x270FA5388](v88);
  uint64_t v91 = (char *)&v273 - v90;
  uint64_t v92 = sub_237AEEC60();
  uint64_t v93 = sub_237AEEC60();
  uint64_t v94 = sub_237AEEC60();
  *(void *)&long long v351 = v92;
  *((void *)&v351 + 1) = v93;
  uint64_t v95 = v2;
  uint64_t v352 = v94;
  uint64_t v96 = v345[3];
  uint64_t v360 = v96;
  uint64_t v97 = *(void *)(v96 + 16);
  v344 = v95;
  uint64_t v335 = v7;
  uint64_t v313 = v62;
  v322 = v65;
  uint64_t v342 = v71;
  v332 = v78;
  uint64_t v339 = v97;
  uint64_t v298 = v85;
  if (!v97)
  {
    uint64_t v107 = v347;
    uint64_t v135 = v95;
    uint64_t v136 = v333;
    goto LABEL_24;
  }
  uint64_t v98 = (uint64_t *)((char *)v95 + qword_26893BDA8);
  uint64_t v331 = (uint64_t *)((char *)v95 + qword_26893BD80);
  uint64_t v325 = (uint64_t *)((char *)v95 + qword_26893BD88);
  uint64_t v312 = (uint64_t *)qword_26893BDA0;
  swift_bridgeObjectRetain();
  uint64_t v341 = v98;
  swift_beginAccess();
  unint64_t v99 = 0;
  v337 = (uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
  v336 = (void (**)(char *, uint64_t))(v85 + 8);
  v330 = (void (**)(uint64_t, uint64_t))(v85 + 16);
  uint64_t v316 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56);
  int v299 = (unsigned int (**)(char *, uint64_t, uint64_t))(v309 + 48);
  v276 = (void (**)(char *, char *, uint64_t))(v309 + 32);
  uint64_t v275 = (void (**)(uint64_t *, char *, uint64_t))(v309 + 16);
  uint64_t v274 = (void (**)(char *, uint64_t))(v309 + 8);
  uint64_t v315 = (uint64_t *)(v310 + 1);
  uint64_t v100 = (unint64_t *)(v96 + 40);
  id v326 = v91;
  while (1)
  {
    uint64_t v108 = *(v100 - 1);
    unint64_t v109 = *v100;
    sub_237A2D3FC(v108, *v100);
    uint64_t v110 = v349;
    sub_237AE1510((uint64_t)v91);
    *(void *)&long long v349 = v110;
    if (v110) {
      break;
    }
    uint64_t v111 = v345[4];
    if (v99 >= *(void *)(v111 + 16))
    {
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      swift_once();
      goto LABEL_77;
    }
    os_log_type_t v104 = (unsigned int *)v348;
    sub_237AEE124(v111+ ((*(unsigned __int8 *)(v342 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v342 + 80))+ *(void *)(v342 + 72) * v99, v348, type metadata accessor for LamportTimestamp);
    uint64_t v353 = *v341;
    uint64_t v112 = v346;
    sub_237AEEB20();
    uint64_t v113 = v7;
    swift_getWitnessTable();
    if (sub_237AEEC00())
    {
      int v114 = v325;
      swift_beginAccess();
      uint64_t v115 = *v114;
      uint64_t v116 = v327;
      uint64_t v117 = v343;
      MEMORY[0x237E281B0](v91, v115, v113, v343, v112);
      swift_endAccess();
      uint64_t result = (*v337)(v116, 1, v117);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v113;
      uint64_t v119 = (uint64_t)v116;
      uint64_t v120 = (unsigned int *)v338;
      sub_237A67E68(v119, v338, type metadata accessor for LamportTimestamp);
      char v121 = sub_237A69390(v104, v120);
      uint64_t v107 = v347;
      if (v121)
      {
        uint64_t v122 = v346;
        if (*((unsigned char *)v312 + (void)v344) == 1)
        {
          uint64_t v123 = v341;
          swift_beginAccess();
          uint64_t v124 = *v123;
          uint64_t v125 = v308;
          MEMORY[0x237E281B0](v91, v124, v335, v107, v122);
          if ((*v299)(v125, 1, v107) == 1)
          {
            ((void (*)(char *, uint64_t))*v315)(v125, v317);
            swift_endAccess();
          }
          else
          {
            uint64_t v101 = v297;
            (*v276)(v297, v125, v107);
            swift_endAccess();
            uint64_t v355 = v107;
            uint64_t v102 = __swift_allocate_boxed_opaque_existential_0(&v353);
            (*v275)(v102, v101, v107);
            sub_237A31CD0((uint64_t)&v353);
            uint64_t v103 = v101;
            os_log_type_t v104 = (unsigned int *)v348;
            (*v274)(v103, v107);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v353);
          }
        }
        swift_beginAccess();
        uint64_t v105 = v335;
        sub_237AEEB50();
        uint64_t v106 = v329;
        sub_237AEEB00();
        swift_endAccess();
        ((void (*)(char *, uint64_t))*v315)(v106, v317);
        ((void (*)(char *, char *, uint64_t))*v330)(v334, v91, v105);
        sub_237AEECC0();
        sub_237AEECA0();
        uint64_t v7 = v105;
        uint64_t v107 = v347;
        sub_237AE1088((uint64_t)v91, (uint64_t)v104);
      }
      sub_237A2D4F8(v108, v109);
      sub_237AEE1F4(v338, type metadata accessor for LamportTimestamp);
    }
    else
    {
      uint64_t v126 = v331;
      swift_beginAccess();
      uint64_t v127 = (uint64_t)v328;
      uint64_t v128 = v343;
      MEMORY[0x237E281B0](v91, *v126, v113, v343, v112);
      if ((*v337)((char *)v127, 1, v128) == 1)
      {
        sub_237A2D868(v127, &qword_26893AFE0);
        swift_endAccess();
        ((void (*)(char *, char *, uint64_t))*v330)(v334, v326, v113);
        uint64_t v129 = (unsigned int *)v348;
        uint64_t v130 = v319;
        sub_237AEE124(v348, v319, type metadata accessor for LamportTimestamp);
        (*v316)(v130, 0, 1, v128);
        swift_beginAccess();
        sub_237AEEB50();
        os_log_type_t v104 = v129;
        uint64_t v91 = v326;
        sub_237AEEB70();
        swift_endAccess();
        sub_237A2D4F8(v108, v109);
        uint64_t v107 = v347;
        uint64_t v7 = v113;
      }
      else
      {
        uint64_t v7 = v113;
        unint64_t v131 = v318;
        sub_237A67E68(v127, (uint64_t)v318, type metadata accessor for LamportTimestamp);
        swift_endAccess();
        os_log_type_t v104 = (unsigned int *)v348;
        if (sub_237A69390((unsigned int *)v348, v131))
        {
          ((void (*)(char *, char *, uint64_t))*v330)(v334, v91, v113);
          uint64_t v132 = (uint64_t)v104;
          uint64_t v133 = v319;
          sub_237AEE124(v132, v319, type metadata accessor for LamportTimestamp);
          (*v316)(v133, 0, 1, v343);
          swift_beginAccess();
          sub_237AEEB50();
          os_log_type_t v104 = (unsigned int *)v348;
          sub_237AEEB70();
          swift_endAccess();
          sub_237A2D4F8(v108, v109);
          uint64_t v134 = v318;
        }
        else
        {
          sub_237A2D4F8(v108, v109);
          uint64_t v134 = v131;
        }
        sub_237AEE1F4((uint64_t)v134, type metadata accessor for LamportTimestamp);
        uint64_t v107 = v347;
      }
    }
    ++v99;
    v100 += 2;
    sub_237AEE1F4((uint64_t)v104, type metadata accessor for LamportTimestamp);
    (*v336)(v91, v7);
    if (v339 == v99)
    {
      sub_237AEE0F8((uint64_t)&v360);
      uint64_t v135 = v344;
      uint64_t v136 = v333;
      uint64_t v71 = v342;
LABEL_24:
      uint64_t v359 = *v345;
      v336 = *(void (***)(char *, uint64_t))(v359 + 16);
      if (!v336) {
        goto LABEL_81;
      }
      uint64_t v308 = (char *)&v351 + 8;
      uint64_t v312 = &v352;
      unint64_t v328 = (char *)v135 + qword_26893BD88;
      uint64_t v315 = (uint64_t *)((char *)v135 + qword_26893BD80);
      uint64_t v325 = (uint64_t *)((char *)v135 + qword_26893BDA8);
      uint64_t v327 = (char *)(v71 + 48);
      int v299 = (unsigned int (**)(char *, uint64_t, uint64_t))(v309 + 48);
      uint64_t v319 = qword_26893BDA0;
      unint64_t v297 = v309 + 32;
      id v326 = v309 + 16;
      v337 = (uint64_t (**)(char *, uint64_t, uint64_t))(v309 + 8);
      v276 = (void (**)(char *, char *, uint64_t))(v310 + 1);
      v310 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v288 + 48);
      uint64_t v318 = (unsigned int *)(v298 + 16);
      uint64_t v316 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v309 + 56);
      v330 = (void (**)(uint64_t, uint64_t))(v298 + 8);
      uint64_t v137 = swift_bridgeObjectRetain();
      *(void *)&long long v348 = 0;
      uint64_t v331 = (void *)v289;
      uint64_t v138 = (unint64_t *)(v137 + 40);
      uint64_t v139 = (uint64_t)v320;
      while (2)
      {
        uint64_t v156 = (uint64_t)v136;
        uint64_t v157 = *(v138 - 1);
        unint64_t v152 = *v138;
        sub_237A2D3FC(v157, *v138);
        int v151 = v135;
        uint64_t v158 = v349;
        sub_237AE1510(v139);
        *(void *)&long long v349 = v158;
        if (v158)
        {
          sub_237AEE0F8((uint64_t)&v359);
          sub_237A2D4F8(v157, v152);
          goto LABEL_76;
        }
        uint64_t v159 = v345[1];
        if ((unint64_t)v348 >= *(void *)(v159 + 16)) {
          goto LABEL_83;
        }
        sub_237AEE124(v159+ ((*(unsigned __int8 *)(v323 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v323 + 80))+ *(void *)(v323 + 72) * v348, v340, type metadata accessor for ValueData);
        uint64_t v160 = v349;
        sub_237A69AEC(v107, v324, v156);
        *(void *)&long long v349 = v160;
        if (v160)
        {
          sub_237A2D4F8(v157, v152);
          sub_237AEE1F4(v340, type metadata accessor for ValueData);
          (*v330)(v139, v7);
          sub_237AEE0F8((uint64_t)&v359);
          goto LABEL_76;
        }
        uint64_t v161 = v345[2];
        if ((unint64_t)v348 >= *(void *)(v161 + 16)) {
          goto LABEL_84;
        }
        uint64_t v339 = v157;
        uint64_t v341 = (uint64_t *)v138;
        uint64_t v162 = v342;
        uint64_t v150 = v332;
        sub_237AEE124(v161+ ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80))+ *(void *)(v342 + 72) * v348, (uint64_t)v332, type metadata accessor for LamportTimestamp);
        uint64_t v163 = (uint64_t *)v328;
        swift_beginAccess();
        uint64_t v164 = *v163;
        uint64_t v165 = (uint64_t)v322;
        uint64_t v166 = v139;
        uint64_t v167 = v343;
        uint64_t v168 = v346;
        MEMORY[0x237E281B0](v139, v164, v7, v343, v346);
        uint64_t v169 = v7;
        unsigned int v170 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v162 + 48);
        if (v170(v165, 1, v167) == 1)
        {
          sub_237A2D868(v165, &qword_26893AFE0);
          swift_endAccess();
          int64_t v171 = v315;
          swift_beginAccess();
          uint64_t v172 = *v171;
          uint64_t v173 = (uint64_t)v313;
          MEMORY[0x237E281B0](v166, v172, v169, v167, v168);
          if (v170(v173, 1, v167) == 1)
          {
            unint64_t v338 = v152;
            sub_237A2D868(v173, &qword_26893AFE0);
            swift_endAccess();
            uint64_t v174 = *(void (**)(char *, uint64_t, uint64_t))v318;
            uint64_t v175 = v334;
            (*(void (**)(char *, uint64_t, uint64_t))v318)(v334, v166, v169);
            char v176 = v329;
            uint64_t v177 = v347;
            uint64_t v309 = *(char **)v326;
            ((void (*)(char *, char *, uint64_t))v309)(v329, v333, v347);
            (*v316)((uint64_t)v176, 0, 1, v177);
            swift_beginAccess();
            sub_237AEEB50();
            sub_237AEEB70();
            swift_endAccess();
            v174(v175, v166, v169);
            uint64_t v178 = v344;
            sub_237AEECC0();
            sub_237AEECA0();
            uint64_t v179 = v332;
            uint64_t v135 = v178;
            sub_237AE12CC(v166, (uint64_t)v332);
            if (*((unsigned char *)v178 + v319) == 1)
            {
              uint64_t v355 = v177;
              uint64_t v180 = __swift_allocate_boxed_opaque_existential_0(&v353);
              uint64_t v181 = v333;
              ((void (*)(uint64_t *, char *, uint64_t))v309)(v180, v333, v177);
              uint64_t v182 = v340 + *(int *)(v314 + 24);
              uint64_t v183 = v295;
              sub_237A2D334(v182, v295, &qword_26893AFD0);
              uint64_t v184 = *v310;
              uint64_t v185 = v307;
              int v186 = (*v310)(v183, 1, v307);
              sub_237A2D868(v183, &qword_26893AFD0);
              if (v186 == 1)
              {
                uint64_t v187 = sub_237AEE520();
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v187 - 8) + 56))(v306, 1, 1, v187);
                unint64_t v188 = v338;
              }
              else
              {
                uint64_t v214 = v182;
                uint64_t v215 = v282;
                sub_237A2D334(v214, v282, &qword_26893AFD0);
                unsigned int v216 = v184(v215, 1, v185);
                unint64_t v188 = v338;
                v217 = v286;
                if (v216 == 1)
                {
                  *uint64_t v286 = 0;
                  v217[1] = 0;
                  sub_237AEE6E0();
                  sub_237A2D868(v215, &qword_26893AFD0);
                }
                else
                {
                  sub_237A67E68(v215, (uint64_t)v286, type metadata accessor for PBUUID);
                }
                uint64_t v229 = v306;
                sub_237A6E124();
                sub_237AEE1F4((uint64_t)v217, type metadata accessor for PBUUID);
                uint64_t v230 = sub_237AEE520();
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v230 - 8) + 56))(v229, 0, 1, v230);
              }
              uint64_t v231 = v340 + *(int *)(v314 + 28);
              uint64_t v232 = v296;
              sub_237A2D334(v231, v296, &qword_26893AFD0);
              unsigned int v233 = v184(v232, 1, v185);
              sub_237A2D868(v232, &qword_26893AFD0);
              if (v233 == 1)
              {
                uint64_t v234 = sub_237AEE520();
                uint64_t v235 = (uint64_t)v291;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v234 - 8) + 56))(v291, 1, 1, v234);
                uint64_t v135 = v344;
                uint64_t v7 = v335;
                uint64_t v155 = v341;
                uint64_t v136 = v181;
                uint64_t v236 = v339;
              }
              else
              {
                uint64_t v237 = v231;
                uint64_t v238 = v283;
                sub_237A2D334(v237, v283, &qword_26893AFD0);
                if (v184(v238, 1, v185) == 1)
                {
                  uint64_t v239 = v287;
                  void *v287 = 0;
                  v239[1] = 0;
                  sub_237AEE6E0();
                  sub_237A2D868(v238, &qword_26893AFD0);
                }
                else
                {
                  uint64_t v239 = v287;
                  sub_237A67E68(v238, (uint64_t)v287, type metadata accessor for PBUUID);
                }
                unint64_t v248 = v344;
                uint64_t v7 = v335;
                uint64_t v155 = v341;
                uint64_t v136 = v181;
                uint64_t v236 = v339;
                uint64_t v235 = (uint64_t)v291;
                sub_237A6E124();
                sub_237AEE1F4((uint64_t)v239, type metadata accessor for PBUUID);
                uint64_t v249 = sub_237AEE520();
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v249 - 8) + 56))(v235, 0, 1, v249);
                uint64_t v135 = v248;
              }
              uint64_t v250 = v306;
              sub_237A31628((uint64_t)&v353, v306, v235);
              sub_237A2D4F8(v236, v188);
              sub_237A2D868(v235, &qword_26893AFA8);
              sub_237A2D868(v250, &qword_26893AFA8);
              sub_237AEE1F4((uint64_t)v332, type metadata accessor for LamportTimestamp);
              uint64_t v107 = v347;
              ((void (*)(char *, uint64_t))*v337)(v136, v347);
              sub_237AEE1F4(v340, type metadata accessor for ValueData);
              uint64_t v139 = (uint64_t)v320;
              (*v330)((uint64_t)v320, v7);
              sub_237A2D868((uint64_t)&v353, &qword_26893AFC8);
            }
            else
            {
              sub_237A2D4F8(v339, v338);
              sub_237AEE1F4((uint64_t)v179, type metadata accessor for LamportTimestamp);
              uint64_t v136 = v333;
              ((void (*)(char *, uint64_t))*v337)(v333, v177);
              sub_237AEE1F4(v340, type metadata accessor for ValueData);
              (*v330)(v166, v169);
              uint64_t v7 = v169;
              uint64_t v155 = v341;
              uint64_t v139 = v166;
              uint64_t v107 = v177;
            }
LABEL_31:
            uint64_t v138 = (unint64_t *)(v155 + 2);
            *(void *)&long long v348 = v348 + 1;
            if (v336 == (void (**)(char *, uint64_t))v348)
            {
              sub_237AEE0F8((uint64_t)&v359);
              goto LABEL_81;
            }
            continue;
          }
          uint64_t v197 = v173;
          uint64_t v198 = v166;
          uint64_t v199 = v311;
          sub_237A67E68(v197, (uint64_t)v311, type metadata accessor for LamportTimestamp);
          swift_endAccess();
          uint64_t v200 = v332;
          if (sub_237A69390(v332, v199))
          {
            unint64_t v338 = v152;
            v201 = *(void (**)(char *, uint64_t, uint64_t))v318;
            uint64_t v202 = v334;
            uint64_t v139 = v198;
            uint64_t v203 = v335;
            (*(void (**)(char *, uint64_t, uint64_t))v318)(v334, v198, v335);
            uint64_t v204 = (uint64_t)v200;
            v205 = v329;
            uint64_t v206 = v347;
            uint64_t v309 = *(char **)v326;
            ((void (*)(char *, char *, uint64_t))v309)(v329, v333, v347);
            (*v316)((uint64_t)v205, 0, 1, v206);
            swift_beginAccess();
            sub_237AEEB50();
            sub_237AEEB70();
            swift_endAccess();
            v201(v202, v198, v203);
            v207 = v344;
            sub_237AEECC0();
            sub_237AEECA0();
            uint64_t v135 = v207;
            sub_237AE12CC(v139, v204);
            if (*((unsigned char *)v207 + v319) == 1)
            {
              uint64_t v355 = v206;
              uint64_t v208 = __swift_allocate_boxed_opaque_existential_0(&v353);
              uint64_t v136 = v333;
              ((void (*)(uint64_t *, char *, uint64_t))v309)(v208, v333, v206);
              uint64_t v209 = v207;
              uint64_t v210 = v204;
              uint64_t v211 = v278;
              uint64_t v212 = v340;
              sub_237A69D4C(v278);
              uint64_t v213 = v279;
              sub_237A69FDC(v279);
              uint64_t v135 = v209;
              sub_237A31628((uint64_t)&v353, v211, v213);
              sub_237A2D4F8(v339, v338);
              sub_237A2D868(v213, &qword_26893AFA8);
              uint64_t v107 = v347;
              sub_237A2D868(v211, &qword_26893AFA8);
              sub_237AEE1F4((uint64_t)v311, type metadata accessor for LamportTimestamp);
              sub_237AEE1F4(v210, type metadata accessor for LamportTimestamp);
              ((void (*)(char *, uint64_t))*v337)(v136, v107);
              sub_237AEE1F4(v212, type metadata accessor for ValueData);
              (*v330)(v139, v203);
              sub_237A2D868((uint64_t)&v353, &qword_26893AFC8);
              uint64_t v7 = v203;
              uint64_t v155 = v341;
            }
            else
            {
              sub_237A2D4F8(v339, v338);
              sub_237AEE1F4((uint64_t)v311, type metadata accessor for LamportTimestamp);
              sub_237AEE1F4(v204, type metadata accessor for LamportTimestamp);
              uint64_t v136 = v333;
              ((void (*)(char *, uint64_t))*v337)(v333, v206);
              sub_237AEE1F4(v340, type metadata accessor for ValueData);
              (*v330)(v139, v203);
              uint64_t v7 = v203;
              uint64_t v155 = v341;
              uint64_t v107 = v206;
            }
            goto LABEL_31;
          }
          sub_237A2D4F8(v339, v152);
          sub_237AEE1F4((uint64_t)v199, type metadata accessor for LamportTimestamp);
          sub_237AEE1F4((uint64_t)v200, type metadata accessor for LamportTimestamp);
          uint64_t v136 = v333;
          uint64_t v107 = v347;
          ((void (*)(char *, uint64_t))*v337)(v333, v347);
          sub_237AEE1F4(v340, type metadata accessor for ValueData);
          uint64_t v153 = *v330;
          uint64_t v139 = v198;
          uint64_t v154 = v198;
        }
        else
        {
          uint64_t v189 = v321;
          sub_237A67E68(v165, (uint64_t)v321, type metadata accessor for LamportTimestamp);
          swift_endAccess();
          uint64_t v139 = v166;
          if (sub_237A69390(v150, v189))
          {
            unint64_t v338 = v152;
            uint64_t v142 = v151;
            if (*((unsigned char *)v151 + v319) == 1)
            {
              int v190 = v325;
              swift_beginAccess();
              uint64_t v191 = *v190;
              uint64_t v192 = v292;
              uint64_t v193 = v347;
              MEMORY[0x237E281B0](v166, v191, v335, v347, v168);
              unsigned int v194 = (*v299)(v192, 1, v193);
              uint64_t v195 = v307;
              if (v194 == 1)
              {
                ((void (*)(char *, uint64_t))*v276)(v192, v317);
                swift_endAccess();
                v196 = (void (**)(uint64_t *, char *, uint64_t))v326;
              }
              else
              {
                unint64_t v218 = v277;
                (*(void (**)(char *, char *, uint64_t))v297)(v277, v192, v193);
                swift_endAccess();
                uint64_t v355 = v193;
                unint64_t v219 = __swift_allocate_boxed_opaque_existential_0(&v353);
                v196 = (void (**)(uint64_t *, char *, uint64_t))v326;
                (*(void (**)(uint64_t *, char *, uint64_t))v326)(v219, v218, v193);
                sub_237A31CD0((uint64_t)&v353);
                ((void (*)(char *, uint64_t))*v337)(v218, v193);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)&v353);
              }
              v220 = v333;
              uint64_t v355 = v193;
              uint64_t v221 = __swift_allocate_boxed_opaque_existential_0(&v353);
              (*v196)(v221, v220, v193);
              uint64_t v222 = v340 + *(int *)(v314 + 24);
              uint64_t v223 = v293;
              sub_237A2D334(v222, v293, &qword_26893AFD0);
              unint64_t v224 = *v310;
              LODWORD(v220) = (*v310)(v223, 1, v195);
              sub_237A2D868(v223, &qword_26893AFD0);
              if (v220 == 1)
              {
                uint64_t v225 = sub_237AEE520();
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v225 - 8) + 56))(v305, 1, 1, v225);
              }
              else
              {
                uint64_t v226 = v222;
                uint64_t v227 = v280;
                sub_237A2D334(v226, v280, &qword_26893AFD0);
                if (v224(v227, 1, v195) == 1)
                {
                  unint64_t v228 = v284;
                  *uint64_t v284 = 0;
                  v228[1] = 0;
                  sub_237AEE6E0();
                  sub_237A2D868(v227, &qword_26893AFD0);
                }
                else
                {
                  unint64_t v228 = v284;
                  sub_237A67E68(v227, (uint64_t)v284, type metadata accessor for PBUUID);
                }
                uint64_t v240 = v305;
                sub_237A6E124();
                sub_237AEE1F4((uint64_t)v228, type metadata accessor for PBUUID);
                uint64_t v241 = sub_237AEE520();
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v241 - 8) + 56))(v240, 0, 1, v241);
              }
              uint64_t v242 = v340 + *(int *)(v314 + 28);
              uint64_t v243 = v294;
              sub_237A2D334(v242, v294, &qword_26893AFD0);
              unsigned int v244 = v224(v243, 1, v195);
              sub_237A2D868(v243, &qword_26893AFD0);
              if (v244 == 1)
              {
                uint64_t v140 = sub_237AEE520();
                uint64_t v141 = (uint64_t)v290;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v140 - 8) + 56))(v290, 1, 1, v140);
                uint64_t v142 = v344;
                uint64_t v139 = (uint64_t)v320;
              }
              else
              {
                uint64_t v245 = v242;
                uint64_t v246 = v281;
                sub_237A2D334(v245, v281, &qword_26893AFD0);
                if (v224(v246, 1, v195) == 1)
                {
                  unint64_t v247 = v285;
                  *uint64_t v285 = 0;
                  v247[1] = 0;
                  sub_237AEE6E0();
                  sub_237A2D868(v246, &qword_26893AFD0);
                }
                else
                {
                  unint64_t v247 = v285;
                  sub_237A67E68(v246, (uint64_t)v285, type metadata accessor for PBUUID);
                }
                uint64_t v142 = v344;
                uint64_t v139 = (uint64_t)v320;
                uint64_t v141 = (uint64_t)v290;
                sub_237A6E124();
                sub_237AEE1F4((uint64_t)v247, type metadata accessor for PBUUID);
                uint64_t v251 = sub_237AEE520();
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v251 - 8) + 56))(v141, 0, 1, v251);
              }
              uint64_t v143 = v305;
              sub_237A31628((uint64_t)&v353, v305, v141);
              sub_237A2D868(v141, &qword_26893AFA8);
              sub_237A2D868(v143, &qword_26893AFA8);
              sub_237A2D868((uint64_t)&v353, &qword_26893AFC8);
            }
            uint64_t v144 = *(void (**)(char *, uint64_t, uint64_t))v318;
            unint64_t v145 = v334;
            uint64_t v146 = v139;
            uint64_t v147 = v335;
            (*(void (**)(char *, uint64_t, uint64_t))v318)(v334, v146, v335);
            v148 = v329;
            uint64_t v149 = v347;
            (*(void (**)(char *, char *, uint64_t))v326)(v329, v333, v347);
            (*v316)((uint64_t)v148, 0, 1, v149);
            swift_beginAccess();
            sub_237AEEB50();
            sub_237AEEB70();
            swift_endAccess();
            v144(v145, (uint64_t)v320, v147);
            uint64_t v139 = (uint64_t)v320;
            sub_237AEECC0();
            sub_237AEECA0();
            uint64_t v150 = v332;
            int v151 = v142;
            sub_237AE07EC(v139, (uint64_t)v332);
            unint64_t v152 = v338;
          }
          sub_237A2D4F8(v339, v152);
          sub_237AEE1F4((uint64_t)v321, type metadata accessor for LamportTimestamp);
          sub_237AEE1F4((uint64_t)v150, type metadata accessor for LamportTimestamp);
          uint64_t v136 = v333;
          uint64_t v107 = v347;
          ((void (*)(char *, uint64_t))*v337)(v333, v347);
          sub_237AEE1F4(v340, type metadata accessor for ValueData);
          uint64_t v153 = *v330;
          uint64_t v154 = v139;
        }
        break;
      }
      uint64_t v7 = v335;
      v153(v154, v335);
      uint64_t v155 = v341;
      uint64_t v135 = v151;
      goto LABEL_31;
    }
  }
  sub_237AEE0F8((uint64_t)&v360);
  sub_237A2D4F8(v108, v109);
LABEL_76:
  if (qword_26893ACC8 != -1) {
    goto LABEL_85;
  }
LABEL_77:
  uint64_t v252 = sub_237AEE970();
  __swift_project_value_buffer(v252, (uint64_t)qword_26893C038);
  v253 = (void *)v349;
  id v254 = (id)v349;
  id v255 = v253;
  unint64_t v256 = sub_237AEE950();
  os_log_type_t v257 = sub_237AEEDC0();
  if (os_log_type_enabled(v256, v257))
  {
    v258 = (uint8_t *)swift_slowAlloc();
    uint64_t v259 = swift_slowAlloc();
    uint64_t v353 = v259;
    *(_DWORD *)v258 = 136315138;
    v260 = (void *)v349;
    uint64_t v350 = v349;
    id v261 = (id)v349;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD8);
    uint64_t v262 = sub_237AEEBB0();
    uint64_t v350 = sub_237A38B30(v262, v263, &v353);
    sub_237AEEE60();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237A22000, v256, v257, "SyncedDictionary: failed to decode data when handling message: %s", v258, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E28EF0](v259, -1, -1);
    MEMORY[0x237E28EF0](v258, -1, -1);
  }
  else
  {
    uint64_t v264 = (void *)v349;
  }
LABEL_81:
  uint64_t v265 = v352;
  uint64_t v266 = sub_237AEE6A0();
  uint64_t v267 = *(void *)(v266 - 8);
  v268 = *(void (**)(char *, uint64_t, uint64_t))(v267 + 16);
  long long v349 = v351;
  uint64_t v269 = (uint64_t)v300;
  v268(v300, v304, v266);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v267 + 56))(v269, 0, 1, v266);
  uint64_t v270 = TupleTypeMetadata2;
  v271 = v301;
  uint64_t v272 = (uint64_t)v301 + *(int *)(TupleTypeMetadata2 + 48);
  *unint64_t v301 = v349;
  *((void *)v271 + 2) = v265;
  sub_237A39C38(v269, v272, &qword_26893AE00);
  sub_237AEE9B0();
  return (*(uint64_t (**)(_OWORD *, uint64_t))(v302 + 8))(v271, v270);
}

uint64_t sub_237AE457C(char *a1, uint64_t a2)
{
  uint64_t v46 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PBUUID(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char **)((char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_237AEE520();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v47 = v2;
  uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller);
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    goto LABEL_6;
  }
  uint64_t v21 = v8;
  uint64_t v45 = (char *)&v45 - v19;
  uint64_t v22 = v20 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownerUUID;
  swift_beginAccess();
  sub_237A2D334(v22, (uint64_t)v13, &qword_26893AFA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
LABEL_6:
    sub_237A2D868((uint64_t)v13, &qword_26893AFA8);
LABEL_7:
    v48[0] = *((void *)a1 + 6);
    swift_bridgeObjectRetain();
    uint64_t v25 = swift_bridgeObjectRetain();
    sub_237AEAA1C(v25);
    uint64_t v26 = v48[0];
    v48[0] = *((void *)a1 + 7);
    swift_bridgeObjectRetain();
    uint64_t v27 = swift_bridgeObjectRetain();
    sub_237AEA878(v27);
    uint64_t v28 = v48[0];
    v48[0] = *((void *)a1 + 8);
    swift_bridgeObjectRetain();
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = sub_237AEA730(v29);
    uint64_t v31 = v48[0];
    MEMORY[0x270FA5388](v30);
    *(&v45 - 2) = a1;
    uint64_t v32 = sub_237AD8660((void (*)(int *))sub_237AEE3B8, (uint64_t)(&v45 - 4), v31);
    uint64_t v33 = swift_bridgeObjectRelease();
    uint64_t v35 = *((void *)a1 + 1);
    uint64_t v34 = *((void *)a1 + 2);
    MEMORY[0x270FA5388](v33);
    *(&v45 - 2) = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_237AD8660((void (*)(int *))sub_237AEE18C, (uint64_t)(&v45 - 4), v34);
    swift_bridgeObjectRelease();
    v48[0] = v26;
    v48[1] = v28;
    v48[2] = v32;
    v48[3] = v35;
    v48[4] = v36;
    sub_237AE1748(v48, v46);
    uint64_t v53 = v26;
    sub_237AEE0F8((uint64_t)&v53);
    uint64_t v52 = v28;
    sub_237AEE0F8((uint64_t)&v52);
    uint64_t v51 = v32;
    sub_237AEE0F8((uint64_t)&v51);
    uint64_t v50 = v35;
    sub_237AEE0F8((uint64_t)&v50);
    uint64_t v49 = v36;
    return sub_237AEE0F8((uint64_t)&v49);
  }
  uint64_t v23 = v45;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v45, v13, v14);
  uint64_t v24 = type metadata accessor for DictionaryChangedMessage(0);
  sub_237A2D334((uint64_t)&a1[*(int *)(v24 + 56)], (uint64_t)v6, &qword_26893AFD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v6, 1, v7) == 1)
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    sub_237AEE6E0();
    sub_237A2D868((uint64_t)v6, &qword_26893AFD0);
  }
  else
  {
    sub_237A67E68((uint64_t)v6, (uint64_t)v10, type metadata accessor for PBUUID);
  }
  sub_237A6E124();
  sub_237AEE1F4((uint64_t)v10, type metadata accessor for PBUUID);
  sub_237AEE1AC(&qword_26893B120, MEMORY[0x263F07508]);
  char v38 = sub_237AEEBA0();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v15 + 8);
  v39(v18, v14);
  if (v38)
  {
    v39(v23, v14);
    goto LABEL_7;
  }
  if (qword_26893ACC8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_237AEE970();
  __swift_project_value_buffer(v40, (uint64_t)qword_26893C038);
  uint64_t v41 = sub_237AEE950();
  os_log_type_t v42 = sub_237AEEDB0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_237A22000, v41, v42, "SyncedDictionary: Cannot apply dictionary change message. Not the current owner or unowned", v43, 2u);
    uint64_t v44 = v43;
    uint64_t v23 = v45;
    MEMORY[0x237E28EF0](v44, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v39)(v23, v14);
}

uint64_t sub_237AE4BC4@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v34 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PBUUID(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v35 = (void *)((char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void *)((char *)v31 - v11);
  uint64_t v13 = sub_237AEE520();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v31 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v31 - v20;
  LODWORD(v34) = *v34;
  uint64_t v22 = type metadata accessor for DictionaryChangedMessage(0);
  sub_237A2D334((uint64_t)v32 + *(int *)(v22 + 56), (uint64_t)v6, &qword_26893AFD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    *uint64_t v12 = 0;
    v12[1] = 0;
    sub_237AEE6E0();
    sub_237A2D868((uint64_t)v6, &qword_26893AFD0);
  }
  else
  {
    sub_237A67E68((uint64_t)v6, (uint64_t)v12, type metadata accessor for PBUUID);
  }
  sub_237A6E124();
  sub_237AEE1F4((uint64_t)v12, type metadata accessor for PBUUID);
  *a3 = 0;
  uint64_t v23 = type metadata accessor for LamportTimestamp(0);
  sub_237AEE6E0();
  uint64_t v24 = (uint64_t)a3 + *(int *)(v23 + 24);
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v31[1] = v8 + 56;
  v25(v24, 1, 1, v7);
  uint64_t v32 = a3;
  v31[0] = v7;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v26(v19, v21, v13);
  uint64_t v27 = (uint64_t)v33;
  v26(v33, v19, v13);
  uint64_t v28 = v35;
  sub_237A6DFD4(v27, v35);
  sub_237A2D868(v24, &qword_26893AFD0);
  sub_237A67E68((uint64_t)v28, v24, type metadata accessor for PBUUID);
  v25(v24, 0, 1, v31[0]);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v19, v13);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v29)(v21, v13);
  *uint64_t v32 = v34;
  return result;
}

uint64_t sub_237AE4FA0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v71 = a3;
  uint64_t v69 = (void *)*v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v70 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LamportTimestamp(0);
  uint64_t v73 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v76 = (_DWORD *)((char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = type metadata accessor for DictionaryCatchupData.TombstoneTimestamp(0);
  uint64_t v11 = *(void *)(v72 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v72);
  uint64_t v75 = (uint64_t)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v63 - v14);
  uint64_t v16 = sub_237AEE710();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v17 = type metadata accessor for DictionaryCatchupData(0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (unint64_t *)((char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = *(void *)((char *)v3 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller);
  uint64_t v74 = v9;
  if (v20)
  {
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      char v22 = *(unsigned char *)(Strong + OBJC_IVAR____TtC12SyncedModels18SyncedModelManager_options);
      swift_release();
      if ((v22 & 1) == 0)
      {
        unint64_t v66 = a2;
        uint64_t v68 = v19;
        if (qword_26893ACC8 != -1) {
          swift_once();
        }
        uint64_t v67 = v11;
        uint64_t v23 = sub_237AEE970();
        __swift_project_value_buffer(v23, (uint64_t)qword_26893C038);
        uint64_t v24 = sub_237AEE950();
        os_log_type_t v25 = sub_237AEEDE0();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl(&dword_237A22000, v24, v25, "SyncedDictionary: clearing existing data due to catchup response and replaceFromLeader option", v26, 2u);
          MEMORY[0x237E28EF0](v26, -1, -1);
        }

        swift_getTupleTypeMetadata2();
        sub_237AEEC60();
        uint64_t v27 = sub_237AEEB10();
        uint64_t v28 = (void *)((char *)v4 + qword_26893BDA8);
        swift_beginAccess();
        *uint64_t v28 = v27;
        swift_bridgeObjectRelease();
        swift_getTupleTypeMetadata2();
        sub_237AEEC60();
        uint64_t v29 = sub_237AEEB10();
        uint64_t v30 = (void *)((char *)v4 + qword_26893BD80);
        swift_beginAccess();
        uint64_t *v30 = v29;
        swift_bridgeObjectRelease();
        sub_237AEEC60();
        uint64_t v31 = sub_237AEEB10();
        uint64_t v32 = (void *)((char *)v4 + qword_26893BD88);
        swift_beginAccess();
        *uint64_t v32 = v31;
        swift_bridgeObjectRelease();
        uint64_t v19 = v68;
        uint64_t v11 = v67;
        a2 = v66;
      }
    }
  }
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  sub_237A2D3FC(a1, a2);
  sub_237AEE700();
  sub_237AEE1AC(&qword_26893B968, (void (*)(uint64_t))type metadata accessor for DictionaryCatchupData);
  sub_237AEE820();
  uint64_t v33 = *v19;
  unint64_t v34 = v19[1];
  uint64_t v35 = v19[2];
  uint64_t v36 = v19[3];
  int64_t v37 = *(void *)(v36 + 16);
  if (v37)
  {
    uint64_t v68 = v19;
    uint64_t v69 = v4;
    *(void *)&long long v77 = MEMORY[0x263F8EE78];
    uint64_t v65 = v33;
    swift_bridgeObjectRetain();
    unint64_t v66 = v34;
    swift_bridgeObjectRetain();
    uint64_t v67 = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237A8CB88(0, v37, 0);
    unint64_t v38 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v64 = v36;
    unint64_t v63 = v38;
    uint64_t v39 = v36 + v38;
    uint64_t v40 = *(void *)(v11 + 72);
    uint64_t v41 = v77;
    do
    {
      sub_237AEE124(v39, (uint64_t)v15, type metadata accessor for DictionaryCatchupData.TombstoneTimestamp);
      uint64_t v42 = *v15;
      unint64_t v43 = v15[1];
      sub_237A2D3FC(*v15, v43);
      sub_237AEE1F4((uint64_t)v15, type metadata accessor for DictionaryCatchupData.TombstoneTimestamp);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237A8CB88(0, *(void *)(v41 + 16) + 1, 1);
        uint64_t v41 = v77;
      }
      unint64_t v45 = *(void *)(v41 + 16);
      unint64_t v44 = *(void *)(v41 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_237A8CB88(v44 > 1, v45 + 1, 1);
        uint64_t v41 = v77;
      }
      *(void *)(v41 + 16) = v45 + 1;
      uint64_t v46 = v41 + 16 * v45;
      *(void *)(v46 + 32) = v42;
      *(void *)(v46 + 40) = v43;
      v39 += v40;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
    uint64_t v19 = v68;
    uint64_t v47 = v68[3];
    int64_t v48 = *(void *)(v47 + 16);
    uint64_t v49 = MEMORY[0x263F8EE78];
    uint64_t v50 = (uint64_t)v70;
    if (v48)
    {
      *(void *)&long long v77 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_237A8CB4C(0, v48, 0);
      uint64_t v64 = v47;
      uint64_t v51 = v47 + v63;
      uint64_t v52 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
      do
      {
        uint64_t v53 = v75;
        sub_237AEE124(v51, v75, type metadata accessor for DictionaryCatchupData.TombstoneTimestamp);
        sub_237A2D334(v53 + *(int *)(v72 + 24), v50, &qword_26893AFE0);
        uint64_t v54 = v74;
        if ((*v52)(v50, 1, v74) == 1)
        {
          uint64_t v55 = v76;
          *uint64_t v76 = 0;
          sub_237AEE6E0();
          uint64_t v56 = (char *)v55 + *(int *)(v54 + 24);
          uint64_t v57 = type metadata accessor for PBUUID(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 1, 1, v57);
          sub_237A2D868(v50, &qword_26893AFE0);
        }
        else
        {
          sub_237A67E68(v50, (uint64_t)v76, type metadata accessor for LamportTimestamp);
        }
        sub_237AEE1F4(v75, type metadata accessor for DictionaryCatchupData.TombstoneTimestamp);
        uint64_t v49 = v77;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_237A8CB4C(0, *(void *)(v49 + 16) + 1, 1);
          uint64_t v49 = v77;
        }
        unint64_t v59 = *(void *)(v49 + 16);
        unint64_t v58 = *(void *)(v49 + 24);
        if (v59 >= v58 >> 1)
        {
          sub_237A8CB4C(v58 > 1, v59 + 1, 1);
          uint64_t v49 = v77;
        }
        *(void *)(v49 + 16) = v59 + 1;
        sub_237A67E68((uint64_t)v76, v49+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(void *)(v73 + 72) * v59, type metadata accessor for LamportTimestamp);
        v51 += v40;
        --v48;
      }
      while (v48);
      swift_bridgeObjectRelease();
      uint64_t v60 = v71;
      uint64_t v19 = v68;
    }
    else
    {
      uint64_t v60 = v71;
    }
    uint64_t v35 = v67;
    unint64_t v34 = v66;
    uint64_t v61 = v65;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v41 = MEMORY[0x263F8EE78];
    uint64_t v61 = v33;
    uint64_t v49 = MEMORY[0x263F8EE78];
    uint64_t v60 = v71;
  }
  *(void *)&long long v77 = v61;
  *((void *)&v77 + 1) = v34;
  *(void *)&long long v78 = v35;
  *((void *)&v78 + 1) = v41;
  uint64_t v79 = v49;
  sub_237AE1748((uint64_t *)&v77, v60);
  uint64_t v84 = v61;
  sub_237AEE0F8((uint64_t)&v84);
  unint64_t v83 = v34;
  sub_237AEE0F8((uint64_t)&v83);
  uint64_t v82 = v35;
  sub_237AEE0F8((uint64_t)&v82);
  uint64_t v81 = v41;
  sub_237AEE0F8((uint64_t)&v81);
  uint64_t v80 = v49;
  sub_237AEE0F8((uint64_t)&v80);
  return sub_237AEE1F4((uint64_t)v19, type metadata accessor for DictionaryCatchupData);
}

uint64_t sub_237AE5B4C()
{
  v196 = (void *)*v0;
  uint64_t v1 = v196;
  uint64_t v162 = type metadata accessor for DictionaryCatchupData(0);
  MEMORY[0x270FA5388](v162);
  uint64_t v164 = (uint64_t *)((char *)&v162 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v207 = (uint64_t)&v162 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v181 = (char *)&v162 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v180 = (char *)&v162 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v169 = (char *)&v162 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v177 = (uint64_t)&v162 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v168 = (uint64_t)&v162 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v176 = (uint64_t)&v162 - v16;
  uint64_t v17 = type metadata accessor for ValueData(0);
  uint64_t v187 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v190 = (uint64_t)&v162 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v175 = (uint64_t)&v162 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v174 = (uint64_t)&v162 - v22;
  uint64_t v23 = v1[35];
  uint64_t v24 = v1[36];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v26 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v206 = (char *)&v162 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v189 = (char *)&v162 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v179 = (char *)&v162 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v167 = (char *)&v162 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v166 = (char *)&v162 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v178 = (char *)&v162 - v38;
  MEMORY[0x270FA5388](v37);
  unsigned int v216 = (char *)&v162 - v39;
  uint64_t v40 = sub_237AEEE50();
  MEMORY[0x270FA5388](v40 - 8);
  uint64_t v197 = (char *)&v162 - v41;
  uint64_t v42 = (void *)((char *)v0 + qword_26893BDA8);
  swift_beginAccess();
  uint64_t v198 = v0;
  uint64_t v43 = v1[39];
  swift_bridgeObjectRetain();
  uint64_t v221 = v24;
  uint64_t v191 = v43;
  uint64_t v44 = sub_237AEEB30();
  swift_bridgeObjectRelease();
  int64_t v45 = v44 & ~(v44 >> 63);
  unint64_t v46 = MEMORY[0x263F8EE78];
  uint64_t v210 = sub_237A8C13C(0, v45, 0, MEMORY[0x263F8EE78]);
  uint64_t v209 = sub_237A8C108(0, *(void *)(v210 + 16), 0, v46);
  uint64_t v163 = v42;
  unint64_t v47 = *v42;
  if ((*v42 & 0xC000000000000001) != 0)
  {
    uint64_t v48 = sub_237AEEFB0();
    unint64_t v170 = 0;
    uint64_t v49 = 0;
    unint64_t v50 = 0;
    unint64_t v51 = v48 | 0x8000000000000000;
  }
  else
  {
    uint64_t v52 = -1 << *(unsigned char *)(v47 + 32);
    uint64_t v49 = ~v52;
    uint64_t v53 = *(void *)(v47 + 64);
    unint64_t v170 = v47 + 64;
    uint64_t v54 = -v52;
    if (v54 < 64) {
      uint64_t v55 = ~(-1 << v54);
    }
    else {
      uint64_t v55 = -1;
    }
    unint64_t v50 = v55 & v53;
    unint64_t v51 = v47;
  }
  uint64_t v193 = qword_26893BDA0;
  unint64_t v188 = (void *)((char *)v198 + qword_26893BD88);
  uint64_t v171 = v51 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v195 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  uint64_t v165 = v49;
  int64_t v182 = (unint64_t)(v49 + 64) >> 6;
  uint64_t v192 = v23 - 8;
  uint64_t v56 = v221 - 8;
  uint64_t v208 = (void (**)(char *, uint64_t))(v26 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v58 = 0;
  uint64_t v215 = TupleTypeMetadata2;
  unint64_t v59 = v216;
  uint64_t v60 = v197;
  unint64_t v194 = v51;
  uint64_t v200 = v56;
  uint64_t v201 = v23;
  while (1)
  {
    unint64_t v199 = v50;
    uint64_t v202 = v58;
    if ((v51 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_237AEEFC0()) {
      goto LABEL_52;
    }
    sub_237AEF150();
    swift_unknownObjectRelease();
    sub_237AEF150();
    swift_unknownObjectRelease();
    (*v195)(v60, 0, 1, TupleTypeMetadata2);
    uint64_t v64 = *(void *)(v23 - 8);
    v205 = v202;
    uint64_t v204 = v199;
    uint64_t v61 = TupleTypeMetadata2;
    uint64_t v62 = v23;
LABEL_23:
    uint64_t v70 = *(int *)(v61 + 48);
    uint64_t v71 = &v59[v70];
    uint64_t v72 = &v60[v70];
    uint64_t v217 = v64;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v59, v60, v62);
    uint64_t v73 = *(void *)(v221 - 8);
    (*(void (**)(char *, char *))(v73 + 32))(v71, v72);
    BOOL v74 = *((unsigned char *)v198 + v193) == 1;
    uint64_t v75 = v62;
    uint64_t v203 = v73;
    if (v74)
    {
      uint64_t v76 = v178;
      long long v77 = &v178[*(int *)(v61 + 48)];
      uint64_t v78 = v217;
      uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v217 + 16);
      unint64_t v218 = (v217 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v214 = v79;
      uint64_t v186 = v217 + 16;
      v79(v178, v59, v62);
      uint64_t v80 = *(void (**)(uint64_t, char *, uint64_t))(v73 + 16);
      unint64_t v184 = (v73 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v213 = v80;
      v80((uint64_t)v77, v71, v221);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
      int v81 = swift_dynamicCast();
      uint64_t v82 = v78;
      unint64_t v83 = v71;
      uint64_t v185 = v71;
      if (v81)
      {
        uint64_t v85 = v219;
        uint64_t v84 = v220;
        uint64_t v173 = v220;
        uint64_t v212 = *(void (**)(char *, uint64_t))(v82 + 8);
        v212(v76, v62);
        uint64_t v183 = v85;
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v86 = sub_237A51A38(ObjectType, v84) + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__uuid;
        swift_beginAccess();
        uint64_t v87 = sub_237AEE520();
        uint64_t v88 = *(void *)(v87 - 8);
        uint64_t v89 = v176;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))(v176, v86, v87);
        swift_release();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v88 + 56))(v89, 0, 1, v87);
        uint64_t v90 = v166;
        uint64_t v91 = (uint64_t)&v166[*(int *)(v215 + 48)];
        v214(v166, v216, v62);
        uint64_t v92 = v221;
        v213(v91, v83, v221);
        uint64_t v105 = sub_237A51A38(ObjectType, v173);
        uint64_t v93 = v105 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownerUUID;
        swift_beginAccess();
        uint64_t v94 = v168;
        sub_237A2D334(v93, v168, &qword_26893AFA8);
        swift_release();
        uint64_t v95 = v211;
        sub_237A69038(v176, v91, v94, v92, v196[41], v174);
        uint64_t v211 = v95;
        if (v95)
        {
          swift_unknownObjectRelease();
          (*v208)(v216, v215);
          sub_237A6483C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          int v151 = v90;
          uint64_t v152 = v62;
LABEL_51:
          v212(v151, v152);
          return v105;
        }
        v212(v90, v62);
        uint64_t v96 = v210;
        unint64_t v98 = *(void *)(v210 + 16);
        unint64_t v97 = *(void *)(v210 + 24);
        if (v98 >= v97 >> 1) {
          uint64_t v96 = sub_237A8C13C(v97 > 1, v98 + 1, 1, v210);
        }
        uint64_t v99 = v215;
        uint64_t v100 = v185;
        unint64_t v101 = v218;
        *(void *)(v96 + 16) = v98 + 1;
        unint64_t v102 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
        uint64_t v210 = v96;
        sub_237A67E68(v174, v96 + v102 + *(void *)(v187 + 72) * v98, type metadata accessor for ValueData);
        swift_unknownObjectRelease();
        uint64_t v103 = v216;
        os_log_type_t v104 = v100;
      }
      else
      {
        uint64_t v212 = *(void (**)(char *, uint64_t))(v82 + 8);
        v212(v76, v62);
        uint64_t v105 = sub_237AEE520();
        uint64_t v116 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56);
        v116(v177, 1, 1, v105);
        uint64_t v117 = v167;
        uint64_t v118 = (uint64_t)&v167[*(int *)(v215 + 48)];
        v214(v167, v216, v62);
        uint64_t v119 = v221;
        v213(v118, v83, v221);
        uint64_t v120 = (uint64_t)v169;
        v116((uint64_t)v169, 1, 1, v105);
        uint64_t v121 = v211;
        sub_237A69038(v177, v118, v120, v119, v196[41], v175);
        uint64_t v211 = v121;
        if (v121)
        {
          (*v208)(v216, v215);
          sub_237A6483C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          int v151 = v117;
          uint64_t v152 = v201;
          goto LABEL_51;
        }
        v212(v117, v201);
        uint64_t v122 = v210;
        unint64_t v124 = *(void *)(v210 + 16);
        unint64_t v123 = *(void *)(v210 + 24);
        if (v124 >= v123 >> 1) {
          uint64_t v122 = sub_237A8C13C(v123 > 1, v124 + 1, 1, v210);
        }
        uint64_t v99 = v215;
        uint64_t v103 = v216;
        os_log_type_t v104 = v185;
        *(void *)(v122 + 16) = v124 + 1;
        unint64_t v125 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
        uint64_t v210 = v122;
        sub_237A67E68(v175, v122 + v125 + *(void *)(v187 + 72) * v124, type metadata accessor for ValueData);
        unint64_t v101 = v218;
      }
    }
    else
    {
      uint64_t v105 = sub_237AEE520();
      uint64_t v106 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56);
      uint64_t v107 = (uint64_t)v180;
      v106(v180, 1, 1, v105);
      uint64_t v108 = v179;
      uint64_t v109 = (uint64_t)&v179[*(int *)(v61 + 48)];
      uint64_t v214 = *(void (**)(char *, char *, uint64_t))(v217 + 16);
      unint64_t v218 = v217 + 16;
      v214(v179, v216, v75);
      uint64_t v213 = *(void (**)(uint64_t, char *, uint64_t))(v73 + 16);
      v213(v109, v71, v221);
      uint64_t v110 = (uint64_t)v181;
      v106(v181, 1, 1, v105);
      uint64_t v111 = v211;
      sub_237A69038(v107, v109, v110, v221, v196[41], v190);
      uint64_t v211 = v111;
      if (v111)
      {
        (*v208)(v216, v215);
        sub_237A6483C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v217 + 8))(v108, v201);
        return v105;
      }
      uint64_t v212 = *(void (**)(char *, uint64_t))(v217 + 8);
      v212(v108, v201);
      uint64_t v112 = v210;
      unint64_t v114 = *(void *)(v210 + 16);
      unint64_t v113 = *(void *)(v210 + 24);
      if (v114 >= v113 >> 1) {
        uint64_t v112 = sub_237A8C13C(v113 > 1, v114 + 1, 1, v210);
      }
      uint64_t v99 = v215;
      uint64_t v103 = v216;
      unint64_t v101 = v218 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      *(void *)(v112 + 16) = v114 + 1;
      unint64_t v115 = (*(unsigned __int8 *)(v187 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
      uint64_t v210 = v112;
      sub_237A67E68(v190, v112 + v115 + *(void *)(v187 + 72) * v114, type metadata accessor for ValueData);
      os_log_type_t v104 = v71;
    }
    unint64_t v218 = v101;
    uint64_t v126 = v189;
    uint64_t v127 = &v189[*(int *)(v99 + 48)];
    uint64_t v128 = v103;
    uint64_t v129 = v103;
    uint64_t v130 = v201;
    unint64_t v131 = v214;
    v214(v189, v129, v201);
    uint64_t v132 = v127;
    uint64_t v133 = v104;
    uint64_t v134 = v99;
    uint64_t v135 = v221;
    uint64_t v136 = v104;
    uint64_t v137 = (void (*)(char *, char *, uint64_t))v213;
    v213((uint64_t)v132, v133, v221);
    uint64_t v202 = *v208;
    v202(v126, v134);
    uint64_t v138 = v131;
    uint64_t v139 = v206;
    uint64_t v140 = &v206[*(int *)(v134 + 48)];
    v138(v206, v128, v130);
    v137(v140, v136, v135);
    uint64_t v141 = v188;
    swift_beginAccess();
    uint64_t v142 = *v141;
    uint64_t v143 = type metadata accessor for LamportTimestamp(0);
    uint64_t v144 = v207;
    unint64_t v145 = v139;
    uint64_t v23 = v130;
    MEMORY[0x237E281B0](v145, v142, v130, v143, v191);
    swift_endAccess();
    uint64_t v146 = *(void *)(v143 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v146 + 48))(v144, 1, v143);
    if (result == 1) {
      goto LABEL_57;
    }
    uint64_t v147 = v209;
    unint64_t v149 = *(void *)(v209 + 16);
    unint64_t v148 = *(void *)(v209 + 24);
    if (v149 >= v148 >> 1) {
      uint64_t v147 = sub_237A8C108(v148 > 1, v149 + 1, 1, v209);
    }
    TupleTypeMetadata2 = v215;
    *(void *)(v147 + 16) = v149 + 1;
    unint64_t v150 = (*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80);
    uint64_t v209 = v147;
    sub_237A67E68(v207, v147 + v150 + *(void *)(v146 + 72) * v149, type metadata accessor for LamportTimestamp);
    unint64_t v59 = v216;
    v202(v216, TupleTypeMetadata2);
    (*(void (**)(char *, uint64_t))(v203 + 8))(v140, v221);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v212)(v206, v130);
    unint64_t v58 = v205;
    unint64_t v50 = v204;
    uint64_t v60 = v197;
    unint64_t v51 = v194;
  }
  if (v50)
  {
    uint64_t v61 = TupleTypeMetadata2;
    uint64_t v62 = v23;
    uint64_t v204 = (v50 - 1) & v50;
    unint64_t v63 = __clz(__rbit64(v50)) | ((void)v58 << 6);
    v205 = v58;
LABEL_22:
    uint64_t v68 = *(void *)(v51 + 48);
    unint64_t v69 = v51;
    uint64_t v64 = *(void *)(v62 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v64 + 16))(v60, v68 + *(void *)(v64 + 72) * v63, v62);
    (*(void (**)(char *, unint64_t))(*(void *)(v221 - 8) + 16))(&v60[*(int *)(v61 + 48)], *(void *)(v69 + 56) + *(void *)(*(void *)(v221 - 8) + 72) * v63);
    (*v195)(v60, 0, 1, v61);
    goto LABEL_23;
  }
  int64_t v65 = (int64_t)v58 + 1;
  if (!__OFADD__(v58, 1))
  {
    if (v65 >= v182) {
      goto LABEL_52;
    }
    unint64_t v66 = *(void *)(v170 + 8 * v65);
    if (!v66)
    {
      int64_t v67 = (int64_t)v58 + 2;
      if ((uint64_t)v58 + 2 >= v182) {
        goto LABEL_52;
      }
      unint64_t v66 = *(void *)(v170 + 8 * v67);
      if (!v66)
      {
        int64_t v67 = (int64_t)v58 + 3;
        if ((uint64_t)v58 + 3 >= v182)
        {
LABEL_52:
          (*v195)(v60, 1, 1, TupleTypeMetadata2);
          sub_237A6483C();
          uint64_t v219 = *v163;
          uint64_t v153 = v191;
          sub_237AEEB20();
          swift_bridgeObjectRetain();
          swift_getWitnessTable();
          uint64_t v105 = sub_237AEECD0();
          uint64_t v154 = (void *)((char *)v198 + qword_26893BD80);
          swift_beginAccess();
          uint64_t v155 = *v154;
          uint64_t v156 = v196[37];
          uint64_t v157 = v196[38];
          swift_bridgeObjectRetain();
          uint64_t v158 = v164;
          uint64_t v159 = v155;
          uint64_t v160 = v211;
          sub_237A6D18C(v105, v210, v209, v159, v23, v156, v157, v153, v164);
          uint64_t v211 = v160;
          if (!v160)
          {
            sub_237AEE1AC(&qword_26893B968, (void (*)(uint64_t))type metadata accessor for DictionaryCatchupData);
            uint64_t v161 = v211;
            uint64_t v105 = sub_237AEE830();
            sub_237AEE1F4((uint64_t)v158, type metadata accessor for DictionaryCatchupData);
            uint64_t v211 = v161;
          }
          return v105;
        }
        unint64_t v66 = *(void *)(v170 + 8 * v67);
        if (!v66)
        {
          while (1)
          {
            int64_t v65 = v67 + 1;
            if (__OFADD__(v67, 1)) {
              goto LABEL_56;
            }
            if (v65 >= v182) {
              goto LABEL_52;
            }
            unint64_t v66 = *(void *)(v170 + 8 * v65);
            ++v67;
            if (v66) {
              goto LABEL_21;
            }
          }
        }
      }
      int64_t v65 = v67;
    }
LABEL_21:
    uint64_t v61 = TupleTypeMetadata2;
    uint64_t v62 = v23;
    uint64_t v204 = (v66 - 1) & v66;
    v205 = (void (*)(char *, uint64_t))v65;
    unint64_t v63 = __clz(__rbit64(v66)) + (v65 << 6);
    goto LABEL_22;
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_237AE7214()
{
  uint64_t v188 = *v0;
  uint64_t v1 = v188;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFE0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v170 = (uint64_t)&v164 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v174 = (uint64_t)&v164 - v5;
  uint64_t v6 = type metadata accessor for PBUUID(0);
  uint64_t v210 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v172 = (uint64_t *)((char *)&v164 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v187 = (unint64_t *)((char *)&v164 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v176 = (uint64_t *)((char *)&v164 - v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFD0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v171 = (uint64_t)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v181 = (uint64_t)&v164 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v175 = (uint64_t)&v164 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v191 = (uint64_t)&v164 - v19;
  uint64_t v20 = sub_237AEE520();
  uint64_t v217 = *(void (***)(char *, uint64_t))(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v198 = (char *)&v164 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v186 = (char *)&v164 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v185 = (char *)&v164 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v164 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v164 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v203 = (unsigned int (*)(char *, uint64_t, uint64_t))((char *)&v164 - v33);
  uint64_t v34 = type metadata accessor for LamportTimestamp(0);
  uint64_t v197 = *(void *)(v34 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  uint64_t v208 = (_DWORD *)((char *)&v164 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  unint64_t v184 = (int *)((char *)&v164 - v38);
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  uint64_t v212 = (_DWORD *)((char *)&v164 - v40);
  uint64_t v41 = *(void *)(v1 + 280);
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v39);
  uint64_t v180 = (char *)&v164 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v209 = (char *)&v164 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  uint64_t v189 = (char *)&v164 - v48;
  MEMORY[0x270FA5388](v47);
  unint64_t v213 = (unint64_t)&v164 - v49;
  uint64_t v218 = v50;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v206 = sub_237AEEE50();
  uint64_t v52 = *(void *)(v206 - 8);
  uint64_t v53 = MEMORY[0x270FA5388](v206);
  uint64_t v204 = (char *)&v164 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = MEMORY[0x270FA5388](v53);
  uint64_t v192 = (char *)&v164 - v56;
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  unint64_t v59 = (char *)&v164 - v58;
  MEMORY[0x270FA5388](v57);
  uint64_t v195 = (char *)&v164 - v60;
  uint64_t v193 = v0;
  uint64_t v61 = (char *)v0 + qword_26893BD88;
  swift_beginAccess();
  uint64_t v173 = v61;
  uint64_t v62 = *(void *)v61;
  uint64_t v63 = *(void *)(*(void *)v61 + 64);
  uint64_t v168 = *(void *)v61 + 64;
  uint64_t v64 = 1 << *(unsigned char *)(v62 + 32);
  uint64_t v65 = -1;
  if (v64 < 64) {
    uint64_t v65 = ~(-1 << v64);
  }
  unint64_t v207 = v65 & v63;
  unint64_t v66 = (unint64_t)(v64 + 63) >> 6;
  uint64_t v194 = TupleTypeMetadata2 - 8;
  uint64_t v215 = (uint64_t (**)(char *, char *, uint64_t))(v42 + 16);
  v205 = (void (**)(char *, char *, uint64_t))(v52 + 32);
  uint64_t v201 = (void (**)(char *, char *, uint64_t))(v42 + 32);
  uint64_t v200 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v210 + 48);
  int64_t v67 = (void (**)(char *, uint64_t, uint64_t))(v217 + 2);
  ++v217;
  uint64_t v196 = v42;
  unint64_t v199 = (uint64_t (**)(char *, uint64_t))(v42 + 8);
  uint64_t v183 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56);
  int64_t v182 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v197 + 56);
  uint64_t v68 = v41;
  unint64_t v165 = v66 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v70 = 0;
  int64_t v169 = v66;
  unint64_t v167 = v66 - 4;
  uint64_t v177 = result;
  uint64_t v166 = result + 96;
  uint64_t v219 = v6;
  uint64_t v220 = v32;
  unsigned int v216 = v29;
  uint64_t v221 = v20;
  uint64_t v210 = v41;
  uint64_t v211 = TupleTypeMetadata2;
  uint64_t v214 = v67;
  uint64_t v190 = (uint64_t)v59;
  while (1)
  {
    uint64_t v79 = v204;
    if (v207)
    {
      unint64_t v80 = __clz(__rbit64(v207));
      v207 &= v207 - 1;
      int64_t v202 = v70;
      unint64_t v81 = v80 | (v70 << 6);
      goto LABEL_8;
    }
    int64_t v104 = v70 + 1;
    if (__OFADD__(v70, 1)) {
      goto LABEL_81;
    }
    if (v104 >= v169)
    {
      int64_t v202 = v70;
      unint64_t v207 = 0;
      uint64_t v83 = 1;
      goto LABEL_9;
    }
    unint64_t v105 = *(void *)(v168 + 8 * v104);
    if (v105) {
      goto LABEL_19;
    }
    if (v70 + 2 >= v169)
    {
      unint64_t v207 = 0;
      uint64_t v83 = 1;
LABEL_33:
      int64_t v202 = v104;
      goto LABEL_9;
    }
    unint64_t v105 = *(void *)(v168 + 8 * (v70 + 2));
    if (v105)
    {
      int64_t v104 = v70 + 2;
LABEL_19:
      unint64_t v207 = (v105 - 1) & v105;
      unint64_t v81 = __clz(__rbit64(v105)) + (v104 << 6);
      int64_t v202 = v104;
LABEL_8:
      uint64_t v82 = v177;
      (*(void (**)(char *, unint64_t, uint64_t))(v196 + 16))(v59, *(void *)(v177 + 48) + *(void *)(v196 + 72) * v81, v68);
      sub_237AEE124(*(void *)(v82 + 56) + *(void *)(v197 + 72) * v81, (uint64_t)&v59[*(int *)(TupleTypeMetadata2 + 48)], type metadata accessor for LamportTimestamp);
      uint64_t v83 = 0;
      goto LABEL_9;
    }
    int64_t v104 = v70 + 3;
    if (v70 + 3 < v169)
    {
      unint64_t v105 = *(void *)(v168 + 8 * v104);
      if (v105) {
        goto LABEL_19;
      }
      while (v167 != v70)
      {
        unint64_t v105 = *(void *)(v166 + 8 * v70++);
        if (v105)
        {
          int64_t v104 = v70 + 3;
          goto LABEL_19;
        }
      }
      unint64_t v207 = 0;
      uint64_t v83 = 1;
      int64_t v104 = v165;
      goto LABEL_33;
    }
    unint64_t v207 = 0;
    uint64_t v83 = 1;
    int64_t v202 = v70 + 2;
LABEL_9:
    uint64_t v84 = *(void *)(TupleTypeMetadata2 - 8);
    uint64_t v85 = v84;
    uint64_t v86 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56);
    uint64_t v87 = v84 + 56;
    v86(v59, v83, 1, TupleTypeMetadata2);
    uint64_t v88 = *v205;
    uint64_t v89 = v195;
    (*v205)(v195, v59, v206);
    uint64_t v92 = *(char **)(v85 + 48);
    uint64_t v91 = v85 + 48;
    uint64_t v90 = v92;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v92)(v89, 1, TupleTypeMetadata2) == 1)
    {
      uint64_t v203 = (unsigned int (*)(char *, uint64_t, uint64_t))v90;
      unint64_t v207 = (unint64_t)v88;
      swift_release();
      uint64_t v117 = (char *)v193 + qword_26893BD80;
      swift_beginAccess();
      uint64_t v194 = (uint64_t)v117;
      uint64_t v118 = *(void *)v117;
      uint64_t v119 = *(void *)(*(void *)v117 + 64);
      uint64_t v190 = *(void *)v117 + 64;
      uint64_t v120 = 1 << *(unsigned char *)(v118 + 32);
      uint64_t v121 = -1;
      if (v120 < 64) {
        uint64_t v121 = ~(-1 << v120);
      }
      unint64_t v213 = v121 & v119;
      unint64_t v122 = (unint64_t)(v120 + 63) >> 6;
      uint64_t v176 = (void *)(v122 - 1);
      uint64_t result = swift_bridgeObjectRetain();
      unint64_t v123 = 0;
      uint64_t v191 = v122;
      uint64_t v177 = v122 - 4;
      uint64_t v195 = (char *)result;
      uint64_t v189 = (char *)(result + 96);
      int64_t v202 = v87;
      uint64_t v124 = v219;
      unint64_t v125 = v214;
      uint64_t v179 = v91;
      uint64_t v178 = v86;
      while (!v213)
      {
        uint64_t v142 = (uint64_t)v123 + 1;
        if (__OFADD__(v123, 1)) {
          goto LABEL_82;
        }
        if (v142 >= v191)
        {
          uint64_t v212 = v123;
          unint64_t v213 = 0;
          uint64_t v129 = 1;
        }
        else
        {
          unint64_t v143 = *(void *)(v190 + 8 * v142);
          if (v143) {
            goto LABEL_58;
          }
          if ((uint64_t)v123 + 2 >= v191)
          {
            uint64_t v212 = (_DWORD *)((char *)v123 + 1);
            unint64_t v213 = 0;
            uint64_t v129 = 1;
          }
          else
          {
            unint64_t v143 = *(void *)(v190 + 8 * ((void)v123 + 2));
            if (v143)
            {
              uint64_t v142 = (uint64_t)v123 + 2;
LABEL_58:
              uint64_t v212 = (_DWORD *)v142;
              unint64_t v213 = (v143 - 1) & v143;
              unint64_t v127 = __clz(__rbit64(v143)) + (v142 << 6);
LABEL_47:
              uint64_t v128 = v195;
              (*(void (**)(char *, unint64_t, uint64_t))(v196 + 16))(v79, *((void *)v195 + 6) + *(void *)(v196 + 72) * v127, v68);
              sub_237AEE124(*((void *)v128 + 7) + *(void *)(v197 + 72) * v127, (uint64_t)&v79[*(int *)(TupleTypeMetadata2 + 48)], type metadata accessor for LamportTimestamp);
              uint64_t v129 = 0;
              goto LABEL_48;
            }
            uint64_t v142 = (uint64_t)v123 + 3;
            if ((uint64_t)v123 + 3 >= v191)
            {
              uint64_t v212 = (_DWORD *)((char *)v123 + 2);
              unint64_t v213 = 0;
              uint64_t v129 = 1;
            }
            else
            {
              unint64_t v143 = *(void *)(v190 + 8 * v142);
              if (v143) {
                goto LABEL_58;
              }
              while ((_DWORD *)v177 != v123)
              {
                unint64_t v143 = *(void *)&v189[8 * (void)v123];
                unint64_t v123 = (_DWORD *)((char *)v123 + 1);
                if (v143)
                {
                  uint64_t v142 = (uint64_t)v123 + 3;
                  goto LABEL_58;
                }
              }
              unint64_t v213 = 0;
              uint64_t v129 = 1;
              uint64_t v212 = v176;
            }
          }
        }
LABEL_48:
        v86(v79, v129, 1, TupleTypeMetadata2);
        uint64_t v130 = v192;
        ((void (*)(char *, char *, uint64_t))v207)(v192, v79, v206);
        if (v203(v130, 1, TupleTypeMetadata2) == 1) {
          return swift_release();
        }
        uint64_t v131 = (uint64_t)&v130[*(int *)(TupleTypeMetadata2 + 48)];
        (*v201)(v209, v130, v68);
        uint64_t v132 = v208;
        sub_237A67E68(v131, (uint64_t)v208, type metadata accessor for LamportTimestamp);
        uint64_t v133 = (uint64_t)v132 + *(int *)(v218 + 24);
        uint64_t v134 = v181;
        sub_237A2D334(v133, v181, &qword_26893AFD0);
        uint64_t v135 = *v200;
        int v136 = (*v200)(v134, 1, v124);
        sub_237A2D868(v134, &qword_26893AFD0);
        if (v136 == 1)
        {
          if (qword_26893AD10 != -1) {
            swift_once();
          }
          uint64_t v137 = v221;
          uint64_t v138 = __swift_project_value_buffer(v221, (uint64_t)qword_26893C0C8);
          (*v125)(v198, v138, v137);
        }
        else
        {
          uint64_t v139 = v171;
          sub_237A2D334(v133, v171, &qword_26893AFD0);
          unsigned int v140 = v135(v139, 1, v124);
          uint64_t v141 = v172;
          if (v140 == 1)
          {
            *uint64_t v172 = 0;
            v141[1] = 0;
            sub_237AEE6E0();
            sub_237A2D868(v139, &qword_26893AFD0);
          }
          else
          {
            sub_237A67E68(v139, (uint64_t)v172, type metadata accessor for PBUUID);
          }
          sub_237A6E124();
          sub_237AEE1F4((uint64_t)v141, type metadata accessor for PBUUID);
        }
        if (qword_26893AD10 != -1) {
          swift_once();
        }
        uint64_t v144 = v221;
        uint64_t v145 = __swift_project_value_buffer(v221, (uint64_t)qword_26893C0C8);
        uint64_t v146 = *v125;
        uint64_t v147 = v220;
        (*v125)(v220, v145, v144);
        unint64_t v148 = v198;
        char v149 = sub_237AEE4E0();
        unint64_t v150 = *v217;
        (*v217)(v147, v144);
        v150(v148, v144);
        if (v149)
        {
          uint64_t result = (*v215)(v180, v209, v210);
          uint64_t v151 = *(void *)((char *)v193 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller);
          if (!v151) {
            goto LABEL_84;
          }
          uint64_t v153 = v220;
          uint64_t v152 = v221;
          v146(v220, v151 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID, v221);
          uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v146)(v216, v153, v152);
          int v154 = *v208 + 1;
          if (*v208 == -1) {
            goto LABEL_80;
          }
          uint64_t v155 = v184;
          *unint64_t v184 = 0;
          uint64_t v156 = v218;
          sub_237AEE6E0();
          uint64_t v157 = (uint64_t)v155 + *(int *)(v156 + 24);
          uint64_t v158 = *v183;
          (*v183)(v157, 1, 1, v219);
          uint64_t v159 = v185;
          v146(v185, (uint64_t)v216, v152);
          uint64_t v160 = v186;
          v146(v186, (uint64_t)v159, v152);
          uint64_t v161 = v187;
          uint64_t v162 = (uint64_t)v160;
          unint64_t v125 = v214;
          sub_237A6DFD4(v162, v187);
          sub_237A2D868(v157, &qword_26893AFD0);
          sub_237A67E68((uint64_t)v161, v157, type metadata accessor for PBUUID);
          v158(v157, 0, 1, v219);
          uint64_t v124 = v219;
          v150(v159, v152);
          v150(v216, v152);
          int *v155 = v154;
          uint64_t v163 = v170;
          sub_237A67E68((uint64_t)v155, v170, type metadata accessor for LamportTimestamp);
          v150(v220, v152);
          (*v182)(v163, 0, 1, v218);
          swift_beginAccess();
          sub_237AEEB50();
          sub_237AEEB70();
          swift_endAccess();
        }
        sub_237AEE1F4((uint64_t)v208, type metadata accessor for LamportTimestamp);
        uint64_t v68 = v210;
        uint64_t result = (*v199)(v209, v210);
        TupleTypeMetadata2 = v211;
        unint64_t v123 = v212;
        uint64_t v79 = v204;
        uint64_t v86 = v178;
      }
      unint64_t v126 = __clz(__rbit64(v213));
      uint64_t v212 = v123;
      v213 &= v213 - 1;
      unint64_t v127 = v126 | ((void)v123 << 6);
      goto LABEL_47;
    }
    uint64_t v93 = (uint64_t)&v89[*(int *)(TupleTypeMetadata2 + 48)];
    (*v201)((char *)v213, v89, v68);
    uint64_t v94 = v212;
    sub_237A67E68(v93, (uint64_t)v212, type metadata accessor for LamportTimestamp);
    uint64_t v95 = v219;
    uint64_t v96 = (uint64_t)v94 + *(int *)(v218 + 24);
    uint64_t v97 = v191;
    sub_237A2D334(v96, v191, &qword_26893AFD0);
    unint64_t v98 = *v200;
    LODWORD(v94) = (*v200)(v97, 1, v95);
    sub_237A2D868(v97, &qword_26893AFD0);
    if (v94 == 1)
    {
      if (qword_26893AD10 != -1) {
        swift_once();
      }
      uint64_t v99 = v221;
      uint64_t v100 = __swift_project_value_buffer(v221, (uint64_t)qword_26893C0C8);
      unint64_t v101 = v214;
      (*v214)((char *)v203, v100, v99);
    }
    else
    {
      uint64_t v102 = v175;
      sub_237A2D334(v96, v175, &qword_26893AFD0);
      if (v98(v102, 1, v95) == 1)
      {
        uint64_t v103 = v176;
        *uint64_t v176 = 0;
        v103[1] = 0;
        sub_237AEE6E0();
        sub_237A2D868(v102, &qword_26893AFD0);
      }
      else
      {
        uint64_t v103 = v176;
        sub_237A67E68(v102, (uint64_t)v176, type metadata accessor for PBUUID);
      }
      unint64_t v101 = v214;
      sub_237A6E124();
      sub_237AEE1F4((uint64_t)v103, type metadata accessor for PBUUID);
    }
    if (qword_26893AD10 != -1) {
      swift_once();
    }
    uint64_t v106 = v221;
    uint64_t v107 = __swift_project_value_buffer(v221, (uint64_t)qword_26893C0C8);
    uint64_t v108 = *v101;
    uint64_t v109 = v220;
    (*v101)(v220, v107, v106);
    uint64_t v110 = (char *)v203;
    char v111 = sub_237AEE4E0();
    uint64_t v112 = *v217;
    (*v217)(v109, v106);
    v112(v110, v106);
    TupleTypeMetadata2 = v211;
    if (v111) {
      break;
    }
LABEL_5:
    sub_237AEE1F4((uint64_t)v212, type metadata accessor for LamportTimestamp);
    uint64_t result = (*v199)((char *)v213, v68);
    unint64_t v59 = (char *)v190;
    uint64_t v70 = v202;
  }
  uint64_t result = (*v215)(v189, (char *)v213, v68);
  uint64_t v113 = *(void *)((char *)v193 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller);
  if (!v113) {
    goto LABEL_83;
  }
  unint64_t v114 = v220;
  uint64_t v115 = v221;
  v108(v220, v113 + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__ownershipUUID, v221);
  uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v108)(v216, v114, v115);
  int v116 = *v212 + 1;
  if (*v212 != -1)
  {
    uint64_t v71 = v184;
    *unint64_t v184 = 0;
    uint64_t v72 = v218;
    sub_237AEE6E0();
    uint64_t v73 = (uint64_t)v71 + *(int *)(v72 + 24);
    BOOL v74 = *v183;
    (*v183)(v73, 1, 1, v219);
    uint64_t v75 = v185;
    v108(v185, (uint64_t)v216, v221);
    uint64_t v76 = (uint64_t)v186;
    v108(v186, (uint64_t)v75, v221);
    long long v77 = v187;
    sub_237A6DFD4(v76, v187);
    sub_237A2D868(v73, &qword_26893AFD0);
    sub_237A67E68((uint64_t)v77, v73, type metadata accessor for PBUUID);
    v74(v73, 0, 1, v219);
    v112(v75, v221);
    v112(v216, v221);
    int *v71 = v116;
    uint64_t v78 = v174;
    sub_237A67E68((uint64_t)v71, v174, type metadata accessor for LamportTimestamp);
    v112(v220, v221);
    (*v182)(v78, 0, 1, v72);
    swift_beginAccess();
    uint64_t v68 = v210;
    TupleTypeMetadata2 = v211;
    sub_237AEEB50();
    sub_237AEEB70();
    swift_endAccess();
    goto LABEL_5;
  }
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_237AE8A7C()
{
  uint64_t v70 = *v0;
  uint64_t v1 = v70;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFA8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v73 = (uint64_t)&v51 - v7;
  uint64_t v8 = *(void *)(v1 + 280);
  uint64_t v58 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v68 = (char *)&v51 - v9;
  uint64_t v10 = *(void *)(v1 + 288);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v69 = sub_237AEEE50();
  uint64_t v12 = *(void *)(v69 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v69);
  uint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v51 - v17;
  if (*((unsigned char *)v0 + qword_26893BDA0) != 1) {
    return result;
  }
  uint64_t v63 = v5;
  uint64_t v19 = (void *)((char *)v0 + qword_26893BDA8);
  swift_beginAccess();
  unint64_t v20 = *v19;
  if ((*v19 & 0xC000000000000001) != 0)
  {
    uint64_t v21 = sub_237AEEFB0();
    unint64_t v54 = 0;
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    unint64_t v24 = v21 | 0x8000000000000000;
  }
  else
  {
    uint64_t v25 = -1 << *(unsigned char *)(v20 + 32);
    uint64_t v22 = ~v25;
    uint64_t v26 = *(void *)(v20 + 64);
    unint64_t v54 = v20 + 64;
    uint64_t v27 = -v25;
    if (v27 < 64) {
      uint64_t v28 = ~(-1 << v27);
    }
    else {
      uint64_t v28 = -1;
    }
    unint64_t v23 = v28 & v26;
    unint64_t v24 = v20;
  }
  uint64_t v64 = (void *)((char *)v0 + qword_26893BD90);
  uint64_t v62 = v0;
  uint64_t v65 = (void *)((char *)v0 + qword_26893BD98);
  uint64_t v56 = v24 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v67 = TupleTypeMetadata2 - 8;
  uint64_t v53 = v22;
  uint64_t v57 = v58 + 16;
  uint64_t v71 = v10 - 8;
  unint64_t v66 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v60 = (void (**)(char *, char *, uint64_t))(v58 + 32);
  unint64_t v59 = (void (**)(char *, uint64_t))(v58 + 8);
  int64_t v55 = (unint64_t)(v22 + 64) >> 6;
  int64_t v52 = v55 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v29 = 0;
  unint64_t v61 = v24;
  while ((v24 & 0x8000000000000000) != 0)
  {
    if (sub_237AEEFC0())
    {
      sub_237AEF150();
      swift_unknownObjectRelease();
      sub_237AEF150();
      swift_unknownObjectRelease();
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v34 = 1;
    }
    int64_t v33 = v29;
    uint64_t v72 = v23;
LABEL_24:
    uint64_t v36 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v15, v34, 1, TupleTypeMetadata2);
    (*v66)(v18, v15, v69);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v18, 1, TupleTypeMetadata2) == 1)
    {
      sub_237A6483C();
      uint64_t v49 = v64;
      swift_beginAccess();
      *uint64_t v49 = 0;
      swift_bridgeObjectRelease();
      uint64_t v50 = v65;
      swift_beginAccess();
      *uint64_t v50 = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v37 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v38 = v68;
    (*v60)(v68, v18, v8);
    v74[3] = v10;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v74);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(boxed_opaque_existential_0, v37, v10);
    uint64_t v40 = v64;
    swift_beginAccess();
    uint64_t v41 = *v40;
    if (v41)
    {
      uint64_t v42 = sub_237AEE520();
      MEMORY[0x237E281B0](v38, v41, v8, v42, *(void *)(v70 + 312));
      swift_endAccess();
    }
    else
    {
      swift_endAccess();
      uint64_t v43 = sub_237AEE520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v73, 1, 1, v43);
    }
    uint64_t v44 = (uint64_t)v63;
    uint64_t v45 = v65;
    swift_beginAccess();
    uint64_t v46 = *v45;
    if (v46)
    {
      uint64_t v30 = sub_237AEE520();
      MEMORY[0x237E281B0](v38, v46, v8, v30, *(void *)(v70 + 312));
      swift_endAccess();
    }
    else
    {
      swift_endAccess();
      uint64_t v47 = sub_237AEE520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v44, 1, 1, v47);
    }
    uint64_t v31 = v73;
    sub_237A31628((uint64_t)v74, v73, v44);
    sub_237A2D868(v44, &qword_26893AFA8);
    sub_237A2D868(v31, &qword_26893AFA8);
    (*v59)(v38, v8);
    uint64_t result = sub_237A2D868((uint64_t)v74, &qword_26893AFC8);
    int64_t v29 = v33;
    unint64_t v23 = v72;
    unint64_t v24 = v61;
  }
  if (v23)
  {
    uint64_t v72 = (v23 - 1) & v23;
    unint64_t v32 = __clz(__rbit64(v23)) | (v29 << 6);
    int64_t v33 = v29;
    goto LABEL_14;
  }
  int64_t v33 = v29 + 1;
  if (__OFADD__(v29, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v33 >= v55)
  {
    uint64_t v72 = 0;
    uint64_t v34 = 1;
    int64_t v33 = v29;
    goto LABEL_24;
  }
  unint64_t v35 = *(void *)(v54 + 8 * v33);
  if (v35) {
    goto LABEL_20;
  }
  if (v29 + 2 >= v55)
  {
    uint64_t v72 = 0;
    uint64_t v34 = 1;
    goto LABEL_24;
  }
  unint64_t v35 = *(void *)(v54 + 8 * (v29 + 2));
  if (v35)
  {
    int64_t v33 = v29 + 2;
    goto LABEL_20;
  }
  int64_t v48 = v29 + 3;
  if (v29 + 3 >= v55)
  {
    uint64_t v72 = 0;
    uint64_t v34 = 1;
    int64_t v33 = v29 + 2;
    goto LABEL_24;
  }
  unint64_t v35 = *(void *)(v54 + 8 * v48);
  if (v35)
  {
    int64_t v33 = v29 + 3;
LABEL_20:
    uint64_t v72 = (v35 - 1) & v35;
    unint64_t v32 = __clz(__rbit64(v35)) + (v33 << 6);
LABEL_14:
    (*(void (**)(char *, unint64_t, uint64_t))(v58 + 16))(v15, *(void *)(v24 + 48) + *(void *)(v58 + 72) * v32, v8);
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(&v15[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v24 + 56) + *(void *)(*(void *)(v10 - 8) + 72) * v32, v10);
    uint64_t v34 = 0;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v33 = v48 + 1;
    if (__OFADD__(v48, 1)) {
      break;
    }
    if (v33 >= v55)
    {
      uint64_t v72 = 0;
      uint64_t v34 = 1;
      int64_t v33 = v52;
      goto LABEL_24;
    }
    unint64_t v35 = *(void *)(v54 + 8 * v33);
    ++v48;
    if (v35) {
      goto LABEL_20;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_237AE9358(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v2 = *(void *)(*(void *)v1 + 288);
  uint64_t v42 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)v35 - v3;
  uint64_t v5 = *(void *)(v4 + 280);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v48 = sub_237AEEE50();
  uint64_t v44 = *(void (***)(char *, char *, uint64_t))(v48 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v48);
  uint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v35 - v11;
  if (*(unsigned char *)(v1 + qword_26893BDA0) != 1) {
    return result;
  }
  uint64_t v13 = (unint64_t *)(v1 + qword_26893BDA8);
  swift_beginAccess();
  unint64_t v14 = *v13;
  if ((*v13 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = sub_237AEEFB0();
    unint64_t v36 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    unint64_t v18 = v15 | 0x8000000000000000;
  }
  else
  {
    uint64_t v19 = -1 << *(unsigned char *)(v14 + 32);
    uint64_t v16 = ~v19;
    uint64_t v20 = *(void *)(v14 + 64);
    unint64_t v36 = v14 + 64;
    uint64_t v21 = -v19;
    if (v21 < 64) {
      uint64_t v22 = ~(-1 << v21);
    }
    else {
      uint64_t v22 = -1;
    }
    unint64_t v17 = v22 & v20;
    unint64_t v18 = v14;
  }
  unint64_t v47 = v18;
  uint64_t v45 = TupleTypeMetadata2 - 8;
  uint64_t v49 = v5 - 8;
  uint64_t v38 = v18 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v39 = v42 + 16;
  uint64_t v43 = (void (**)(char *, char *, uint64_t))(v42 + 32);
  v44 += 4;
  int64_t v37 = (unint64_t)(v16 + 64) >> 6;
  v35[0] = v37 - 1;
  v35[1] = v16;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v40 = v2;
  while ((v47 & 0x8000000000000000) != 0)
  {
    if (sub_237AEEFC0())
    {
      sub_237AEF150();
      swift_unknownObjectRelease();
      sub_237AEF150();
      swift_unknownObjectRelease();
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = 1;
    }
    int64_t v26 = v23;
    uint64_t v24 = v17;
LABEL_23:
    uint64_t v31 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v9, v29, 1, TupleTypeMetadata2);
    (*v44)(v12, v9, v48);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v12, 1, TupleTypeMetadata2) == 1) {
      return sub_237A6483C();
    }
    (*v43)(v46, &v12[*(int *)(TupleTypeMetadata2 + 48)], v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
    if (swift_dynamicCast())
    {
      uint64_t v32 = v50;
      uint64_t ObjectType = swift_getObjectType();
      sub_237A51A38(ObjectType, v32);
      sub_237A751E8(v41);
      swift_unknownObjectRelease();
      swift_release();
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v12, v5);
    int64_t v23 = v26;
    unint64_t v17 = v24;
  }
  if (v17)
  {
    uint64_t v24 = (v17 - 1) & v17;
    unint64_t v25 = __clz(__rbit64(v17)) | (v23 << 6);
    int64_t v26 = v23;
    goto LABEL_13;
  }
  int64_t v26 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v26 >= v37)
  {
    uint64_t v24 = 0;
    uint64_t v29 = 1;
    int64_t v26 = v23;
    goto LABEL_23;
  }
  unint64_t v30 = *(void *)(v36 + 8 * v26);
  if (v30) {
    goto LABEL_19;
  }
  if (v23 + 2 >= v37)
  {
    uint64_t v24 = 0;
    uint64_t v29 = 1;
    goto LABEL_23;
  }
  unint64_t v30 = *(void *)(v36 + 8 * (v23 + 2));
  if (v30)
  {
    int64_t v26 = v23 + 2;
    goto LABEL_19;
  }
  int64_t v34 = v23 + 3;
  if (v23 + 3 >= v37)
  {
    uint64_t v24 = 0;
    uint64_t v29 = 1;
    int64_t v26 = v23 + 2;
    goto LABEL_23;
  }
  unint64_t v30 = *(void *)(v36 + 8 * v34);
  if (v30)
  {
    int64_t v26 = v23 + 3;
LABEL_19:
    uint64_t v24 = (v30 - 1) & v30;
    unint64_t v25 = __clz(__rbit64(v30)) + (v26 << 6);
LABEL_13:
    unint64_t v27 = v47;
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v9, *(void *)(v47 + 48) + *(void *)(*(void *)(v5 - 8) + 72) * v25, v5);
    unint64_t v28 = *(void *)(v27 + 56) + *(void *)(v42 + 72) * v25;
    uint64_t v2 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(&v9[*(int *)(TupleTypeMetadata2 + 48)], v28, v40);
    uint64_t v29 = 0;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v26 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v26 >= v37)
    {
      uint64_t v24 = 0;
      uint64_t v29 = 1;
      int64_t v26 = v35[0];
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v36 + 8 * v26);
    ++v34;
    if (v30) {
      goto LABEL_19;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_237AE9948()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_237AEE520();
  uint64_t v58 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v66 = (char *)v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v1 + 280);
  uint64_t v5 = *(void *)(v1 + 288);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v77 = sub_237AEEE50();
  uint64_t v7 = *(void *)(v77 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v77);
  uint64_t v75 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v56 - v11;
  uint64_t v78 = v0;
  if (*((unsigned char *)v0 + qword_26893BDA0) != 1) {
    return result;
  }
  uint64_t v13 = (void *)((char *)v78 + qword_26893BDA8);
  swift_beginAccess();
  unint64_t v14 = *v13;
  if ((v14 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = sub_237AEEFB0();
    unint64_t v57 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    unint64_t v18 = v15 | 0x8000000000000000;
  }
  else
  {
    uint64_t v19 = -1 << *(unsigned char *)(v14 + 32);
    uint64_t v16 = ~v19;
    uint64_t v20 = *(void *)(v14 + 64);
    unint64_t v57 = v14 + 64;
    uint64_t v21 = -v19;
    if (v21 < 64) {
      uint64_t v22 = ~(-1 << v21);
    }
    else {
      uint64_t v22 = -1;
    }
    unint64_t v17 = v22 & v20;
    unint64_t v18 = v14;
  }
  uint64_t v63 = v2;
  unint64_t v76 = v18;
  uint64_t v60 = v18 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v74 = TupleTypeMetadata2 - 8;
  v56[1] = v16;
  uint64_t v79 = v5 - 8;
  uint64_t v80 = v4 - 8;
  uint64_t v73 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v62 = (void (**)(char *, uint64_t))(v58 + 16);
  unint64_t v61 = (void (**)(unint64_t, uint64_t))(v58 + 8);
  int64_t v59 = (unint64_t)(v16 + 64) >> 6;
  v56[0] = v59 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v72 = MEMORY[0x263F8EE58] + 8;
  uint64_t v69 = v12;
  uint64_t v71 = v4;
  uint64_t v65 = v5;
  uint64_t v64 = TupleTypeMetadata2;
  while (1)
  {
    unint64_t v24 = v76;
    if ((v76 & 0x8000000000000000) == 0) {
      break;
    }
    if (sub_237AEEFC0())
    {
      int64_t v34 = v75;
      sub_237AEF150();
      uint64_t v29 = v34;
      uint64_t v12 = v69;
      swift_unknownObjectRelease();
      uint64_t v32 = v5;
      sub_237AEF150();
      swift_unknownObjectRelease();
      uint64_t v33 = 0;
      int64_t v81 = v23;
      goto LABEL_24;
    }
    uint64_t v32 = v5;
    uint64_t v33 = 1;
    int64_t v81 = v23;
LABEL_23:
    uint64_t v29 = v75;
LABEL_24:
    uint64_t v37 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v29, v33, 1, TupleTypeMetadata2);
    (*v73)(v12, v29, v77);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v12, 1, TupleTypeMetadata2) == 1) {
      return sub_237A6483C();
    }
    uint64_t v38 = &v12[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v5 = v32;
    v85[3] = v32;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v85);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(boxed_opaque_existential_0, v38, v32);
    sub_237A2D80C((uint64_t)v85, (uint64_t)v84);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26893AFB8);
    if (swift_dynamicCast())
    {
      unint64_t v70 = v17;
      uint64_t v40 = v83;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v42 = sub_237A51A38(ObjectType, v40) + OBJC_IVAR____TtC12SyncedModels21SyncedModelController__uuid;
      swift_beginAccess();
      uint64_t v43 = (uint64_t)v66;
      uint64_t v44 = v63;
      (*v62)(v66, v42);
      uint64_t v45 = (void *)((char *)v78 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__pendingModelControllers);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v46 = v43;
      unint64_t v47 = sub_237A8C46C(v43);
      LOBYTE(v43) = v48;
      swift_bridgeObjectRelease();
      uint64_t v68 = v40;
      uint64_t v67 = ObjectType;
      if (v43)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v50 = *v45;
        uint64_t v82 = *v45;
        *uint64_t v45 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_237A2B0A4();
          uint64_t v50 = v82;
        }
        uint64_t v51 = *(void (**)(unint64_t, uint64_t))(v58 + 8);
        v51(*(void *)(v50 + 48) + *(void *)(v58 + 72) * v47, v44);
        uint64_t v52 = v82;
        sub_237A2862C(v47, v82);
        *uint64_t v45 = v52;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v51 = *v61;
      }
      v51(v46, v44);
      swift_endAccess();
      swift_release();
      if (*(void *)((char *)v78 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller))
      {
        uint64_t Strong = swift_weakLoadStrong();
        TupleTypeMetadata2 = v64;
        uint64_t v12 = v69;
        unint64_t v17 = v70;
        if (Strong)
        {
          uint64_t v54 = sub_237A51A38(v67, v68);
          sub_237A3A27C(v54);
          swift_unknownObjectRelease();
          swift_release();
          swift_release();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        swift_release();
        uint64_t v4 = v71;
        uint64_t v5 = v65;
      }
      else
      {
        swift_unknownObjectRelease();
        swift_release();
        uint64_t v4 = v71;
        uint64_t v5 = v65;
        TupleTypeMetadata2 = v64;
        uint64_t v12 = v69;
        unint64_t v17 = v70;
      }
    }
    else
    {
      uint64_t v4 = v71;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v12, v4);
    int64_t v23 = v81;
  }
  if (v17)
  {
    unint64_t v25 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v26 = v25 | (v23 << 6);
    int64_t v81 = v23;
    goto LABEL_14;
  }
  int64_t v35 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_53;
  }
  if (v35 >= v59)
  {
    uint64_t v32 = v5;
    unint64_t v17 = 0;
    uint64_t v33 = 1;
    int64_t v81 = v23;
    goto LABEL_23;
  }
  unint64_t v36 = *(void *)(v57 + 8 * v35);
  if (v36) {
    goto LABEL_20;
  }
  if (v23 + 2 >= v59)
  {
    uint64_t v32 = v5;
    int64_t v81 = v23 + 1;
    unint64_t v17 = 0;
    uint64_t v33 = 1;
    goto LABEL_23;
  }
  unint64_t v36 = *(void *)(v57 + 8 * (v23 + 2));
  if (v36)
  {
    int64_t v35 = v23 + 2;
    goto LABEL_20;
  }
  uint64_t v55 = v23 + 3;
  if (v23 + 3 >= v59)
  {
    uint64_t v32 = v5;
    unint64_t v17 = 0;
    uint64_t v33 = 1;
    int64_t v81 = v23 + 2;
    goto LABEL_23;
  }
  unint64_t v36 = *(void *)(v57 + 8 * v55);
  if (v36)
  {
    int64_t v35 = v23 + 3;
LABEL_20:
    unint64_t v17 = (v36 - 1) & v36;
    int64_t v81 = v35;
    unint64_t v26 = __clz(__rbit64(v36)) + (v35 << 6);
LABEL_14:
    uint64_t v27 = v4;
    uint64_t v28 = *(void *)(v4 - 8);
    uint64_t v29 = v75;
    (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v75, *(void *)(v76 + 48) + *(void *)(v28 + 72) * v26, v27);
    uint64_t v30 = *(void *)(v5 - 8);
    unint64_t v31 = *(void *)(v24 + 56) + *(void *)(v30 + 72) * v26;
    uint64_t v32 = v5;
    (*(void (**)(char *, unint64_t, uint64_t))(v30 + 16))(&v29[*(int *)(TupleTypeMetadata2 + 48)], v31, v5);
    uint64_t v33 = 0;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v35 = v55 + 1;
    if (__OFADD__(v55, 1)) {
      break;
    }
    if (v35 >= v59)
    {
      uint64_t v32 = v5;
      unint64_t v17 = 0;
      uint64_t v33 = 1;
      int64_t v81 = v56[0];
      goto LABEL_23;
    }
    unint64_t v36 = *(void *)(v57 + 8 * v35);
    ++v55;
    if (v36) {
      goto LABEL_20;
    }
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysRemoved.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysRemoved.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*SyncedDictionary.SyncedDictionaryChangeInfo.keysRemoved.modify())()
{
  return nullsub_1;
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysChanged.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysChanged.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SyncedDictionary.SyncedDictionaryChangeInfo.keysChanged.modify())()
{
  return nullsub_1;
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysAdded.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncedDictionary.SyncedDictionaryChangeInfo.keysAdded.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SyncedDictionary.SyncedDictionaryChangeInfo.keysAdded.modify())()
{
  return nullsub_1;
}

uint64_t SyncedDictionary.receive<A>(subscriber:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_237AEE9C0();
}

uint64_t sub_237AEA4D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t SyncedDictionary.deinit()
{
  sub_237AEE1F4(v0 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__timestamp, type metadata accessor for LamportTimestamp);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t SyncedDictionary.__deallocating_deinit()
{
  SyncedDictionary.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_237AEA678(uint64_t a1)
{
  return SyncedDictionary.receive<A>(subscriber:)(a1);
}

uint64_t sub_237AEA69C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = SyncedDictionary.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_237AEA6C8(void *a1)
{
  return SyncedDictionary.encode(to:)(a1);
}

uint64_t sub_237AEA6F0()
{
  return sub_237AE5B4C();
}

uint64_t type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo()
{
  return swift_getGenericMetadata();
}

uint64_t sub_237AEA730(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_237A8C170(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[4 * v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_237AEF030();
  __break(1u);
  return result;
}

uint64_t sub_237AEA878(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_237A8C13C(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for ValueData(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_237AEF030();
  __break(1u);
  return result;
}

uint64_t sub_237AEAA1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  unint64_t v3 = sub_237A8BC68(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_237AEF030();
  __break(1u);
  return result;
}

uint64_t sub_237AEAB70(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_237A8C2B4(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_237AEE6A0() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_237AEF030();
  __break(1u);
  return result;
}

uint64_t sub_237AEAD20(uint64_t a1, uint64_t a2)
{
  if (qword_26893ACD8 != -1) {
    swift_once();
  }
  sub_237A6FAA4(a2, a2);
  uint64_t v4 = *(void *)(a2 - 8);
  swift_allocObject();
  uint64_t v5 = sub_237AEEC40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_237A6A26C(v5);
  sub_237AEECC0();
  swift_getWitnessTable();
  uint64_t v7 = sub_237AEE440();
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_237AEAEB8(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = type metadata accessor for LamportTimestamp(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (_DWORD *)((char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = qword_26893BD80;
  uint64_t v9 = *(void *)(v4 + 280);
  swift_retain();
  swift_getTupleTypeMetadata2();
  sub_237AEEC60();
  uint64_t v10 = *(void *)(v4 + 312);
  *(void *)((char *)v2 + v8) = sub_237AEEB10();
  uint64_t v11 = qword_26893BD88;
  sub_237AEEC60();
  *(void *)((char *)v2 + v11) = sub_237AEEB10();
  *(void *)((char *)v2 + qword_26893BD90) = 0;
  *(void *)((char *)v2 + qword_26893BD98) = 0;
  uint64_t v12 = *(void *)(v4 + 288);
  if (swift_conformsToProtocol2()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  *((unsigned char *)v2 + qword_26893BDA0) = v13 != 0;
  uint64_t v14 = qword_26893C3D0;
  uint64_t v15 = *(void *)(v4 + 336);
  v20[0] = v9;
  v20[1] = v12;
  long long v21 = *(_OWORD *)(v4 + 296);
  uint64_t v22 = v10;
  long long v23 = *(_OWORD *)(v4 + 320);
  uint64_t v24 = v15;
  type metadata accessor for SyncedDictionary.SyncedDictionaryChangeInfo();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26893AE00);
  swift_getTupleTypeMetadata2();
  sub_237AEE9E0();
  *(void *)((char *)v2 + v14) = sub_237AEE9D0();
  swift_getTupleTypeMetadata2();
  sub_237AEEC60();
  *(void *)((char *)v2 + qword_26893BDA8) = sub_237AEEB10();
  swift_release();
  *uint64_t v7 = 0;
  sub_237AEE6E0();
  uint64_t v16 = (char *)v7 + *(int *)(v5 + 24);
  uint64_t v17 = type metadata accessor for PBUUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  *(void *)((char *)v2 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__controller) = 0;
  *(_DWORD *)((char *)v2 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__parentPropertyID) = -1;
  *(_DWORD *)((char *)v2 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__propertyID) = -1;
  uint64_t v18 = OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__pendingModelControllers;
  *(void *)((char *)v2 + v18) = sub_237A30FF8(MEMORY[0x263F8EE78]);
  sub_237A67E68((uint64_t)v7, (uint64_t)v2 + OBJC_IVAR____TtC12SyncedModels18SyncedPropertyBase__timestamp, type metadata accessor for LamportTimestamp);
  swift_retain();
  sub_237ADC9C0(a1);
  swift_release();
  return v2;
}

uint64_t sub_237AEB254()
{
  uint64_t v1 = v0 + qword_26893BDA8;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_237AEB2A0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_237AEB254();
  return swift_bridgeObjectRetain();
}

uint64_t sub_237AEB2DC()
{
  unint64_t v0 = swift_bridgeObjectRetain();
  sub_237AEB29C(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_237AEB320()
{
  return 64;
}

__n128 sub_237AEB32C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_237AEB340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_237AEB354()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SyncedDictionary()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for SyncedDictionary(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SyncedDictionary);
}

uint64_t dispatch thunk of SyncedDictionary.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of SyncedDictionary.__allocating_init(wrappedValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t sub_237AEB430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 80);
}

uint64_t sub_237AEB43C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_237AEB480(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_237AEB4D0(void *a1, void *a2)
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

uint64_t sub_237AEB548(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_237AEB598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

unsigned char *sub_237AEB5A0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237AEB66CLL);
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

void sub_237AEB694()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    type metadata accessor for LamportTimestamp(319);
    if (v1 <= 0x3F)
    {
      sub_237A38FF4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_237AEB79C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v57 = *(void *)(a3 + 24);
  uint64_t v3 = *(void *)(v57 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v59 = sub_237AEE6F0();
  uint64_t v5 = *(void *)(v59 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  uint64_t v8 = v6 | 7;
  uint64_t v9 = v8 + v4;
  uint64_t v10 = v6 + 4;
  uint64_t v11 = *(void *)(v5 + 64);
  uint64_t v12 = v8 + v11;
  size_t v13 = ((v7 + 16) & ~v7) + v11;
  int v60 = *(_DWORD *)(v5 + 84);
  size_t v54 = v13;
  if (!v60) {
    ++v13;
  }
  size_t __n = v13;
  unint64_t v14 = ((v12 + ((v6 + 4) & ~(unint64_t)v6)) & ~(v6 | 7))
      + v13;
  uint64_t v15 = sub_237AEE520();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v55 = v16;
  uint64_t v56 = v15;
  uint64_t v17 = *(_DWORD *)(v16 + 80);
  if (*(_DWORD *)(v16 + 84)) {
    uint64_t v18 = *(void *)(v16 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v16 + 64) + 1;
  }
  uint64_t v19 = v8 | (*(unsigned char *)(v16 + 80) | *(unsigned char *)(v3 + 80));
  if (v19 != 7
    || ((*(_DWORD *)(v16 + 80) | *(_DWORD *)(v3 + 80) | v6) & 0x100000) != 0
    || ((v18
       + v17
       + ((v14 + *(_DWORD *)(v16 + 80) + (v9 & ~(v6 | 7))) & ~(unint64_t)*(_DWORD *)(v16 + 80))) & ~v17)
     + v18 > 0x18)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    uint64_t v23 = v22 + ((v19 + 16) & ~v19);
    swift_retain();
    return (uint64_t *)v23;
  }
  size_t v51 = v18;
  unint64_t v52 = v14 + *(_DWORD *)(v16 + 80);
  uint64_t v24 = ~v8;
  uint64_t v25 = ~v7;
  uint64_t v49 = ~v17;
  uint64_t v50 = v18 + v17;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v3 + 16))(a1, a2, v57);
  unint64_t v26 = (_DWORD *)(((unint64_t)a1 + v9) & v24);
  uint64_t v27 = (_DWORD *)(((unint64_t)a2 + v9) & v24);
  _DWORD *v26 = *v27;
  uint64_t v58 = v26;
  unint64_t v28 = ((unint64_t)v26 + v10) & ~v7;
  char v48 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
  v48(v28, ((unint64_t)v27 + v10) & ~v7, v59);
  uint64_t v29 = (void *)((v12 + v28) & v24);
  uint64_t v30 = (unsigned __int16 *)((v12 + (((unint64_t)v27 + v10) & ~v7)) & v24);
  uint64_t v62 = v27;
  if (v60)
  {
    int v31 = (*(uint64_t (**)(unint64_t))(v5 + 48))((v7
                                                                 + (((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8)
                                                                 + 8) & v25);
    uint64_t v33 = v55;
    uint64_t v32 = v56;
    uint64_t v34 = v49;
    size_t v35 = v54;
    if (!v31)
    {
LABEL_33:
      void *v29 = *(void *)v30;
      uint64_t v39 = (void *)(((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v40 = (void *)(((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v39 = *v40;
      v48(((unint64_t)v39 + v7 + 8) & v25, ((unint64_t)v40 + v7 + 8) & v25, v59);
      if (!v60) {
        *((unsigned char *)v29 + v35) = 0;
      }
      goto LABEL_35;
    }
  }
  else
  {
    size_t v35 = v54;
    uint64_t v33 = v55;
    uint64_t v32 = v56;
    uint64_t v34 = v49;
    if (!*((unsigned char *)v30 + v54)) {
      goto LABEL_33;
    }
    int v36 = (*((unsigned __int8 *)v30 + v54) - 1) << (8 * v54);
    if (v54 > 3) {
      int v36 = 0;
    }
    if (v54)
    {
      int v37 = v54 <= 3 ? v54 : 4;
      switch(v37)
      {
        case 2:
          int v38 = *v30;
          break;
        case 3:
          int v38 = *v30 | (*((unsigned __int8 *)v30 + 2) << 16);
          break;
        case 4:
          int v38 = *(_DWORD *)v30;
          break;
        default:
          int v38 = *(unsigned __int8 *)v30;
          break;
      }
    }
    else
    {
      int v38 = 0;
    }
    if ((v38 | v36) == 0xFFFFFFFF) {
      goto LABEL_33;
    }
  }
  memcpy(v29, v30, __n);
LABEL_35:
  uint64_t v41 = (void *)(((unint64_t)v58 + v52) & v34);
  uint64_t v42 = (const void *)(((unint64_t)v62 + v52) & v34);
  uint64_t v43 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48);
  if (v43(v42, 1, v32))
  {
    size_t v44 = v51;
    memcpy(v41, v42, v51);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v41, v42, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v41, 0, 1, v32);
    size_t v44 = v51;
  }
  uint64_t v45 = (void *)(((unint64_t)v41 + v50) & v34);
  uint64_t v46 = (const void *)(((unint64_t)v42 + v50) & v34);
  if (v43(v46, 1, v32))
  {
    memcpy(v45, v46, v44);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v45, v46, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v45, 0, 1, v32);
  }
  return a1;
}

uint64_t sub_237AEBCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = sub_237AEE6F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v4 + a1 + (v8 | 7)) & ~(v8 | 7);
  size_t v35 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v35((v8 + 4 + v9) & ~v8, v5);
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = (unsigned __int16 *)((v10 + (v8 | 7) + ((v8 + 4 + v9) & ~v8)) & ~(v8 | 7));
  uint64_t v12 = *(unsigned int *)(v6 + 84);
  uint64_t v13 = ((v8 + 16) & ~v8) + v10;
  uint64_t v36 = v10 + (v8 | 7);
  if (v12)
  {
    int v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))((v8 + (((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v8, v12, v5);
    uint64_t v15 = v9;
    uint64_t v17 = v8 + 4;
    uint64_t v16 = ~(v8 | 7);
    uint64_t v18 = ~v8;
    uint64_t v19 = v15;
    if (v14) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v20 = v9;
  uint64_t v17 = v8 + 4;
  uint64_t v16 = ~(v8 | 7);
  uint64_t v18 = ~v8;
  uint64_t v19 = v20;
  if (!*((unsigned char *)v11 + v13)) {
    goto LABEL_18;
  }
  int v21 = (*((unsigned __int8 *)v11 + v13) - 1) << (8 * v13);
  if (v13 > 3) {
    int v21 = 0;
  }
  if (v13)
  {
    int v22 = v13 <= 3 ? v13 : 4;
    switch(v22)
    {
      case 2:
        int v23 = *v11;
        break;
      case 3:
        int v23 = *v11 | (*((unsigned __int8 *)v11 + 2) << 16);
        break;
      case 4:
        int v23 = *(_DWORD *)v11;
        break;
      default:
        int v23 = *(unsigned __int8 *)v11;
        break;
    }
  }
  else
  {
    int v23 = 0;
  }
  if ((v23 | v21) == 0xFFFFFFFF) {
LABEL_18:
  }
    v35((v8 + (((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & v18, v5);
LABEL_19:
  uint64_t v24 = sub_237AEE520();
  uint64_t v25 = (v36 + (v17 & v18)) & v16;
  uint64_t v37 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned __int8 *)(v37 + 80);
  uint64_t v27 = v19 + v13;
  if (!v12) {
    ++v27;
  }
  uint64_t v28 = v27 + v25 + v26;
  uint64_t v29 = ~v26;
  uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48);
  if (!v30(v28 & ~v26, 1, v24)) {
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v28 & ~v26, v24);
  }
  uint64_t v31 = (v28 | v26) + *(void *)(v37 + 64);
  if (!*(_DWORD *)(v37 + 84)) {
    ++v31;
  }
  uint64_t v32 = v31 & v29;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v30)(v31 & v29, 1, v24);
  if (!result)
  {
    uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8);
    return v34(v32, v24);
  }
  return result;
}

uint64_t sub_237AEC044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v10 | 7;
  uint64_t v12 = (v10 | 7) + v6;
  uint64_t v58 = a1;
  uint64_t v13 = (_DWORD *)((v12 + a1) & ~(v10 | 7));
  int v14 = (_DWORD *)((v12 + a2) & ~(v10 | 7));
  *uint64_t v13 = *v14;
  uint64_t v56 = v14;
  uint64_t v57 = v13;
  uint64_t v15 = ((unint64_t)v13 + v10 + 4) & ~v10;
  uint64_t v61 = v10 + 4;
  uint64_t v16 = ((unint64_t)v14 + v10 + 4) & ~v10;
  size_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v54(v15, v16, v7);
  uint64_t v17 = *(void *)(v8 + 64);
  uint64_t v18 = v17 + (v10 | 7) + v15;
  uint64_t v19 = (void *)(v18 & ~(v10 | 7));
  uint64_t v20 = (unsigned __int16 *)((v17 + v11 + v16) & ~v11);
  uint64_t v21 = *(unsigned int *)(v8 + 84);
  uint64_t v22 = v17 + ((v10 + 16) & ~v10);
  uint64_t v55 = v7;
  uint64_t v59 = ~v10;
  if (!v21)
  {
    uint64_t v25 = v56;
    uint64_t v26 = v57;
    uint64_t v27 = ~(v10 | 7);
    if (!*((unsigned char *)v20 + v22)) {
      goto LABEL_22;
    }
    int v28 = (*((unsigned __int8 *)v20 + v22) - 1) << (8 * v22);
    if (v22 > 3) {
      int v28 = 0;
    }
    if (v22)
    {
      int v29 = v22 <= 3 ? v17 + ((v10 + 16) & ~v10) : 4;
      switch(v29)
      {
        case 2:
          int v30 = *v20;
          break;
        case 3:
          int v30 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
          break;
        case 4:
          int v30 = *(_DWORD *)v20;
          break;
        default:
          int v30 = *(unsigned __int8 *)v20;
          break;
      }
    }
    else
    {
      int v30 = 0;
    }
    if ((v30 | v28) == 0xFFFFFFFF) {
      goto LABEL_22;
    }
LABEL_18:
    if (v21) {
      size_t v31 = v17 + ((v10 + 16) & ~v10);
    }
    else {
      size_t v31 = v22 + 1;
    }
    memcpy(v19, v20, v31);
    uint64_t v32 = ~v10;
    goto LABEL_24;
  }
  int v23 = (void *)(v18 & ~v11);
  int v24 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))((v10 + (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10, v21, v7);
  uint64_t v19 = v23;
  uint64_t v25 = v56;
  uint64_t v26 = v57;
  uint64_t v27 = ~(v10 | 7);
  if (v24) {
    goto LABEL_18;
  }
LABEL_22:
  *uint64_t v19 = *(void *)v20;
  uint64_t v33 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v34 = (void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v33 = *v34;
  uint64_t v32 = ~v10;
  uint64_t v35 = ((unint64_t)v33 + v10 + 8) & v59;
  uint64_t v36 = ((unint64_t)v34 + v10 + 8) & v59;
  uint64_t v37 = v19;
  v54(v35, v36, v55);
  if (!v21) {
    *((unsigned char *)v37 + v22) = 0;
  }
LABEL_24:
  if (v21) {
    uint64_t v38 = v22;
  }
  else {
    uint64_t v38 = v22 + 1;
  }
  uint64_t v39 = v38 + (((v61 & v32) + v11 + v17) & v27);
  uint64_t v40 = sub_237AEE520();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v41;
  uint64_t v43 = *(unsigned __int8 *)(v41 + 80);
  uint64_t v44 = (uint64_t)v26 + v39 + v43;
  uint64_t v60 = ~v43;
  uint64_t v45 = (uint64_t)v25 + v39 + v43;
  uint64_t v46 = (const void *)(v45 & ~v43);
  uint64_t v62 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v41 + 48);
  if (v62(v46, 1, v40))
  {
    int v47 = *(_DWORD *)(v42 + 84);
    size_t v48 = *(void *)(v42 + 64);
    if (v47) {
      size_t v49 = *(void *)(v42 + 64);
    }
    else {
      size_t v49 = v48 + 1;
    }
    memcpy((void *)(v44 & ~v43), v46, v49);
  }
  else
  {
    (*(void (**)(uint64_t, const void *, uint64_t))(v42 + 16))(v44 & ~v43, v46, v40);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v44 & ~v43, 0, 1, v40);
    int v47 = *(_DWORD *)(v42 + 84);
    size_t v48 = *(void *)(v42 + 64);
  }
  if (v47) {
    size_t v50 = v48;
  }
  else {
    size_t v50 = v48 + 1;
  }
  size_t v51 = (void *)(((v44 | v43) + v50) & v60);
  unint64_t v52 = (const void *)(((v45 | v43) + v50) & v60);
  if (v62(v52, 1, v40))
  {
    memcpy(v51, v52, v50);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v42 + 16))(v51, v52, v40);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v51, 0, 1, v40);
  }
  return v58;
}

uint64_t sub_237AEC4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v10 | 7;
  uint64_t v12 = (v10 | 7) + v6;
  uint64_t v13 = (_DWORD *)((v12 + a1) & ~(v10 | 7));
  int v14 = (_DWORD *)((v12 + a2) & ~(v10 | 7));
  *uint64_t v13 = *v14;
  uint64_t v74 = a1;
  uint64_t v75 = v13;
  uint64_t v15 = ~v10;
  uint64_t v16 = ((unint64_t)v13 + v10 + 4) & ~v10;
  uint64_t v73 = v14;
  uint64_t v17 = ((unint64_t)v14 + v10 + 4) & ~v10;
  unint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
  v70(v16, v17, v7);
  uint64_t v18 = *(void *)(v8 + 64);
  uint64_t v19 = (unsigned __int16 *)((v18 + v11 + v16) & ~v11);
  uint64_t v72 = ~v10;
  uint64_t v20 = (unsigned __int16 *)((v18 + v11 + v17) & ~v11);
  uint64_t v21 = *(unsigned int *)(v9 + 84);
  size_t v22 = v18 + ((v10 + 16) & ~v10);
  if (!v21)
  {
    char v31 = 8 * v22;
    if (*((unsigned char *)v19 + v22))
    {
      int v32 = (*((unsigned __int8 *)v19 + v22) - 1) << v31;
      if (v22 > 3) {
        int v32 = 0;
      }
      if (v22)
      {
        int v33 = v22 <= 3 ? v18 + ((v10 + 16) & ~v10) : 4;
        switch(v33)
        {
          case 2:
            int v34 = *v19;
            break;
          case 3:
            int v34 = *v19 | (*((unsigned __int8 *)v19 + 2) << 16);
            break;
          case 4:
            int v34 = *(_DWORD *)v19;
            break;
          default:
            int v34 = *(unsigned __int8 *)v19;
            break;
        }
      }
      else
      {
        int v34 = 0;
      }
      if ((v34 | v32) != 0xFFFFFFFF)
      {
        if (*((unsigned char *)v20 + v22))
        {
          int v35 = (*((unsigned __int8 *)v20 + v22) - 1) << v31;
          if (v22 > 3) {
            int v35 = 0;
          }
          if (v22)
          {
            int v36 = v22 <= 3 ? v18 + ((v10 + 16) & ~v10) : 4;
            switch(v36)
            {
              case 2:
                int v37 = *v20;
                break;
              case 3:
                int v37 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
                break;
              case 4:
                int v37 = *(_DWORD *)v20;
                break;
              default:
                int v37 = *(unsigned __int8 *)v20;
                break;
            }
          }
          else
          {
            int v37 = 0;
          }
          if ((v37 | v35) != 0xFFFFFFFF) {
            goto LABEL_4;
          }
        }
        goto LABEL_83;
      }
    }
    if (!*((unsigned char *)v20 + v22)) {
      goto LABEL_51;
    }
    int v38 = (*((unsigned __int8 *)v20 + v22) - 1) << v31;
    if (v22 > 3) {
      int v38 = 0;
    }
    uint64_t v71 = v18;
    if (v22)
    {
      if (v22 <= 3) {
        int v39 = v18 + ((v10 + 16) & ~v10);
      }
      else {
        int v39 = 4;
      }
      switch(v39)
      {
        case 2:
          int v40 = *v20;
          break;
        case 3:
          int v40 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
          break;
        case 4:
          int v40 = *(_DWORD *)v20;
          break;
        default:
          int v40 = *(unsigned __int8 *)v20;
          break;
      }
    }
    else
    {
      int v40 = 0;
    }
    int v25 = (v40 | v38) + 1;
LABEL_46:
    uint64_t v18 = v71;
    if (v25)
    {
      uint64_t v30 = ~v10;
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))((v10 + (((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & v72, v7);
      if (v21) {
        size_t v41 = v22;
      }
      else {
        size_t v41 = v22 + 1;
      }
      memcpy(v19, v20, v41);
      goto LABEL_52;
    }
LABEL_51:
    uint64_t v43 = *(void *)v20;
    unint64_t v42 = (unint64_t)v20 + 15;
    *(void *)uint64_t v19 = v43;
    unint64_t v44 = (unint64_t)v19 + 15;
    *(void *)(v44 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v42 & 0xFFFFFFFFFFFFFFF8);
    uint64_t v30 = ~v10;
    v70((v10 + 8 + (v44 & 0xFFFFFFFFFFFFFFF8)) & v72, (v10 + 8 + (v42 & 0xFFFFFFFFFFFFFFF8)) & v72, v7);
LABEL_52:
    uint64_t v27 = ~(v10 | 7);
    int v28 = v73;
    uint64_t v29 = v10 + 4;
LABEL_53:
    uint64_t v45 = v10 | 7;
    goto LABEL_54;
  }
  uint64_t v71 = v18;
  int v23 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48);
  int v24 = v23((v10 + 8 + (((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8)) & v15, v21, v7);
  int v25 = v23((v10 + 8 + (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8)) & v15, v21, v7);
  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v18 = v71;
  if (v25)
  {
LABEL_4:
    if (v21) {
      size_t v26 = v22;
    }
    else {
      size_t v26 = v22 + 1;
    }
    memcpy(v19, v20, v26);
    uint64_t v27 = ~(v10 | 7);
    int v28 = v73;
    uint64_t v30 = ~v10;
    uint64_t v29 = v10 + 4;
    goto LABEL_53;
  }
LABEL_83:
  uint64_t v68 = *(void *)v20;
  unint64_t v67 = (unint64_t)v20 + 15;
  *(void *)uint64_t v19 = v68;
  uint64_t v69 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v69 = *(void *)(v67 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v30 = ~v10;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)v69 + v10 + 8) & v72, (v10 + 8 + (v67 & 0xFFFFFFFFFFFFFFF8)) & v72, v7);
  uint64_t v27 = ~(v10 | 7);
  int v28 = v73;
  uint64_t v29 = v10 + 4;
  uint64_t v45 = v10 | 7;
  if (!v21) {
    *((unsigned char *)v19 + v22) = 0;
  }
LABEL_54:
  uint64_t v46 = ((v29 & v30) + v45 + v18) & v27;
  if (v21) {
    size_t v47 = v22;
  }
  else {
    size_t v47 = v22 + 1;
  }
  size_t v48 = v47 + v46;
  uint64_t v49 = sub_237AEE520();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(unsigned __int8 *)(v50 + 80);
  unint64_t v52 = (unint64_t)v75 + v48 + v51;
  uint64_t v76 = ~v51;
  uint64_t v53 = (uint64_t)v28 + v48 + v51;
  size_t v54 = (const void *)(v53 & ~v51);
  uint64_t v55 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v50 + 48);
  int v56 = v55(v52 & ~v51, 1, v49);
  int v57 = v55((unint64_t)v54, 1, v49);
  if (v56)
  {
    if (!v57)
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v50 + 16))(v52 & ~v51, v54, v49);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v50 + 56))(v52 & ~v51, 0, 1, v49);
      goto LABEL_68;
    }
    int v58 = *(_DWORD *)(v50 + 84);
    size_t v59 = *(void *)(v50 + 64);
  }
  else
  {
    if (!v57)
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v50 + 24))(v52 & ~v51, v54, v49);
      goto LABEL_68;
    }
    (*(void (**)(unint64_t, uint64_t))(v50 + 8))(v52 & ~v51, v49);
    int v58 = *(_DWORD *)(v50 + 84);
    size_t v59 = *(void *)(v50 + 64);
  }
  if (v58) {
    size_t v60 = v59;
  }
  else {
    size_t v60 = v59 + 1;
  }
  memcpy((void *)(v52 & ~v51), v54, v60);
LABEL_68:
  if (*(_DWORD *)(v50 + 84)) {
    size_t v61 = *(void *)(v50 + 64);
  }
  else {
    size_t v61 = *(void *)(v50 + 64) + 1;
  }
  uint64_t v62 = (void *)(((v52 | v51) + v61) & v76);
  uint64_t v63 = (const void *)(((v53 | v51) + v61) & v76);
  int v64 = v55((unint64_t)v62, 1, v49);
  int v65 = v55((unint64_t)v63, 1, v49);
  if (!v64)
  {
    if (!v65)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 24))(v62, v63, v49);
      return v74;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v62, v49);
    goto LABEL_76;
  }
  if (v65)
  {
LABEL_76:
    memcpy(v62, v63, v61);
    return v74;
  }
  (*(void (**)(void *, const void *, uint64_t))(v50 + 16))(v62, v63, v49);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v50 + 56))(v62, 0, 1, v49);
  return v74;
}

uint64_t sub_237AECC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v10 | 7;
  uint64_t v12 = (v10 | 7) + v6;
  uint64_t v58 = a1;
  uint64_t v13 = (_DWORD *)((v12 + a1) & ~(v10 | 7));
  int v14 = (_DWORD *)((v12 + a2) & ~(v10 | 7));
  *uint64_t v13 = *v14;
  int v56 = v14;
  int v57 = v13;
  uint64_t v15 = ((unint64_t)v13 + v10 + 4) & ~v10;
  uint64_t v61 = v10 + 4;
  uint64_t v16 = ((unint64_t)v14 + v10 + 4) & ~v10;
  size_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  v54(v15, v16, v7);
  uint64_t v17 = *(void *)(v8 + 64);
  uint64_t v18 = v17 + (v10 | 7) + v15;
  uint64_t v19 = (void *)(v18 & ~(v10 | 7));
  uint64_t v20 = (unsigned __int16 *)((v17 + v11 + v16) & ~v11);
  uint64_t v21 = *(unsigned int *)(v8 + 84);
  uint64_t v22 = v17 + ((v10 + 16) & ~v10);
  uint64_t v55 = v7;
  uint64_t v59 = ~v10;
  if (!v21)
  {
    int v25 = v56;
    size_t v26 = v57;
    uint64_t v27 = ~(v10 | 7);
    if (!*((unsigned char *)v20 + v22)) {
      goto LABEL_22;
    }
    int v28 = (*((unsigned __int8 *)v20 + v22) - 1) << (8 * v22);
    if (v22 > 3) {
      int v28 = 0;
    }
    if (v22)
    {
      int v29 = v22 <= 3 ? v17 + ((v10 + 16) & ~v10) : 4;
      switch(v29)
      {
        case 2:
          int v30 = *v20;
          break;
        case 3:
          int v30 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
          break;
        case 4:
          int v30 = *(_DWORD *)v20;
          break;
        default:
          int v30 = *(unsigned __int8 *)v20;
          break;
      }
    }
    else
    {
      int v30 = 0;
    }
    if ((v30 | v28) == 0xFFFFFFFF) {
      goto LABEL_22;
    }
LABEL_18:
    if (v21) {
      size_t v31 = v17 + ((v10 + 16) & ~v10);
    }
    else {
      size_t v31 = v22 + 1;
    }
    memcpy(v19, v20, v31);
    uint64_t v32 = ~v10;
    goto LABEL_24;
  }
  int v23 = (void *)(v18 & ~v11);
  int v24 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))((v10 + (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10, v21, v7);
  uint64_t v19 = v23;
  int v25 = v56;
  size_t v26 = v57;
  uint64_t v27 = ~(v10 | 7);
  if (v24) {
    goto LABEL_18;
  }
LABEL_22:
  *uint64_t v19 = *(void *)v20;
  int v33 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  int v34 = (void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v33 = *v34;
  uint64_t v32 = ~v10;
  uint64_t v35 = ((unint64_t)v33 + v10 + 8) & v59;
  uint64_t v36 = ((unint64_t)v34 + v10 + 8) & v59;
  int v37 = v19;
  v54(v35, v36, v55);
  if (!v21) {
    *((unsigned char *)v37 + v22) = 0;
  }
LABEL_24:
  if (v21) {
    uint64_t v38 = v22;
  }
  else {
    uint64_t v38 = v22 + 1;
  }
  uint64_t v39 = v38 + (((v61 & v32) + v11 + v17) & v27);
  uint64_t v40 = sub_237AEE520();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v41;
  uint64_t v43 = *(unsigned __int8 *)(v41 + 80);
  uint64_t v44 = (uint64_t)v26 + v39 + v43;
  uint64_t v60 = ~v43;
  uint64_t v45 = (uint64_t)v25 + v39 + v43;
  uint64_t v46 = (const void *)(v45 & ~v43);
  uint64_t v62 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v41 + 48);
  if (v62(v46, 1, v40))
  {
    int v47 = *(_DWORD *)(v42 + 84);
    size_t v48 = *(void *)(v42 + 64);
    if (v47) {
      size_t v49 = *(void *)(v42 + 64);
    }
    else {
      size_t v49 = v48 + 1;
    }
    memcpy((void *)(v44 & ~v43), v46, v49);
  }
  else
  {
    (*(void (**)(uint64_t, const void *, uint64_t))(v42 + 32))(v44 & ~v43, v46, v40);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v44 & ~v43, 0, 1, v40);
    int v47 = *(_DWORD *)(v42 + 84);
    size_t v48 = *(void *)(v42 + 64);
  }
  if (v47) {
    size_t v50 = v48;
  }
  else {
    size_t v50 = v48 + 1;
  }
  uint64_t v51 = (void *)(((v44 | v43) + v50) & v60);
  unint64_t v52 = (const void *)(((v45 | v43) + v50) & v60);
  if (v62(v52, 1, v40))
  {
    memcpy(v51, v52, v50);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v42 + 32))(v51, v52, v40);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v42 + 56))(v51, 0, 1, v40);
  }
  return v58;
}

uint64_t sub_237AED084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v10 | 7;
  uint64_t v12 = (v10 | 7) + v6;
  uint64_t v13 = (_DWORD *)((v12 + a1) & ~(v10 | 7));
  int v14 = (_DWORD *)((v12 + a2) & ~(v10 | 7));
  *uint64_t v13 = *v14;
  uint64_t v74 = a1;
  uint64_t v75 = v13;
  uint64_t v15 = ~v10;
  uint64_t v16 = ((unint64_t)v13 + v10 + 4) & ~v10;
  uint64_t v73 = v14;
  uint64_t v17 = ((unint64_t)v14 + v10 + 4) & ~v10;
  unint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  v70(v16, v17, v7);
  uint64_t v18 = *(void *)(v8 + 64);
  uint64_t v19 = (unsigned __int16 *)((v18 + v11 + v16) & ~v11);
  uint64_t v72 = ~v10;
  uint64_t v20 = (unsigned __int16 *)((v18 + v11 + v17) & ~v11);
  uint64_t v21 = *(unsigned int *)(v9 + 84);
  size_t v22 = v18 + ((v10 + 16) & ~v10);
  if (!v21)
  {
    char v31 = 8 * v22;
    if (*((unsigned char *)v19 + v22))
    {
      int v32 = (*((unsigned __int8 *)v19 + v22) - 1) << v31;
      if (v22 > 3) {
        int v32 = 0;
      }
      if (v22)
      {
        int v33 = v22 <= 3 ? v18 + ((v10 + 16) & ~v10) : 4;
        switch(v33)
        {
          case 2:
            int v34 = *v19;
            break;
          case 3:
            int v34 = *v19 | (*((unsigned __int8 *)v19 + 2) << 16);
            break;
          case 4:
            int v34 = *(_DWORD *)v19;
            break;
          default:
            int v34 = *(unsigned __int8 *)v19;
            break;
        }
      }
      else
      {
        int v34 = 0;
      }
      if ((v34 | v32) != 0xFFFFFFFF)
      {
        if (*((unsigned char *)v20 + v22))
        {
          int v35 = (*((unsigned __int8 *)v20 + v22) - 1) << v31;
          if (v22 > 3) {
            int v35 = 0;
          }
          if (v22)
          {
            int v36 = v22 <= 3 ? v18 + ((v10 + 16) & ~v10) : 4;
            switch(v36)
            {
              case 2:
                int v37 = *v20;
                break;
              case 3:
                int v37 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
                break;
              case 4:
                int v37 = *(_DWORD *)v20;
                break;
              default:
                int v37 = *(unsigned __int8 *)v20;
                break;
            }
          }
          else
          {
            int v37 = 0;
          }
          if ((v37 | v35) != 0xFFFFFFFF) {
            goto LABEL_4;
          }
        }
        goto LABEL_83;
      }
    }
    if (!*((unsigned char *)v20 + v22)) {
      goto LABEL_51;
    }
    int v38 = (*((unsigned __int8 *)v20 + v22) - 1) << v31;
    if (v22 > 3) {
      int v38 = 0;
    }
    uint64_t v71 = v18;
    if (v22)
    {
      if (v22 <= 3) {
        int v39 = v18 + ((v10 + 16) & ~v10);
      }
      else {
        int v39 = 4;
      }
      switch(v39)
      {
        case 2:
          int v40 = *v20;
          break;
        case 3:
          int v40 = *v20 | (*((unsigned __int8 *)v20 + 2) << 16);
          break;
        case 4:
          int v40 = *(_DWORD *)v20;
          break;
        default:
          int v40 = *(unsigned __int8 *)v20;
          break;
      }
    }
    else
    {
      int v40 = 0;
    }
    int v25 = (v40 | v38) + 1;
LABEL_46:
    uint64_t v18 = v71;
    if (v25)
    {
      uint64_t v30 = ~v10;
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))((v10 + (((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & v72, v7);
      if (v21) {
        size_t v41 = v22;
      }
      else {
        size_t v41 = v22 + 1;
      }
      memcpy(v19, v20, v41);
      goto LABEL_52;
    }
LABEL_51:
    uint64_t v43 = *(void *)v20;
    unint64_t v42 = (unint64_t)v20 + 15;
    *(void *)uint64_t v19 = v43;
    unint64_t v44 = (unint64_t)v19 + 15;
    *(void *)(v44 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v42 & 0xFFFFFFFFFFFFFFF8);
    uint64_t v30 = ~v10;
    v70((v10 + 8 + (v44 & 0xFFFFFFFFFFFFFFF8)) & v72, (v10 + 8 + (v42 & 0xFFFFFFFFFFFFFFF8)) & v72, v7);
LABEL_52:
    uint64_t v27 = ~(v10 | 7);
    int v28 = v73;
    uint64_t v29 = v10 + 4;
LABEL_53:
    uint64_t v45 = v10 | 7;
    goto LABEL_54;
  }
  uint64_t v71 = v18;
  int v23 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48);
  int v24 = v23((v10 + 8 + (((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8)) & v15, v21, v7);
  int v25 = v23((v10 + 8 + (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8)) & v15, v21, v7);
  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v18 = v71;
  if (v25)
  {
LABEL_4:
    if (v21) {
      size_t v26 = v22;
    }
    else {
      size_t v26 = v22 + 1;
    }
    memcpy(v19, v20, v26);
    uint64_t v27 = ~(v10 | 7);
    int v28 = v73;
    uint64_t v30 = ~v10;
    uint64_t v29 = v10 + 4;
    goto LABEL_53;
  }
LABEL_83:
  uint64_t v68 = *(void *)v20;
  unint64_t v67 = (unint64_t)v20 + 15;
  *(void *)uint64_t v19 = v68;
  uint64_t v69 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v69 = *(void *)(v67 & 0xFFFFFFFFFFFFFFF8);
  uint64_t v30 = ~v10;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))(((unint64_t)v69 + v10 + 8) & v72, (v10 + 8 + (v67 & 0xFFFFFFFFFFFFFFF8)) & v72, v7);
  uint64_t v27 = ~(v10 | 7);
  int v28 = v73;
  uint64_t v29 = v10 + 4;
  uint64_t v45 = v10 | 7;
  if (!v21) {
    *((unsigned char *)v19 + v22) = 0;
  }
LABEL_54:
  uint64_t v46 = ((v29 & v30) + v45 + v18) & v27;
  if (v21) {
    size_t v47 = v22;
  }
  else {
    size_t v47 = v22 + 1;
  }
  size_t v48 = v47 + v46;
  uint64_t v49 = sub_237AEE520();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(unsigned __int8 *)(v50 + 80);
  unint64_t v52 = (unint64_t)v75 + v48 + v51;
  uint64_t v76 = ~v51;
  uint64_t v53 = (uint64_t)v28 + v48 + v51;
  size_t v54 = (const void *)(v53 & ~v51);
  uint64_t v55 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v50 + 48);
  int v56 = v55(v52 & ~v51, 1, v49);
  int v57 = v55((unint64_t)v54, 1, v49);
  if (v56)
  {
    if (!v57)
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v50 + 32))(v52 & ~v51, v54, v49);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v50 + 56))(v52 & ~v51, 0, 1, v49);
      goto LABEL_68;
    }
    int v58 = *(_DWORD *)(v50 + 84);
    size_t v59 = *(void *)(v50 + 64);
  }
  else
  {
    if (!v57)
    {
      (*(void (**)(unint64_t, const void *, uint64_t))(v50 + 40))(v52 & ~v51, v54, v49);
      goto LABEL_68;
    }
    (*(void (**)(unint64_t, uint64_t))(v50 + 8))(v52 & ~v51, v49);
    int v58 = *(_DWORD *)(v50 + 84);
    size_t v59 = *(void *)(v50 + 64);
  }
  if (v58) {
    size_t v60 = v59;
  }
  else {
    size_t v60 = v59 + 1;
  }
  memcpy((void *)(v52 & ~v51), v54, v60);
LABEL_68:
  if (*(_DWORD *)(v50 + 84)) {
    size_t v61 = *(void *)(v50 + 64);
  }
  else {
    size_t v61 = *(void *)(v50 + 64) + 1;
  }
  uint64_t v62 = (void *)(((v52 | v51) + v61) & v76);
  uint64_t v63 = (const void *)(((v53 | v51) + v61) & v76);
  int v64 = v55((unint64_t)v62, 1, v49);
  int v65 = v55((unint64_t)v63, 1, v49);
  if (!v64)
  {
    if (!v65)
    {
      (*(void (**)(void *, const void *, uint64_t))(v50 + 40))(v62, v63, v49);
      return v74;
    }
    (*(void (**)(void *, uint64_t))(v50 + 8))(v62, v49);
    goto LABEL_76;
  }
  if (v65)
  {
LABEL_76:
    memcpy(v62, v63, v61);
    return v74;
  }
  (*(void (**)(void *, const void *, uint64_t))(v50 + 32))(v62, v63, v49);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v50 + 56))(v62, 0, 1, v49);
  return v74;
}

uint64_t sub_237AED7DC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v38 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v38 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(void *)(sub_237AEE520() - 8);
  uint64_t v12 = v11;
  int v13 = *(_DWORD *)(v11 + 84);
  unsigned int v14 = v13 - 1;
  if (!v13) {
    unsigned int v14 = 0;
  }
  if (v14 <= v10) {
    unsigned int v14 = v10;
  }
  uint64_t v15 = *(void *)(v8 + 64);
  if (v9) {
    uint64_t v16 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v16 = v15 + 1;
  }
  uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = *(void *)(v11 + 64);
  if (v13) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v19 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v21 = v17 | 7;
  uint64_t v22 = (v17 | 7) + *(void *)(v6 + 64);
  uint64_t v23 = v16 + ((v17 + 16) & ~v17) + (((v17 | 7) + v15 + ((v17 + 4) & ~v17)) & ~(v17 | 7));
  if (a2 <= v14) {
    goto LABEL_34;
  }
  uint64_t v24 = ((v20 + v18 + ((v23 + v18 + (v22 & ~v21)) & ~v18)) & ~v18) + v20;
  char v25 = 8 * v24;
  if (v24 > 3) {
    goto LABEL_17;
  }
  unsigned int v27 = ((a2 - v14 + ~(-1 << v25)) >> v25) + 1;
  if (HIWORD(v27))
  {
    int v26 = *(_DWORD *)((char *)a1 + v24);
    if (!v26) {
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  if (v27 > 0xFF)
  {
    int v26 = *(unsigned __int16 *)((char *)a1 + v24);
    if (!*(unsigned __int16 *)((char *)a1 + v24)) {
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  if (v27 >= 2)
  {
LABEL_17:
    int v26 = *((unsigned __int8 *)a1 + v24);
    if (!*((unsigned char *)a1 + v24)) {
      goto LABEL_34;
    }
LABEL_24:
    int v28 = (v26 - 1) << v25;
    if (v24 > 3) {
      int v28 = 0;
    }
    if (v24)
    {
      if (v24 <= 3) {
        int v29 = v24;
      }
      else {
        int v29 = 4;
      }
      switch(v29)
      {
        case 2:
          int v30 = *a1;
          break;
        case 3:
          int v30 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v30 = *(_DWORD *)a1;
          break;
        default:
          int v30 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v30 = 0;
    }
    return v14 + (v30 | v28) + 1;
  }
LABEL_34:
  if (!v14) {
    return 0;
  }
  if (v7 == v14)
  {
    char v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    uint64_t v32 = (uint64_t)a1;
    uint64_t v33 = v7;
    uint64_t v34 = v5;
    return v31(v32, v33, v34);
  }
  unint64_t v36 = ((unint64_t)a1 + v22) & ~v21;
  if (v9 == v14)
  {
    uint64_t v32 = (v17 + 4 + v36) & ~v17;
    char v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v33 = v9;
    uint64_t v34 = v38;
    return v31(v32, v33, v34);
  }
  unsigned int v37 = (*(uint64_t (**)(unint64_t))(v12 + 48))((v36 + v18 + v23) & ~v18);
  if (v37 >= 2) {
    return v37 - 1;
  }
  else {
    return 0;
  }
}

void sub_237AEDB84(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v45 = *(void *)(a4 + 24);
  uint64_t v6 = *(void *)(v45 - 8);
  uint64_t v44 = v6;
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v43 = sub_237AEE6F0();
  uint64_t v8 = *(void *)(v43 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  int v11 = 0;
  uint64_t v12 = *(void *)(sub_237AEE520() - 8);
  uint64_t v13 = v12;
  int v14 = *(_DWORD *)(v12 + 84);
  unsigned int v15 = v14 - 1;
  if (!v14) {
    unsigned int v15 = 0;
  }
  if (v15 <= v10) {
    unsigned int v16 = v10;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = *(void *)(v8 + 64);
  if (v9) {
    uint64_t v18 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v18 = v17 + 1;
  }
  uint64_t v19 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = (v19 | 7) + *(void *)(v6 + 64);
  uint64_t v21 = v18 + ((v19 + 16) & ~v19) + (((v19 | 7) + v17 + ((v19 + 4) & ~v19)) & ~(v19 | 7));
  uint64_t v22 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v23 = (v21 + v22 + (v20 & ~(v19 | 7))) & ~v22;
  size_t v24 = *(void *)(v12 + 64);
  if (v14) {
    size_t v25 = v24;
  }
  else {
    size_t v25 = v24 + 1;
  }
  size_t v26 = ((v25 + v22 + v23) & ~v22) + v25;
  if (a3 <= v16) {
    goto LABEL_23;
  }
  if (v26 <= 3)
  {
    unsigned int v27 = ((a3 - v16 + ~(-1 << (8 * v26))) >> (8 * v26)) + 1;
    if (HIWORD(v27))
    {
      int v11 = 4;
      if (v16 >= a2) {
        goto LABEL_31;
      }
LABEL_24:
      unsigned int v28 = ~v16 + a2;
      if (v26 < 4)
      {
        int v29 = (v28 >> (8 * v26)) + 1;
        if (v26)
        {
          int v30 = v28 & ~(-1 << (8 * v26));
          bzero(a1, ((v25 + v22 + v23) & ~v22) + v25);
          if (v26 == 3)
          {
            *(_WORD *)a1 = v30;
            a1[2] = BYTE2(v30);
          }
          else if (v26 == 2)
          {
            *(_WORD *)a1 = v30;
          }
          else
          {
            *a1 = v30;
          }
        }
      }
      else
      {
        bzero(a1, ((v25 + v22 + v23) & ~v22) + v25);
        *(_DWORD *)a1 = v28;
        int v29 = 1;
      }
      switch(v11)
      {
        case 1:
          a1[v26] = v29;
          break;
        case 2:
          *(_WORD *)&a1[v26] = v29;
          break;
        case 3:
LABEL_69:
          __break(1u);
          JUMPOUT(0x237AEE054);
        case 4:
          *(_DWORD *)&a1[v26] = v29;
          break;
        default:
          return;
      }
      return;
    }
    if (v27 >= 0x100) {
      int v11 = 2;
    }
    else {
      int v11 = v27 > 1;
    }
LABEL_23:
    if (v16 >= a2) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  int v11 = 1;
  if (v16 < a2) {
    goto LABEL_24;
  }
LABEL_31:
  uint64_t v31 = (uint64_t)a1;
  switch(v11)
  {
    case 1:
      a1[v26] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 2:
      *(_WORD *)&a1[v26] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 3:
      goto LABEL_69;
    case 4:
      *(_DWORD *)&a1[v26] = 0;
      goto LABEL_35;
    default:
LABEL_35:
      if (!a2) {
        return;
      }
LABEL_36:
      if (v7 == v16)
      {
        uint64_t v32 = v45;
        uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56);
        uint64_t v34 = a2;
        uint64_t v35 = v7;
LABEL_39:
        v33(v31, v34, v35, v32);
        return;
      }
      uint64_t v36 = (unint64_t)&a1[v20] & ~(v19 | 7);
      if (v9 == v16)
      {
        uint64_t v31 = (v19 + 4 + v36) & ~v19;
        uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
        uint64_t v34 = a2;
        uint64_t v35 = v9;
        uint64_t v32 = v43;
        goto LABEL_39;
      }
      uint64_t v37 = v36 + v22 + v21;
      uint64_t v38 = (unsigned char *)(v37 & ~v22);
      if (v15 >= a2)
      {
        unint64_t v42 = *(void (**)(uint64_t, void))(v13 + 56);
        v42(v37 & ~v22, (a2 + 1));
      }
      else
      {
        if (v25 <= 3) {
          int v39 = ~(-1 << (8 * v25));
        }
        else {
          int v39 = -1;
        }
        if (v25)
        {
          int v40 = v39 & (~v15 + a2);
          if (v25 <= 3) {
            int v41 = v25;
          }
          else {
            int v41 = 4;
          }
          bzero(v38, v25);
          switch(v41)
          {
            case 2:
              *(_WORD *)uint64_t v38 = v40;
              break;
            case 3:
              *(_WORD *)uint64_t v38 = v40;
              v38[2] = BYTE2(v40);
              break;
            case 4:
              *(_DWORD *)uint64_t v38 = v40;
              break;
            default:
              *uint64_t v38 = v40;
              break;
          }
        }
      }
      break;
  }
}

uint64_t sub_237AEE08C()
{
  return swift_getWitnessTable();
}

uint64_t sub_237AEE0A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_237AEE0C4()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for SyncedDictionary.Element.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t sub_237AEE0F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_237AEE124(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237AEE18C@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_237AE4BC4(a1, *(_DWORD **)(v2 + 16), a2);
}

uint64_t sub_237AEE1AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237AEE1F4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237AEE254@<X0>(BOOL *a1@<X8>)
{
  return sub_237A83934(*(void *)(v1 + 24), a1);
}

unsigned char *sub_237AEE270(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237AEE33CLL);
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

uint64_t sub_237AEE364()
{
  return swift_getWitnessTable();
}

uint64_t sub_237AEE380()
{
  return swift_getWitnessTable();
}

uint64_t sub_237AEE39C()
{
  return swift_getWitnessTable();
}

uint64_t sub_237AEE3B8@<X0>(_DWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_237AEE18C(a1, a2);
}

uint64_t sub_237AEE3D0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_237AEE3E0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_237AEE3F0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_237AEE400()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_237AEE410()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_237AEE420()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_237AEE430()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_237AEE440()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_237AEE450()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_237AEE460()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_237AEE470()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_237AEE480()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_237AEE490()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_237AEE4A0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_237AEE4B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_237AEE4C0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_237AEE4D0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_237AEE4E0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_237AEE4F0()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_237AEE500()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_237AEE510()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_237AEE520()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_237AEE530()
{
  return MEMORY[0x270F189B8]();
}

uint64_t sub_237AEE540()
{
  return MEMORY[0x270F189C0]();
}

uint64_t sub_237AEE550()
{
  return MEMORY[0x270F189C8]();
}

uint64_t sub_237AEE560()
{
  return MEMORY[0x270F189D0]();
}

uint64_t sub_237AEE570()
{
  return MEMORY[0x270F189D8]();
}

uint64_t sub_237AEE580()
{
  return MEMORY[0x270F189E0]();
}

uint64_t sub_237AEE590()
{
  return MEMORY[0x270EF2ED0]();
}

uint64_t sub_237AEE5A0()
{
  return MEMORY[0x270EF2ED8]();
}

uint64_t sub_237AEE5B0()
{
  return MEMORY[0x270EF2EE0]();
}

uint64_t sub_237AEE5C0()
{
  return MEMORY[0x270EF2EF0]();
}

uint64_t sub_237AEE5D0()
{
  return MEMORY[0x270EF2EF8]();
}

uint64_t sub_237AEE5E0()
{
  return MEMORY[0x270EF2F18]();
}

uint64_t sub_237AEE5F0()
{
  return MEMORY[0x270EF2F50]();
}

uint64_t sub_237AEE600()
{
  return MEMORY[0x270EF2F60]();
}

uint64_t sub_237AEE610()
{
  return MEMORY[0x270EF2F68]();
}

uint64_t sub_237AEE620()
{
  return MEMORY[0x270EF2F70]();
}

uint64_t sub_237AEE630()
{
  return MEMORY[0x270EF2F78]();
}

uint64_t sub_237AEE640()
{
  return MEMORY[0x270EF2F80]();
}

uint64_t sub_237AEE650()
{
  return MEMORY[0x270EF2F90]();
}

uint64_t sub_237AEE660()
{
  return MEMORY[0x270EF2F98]();
}

uint64_t sub_237AEE670()
{
  return MEMORY[0x270EF2FA8]();
}

uint64_t sub_237AEE680()
{
  return MEMORY[0x270EF2FB0]();
}

uint64_t sub_237AEE690()
{
  return MEMORY[0x270EF3008]();
}

uint64_t sub_237AEE6A0()
{
  return MEMORY[0x270EF3018]();
}

uint64_t sub_237AEE6B0()
{
  return MEMORY[0x270EF3038]();
}

uint64_t sub_237AEE6C0()
{
  return MEMORY[0x270EF3040]();
}

uint64_t sub_237AEE6D0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_237AEE6E0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_237AEE6F0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_237AEE700()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_237AEE710()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_237AEE720()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_237AEE750()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_237AEE760()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_237AEE770()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_237AEE780()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_237AEE790()
{
  return MEMORY[0x270F44B58]();
}

uint64_t sub_237AEE7A0()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_237AEE7B0()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t sub_237AEE7C0()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_237AEE7D0()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_237AEE7E0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_237AEE7F0()
{
  return MEMORY[0x270F44C30]();
}

uint64_t sub_237AEE800()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_237AEE810()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_237AEE820()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_237AEE830()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_237AEE850()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_237AEE860()
{
  return MEMORY[0x270F44CE8]();
}

uint64_t sub_237AEE870()
{
  return MEMORY[0x270F44D48]();
}

uint64_t sub_237AEE880()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_237AEE890()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_237AEE8A0()
{
  return MEMORY[0x270F44D70]();
}

uint64_t sub_237AEE8B0()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_237AEE8C0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_237AEE8D0()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_237AEE8E0()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_237AEE8F0()
{
  return MEMORY[0x270F44DF8]();
}

uint64_t sub_237AEE900()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_237AEE910()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_237AEE920()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_237AEE930()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_237AEE940()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_237AEE950()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_237AEE960()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_237AEE970()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_237AEE980()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_237AEE990()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_237AEE9A0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_237AEE9B0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_237AEE9C0()
{
  return MEMORY[0x270EE3C58]();
}

uint64_t sub_237AEE9D0()
{
  return MEMORY[0x270EE3C60]();
}

uint64_t sub_237AEE9E0()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_237AEE9F0()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_237AEEA00()
{
  return MEMORY[0x270EE3CA0]();
}

uint64_t sub_237AEEA10()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_237AEEA20()
{
  return MEMORY[0x270EE3DE8]();
}

uint64_t sub_237AEEA30()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_237AEEA40()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_237AEEA50()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_237AEEA60()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_237AEEA70()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_237AEEA80()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_237AEEA90()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_237AEEAA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_237AEEAB0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_237AEEAC0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_237AEEAD0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_237AEEAE0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_237AEEAF0()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_237AEEB00()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_237AEEB10()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_237AEEB20()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_237AEEB30()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_237AEEB40()
{
  return MEMORY[0x270F9D140]();
}

uint64_t sub_237AEEB50()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_237AEEB60()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_237AEEB70()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_237AEEB80()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_237AEEB90()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_237AEEBA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_237AEEBB0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_237AEEBC0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_237AEEBD0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237AEEBE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_237AEEBF0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_237AEEC00()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_237AEEC40()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_237AEEC50()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_237AEEC60()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_237AEEC70()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_237AEEC80()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_237AEEC90()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_237AEECA0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_237AEECB0()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_237AEECC0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_237AEECD0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_237AEECE0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_237AEECF0()
{
  return MEMORY[0x270F9DEC0]();
}

uint64_t sub_237AEED00()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_237AEED10()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_237AEED20()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_237AEED30()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_237AEED40()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_237AEED50()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_237AEED60()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_237AEED70()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_237AEED80()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_237AEED90()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_237AEEDA0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_237AEEDB0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_237AEEDC0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_237AEEDD0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_237AEEDE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_237AEEDF0()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_237AEEE00()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_237AEEE10()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_237AEEE20()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_237AEEE30()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_237AEEE40()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_237AEEE50()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_237AEEE60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_237AEEE70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_237AEEE80()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_237AEEE90()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_237AEEEA0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_237AEEEB0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_237AEEEC0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_237AEEED0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_237AEEEE0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_237AEEEF0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_237AEEF00()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_237AEEF10()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_237AEEF20()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_237AEEF30()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_237AEEF40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_237AEEF50()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_237AEEF60()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_237AEEF70()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_237AEEF80()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_237AEEF90()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_237AEEFA0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_237AEEFB0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_237AEEFC0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_237AEEFD0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_237AEEFE0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_237AEEFF0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_237AEF000()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_237AEF010()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_237AEF020()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_237AEF030()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_237AEF040()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_237AEF050()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_237AEF060()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_237AEF070()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_237AEF080()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_237AEF090()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_237AEF0A0()
{
  return MEMORY[0x270F9F388]();
}

uint64_t sub_237AEF0B0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_237AEF0C0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_237AEF0D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_237AEF0E0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_237AEF0F0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_237AEF100()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_237AEF120()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_237AEF130()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_237AEF140()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_237AEF150()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_237AEF160()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_237AEF170()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_237AEF180()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_237AEF1A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_237AEF1B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_237AEF1C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_237AEF1D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_237AEF1E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_237AEF1F0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_237AEF200()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_237AEF210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237AEF220()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_237AEF230()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_237AEF240()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_237AEF250()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_237AEF260()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_237AEF270()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_237AEF280()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_237AEF290()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_237AEF2A0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_237AEF2B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_237AEF2E0()
{
  return MEMORY[0x270FA0128]();
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E90](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
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

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x270FA0638]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x270FA0640]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x270FA0660]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x270FA0668]();
}