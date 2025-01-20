uint64_t sub_1000A9774(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000A97D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppearanceEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A9838(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

char *sub_1000A98A0(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000E8C50();
    v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v32(a1, a2, v7);
    v8 = (int *)type metadata accessor for AppearanceEvent(0);
    a1[v8[5]] = a2[v8[5]];
    a1[v8[6]] = a2[v8[6]];
    a1[v8[7]] = a2[v8[7]];
    uint64_t v9 = a3[6];
    *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
    v10 = &a1[v9];
    v11 = &a2[v9];
    uint64_t v12 = type metadata accessor for EngagementEvent(0);
    uint64_t v13 = *(void *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v15 = v12;
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v15))
    {
      uint64_t v16 = sub_10001B38C(&qword_1001379B8);
      memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
      v17 = v32;
    }
    else
    {
      v32(v10, v11, v7);
      uint64_t v30 = v15;
      v31 = v10;
      uint64_t v19 = *(int *)(v15 + 20);
      __dst = &v10[v19];
      v20 = &v11[v19];
      uint64_t v21 = sub_1000E8B60();
      uint64_t v22 = *(void *)(v21 - 8);
      v17 = v32;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        uint64_t v23 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, v20, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v31, 0, 1, v30);
    }
    uint64_t v24 = a3[7];
    v25 = &a1[v24];
    v26 = &a2[v24];
    v17(&a1[v24], v26, v7);
    uint64_t v27 = type metadata accessor for DisappearanceEvent(0);
    v25[*(int *)(v27 + 20)] = v26[*(int *)(v27 + 20)];
  }
  return a1;
}

uint64_t sub_1000A9BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E8C50();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v12(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for EngagementEvent(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    v12(v5, v4);
    uint64_t v7 = v5 + *(int *)(v6 + 20);
    uint64_t v8 = sub_1000E8B60();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  uint64_t v10 = a1 + *(int *)(a2 + 28);

  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v10, v4);
}

uint64_t sub_1000A9D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v29 = *v7;
  (*v7)(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AppearanceEvent(0);
  *(unsigned char *)(a1 + v8[5]) = *(unsigned char *)(a2 + v8[5]);
  *(unsigned char *)(a1 + v8[6]) = *(unsigned char *)(a2 + v8[6]);
  *(unsigned char *)(a1 + v8[7]) = *(unsigned char *)(a2 + v8[7]);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v30 = a3;
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  __dst = (char *)(a1 + v9);
  uint64_t v10 = (char *)(a2 + v9);
  uint64_t v11 = type metadata accessor for EngagementEvent(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = sub_10001B38C(&qword_1001379B8);
    memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    uint64_t v15 = v29;
    uint64_t v16 = v6;
  }
  else
  {
    uint64_t v15 = v29;
    v29((uint64_t)__dst, (uint64_t)v10, v6);
    uint64_t v17 = *(int *)(v11 + 20);
    uint64_t v18 = &__dst[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = sub_1000E8B60();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    uint64_t v16 = v6;
  }
  uint64_t v23 = *(int *)(v30 + 28);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  v15(a1 + v23, v25, v16);
  uint64_t v26 = type metadata accessor for DisappearanceEvent(0);
  *(unsigned char *)(v24 + *(int *)(v26 + 20)) = *(unsigned char *)(v25 + *(int *)(v26 + 20));
  return a1;
}

uint64_t sub_1000AA030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  v42 = *(void (**)(uint64_t, uint64_t))(v7 + 24);
  v42(a1, a2);
  uint64_t v8 = (int *)type metadata accessor for AppearanceEvent(0);
  *(unsigned char *)(a1 + v8[5]) = *(unsigned char *)(a2 + v8[5]);
  *(unsigned char *)(a1 + v8[6]) = *(unsigned char *)(a2 + v8[6]);
  *(unsigned char *)(a1 + v8[7]) = *(unsigned char *)(a2 + v8[7]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = a3;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for EngagementEvent(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1000A9774((uint64_t)v10, type metadata accessor for EngagementEvent);
      goto LABEL_7;
    }
    uint64_t v17 = v41;
    ((void (*)(char *, char *, uint64_t))v42)(v10, v11, v41);
    uint64_t v26 = *(int *)(v12 + 20);
    uint64_t v27 = &v10[v26];
    v28 = &v11[v26];
    uint64_t v29 = sub_1000E8B60();
    uint64_t v30 = *(void *)(v29 - 8);
    v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    int v32 = v31(v27, 1, v29);
    int v33 = v31(v28, 1, v29);
    if (v32)
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_16:
        uint64_t v25 = v40;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    }
    uint64_t v34 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_16;
  }
  if (!v16)
  {
    uint64_t v17 = v41;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v41);
    uint64_t v18 = *(int *)(v12 + 20);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = sub_1000E8B60();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v24 = sub_10001B38C(&qword_1001379B8);
  memcpy(v10, v11, *(void *)(*(void *)(v24 - 8) + 64));
  uint64_t v25 = v40;
  uint64_t v17 = v41;
LABEL_17:
  uint64_t v35 = *(int *)(v25 + 28);
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  ((void (*)(uint64_t, uint64_t, uint64_t))v42)(a1 + v35, v37, v17);
  uint64_t v38 = type metadata accessor for DisappearanceEvent(0);
  *(unsigned char *)(v36 + *(int *)(v38 + 20)) = *(unsigned char *)(v37 + *(int *)(v38 + 20));
  return a1;
}

uint64_t sub_1000AA4CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AppearanceEvent(0);
  *(unsigned char *)(a1 + v8[5]) = *(unsigned char *)(a2 + v8[5]);
  *(unsigned char *)(a1 + v8[6]) = *(unsigned char *)(a2 + v8[6]);
  *(unsigned char *)(a1 + v8[7]) = *(unsigned char *)(a2 + v8[7]);
  uint64_t v9 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for EngagementEvent(0);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_10001B38C(&qword_1001379B8);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v26 = v7;
    v7((uint64_t)v10, (uint64_t)v11, v6);
    uint64_t v15 = *(int *)(v12 + 20);
    uint64_t v25 = &v10[v15];
    int v16 = &v11[v15];
    uint64_t v17 = sub_1000E8B60();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v25, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v25, 0, 1, v17);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    uint64_t v7 = v26;
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  v7(a1 + v20, v22, v6);
  uint64_t v23 = type metadata accessor for DisappearanceEvent(0);
  *(unsigned char *)(v21 + *(int *)(v23 + 20)) = *(unsigned char *)(v22 + *(int *)(v23 + 20));
  return a1;
}

uint64_t sub_1000AA788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  v42 = *(void (**)(uint64_t, uint64_t))(v7 + 40);
  v42(a1, a2);
  uint64_t v8 = (int *)type metadata accessor for AppearanceEvent(0);
  *(unsigned char *)(a1 + v8[5]) = *(unsigned char *)(a2 + v8[5]);
  *(unsigned char *)(a1 + v8[6]) = *(unsigned char *)(a2 + v8[6]);
  *(unsigned char *)(a1 + v8[7]) = *(unsigned char *)(a2 + v8[7]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  uint64_t v40 = a3;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for EngagementEvent(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1000A9774((uint64_t)v10, type metadata accessor for EngagementEvent);
      goto LABEL_7;
    }
    uint64_t v17 = v41;
    ((void (*)(char *, char *, uint64_t))v42)(v10, v11, v41);
    uint64_t v26 = *(int *)(v12 + 20);
    uint64_t v27 = &v10[v26];
    v28 = &v11[v26];
    uint64_t v29 = sub_1000E8B60();
    uint64_t v30 = *(void *)(v29 - 8);
    v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
    int v32 = v31(v27, 1, v29);
    int v33 = v31(v28, 1, v29);
    if (v32)
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_16:
        uint64_t v25 = v40;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 40))(v27, v28, v29);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    }
    uint64_t v34 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v27, v28, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_16;
  }
  if (!v16)
  {
    uint64_t v17 = v41;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v41);
    uint64_t v18 = *(int *)(v12 + 20);
    uint64_t v19 = &v10[v18];
    uint64_t v20 = &v11[v18];
    uint64_t v21 = sub_1000E8B60();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v24 = sub_10001B38C(&qword_1001379B8);
  memcpy(v10, v11, *(void *)(*(void *)(v24 - 8) + 64));
  uint64_t v25 = v40;
  uint64_t v17 = v41;
LABEL_17:
  uint64_t v35 = *(int *)(v25 + 28);
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  ((void (*)(uint64_t, uint64_t, uint64_t))v42)(a1 + v35, v37, v17);
  uint64_t v38 = type metadata accessor for DisappearanceEvent(0);
  *(unsigned char *)(v36 + *(int *)(v38 + 20)) = *(unsigned char *)(v37 + *(int *)(v38 + 20));
  return a1;
}

uint64_t sub_1000AAC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AAC30);
}

uint64_t sub_1000AAC30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppearanceEvent(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = sub_10001B38C(&qword_1001379B8);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = type metadata accessor for DisappearanceEvent(0);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1000AADB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AADC8);
}

uint64_t sub_1000AADC8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for AppearanceEvent(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_10001B38C(&qword_1001379B8);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = type metadata accessor for DisappearanceEvent(0);
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[7];

  return v16(v18, a2, a2, v17);
}

void sub_1000AAF4C()
{
  type metadata accessor for AppearanceEvent(319);
  if (v0 <= 0x3F)
  {
    sub_1000AB05C();
    if (v1 <= 0x3F)
    {
      type metadata accessor for DisappearanceEvent(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1000AB05C()
{
  if (!qword_10013A108)
  {
    type metadata accessor for EngagementEvent(255);
    unint64_t v0 = sub_1000EA730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10013A108);
    }
  }
}

void sub_1000AB0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10001B38C(&qword_100137370);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000F1610;
  type metadata accessor for EntryRequest();
  sub_1000EA910();
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_1000263E0();
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = 0xE000000000000000;
  sub_100022374(0, (unint64_t *)&qword_100138300);
  uint64_t v9 = (void *)sub_1000EA720();
  sub_1000EA620();
  sub_1000E9220();
  swift_bridgeObjectRelease();

  type metadata accessor for TodayContent();
  sub_1000E90C0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_retain();
  unint64_t v11 = (void *)sub_1000E9030();
  sub_1000E9050();
  swift_release();
  swift_release();

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  swift_retain();
  uint64_t v13 = (void *)sub_1000E9030();
  sub_1000E9060();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1000AB2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContentServiceRequest();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)&v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100020A28((void *)(a1 + 16), *(void *)(a1 + 40));
  uint64_t v9 = sub_1000ABA28();
  uint64_t v10 = type metadata accessor for EntryRequest();
  sub_1000AC4E8(a2 + *(int *)(v10 + 20), (uint64_t)v7 + *(int *)(v5 + 28), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  sub_1000AC4E8(a2 + *(int *)(v10 + 24), (uint64_t)v7 + *(int *)(v5 + 32), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  *uint64_t v7 = v9;
  uint64_t v11 = *v8;
  uint64_t v15 = v7;
  uint64_t v16 = v11;
  sub_10001B38C(&qword_10013A1E8);
  swift_allocObject();
  uint64_t v12 = sub_1000E90A0();
  sub_1000AC550((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  return v12;
}

uint64_t sub_1000AB450(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = type metadata accessor for NewsTimelineEntry();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000AC4E8(a1, (uint64_t)&v7[*(int *)(v5 + 28)], (uint64_t (*)(void))type metadata accessor for TodayContent);
  sub_1000E8C40();
  a2(v7);
  return sub_1000AC550((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
}

uint64_t sub_1000AB52C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_1000EA600();
  sub_10001B38C(&qword_100137370);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000F1610;
  sub_10001B38C(&qword_100137378);
  sub_1000EA910();
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_1000263E0();
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0xE000000000000000;
  sub_100022374(0, (unint64_t *)&qword_100138300);
  uint64_t v5 = (void *)sub_1000EA720();
  sub_1000E9220();
  swift_bridgeObjectRelease();

  return a2(a1);
}

uint64_t sub_1000AB660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ContentServiceRequest();
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (id *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for TodayContent();
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  uint64_t v14 = (uint64_t *)((char *)&v24 - v13);
  sub_100020A28((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v15 = sub_1000ABA28();
  uint64_t v16 = type metadata accessor for EntryRequest();
  sub_1000AC4E8(a1 + *(int *)(v16 + 20), (uint64_t)v8 + *(int *)(v6 + 28), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  sub_1000AC4E8(a1 + *(int *)(v16 + 24), (uint64_t)v8 + *(int *)(v6 + 32), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  id *v8 = (id)v15;
  uint64_t v17 = (void *)sub_1000E8A30();
  uint64_t v18 = sub_100070B70(v17);
  uint64_t v20 = v19;
  sub_10006FCF8(v8, v21, v12);
  sub_1000A02F8(v18, v20, v14);
  sub_1000AC550((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TodayContent);

  swift_bridgeObjectRelease();
  sub_1000AC550((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  uint64_t v22 = type metadata accessor for NewsTimelineEntry();
  sub_1000AC4E8((uint64_t)v14, a2 + *(int *)(v22 + 20), (uint64_t (*)(void))type metadata accessor for TodayContent);
  sub_1000E8C40();
  return sub_1000AC550((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for TodayContent);
}

uint64_t sub_1000AB89C()
{
  sub_100020AC0(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for EntryService()
{
  return self;
}

uint64_t sub_1000AB8F8()
{
  return sub_1000E90A0();
}

void sub_1000AB95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t type metadata accessor for EntryRequest()
{
  uint64_t result = qword_10013A250;
  if (!qword_10013A250) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000AB9B0()
{
  return sub_1000AB2E0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000AB9CC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000ABA04(uint64_t a1)
{
  return sub_1000AB450(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_1000ABA20(uint64_t a1)
{
  return sub_1000AB52C(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_1000ABA28()
{
  uint64_t v1 = v0;
  uint64_t v74 = type metadata accessor for EntryRequest();
  __chkstk_darwin(v74);
  uint64_t v72 = (uint64_t)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (void *)sub_1000E9F60();
  uint64_t v4 = *(v3 - 1);
  uint64_t v5 = __chkstk_darwin(v3);
  v71 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v69 - v7;
  uint64_t v9 = (void *)sub_1000E8B60();
  unint64_t v10 = *(v9 - 1);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char **)((char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v73 = (char *)[objc_allocWithZone((Class)NTPBSectionSlotCostInfo) init];
  if (!v73)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  id v16 = [objc_allocWithZone((Class)NTPBTodayResultOperationInfo) init];
  if (!v16)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v17 = v16;
  uint64_t v18 = (double *)((char *)v0 + *(int *)(v74 + 20));
  uint64_t v77 = type metadata accessor for LayoutContext();
  v70 = (double *)((char *)v18 + *(int *)(v77 + 28));
  [v17 setSlotsLimit:v70[1]];
  [v17 setRespectsWidgetSlotsLimit:1];
  [v17 setRespectsWidgetVisibleSectionsPerQueueLimit:1];
  v78 = v18;
  uint64_t v19 = sub_100081D20();
  if (v19 < 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  [v17 setSourceNameImageSizePreset:v19];
  id v76 = v17;
  [v17 setFetchWidgetConfig:1];
  id v20 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (!v20)
  {
LABEL_40:
    uint64_t result = (*(uint64_t (**)(char **, uint64_t, uint64_t, void *))(v10 + 56))(v15, 1, 1, v9);
    goto LABEL_41;
  }
  uint64_t v21 = v20;
  sub_1000E8B20();

  (*(void (**)(char **, char *, void *))(v10 + 32))(v15, v12, v9);
  (*(void (**)(char **, void, uint64_t, void *))(v10 + 56))(v15, 0, 1, v9);
  uint64_t result = (*(uint64_t (**)(char **, uint64_t, void *))(v10 + 48))(v15, 1, v9);
  if (result != 1)
  {
    sub_1000E8AE0(v23);
    uint64_t v25 = v24;
    (*(void (**)(char **, void *))(v10 + 8))(v15, v9);
    id v26 = v76;
    [v76 setAssetsDirectoryFileURL:v25];

    [v26 setThumbnailSizePreset:3];
    uint64_t v27 = v8;
    (*(void (**)(char *, char *, void *))(v4 + 16))(v8, (char *)v78 + *(int *)(v77 + 24), v3);
    int v28 = (*(uint64_t (**)(char *, void *))(v4 + 88))(v8, v3);
    uint64_t v29 = enum case for InternalWidgetFamily.systemSmall(_:);
    v75 = v1;
    if (v28 == enum case for InternalWidgetFamily.systemSmall(_:))
    {
      uint64_t v30 = 1;
      v31 = v71;
    }
    else if (v28 == enum case for InternalWidgetFamily.systemMedium(_:))
    {
      uint64_t v30 = 2;
      v31 = v71;
    }
    else if (v28 == enum case for InternalWidgetFamily.systemLarge(_:))
    {
      uint64_t v30 = 3;
      v31 = v71;
    }
    else
    {
      uint64_t v30 = 0;
      if (v28 == enum case for InternalWidgetFamily.systemExtraLarge(_:))
      {
        v31 = v71;
      }
      else
      {
        v31 = v71;
        if (v28 != enum case for InternalWidgetFamily.transparentMedium(_:))
        {
          if (v28 == enum case for InternalWidgetFamily.newsLargeTall(_:))
          {
            uint64_t v30 = 4;
          }
          else
          {
            (*(void (**)(char *, void *, void))(v4 + 8))(v27, v3, 0);
            uint64_t v30 = 0;
          }
        }
      }
    }
    [v26 setWidgetSize:v30];
    uint64_t v9 = *(void **)(v4 + 104);
    ((void (*)(char *, uint64_t, void *))v9)(v31, v29, v3);
    sub_1000AC490();
    sub_1000EA420();
    sub_1000EA420();
    uint64_t v33 = v79;
    uint64_t v32 = v80;
    uint64_t v15 = *(char ***)(v4 + 8);
    ((void (*)(char *, void *))v15)(v31, v3);
    uint64_t v34 = v72;
    sub_1000AC4E8((uint64_t)v75, v72, (uint64_t (*)(void))type metadata accessor for EntryRequest);
    if (v32 == v33)
    {
      sub_1000AC550(v34, (uint64_t (*)(void))type metadata accessor for EntryRequest);
      uint64_t v35 = v77;
    }
    else
    {
      uint64_t v35 = v77;
      ((void (*)(char *, void, void *))v9)(v31, enum case for InternalWidgetFamily.accessoryRectangular(_:), v3);
      sub_1000EA420();
      sub_1000EA420();
      uint64_t v36 = v79;
      uint64_t v37 = v80;
      ((void (*)(char *, void *))v15)(v31, v3);
      sub_1000AC550(v34, (uint64_t (*)(void))type metadata accessor for EntryRequest);
      if (v37 != v36)
      {
        v39 = v78;
        id v40 = sub_1000812DC();
        uint64_t v15 = &selRef_thumbnailRemoteURL;
        [v40 nt_scaledValueForValue:1.0];
        double v42 = v41;

        double v43 = *v39 + 6.0;
        uint64_t v12 = v73;
        [v73 setSectionTitleSlotCost:v42 * 12.0 + v43];
        double v44 = v39[1];
        sub_1000816D8();
        [v12 setSectionFooterSlotCost:v44 - v45];
        [v12 setHeadlineSlotCost:sub_10007FBEC()];
        v3 = v76;
        [v76 setDynamicThumbnailSizeMinimumSizeInPixels:*(double *)((char *)v39 + *(int *)(v35 + 36)) * 128.0, *(double *)((char *)v39 + *(int *)(v35 + 36)) * 128.0];
        [v3 setAllowSectionTitles:1];
        sub_1000816D8();
        double v47 = v46 + v46 + 47.0;
        sub_1000816D8();
        double v49 = v48 + v48;
        sub_1000829B4();
        [v3 setMinHeadlineScale:v47 / (v49 + v50)];
        sub_1000816D8();
        double v52 = v51 + v51 + 128.0;
        sub_1000816D8();
        double v54 = v53 + v53;
        sub_1000829B4();
        [v3 setMaxHeadlineScale:v52 / (v54 + v55)];
        id v56 = sub_1000812DC();
        [v56 nt_scaledValueForValue:1.0];
        double v58 = v57;

        double v59 = v43 + v58 * 12.0 + sub_10007FBEC();
        sub_1000816D8();
        [v3 setBannerSlotCost:v59 + v44 - v60];
LABEL_23:
        uint64_t v1 = v75;
        [v3 setSectionSlotCostInfo:v12];
        [v3 setQualityOfService:25];
        id v61 = [self mainScreen];
        [v61 scale];
        double v63 = v62;

        [v3 setScale:v63];
        id v64 = [self activeInputModes];
        sub_100022374(0, &qword_10013A1F0);
        unint64_t v10 = sub_1000EA470();

        if (!(v10 >> 62))
        {
          v65 = *(void **)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v65) {
            goto LABEL_30;
          }
          goto LABEL_25;
        }
LABEL_34:
        swift_bridgeObjectRetain();
        v65 = (void *)sub_1000EA980();
        swift_bridgeObjectRelease();
        if (!v65) {
          goto LABEL_30;
        }
LABEL_25:
        if ((v10 & 0xC000000000000001) != 0)
        {
          id v66 = (id)sub_1000EA870();
          goto LABEL_28;
        }
        if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v66 = *(id *)(v10 + 32);
LABEL_28:
          v67 = v66;
          swift_bridgeObjectRelease();
          id v68 = [v67 primaryLanguage];

          if (!v68)
          {
            v65 = 0;
            goto LABEL_32;
          }
          sub_1000EA2B0();

          v65 = sub_1000EA280();
LABEL_30:
          swift_bridgeObjectRelease();
LABEL_32:
          [v3 setKeyboardInputMode:v65];

          [v3 setRequest:*v1];
          return (uint64_t)v3;
        }
        __break(1u);
        goto LABEL_38;
      }
    }
    uint64_t v12 = v73;
    [v73 setSectionTitleSlotCost:0.0];
    [v12 setSectionFooterSlotCost:0.0];
    v3 = v76;
    [v76 slotsLimit];
    [v12 setHeadlineSlotCost:];
    double v38 = *(double *)((char *)v78 + *(int *)(v35 + 36));
    [v3 setDynamicThumbnailSizeMinimumSizeInPixels:*v70 * v38, v70[1] * v38];
    [v3 setAllowSectionTitles:0];
    goto LABEL_23;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000AC488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10006C85C(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(void *)(v4 + 24));
}

unint64_t sub_1000AC490()
{
  unint64_t result = qword_100139068;
  if (!qword_100139068)
  {
    sub_1000E9F60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100139068);
  }
  return result;
}

uint64_t sub_1000AC4E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000AC550(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000AC5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AC5C4);
}

uint64_t sub_1000AC5C4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for LayoutContext();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for NewsWidgetInfo();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      id v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000AC6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AC704);
}

void *sub_1000AC704(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for LayoutContext();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for NewsWidgetInfo();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      id v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_1000AC838()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000AC898(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v8 = swift_allocObject();
  sub_1000AC900(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1000AC900(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v16 = a3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v15 = sub_1000EA670();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000EA660();
  __chkstk_darwin(v9);
  uint64_t v10 = sub_1000E9E30();
  __chkstk_darwin(v10 - 8);
  uint64_t v14 = sub_100022374(0, &qword_1001382D8);
  sub_1000E9E10();
  *(void *)&long long v19 = _swiftEmptyArrayStorage;
  sub_1000B263C((unint64_t *)&qword_1001382E0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10001B38C(&qword_1001382E8);
  sub_1000B2684((unint64_t *)&qword_1001382F0, &qword_1001382E8);
  uint64_t v11 = v16;
  sub_1000EA7C0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v15);
  v4[19] = sub_1000EA6B0();
  uint64_t v12 = v18;
  v4[2] = v17;
  v4[3] = v12;
  sub_10002D970(v11, (uint64_t)(v4 + 4));
  sub_100020A28(a4, *((void *)a4 + 3));
  sub_10001B38C(&qword_100137CD8);
  uint64_t result = sub_1000E8EC0();
  if (v20)
  {
    sub_100020AC0(v11);
    sub_1000A9708(&v19, (uint64_t)(v4 + 9));
    sub_1000A9708(a4, (uint64_t)(v4 + 14));
    return (uint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000ACBDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = type metadata accessor for ContentServiceRequest();
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (id *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = type metadata accessor for TodayContent();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for EntryRequest();
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = (void *)(*(uint64_t (**)(void))(*(void *)(v4 + 88) + 24))();
  sub_1000ACE74(v16, v17, v15);

  uint64_t v18 = sub_100020A28(v2 + 4, v2[7]);
  sub_100020A28((void *)(*v18 + 16), *(void *)(*v18 + 40));
  uint64_t v19 = sub_1000ABA28();
  sub_1000B2450((uint64_t)v15 + *(int *)(v13 + 28), (uint64_t)v8 + *(int *)(v6 + 28), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  sub_1000B2450((uint64_t)v15 + *(int *)(v13 + 32), (uint64_t)v8 + *(int *)(v6 + 32), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  id *v8 = (id)v19;
  sub_10006FCF8(v8, 4, v11);
  sub_1000B2534((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
  uint64_t v20 = type metadata accessor for NewsTimelineEntry();
  sub_1000B2450((uint64_t)v11, a1 + *(int *)(v20 + 20), (uint64_t (*)(void))type metadata accessor for TodayContent);
  sub_1000E8C40();
  sub_1000B2534((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for TodayContent);
  return sub_1000B2534((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for EntryRequest);
}

id sub_1000ACE74@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v65 = a2;
  v70 = a3;
  v71 = a1;
  uint64_t v3 = sub_1000E9F60();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  __chkstk_darwin(v3);
  v67 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for LayoutContext();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v66 = (uint64_t)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v60 - v8;
  uint64_t v10 = sub_10001B38C(&qword_1001393C0);
  __chkstk_darwin(v10 - 8);
  double v60 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E96F0();
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v63 = v12;
  __chkstk_darwin(v12);
  id v61 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000EA140();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v60 - v19;
  sub_1000EA160();
  swift_getKeyPath();
  uint64_t v21 = sub_1000EA150();
  swift_release();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v15 + 8);
  v22(v20, v14);
  if (v21)
  {
    uint64_t v23 = *(void *)(v21 + 16);
    if (v23)
    {
      uint64_t v24 = (double *)(v21 + 32);
      double v25 = 2.0;
      do
      {
        double v26 = *v24++;
        double v27 = v26;
        if (v25 <= v26) {
          double v25 = v27;
        }
        --v23;
      }
      while (v23);
    }
    else
    {
      double v25 = 2.0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v25 = 3.0;
  }
  int v28 = v61;
  sub_1000EA160();
  swift_getKeyPath();
  uint64_t v29 = sub_1000EA150();
  swift_release();
  v22(v18, v14);
  if (!v29)
  {
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v60, 1, 1, v63);
    uint64_t v34 = v64;
    uint64_t v35 = v65;
LABEL_17:
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v28, enum case for ContentSizeCategory.large(_:), v30);
    sub_100028B6C(v32, &qword_1001393C0);
    goto LABEL_19;
  }
  if (*(void *)(v29 + 16))
  {
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
    (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v60, v29 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80)), v63);
    uint64_t v33 = 0;
    uint64_t v34 = v64;
    uint64_t v35 = v65;
  }
  else
  {
    uint64_t v33 = 1;
    uint64_t v34 = v64;
    uint64_t v35 = v65;
    uint64_t v31 = v62;
    uint64_t v30 = v63;
    uint64_t v32 = (uint64_t)v60;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v32, v33, 1, v30);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v32, 1, v30) == 1) {
    goto LABEL_17;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v28, v32, v30);
LABEL_19:
  sub_1000EA130();
  sub_1000EA120();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(&v9[v5[8]], v28, v30);
  char v40 = sub_1000EA170();
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)uint64_t v9 = _Q0;
  double v46 = &v9[v5[7]];
  *(void *)double v46 = v37;
  *((void *)v46 + 1) = v39;
  *(double *)&v9[v5[9]] = v25;
  *(void *)&v9[v5[10]] = 0x3FF0000000000000;
  v9[v5[11]] = 0;
  v9[v5[12]] = v40 & 1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(ObjectType, v35);
  uint64_t v49 = v66;
  sub_1000B2450((uint64_t)v9, v66, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  double v50 = v67;
  sub_1000EA130();
  sub_1000B2534((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for LayoutContext);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
  uint64_t v52 = *(void *)(v34 + 16);
  uint64_t v51 = *(void *)(v34 + 24);
  uint64_t v53 = type metadata accessor for EntryRequest();
  double v54 = v70;
  double v55 = (char *)v70 + *(int *)(v53 + 24);
  *(void *)double v55 = v71;
  *((void *)v55 + 1) = v35;
  uint64_t v56 = type metadata accessor for NewsWidgetInfo();
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(&v55[*(int *)(v56 + 20)], v50, v69);
  double v57 = &v55[*(int *)(v56 + 24)];
  *(void *)double v57 = v52;
  *((void *)v57 + 1) = v51;
  *double v54 = v48;
  sub_1000B2594(v49, (uint64_t)v54 + *(int *)(v53 + 20), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  swift_bridgeObjectRetain();
  double v58 = v71;

  return v58;
}

uint64_t sub_1000AD4DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v23[0] = a4;
  uint64_t v9 = *v4;
  uint64_t v10 = sub_10001B38C(&qword_100137588);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NewsWidgetInfo();
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void *)(v9 + 88);
  sub_1000EA130();
  uint64_t v18 = v5[2];
  uint64_t v19 = v5[3];
  *uint64_t v16 = a1;
  v16[1] = v17;
  uint64_t v20 = (void *)((char *)v16 + *(int *)(v14 + 32));
  void *v20 = v18;
  v20[1] = v19;
  sub_100020A28(v5 + 9, v5[12]);
  swift_bridgeObjectRetain();
  id v21 = a1;
  sub_1000279F4((uint64_t)v12);
  sub_1000AD6C4(v21, a2, (uint64_t)v12, a3, v23[0]);
  sub_100028B6C((uint64_t)v12, &qword_100137588);
  return sub_1000B2534((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
}

uint64_t sub_1000AD6C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v68 = a4;
  uint64_t v69 = a5;
  uint64_t v67 = a2;
  uint64_t v8 = *v5;
  uint64_t v9 = sub_1000EA180();
  uint64_t v65 = *(void *)(v9 - 8);
  uint64_t v66 = v9;
  __chkstk_darwin(v9);
  uint64_t v63 = v10;
  uint64_t v64 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001B38C(&qword_100137588);
  double v58 = *(unsigned __int8 **)(v11 - 8);
  __chkstk_darwin(v11 - 8);
  uint64_t v59 = v12;
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for EntryRequest();
  uint64_t v60 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v61 = v16;
  uint64_t v62 = (uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v71 = (uint64_t *)((char *)&v55 - v17);
  sub_100022374(0, (unint64_t *)&qword_100138300);
  id v18 = a1;
  uint64_t v19 = sub_1000EA720();
  os_log_type_t v20 = sub_1000EA620();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = (void *)swift_slowAlloc();
    *(_DWORD *)id v21 = 138412290;
    id v72 = v18;
    id v22 = v18;
    uint64_t v57 = a3;
    id v23 = v22;
    sub_1000EA750();
    *uint64_t v56 = v18;

    a3 = v57;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "fetching news entry for configuration %@", v21, 0xCu);
    sub_10001B38C((uint64_t *)&unk_10013A370);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v24 = *(void *)(v8 + 88);
  uint64_t v25 = v70;
  double v26 = v71;
  id v27 = sub_1000ACE74(v18, v24, v71);
  __chkstk_darwin(v27);
  *(&v55 - 2) = v25;
  *(&v55 - 1) = (uint64_t)v26;
  type metadata accessor for NewsTimelineEntry();
  sub_1000E90C0();
  sub_10002DA34(a3, (uint64_t)v13, &qword_100137588);
  unint64_t v28 = (v58[80] + 32) & ~(unint64_t)v58[80];
  unint64_t v29 = (v59 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = *(void **)(v8 + 80);
  *(void *)(v30 + 16) = v31;
  *(void *)(v30 + 24) = v24;
  uint64_t v56 = v31;
  uint64_t v57 = v24;
  sub_10002D5DC((uint64_t)v13, v30 + v28, &qword_100137588);
  *(void *)(v30 + v29) = v18;
  id v32 = v18;
  uint64_t v33 = (void *)sub_1000E9030();
  sub_1000E9090();
  swift_release();
  swift_release();

  uint64_t v34 = (void *)swift_allocObject();
  v34[2] = v31;
  v34[3] = v24;
  uint64_t v35 = v68;
  uint64_t v36 = v69;
  v34[4] = v32;
  v34[5] = v35;
  v34[6] = v36;
  double v58 = (unsigned __int8 *)v32;
  swift_retain();
  uint64_t v37 = (void *)sub_1000E9030();
  uint64_t v59 = sub_1000E9050();
  swift_release();
  swift_release();

  uint64_t v38 = v64;
  uint64_t v39 = v65;
  uint64_t v40 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v67, v66);
  uint64_t v41 = v62;
  sub_1000B2450((uint64_t)v71, v62, (uint64_t (*)(void))type metadata accessor for EntryRequest);
  unint64_t v42 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  unint64_t v43 = (v63 + v42 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v45 = (v44 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v46 = (*(unsigned __int8 *)(v60 + 80) + v45 + 8) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v57;
  *(void *)(v47 + 16) = v56;
  *(void *)(v47 + 24) = v48;
  (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v47 + v42, v38, v40);
  uint64_t v49 = v58;
  *(void *)(v47 + v43) = v58;
  double v50 = (void *)(v47 + v44);
  uint64_t v51 = v69;
  *double v50 = v68;
  v50[1] = v51;
  *(void *)(v47 + v45) = v70;
  sub_1000B2594(v41, v47 + v46, (uint64_t (*)(void))type metadata accessor for EntryRequest);
  id v52 = v49;
  swift_retain();
  swift_retain();
  uint64_t v53 = (void *)sub_1000E9030();
  sub_1000E9060();
  swift_release();
  swift_release();
  swift_release();

  return sub_1000B2534((uint64_t)v71, (uint64_t (*)(void))type metadata accessor for EntryRequest);
}

uint64_t sub_1000ADD38(id a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v61 = a4;
  uint64_t v60 = a3;
  id v57 = a1;
  uint64_t v6 = *v4;
  uint64_t v7 = sub_1000EA180();
  uint64_t v73 = *(void *)(v7 - 8);
  uint64_t v74 = v7;
  __chkstk_darwin(v7);
  uint64_t v67 = v8;
  id v72 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v58 = (char *)type metadata accessor for TaskContext();
  uint64_t v9 = __chkstk_darwin(v58);
  uint64_t v59 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = sub_10001B38C(&qword_100137588);
  uint64_t v64 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v65 = v15;
  uint64_t v66 = (uint64_t)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v52 - v16;
  uint64_t v18 = type metadata accessor for NewsWidgetInfo();
  uint64_t v62 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v71 = (uint64_t)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v20;
  __chkstk_darwin(v19);
  id v22 = (uint64_t *)((char *)&v52 - v21);
  uint64_t v23 = v4[17];
  uint64_t v53 = v4 + 14;
  sub_100020A28(v4 + 14, v23);
  type metadata accessor for TelemetryManager();
  uint64_t result = sub_1000E8EB0();
  if (result)
  {
    uint64_t v56 = result;
    uint64_t v55 = v6;
    uint64_t v25 = *(void *)(v6 + 88);
    uint64_t v70 = (void *)a2;
    sub_1000EA130();
    uint64_t v26 = v4[2];
    uint64_t v27 = v4[3];
    id v28 = v57;
    *id v22 = v57;
    v22[1] = v25;
    uint64_t v68 = v25;
    uint64_t v69 = (uint64_t)v4;
    unint64_t v29 = (void *)((char *)v22 + *(int *)(v18 + 24));
    *unint64_t v29 = v26;
    v29[1] = v27;
    sub_100020A28(v4 + 9, v4[12]);
    swift_bridgeObjectRetain();
    id v30 = v28;
    sub_1000279F4((uint64_t)v17);
    uint64_t v31 = (uint64_t)v17;
    id v32 = *(void (**)(char *, void *, uint64_t))(v73 + 16);
    v32(v12, v70, v74);
    sub_10002DA34(v31, (uint64_t)&v12[*((int *)v58 + 5)], &qword_100137588);
    sub_10001B3D0(&qword_10013A330);
    uint64_t v55 = *(void *)(v55 + 80);
    type metadata accessor for TaskManager();
    sub_1000EA010();
    double v34 = v33;
    double v58 = v12;
    uint64_t v35 = v59;
    sub_1000B2450((uint64_t)v12, v59, (uint64_t (*)(void))type metadata accessor for TaskContext);
    id v57 = v30;
    uint64_t v36 = sub_1000CA4E4((uint64_t)v57, v35, v34);
    sub_1000CA778(v60, v61);
    uint64_t v37 = v31;
    uint64_t v38 = v69;
    if (sub_1000AE4E0(v31))
    {
      sub_100020A28(v53, *(void *)(v38 + 136));
      uint64_t v39 = type metadata accessor for EventProcessingSidecarTask();
      uint64_t v38 = v69;
      uint64_t v40 = sub_1000E8EB0();
      if (v40)
      {
        v75[3] = v39;
        v75[4] = &off_1001257C0;
        v75[0] = v40;
        swift_retain();
        sub_1000CBCAC(v75);
        swift_release();
        swift_release();
        sub_100020AC0((uint64_t)v75);
      }
    }
    uint64_t v59 = v36;
    uint64_t v69 = sub_1000AE698(v38);
    uint64_t v61 = sub_1000E90C0();
    v32(v72, v70, v74);
    uint64_t v54 = v37;
    uint64_t v41 = v66;
    sub_10002DA34(v37, v66, &qword_100137588);
    sub_1000B2450((uint64_t)v22, v71, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    uint64_t v70 = v22;
    uint64_t v42 = v73;
    unint64_t v43 = (*(unsigned __int8 *)(v73 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
    unint64_t v44 = (v67 + *(unsigned __int8 *)(v64 + 80) + v43) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    unint64_t v45 = (v65 + *(unsigned __int8 *)(v62 + 80) + v44) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
    unint64_t v46 = (v63 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v47 = (char *)swift_allocObject();
    uint64_t v48 = v68;
    *((void *)v47 + 2) = v55;
    *((void *)v47 + 3) = v48;
    id v49 = v57;
    *((void *)v47 + 4) = v38;
    *((void *)v47 + 5) = v49;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(&v47[v43], v72, v74);
    sub_10002D5DC(v41, (uint64_t)&v47[v44], &qword_100137588);
    sub_1000B2594(v71, (uint64_t)&v47[v45], (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    *(void *)&v47[v46] = v59;
    *(void *)&v47[(v46 + 15) & 0xFFFFFFFFFFFFFFF8] = v56;
    id v50 = v49;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v51 = (void *)sub_1000E9030();
    sub_1000E9080();
    swift_release();

    swift_release();
    swift_release();
    sub_1000AF1D8();
    swift_release();
    swift_release();
    swift_release();
    sub_1000B2534((uint64_t)v58, (uint64_t (*)(void))type metadata accessor for TaskContext);
    sub_100028B6C(v54, &qword_100137588);
    return sub_1000B2534((uint64_t)v70, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_1000AE4E0(uint64_t a1)
{
  sub_100020A28((void *)(v1 + 112), *(void *)(v1 + 136));
  sub_10001B38C((uint64_t *)&unk_1001399E0);
  uint64_t result = (void *)sub_1000E8EB0();
  if (result)
  {
    id v4 = [result possiblyUnfetchedAppConfiguration];
    if (([v4 respondsToSelector:"widgetAnalyticsEnabled"] & 1) != 0
      && [v4 widgetAnalyticsEnabled])
    {
      id v5 = sub_1000B06DC(a1);
      if (v6)
      {
        uint64_t v9 = 0;
        goto LABEL_10;
      }
      char v7 = sub_1000B0A30((uint64_t)v5, (uint64_t)&off_1001243A8);
      sub_100022374(0, (unint64_t *)&qword_100138300);
      uint64_t v8 = (void *)sub_1000EA720();
      sub_1000EA620();
      if ((v7 & 1) == 0)
      {
        sub_1000E9220();
        uint64_t v9 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      sub_100022374(0, (unint64_t *)&qword_100138300);
      uint64_t v8 = (void *)sub_1000EA720();
      sub_1000EA620();
    }
    sub_1000E9220();
    uint64_t v9 = 0;
LABEL_9:

LABEL_10:
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (void *)v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000AE698(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 112);
  sub_100020A28((void *)(a1 + 112), *(void *)(a1 + 136));
  sub_10001B38C((uint64_t *)&unk_100137900);
  uint64_t result = sub_1000E8E90();
  if (result)
  {
    uint64_t v4 = result;
    sub_100020A28(v2, *(void *)(a1 + 136));
    uint64_t v5 = type metadata accessor for EventProcessingSidecarTask();
    *(void *)(swift_allocObject() + 16) = v4;
    swift_unknownObjectRetain();
    uint64_t v6 = sub_1000E8EA0();
    swift_release();
    if (v6)
    {
      v8[3] = v5;
      v8[4] = &off_1001257C0;
      v8[0] = v6;
      swift_retain();
      uint64_t v7 = sub_1000CBCAC(v8);
      swift_release();
      swift_unknownObjectRelease();
      sub_100020AC0((uint64_t)v8);
    }
    else
    {
      sub_10001B38C(&qword_1001379B0);
      swift_allocObject();
      uint64_t v7 = sub_1000E9070();
      swift_unknownObjectRelease();
    }
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000AE82C(void *a1)
{
  return sub_1000E8E60();
}

uint64_t sub_1000AE888(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  id v30 = a2;
  uint64_t v31 = a4;
  uint64_t v10 = *a1;
  uint64_t v26 = a3;
  uint64_t v27 = v10;
  uint64_t v11 = sub_1000EA180();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for NewsWidgetInfo();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B2450(a5, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v20 = (v17 + *(unsigned __int8 *)(v12 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v21 = (v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  id v22 = (char *)swift_allocObject();
  uint64_t v23 = v27;
  *((void *)v22 + 2) = *(void *)(v27 + 80);
  *((void *)v22 + 3) = *(void *)(v23 + 88);
  *((void *)v22 + 4) = a1;
  sub_1000B2594((uint64_t)v18, (uint64_t)&v22[v19], (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v22[v20], v14, v11);
  uint64_t v24 = v29;
  *(void *)&v22[v21] = v28;
  *(void *)&v22[(v21 + 15) & 0xFFFFFFFFFFFFFFF8] = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000AD6C4(v30, v26, v31, (uint64_t)sub_1000B1410, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_1000AEB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a6;
  uint64_t v42 = a5;
  v34[1] = a4;
  v34[2] = a3;
  uint64_t v43 = sub_10001B38C(&qword_10013A330);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v39 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000EA0C0();
  uint64_t v35 = *(void *)(v40 - 8);
  uint64_t v9 = __chkstk_darwin(v40);
  uint64_t v36 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v34 - v11;
  uint64_t v13 = sub_1000E9F60();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000E8C50();
  uint64_t v37 = *(void *)(v17 - 8);
  uint64_t v38 = v17;
  uint64_t v18 = __chkstk_darwin(v17);
  unint64_t v20 = (char *)v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v22 = (char *)v34 - v21;
  sub_1000E8C40();
  sub_100020A28((void *)(a2 + 72), *(void *)(a2 + 96));
  uint64_t v23 = a1;
  sub_1000271F8(a1);
  uint64_t v24 = type metadata accessor for NewsTimelineEntry();
  id v25 = [*(id *)(a1 + *(int *)(v24 + 20) + *(int *)(type metadata accessor for TodayContent() + 28)) widgetConfig];
  if (!v25)
  {
    sub_1000EA130();
    id v25 = sub_1000AF024();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  [v25 widgetSystemReloadInterval];
  [v25 widgetSystemReloadJitterMax];
  sub_1000E8BF0();
  sub_1000EA0B0();
  sub_10001B38C((uint64_t *)&unk_10013A390);
  unint64_t v26 = (*(unsigned __int8 *)(*(void *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1000F1610;
  sub_1000B2450(v23, v27 + v26, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
  uint64_t v28 = v35;
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v36, v12, v40);
  sub_1000B263C(qword_10013A310, (void (*)(uint64_t))type metadata accessor for NewsTimelineEntry);
  id v30 = v39;
  sub_1000EA190();
  sub_1000CB8A0();
  TelemetryManager.flush()();

  (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v43);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
  uint64_t v31 = v38;
  id v32 = *(void (**)(char *, uint64_t))(v37 + 8);
  v32(v20, v38);
  return ((uint64_t (*)(char *, uint64_t))v32)(v22, v31);
}

id sub_1000AF024()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000E9F60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  int v7 = enum case for InternalWidgetFamily.systemSmall(_:);
  int v8 = enum case for InternalWidgetFamily.accessoryRectangular(_:);
  id result = [objc_allocWithZone((Class)NTPBTodayWidgetConfig) init];
  uint64_t v10 = result;
  if (v6 == v7 || v6 == v8)
  {
    if (result)
    {
      [result setWidgetSystemReloadInterval:7200];
      [v10 setWidgetSystemReloadJitterMax:600];
      return v10;
    }
    __break(1u);
  }
  else if (result)
  {
    [result setWidgetSystemReloadInterval:300];
    [v10 setWidgetSystemReloadJitterMax:600];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000AF1D8()
{
  uint64_t v1 = sub_1000E9E00();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E9E30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 152);
  aBlock[4] = sub_1000B0150;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10003B648;
  aBlock[3] = &unk_1001270C0;
  uint64_t v9 = _Block_copy(aBlock);
  sub_1000E9E10();
  v11[1] = _swiftEmptyArrayStorage;
  sub_1000B263C((unint64_t *)&qword_10013A338, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10001B38C(&qword_10013A340);
  sub_1000B2684((unint64_t *)&qword_10013A348, &qword_10013A340);
  sub_1000EA7C0();
  sub_1000EA6A0();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000AF458@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000E9440();
  *a1 = v3;
  return result;
}

uint64_t sub_1000AF484()
{
  return sub_1000E9450();
}

uint64_t sub_1000AF4AC(uint64_t a1)
{
  uint64_t v2 = sub_1000E96F0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000E9470();
}

void sub_1000AF574(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v8 = type metadata accessor for NewsTimelineEntry();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001B38C(&qword_100137588);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002DA34(a2, (uint64_t)v14, &qword_100137588);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_100028B6C((uint64_t)v14, &qword_100137588);
    sub_100022374(0, (unint64_t *)&qword_100138300);
    id v15 = a3;
    uint64_t v16 = sub_1000EA720();
    os_log_type_t v17 = sub_1000EA620();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      uint64_t v35 = (uint64_t)v15;
      id v20 = v15;
      sub_1000EA750();
      *uint64_t v19 = v15;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "no previous entry for configuration %@", v18, 0xCu);
      sub_10001B38C((uint64_t *)&unk_10013A370);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    swift_willThrow();
    swift_errorRetain();
  }
  else
  {
    uint64_t v33 = v4;
    sub_1000B2594((uint64_t)v14, a4, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    sub_1000B2450(a4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    sub_100022374(0, (unint64_t *)&qword_100138300);
    id v21 = a3;
    id v22 = sub_1000EA720();
    os_log_type_t v23 = sub_1000EA620();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      id v25 = (void *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v35 = v32;
      *(_DWORD *)uint64_t v24 = 138412546;
      uint64_t v34 = (uint64_t)v21;
      id v26 = v21;
      os_log_t v31 = v22;
      id v27 = v26;
      sub_1000EA750();
      void *v25 = v21;

      *(_WORD *)(v24 + 12) = 2080;
      sub_1000E8C50();
      sub_1000B263C(&qword_100137598, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v28 = sub_1000EAB10();
      uint64_t v34 = sub_1000B1D7C(v28, v29, &v35);
      sub_1000EA750();
      swift_bridgeObjectRelease();
      sub_1000B2534((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
      os_log_t v30 = v31;
      _os_log_impl((void *)&_mh_execute_header, v31, v23, "falling back to previous entry for configuration %@ from %s", (uint8_t *)v24, 0x16u);
      sub_10001B38C((uint64_t *)&unk_10013A370);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000B2534((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    }
  }
}

uint64_t sub_1000AFA90(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  sub_100022374(0, (unint64_t *)&qword_100138300);
  id v6 = a2;
  uint64_t v7 = sub_1000EA720();
  os_log_type_t v8 = sub_1000EA620();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v13 = a1;
    id v10 = v6;
    sub_1000EA750();
    *uint64_t v12 = v6;

    a1 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "returning content entry for configuration %@", v9, 0xCu);
    sub_10001B38C((uint64_t *)&unk_10013A370);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return a3(a1);
}

uint64_t sub_1000AFC40(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v39 = a1;
  uint64_t v41 = type metadata accessor for ContentServiceRequest();
  __chkstk_darwin(v41);
  uint64_t v13 = (id *)((char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = type metadata accessor for TodayContent();
  __chkstk_darwin(v14 - 8);
  uint64_t v42 = (void *)((char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = type metadata accessor for NewsTimelineEntry();
  __chkstk_darwin(v40);
  os_log_type_t v17 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v18 = sub_1000EA170();
  sub_100022374(0, (unint64_t *)&qword_100138300);
  id v19 = a3;
  id v20 = sub_1000EA720();
  os_log_type_t v21 = sub_1000EA620();
  BOOL v22 = os_log_type_enabled(v20, v21);
  if (v18)
  {
    if (v22)
    {
      uint64_t v38 = a4;
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v37 = v23;
      *(_DWORD *)os_log_type_t v23 = 138412290;
      uint64_t v39 = a7;
      v35[1] = v23 + 4;
      id v43 = v19;
      id v24 = v19;
      a7 = v39;
      sub_1000EA750();
      *uint64_t v36 = v19;

      a4 = v38;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "returning placeholder for configuration %@", v37, 0xCu);
      sub_10001B38C((uint64_t *)&unk_10013A370);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v29 = sub_100020A28((void *)(a6 + 32), *(void *)(a6 + 56));
    sub_100020A28((void *)(*v29 + 16), *(void *)(*v29 + 40));
    uint64_t v30 = sub_1000ABA28();
    uint64_t v31 = type metadata accessor for EntryRequest();
    uint64_t v32 = v41;
    sub_1000B2450(a7 + *(int *)(v31 + 20), (uint64_t)v13 + *(int *)(v41 + 20), (uint64_t (*)(void))type metadata accessor for LayoutContext);
    sub_1000B2450(a7 + *(int *)(v31 + 24), (uint64_t)v13 + *(int *)(v32 + 24), (uint64_t (*)(void))type metadata accessor for NewsWidgetInfo);
    *uint64_t v13 = (id)v30;
    uint64_t v33 = v42;
    sub_10006FCF8(v13, 4, v42);
    sub_1000B2534((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ContentServiceRequest);
    sub_1000B2450((uint64_t)v33, (uint64_t)&v17[*(int *)(v40 + 20)], (uint64_t (*)(void))type metadata accessor for TodayContent);
    sub_1000E8C40();
    sub_1000B2534((uint64_t)v33, (uint64_t (*)(void))type metadata accessor for TodayContent);
  }
  else
  {
    if (v22)
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v42 = a5;
      id v26 = (uint8_t *)v25;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v38 = a4;
      *(_DWORD *)id v26 = 138412290;
      id v43 = v19;
      id v27 = v19;
      uint64_t v41 = a6;
      id v28 = v27;
      a4 = v38;
      sub_1000EA750();
      *(void *)uint64_t v40 = v19;

      a6 = v41;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "returning error within preview for configuration %@", v26, 0xCu);
      sub_10001B38C((uint64_t *)&unk_10013A370);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_100020A28((void *)(a6 + 32), *(void *)(a6 + 56));
    sub_1000AB660(a7, (uint64_t)v17);
  }
  a4(v17);
  return sub_1000B2534((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
}

void sub_1000B0150()
{
  uint64_t v0 = sub_1000E8C50();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v33 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_10001B38C((uint64_t *)&unk_10013A350);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - v14;
  id v16 = (id)NewsCoreUserDefaults();
  unsigned int v17 = [v16 BOOLForKey:NDDownloadServiceHasUnfinishedWorkKey];

  if (v17)
  {
    uint64_t v34 = v4;
    char v18 = self;
    id v19 = [v18 standardUserDefaults];
    uint64_t v33 = "sidecarTaskQueue";
    NSString v20 = sub_1000EA280();
    id v21 = [v19 objectForKey:v20];

    if (v21)
    {
      sub_1000EA7A0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v39, 0, sizeof(v39));
    }
    sub_10002D5DC((uint64_t)v39, (uint64_t)aBlock, (uint64_t *)&unk_1001394E0);
    if (v36)
    {
      int v22 = swift_dynamicCast();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v15, v22 ^ 1u, 1, v0);
    }
    else
    {
      sub_100028B6C((uint64_t)aBlock, (uint64_t *)&unk_1001394E0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v15, 1, 1, v0);
    }
    sub_1000E8C40();
    sub_10002DA34((uint64_t)v15, (uint64_t)v13, (uint64_t *)&unk_10013A350);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v13, 1, v0) == 1)
    {
      _s10NewsToday216TelemetryManagerC13lastFlushDate33_F9D4AB4E0910E2715C8CD19E0D9BCB9510Foundation0G0Vvpfi_0();
      sub_100028B6C((uint64_t)v13, (uint64_t *)&unk_10013A350);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v7, v13, v0);
    }
    sub_1000E8BC0();
    double v24 = v23;
    uint64_t v25 = *(void (**)(char *, uint64_t))(v1 + 8);
    v25(v7, v0);
    v25(v9, v0);
    if (v24 > 3600.0)
    {
      id v26 = (id)NDDownloadServiceXPCConnection();
      [v26 resume];
      uint64_t v37 = TodayIntentResponseCode.rawValue.getter;
      uint64_t v38 = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000B0674;
      uint64_t v36 = &unk_1001270E8;
      id v27 = _Block_copy(aBlock);
      id v28 = [v26 remoteObjectProxyWithErrorHandler:v27];
      _Block_release(v27);
      sub_1000EA7A0();
      swift_unknownObjectRelease();
      sub_10001B38C((uint64_t *)&unk_10013A360);
      if (swift_dynamicCast())
      {
        [*(id *)&v39[0] ping];
        id v29 = [v18 standardUserDefaults];
        uint64_t v30 = v34;
        sub_1000E8C40();
        Class isa = sub_1000E8BD0().super.isa;
        v25(v30, v0);
        NSString v32 = sub_1000EA280();
        [v29 setObject:isa forKey:v32];
        swift_unknownObjectRelease();
      }
    }
    sub_100028B6C((uint64_t)v15, (uint64_t *)&unk_10013A350);
  }
}

void sub_1000B0674(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1000B06DC(uint64_t a1)
{
  uint64_t v2 = sub_10001B38C(&qword_100137588);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (id)NewsCoreUserDefaults();
  id v6 = [v5 objectForKey:FCWidgetOnboardingVersionSharedPreferenceKey];

  if (v6)
  {
    sub_1000EA7A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_10002D5DC((uint64_t)v16, (uint64_t)v17, (uint64_t *)&unk_1001394E0);
  if (v18)
  {
    sub_100022374(0, &qword_10013A3A0);
    if (swift_dynamicCast())
    {
      uint64_t v7 = (void *)v15[1];
      sub_100022374(0, (unint64_t *)&qword_100138300);
      uint64_t v8 = (void *)sub_1000EA720();
      sub_1000EA620();
      sub_1000E9220();

      id v9 = [v7 integerValue];
      goto LABEL_11;
    }
  }
  else
  {
    sub_100028B6C((uint64_t)v17, (uint64_t *)&unk_1001394E0);
  }
  sub_10002DA34(a1, (uint64_t)v4, &qword_100137588);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v4, 1, v10) == 1)
  {
    sub_100028B6C((uint64_t)v4, &qword_100137588);
    sub_100022374(0, (unint64_t *)&qword_100138300);
    uint64_t v7 = (void *)sub_1000EA720();
    sub_1000EA620();
    sub_1000E9220();
    id v9 = 0;
  }
  else
  {
    uint64_t v11 = &v4[*(int *)(v10 + 20)];
    uint64_t v12 = *(void *)&v11[*(int *)(type metadata accessor for TodayContent() + 40)];
    swift_retain();
    sub_1000B2534((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
    id v13 = *(id *)(v12 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_fetchInfo);
    swift_release();
    id v9 = [v13 onboardingVersion];

    sub_100022374(0, (unint64_t *)&qword_100138300);
    uint64_t v7 = (void *)sub_1000EA720();
    sub_1000EA620();
    sub_1000E9220();
  }
LABEL_11:

  return v9;
}

uint64_t sub_1000B0A30(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000B0A94()
{
  swift_bridgeObjectRelease();
  sub_100020AC0(v0 + 32);
  sub_100020AC0(v0 + 72);
  sub_100020AC0(v0 + 112);

  return v0;
}

uint64_t sub_1000B0AD4()
{
  sub_1000B0A94();

  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for NewsTimelineProvider()
{
  return sub_1000674DC();
}

uint64_t sub_1000B0B20()
{
  return sub_1000B263C(qword_10013A310, (void (*)(uint64_t))type metadata accessor for NewsTimelineEntry);
}

uint64_t sub_1000B0B6C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000ACBDC(a1);
}

uint64_t sub_1000B0B90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000AD4DC(a1, a2, a3, a4);
}

uint64_t sub_1000B0BB4(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  return sub_1000ADD38(a1, a2, a3, a4);
}

uint64_t sub_1000B0BD8()
{
  return swift_retain();
}

uint64_t sub_1000B0BF4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_1000EA180();
  uint64_t v2 = *(void *)(v42 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(sub_10001B38C(&qword_100137588) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = type metadata accessor for NewsWidgetInfo();
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  uint64_t v12 = *(void *)(*(void *)(v10 - 8) + 64);
  swift_release();

  uint64_t v13 = v1 + v4;
  uint64_t v14 = v1;
  uint64_t v15 = v9;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v13, v42);
  uint64_t v16 = type metadata accessor for NewsTimelineEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v14 + v8, 1, v16))
  {
    uint64_t v37 = v14;
    uint64_t v38 = v11;
    uint64_t v39 = v7;
    uint64_t v40 = v12;
    uint64_t v43 = v8;
    uint64_t v17 = sub_1000E8C50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v14 + v8, v17);
    uint64_t v18 = (id *)(v14 + v8 + *(int *)(v16 + 20));

    uint64_t v19 = type metadata accessor for TodayContent();
    NSString v20 = (char *)v18 + *(int *)(v19 + 20);
    id v21 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v21 - 1) + 48))(v20, 1, v21))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v22 = &v20[v21[7]];
      uint64_t v23 = sub_1000E8B60();
      uint64_t v24 = *(void *)(v23 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23)) {
        (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void **)&v20[v21[9]];
      if (v25 != (void *)1) {

      }
      sub_10001D758(*(void **)&v20[v21[10]], *(void **)&v20[v21[10] + 8]);
    }
    uint64_t v41 = v15;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    id v26 = (char *)v18 + *(int *)(v19 + 36);
    uint64_t v27 = sub_1000E8B60();
    uint64_t v28 = *(void *)(v27 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27)) {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = v41;
    uint64_t v8 = v43;
    uint64_t v12 = v40;
    uint64_t v11 = v38;
    uint64_t v7 = v39;
    uint64_t v14 = v37;
  }
  uint64_t v29 = (v8 + v15 + v11) & ~v11;
  unint64_t v30 = (((v12 + v29 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = v3 | v7 | v11 | 7;
  uint64_t v32 = v14 + v29;

  uint64_t v33 = v14;
  uint64_t v34 = v32 + *(int *)(v10 + 20);
  uint64_t v35 = sub_1000E9F60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v33, v30 + 8, v31);
}

uint64_t sub_1000B10C8()
{
  uint64_t v1 = *(void *)(sub_1000EA180() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v2 + *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(sub_10001B38C(&qword_100137588) - 8);
  unint64_t v5 = (v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(type metadata accessor for NewsWidgetInfo() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(uint64_t **)(v0 + 32);
  uint64_t v11 = *(void **)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + v9);
  uint64_t v13 = *(void *)(v0 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000AE888(v10, v11, v0 + v2, v0 + v5, v0 + v8, v12, v13);
}

uint64_t sub_1000B1230(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000B1240()
{
  return swift_release();
}

uint64_t sub_1000B1248()
{
  uint64_t v1 = (int *)(type metadata accessor for NewsWidgetInfo() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_1000EA180();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v13 = v2 | v7 | 7;
  unint64_t v9 = (((*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  uint64_t v10 = v0 + v3 + v1[7];
  uint64_t v11 = sub_1000E9F60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v9 + 8, v13);
}

uint64_t sub_1000B1410(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for NewsWidgetInfo() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_1000EA180() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v8 = (*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v10 = *(void *)(v1 + v8);
  uint64_t v11 = *(void *)(v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000AEB1C(a1, v9, v1 + v4, v1 + v7, v10, v11);
}

uint64_t sub_1000B1520()
{
  sub_100020A28((void *)(*(void *)(v0 + 16) + 32), *(void *)(*(void *)(v0 + 16) + 56));
  type metadata accessor for EntryService();
  return sub_1000AB8F8();
}

uint64_t sub_1000B159C()
{
  uint64_t v1 = *(void *)(sub_10001B38C(&qword_100137588) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for NewsTimelineEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    uint64_t v6 = sub_1000E8C50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
    unint64_t v7 = (id *)(v0 + v3 + *(int *)(v5 + 20));

    uint64_t v8 = type metadata accessor for TodayContent();
    uint64_t v9 = (char *)v7 + *(int *)(v8 + 20);
    uint64_t v10 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v10 - 1) + 48))(v9, 1, v10))
    {
      uint64_t v21 = v4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = &v9[v10[7]];
      uint64_t v12 = sub_1000E8B60();
      uint64_t v13 = *(void *)(v12 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
      }
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void **)&v9[v10[9]];
      if (v14 != (void *)1) {

      }
      sub_10001D758(*(void **)&v9[v10[10]], *(void **)&v9[v10[10] + 8]);
      uint64_t v4 = v21;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v15 = (char *)v7 + *(int *)(v8 + 36);
    uint64_t v16 = sub_1000E8B60();
    uint64_t v17 = *(void *)(v16 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16)) {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v18 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = v18 + 8;

  return _swift_deallocObject(v0, v19, v2 | 7);
}

void sub_1000B18F0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_10001B38C(&qword_100137588) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1000AF574(a1, v2 + v6, *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_1000B19B0()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000B19F0(uint64_t a1)
{
  return sub_1000AFA90(a1, *(void **)(v1 + 32), *(uint64_t (**)(uint64_t))(v1 + 40));
}

uint64_t sub_1000B1A14()
{
  uint64_t v1 = sub_1000EA180();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (int *)(type metadata accessor for EntryRequest() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  unint64_t v8 = (v7 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v7;
  unint64_t v21 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v9 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  swift_release();
  uint64_t v10 = (id *)(v0 + v8);

  uint64_t v11 = (char *)v10 + v6[7];
  uint64_t v12 = type metadata accessor for LayoutContext();
  uint64_t v13 = &v11[*(int *)(v12 + 24)];
  uint64_t v14 = sub_1000E9F60();
  uint64_t v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  uint64_t v16 = &v11[*(int *)(v12 + 32)];
  uint64_t v17 = sub_1000E96F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  unint64_t v18 = (id *)((char *)v10 + v6[8]);

  uint64_t v19 = type metadata accessor for NewsWidgetInfo();
  v15((char *)v18 + *(int *)(v19 + 20), v14);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v21, v9);
}

uint64_t sub_1000B1C74(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1000EA180() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for EntryRequest() - 8);
  uint64_t v9 = *(void **)(v1 + v5);
  uint64_t v10 = *(void (**)(void))(v1 + v6);
  uint64_t v11 = *(void **)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + v7);
  uint64_t v13 = v1 + ((*(unsigned __int8 *)(v8 + 80) + v7 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_1000AFC40(a1, v1 + v4, v9, v10, v11, v12, v13);
}

uint64_t sub_1000B1D7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000B1E50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100029614((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100029614((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100020AC0((uint64_t)v12);
  return v7;
}

uint64_t sub_1000B1E50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000EA760();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000B200C(a5, a6);
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
  uint64_t v8 = sub_1000EA8B0();
  if (!v8)
  {
    sub_1000EA950();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000EA9C0();
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

uint64_t sub_1000B200C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000B20A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000B2300(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000B2300(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000B20A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000B221C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000EA850();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000EA950();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000EA380();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_1000EA9C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000EA950();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000B221C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_10001B38C((uint64_t *)&unk_10013A380);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000B2284(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000EA3D0();
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
    uint64_t v5 = sub_1000EA3A0();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000B2300(char a1, int64_t a2, char a3, char *a4)
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
    sub_10001B38C((uint64_t *)&unk_10013A380);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1000EA9C0();
  __break(1u);
  return result;
}

uint64_t sub_1000B2450(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B24B8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000E9440();
  *a1 = v3;
  return result;
}

uint64_t sub_1000B24E4()
{
  return sub_1000E9450();
}

uint64_t sub_1000B250C()
{
  return sub_1000E9460();
}

uint64_t sub_1000B2534(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000B2594(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000B25FC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000B2634(void *a1)
{
  return sub_1000AE82C(a1);
}

uint64_t sub_1000B263C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B2684(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B3D0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1000B26DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    uint64_t v22 = v21 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000E8C50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v63 = a1;
    int64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    size_t v11 = *(void **)((char *)a2 + v8);
    *int64_t v9 = v11;
    unint64_t v12 = (int *)type metadata accessor for TodayContent();
    uint64_t v13 = v12[5];
    uint64_t v14 = (void *)((char *)v9 + v13);
    uint64_t v15 = &v10[v13];
    uint64_t v16 = (int *)type metadata accessor for Banner();
    uint64_t v17 = (void *)*((void *)v16 - 1);
    unint64_t v18 = (unsigned int (*)(char *, uint64_t, int *))v17[6];
    id v19 = v11;
    if (v18(v15, 1, v16))
    {
      uint64_t v20 = sub_10001B38C(&qword_1001385E0);
      memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      uint64_t v23 = *((void *)v15 + 1);
      *uint64_t v14 = *(void *)v15;
      v14[1] = v23;
      uint64_t v24 = *((void *)v15 + 3);
      uint64_t v61 = v17;
      v14[2] = *((void *)v15 + 2);
      v14[3] = v24;
      uint64_t v25 = *((void *)v15 + 5);
      v14[4] = *((void *)v15 + 4);
      v14[5] = v25;
      uint64_t v26 = v16[7];
      __dst = (char *)v14 + v26;
      uint64_t v59 = &v15[v26];
      uint64_t v27 = sub_1000E8B60();
      uint64_t v57 = *(void *)(v27 - 8);
      uint64_t v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v60(v59, 1, v27))
      {
        uint64_t v28 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, v59, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v57 + 16))(__dst, v59, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(__dst, 0, 1, v27);
      }
      uint64_t v29 = v16[8];
      unint64_t v30 = (void *)((char *)v14 + v29);
      uint64_t v31 = &v15[v29];
      uint64_t v32 = *((void *)v31 + 1);
      *unint64_t v30 = *(void *)v31;
      v30[1] = v32;
      uint64_t v33 = v16[9];
      uint64_t v34 = *(void **)&v15[v33];
      swift_bridgeObjectRetain();
      if (v34 != (void *)1) {
        id v35 = v34;
      }
      *(void *)((char *)v14 + v33) = v34;
      uint64_t v36 = v16[10];
      uint64_t v37 = (char *)v14 + v36;
      uint64_t v38 = &v15[v36];
      uint64_t v39 = *(void **)v38;
      uint64_t v40 = (void *)*((void *)v38 + 1);
      char v41 = v38[16];
      sub_10001D614(*(void **)v38, v40);
      *(void *)uint64_t v37 = v39;
      *((void *)v37 + 1) = v40;
      v37[16] = v41;
      (*((void (**)(void *, void, uint64_t, int *))v61 + 7))(v14, 0, 1, v16);
    }
    *(void *)((char *)v9 + v12[6]) = *(void *)&v10[v12[6]];
    *(void *)((char *)v9 + v12[7]) = *(void *)&v10[v12[7]];
    *((unsigned char *)v9 + v12[8]) = v10[v12[8]];
    uint64_t v42 = v12[9];
    uint64_t v62 = (char *)v9 + v42;
    uint64_t v43 = &v10[v42];
    uint64_t v44 = sub_1000E8B60();
    uint64_t v45 = *(void *)(v44 - 8);
    unint64_t v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    if (v46(v43, 1, v44))
    {
      uint64_t v47 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v62, v43, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v62, v43, v44);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v62, 0, 1, v44);
    }
    *(void *)((char *)v9 + v12[10]) = *(void *)&v10[v12[10]];
    uint64_t v48 = v12[11];
    id v49 = (void *)((char *)v9 + v48);
    id v50 = &v10[v48];
    uint64_t v51 = *((void *)v50 + 1);
    *id v49 = *(void *)v50;
    v49[1] = v51;
    uint64_t v52 = v12[12];
    uint64_t v53 = (void *)((char *)v9 + v52);
    uint64_t v54 = &v10[v52];
    uint64_t v55 = *((void *)v54 + 1);
    *uint64_t v53 = *(void *)v54;
    v53[1] = v55;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return v63;
  }
  return (uint64_t *)v22;
}

uint64_t sub_1000B2B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (id *)(a1 + *(int *)(a2 + 20));

  uint64_t v6 = type metadata accessor for TodayContent();
  uint64_t v7 = (char *)v5 + *(int *)(v6 + 20);
  uint64_t v8 = (int *)type metadata accessor for Banner();
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v8 - 1) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v9 = &v7[v8[7]];
    uint64_t v10 = sub_1000E8B60();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    }
    swift_bridgeObjectRelease();
    unint64_t v12 = *(void **)&v7[v8[9]];
    if (v12 != (void *)1) {

    }
    sub_10001D758(*(void **)&v7[v8[10]], *(void **)&v7[v8[10] + 8]);
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v13 = (char *)v5 + *(int *)(v6 + 36);
  uint64_t v14 = sub_1000E8B60();
  uint64_t v15 = *(void *)(v14 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000B2DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v60 = a1;
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a2 + v7);
  void *v8 = v10;
  uint64_t v11 = (int *)type metadata accessor for TodayContent();
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)((char *)v8 + v12);
  uint64_t v14 = (void *)(v9 + v12);
  uint64_t v15 = (int *)type metadata accessor for Banner();
  uint64_t v16 = (void *)*((void *)v15 - 1);
  uint64_t v17 = (unsigned int (*)(void *, uint64_t, int *))v16[6];
  id v18 = v10;
  if (v17(v14, 1, v15))
  {
    uint64_t v19 = sub_10001B38C(&qword_1001385E0);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v20 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v20;
    uint64_t v21 = v14[3];
    v13[2] = v14[2];
    v13[3] = v21;
    uint64_t v22 = v14[5];
    v13[4] = v14[4];
    v13[5] = v22;
    uint64_t v23 = v15[7];
    __dst = (char *)v13 + v23;
    double v58 = v16;
    uint64_t v55 = (char *)v14 + v23;
    uint64_t v24 = sub_1000E8B60();
    uint64_t v54 = *(void *)(v24 - 8);
    uint64_t v56 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v56(v55, 1, v24))
    {
      uint64_t v25 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dst, v55, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(__dst, v55, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(__dst, 0, 1, v24);
    }
    uint64_t v26 = v15[8];
    uint64_t v27 = (void *)((char *)v13 + v26);
    uint64_t v28 = (void *)((char *)v14 + v26);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = v15[9];
    uint64_t v31 = *(void **)((char *)v14 + v30);
    swift_bridgeObjectRetain();
    if (v31 != (void *)1) {
      id v32 = v31;
    }
    *(void *)((char *)v13 + v30) = v31;
    uint64_t v33 = v15[10];
    uint64_t v34 = (char *)v13 + v33;
    id v35 = (char *)v14 + v33;
    uint64_t v36 = *(void **)v35;
    uint64_t v37 = (void *)*((void *)v35 + 1);
    char v38 = v35[16];
    sub_10001D614(*(void **)v35, v37);
    *(void *)uint64_t v34 = v36;
    *((void *)v34 + 1) = v37;
    v34[16] = v38;
    (*((void (**)(void *, void, uint64_t, int *))v58 + 7))(v13, 0, 1, v15);
  }
  *(void *)((char *)v8 + v11[6]) = *(void *)(v9 + v11[6]);
  *(void *)((char *)v8 + v11[7]) = *(void *)(v9 + v11[7]);
  *((unsigned char *)v8 + v11[8]) = *(unsigned char *)(v9 + v11[8]);
  uint64_t v39 = v11[9];
  uint64_t v59 = (char *)v8 + v39;
  uint64_t v40 = (const void *)(v9 + v39);
  uint64_t v41 = sub_1000E8B60();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v42 + 48);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  if (v43(v40, 1, v41))
  {
    uint64_t v44 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v59, v40, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v42 + 16))(v59, v40, v41);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v59, 0, 1, v41);
  }
  *(void *)((char *)v8 + v11[10]) = *(void *)(v9 + v11[10]);
  uint64_t v45 = v11[11];
  unint64_t v46 = (void *)((char *)v8 + v45);
  uint64_t v47 = (void *)(v9 + v45);
  uint64_t v48 = v47[1];
  *unint64_t v46 = *v47;
  v46[1] = v48;
  uint64_t v49 = v11[12];
  id v50 = (void *)((char *)v8 + v49);
  uint64_t v51 = (void *)(v9 + v49);
  uint64_t v52 = v51[1];
  *id v50 = *v51;
  v50[1] = v52;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v60;
}

uint64_t sub_1000B3244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v85 = a1;
  uint64_t v8 = (void **)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a2 + v7);
  uint64_t v11 = *v8;
  void *v8 = v10;
  id v12 = v10;

  uint64_t v13 = (int *)type metadata accessor for TodayContent();
  uint64_t v14 = v13[5];
  uint64_t v15 = (void **)((char *)v8 + v14);
  uint64_t v16 = (void *)(v9 + v14);
  uint64_t v17 = (int *)type metadata accessor for Banner();
  uint64_t v18 = *((void *)v17 - 1);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, int *))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (v21)
    {
      sub_1000B4F50((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for Banner);
      goto LABEL_7;
    }
    *uint64_t v15 = *v16;
    v15[1] = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    void v15[2] = v16[2];
    v15[3] = v16[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v15[4] = v16[4];
    v15[5] = v16[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v26 = v17[7];
    uint64_t v27 = (char *)v15 + v26;
    __dsta = (char *)v16 + v26;
    uint64_t v28 = sub_1000E8B60();
    uint64_t v81 = *(void *)(v28 - 8);
    v82 = v27;
    uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 48);
    LODWORD(v27) = v29(v27, 1, v28);
    int v30 = v29(__dsta, 1, v28);
    if (v27)
    {
      if (v30)
      {
        size_t v31 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        id v32 = v82;
LABEL_17:
        memcpy(v32, __dsta, v31);
        goto LABEL_20;
      }
      (*(void (**)(void *, char *, uint64_t))(v81 + 16))(v82, __dsta, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v81 + 56))(v82, 0, 1, v28);
    }
    else
    {
      if (v30)
      {
        (*(void (**)(void *, uint64_t))(v81 + 8))(v82, v28);
        size_t v31 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        id v32 = v82;
        goto LABEL_17;
      }
      (*(void (**)(void *, char *, uint64_t))(v81 + 24))(v82, __dsta, v28);
    }
LABEL_20:
    uint64_t v45 = v17[8];
    unint64_t v46 = (void *)((char *)v15 + v45);
    uint64_t v47 = (void *)((char *)v16 + v45);
    *unint64_t v46 = *v47;
    v46[1] = v47[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v48 = v17[9];
    uint64_t v49 = (void *)((char *)v15 + v48);
    id v50 = *(void **)((char *)v15 + v48);
    uint64_t v51 = *(void **)((char *)v16 + v48);
    if (v50 == (void *)1)
    {
      if (v51 != (void *)1)
      {
        *uint64_t v49 = v51;
        id v52 = v51;
LABEL_27:
        uint64_t v54 = v17[10];
        uint64_t v55 = (char *)v15 + v54;
        uint64_t v56 = (char *)v16 + v54;
        uint64_t v57 = *(void **)v56;
        double v58 = (void *)*((void *)v56 + 1);
        char v59 = v56[16];
        sub_10001D614(*(void **)v56, v58);
        uint64_t v60 = *(void **)v55;
        uint64_t v61 = (void *)*((void *)v55 + 1);
        *(void *)uint64_t v55 = v57;
        *((void *)v55 + 1) = v58;
        v55[16] = v59;
        sub_10001D758(v60, v61);
        goto LABEL_28;
      }
    }
    else
    {
      if (v51 != (void *)1)
      {
        *uint64_t v49 = v51;
        id v53 = v51;

        goto LABEL_27;
      }
      sub_10001DBE4((id *)((char *)v15 + v48));
      uint64_t v51 = *(void **)((char *)v16 + v48);
    }
    *uint64_t v49 = v51;
    goto LABEL_27;
  }
  if (v21)
  {
LABEL_7:
    uint64_t v25 = sub_10001B38C(&qword_1001385E0);
    memcpy(v15, v16, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_28;
  }
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  void v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  uint64_t v22 = v17[7];
  __dst = (char *)v15 + v22;
  uint64_t v79 = (char *)v16 + v22;
  uint64_t v23 = sub_1000E8B60();
  uint64_t v78 = *(void *)(v23 - 8);
  uint64_t v80 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v78 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v80(v79, 1, v23))
  {
    uint64_t v24 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(__dst, v79, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(__dst, v79, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v78 + 56))(__dst, 0, 1, v23);
  }
  uint64_t v33 = v17[8];
  uint64_t v34 = (void *)((char *)v15 + v33);
  id v35 = (void *)((char *)v16 + v33);
  *uint64_t v34 = *v35;
  v34[1] = v35[1];
  uint64_t v36 = v17[9];
  uint64_t v37 = *(void **)((char *)v16 + v36);
  swift_bridgeObjectRetain();
  if (v37 != (void *)1) {
    id v38 = v37;
  }
  *(void *)((char *)v15 + v36) = v37;
  uint64_t v39 = v17[10];
  uint64_t v40 = (char *)v15 + v39;
  uint64_t v41 = (char *)v16 + v39;
  uint64_t v42 = *(void **)v41;
  uint64_t v43 = (void *)*((void *)v41 + 1);
  char v44 = v41[16];
  sub_10001D614(*(void **)v41, v43);
  *(void *)uint64_t v40 = v42;
  *((void *)v40 + 1) = v43;
  v40[16] = v44;
  (*(void (**)(void *, void, uint64_t, int *))(v18 + 56))(v15, 0, 1, v17);
LABEL_28:
  *(void **)((char *)v8 + v13[6]) = *(void **)(v9 + v13[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)v8 + v13[7]) = *(void **)(v9 + v13[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *((unsigned char *)v8 + v13[8]) = *(unsigned char *)(v9 + v13[8]);
  uint64_t v62 = v13[9];
  uint64_t v63 = (char *)v8 + v62;
  uint64_t v64 = (char *)(v9 + v62);
  uint64_t v65 = sub_1000E8B60();
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 48);
  int v68 = v67(v63, 1, v65);
  int v69 = v67(v64, 1, v65);
  if (!v68)
  {
    if (!v69)
    {
      (*(void (**)(char *, char *, uint64_t))(v66 + 24))(v63, v64, v65);
      goto LABEL_34;
    }
    (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v65);
    goto LABEL_33;
  }
  if (v69)
  {
LABEL_33:
    uint64_t v70 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v63, v64, *(void *)(*(void *)(v70 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v63, v64, v65);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v65);
LABEL_34:
  *(void **)((char *)v8 + v13[10]) = *(void **)(v9 + v13[10]);
  swift_retain();
  swift_release();
  uint64_t v71 = v13[11];
  id v72 = (void **)((char *)v8 + v71);
  uint64_t v73 = (void *)(v9 + v71);
  *id v72 = *v73;
  v72[1] = v73[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v74 = v13[12];
  v75 = (void **)((char *)v8 + v74);
  id v76 = (void *)(v9 + v74);
  void *v75 = *v76;
  v75[1] = v76[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v85;
}

uint64_t sub_1000B3A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for TodayContent();
  uint64_t v11 = v10[5];
  id v12 = (_OWORD *)(v8 + v11);
  uint64_t v13 = (_OWORD *)(v9 + v11);
  uint64_t v14 = (int *)type metadata accessor for Banner();
  uint64_t v15 = *((void *)v14 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_10001B38C(&qword_1001385E0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    long long v17 = v13[1];
    *id v12 = *v13;
    v12[1] = v17;
    v12[2] = v13[2];
    uint64_t v18 = v14[7];
    uint64_t v33 = a1;
    __dst = (char *)v12 + v18;
    uint64_t v19 = (char *)v13 + v18;
    uint64_t v20 = sub_1000E8B60();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(__dst, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    *(_OWORD *)((char *)v12 + v14[8]) = *(_OWORD *)((char *)v13 + v14[8]);
    *(void *)((char *)v12 + v14[9]) = *(void *)((char *)v13 + v14[9]);
    uint64_t v23 = v14[10];
    uint64_t v24 = (char *)v12 + v23;
    uint64_t v25 = (char *)v13 + v23;
    v24[16] = v25[16];
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v15 + 56))(v12, 0, 1, v14);
    a1 = v33;
  }
  *(void *)(v8 + v10[6]) = *(void *)(v9 + v10[6]);
  *(void *)(v8 + v10[7]) = *(void *)(v9 + v10[7]);
  *(unsigned char *)(v8 + v10[8]) = *(unsigned char *)(v9 + v10[8]);
  uint64_t v26 = v10[9];
  uint64_t v27 = (void *)(v8 + v26);
  uint64_t v28 = (const void *)(v9 + v26);
  uint64_t v29 = sub_1000E8B60();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  *(void *)(v8 + v10[10]) = *(void *)(v9 + v10[10]);
  *(_OWORD *)(v8 + v10[11]) = *(_OWORD *)(v9 + v10[11]);
  *(_OWORD *)(v8 + v10[12]) = *(_OWORD *)(v9 + v10[12]);
  return a1;
}

uint64_t sub_1000B3DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v79 = a1;
  uint64_t v8 = (void **)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *v8;
  void *v8 = *(void **)(a2 + v7);

  uint64_t v11 = (int *)type metadata accessor for TodayContent();
  uint64_t v12 = v11[5];
  uint64_t v13 = (void **)((char *)v8 + v12);
  uint64_t v14 = (void *)(v9 + v12);
  uint64_t v15 = (int *)type metadata accessor for Banner();
  uint64_t v16 = *((void *)v15 - 1);
  long long v17 = *(uint64_t (**)(void *, uint64_t, int *))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (v19)
    {
      sub_1000B4F50((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for Banner);
      goto LABEL_7;
    }
    uint64_t v27 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v27;
    swift_bridgeObjectRelease();
    uint64_t v28 = v14[3];
    v13[2] = v14[2];
    v13[3] = v28;
    swift_bridgeObjectRelease();
    uint64_t v29 = v14[5];
    v13[4] = v14[4];
    v13[5] = v29;
    swift_bridgeObjectRelease();
    uint64_t v30 = v15[7];
    uint64_t v31 = (char *)v13 + v30;
    __dsta = (char *)v14 + v30;
    uint64_t v32 = sub_1000E8B60();
    uint64_t v75 = *(void *)(v32 - 8);
    id v76 = v31;
    uint64_t v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v75 + 48);
    LODWORD(v31) = v33(v31, 1, v32);
    int v34 = v33(__dsta, 1, v32);
    if (v31)
    {
      if (v34)
      {
        size_t v35 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v36 = v76;
LABEL_15:
        memcpy(v36, __dsta, v35);
        goto LABEL_18;
      }
      (*(void (**)(void *, char *, uint64_t))(v75 + 32))(v76, __dsta, v32);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(v76, 0, 1, v32);
    }
    else
    {
      if (v34)
      {
        (*(void (**)(void *, uint64_t))(v75 + 8))(v76, v32);
        size_t v35 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v36 = v76;
        goto LABEL_15;
      }
      (*(void (**)(void *, char *, uint64_t))(v75 + 40))(v76, __dsta, v32);
    }
LABEL_18:
    uint64_t v40 = v15[8];
    uint64_t v41 = (void *)((char *)v13 + v40);
    uint64_t v42 = (void *)((char *)v14 + v40);
    uint64_t v44 = *v42;
    uint64_t v43 = v42[1];
    *uint64_t v41 = v44;
    v41[1] = v43;
    swift_bridgeObjectRelease();
    uint64_t v45 = v15[9];
    unint64_t v46 = (void *)((char *)v13 + v45);
    uint64_t v47 = *(void **)((char *)v13 + v45);
    uint64_t v48 = *(void *)((char *)v14 + v45);
    if (v47 != (void *)1)
    {
      if (v48 != 1)
      {
        *unint64_t v46 = v48;

        goto LABEL_23;
      }
      sub_10001DBE4((id *)((char *)v13 + v45));
      uint64_t v48 = *(void *)((char *)v14 + v45);
    }
    *unint64_t v46 = v48;
LABEL_23:
    uint64_t v49 = v15[10];
    id v50 = (char *)v13 + v49;
    uint64_t v51 = (char *)v14 + v49;
    char v52 = v51[16];
    id v53 = *(void **)v50;
    uint64_t v54 = (void *)*((void *)v50 + 1);
    *(_OWORD *)id v50 = *(_OWORD *)v51;
    v50[16] = v52;
    sub_10001D758(v53, v54);
    goto LABEL_24;
  }
  if (v19)
  {
LABEL_7:
    uint64_t v26 = sub_10001B38C(&qword_1001385E0);
    memcpy(v13, v14, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_24;
  }
  long long v20 = *((_OWORD *)v14 + 1);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v20;
  *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
  uint64_t v21 = v15[7];
  __dst = (char *)v13 + v21;
  uint64_t v22 = (char *)v14 + v21;
  uint64_t v23 = sub_1000E8B60();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(__dst, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(__dst, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
  }
  *(_OWORD *)((char *)v13 + v15[8]) = *(_OWORD *)((char *)v14 + v15[8]);
  *(void *)((char *)v13 + v15[9]) = *(void *)((char *)v14 + v15[9]);
  uint64_t v37 = v15[10];
  id v38 = (char *)v13 + v37;
  uint64_t v39 = (char *)v14 + v37;
  v38[16] = v39[16];
  *(_OWORD *)id v38 = *(_OWORD *)v39;
  (*(void (**)(void *, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
LABEL_24:
  *(void **)((char *)v8 + v11[6]) = *(void **)(v9 + v11[6]);
  swift_bridgeObjectRelease();
  *(void **)((char *)v8 + v11[7]) = *(void **)(v9 + v11[7]);
  swift_unknownObjectRelease();
  *((unsigned char *)v8 + v11[8]) = *(unsigned char *)(v9 + v11[8]);
  uint64_t v55 = v11[9];
  uint64_t v56 = (char *)v8 + v55;
  uint64_t v57 = (char *)(v9 + v55);
  uint64_t v58 = sub_1000E8B60();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v59 + 48);
  int v61 = v60(v56, 1, v58);
  int v62 = v60(v57, 1, v58);
  if (!v61)
  {
    if (!v62)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v56, v57, v58);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v56, v58);
    goto LABEL_29;
  }
  if (v62)
  {
LABEL_29:
    uint64_t v63 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v56, v57, *(void *)(*(void *)(v63 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v56, v57, v58);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v56, 0, 1, v58);
LABEL_30:
  *(void **)((char *)v8 + v11[10]) = *(void **)(v9 + v11[10]);
  swift_release();
  uint64_t v64 = v11[11];
  uint64_t v65 = (void **)((char *)v8 + v64);
  uint64_t v66 = (uint64_t *)(v9 + v64);
  uint64_t v68 = *v66;
  uint64_t v67 = v66[1];
  void *v65 = v68;
  v65[1] = v67;
  swift_bridgeObjectRelease();
  uint64_t v69 = v11[12];
  uint64_t v70 = (void **)((char *)v8 + v69);
  uint64_t v71 = (uint64_t *)(v9 + v69);
  uint64_t v73 = *v71;
  uint64_t v72 = v71[1];
  void *v70 = v73;
  v70[1] = v72;
  swift_bridgeObjectRelease();
  return v79;
}

uint64_t sub_1000B4470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B4484);
}

uint64_t sub_1000B4484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for TodayContent();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000B457C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B4590);
}

uint64_t sub_1000B4590(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000E8C50();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for TodayContent();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for NewsTimelineEntry()
{
  uint64_t result = qword_10013A400;
  if (!qword_10013A400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B46E0()
{
  uint64_t result = sub_1000E8C50();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for TodayContent();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000B47A8(void *a1)
{
  uint64_t v3 = sub_10001B38C(&qword_10013A450);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100020A28(a1, a1[3]);
  sub_1000B4E98();
  sub_1000EAC20();
  v8[15] = 0;
  sub_1000E8C50();
  sub_1000B4FB0(&qword_100137258, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_1000EAAE0();
  if (!v1)
  {
    type metadata accessor for NewsTimelineEntry();
    v8[14] = 1;
    type metadata accessor for TodayContent();
    sub_1000B4FB0(&qword_10013A458, (void (*)(uint64_t))type metadata accessor for TodayContent);
    sub_1000EAAE0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1000B49A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v22 = type metadata accessor for TodayContent();
  __chkstk_darwin(v22);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000E8C50();
  uint64_t v21 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v23 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10001B38C(&qword_10013A438);
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NewsTimelineEntry();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000B4E98();
  sub_1000EAC00();
  if (v2) {
    return sub_100020AC0((uint64_t)a1);
  }
  uint64_t v18 = v9;
  int v19 = v11;
  uint64_t v12 = v21;
  char v28 = 0;
  sub_1000B4FB0((unint64_t *)&unk_100137210, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v13 = v23;
  uint64_t v14 = v25;
  sub_1000EAA70();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v13, v14);
  char v27 = 1;
  sub_1000B4FB0(&qword_10013A448, (void (*)(uint64_t))type metadata accessor for TodayContent);
  sub_1000EAA70();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v26);
  uint64_t v15 = (uint64_t)v19;
  sub_1000B4EEC((uint64_t)v5, (uint64_t)&v19[*(int *)(v18 + 20)]);
  sub_10003542C(v15, v20);
  sub_100020AC0((uint64_t)a1);
  return sub_1000B4F50(v15, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
}

uint64_t sub_1000B4D90()
{
  if (*v0) {
    return 0x746E65746E6F63;
  }
  else {
    return 1702125924;
  }
}

uint64_t sub_1000B4DC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000B5204(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000B4DEC(uint64_t a1)
{
  unint64_t v2 = sub_1000B4E98();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000B4E28(uint64_t a1)
{
  unint64_t v2 = sub_1000B4E98();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000B4E68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000B49A8(a1, a2);
}

uint64_t sub_1000B4E80(void *a1)
{
  return sub_1000B47A8(a1);
}

unint64_t sub_1000B4E98()
{
  unint64_t result = qword_10013A440;
  if (!qword_10013A440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A440);
  }
  return result;
}

uint64_t sub_1000B4EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TodayContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B4F50(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000B4FB0(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for NewsTimelineEntry.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000B50C4);
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

ValueMetadata *type metadata accessor for NewsTimelineEntry.CodingKeys()
{
  return &type metadata for NewsTimelineEntry.CodingKeys;
}

unint64_t sub_1000B5100()
{
  unint64_t result = qword_10013A460;
  if (!qword_10013A460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A460);
  }
  return result;
}

unint64_t sub_1000B5158()
{
  unint64_t result = qword_10013A468;
  if (!qword_10013A468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A468);
  }
  return result;
}

unint64_t sub_1000B51B0()
{
  unint64_t result = qword_10013A470;
  if (!qword_10013A470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A470);
  }
  return result;
}

uint64_t sub_1000B5204(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1000EAB20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_1000B52EC()
{
  unint64_t result = qword_10013A478;
  if (!qword_10013A478)
  {
    sub_10001B3D0((uint64_t *)&unk_10013A480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A478);
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioAppIntentHandler()
{
  return &type metadata for AudioAppIntentHandler;
}

unint64_t sub_1000B5358(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    BOOL v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A698);
  BOOL v2 = (void *)sub_1000EA9B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_10003BB64();
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

unint64_t sub_1000B5464(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A688);
  uint64_t v2 = sub_1000EA9B0();
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
    sub_10002DA34(v6, (uint64_t)&v13, &qword_10013A690);
    uint64_t v7 = v13;
    unint64_t result = sub_10003BB64(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100028BC8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_1000B5594(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A680);
  uint64_t v2 = (void *)sub_1000EA9B0();
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
    swift_bridgeObjectRetain();
    unint64_t result = sub_10003BBF8((uint64_t)v6);
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

unint64_t sub_1000B56A0(uint64_t a1)
{
  uint64_t v2 = sub_10001B38C(&qword_10013A6B8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A6C0);
  uint64_t v6 = sub_1000EA9B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10002DA34(v12, (uint64_t)v5, &qword_10013A6B8);
    unint64_t result = sub_10003BE2C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_1000E8B60();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

unint64_t sub_1000B5894(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A6A0);
  uint64_t v2 = (void *)sub_1000EA9B0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 56);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 3);
    uint64_t v6 = (uint64_t)*(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    id v9 = v8;
    id v10 = v7;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10003BAEC(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v13 = v5;
    v13[1] = v6;
    long long v14 = (void *)(v2[7] + 16 * result);
    *long long v14 = v8;
    v14[1] = v10;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v2[2] = v17;
    v4 += 4;
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

unint64_t sub_1000B59BC(uint64_t a1)
{
  uint64_t v2 = sub_10001B38C(&qword_1001390A0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A6B0);
  uint64_t v6 = sub_1000EA9B0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v25 = &v5[*(int *)(v2 + 48)];
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  v23[1] = a1;
  uint64_t v24 = v11;
  swift_retain();
  while (1)
  {
    sub_10002DA34(v10, (uint64_t)v5, &qword_1001390A0);
    unint64_t result = sub_10003BE2C((uint64_t)v5);
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[6];
    uint64_t v16 = sub_1000E8B60();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v17 + 32);
    unint64_t v19 = *(void *)(v17 + 72) * v14;
    v18(v15 + v19, v5, v16);
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v7[7] + v19, v25, v16);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v10 += v24;
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

unint64_t sub_1000B5BD4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001B38C(&qword_10013A6E0);
  uint64_t v2 = sub_1000EA9B0();
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
    sub_10002DA34(v6, (uint64_t)v15, &qword_10013A6E8);
    unint64_t result = sub_10003BEB0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100028BC8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

void *sub_1000B5D18()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results);
  uint64_t v2 = sub_1000B6CB4();
  id v3 = [v1 sections];
  id v4 = [v3 array];

  uint64_t v5 = sub_1000EA470();
  uint64_t v6 = sub_100084B00(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_10003CF28((unint64_t)v6, (uint64_t)v2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  return v7;
}

unint64_t sub_1000B5F00(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x44497972746E65;
      break;
    case 2:
      unint64_t result = 0x4473746C75736572;
      break;
    case 3:
      unint64_t result = 0x666E496863746566;
      break;
    case 4:
      unint64_t result = 0x6F4374756F79616CLL;
      break;
    case 5:
      unint64_t result = 0x49746E65746E6F63;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x52656C6269736976;
      break;
    case 8:
      unint64_t result = 0x6E694B6B63617473;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000B6070(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x44497972746E65;
      break;
    case 2:
      unint64_t result = 0x4473746C75736572;
      break;
    case 3:
      unint64_t result = 0x666E496863746566;
      break;
    case 4:
      unint64_t result = 0x6F4374756F79616CLL;
      break;
    case 5:
      unint64_t result = 0x49746E65746E6F63;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x52656C6269736976;
      break;
    case 8:
      unint64_t result = 0x6E694B6B63617473;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000B61E0(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1000B5F00(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000B5F00(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000EAB20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_1000B626C()
{
  char v1 = *v0;
  sub_1000EABB0();
  sub_1000B5F00(v1);
  sub_1000EA330();
  swift_bridgeObjectRelease();
  return sub_1000EABE0();
}

uint64_t sub_1000B62D0()
{
  sub_1000B5F00(*v0);
  sub_1000EA330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000B6324()
{
  char v1 = *v0;
  sub_1000EABB0();
  sub_1000B5F00(v1);
  sub_1000EA330();
  swift_bridgeObjectRelease();
  return sub_1000EABE0();
}

uint64_t sub_1000B6384@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000BF9A4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000B63B4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000B5F00(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000B63E0()
{
  return sub_1000B6070(*v0);
}

uint64_t sub_1000B63E8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000BF9A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000B6410(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_1000B641C(uint64_t a1)
{
  unint64_t v2 = sub_1000BCD84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000B6458(uint64_t a1)
{
  unint64_t v2 = sub_1000BCD84();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000B658C(void *a1)
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results), "sections"));
  id v4 = [v3 array];

  uint64_t v5 = sub_1000EA470();
  unint64_t v6 = (unint64_t)sub_100084B00(v5);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000EA980();
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8)
    {
LABEL_3:
      unint64_t v9 = 0;
      unint64_t v22 = v6 & 0xC000000000000001;
      unint64_t v19 = v6 + 32;
      uint64_t v20 = v6 & 0xFFFFFFFFFFFFFF8;
      uint64_t v21 = v8;
      do
      {
        if (v22)
        {
          id v10 = (id)sub_1000EA870();
          BOOL v11 = __OFADD__(v9++, 1);
          if (v11)
          {
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
        }
        else
        {
          if (v9 >= *(void *)(v20 + 16))
          {
            __break(1u);
            return result;
          }
          id v10 = *(id *)(v19 + 8 * v9);
          BOOL v11 = __OFADD__(v9++, 1);
          if (v11) {
            goto LABEL_27;
          }
        }
        uint64_t v23 = v10;
        sub_100084480();
        unint64_t v13 = v12;
        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_1000EA980();
          swift_bridgeObjectRelease();
          if (v14)
          {
LABEL_13:
            uint64_t v15 = 0;
            unint64_t v6 = v13 & 0xC000000000000001;
            do
            {
              if (v6)
              {
                uint64_t v16 = sub_1000EA870();
                uint64_t v17 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_26;
                }
              }
              else
              {
                uint64_t v16 = *(void *)(v13 + 8 * v15 + 32);
                swift_unknownObjectRetain();
                uint64_t v17 = v15 + 1;
                if (__OFADD__(v15, 1))
                {
LABEL_26:
                  __break(1u);
                  goto LABEL_27;
                }
              }
              unsigned int v18 = [a1 isEqual:v16 v19];
              swift_unknownObjectRelease();
              if (v18)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();

                return v15;
              }
              ++v15;
            }
            while (v17 != v14);
          }
        }
        else
        {
          uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v14) {
            goto LABEL_13;
          }
        }

        uint64_t result = swift_bridgeObjectRelease();
      }
      while (v9 != v21);
    }
  }
  swift_bridgeObjectRelease();
  return -1;
}

uint64_t sub_1000B6868(void *a1)
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results), "sections"));
  id v4 = [v3 array];

  uint64_t v5 = sub_1000EA470();
  unint64_t v6 = sub_100084B00(v5);
  swift_bridgeObjectRelease();
  id v7 = a1;
  uint64_t v8 = sub_1000BFB00((unint64_t)v6, (uint64_t)v7);
  LOBYTE(v4) = v9;
  swift_bridgeObjectRelease();

  if (v4) {
    return -1;
  }
  if (v8 < 0)
  {
    sub_1000EA950();
    __break(1u);
    return -1;
  }
  return v8;
}

void *sub_1000B69E0()
{
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results);
  id v2 = [v1 sections];
  id v3 = [v2 array];

  uint64_t v4 = sub_1000EA470();
  uint64_t v5 = sub_100084B00(v4);

  swift_bridgeObjectRelease();
  sub_1000B6CB4();
  sub_100022374(0, (unint64_t *)&qword_1001371D0);
  sub_100022374(0, &qword_10013A3A0);
  sub_1000BF3CC();
  uint64_t v6 = sub_1000EA4A0();
  swift_bridgeObjectRelease();
  id v7 = sub_1000BF434((unint64_t)v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_1000B6CB4()
{
  uint64_t v1 = sub_1000E96F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  v470 = (char *)&v412 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v467 = (char *)&v412 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  v486 = (uint64_t)&v412 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v485 = (uint64_t)&v412 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v500 = (char *)&v412 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v501 = (char *)&v412 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v519 = (char *)&v412 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v518 = (char *)&v412 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v520 = (char *)&v412 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v543 = (char *)&v412 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v548 = (char *)&v412 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v536 = (char *)&v412 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v489 = (char *)&v412 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v484 = (char *)&v412 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v497 = (uint64_t)&v412 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v496 = (uint64_t)&v412 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v469 = (char *)&v412 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v466 = (char *)&v412 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  v483 = (uint64_t)&v412 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v482 = (uint64_t)&v412 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v488 = (char *)&v412 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v481 = (char *)&v412 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  v495 = (uint64_t)&v412 - v48;
  uint64_t v49 = __chkstk_darwin(v47);
  uint64_t v494 = (uint64_t)&v412 - v50;
  uint64_t v51 = __chkstk_darwin(v49);
  v468 = (char *)&v412 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  v465 = (char *)&v412 - v54;
  uint64_t v55 = __chkstk_darwin(v53);
  v480 = (uint64_t)&v412 - v56;
  uint64_t v57 = __chkstk_darwin(v55);
  uint64_t v479 = (uint64_t)&v412 - v58;
  uint64_t v59 = __chkstk_darwin(v57);
  v487 = (char *)&v412 - v60;
  uint64_t v61 = __chkstk_darwin(v59);
  v478 = (char *)&v412 - v62;
  uint64_t v63 = __chkstk_darwin(v61);
  v493 = (uint64_t)&v412 - v64;
  __chkstk_darwin(v63);
  uint64_t v492 = (uint64_t)&v412 - v65;
  uint64_t v66 = (int *)type metadata accessor for LayoutContext();
  uint64_t v67 = __chkstk_darwin(v66);
  uint64_t v69 = (char *)&v412 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __chkstk_darwin(v67);
  v441 = (char *)&v412 - v71;
  uint64_t v72 = __chkstk_darwin(v70);
  v440 = (char *)&v412 - v73;
  uint64_t v74 = __chkstk_darwin(v72);
  v439 = (char *)&v412 - v75;
  uint64_t v76 = __chkstk_darwin(v74);
  v438 = (char *)&v412 - v77;
  uint64_t v78 = __chkstk_darwin(v76);
  v437 = (char *)&v412 - v79;
  uint64_t v80 = __chkstk_darwin(v78);
  v436 = (char *)&v412 - v81;
  uint64_t v82 = __chkstk_darwin(v80);
  v435 = (char *)&v412 - v83;
  uint64_t v84 = __chkstk_darwin(v82);
  v434 = (char *)&v412 - v85;
  uint64_t v86 = __chkstk_darwin(v84);
  v433 = (char *)&v412 - v87;
  uint64_t v88 = __chkstk_darwin(v86);
  v432 = (char *)&v412 - v89;
  uint64_t v90 = __chkstk_darwin(v88);
  v431 = (char *)&v412 - v91;
  uint64_t v92 = __chkstk_darwin(v90);
  v430 = (char *)&v412 - v93;
  uint64_t v94 = __chkstk_darwin(v92);
  v429 = (char *)&v412 - v95;
  uint64_t v96 = __chkstk_darwin(v94);
  v428 = (char *)&v412 - v97;
  uint64_t v98 = __chkstk_darwin(v96);
  v427 = (char *)&v412 - v99;
  uint64_t v100 = __chkstk_darwin(v98);
  v426 = (char *)&v412 - v101;
  uint64_t v102 = __chkstk_darwin(v100);
  v425 = (char *)&v412 - v103;
  uint64_t v104 = __chkstk_darwin(v102);
  v424 = (char *)&v412 - v105;
  uint64_t v106 = __chkstk_darwin(v104);
  v423 = (char *)&v412 - v107;
  uint64_t v108 = __chkstk_darwin(v106);
  v422 = (char *)&v412 - v109;
  uint64_t v110 = __chkstk_darwin(v108);
  v421 = (char *)&v412 - v111;
  __chkstk_darwin(v110);
  v420 = (char *)&v412 - v112;
  uint64_t v113 = sub_1000E9F60();
  uint64_t v114 = *(void *)(v113 - 8);
  uint64_t v115 = __chkstk_darwin(v113);
  v464 = (char *)&v412 - ((v116 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __chkstk_darwin(v115);
  v463 = (char *)&v412 - v118;
  uint64_t v119 = __chkstk_darwin(v117);
  v517 = (char *)&v412 - v120;
  uint64_t v121 = __chkstk_darwin(v119);
  v516 = (char *)&v412 - v122;
  uint64_t v123 = __chkstk_darwin(v121);
  v477 = (char *)&v412 - v124;
  uint64_t v125 = __chkstk_darwin(v123);
  v476 = (char *)&v412 - v126;
  uint64_t v127 = __chkstk_darwin(v125);
  v462 = (char *)&v412 - v128;
  uint64_t v129 = __chkstk_darwin(v127);
  v461 = (char *)&v412 - v130;
  uint64_t v131 = __chkstk_darwin(v129);
  v515 = (char *)&v412 - v132;
  uint64_t v133 = __chkstk_darwin(v131);
  v514 = (char *)&v412 - v134;
  uint64_t v135 = __chkstk_darwin(v133);
  v513 = (char *)&v412 - v136;
  uint64_t v137 = __chkstk_darwin(v135);
  v475 = (char *)&v412 - v138;
  uint64_t v139 = __chkstk_darwin(v137);
  v474 = (char *)&v412 - v140;
  uint64_t v141 = __chkstk_darwin(v139);
  v460 = (char *)&v412 - v142;
  uint64_t v143 = __chkstk_darwin(v141);
  v459 = (char *)&v412 - v144;
  uint64_t v145 = __chkstk_darwin(v143);
  v512 = (char *)&v412 - v146;
  uint64_t v147 = __chkstk_darwin(v145);
  v473 = (char *)&v412 - v148;
  uint64_t v149 = __chkstk_darwin(v147);
  v472 = (char *)&v412 - v150;
  uint64_t v151 = __chkstk_darwin(v149);
  v511 = (char *)&v412 - v152;
  uint64_t v153 = __chkstk_darwin(v151);
  v510 = (char *)&v412 - v154;
  __chkstk_darwin(v153);
  v156 = (char *)&v412 - v155;
  v157 = (CGFloat *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect + 32))
  {
    return (void *)sub_1000B5594((uint64_t)_swiftEmptyArrayStorage);
  }
  v417 = v69;
  CGFloat v160 = v157[2];
  CGFloat v159 = v157[3];
  CGFloat v161 = *v157;
  CGFloat v162 = v157[1];
  id v163 = *(id *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results);
  v568.origin.x = v161;
  v568.origin.y = v162;
  v568.size.width = v160;
  v568.size.height = v159;
  CGFloat MinX = CGRectGetMinX(v568);
  v165 = (double *)(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_layoutContext);
  uint64_t v166 = v66[7];
  uint64_t v167 = (uint64_t)v165 + v166;
  double v168 = *(double *)((char *)v165 + v166);
  double v169 = ceil(MinX * v168);
  if (v168 >= v169) {
    double v170 = v169;
  }
  else {
    double v170 = *(double *)((char *)v165 + v166);
  }
  v569.origin.x = v161;
  v569.origin.y = v162;
  v569.size.width = v160;
  v569.size.height = v159;
  CGFloat MinY = CGRectGetMinY(v569);
  double v172 = *(double *)(v167 + 8);
  double v173 = ceil(MinY * v172);
  if (v172 >= v173) {
    double v174 = v173;
  }
  else {
    double v174 = *(double *)(v167 + 8);
  }
  v570.origin.x = v161;
  v570.origin.y = v162;
  v570.size.width = v160;
  v570.size.height = v159;
  double v175 = ceil(v168 * CGRectGetWidth(v570));
  if (v168 < v175) {
    double v175 = v168;
  }
  CGFloat v509 = v175;
  v571.origin.x = v161;
  v571.origin.y = v162;
  double v176 = v172;
  v571.size.width = v160;
  v571.size.height = v159;
  double v177 = ceil(v172 * CGRectGetHeight(v571));
  if (v172 >= v177) {
    CGFloat v178 = v177;
  }
  else {
    CGFloat v178 = v172;
  }
  uint64_t v179 = v66[6];
  v551 = v165;
  uint64_t v180 = (uint64_t)v165 + v179;
  v181 = *(void (**)(char *))(v114 + 104);
  int v538 = enum case for InternalWidgetFamily.systemSmall(_:);
  v181(v156);
  sub_1000BCE2C(&qword_10013A658, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
  char v182 = sub_1000EA240();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v156, v113);
  id v452 = v163;
  if (v182)
  {
    v574.origin.x = 0.0;
    v574.origin.y = 0.0;
    v572.origin.x = v170;
    v572.origin.y = v174;
    v572.size.width = v509;
    v572.size.height = v178;
    v574.size.width = v168;
    v574.size.height = v172;
    if (CGRectContainsRect(v572, v574))
    {
      id v183 = v452;
      id v184 = [v452 sections];
      id v185 = [v184 array];

      uint64_t v186 = sub_1000EA470();
      sub_100084B00(v186);
      swift_bridgeObjectRelease();
      sub_100022374(0, (unint64_t *)&qword_1001371D0);
      sub_10001B38C(&qword_10013A670);
      sub_1000BF3CC();
      unint64_t v187 = sub_1000EA4A0();

      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v187 = sub_1000B5594((uint64_t)_swiftEmptyArrayStorage);
    }
    return (void *)v187;
  }
  id v188 = [v163 sections];
  id v189 = [v188 array];

  uint64_t v190 = sub_1000EA470();
  unint64_t v191 = (unint64_t)sub_100084B00(v190);
  swift_bridgeObjectRelease();
  unint64_t v449 = v191;
  if (v191 >> 62)
  {
LABEL_495:
    swift_bridgeObjectRetain();
    uint64_t v192 = sub_1000EA980();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v192 = *(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  int v193 = v538;
  if (!v192)
  {

    swift_bridgeObjectRelease();
    return &_swiftEmptyDictionarySingleton;
  }
  unint64_t v194 = 0;
  v195 = (void (**)(char *, uint64_t, uint64_t))(v114 + 16);
  int v544 = enum case for InternalWidgetFamily.systemMedium(_:);
  v559 = (uint64_t (**)(char *, uint64_t))(v114 + 88);
  int v545 = enum case for InternalWidgetFamily.systemLarge(_:);
  int v540 = enum case for InternalWidgetFamily.newsLargeTall(_:);
  int v528 = enum case for InternalWidgetFamily.accessoryRectangular(_:);
  unsigned int v558 = enum case for ContentSizeCategory.extraSmall(_:);
  v552 = (void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  unsigned int v550 = enum case for ContentSizeCategory.medium(_:);
  unsigned int v542 = enum case for ContentSizeCategory.extraExtraLarge(_:);
  unsigned int v541 = enum case for ContentSizeCategory.accessibilityMedium(_:);
  v553 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  v557 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v556 = (uint64_t (**)(char *, uint64_t))(v2 + 88);
  int v549 = enum case for ContentSizeCategory.small(_:);
  int v529 = enum case for ContentSizeCategory.large(_:);
  int v526 = enum case for ContentSizeCategory.extraLarge(_:);
  int v491 = enum case for ContentSizeCategory.extraExtraExtraLarge(_:);
  int v455 = enum case for ContentSizeCategory.accessibilityLarge(_:);
  int v448 = enum case for ContentSizeCategory.accessibilityExtraLarge(_:);
  int v443 = enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:);
  int v419 = enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:);
  UIContentSizeCategory v413 = UIContentSizeCategoryUnspecified;
  UIContentSizeCategory v412 = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  UIContentSizeCategory v414 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  UIContentSizeCategory v415 = UIContentSizeCategoryAccessibilityExtraLarge;
  UIContentSizeCategory v416 = UIContentSizeCategoryAccessibilityLarge;
  UIContentSizeCategory v418 = UIContentSizeCategoryAccessibilityMedium;
  UIContentSizeCategory v442 = UIContentSizeCategoryExtraExtraExtraLarge;
  UIContentSizeCategory v446 = UIContentSizeCategoryExtraExtraLarge;
  UIContentSizeCategory v453 = UIContentSizeCategoryExtraLarge;
  UIContentSizeCategory v458 = UIContentSizeCategoryLarge;
  UIContentSizeCategory v490 = UIContentSizeCategoryMedium;
  double v196 = 0.0;
  UIContentSizeCategory v498 = UIContentSizeCategorySmall;
  UIContentSizeCategory v525 = UIContentSizeCategoryExtraSmall;
  unint64_t v451 = v449 & 0xC000000000000001;
  uint64_t v445 = v449 & 0xFFFFFFFFFFFFFF8;
  unint64_t v444 = v449 + 32;
  v457 = &_swiftEmptyDictionarySingleton;
  double v504 = v176;
  uint64_t v537 = v180;
  v539 = (void (**)(char *, uint64_t, uint64_t))(v114 + 16);
  uint64_t v508 = v113;
  v507 = v66;
  uint64_t v547 = v1;
  CGFloat v506 = v168;
  CGFloat v505 = v170;
  CGFloat v503 = v174;
  uint64_t v450 = v192;
  while (1)
  {
    if (v451)
    {
      id v203 = (id)sub_1000EA870();
    }
    else
    {
      if (v194 >= *(void *)(v445 + 16)) {
        goto LABEL_494;
      }
      id v203 = *(id *)(v444 + 8 * v194);
    }
    id v471 = v203;
    BOOL v204 = __OFADD__(v194, 1);
    unint64_t v205 = v194 + 1;
    if (v204)
    {
LABEL_493:
      __break(1u);
LABEL_494:
      __break(1u);
      goto LABEL_495;
    }
    unint64_t v456 = v205;
    v206 = v551;
    id v207 = sub_1000812DC();
    [v207 nt_scaledValueForValue:1.0 v412];
    double v209 = v208;

    double v210 = *v206;
    unint64_t v562 = (unint64_t)_swiftEmptyArrayStorage;
    sub_100084480();
    unint64_t v212 = v211;
    if (v211 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v114 = sub_1000EA980();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v114 = *(void *)((v211 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    double v213 = v196 + v209 * 12.0 + v210 + 6.0;
    if (v114) {
      break;
    }
    swift_bridgeObjectRelease();
    v197 = _swiftEmptyArrayStorage;
LABEL_24:
    uint64_t v2 = (uint64_t)v471;
    unint64_t v198 = (unint64_t)v457;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v560 = v198;
    sub_1000BE28C((uint64_t)v197, (void *)v2, isUniquelyReferenced_nonNull_native);
    v457 = (void *)v560;

    swift_bridgeObjectRelease();
    double v200 = v551[1];
    sub_1000816D8();
    double v202 = v201;

    double v196 = v213 + v200 - v202;
    unint64_t v194 = v456;
    v195 = v539;
    if (v456 == v450)
    {

      swift_bridgeObjectRelease();
      return v457;
    }
  }
  unint64_t v523 = v212 & 0xC000000000000001;
  uint64_t v2 = 4;
  unint64_t v522 = v212;
  uint64_t v521 = v114;
  while (1)
  {
    uint64_t v214 = v2 - 4;
    if (v523)
    {
      id v546 = (id)sub_1000EA870();
      uint64_t v215 = v2 - 3;
      if (__OFADD__(v214, 1)) {
        goto LABEL_492;
      }
    }
    else
    {
      id v546 = *(id *)(v212 + 8 * v2);
      swift_unknownObjectRetain();
      uint64_t v215 = v2 - 3;
      if (__OFADD__(v214, 1))
      {
LABEL_492:
        __break(1u);
        goto LABEL_493;
      }
    }
    uint64_t v534 = v215;
    uint64_t v535 = v2;
    id v532 = [v546 itemType];
    v216 = *v195;
    v217 = v510;
    (*v195)(v510, v180, v113);
    v218 = *v559;
    int v219 = (*v559)(v217, v113);
    if (v219 == v193)
    {
      uint64_t v404 = (uint64_t)v551;
      v405 = &v453;
LABEL_499:
      sub_1000BF66C(v404, (uint64_t)*(v405 - 32), (uint64_t (*)(void))type metadata accessor for LayoutContext);
      unint64_t v560 = 0;
      unint64_t v561 = 0xE000000000000000;
      sub_1000EA840(46);
      swift_bridgeObjectRelease();
      unint64_t v560 = 0xD00000000000002CLL;
      unint64_t v561 = 0x80000001000FF5B0;
      sub_1000BCE2C((unint64_t *)&unk_10013A660, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
      v564._countAndFlagsBits = sub_1000EAB10();
      sub_1000EA370(v564);
      swift_bridgeObjectRelease();
      goto LABEL_513;
    }
    double v220 = 4.5;
    int v221 = v544;
    if (v219 != v544)
    {
      double v220 = 6.0;
      if (v219 != v545 && v219 != v540)
      {
        double v220 = 1.0;
        if (v219 != v528)
        {
          uint64_t v404 = (uint64_t)v551;
          v405 = (UIContentSizeCategory *)&v454;
          goto LABEL_499;
        }
      }
    }
    double v533 = v220;
    v222 = v511;
    v216(v511, v180, v113);
    int v223 = v218(v222, v113);
    double v174 = v176;
    if (v223 != v193)
    {
      if (v223 == v221)
      {
        v224 = v472;
        v216(v472, v180, v113);
        int v225 = v218(v224, v113);
        if (v225 == v193) {
          goto LABEL_48;
        }
        if (v225 == v221 || v225 == v545 || v225 == v540)
        {
          v226 = *v552;
          (*v552)((char *)v493, v558, v1);
          goto LABEL_57;
        }
        if (v225 == v528)
        {
LABEL_48:
          v226 = *v552;
          (*v552)((char *)v493, v550, v1);
LABEL_57:
          v230 = v473;
          v216(v473, v180, v113);
          int v231 = v218(v230, v113);
          uint64_t v232 = v541;
          if (v231 != v193)
          {
            uint64_t v232 = v542;
            if (v231 != v544)
            {
              uint64_t v232 = v542;
              if (v231 != v545)
              {
                uint64_t v232 = v542;
                if (v231 != v540)
                {
                  uint64_t v232 = v541;
                  if (v231 != v528)
                  {
                    uint64_t v408 = (uint64_t)v551;
                    v409 = &v457;
                    goto LABEL_511;
                  }
                }
              }
            }
          }
          uint64_t v233 = (uint64_t)v478;
          v226(v478, v232, v1);
          uint64_t v234 = v492;
          uint64_t v235 = v493;
          sub_100076874(v493, v233, v492);
          v236 = *v553;
          (*v553)(v233, v1);
          v236(v235, v1);
          v237 = v487;
          (*v557)(v487, v234, v1);
          int v238 = (*v556)(v237, v1);
          if (v238 == v558)
          {
            v239 = v525;
            uint64_t v180 = v537;
          }
          else
          {
            uint64_t v180 = v537;
            if (v238 == v549)
            {
              v240 = (uint64_t *)&v532;
            }
            else if (v238 == v550)
            {
              v240 = (uint64_t *)&v522;
            }
            else if (v238 == v529)
            {
              v240 = (uint64_t *)&v490;
            }
            else if (v238 == v526)
            {
              v240 = &v486;
            }
            else if (v238 == v542)
            {
              v240 = &v480;
            }
            else if (v238 == v491)
            {
              v240 = (uint64_t *)&v476;
            }
            else if (v238 == v541)
            {
              v240 = (uint64_t *)&v451;
            }
            else if (v238 == v455)
            {
              v240 = (uint64_t *)&v449;
            }
            else if (v238 == v448)
            {
              v240 = (uint64_t *)v447;
            }
            else if (v238 == v443)
            {
              v240 = (uint64_t *)&v446;
            }
            else
            {
              if (v238 != v419)
              {
                v239 = v413;
                v236((uint64_t)v487, v1);
                goto LABEL_124;
              }
              v240 = (uint64_t *)&v444;
            }
            v239 = (NSString *)(id)*(v240 - 32);
          }
LABEL_124:
          v251 = self;
          v236(v492, v1);
          id v252 = [v251 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v239];
          *(double *)&uint64_t v253 = 45.0;
LABEL_129:
          double v255 = *(double *)&v253;
          id v256 = v252;

          [v256 nt_scaledValueForValue:1.0];
          double v258 = v257;

          double v174 = v258 * v255;
          int v193 = v538;
          int v221 = v544;
          goto LABEL_130;
        }
        uint64_t v410 = (uint64_t)v551;
        v411 = (char **)&v456;
LABEL_512:
        sub_1000BF66C(v410, (uint64_t)*(v411 - 32), (uint64_t (*)(void))type metadata accessor for LayoutContext);
        unint64_t v560 = 0;
        unint64_t v561 = 0xE000000000000000;
        sub_1000EA840(49);
        swift_bridgeObjectRelease();
        unint64_t v560 = 0xD00000000000002FLL;
        unint64_t v561 = 0x80000001000FF550;
        sub_1000BCE2C((unint64_t *)&unk_10013A660, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
        v567._countAndFlagsBits = sub_1000EAB10();
        sub_1000EA370(v567);
        swift_bridgeObjectRelease();
        goto LABEL_513;
      }
      if (v223 == v545 || v223 == v540)
      {
        v227 = v459;
        v216(v459, v180, v113);
        int v228 = v218(v227, v113);
        if (v228 == v193) {
          goto LABEL_54;
        }
        if (v228 == v221 || v228 == v545 || v228 == v540)
        {
          v229 = *v552;
          (*v552)((char *)v480, v558, v1);
        }
        else
        {
          if (v228 != v528)
          {
            uint64_t v410 = (uint64_t)v551;
            v411 = &v459;
            goto LABEL_512;
          }
LABEL_54:
          v229 = *v552;
          (*v552)((char *)v480, v550, v1);
        }
        v241 = v460;
        v216(v460, v180, v113);
        int v242 = v218(v241, v113);
        uint64_t v243 = v541;
        if (v242 != v193)
        {
          uint64_t v243 = v542;
          if (v242 != v544)
          {
            uint64_t v243 = v542;
            if (v242 != v545)
            {
              uint64_t v243 = v542;
              if (v242 != v540)
              {
                uint64_t v243 = v541;
                if (v242 != v528)
                {
                  uint64_t v408 = (uint64_t)v551;
                  v409 = (void **)&v460;
                  goto LABEL_511;
                }
              }
            }
          }
        }
        uint64_t v244 = (uint64_t)v465;
        v229(v465, v243, v1);
        uint64_t v245 = v479;
        uint64_t v246 = v480;
        sub_100076874(v480, v244, v479);
        v247 = *v553;
        (*v553)(v244, v1);
        v247(v246, v1);
        v248 = v468;
        (*v557)(v468, v245, v1);
        int v249 = (*v556)(v248, v1);
        if (v249 == v558)
        {
          v239 = v525;
          uint64_t v180 = v537;
        }
        else
        {
          uint64_t v180 = v537;
          if (v249 == v549)
          {
            v250 = (uint64_t *)&v532;
          }
          else if (v249 == v550)
          {
            v250 = (uint64_t *)&v522;
          }
          else if (v249 == v529)
          {
            v250 = (uint64_t *)&v490;
          }
          else if (v249 == v526)
          {
            v250 = &v486;
          }
          else if (v249 == v542)
          {
            v250 = &v480;
          }
          else if (v249 == v491)
          {
            v250 = (uint64_t *)&v476;
          }
          else if (v249 == v541)
          {
            v250 = (uint64_t *)&v451;
          }
          else if (v249 == v455)
          {
            v250 = (uint64_t *)&v449;
          }
          else if (v249 == v448)
          {
            v250 = (uint64_t *)v447;
          }
          else if (v249 == v443)
          {
            v250 = (uint64_t *)&v446;
          }
          else
          {
            if (v249 != v419)
            {
              v239 = v413;
              v247((uint64_t)v468, v1);
              goto LABEL_128;
            }
            v250 = (uint64_t *)&v444;
          }
          v239 = (NSString *)(id)*(v250 - 32);
        }
LABEL_128:
        v254 = self;
        v247(v479, v1);
        id v252 = [v254 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v239];
        *(double *)&uint64_t v253 = 72.0;
        goto LABEL_129;
      }
      double v174 = v176;
      if (v223 != v528)
      {
        uint64_t v406 = (uint64_t)v551;
        v407 = &v458;
        goto LABEL_503;
      }
    }
LABEL_130:
    double v168 = *(double *)((char *)v551 + v66[10]);
    v259 = v512;
    v216(v512, v180, v113);
    int v260 = v218(v259, v113);
    double v261 = v176;
    if (v260 == v193) {
      goto LABEL_216;
    }
    if (v260 != v221)
    {
      if (v260 != v545 && v260 != v540)
      {
        double v261 = v176;
        if (v260 == v528) {
          goto LABEL_216;
        }
        uint64_t v406 = (uint64_t)v551;
        v407 = (UIContentSizeCategory *)&v463;
LABEL_503:
        sub_1000BF66C(v406, (uint64_t)*(v407 - 32), (uint64_t (*)(void))type metadata accessor for LayoutContext);
        unint64_t v560 = 0;
        unint64_t v561 = 0xE000000000000000;
        sub_1000EA840(43);
        swift_bridgeObjectRelease();
        unint64_t v560 = 0xD000000000000029;
        unint64_t v561 = 0x80000001000FF580;
        sub_1000BCE2C((unint64_t *)&unk_10013A660, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
        v565._countAndFlagsBits = sub_1000EAB10();
        sub_1000EA370(v565);
        swift_bridgeObjectRelease();
        goto LABEL_513;
      }
      v265 = v461;
      v216(v461, v180, v113);
      int v266 = v218(v265, v113);
      if (v266 != v193)
      {
        if (v266 == v221 || v266 == v545 || v266 == v540)
        {
          v267 = *v552;
          (*v552)((char *)v483, v558, v1);
          goto LABEL_153;
        }
        if (v266 != v528)
        {
          uint64_t v410 = (uint64_t)v551;
          v411 = &v468;
          goto LABEL_512;
        }
      }
      v267 = *v552;
      (*v552)((char *)v483, v550, v1);
LABEL_153:
      v279 = v462;
      v216(v462, v180, v113);
      int v280 = v218(v279, v113);
      uint64_t v281 = v541;
      if (v280 != v193)
      {
        uint64_t v281 = v542;
        if (v280 != v544)
        {
          uint64_t v281 = v542;
          if (v280 != v545)
          {
            uint64_t v281 = v542;
            if (v280 != v540)
            {
              uint64_t v281 = v541;
              if (v280 != v528)
              {
                uint64_t v408 = (uint64_t)v551;
                v409 = (void **)&v469;
                goto LABEL_511;
              }
            }
          }
        }
      }
      uint64_t v282 = (uint64_t)v466;
      v267(v466, v281, v1);
      uint64_t v283 = v482;
      uint64_t v284 = v483;
      sub_100076874(v483, v282, v482);
      v285 = *v553;
      (*v553)(v282, v1);
      v285(v284, v1);
      v286 = v469;
      (*v557)(v469, v283, v1);
      int v287 = (*v556)(v286, v1);
      if (v287 == v558)
      {
        v277 = v525;
        uint64_t v180 = v537;
      }
      else
      {
        uint64_t v180 = v537;
        if (v287 == v549)
        {
          v288 = (uint64_t *)&v532;
        }
        else if (v287 == v550)
        {
          v288 = (uint64_t *)&v522;
        }
        else if (v287 == v529)
        {
          v288 = (uint64_t *)&v490;
        }
        else if (v287 == v526)
        {
          v288 = &v486;
        }
        else if (v287 == v542)
        {
          v288 = &v480;
        }
        else if (v287 == v491)
        {
          v288 = (uint64_t *)&v476;
        }
        else if (v287 == v541)
        {
          v288 = (uint64_t *)&v451;
        }
        else if (v287 == v455)
        {
          v288 = (uint64_t *)&v449;
        }
        else if (v287 == v448)
        {
          v288 = (uint64_t *)v447;
        }
        else if (v287 == v443)
        {
          v288 = (uint64_t *)&v446;
        }
        else
        {
          if (v287 != v419)
          {
            v277 = v413;
            v285((uint64_t)v469, v1);
            goto LABEL_214;
          }
          v288 = (uint64_t *)&v444;
        }
        v277 = (NSString *)(id)*(v288 - 32);
      }
LABEL_214:
      v292 = self;
      v285(v482, v1);
      id v290 = [v292 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v277];
      *(double *)&uint64_t v291 = 72.0;
      goto LABEL_215;
    }
    v262 = v474;
    v216(v474, v180, v113);
    int v263 = v218(v262, v113);
    if (v263 != v193)
    {
      if (v263 == v221 || v263 == v545 || v263 == v540)
      {
        v264 = *v552;
        (*v552)((char *)v495, v558, v1);
        goto LABEL_142;
      }
      if (v263 != v528)
      {
        uint64_t v410 = (uint64_t)v551;
        v411 = &v461;
        goto LABEL_512;
      }
    }
    v264 = *v552;
    (*v552)((char *)v495, v550, v1);
LABEL_142:
    v268 = v475;
    v216(v475, v180, v113);
    int v269 = v218(v268, v113);
    uint64_t v270 = v541;
    if (v269 != v193)
    {
      uint64_t v270 = v542;
      if (v269 != v544)
      {
        uint64_t v270 = v542;
        if (v269 != v545)
        {
          uint64_t v270 = v542;
          if (v269 != v540)
          {
            uint64_t v270 = v541;
            if (v269 != v528)
            {
              uint64_t v408 = (uint64_t)v551;
              v409 = (void **)&v462;
              goto LABEL_511;
            }
          }
        }
      }
    }
    uint64_t v271 = (uint64_t)v481;
    v264(v481, v270, v1);
    uint64_t v272 = v494;
    uint64_t v273 = v495;
    sub_100076874(v495, v271, v494);
    v274 = *v553;
    (*v553)(v271, v1);
    v274(v273, v1);
    v275 = v488;
    (*v557)(v488, v272, v1);
    int v276 = (*v556)(v275, v1);
    if (v276 == v558)
    {
      v277 = v525;
      uint64_t v180 = v537;
    }
    else
    {
      uint64_t v180 = v537;
      if (v276 == v549)
      {
        v278 = (uint64_t *)&v532;
      }
      else if (v276 == v550)
      {
        v278 = (uint64_t *)&v522;
      }
      else if (v276 == v529)
      {
        v278 = (uint64_t *)&v490;
      }
      else if (v276 == v526)
      {
        v278 = &v486;
      }
      else if (v276 == v542)
      {
        v278 = &v480;
      }
      else if (v276 == v491)
      {
        v278 = (uint64_t *)&v476;
      }
      else if (v276 == v541)
      {
        v278 = (uint64_t *)&v451;
      }
      else if (v276 == v455)
      {
        v278 = (uint64_t *)&v449;
      }
      else if (v276 == v448)
      {
        v278 = (uint64_t *)v447;
      }
      else if (v276 == v443)
      {
        v278 = (uint64_t *)&v446;
      }
      else
      {
        if (v276 != v419)
        {
          v277 = v413;
          v274((uint64_t)v488, v1);
          goto LABEL_209;
        }
        v278 = (uint64_t *)&v444;
      }
      v277 = (NSString *)(id)*(v278 - 32);
    }
LABEL_209:
    v289 = self;
    v274(v494, v1);
    id v290 = [v289 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v277];
    *(double *)&uint64_t v291 = 45.0;
LABEL_215:
    double v293 = *(double *)&v291;
    id v294 = v290;

    [v294 nt_scaledValueForValue:1.0];
    double v296 = v295;

    double v261 = v296 * v293;
    int v193 = v538;
    int v221 = v544;
LABEL_216:
    v297 = v513;
    v216(v513, v180, v113);
    int v298 = v218(v297, v113);
    if (v298 == v193)
    {
      uint64_t v404 = (uint64_t)v551;
      v405 = (UIContentSizeCategory *)&v464;
      goto LABEL_499;
    }
    double v170 = 9.0;
    if (v298 != v221)
    {
      double v170 = 12.0;
      if (v298 != v545 && v298 != v540)
      {
        double v170 = 2.0;
        if (v298 != v528)
        {
          uint64_t v404 = (uint64_t)v551;
          v405 = (UIContentSizeCategory *)&v465;
          goto LABEL_499;
        }
      }
    }
    v299 = v514;
    v216(v514, v180, v113);
    int v300 = v218(v299, v113);
    if (v300 == v193)
    {
      uint64_t v404 = (uint64_t)v551;
      v405 = (UIContentSizeCategory *)&v466;
      goto LABEL_499;
    }
    double v301 = 4.5;
    if (v300 != v221)
    {
      double v301 = 6.0;
      if (v300 != v545 && v300 != v540)
      {
        double v301 = 1.0;
        if (v300 != v528)
        {
          uint64_t v404 = (uint64_t)v551;
          v405 = (UIContentSizeCategory *)&v467;
          goto LABEL_499;
        }
      }
    }
    double v531 = v261;
    v302 = v515;
    v216(v515, v180, v113);
    int v303 = v218(v302, v113);
    double v304 = v176;
    if (v303 == v193) {
      goto LABEL_312;
    }
    if (v303 == v221)
    {
      v305 = v476;
      v216(v476, v180, v113);
      int v306 = v218(v305, v113);
      if (v306 == v193) {
        goto LABEL_229;
      }
      if (v306 == v221 || v306 == v545 || v306 == v540)
      {
        v307 = *v552;
        (*v552)((char *)v497, v558, v1);
      }
      else
      {
        if (v306 != v528)
        {
          uint64_t v410 = (uint64_t)v551;
          v411 = &v470;
          goto LABEL_512;
        }
LABEL_229:
        v307 = *v552;
        (*v552)((char *)v497, v550, v1);
      }
      v311 = v477;
      v216(v477, v180, v113);
      int v312 = v218(v311, v113);
      uint64_t v313 = v541;
      if (v312 != v193)
      {
        uint64_t v313 = v542;
        if (v312 != v544)
        {
          uint64_t v313 = v542;
          if (v312 != v545)
          {
            uint64_t v313 = v542;
            if (v312 != v540)
            {
              uint64_t v313 = v541;
              if (v312 != v528)
              {
                uint64_t v408 = (uint64_t)v551;
                v409 = &v471;
                goto LABEL_511;
              }
            }
          }
        }
      }
      uint64_t v314 = (uint64_t)v484;
      v307(v484, v313, v1);
      uint64_t v315 = v496;
      uint64_t v316 = v497;
      sub_100076874(v497, v314, v496);
      v317 = *v553;
      (*v553)(v314, v1);
      v317(v316, v1);
      v318 = v489;
      (*v557)(v489, v315, v1);
      int v319 = (*v556)(v318, v1);
      if (v319 == v558)
      {
        v320 = v525;
        uint64_t v180 = v537;
        goto LABEL_305;
      }
      uint64_t v180 = v537;
      if (v319 == v549)
      {
        v321 = (uint64_t *)&v532;
        goto LABEL_304;
      }
      if (v319 == v550)
      {
        v321 = (uint64_t *)&v522;
        goto LABEL_304;
      }
      if (v319 == v529)
      {
        v321 = (uint64_t *)&v490;
        goto LABEL_304;
      }
      if (v319 == v526)
      {
        v321 = &v486;
        goto LABEL_304;
      }
      if (v319 == v542)
      {
        v321 = &v480;
        goto LABEL_304;
      }
      if (v319 == v491)
      {
        v321 = (uint64_t *)&v476;
        goto LABEL_304;
      }
      if (v319 == v541)
      {
        v321 = (uint64_t *)&v451;
        goto LABEL_304;
      }
      if (v319 == v455)
      {
        v321 = (uint64_t *)&v449;
        goto LABEL_304;
      }
      if (v319 == v448)
      {
        v321 = (uint64_t *)v447;
        goto LABEL_304;
      }
      if (v319 == v443)
      {
        v321 = (uint64_t *)&v446;
        goto LABEL_304;
      }
      if (v319 == v419)
      {
        v321 = (uint64_t *)&v444;
LABEL_304:
        v320 = (NSString *)(id)*(v321 - 32);
      }
      else
      {
        v320 = v413;
        v317((uint64_t)v489, v1);
      }
LABEL_305:
      v332 = self;
      v317(v496, v1);
      id v333 = [v332 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v320];
      *(double *)&uint64_t v334 = 45.0;
LABEL_311:
      double v336 = *(double *)&v334;
      id v337 = v333;

      [v337 nt_scaledValueForValue:1.0];
      double v339 = v338;

      double v304 = v339 * v336;
      int v193 = v538;
      int v221 = v544;
      goto LABEL_312;
    }
    if (v303 == v545 || v303 == v540) {
      break;
    }
    double v304 = v176;
    if (v303 != v528)
    {
      uint64_t v406 = (uint64_t)v551;
      v407 = (UIContentSizeCategory *)&v472;
      goto LABEL_503;
    }
LABEL_312:
    v340 = v516;
    v216(v516, v180, v113);
    int v341 = v218(v340, v113);
    if (v341 != v193)
    {
      if (v341 == v221 || v341 == v545 || v341 == v540)
      {
        v342 = *v552;
        (*v552)(v548, v558, v1);
        goto LABEL_316;
      }
      if (v341 != v528)
      {
        uint64_t v410 = (uint64_t)v551;
        v411 = &v473;
        goto LABEL_512;
      }
    }
    v342 = *v552;
    (*v552)(v548, v550, v1);
LABEL_316:
    v343 = v517;
    v216(v517, v180, v113);
    int v344 = v218(v343, v113);
    uint64_t v345 = v541;
    if (v344 != v193)
    {
      uint64_t v345 = v542;
      if (v344 != v544)
      {
        uint64_t v345 = v542;
        if (v344 != v545)
        {
          uint64_t v345 = v542;
          if (v344 != v540)
          {
            uint64_t v345 = v541;
            if (v344 != v528)
            {
              uint64_t v408 = (uint64_t)v551;
              v409 = (void **)&v474;
              goto LABEL_511;
            }
          }
        }
      }
    }
    v342(v543, v345, v1);
    v346 = *v557;
    v347 = v520;
    v530 = (char *)v551 + v66[8];
    v554 = v346;
    ((void (*)(char *))v346)(v520);
    v555 = *v556;
    int v348 = v555(v347, v1);
    int v349 = v348;
    BOOL v351 = v348 == v558 || v348 == v549;
    BOOL v527 = v351;
    int v352 = v348 == v550 || v351;
    int v353 = 1;
    int v524 = v352;
    char v354 = 1;
    char v355 = 1;
    char v356 = 1;
    char v357 = 1;
    char v358 = 1;
    char v359 = 1;
    char v360 = 1;
    if ((v352 & 1) == 0 && v348 != v529)
    {
      if (v348 == v526) {
        goto LABEL_347;
      }
      if (v348 == v542) {
        goto LABEL_346;
      }
      if (v348 == v491) {
        goto LABEL_345;
      }
      if (v348 == v541) {
        goto LABEL_344;
      }
      if (v348 == v455) {
        goto LABEL_343;
      }
      if (v348 == v448) {
        goto LABEL_342;
      }
      if (v348 == v443) {
        goto LABEL_341;
      }
      if (v348 == v419)
      {
        int v353 = 0;
LABEL_341:
        char v354 = 0;
LABEL_342:
        char v355 = 0;
LABEL_343:
        char v356 = 0;
LABEL_344:
        char v357 = 0;
LABEL_345:
        char v358 = 0;
LABEL_346:
        char v359 = 0;
LABEL_347:
        char v360 = 0;
        goto LABEL_348;
      }
      (*v553)((uint64_t)v520, v547);
      int v353 = 1;
    }
LABEL_348:
    int v502 = v353;
    v361 = v518;
    uint64_t v362 = v547;
    v554(v518, (uint64_t)v548, v547);
    int v363 = v555(v361, v362);
    if (v363 == v558) {
      goto LABEL_349;
    }
    if (v363 == v549)
    {
      v380 = v548;
      if (v349 == v558) {
        goto LABEL_401;
      }
      goto LABEL_349;
    }
    if (v363 == v550)
    {
      v380 = v548;
      v381 = (char *)&v562 + 4;
      goto LABEL_395;
    }
    if (v363 == v529)
    {
      v380 = v548;
      v381 = (char *)&v560 + 4;
      goto LABEL_395;
    }
    if (v363 == v526)
    {
      v380 = v548;
      if (v360) {
        goto LABEL_401;
      }
    }
    else if (v363 == v542)
    {
      v380 = v548;
      if (v359) {
        goto LABEL_401;
      }
    }
    else if (v363 == v491)
    {
      v380 = v548;
      if (v358) {
        goto LABEL_401;
      }
    }
    else if (v363 == v541)
    {
      v380 = v548;
      if (v357) {
        goto LABEL_401;
      }
    }
    else if (v363 == v455)
    {
      v380 = v548;
      if (v356) {
        goto LABEL_401;
      }
    }
    else if (v363 == v448)
    {
      v380 = v548;
      if (v355) {
        goto LABEL_401;
      }
    }
    else if (v363 == v443)
    {
      v380 = v548;
      if (v354) {
        goto LABEL_401;
      }
    }
    else
    {
      if (v363 == v419)
      {
        v380 = v548;
        v381 = (char *)&v536 + 4;
LABEL_395:
        if (*((_DWORD *)v381 - 64)) {
          goto LABEL_401;
        }
        goto LABEL_349;
      }
      (*v553)((uint64_t)v518, v547);
      v380 = v548;
      if (v524) {
        goto LABEL_401;
      }
    }
LABEL_349:
    v364 = v501;
    uint64_t v365 = v547;
    v554(v501, (uint64_t)v543, v547);
    int v366 = v555(v364, v365);
    int v367 = v366;
    BOOL v369 = v366 == v558 || v366 == v549;
    BOOL v527 = v369;
    int v370 = v366 == v550 || v369;
    int v371 = 1;
    int v524 = v370;
    int v372 = 1;
    char v373 = 1;
    char v374 = 1;
    char v375 = 1;
    char v376 = 1;
    char v377 = 1;
    char v378 = 1;
    if (v370)
    {
      v379 = v530;
    }
    else
    {
      v379 = v530;
      if (v366 == v529) {
        goto LABEL_386;
      }
      if (v366 == v526) {
        goto LABEL_375;
      }
      if (v366 == v542) {
        goto LABEL_374;
      }
      if (v366 == v491) {
        goto LABEL_373;
      }
      if (v366 == v541) {
        goto LABEL_372;
      }
      if (v366 == v455) {
        goto LABEL_371;
      }
      if (v366 == v448) {
        goto LABEL_370;
      }
      if (v366 == v443) {
        goto LABEL_369;
      }
      if (v366 == v419)
      {
        int v371 = 0;
LABEL_369:
        int v372 = 0;
LABEL_370:
        char v373 = 0;
LABEL_371:
        char v374 = 0;
LABEL_372:
        char v375 = 0;
LABEL_373:
        char v376 = 0;
LABEL_374:
        char v377 = 0;
LABEL_375:
        char v378 = 0;
        goto LABEL_386;
      }
      (*v553)((uint64_t)v501, v547);
      v379 = v530;
      int v371 = 1;
      int v372 = 1;
    }
LABEL_386:
    int v502 = v372;
    int v499 = v371;
    v382 = v500;
    uint64_t v383 = v547;
    v554(v500, (uint64_t)v379, v547);
    int v384 = v555(v382, v383);
    if (v384 == v558)
    {
      v380 = v379;
      goto LABEL_401;
    }
    if (v384 == v549)
    {
      v380 = v543;
      if (v367 != v558) {
        goto LABEL_400;
      }
      goto LABEL_401;
    }
    if (v384 == v550)
    {
      v380 = v543;
      v385 = (char *)&v562 + 4;
LABEL_399:
      if (*((_DWORD *)v385 - 64)) {
        goto LABEL_401;
      }
LABEL_400:
      v380 = v530;
      goto LABEL_401;
    }
    if (v384 == v529) {
      goto LABEL_398;
    }
    if (v384 == v526)
    {
      v380 = v543;
      if ((v378 & 1) == 0) {
        goto LABEL_400;
      }
    }
    else if (v384 == v542)
    {
      v380 = v543;
      if ((v377 & 1) == 0) {
        goto LABEL_400;
      }
    }
    else if (v384 == v491)
    {
      v380 = v543;
      if ((v376 & 1) == 0) {
        goto LABEL_400;
      }
    }
    else if (v384 == v541)
    {
      v380 = v543;
      if ((v375 & 1) == 0) {
        goto LABEL_400;
      }
    }
    else if (v384 == v455)
    {
      v380 = v543;
      if ((v374 & 1) == 0) {
        goto LABEL_400;
      }
    }
    else
    {
      if (v384 != v448)
      {
        if (v384 == v443)
        {
          v380 = v543;
          v385 = (char *)&v536 + 4;
        }
        else if (v384 == v419)
        {
          v380 = v543;
          v385 = (char *)&v533 + 4;
        }
        else
        {
          (*v553)((uint64_t)v500, v547);
LABEL_398:
          v380 = v543;
          v385 = (char *)&v560 + 4;
        }
        goto LABEL_399;
      }
      v380 = v543;
      if ((v373 & 1) == 0) {
        goto LABEL_400;
      }
    }
LABEL_401:
    v386 = v536;
    uint64_t v1 = v547;
    v387 = v554;
    v554(v536, (uint64_t)v380, v547);
    v388 = *v553;
    (*v553)((uint64_t)v543, v1);
    v388((uint64_t)v548, v1);
    v389 = v519;
    v387(v519, (uint64_t)v386, v1);
    int v390 = v555(v389, v1);
    if (v390 == v558)
    {
      v391 = v525;
      uint64_t v113 = v508;
      uint64_t v66 = v507;
      uint64_t v180 = v537;
      unint64_t v212 = v522;
      uint64_t v114 = v521;
      uint64_t v392 = v535;
      id v393 = v532;
    }
    else
    {
      uint64_t v113 = v508;
      uint64_t v66 = v507;
      uint64_t v180 = v537;
      unint64_t v212 = v522;
      uint64_t v114 = v521;
      uint64_t v392 = v535;
      id v393 = v532;
      if (v390 == v549)
      {
        v394 = (uint64_t *)&v532;
      }
      else if (v390 == v550)
      {
        v394 = (uint64_t *)&v522;
      }
      else if (v390 == v529)
      {
        v394 = (uint64_t *)&v490;
      }
      else if (v390 == v526)
      {
        v394 = &v486;
      }
      else if (v390 == v542)
      {
        v394 = &v480;
      }
      else if (v390 == v491)
      {
        v394 = (uint64_t *)&v476;
      }
      else if (v390 == v541)
      {
        v394 = (uint64_t *)&v451;
      }
      else if (v390 == v455)
      {
        v394 = (uint64_t *)&v449;
      }
      else if (v390 == v448)
      {
        v394 = (uint64_t *)v447;
      }
      else if (v390 == v443)
      {
        v394 = (uint64_t *)&v446;
      }
      else
      {
        if (v390 != v419)
        {
          v391 = v413;
          v388((uint64_t)v519, v1);
          goto LABEL_471;
        }
        v394 = (uint64_t *)&v444;
      }
      v391 = (NSString *)(id)*(v394 - 32);
    }
LABEL_471:
    if (v393) {
      double v395 = 0.0;
    }
    else {
      double v395 = 1.0;
    }
    double v396 = (v168 * v531 - v170 + (v168 + v168) * v301) / v304;
    v397 = self;
    v388((uint64_t)v536, v1);
    id v398 = [v397 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v391];

    [v398 nt_scaledValueForValue:1.0];
    double v400 = v399;

    double v401 = v533 + v174 * (v396 * v400);
    sub_1000816D8();
    double v403 = (v402 + v401) * v395;
    v575.origin.x = 0.0;
    v573.origin.x = v505;
    v573.origin.y = v503;
    v573.size.width = v509;
    v573.size.height = v178;
    v575.origin.y = v213;
    v575.size.width = v506;
    v575.size.height = v403;
    if (CGRectContainsRect(v573, v575))
    {
      swift_unknownObjectRetain();
      sub_1000EA450();
      sub_100085390(*(void *)((v562 & 0xFFFFFFFFFFFFFF8) + 0x10));
      sub_1000EA4F0();
      sub_1000EA490();
    }
    swift_unknownObjectRelease();
    double v213 = v213 + v403;
    uint64_t v2 = v392 + 1;
    double v176 = v504;
    int v193 = v538;
    v195 = v539;
    if (v534 == v114)
    {
      swift_bridgeObjectRelease();
      v197 = (void *)v562;
      goto LABEL_24;
    }
  }
  v308 = v463;
  v216(v463, v180, v113);
  int v309 = v218(v308, v113);
  if (v309 == v193) {
    goto LABEL_235;
  }
  if (v309 == v221 || v309 == v545 || v309 == v540)
  {
    v310 = *v552;
    (*v552)((char *)v486, v558, v1);
  }
  else
  {
    if (v309 != v528)
    {
      uint64_t v410 = (uint64_t)v551;
      v411 = &v475;
      goto LABEL_512;
    }
LABEL_235:
    v310 = *v552;
    (*v552)((char *)v486, v550, v1);
  }
  v322 = v464;
  v216(v464, v180, v113);
  int v323 = v218(v322, v113);
  uint64_t v324 = v541;
  if (v323 == v193
    || (uint64_t v324 = v542, v323 == v544)
    || (uint64_t v324 = v542, v323 == v545)
    || (uint64_t v324 = v542, v323 == v540)
    || (uint64_t v324 = v541, v323 == v528))
  {
    uint64_t v325 = (uint64_t)v467;
    v310(v467, v324, v1);
    uint64_t v326 = v485;
    uint64_t v327 = v486;
    sub_100076874(v486, v325, v485);
    v328 = *v553;
    (*v553)(v325, v1);
    v328(v327, v1);
    v329 = v470;
    (*v557)(v470, v326, v1);
    int v330 = (*v556)(v329, v1);
    if (v330 == v558)
    {
      v320 = v525;
      uint64_t v180 = v537;
    }
    else
    {
      uint64_t v180 = v537;
      if (v330 == v549)
      {
        v331 = (uint64_t *)&v532;
      }
      else if (v330 == v550)
      {
        v331 = (uint64_t *)&v522;
      }
      else if (v330 == v529)
      {
        v331 = (uint64_t *)&v490;
      }
      else if (v330 == v526)
      {
        v331 = &v486;
      }
      else if (v330 == v542)
      {
        v331 = &v480;
      }
      else if (v330 == v491)
      {
        v331 = (uint64_t *)&v476;
      }
      else if (v330 == v541)
      {
        v331 = (uint64_t *)&v451;
      }
      else if (v330 == v455)
      {
        v331 = (uint64_t *)&v449;
      }
      else if (v330 == v448)
      {
        v331 = (uint64_t *)v447;
      }
      else if (v330 == v443)
      {
        v331 = (uint64_t *)&v446;
      }
      else
      {
        if (v330 != v419)
        {
          v320 = v413;
          v328((uint64_t)v470, v1);
          goto LABEL_310;
        }
        v331 = (uint64_t *)&v444;
      }
      v320 = (NSString *)(id)*(v331 - 32);
    }
LABEL_310:
    v335 = self;
    v328(v485, v1);
    id v333 = [v335 nt_preferredFontForCondensedTextStyle:2 contentSizeCategory:v320];
    *(double *)&uint64_t v334 = 72.0;
    goto LABEL_311;
  }
  uint64_t v408 = (uint64_t)v551;
  v409 = (void **)&v450;
LABEL_511:
  sub_1000BF66C(v408, (uint64_t)*(v409 - 32), (uint64_t (*)(void))type metadata accessor for LayoutContext);
  unint64_t v560 = 0;
  unint64_t v561 = 0xE000000000000000;
  sub_1000EA840(49);
  swift_bridgeObjectRelease();
  unint64_t v560 = 0xD00000000000002FLL;
  unint64_t v561 = 0x80000001000FF520;
  sub_1000BCE2C((unint64_t *)&unk_10013A660, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
  v566._countAndFlagsBits = sub_1000EAB10();
  sub_1000EA370(v566);
  swift_bridgeObjectRelease();
LABEL_513:
  uint64_t result = (void *)sub_1000EA960();
  __break(1u);
  return result;
}

void *sub_1000BB234(id a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results);
  uint64_t v4 = sub_1000B6CB4();
  id v5 = [v3 sections];
  id v6 = [v5 array];

  uint64_t v7 = sub_1000EA470();
  uint64_t v8 = sub_100084B00(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v9 = (unint64_t)sub_10003CF28((unint64_t)v8, (uint64_t)v4);
  swift_bridgeObjectRelease();

  uint64_t result = (void *)swift_bridgeObjectRelease_n();
  uint64_t v14 = _swiftEmptyArrayStorage;
  if (!(v9 >> 62))
  {
    uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1000EA980();
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = (void *)sub_1000EA870();
      }
      else
      {
        uint64_t v13 = *(void **)(v9 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      if (objc_msgSend(v13, "itemType", v14) == a1)
      {
        sub_1000EA8C0();
        sub_1000EA8F0();
        sub_1000EA900();
        sub_1000EA8D0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    return v14;
  }
  return result;
}

id sub_1000BB4BC@<X0>(id *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(a2 + 16))
  {
    id v5 = *a1;
    unint64_t v6 = sub_10003BBF8((uint64_t)v5);
    if (v7)
    {
      unint64_t v8 = *(void *)(*(void *)(a2 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
    }
  }
  else
  {
    unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
  }
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000EA980();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  id result = [objc_allocWithZone((Class)NSNumber) initWithInteger:v9];
  *a3 = result;
  return result;
}

uint64_t sub_1000BB998(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10001B38C(&qword_10013A630);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000BCD84();
  sub_1000EAC20();
  LOBYTE(v36[0]) = 0;
  sub_1000E8C50();
  sub_1000BCE2C(&qword_100137258, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_1000EAAE0();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  LOBYTE(v36[0]) = 1;
  sub_1000EAAA0();
  uint64_t v10 = self;
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results);
  *(void *)&v36[0] = 0;
  id v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:v36];
  id v13 = *(id *)&v36[0];
  if (!v12)
  {
    uint64_t v18 = v13;
    sub_1000E8A40();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  id v34 = v10;
  uint64_t v14 = sub_1000E8B90();
  unint64_t v16 = v15;

  *(void *)&v36[0] = v14;
  *((void *)&v36[0] + 1) = v16;
  char v35 = 2;
  unint64_t v17 = sub_1000222B8();
  sub_1000EAAE0();
  v31[1] = v17;
  unint64_t v32 = v16;
  uint64_t v33 = v14;
  uint64_t v19 = *(void *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_fetchInfo);
  *(void *)&v36[0] = 0;
  id v20 = [v34 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:v36];
  id v21 = *(id *)&v36[0];
  if (!v20)
  {
    uint64_t v26 = v21;
    sub_1000E8A40();

    swift_willThrow();
    sub_1000221B8(v33, v32);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v22 = sub_1000E8B90();
  uint64_t v24 = v23;

  *(void *)&v36[0] = v22;
  *((void *)&v36[0] + 1) = v24;
  char v35 = 3;
  sub_1000EAAE0();
  uint64_t v25 = v33;
  id v34 = v24;
  LOBYTE(v36[0]) = 4;
  type metadata accessor for LayoutContext();
  sub_1000BCE2C(&qword_10013A638, (void (*)(uint64_t))type metadata accessor for LayoutContext);
  sub_1000EAAE0();
  uint64_t v27 = *(void *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID + 8);
  *(void *)&v36[0] = *(void *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID);
  *((void *)&v36[0] + 1) = v27;
  char v35 = 5;
  swift_bridgeObjectRetain();
  sub_10001B38C(&qword_10013A640);
  sub_1000BCE74();
  sub_1000EAAE0();
  swift_bridgeObjectRelease();
  LOBYTE(v36[0]) = 6;
  sub_1000EAAD0();
  char v28 = *(unsigned char *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect + 32);
  long long v29 = *(_OWORD *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect + 16);
  v36[0] = *(_OWORD *)(v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect);
  v36[1] = v29;
  char v37 = v28;
  char v35 = 7;
  sub_10001B38C((uint64_t *)&unk_1001379C0);
  sub_1000BCEE0();
  sub_1000EAAE0();
  unint64_t v30 = v32;
  LOBYTE(v36[0]) = 8;
  sub_1000EAAD0();
  LOBYTE(v36[0]) = 9;
  sub_1000EAAD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000221B8(v22, (unint64_t)v34);
  return sub_1000221B8(v25, v30);
}

void *sub_1000BBFBC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v1;
  uint64_t v59 = v2;
  uint64_t v60 = v5;
  uint64_t v55 = type metadata accessor for LayoutContext();
  __chkstk_darwin(v55);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E8C50();
  uint64_t v56 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v58 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001B38C(&qword_10013A5F0);
  uint64_t v57 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000BCD84();
  id v13 = v59;
  sub_1000EAC00();
  if (v13) {
    goto LABEL_12;
  }
  uint64_t v53 = v7;
  uint64_t v54 = a1;
  uint64_t v14 = v57;
  uint64_t v59 = v1;
  LOBYTE(v61) = 0;
  sub_1000BCE2C((unint64_t *)&unk_100137210, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_1000EAA70();
  uint64_t v3 = v59;
  unint64_t v15 = (char *)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentFetchDate;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))((uint64_t)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentFetchDate, v58, v8);
  LOBYTE(v61) = 1;
  uint64_t v16 = sub_1000EAA10();
  uint64_t v51 = v15;
  uint64_t v52 = v8;
  uint64_t v18 = 0x6E776F6E6B6E75;
  if (v17) {
    uint64_t v18 = v16;
  }
  unint64_t v19 = 0xE700000000000000;
  if (v17) {
    unint64_t v19 = v17;
  }
  id v20 = (void *)((char *)v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_entryID);
  uint64_t *v20 = v18;
  v20[1] = v19;
  char v64 = 2;
  sub_100022164();
  uint64_t v58 = 0;
  sub_1000EAA70();
  uint64_t v49 = v12;
  uint64_t v50 = v10;
  long long v21 = v61;
  uint64_t v22 = sub_100022374(0, (unint64_t *)&unk_10013A600);
  sub_100022374(0, &qword_100139DD0);
  uint64_t v23 = (void *)sub_1000EA630();
  uint64_t v46 = v22;
  if (v23)
  {
    unint64_t v47 = *((void *)&v21 + 1);
    uint64_t v48 = v21;
    *(void *)((char *)v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results) = v23;
    char v64 = 3;
    id v28 = v23;
    long long v29 = v49;
    sub_1000EAA70();
    id v45 = v28;
    long long v31 = v61;
    sub_100022374(0, &qword_100139DE0);
    uint64_t v32 = sub_1000EA630();
    uint64_t v33 = (void *)v32;
    uint64_t v46 = v31;
    if (v32)
    {
      unint64_t v44 = *((void *)&v31 + 1);
      *(void *)((char *)v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_fetchInfo) = v32;
      LOBYTE(v61) = 4;
      sub_1000BCE2C(&qword_10013A620, (void (*)(uint64_t))type metadata accessor for LayoutContext);
      id v43 = v33;
      uint64_t v34 = (uint64_t)v53;
      sub_1000EAA70();
      sub_1000BF6D4(v34, (uint64_t)v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_layoutContext, (uint64_t (*)(void))type metadata accessor for LayoutContext);
      LOBYTE(v61) = 5;
      uint64_t v36 = sub_1000EAA10();
      char v37 = (void *)((char *)v3 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID);
      *char v37 = v36;
      v37[1] = v38;
      LOBYTE(v61) = 6;
      *(void *)((char *)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_appearanceType) = sub_1000EAA60();
      type metadata accessor for CGRect(0);
      char v64 = 7;
      sub_1000BCE2C(&qword_10013A628, type metadata accessor for CGRect);
      sub_1000EAA20();
      char v39 = v63;
      uint64_t v40 = (char *)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_visibleRect;
      long long v41 = v62;
      *(_OWORD *)uint64_t v40 = v61;
      *((_OWORD *)v40 + 1) = v41;
      v40[32] = v39;
      LOBYTE(v61) = 8;
      *(void *)((char *)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackKind) = sub_1000EAA60();
      LOBYTE(v61) = 9;
      uint64_t v42 = sub_1000EAA60();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v49, v50);
      sub_1000221B8(v48, v47);

      sub_1000221B8(v46, v44);
      uint64_t v3 = v59;
      *(void *)((char *)v59 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackLocation) = v42;
      uint64_t v26 = (uint64_t)v54;
      goto LABEL_13;
    }
    sub_1000BCDD8();
    swift_allocError();
    *char v35 = 4;
    swift_willThrow();
    sub_1000221B8(v48, v47);
    sub_1000221B8(v46, *((unint64_t *)&v31 + 1));

    (*(void (**)(char *, uint64_t))(v14 + 8))(v29, v50);
    int v24 = 1;
  }
  else
  {
    sub_1000BCDD8();
    swift_allocError();
    *unint64_t v30 = 3;
    swift_willThrow();
    sub_1000221B8(v21, *((unint64_t *)&v21 + 1));
    (*(void (**)(char *, uint64_t))(v14 + 8))(v49, v50);
    int v24 = 0;
  }
  uint64_t v25 = v58;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v51, v52);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    if (!v24) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (v24) {
LABEL_9:
  }

LABEL_11:
  a1 = v54;
LABEL_12:
  swift_deallocPartialClassInstance();
  uint64_t v26 = (uint64_t)a1;
LABEL_13:
  sub_100020AC0(v26);
  return v3;
}

void sub_1000BCA7C(void *a1@<X8>)
{
  sub_100084480();
  *a1 = v2;
}

uint64_t sub_1000BCAB8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentFetchDate;
  uint64_t v2 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  sub_100082D54(v0 + OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_layoutContext);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000BCBB0()
{
  return type metadata accessor for TrackableWidgetState();
}

uint64_t type metadata accessor for TrackableWidgetState()
{
  uint64_t result = qword_10013A518;
  if (!qword_10013A518) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000BCC04()
{
  uint64_t result = sub_1000E8C50();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for LayoutContext();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

void *sub_1000BCD08@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_1000BBFBC(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_1000BCD60(void *a1)
{
  return sub_1000BB998(a1);
}

unint64_t sub_1000BCD84()
{
  unint64_t result = qword_10013A5F8;
  if (!qword_10013A5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A5F8);
  }
  return result;
}

unint64_t sub_1000BCDD8()
{
  unint64_t result = qword_10013A610;
  if (!qword_10013A610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A610);
  }
  return result;
}

uint64_t sub_1000BCE2C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000BCE74()
{
  unint64_t result = qword_100139E80;
  if (!qword_100139E80)
  {
    sub_10001B3D0(&qword_10013A640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100139E80);
  }
  return result;
}

unint64_t sub_1000BCEE0()
{
  unint64_t result = qword_10013A648;
  if (!qword_10013A648)
  {
    sub_10001B3D0((uint64_t *)&unk_1001379C0);
    sub_1000BCE2C(&qword_10013A650, type metadata accessor for CGRect);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A648);
  }
  return result;
}

uint64_t sub_1000BCF84(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_1000EA930();
  uint64_t v5 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_10001B38C(&qword_10013A6C8);
  int v45 = a2;
  uint64_t v9 = sub_1000EA9A0();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    long long v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    id v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      uint64_t v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        sub_100028BC8((_OWORD *)(*(void *)(v8 + 56) + 32 * v20), v47);
      }
      else
      {
        (*v41)(v43, v26, v44);
        sub_100029614(*(void *)(v8 + 56) + 32 * v20, (uint64_t)v47);
      }
      uint64_t result = sub_1000EA1D0();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      (*v46)((char *)(*(void *)(v10 + 48) + v25 * v18), (unint64_t)v27, v28);
      uint64_t result = (uint64_t)sub_100028BC8(v47, (_OWORD *)(*(void *)(v10 + 56) + 32 * v18));
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_1000BD380(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10001B38C(&qword_10013A6D0);
  char v38 = a2;
  uint64_t v6 = sub_1000EA9A0();
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
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    char v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1000EABB0();
    sub_1000EA330();
    uint64_t result = sub_1000EABE0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 16 * v18;
    unint64_t v20 = (void *)(*(void *)(v7 + 48) + v19);
    void *v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(void *)(v7 + 56) + v19) = v39;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000BD690(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10001B38C(&qword_10013A680);
  uint64_t v6 = sub_1000EA9A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
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
    int64_t v23 = (void *)(v5 + 64);
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
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_1000EA700(*(void *)(v7 + 40));
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
  int64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000BD968(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10001B38C(&qword_10013A6D8);
  char v38 = a2;
  uint64_t v6 = sub_1000EA9A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1000EABB0();
    sub_1000EA330();
    uint64_t result = sub_1000EABE0();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_1000BDC78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ImageStore.Key();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10001B38C(&qword_10013A6A8);
  unint64_t v10 = (void *)sub_1000EA9A0();
  if (*(void *)(v9 + 16))
  {
    BOOL v27 = v3;
    uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v12 = (void *)(v9 + 64);
    uint64_t v13 = -1;
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    unint64_t v14 = v13 & *(void *)(v9 + 64);
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v21 >= v15) {
          goto LABEL_23;
        }
        unint64_t v22 = v12[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v15) {
            goto LABEL_23;
          }
          unint64_t v22 = v12[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v27;
                goto LABEL_30;
              }
              uint64_t v25 = 1 << *(unsigned char *)(v9 + 32);
              if (v25 >= 64) {
                bzero((void *)(v9 + 64), ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v12 = -1 << v25;
              }
              uint64_t v3 = v27;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v22 = v12[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_32;
                }
                if (v17 >= v15) {
                  goto LABEL_23;
                }
                unint64_t v22 = v12[v17];
                ++v23;
                if (v22) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_20:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v20;
      if (a2)
      {
        sub_1000BF6D4(v24, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        id v18 = *(id *)(*(void *)(v9 + 56) + 8 * v20);
      }
      else
      {
        sub_1000BF66C(v24, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
        id v18 = *(id *)(*(void *)(v9 + 56) + 8 * v20);
      }
      uint64_t result = sub_1000BE580((uint64_t)v8, (uint64_t)v18, v10);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  void *v3 = v10;
  return result;
}

_OWORD *sub_1000BDF34(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1000EA930();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_10003BA88(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_1000BE998();
      goto LABEL_7;
    }
    sub_1000BCF84(v17, a3 & 1);
    unint64_t v23 = sub_10003BA88(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1000BE824(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1000EAB50();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  int64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
  sub_100020AC0((uint64_t)v21);

  return sub_100028BC8(a1, v21);
}

uint64_t sub_1000BE10C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10003BAEC(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a5 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000BEC40();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      int64_t v21 = (void *)(v20[7] + 16 * v14);
      *int64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000BD380(result, a5 & 1);
  uint64_t result = sub_10003BAEC(a3, a4);
  if ((v18 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1000EAB50();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v23 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v23 = a3;
  v23[1] = a4;
  char v24 = (void *)(v20[7] + 16 * v14);
  *char v24 = a1;
  v24[1] = a2;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;

  return swift_bridgeObjectRetain();
}

id sub_1000BE28C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_10003BBF8((uint64_t)a2);
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
    sub_1000BEDEC();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000BD690(v12, a3 & 1);
  unint64_t v18 = sub_10003BBF8((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_100022374(0, (unint64_t *)&qword_1001371D0);
    id result = (id)sub_1000EAB50();
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
  _OWORD v15[2] = v23;

  return a2;
}

void sub_1000BE400(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v11 = (void *)*v3;
  unint64_t v13 = sub_10003BC3C(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    char v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];

      *(void *)(v20 + 8 * v13) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_1000BF14C();
    goto LABEL_7;
  }
  sub_1000BDC78(v16, a3 & 1);
  unint64_t v21 = sub_10003BC3C(a2);
  if ((v17 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_1000EAB50();
    __break(1u);
    return;
  }
  unint64_t v13 = v21;
  char v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_1000BF66C(a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  sub_1000BE8E4(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_1000BE580(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ImageStore.Key();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10 - 8);
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000EABB0();
  sub_1000BF66C(a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    sub_1000EABC0(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    sub_1000EABC0(0);
    sub_1000BCE2C((unint64_t *)&qword_100139090, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_1000EA1E0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_1000EABE0();
  unint64_t v14 = sub_1000EA7E0();
  *(void *)((char *)a3 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v14;
  uint64_t result = sub_1000BF6D4(a1, a3[6] + *(void *)(v11 + 72) * v14, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  *(void *)(a3[7] + 8 * v14) = a2;
  ++a3[2];
  return result;
}

_OWORD *sub_1000BE824(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1000EA930();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_100028BC8(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_1000BE8E4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ImageStore.Key();
  uint64_t result = sub_1000BF6D4(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_1000BE998()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_1000EA930();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B38C(&qword_10013A6C8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1000EA990();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *unint64_t v1 = v8;
    return result;
  }
  char v22 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v23 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v25 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    sub_100029614(*(void *)(v6 + 56) + v18, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = sub_100028BC8(v26, (_OWORD *)(*(void *)(v8 + 56) + v18));
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v22;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1000BEC40()
{
  unint64_t v1 = v0;
  sub_10001B38C(&qword_10013A6D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000EA990();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000BEDEC()
{
  unint64_t v1 = v0;
  sub_10001B38C(&qword_10013A680);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000EA990();
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_1000BEF98()
{
  unint64_t v1 = v0;
  sub_10001B38C(&qword_10013A6D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000EA990();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    int64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000BF14C()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ImageStore.Key();
  uint64_t v26 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B38C(&qword_10013A6A8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1000EA990();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (id)swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  int64_t v24 = v1;
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v25 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v26 + 72) * v16;
    sub_1000BF66C(*(void *)(v5 + 48) + v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void **)(*(void *)(v5 + 56) + v18);
    sub_1000BF6D4((uint64_t)v4, *(void *)(v7 + 48) + v17, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    id result = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_23:
    id result = (id)swift_release();
    unint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_1000BF3CC()
{
  unint64_t result = qword_10013A678;
  if (!qword_10013A678)
  {
    sub_100022374(255, (unint64_t *)&qword_1001371D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A678);
  }
  return result;
}

void *sub_1000BF434(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_1000EA870();
LABEL_10:
        uint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_23;
        }
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v8 = v5;
          if (!sub_1000EA940()) {
            goto LABEL_4;
          }
          sub_100022374(0, &qword_10013A3A0);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v9 = v15;
          swift_unknownObjectRelease();

          if (!v15) {
            goto LABEL_5;
          }
        }
        else
        {
          if (!*(void *)(a2 + 16)) {
            goto LABEL_5;
          }
          unint64_t v10 = sub_10003BBF8((uint64_t)v5);
          if ((v11 & 1) == 0)
          {
LABEL_4:

            goto LABEL_5;
          }
          id v9 = *(id *)(*(void *)(a2 + 56) + 8 * v10);

          if (!v9) {
            goto LABEL_5;
          }
        }
        id v12 = [v9 integerValue];

        if ((uint64_t)v12 > 0)
        {
          sub_1000EA8C0();
          sub_1000EA8F0();
          sub_1000EA900();
          sub_1000EA8D0();
          goto LABEL_6;
        }
LABEL_5:

LABEL_6:
        ++v4;
        if (v7 == v3) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      uint64_t v3 = sub_1000EA980();
      if (!v3) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_10;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000BF66C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000BF6D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_1000BF73C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return sub_1000BB4BC(a1, *(void *)(v2 + 16), a2);
}

id sub_1000BF758(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000EA980();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      while (1)
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          unint64_t v7 = (void *)sub_1000EA870();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_12;
          }
        }
        else
        {
          unint64_t v7 = *(void **)(a1 + 8 * v5);
          swift_unknownObjectRetain();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_12:
            __break(1u);
            goto LABEL_13;
          }
        }
        id v9 = [v7 isEqual:a2];
        swift_unknownObjectRelease();
        if ((v9 & 1) == 0)
        {
          ++v5;
          if (v8 != v4) {
            continue;
          }
        }
        goto LABEL_15;
      }
    }
  }
  id v9 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  return v9;
}

void *sub_1000BF86C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1000EA980())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_1000EA870() : *(id *)(a1 + 8 * v5);
      unint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      sub_100084480();
      unint64_t v10 = v9;
      swift_unknownObjectRetain();
      unsigned __int8 v11 = sub_1000BF758(v10, a2);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000BF9A4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100124550;
  v6._object = a2;
  unint64_t v4 = sub_1000EA9E0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xA) {
    return 10;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000BF9F0(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        Swift::String v6 = (void *)sub_1000EA870();
      }
      else
      {
        Swift::String v6 = *(void **)(a1 + 8 * v5 + 32);
        swift_unknownObjectRetain();
      }
      unsigned __int8 v7 = [v6 isEqual:a2];
      swift_unknownObjectRelease();
      if (v7) {
        break;
      }
      uint64_t v8 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_12:
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_1000EA980();
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        if (!v4) {
          return v5;
        }
      }
      else
      {
        ++v5;
        if (v8 == v4) {
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_1000BFB00(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_1000EA870() : *(id *)(a1 + 8 * v5 + 32);
      unsigned __int8 v7 = v6;
      unsigned __int8 v8 = [v6 isEqual:a2];

      if (v8) {
        break;
      }
      uint64_t v9 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_12:
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_1000EA980();
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        if (!v4) {
          return v5;
        }
      }
      else
      {
        ++v5;
        if (v9 == v4) {
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t getEnumTagSinglePayload for TrackableWidgetState.Errors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TrackableWidgetState.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1000BFD60);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrackableWidgetState.Errors()
{
  return &type metadata for TrackableWidgetState.Errors;
}

uint64_t getEnumTagSinglePayload for TrackableWidgetState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TrackableWidgetState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x1000BFEF4);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrackableWidgetState.CodingKeys()
{
  return &type metadata for TrackableWidgetState.CodingKeys;
}

unint64_t sub_1000BFF30()
{
  unint64_t result = qword_10013A6F0;
  if (!qword_10013A6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A6F0);
  }
  return result;
}

unint64_t sub_1000BFF88()
{
  unint64_t result = qword_10013A6F8;
  if (!qword_10013A6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A6F8);
  }
  return result;
}

unint64_t sub_1000BFFE0()
{
  unint64_t result = qword_10013A700;
  if (!qword_10013A700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A700);
  }
  return result;
}

unint64_t sub_1000C0038()
{
  unint64_t result = qword_10013A708;
  if (!qword_10013A708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A708);
  }
  return result;
}

id sub_1000C008C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return sub_1000BF73C(a1, a2);
}

char *sub_1000C00A4(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unsigned int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unsigned int v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    unsigned int v6 = a1;
    BOOL v7 = a2[1];
    int v8 = a2[2];
    *((void *)a1 + 1) = v7;
    *((void *)a1 + 2) = v8;
    a1[24] = *((unsigned char *)a2 + 24);
    uint64_t v9 = type metadata accessor for Section();
    uint64_t v10 = *(int *)(v9 + 32);
    __dst = &v6[v10];
    uint64_t v31 = v9;
    unsigned __int8 v11 = (char *)a2 + v10;
    uint64_t v12 = sub_1000E8B60();
    uint64_t v13 = *(void *)(v12 - 8);
    int64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    unint64_t v15 = v4;
    unint64_t v16 = v7;
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      uint64_t v17 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dst, v11, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v18 = *(int *)(v31 + 36);
    uint64_t v19 = &v6[v18];
    int64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_1000E8C50();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_10001B38C((uint64_t *)&unk_10013A350);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    uint64_t v24 = *(int *)(a3 + 20);
    uint64_t v25 = &v6[v24];
    uint64_t v26 = (uint64_t)a2 + v24;
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    uint64_t v27 = *(void **)(v26 + 16);
    *((void *)v25 + 2) = v27;
    id v28 = v27;
  }
  return v6;
}

void sub_1000C0368(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for Section();
  uint64_t v5 = (char *)a1 + *(int *)(v4 + 32);
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  int v8 = (char *)a1 + *(int *)(v4 + 36);
  uint64_t v9 = sub_1000E8C50();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  unsigned __int8 v11 = *(id *)((char *)a1 + *(int *)(a2 + 20) + 16);
}

uint64_t sub_1000C04E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = type metadata accessor for Section();
  uint64_t v8 = *(int *)(v7 + 32);
  __dst = (void *)(a1 + v8);
  uint64_t v29 = v7;
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = sub_1000E8B60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  id v14 = v5;
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v15 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(__dst, v9, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v16 = *(int *)(v29 + 36);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_1000E8C50();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_10001B38C((uint64_t *)&unk_10013A350);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = *(int *)(a3 + 20);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  uint64_t v25 = *(void **)(v24 + 16);
  *(void *)(v23 + 16) = v25;
  id v26 = v25;
  return a1;
}

uint64_t sub_1000C0760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v7 = v6;

  uint64_t v8 = *(void **)(a2 + 8);
  uint64_t v9 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v8;
  id v10 = v8;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v11 = type metadata accessor for Section();
  uint64_t v12 = *(int *)(v11 + 32);
  id v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_1000E8B60();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = *(int *)(v11 + 36);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_1000E8C50();
  uint64_t v25 = *(void *)(v24 - 8);
  id v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v22, v23, v24);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    uint64_t v29 = sub_10001B38C((uint64_t *)&unk_10013A350);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v22, v23, v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_13:
  uint64_t v30 = *(int *)(a3 + 20);
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  void *v31 = *v32;
  v31[1] = v32[1];
  id v33 = (void *)v32[2];
  uint64_t v34 = (void *)v31[2];
  void v31[2] = v33;
  id v35 = v33;

  return a1;
}

uint64_t sub_1000C0AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = type metadata accessor for Section();
  uint64_t v7 = *(int *)(v6 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1000E8B60();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(v6 + 36);
  id v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_1000E8C50();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_10001B38C((uint64_t *)&unk_10013A350);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = *(int *)(a3 + 20);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(void *)(v20 + 16) = *(void *)(v21 + 16);
  return a1;
}

uint64_t sub_1000C0D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = type metadata accessor for Section();
  uint64_t v8 = *(int *)(v7 + 32);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_1000E8B60();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    uint64_t v16 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = *(int *)(v7 + 36);
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = sub_1000E8C50();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v18, v19, v20);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    uint64_t v25 = sub_10001B38C((uint64_t *)&unk_10013A350);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
LABEL_13:
  uint64_t v26 = *(int *)(a3 + 20);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  uint64_t v29 = *(void **)(v27 + 16);
  *(void *)(v27 + 16) = *(void *)(v28 + 16);

  return a1;
}

uint64_t sub_1000C103C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C1050);
}

uint64_t sub_1000C1050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Section();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 16);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000C1114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C1128);
}

uint64_t sub_1000C1128(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Section();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 16) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SectionHeaderView()
{
  uint64_t result = qword_10013A768;
  if (!qword_10013A768) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C1234()
{
  uint64_t result = type metadata accessor for Section();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000C12C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C12E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_10001B38C(&qword_10013A7A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_10001B38C(&qword_10013A7A8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [*(id *)(v1 + 8) name];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = sub_1000EA2B0();
    unint64_t v13 = v12;

    *uint64_t v5 = sub_1000E9D90();
    v5[1] = v14;
    uint64_t v15 = sub_10001B38C(&qword_10013A7B0);
    sub_1000C14C0(v1, v11, v13, (uint64_t)v5 + *(int *)(v15 + 44));
    swift_bridgeObjectRelease();
    type metadata accessor for SectionHeaderView();
    sub_1000E9DC0();
    sub_1000E9300();
    sub_10002DA34((uint64_t)v5, (uint64_t)v8, &qword_10013A7A0);
    uint64_t v16 = &v8[*(int *)(v6 + 36)];
    long long v17 = v19[1];
    *(_OWORD *)uint64_t v16 = v19[0];
    *((_OWORD *)v16 + 1) = v17;
    *((_OWORD *)v16 + 2) = v19[2];
    sub_100028B6C((uint64_t)v5, &qword_10013A7A0);
    sub_1000C2FF8();
  }
  uint64_t result = sub_1000E9D10();
  *a1 = result;
  return result;
}

uint64_t sub_1000C14C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v7 = sub_10001B38C(&qword_10013A7C8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  unint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_10001B38C(&qword_10013A7D0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v27 - v17;
  *(void *)uint64_t v18 = sub_1000E9720();
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  uint64_t v19 = &v18[*(int *)(sub_10001B38C(&qword_10013A7D8) + 44)];
  *(void *)unint64_t v12 = sub_1000E9600();
  *((void *)v12 + 1) = 0x4008000000000000;
  v12[16] = 0;
  uint64_t v20 = sub_10001B38C(&qword_10013A7E0);
  sub_1000C1E78(a1, a2, a3, (uint64_t)&v12[*(int *)(v20 + 44)]);
  sub_10002DA34((uint64_t)v12, (uint64_t)v10, &qword_10013A7C8);
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v21 = sub_10001B38C(&qword_10013A7E8);
  sub_10002DA34((uint64_t)v10, (uint64_t)&v19[*(int *)(v21 + 48)], &qword_10013A7C8);
  sub_100028B6C((uint64_t)v12, &qword_10013A7C8);
  sub_100028B6C((uint64_t)v10, &qword_10013A7C8);
  sub_1000C1724(&v28);
  uint64_t v22 = v28;
  char v23 = sub_1000E9890();
  sub_10002DA34((uint64_t)v18, (uint64_t)v16, &qword_10013A7D0);
  uint64_t v24 = v27;
  sub_10002DA34((uint64_t)v16, v27, &qword_10013A7D0);
  uint64_t v25 = v24 + *(int *)(sub_10001B38C(&qword_10013A7F0) + 48);
  *(void *)uint64_t v25 = v22;
  *(unsigned char *)(v25 + 8) = v23;
  *(_OWORD *)(v25 + 16) = 0u;
  *(_OWORD *)(v25 + 32) = 0u;
  *(unsigned char *)(v25 + 48) = 1;
  swift_retain();
  sub_100028B6C((uint64_t)v18, &qword_10013A7D0);
  swift_release();
  return sub_100028B6C((uint64_t)v16, &qword_10013A7D0);
}

uint64_t sub_1000C1724@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_10001B38C(&qword_10013A7F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v47 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001B38C(&qword_10013A800);
  __chkstk_darwin(v6);
  uint64_t v46 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v44 = sub_1000E9B90();
  uint64_t v8 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  unint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E9C60();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v1;
  if (*(unsigned char *)(v1 + 24) == 1)
  {
    uint64_t v40 = v6;
    uint64_t v41 = v4;
    uint64_t v42 = v3;
    id v43 = a1;
    if (qword_100135DC8 != -1) {
      swift_once();
    }
    id v15 = (id)qword_10014BD90;
    sub_1000E9C50();
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
    uint64_t v39 = sub_1000E9CC0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    NSString v16 = sub_1000EA280();
    uint64_t v17 = self;
    id v18 = [v17 colorWithHexString:v16];

    [v18 red];
    [v18 green];
    [v18 blue];
    uint64_t v19 = enum case for Color.RGBColorSpace.sRGB(_:);
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
    uint64_t v21 = v44;
    v20(v10, enum case for Color.RGBColorSpace.sRGB(_:), v44);
    uint64_t v22 = sub_1000E9C30();

    NSString v23 = sub_1000EA280();
    id v24 = [v17 colorWithHexString:v23];

    [v24 red];
    [v24 green];
    [v24 blue];
    v20(v10, v19, v21);
    uint64_t v25 = sub_1000E9C30();

    sub_10001B38C(&qword_100137F68);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1000F1E20;
    *(void *)(v26 + 32) = v22;
    *(void *)(v26 + 40) = v25;
    uint64_t v48 = v26;
    sub_1000EA490();
    swift_retain();
    swift_retain();
    sub_1000E9D70();
    sub_1000E9DD0();
    sub_1000E9DE0();
    sub_1000E9360();
    uint64_t v27 = v60;
    long long v44 = v61;
    uint64_t v28 = v62;
    uint64_t v29 = v63;
    type metadata accessor for SectionHeaderView();
    uint64_t v30 = v39;
    swift_retain();
    sub_1000E9DC0();
    sub_1000E9300();
    uint64_t v48 = v27;
    long long v49 = v44;
    uint64_t v50 = v28;
    uint64_t v51 = v29;
    uint64_t v52 = v30;
    uint64_t v53 = 0x3FF0000000000000;
    __int16 v54 = 0;
    uint64_t v55 = v64;
    char v56 = v65;
    uint64_t v57 = v66;
    char v58 = v67;
    long long v59 = v68;
    uint64_t v31 = sub_10001B38C(&qword_10013A808);
    uint64_t v32 = sub_1000C3098(&qword_10013A810, &qword_10013A808, (void (*)(void))sub_100048958);
    id v33 = v47;
    sub_1000E9AB0();
    sub_100048AC8((uint64_t)&v60);
    swift_release();
    uint64_t v48 = v31;
    *(void *)&long long v49 = v32;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v35 = v42;
    sub_1000E9A60();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v33, v35);
    uint64_t v48 = v35;
    *(void *)&long long v49 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v36 = sub_1000E9D10();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    a1 = v43;
  }
  else
  {
    uint64_t result = sub_1000E9D10();
    uint64_t v36 = result;
  }
  *a1 = v36;
  return result;
}

uint64_t sub_1000C1E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v122 = a2;
  unint64_t v123 = a3;
  uint64_t v128 = a4;
  uint64_t v115 = sub_1000E99F0();
  uint64_t v113 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v111 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_1000E9A10();
  uint64_t v112 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  uint64_t v108 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_1000E9A30();
  uint64_t v109 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v107 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E9670();
  __chkstk_darwin(v8 - 8);
  uint64_t v106 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001B38C((uint64_t *)&unk_10013A350);
  __chkstk_darwin(v10 - 8);
  uint64_t v126 = (uint64_t)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E8C50();
  uint64_t v129 = *(void *)(v12 - 8);
  uint64_t v130 = v12;
  __chkstk_darwin(v12);
  uint64_t v127 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_10001B38C(&qword_10013A818);
  uint64_t v103 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  uint64_t v102 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_10001B38C(&qword_10013A820);
  uint64_t v15 = __chkstk_darwin(v124);
  uint64_t v101 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v104 = (uint64_t)&v95 - v17;
  uint64_t v120 = sub_10001B38C(&qword_10013A828);
  __chkstk_darwin(v120);
  uint64_t v121 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = (uint64_t *)sub_1000E96E0();
  uint64_t v99 = *(v100 - 1);
  __chkstk_darwin(v100);
  uint64_t v98 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_10001B38C(&qword_10013A830);
  uint64_t v97 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v21 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_10001B38C(&qword_10013A838);
  uint64_t v22 = __chkstk_darwin(v119);
  id v24 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v96 = (char *)&v95 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v95 - v27;
  uint64_t v29 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1000E8B60();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v95 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  uint64_t v38 = (char *)&v95 - v37;
  uint64_t v39 = sub_10001B38C(&qword_10013A840);
  uint64_t v40 = __chkstk_darwin(v39 - 8);
  uint64_t v125 = (uint64_t)&v95 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v118 = (char *)&v95 - v42;
  uint64_t v117 = type metadata accessor for Section();
  sub_10002DA34(a1 + *(int *)(v117 + 32), (uint64_t)v31, (uint64_t *)&unk_1001370F0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
  {
    sub_100028B6C((uint64_t)v31, (uint64_t *)&unk_1001370F0);
    uint64_t v43 = sub_10002C0C0();
    uint64_t v45 = v122;
    unint64_t v44 = v123;
    sub_1000C2D68(v122, v123, v43, (uint64_t)v21);
    swift_release();
    uint64_t v133 = v45;
    unint64_t v134 = v44;
    uint64_t v46 = sub_10001B3D0(&qword_10013A848);
    uint64_t v47 = sub_10001B3D0(&qword_100138950);
    unint64_t v48 = sub_1000C3114();
    uint64_t v131 = v47;
    unint64_t v132 = v48;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v131 = v46;
    unint64_t v132 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_1000295C0();
    uint64_t v50 = v116;
    sub_1000E9AF0();
    (*(void (**)(char *, uint64_t))(v97 + 8))(v21, v50);
    uint64_t v51 = v98;
    sub_1000E96C0();
    uint64_t v52 = (uint64_t)v96;
    sub_1000E93B0();
    (*(void (**)(char *, uint64_t *))(v99 + 8))(v51, v100);
    sub_100028B6C((uint64_t)v24, &qword_10013A838);
    sub_10002D5DC(v52, (uint64_t)v28, &qword_10013A838);
    sub_10002DA34((uint64_t)v28, v121, &qword_10013A838);
    swift_storeEnumTagMultiPayload();
    sub_1000C31B4();
    sub_1000C3254();
    uint64_t v53 = (uint64_t)v118;
    sub_1000E97F0();
    sub_100028B6C((uint64_t)v28, &qword_10013A838);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v38, v31, v32);
    uint64_t v54 = (*(uint64_t (**)(char *, char *, uint64_t))(v33 + 16))(v36, v38, v32);
    uint64_t v100 = &v95;
    __chkstk_darwin(v54);
    uint64_t v55 = v122;
    unint64_t v56 = v123;
    *(&v95 - 4) = a1;
    *(&v95 - 3) = v55;
    unint64_t v93 = v56;
    uint64_t v57 = sub_10001B3D0(&qword_10013A848);
    uint64_t v58 = sub_10001B3D0(&qword_100138950);
    unint64_t v59 = sub_1000C3114();
    uint64_t v133 = v58;
    unint64_t v134 = v59;
    uint64_t v60 = swift_getOpaqueTypeConformance2();
    uint64_t v133 = v57;
    unint64_t v134 = v60;
    swift_getOpaqueTypeConformance2();
    long long v61 = v102;
    sub_1000E9940();
    uint64_t v133 = v55;
    unint64_t v134 = v56;
    sub_10001D100(&qword_10013A858, &qword_10013A818);
    sub_1000295C0();
    uint64_t v62 = (uint64_t)v101;
    uint64_t v63 = v105;
    sub_1000E9AF0();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v61, v63);
    uint64_t v64 = v104;
    sub_10002D5DC(v62, v104, &qword_10013A820);
    sub_10002DA34(v64, v121, &qword_10013A820);
    swift_storeEnumTagMultiPayload();
    sub_1000C31B4();
    sub_1000C3254();
    uint64_t v53 = (uint64_t)v118;
    sub_1000E97F0();
    sub_100028B6C(v64, &qword_10013A820);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v32);
  }
  uint64_t v65 = v126;
  sub_10002DA34(a1 + *(int *)(v117 + 36), v126, (uint64_t *)&unk_10013A350);
  uint64_t v67 = v129;
  uint64_t v66 = v130;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v129 + 48))(v65, 1, v130) == 1)
  {
    sub_100028B6C(v65, (uint64_t *)&unk_10013A350);
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v127, v65, v66);
    sub_1000E9660();
    v135._countAndFlagsBits = 40;
    v135._object = (void *)0xE100000000000000;
    sub_1000E9650(v135);
    (*(void (**)(char *, void, uint64_t))(v113 + 104))(v111, enum case for Text.DateStyle.UnitsConfiguration.Style.brief(_:), v115);
    uint64_t v72 = v108;
    sub_1000E9A00();
    uint64_t v73 = v107;
    sub_1000E9A20();
    (*(void (**)(char *, uint64_t))(v112 + 8))(v72, v114);
    sub_1000E9630();
    (*(void (**)(char *, uint64_t))(v109 + 8))(v73, v110);
    v136._countAndFlagsBits = 41;
    v136._object = (void *)0xE100000000000000;
    sub_1000E9650(v136);
    sub_1000E9690();
    __int16 v94 = 256;
    unint64_t v93 = 0;
    uint64_t v74 = sub_1000E9A40();
    uint64_t v76 = v75;
    uint64_t v126 = v77;
    char v79 = v78 & 1;
    sub_1000E9C20();
    uint64_t v68 = sub_1000E9980();
    uint64_t v69 = v80;
    uint64_t v81 = v53;
    uint64_t v82 = a1;
    char v84 = v83;
    uint64_t v71 = v85;
    swift_release();
    uint64_t v70 = v84 & 1;
    a1 = v82;
    uint64_t v53 = v81;
    sub_100026FDC(v74, v76, v79);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v129 + 8))(v127, v130);
  }
  uint64_t v86 = *(void *)(a1 + *(int *)(type metadata accessor for SectionHeaderView() + 20));
  uint64_t v87 = v125;
  sub_10002DA34(v53, v125, &qword_10013A840);
  uint64_t v88 = v128;
  sub_10002DA34(v87, v128, &qword_10013A840);
  uint64_t v89 = sub_10001B38C(&qword_10013A868);
  uint64_t v90 = (uint64_t *)(v88 + *(int *)(v89 + 48));
  *uint64_t v90 = v68;
  v90[1] = v69;
  v90[2] = v70;
  v90[3] = v71;
  uint64_t v91 = v88 + *(int *)(v89 + 64);
  *(void *)uint64_t v91 = v86;
  *(unsigned char *)(v91 + 8) = 0;
  sub_1000C3340(v68, v69, v70, v71);
  sub_100028B6C(v53, &qword_10013A840);
  sub_1000C3384(v68, v69, v70, v71);
  return sub_100028B6C(v87, &qword_10013A840);
}

uint64_t sub_1000C2CFC@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10002C0C0();
  sub_1000C2D68(a1, a2, v6, a3);

  return swift_release();
}

uint64_t sub_1000C2D68@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = a4;
  uint64_t v8 = sub_10001B38C(&qword_10013A848);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v33 = v8;
  uint64_t v34 = v9;
  __chkstk_darwin(v8);
  uint64_t v32 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *(id *)(v4 + *(int *)(type metadata accessor for SectionHeaderView() + 20) + 16);
  v31[1] = sub_1000E9930();
  uint64_t v36 = a1;
  unint64_t v37 = a2;
  sub_1000295C0();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1000E9A50();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  swift_retain();
  uint64_t v17 = sub_1000E99C0();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  v31[0] = v22;
  swift_release();
  v21 &= 1u;
  sub_100026FDC(v12, v14, v16);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = swift_getKeyPath();
  uint64_t v36 = v17;
  unint64_t v37 = v19;
  char v38 = v21;
  uint64_t v39 = v23;
  uint64_t v40 = KeyPath;
  uint64_t v41 = 1;
  char v42 = 0;
  uint64_t v43 = v25;
  uint64_t v44 = a3;
  swift_retain();
  uint64_t v26 = sub_10001B38C(&qword_100138950);
  unint64_t v27 = sub_1000C3114();
  uint64_t v28 = v32;
  sub_1000E9A60();
  sub_100026FDC(v17, v19, v21);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v36 = v26;
  unint64_t v37 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v33;
  sub_1000E9AB0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v28, v29);
}

unint64_t sub_1000C2FF8()
{
  unint64_t result = qword_10013A7B8;
  if (!qword_10013A7B8)
  {
    sub_10001B3D0(&qword_10013A7A8);
    sub_10001D100(&qword_10013A7C0, &qword_10013A7A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A7B8);
  }
  return result;
}

uint64_t sub_1000C3098(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B3D0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000C3114()
{
  unint64_t result = qword_100138958;
  if (!qword_100138958)
  {
    sub_10001B3D0(&qword_100138950);
    sub_10003E488();
    sub_10001D100(&qword_100138730, &qword_100138738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100138958);
  }
  return result;
}

unint64_t sub_1000C31B4()
{
  unint64_t result = qword_10013A850;
  if (!qword_10013A850)
  {
    sub_10001B3D0(&qword_10013A820);
    sub_10001D100(&qword_10013A858, &qword_10013A818);
    sub_100048864();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A850);
  }
  return result;
}

unint64_t sub_1000C3254()
{
  unint64_t result = qword_10013A860;
  if (!qword_10013A860)
  {
    sub_10001B3D0(&qword_10013A838);
    sub_10001B3D0(&qword_10013A848);
    sub_10001B3D0(&qword_100138950);
    sub_1000C3114();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100048864();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A860);
  }
  return result;
}

uint64_t sub_1000C3340(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000360E4(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000C3384(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100026FDC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000C33C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C2CFC(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

uint64_t initializeBufferWithCopyOfBuffer for SectionHeaderView.LayoutOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

void destroy for SectionHeaderView.LayoutOptions(uint64_t a1)
{
}

void *assignWithCopy for SectionHeaderView.LayoutOptions(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = (void *)a2[2];
  id v4 = (void *)a1[2];
  a1[2] = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for SectionHeaderView.LayoutOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for SectionHeaderView.LayoutOptions(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SectionHeaderView.LayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SectionHeaderView.LayoutOptions()
{
  return &type metadata for SectionHeaderView.LayoutOptions;
}

void *sub_1000C3540()
{
  return &protocol witness table for AnyView;
}

uint64_t sub_1000C3550(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6567616D69;
  }
  else {
    uint64_t v3 = 0x536D75696D657270;
  }
  if (v2) {
    unint64_t v4 = 0xEB000000006C6165;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6567616D69;
  }
  else {
    uint64_t v5 = 0x536D75696D657270;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xEB000000006C6165;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000EAB20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000C35FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746E656964617267;
  }
  else {
    uint64_t v3 = 0x64696C6F73;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746E656964617267;
  }
  else {
    uint64_t v5 = 0x64696C6F73;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000EAB20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000C36A0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6567617373656DLL;
  }
  else {
    uint64_t v3 = 0x656E696C64616568;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6567617373656DLL;
  }
  else {
    uint64_t v5 = 0x656E696C64616568;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000EAB20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000C3748(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE90000000000006ELL;
  uint64_t v3 = 0x696772614D706F74;
  unint64_t v4 = 0xE90000000000006ELL;
  uint64_t v5 = a1;
  unint64_t v6 = 0x696772614D706F74;
  switch(v5)
  {
    case 1:
      unint64_t v6 = 0x614D6D6F74746F62;
      unint64_t v4 = 0xEC0000006E696772;
      break;
    case 2:
      unint64_t v6 = 0x6E49796C696D6166;
      unint64_t v4 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v6 = 0x5379616C70736964;
      unint64_t v4 = 0xEB00000000657A69;
      break;
    case 4:
      unint64_t v4 = 0x80000001000FCF10;
      unint64_t v6 = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t v6 = 0x5379616C70736964;
      unint64_t v4 = 0xEC000000656C6163;
      break;
    case 6:
      unint64_t v6 = 0x696C64616548746ELL;
      unint64_t v4 = 0xEF656C616353656ELL;
      break;
    case 7:
      unint64_t v6 = 0x686563616C507369;
      unint64_t v4 = 0xED00007265646C6FLL;
      break;
    case 8:
      unint64_t v6 = 0x6569766572507369;
      unint64_t v4 = 0xE900000000000077;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v7 = 0x614D6D6F74746F62;
      uint64_t v8 = 1852401522;
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xE900000000000074;
      if (v6 != 0x6E49796C696D6166) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v2 = 0xEB00000000657A69;
      if (v6 != 0x5379616C70736964) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v2 = 0x80000001000FCF10;
      if (v6 != 0xD00000000000001BLL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      uint64_t v7 = 0x5379616C70736964;
      uint64_t v8 = 1701601635;
LABEL_19:
      unint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v6 != v7) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      unint64_t v2 = 0xEF656C616353656ELL;
      if (v6 != 0x696C64616548746ELL) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      uint64_t v3 = 0x686563616C507369;
      unint64_t v2 = 0xED00007265646C6FLL;
      goto LABEL_24;
    case 8:
      unint64_t v2 = 0xE900000000000077;
      if (v6 != 0x6569766572507369) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v6 != v3) {
        goto LABEL_28;
      }
LABEL_25:
      if (v4 == v2) {
        char v9 = 1;
      }
      else {
LABEL_28:
      }
        char v9 = sub_1000EAB20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_1000C3A78(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x746F6F7223;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x746F6F7223;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000023;
      unint64_t v6 = "showStoriesFromFavoritesSpecifierID";
      goto LABEL_6;
    case 2:
      unint64_t v5 = 0xD00000000000001DLL;
      unint64_t v6 = "sports_favorites_sync_setting";
      goto LABEL_6;
    case 3:
      unint64_t v3 = 0x80000001000FD050;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000024;
      unint64_t v6 = "puzzles_settings_game_center_enabled";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x79636176697250;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000023;
      uint64_t v8 = "showStoriesFromFavoritesSpecifierID";
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD00000000000001DLL;
      uint64_t v8 = "sports_favorites_sync_setting";
      goto LABEL_14;
    case 3:
      unint64_t v7 = 0x80000001000FD050;
      if (v5 != 0xD000000000000010) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v2 = 0xD000000000000024;
      uint64_t v8 = "puzzles_settings_game_center_enabled";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      goto LABEL_15;
    case 5:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x79636176697250) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_19:
      }
        char v9 = sub_1000EAB20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

Swift::Int sub_1000C3C5C()
{
  return sub_1000EABE0();
}

uint64_t sub_1000C3D7C()
{
  sub_1000EA330();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C3EF8()
{
  sub_1000EA330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000C4004()
{
  return sub_1000EABE0();
}

uint64_t sub_1000C4120()
{
  sub_1000E8650();
  return v1;
}

unint64_t sub_1000C4154(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000023;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000024;
      break;
    case 5:
      unint64_t result = 0x79636176697250;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000C422C(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000023;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000024;
      break;
    case 5:
      unint64_t result = 0x79636176697250;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000C4304(unint64_t result)
{
  unint64_t v1 = 0xD000000000000023;
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
      goto LABEL_7;
    case 2:
      unint64_t v1 = 0xD00000000000001DLL;
      goto LABEL_7;
    case 3:
      unint64_t v1 = 0xD000000000000010;
      goto LABEL_7;
    case 4:
      unint64_t v1 = 0xD000000000000024;
      goto LABEL_7;
    case 5:
      unint64_t v1 = 0x79636176697250;
LABEL_7:
      unint64_t result = v1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000C43C8(unsigned __int8 *a1, char *a2)
{
  return sub_1000C3A78(*a1, *a2);
}

unint64_t sub_1000C43D8()
{
  unint64_t result = qword_10013A870;
  if (!qword_10013A870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A870);
  }
  return result;
}

Swift::Int sub_1000C442C()
{
  return sub_1000C3C5C();
}

uint64_t sub_1000C4434()
{
  return sub_1000C3EF8();
}

Swift::Int sub_1000C443C()
{
  return sub_1000C4004();
}

uint64_t sub_1000C4444@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000C6620(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000C4474@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000C422C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000C44A0()
{
  return sub_10001D100(&qword_10013A878, (uint64_t *)&unk_10013A880);
}

void sub_1000C44DC(void *a1@<X8>)
{
  *a1 = &off_100124710;
}

unint64_t sub_1000C44EC()
{
  return sub_1000C4154(*v0);
}

uint64_t sub_1000C44F4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000C6620(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000C453C()
{
  unint64_t v3 = sub_1000C4304(*v0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  return sub_10001C5B8(v4, v1, v3, v2);
}

unint64_t sub_1000C45C8()
{
  unint64_t result = qword_10013A890;
  if (!qword_10013A890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A890);
  }
  return result;
}

uint64_t sub_1000C461C()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000E8A70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000E8910();
  sub_10001C500(v5, qword_10014BD60);
  sub_10001C4C8(v5, (uint64_t)qword_10014BD60);
  sub_1000E8A50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000E8900();
}

uint64_t sub_1000C4790(char a1)
{
  uint64_t v2 = sub_10001B38C(&qword_1001364A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E8A70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      sub_1000E8A50();
      sub_1000E8A50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      uint64_t v13 = sub_1000E8800();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
      sub_1000E8A50();
      uint64_t result = sub_1000E8810();
      break;
    default:
      sub_1000E8A50();
      sub_1000E8A50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_1000E87F0();
      uint64_t v11 = sub_1000E8800();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
      sub_10001B38C(&qword_10013A978);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000F2570;
      sub_1000E8A50();
      sub_1000E8A50();
      sub_1000E8A50();
      uint64_t result = sub_1000E8820();
      break;
  }
  return result;
}

uint64_t sub_1000C4EAC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10013A9B8 + dword_10013A9B8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100023E44;
  return v4();
}

unint64_t sub_1000C4F54()
{
  unint64_t result = qword_10013A8A0;
  if (!qword_10013A8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8A0);
  }
  return result;
}

unint64_t sub_1000C4FAC()
{
  unint64_t result = qword_10013A8A8;
  if (!qword_10013A8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8A8);
  }
  return result;
}

unint64_t sub_1000C5004()
{
  unint64_t result = qword_10013A8B0[0];
  if (!qword_10013A8B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10013A8B0);
  }
  return result;
}

uint64_t sub_1000C5058(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10013A9C0 + dword_10013A9C0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100024108;
  return v5(a1);
}

uint64_t sub_1000C5100(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10013A9B8 + dword_10013A9B8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100026474;
  return v4();
}

unint64_t sub_1000C51A8()
{
  unint64_t result = qword_10013A8C8;
  if (!qword_10013A8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8C8);
  }
  return result;
}

unint64_t sub_1000C5204()
{
  unint64_t result = qword_10013A8D0;
  if (!qword_10013A8D0)
  {
    sub_10001B3D0(qword_10013A8D8);
    sub_10009119C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8D0);
  }
  return result;
}

uint64_t sub_1000C5278(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000C45C8();
  *uint64_t v5 = v2;
  v5[1] = sub_10001A400;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000C532C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10013A9B0 + dword_10013A9B0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10002452C;
  return v4();
}

unint64_t sub_1000C53D4()
{
  unint64_t result = qword_10013A8F0;
  if (!qword_10013A8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8F0);
  }
  return result;
}

uint64_t sub_1000C5428()
{
  uint64_t v0 = sub_10001B38C(&qword_10013A9A0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_10013A9A8);
  __chkstk_darwin(v4);
  sub_1000C5004();
  sub_1000E88E0();
  v7._object = (void *)0x8000000100100790;
  v7._countAndFlagsBits = 0xD00000000000003DLL;
  sub_1000E88D0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000E88C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_1000E88D0(v8);
  return sub_1000E88F0();
}

unint64_t sub_1000C55E8()
{
  unint64_t result = qword_10013A8F8;
  if (!qword_10013A8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A8F8);
  }
  return result;
}

unint64_t sub_1000C5640()
{
  unint64_t result = qword_10013A900;
  if (!qword_10013A900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A900);
  }
  return result;
}

unint64_t sub_1000C5698()
{
  unint64_t result = qword_10013A908;
  if (!qword_10013A908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A908);
  }
  return result;
}

unint64_t sub_1000C56F0()
{
  unint64_t result = qword_10013A910;
  if (!qword_10013A910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A910);
  }
  return result;
}

uint64_t sub_1000C5744()
{
  sub_1000C65CC();
  uint64_t v2 = sub_1000E8870();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10001C5B8(v3, v0, v2, v1);
}

unint64_t sub_1000C57DC()
{
  unint64_t result = qword_10013A920;
  if (!qword_10013A920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A920);
  }
  return result;
}

unint64_t sub_1000C5834()
{
  unint64_t result = qword_10013A928;
  if (!qword_10013A928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A928);
  }
  return result;
}

unint64_t sub_1000C588C()
{
  unint64_t result = qword_10013A930;
  if (!qword_10013A930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A930);
  }
  return result;
}

unint64_t sub_1000C58E4()
{
  unint64_t result = qword_10013A938;
  if (!qword_10013A938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A938);
  }
  return result;
}

uint64_t sub_1000C5938@<X0>(uint64_t a1@<X8>)
{
  return sub_100025108(&qword_100135DB0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10014BD60, a1);
}

uint64_t sub_1000C5970()
{
  return sub_10001D100(&qword_10013A940, &qword_10013A948);
}

uint64_t sub_1000C59AC(uint64_t a1)
{
  unint64_t v2 = sub_1000C5004();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000C59FC()
{
  unint64_t result = qword_10013A950;
  if (!qword_10013A950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A950);
  }
  return result;
}

uint64_t sub_1000C5A50()
{
  return sub_1000C4790(*v0);
}

uint64_t sub_1000C5A58(uint64_t a1)
{
  unint64_t v2 = sub_1000C588C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000C5AA8()
{
  unint64_t result = qword_10013A958;
  if (!qword_10013A958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A958);
  }
  return result;
}

uint64_t sub_1000C5AFC()
{
  uint64_t v0 = sub_1000E8A70();
  sub_10001C500(v0, qword_10014BD78);
  sub_10001C4C8(v0, (uint64_t)qword_10014BD78);
  return sub_1000E8A50();
}

uint64_t sub_1000C5B64(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000C6524();
  unint64_t v5 = sub_1000C65CC();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000C5BD0()
{
  unint64_t result = qword_10013A960;
  if (!qword_10013A960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A960);
  }
  return result;
}

unint64_t sub_1000C5C28()
{
  unint64_t result = qword_10013A968;
  if (!qword_10013A968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A968);
  }
  return result;
}

uint64_t sub_1000C5C7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C5CCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100025108(&qword_100135DB8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10014BD78, a1);
}

uint64_t sub_1000C5D04(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000C6524();
  unint64_t v7 = sub_1000C6578();
  unint64_t v8 = sub_1000C65CC();
  *unint64_t v5 = v2;
  v5[1] = sub_100025294;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000C5DD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000C60B0();
  *a1 = result;
  return result;
}

uint64_t sub_1000C5E00(uint64_t a1)
{
  unint64_t v2 = sub_1000910D4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenNewsSettingsDynamicDeepLinks()
{
  return &type metadata for OpenNewsSettingsDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for NewsSettingsDynamicDeepLinks()
{
  return &type metadata for NewsSettingsDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for NewsSettingsDynamicDeepLinks.AvailableNewsSettingsDynamicDestinationQuery()
{
  return &type metadata for NewsSettingsDynamicDeepLinks.AvailableNewsSettingsDynamicDestinationQuery;
}

unsigned char *_s10NewsToday230NewsSettingsDynamicDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1000C5F40);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsSettingsDynamicDestination()
{
  return &type metadata for NewsSettingsDynamicDestination;
}

void sub_1000C5F78(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1 + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (v2 != v1)
  {
    unint64_t v5 = v1;
    if (v4 == v1)
    {
      __break(1u);
      return;
    }
    int v6 = *(unsigned __int8 *)(v3 + v1);
    if (v6 == 2)
    {
      id v7 = [self sharedAccount];
      unsigned int v8 = [v7 isUserSignedInToiCloud];

      unint64_t v1 = v5 + 1;
      if (!v8) {
        continue;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_100030580(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v10 = _swiftEmptyArrayStorage[2];
    unint64_t v9 = _swiftEmptyArrayStorage[3];
    if (v10 >= v9 >> 1) {
      sub_100030580(v9 > 1, v10 + 1, 1);
    }
    unint64_t v1 = v5 + 1;
    _swiftEmptyArrayStorage[2] = v10 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage[4] + v10) = v6;
    goto LABEL_2;
  }
}

uint64_t sub_1000C60B0()
{
  uint64_t v0 = sub_1000E8860();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10001B38C(&qword_100136500);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_1000E8A60();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E8CC0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_1000EA270();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v13 - 8);
  char v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000E8A70();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_10001B38C(&qword_10013A980);
  sub_1000E8A50();
  sub_1000EA260();
  sub_1000E8C90();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_1000E8A80();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  char v26 = 6;
  uint64_t v18 = sub_1000E8600();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_1000C5004();
  return sub_1000E8670();
}

unint64_t sub_1000C6524()
{
  unint64_t result = qword_10013A988;
  if (!qword_10013A988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A988);
  }
  return result;
}

unint64_t sub_1000C6578()
{
  unint64_t result = qword_10013A990;
  if (!qword_10013A990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A990);
  }
  return result;
}

unint64_t sub_1000C65CC()
{
  unint64_t result = qword_10013A998;
  if (!qword_10013A998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A998);
  }
  return result;
}

uint64_t sub_1000C6620(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100124660;
  v6._object = a2;
  unint64_t v4 = sub_1000EA9E0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000C666C()
{
  return _swift_task_switch(sub_1000C6688, 0, 0);
}

uint64_t sub_1000C6688()
{
  sub_1000C5F78((uint64_t)&off_100124738);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_100030558(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1) {
        sub_100030558(v7 > 1, v5 + v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(_swiftEmptyArrayStorage);
}

uint64_t sub_1000C67C8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000C67E8, 0, 0);
}

uint64_t sub_1000C67E8()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_1000C5F78(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_100030558(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage[2];
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v6 + v5 >= v8 >> 1) {
        sub_100030558(v8 > 1, v6 + v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v6 + v5++) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(_swiftEmptyArrayStorage);
}

uint64_t sub_1000C6934()
{
  return _swift_task_switch(sub_1000C6950, 0, 0);
}

uint64_t sub_1000C6950()
{
  sub_1000C5F78((uint64_t)&off_100124760);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 6;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

id sub_1000C69DC()
{
  id result = [self mainBundle];
  qword_10013A9C8 = (uint64_t)result;
  return result;
}

void sub_1000C6A18()
{
  if (qword_100135DC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10013A9C8;
  NSString v1 = sub_1000EA280();
  id v2 = [self imageNamed:v1 inBundle:v0 compatibleWithTraitCollection:0];

  if (v2)
  {
    id v3 = [v2 imageWithRenderingMode:2];

    qword_10014BD90 = (uint64_t)v3;
  }
  else
  {
    __break(1u);
  }
}

void sub_1000C6B04()
{
  if (qword_100135DC0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10013A9C8;
  NSString v1 = sub_1000EA280();
  id v2 = [self imageNamed:v1 inBundle:v0 compatibleWithTraitCollection:0];

  if (v2) {
    qword_10014BD98 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

id Images.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Images();
  return [super init];
}

uint64_t type metadata accessor for Images()
{
  return self;
}

id Images.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Images();
  return [super dealloc];
}

unint64_t sub_1000C6CA4()
{
  unint64_t result = qword_10013AA08;
  if (!qword_10013AA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA08);
  }
  return result;
}

uint64_t sub_1000C6CF8()
{
  return sub_10001D100(&qword_10013AA10, &qword_10013AA18);
}

uint64_t sub_1000C6D34()
{
  uint64_t v0 = sub_10001B38C(&qword_10013AA58);
  sub_10001C500(v0, qword_10014BDA0);
  sub_10001C4C8(v0, (uint64_t)qword_10014BDA0);
  sub_1000C8724();
  return sub_1000E8840();
}

uint64_t sub_1000C6DB0(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_1000E8A60();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_1000E8CC0();
  v1[6] = swift_task_alloc();
  sub_1000EA270();
  v1[7] = swift_task_alloc();
  sub_1000E8A70();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000C6EF4, 0, 0);
}

uint64_t sub_1000C6EF4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = (uint64_t *)v0[2];
  sub_10001B38C(&qword_10013AA18);
  sub_1000EA260();
  sub_1000E8C90();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_1000E8A80();
  sub_10001D100(&qword_10013AAE8, &qword_10013AAF0);
  *uint64_t v4 = sub_1000E8930();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1000C7098()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000E8A60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8CC0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000EA270();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E8A70();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000E8910();
  sub_10001C500(v10, qword_10014BDB8);
  sub_10001C4C8(v10, (uint64_t)qword_10014BDB8);
  sub_1000EA260();
  sub_1000E8C90();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000E8A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1000E8900();
}

uint64_t sub_1000C7370()
{
  uint64_t v0 = sub_10001B38C(&qword_10013AAC8);
  sub_10001C500(v0, qword_10014BDD0);
  sub_10001C4C8(v0, (uint64_t)qword_10014BDD0);
  sub_1000C81C8();
  return sub_1000E88B0();
}

uint64_t sub_1000C73EC()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364A0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8A70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_1000E8A50();
  sub_1000E8A50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v9 = sub_1000E8800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_1000E8A50();
  return sub_1000E8810();
}

uint64_t sub_1000C7630()
{
  uint64_t v0 = sub_1000E8A70();
  sub_10001C500(v0, qword_10014BDE8);
  sub_10001C4C8(v0, (uint64_t)qword_10014BDE8);
  return sub_1000E8A50();
}

uint64_t sub_1000C7694()
{
  uint64_t v0 = sub_10001B38C(&qword_100136528);
  sub_10001C500(v0, qword_10014BE00);
  uint64_t v1 = sub_10001C4C8(v0, (uint64_t)qword_10014BE00);
  sub_1000E87D0();
  uint64_t v2 = sub_1000E87E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000C774C()
{
  uint64_t result = swift_getKeyPath();
  qword_10014BE18 = result;
  return result;
}

uint64_t sub_1000C7774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_1000C7798, 0, 0);
}

uint64_t sub_1000C7798()
{
  sub_1000E8650();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_1000E8650();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100135E00 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10014BE18;
  *(void *)(v0 + 80) = qword_10014BE18;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_10001D100(&qword_10013AAE8, &qword_10013AAF0);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_1000C78F4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000C78F4()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100019FD8;
  }
  else {
    uint64_t v2 = sub_1000C7A48;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C7A48()
{
  sub_1000E8650();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10014BE18;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100019DFC;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_1000C7B24()
{
  if (qword_100135E00 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000C7B84()
{
  unint64_t result = qword_10013AA20;
  if (!qword_10013AA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA20);
  }
  return result;
}

unint64_t sub_1000C7BDC()
{
  unint64_t result = qword_10013AA28;
  if (!qword_10013AA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA28);
  }
  return result;
}

uint64_t sub_1000C7C30()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000C7C64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C7CB4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A9E4(&qword_100135DF0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10014BDE8, a1);
}

uint64_t sub_1000C7CEC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100135DF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B38C(&qword_100136528);
  uint64_t v3 = sub_10001C4C8(v2, (uint64_t)qword_10014BE00);

  return sub_10001CB68(v3, a1);
}

uint64_t sub_1000C7D68(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10001A400;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_1000C7798, 0, 0);
}

uint64_t sub_1000C7E1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000C8EE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000C7E44()
{
  return 0xD000000000000034;
}

unint64_t sub_1000C7E64()
{
  unint64_t result = qword_10013AA38;
  if (!qword_10013AA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA38);
  }
  return result;
}

unint64_t sub_1000C7EBC()
{
  unint64_t result = qword_10013AA40;
  if (!qword_10013AA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA40);
  }
  return result;
}

unint64_t sub_1000C7F14()
{
  unint64_t result = qword_10013AA48;
  if (!qword_10013AA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA48);
  }
  return result;
}

uint64_t sub_1000C7F68()
{
  return sub_10001D100(&qword_10013AA50, &qword_10013AA58);
}

uint64_t sub_1000C7FA4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000C7FC4, 0, 0);
}

uint64_t sub_1000C7FC4()
{
  if (qword_100135C08 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  swift_retain();
  swift_retain();
  sub_1000E8D20();
  swift_release();
  swift_release();
  *uint64_t v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000C80A0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_1000C80C4, 0, 0);
}

uint64_t sub_1000C80C4()
{
  if (qword_100135C08 != -1) {
    swift_once();
  }
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  swift_retain();
  swift_retain();
  sub_1000E8D30();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C8198@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A834(&qword_100135DD8, &qword_10013AA58, (uint64_t)qword_10014BDA0, a1);
}

unint64_t sub_1000C81C8()
{
  unint64_t result = qword_10013AA60;
  if (!qword_10013AA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA60);
  }
  return result;
}

uint64_t sub_1000C821C()
{
  return sub_10001D100(&qword_10013AA68, &qword_10013AA58);
}

uint64_t sub_1000C8258()
{
  uint64_t v0 = qword_10013A9F8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000C8294()
{
  unint64_t result = qword_10013AA70;
  if (!qword_10013AA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA70);
  }
  return result;
}

uint64_t sub_1000C82E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A834(&qword_100135DE8, &qword_10013AAC8, (uint64_t)qword_10014BDD0, a1);
}

unint64_t sub_1000C8318()
{
  unint64_t result = qword_10013AA78;
  if (!qword_10013AA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA78);
  }
  return result;
}

unint64_t sub_1000C8370()
{
  unint64_t result = qword_10013AA80;
  if (!qword_10013AA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA80);
  }
  return result;
}

unint64_t sub_1000C83C8()
{
  unint64_t result = qword_10013AA88;
  if (!qword_10013AA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA88);
  }
  return result;
}

unint64_t sub_1000C8420()
{
  unint64_t result = qword_10013AA90;
  if (!qword_10013AA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AA90);
  }
  return result;
}

uint64_t sub_1000C8474@<X0>(uint64_t *a1@<X8>)
{
  sub_1000C8724();
  uint64_t result = sub_1000E8630();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000C84B4()
{
  sub_1000C86D0();
  uint64_t v2 = sub_1000E8870();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10001C5B8(v3, v0, v2, v1);
}

uint64_t sub_1000C8548@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A9E4(&qword_100135DE0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10014BDB8, a1);
}

uint64_t sub_1000C8580()
{
  return sub_10001D100(&qword_10013AAA0, &qword_10013AAA8);
}

uint64_t sub_1000C85BC(uint64_t a1)
{
  unint64_t v2 = sub_1000C81C8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000C860C()
{
  unint64_t result = qword_10013AAB0;
  if (!qword_10013AAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AAB0);
  }
  return result;
}

uint64_t sub_1000C8664(uint64_t a1)
{
  unint64_t v2 = sub_1000C8420();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for RestrictStoriesInTodaySettingEntity()
{
  return &type metadata for RestrictStoriesInTodaySettingEntity;
}

ValueMetadata *type metadata accessor for RestrictStoriesInTodaySettingEntity.UpdateIntent_value()
{
  return &type metadata for RestrictStoriesInTodaySettingEntity.UpdateIntent_value;
}

unint64_t sub_1000C86D0()
{
  unint64_t result = qword_10013AAB8;
  if (!qword_10013AAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AAB8);
  }
  return result;
}

unint64_t sub_1000C8724()
{
  unint64_t result = qword_10013AAC0;
  if (!qword_10013AAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AAC0);
  }
  return result;
}

uint64_t sub_1000C8778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_10001B38C(&qword_100136608);
  uint64_t v29 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_100136610);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v30 = v4;
  uint64_t v31 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001B38C(&qword_100139600);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  uint64_t v33 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001B38C(&qword_100139608);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  uint64_t v35 = v13;
  __chkstk_darwin(v12);
  uint64_t v28 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10001B38C(&qword_100136620);
  sub_1000C8724();
  uint64_t v15 = sub_10001B3D0(&qword_100136628);
  uint64_t v16 = sub_1000E9740();
  uint64_t v17 = sub_10001D100(&qword_100136630, &qword_100136628);
  unint64_t v18 = sub_1000397BC();
  uint64_t v37 = v15;
  uint64_t v38 = v16;
  uint64_t v39 = v17;
  unint64_t v40 = v18;
  swift_getOpaqueTypeConformance2();
  sub_1000EA070();
  sub_1000E9680();
  uint64_t v19 = sub_10001D100((unint64_t *)&unk_100136640, &qword_100136608);
  sub_1000E9780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v1);
  sub_1000E9680();
  uint64_t v37 = v1;
  uint64_t v38 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v30;
  sub_1000E9750();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v21);
  uint64_t v37 = v21;
  uint64_t v38 = OpaqueTypeConformance2;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v28;
  uint64_t v24 = v32;
  sub_1000E97B0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v24);
  uint64_t v37 = v24;
  uint64_t v38 = v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v34;
  sub_1000E9770();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v23, v25);
}

uint64_t sub_1000C8CE4()
{
  uint64_t v0 = sub_1000E9740();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_100136628);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E9680();
  sub_1000E9CD0();
  sub_1000E9730();
  sub_10001D100(&qword_100136630, &qword_100136628);
  sub_1000397BC();
  sub_1000E9AA0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000C8EE0()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000E8860();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B38C(&qword_100136500);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000E8A70();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_10001B38C(&qword_10013AAF8);
  sub_1000E8A50();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000E8600();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  char v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000C81C8();
  uint64_t v19 = v23;
  uint64_t v24 = sub_1000E8670();
  sub_10001B38C(&qword_100136510);
  sub_1000E8A50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_1000EA540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_1000E8690();
  return v24;
}

uint64_t sub_1000C9320@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for RestrictStoriesInTodayToggleControl()
{
  return &type metadata for RestrictStoriesInTodayToggleControl;
}

uint64_t sub_1000C933C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C9358()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000C9484(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (objc_class *)type metadata accessor for WidgetPersonalizationConfigurationManager();
  id v5 = objc_allocWithZone(v4);
  uint64_t v6 = (objc_class *)sub_1000E9120();
  objc_allocWithZone(v6);
  swift_unknownObjectRetain();
  uint64_t v7 = (char *)v5;
  uint64_t v8 = sub_1000E9110();
  uint64_t v9 = (uint64_t *)&v7[OBJC_IVAR____TtC10NewsToday241WidgetPersonalizationConfigurationManager_configurationManager];
  v9[3] = (uint64_t)v6;
  v9[4] = (uint64_t)&protocol witness table for NewsAppConfigurationManager;
  *uint64_t v9 = v8;

  v18.receiver = v7;
  v18.super_class = v4;
  id v10 = [super init];
  sub_1000E91D0();
  sub_1000C96EC();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v11 = a1;
  id v12 = v10;
  uint64_t v13 = (void *)sub_1000E9190();
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC10NewsToday223FeedPersonalizerFactory_configurationSet);
  id v15 = objc_allocWithZone((Class)type metadata accessor for WidgetPersonalizationService());
  id v16 = sub_10004BACC(v13, v14);

  return v16;
}

uint64_t type metadata accessor for FeedPersonalizerFactory()
{
  return self;
}

unint64_t sub_1000C96EC()
{
  unint64_t result = qword_10013AB48;
  if (!qword_10013AB48)
  {
    type metadata accessor for WidgetPersonalizationConfigurationManager();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AB48);
  }
  return result;
}

uint64_t sub_1000C9744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = sub_10007441C;
  v9[3] = v8;
  v9[4] = a3;
  v9[5] = a4;
  swift_retain();
  swift_retain();
  sub_1000EA030();

  return swift_release();
}

uint64_t sub_1000C9810(uint64_t a1, char a2, void (*a3)(void), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_1000EA000();
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v38 = v10;
  __chkstk_darwin(v10);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NewsWidgetInfo();
  uint64_t v36 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v15 = (uint64_t *)((char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a2)
  {
    swift_errorRetain();
    a5(a1);
    return sub_1000C9C88(a1, 1);
  }
  int64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = &_swiftEmptyArrayStorage;
  if (!v16) {
    goto LABEL_24;
  }
  uint64_t v32 = a4;
  uint64_t v33 = a3;
  uint64_t v39 = &_swiftEmptyArrayStorage;
  sub_1000305A8(0, v16, 0);
  objc_super v18 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
  unint64_t v19 = a1 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
  uint64_t v34 = *(void *)(v37 + 72);
  uint64_t v35 = v18;
  v37 += 16;
  uint64_t v20 = (void (**)(char *, uint64_t))(v37 - 8);
  do
  {
    v35(v12, v19, v38);
    uint64_t v21 = sub_1000E9FD0();
    if (!v21)
    {
      uint64_t v25 = 0;
      goto LABEL_14;
    }
    uint64_t v22 = (void *)v21;
    swift_getObjectType();
    uint64_t v23 = swift_conformsToProtocol2();
    if (v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    if (v23) {
      uint64_t v25 = v22;
    }
    else {
      uint64_t v25 = 0;
    }
    if (!v25)
    {

LABEL_14:
      uint64_t v24 = 0;
    }
    sub_1000E9FE0();
    uint64_t v26 = sub_1000E9FF0();
    *id v15 = v25;
    v15[1] = v24;
    unsigned int v27 = (void *)((char *)v15 + *(int *)(v13 + 24));
    *unsigned int v27 = v26;
    v27[1] = v28;
    (*v20)(v12, v38);
    uint64_t v17 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1000305A8(0, v17[2] + 1, 1);
      uint64_t v17 = v39;
    }
    unint64_t v30 = v17[2];
    unint64_t v29 = v17[3];
    if (v30 >= v29 >> 1)
    {
      sub_1000305A8(v29 > 1, v30 + 1, 1);
      uint64_t v17 = v39;
    }
    v17[2] = v30 + 1;
    sub_1000C9C94((uint64_t)v15, (uint64_t)v17+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v30);
    v19 += v34;
    --v16;
  }
  while (v16);
  a3 = v33;
LABEL_24:
  a3(v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C9B54()
{
  return sub_1000E90A0();
}

uint64_t sub_1000C9BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000C9744(a1, a2, a3, a4);
}

uint64_t sub_1000C9BB4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C9BEC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000C9C2C(uint64_t a1, char a2)
{
  return sub_1000C9810(a1, a2 & 1, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t))(v2 + 32));
}

uint64_t type metadata accessor for NewsWidgetInfo()
{
  uint64_t result = qword_10013ABB0;
  if (!qword_10013ABB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C9C88(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000C9C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NewsWidgetInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_1000C9CF8(char *a1, char **a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  id v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    uint64_t v3 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    *(void *)a1 = v5;
    *((void *)a1 + 1) = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_1000E9F60();
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    uint64_t v14 = v5;
    v13(v10, v11, v12);
    uint64_t v15 = *(int *)(a3 + 24);
    int64_t v16 = &v3[v15];
    uint64_t v17 = (char **)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *(void *)int64_t v16 = *v17;
    *((void *)v16 + 1) = v18;
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_1000C9E08(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1000E9F60();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

long long *sub_1000C9E98(long long *a1, long long *a2, uint64_t a3)
{
  long long v17 = *a2;
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000E9F60();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = (id)v17;
  v10(v7, v8, v9);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000C9F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v9 = v6;

  *(void *)(a1 + 8) = v7;
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_1000E9F60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)(a1 + v14);
  int64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1000CA028(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000E9F60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000CA0C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1000E9F60();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000CA174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CA188);
}

uint64_t sub_1000CA188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E9F60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1000CA250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CA264);
}

uint64_t sub_1000CA264(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000E9F60();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000CA328()
{
  uint64_t result = sub_1000E9F60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000CA3C8()
{
  uint64_t result = type metadata accessor for TaskContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000EA730();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_1000CA4E4(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = swift_allocObject();
  sub_1000CA544(a1, a2, a3);
  return v6;
}

double *sub_1000CA544(uint64_t a1, uint64_t a2, double a3)
{
  int v4 = v3;
  uint64_t v8 = *(void *)v3;
  uint64_t v9 = sub_1000E8E30();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_1000E8C80();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8C70();
  uint64_t v14 = sub_1000E8C60();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  *((void *)v4 + 2) = v14;
  *((void *)v4 + 3) = v16;
  uint64_t v17 = qword_10013ABF8;
  *(void *)((char *)v4 + v17) = dispatch_group_create();
  uint64_t v18 = qword_10013AC00;
  *(void *)((char *)v4 + v18) = dispatch_group_create();
  uint64_t v19 = qword_10013AC08;
  sub_1000E8E20();
  sub_1000E8E50();
  swift_allocObject();
  *(void *)((char *)v4 + v19) = sub_1000E8E40();
  *(void *)((char *)v4 + qword_10013AC10) = _swiftEmptyArrayStorage;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(*(void *)(v8 + 80) - 8) + 56))((char *)v4 + *(void *)(*(void *)v4 + 168), 1, 1);
  v4[4] = a3 + -1.0;
  *((void *)v4 + 5) = a1;
  sub_1000CF6F4(a2, (uint64_t)v4 + qword_10013ABF0);
  return v4;
}

uint64_t sub_1000CA778(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000E9E00();
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v51 = v6;
  __chkstk_darwin(v6);
  unint64_t v48 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1000E9E30();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v46 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E9DF0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char **)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = sub_1000E9E60();
  uint64_t v45 = *(void *)(v53 - 8);
  uint64_t v13 = __chkstk_darwin(v53);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v52 = (char *)&v40 - v16;
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v17 = sub_1000EA720();
  os_log_type_t v18 = sub_1000EA620();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v42 = v9;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v43 = a1;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = (void **)swift_slowAlloc();
    uint64_t v44 = a2;
    aBlock = v21;
    unint64_t v40 = v15;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v41 = v10;
    uint64_t v22 = *(void *)(v3 + 16);
    unint64_t v23 = *(void *)(v3 + 24);
    swift_bridgeObjectRetain();
    uint64_t v24 = v22;
    uint64_t v9 = v42;
    uint64_t v54 = (void *)sub_1000B1D7C(v24, v23, (uint64_t *)&aBlock);
    uint64_t v15 = v40;
    sub_1000EA750();
    swift_release_n();
    uint64_t v10 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "task manager %s will start task", v20, 0xCu);
    swift_arrayDestroy();
    a2 = v44;
    swift_slowDealloc();
    a1 = v43;
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  dispatch_group_enter(*(dispatch_group_t *)(v3 + qword_10013ABF8));
  uint64_t v25 = *(NSObject **)(v3 + qword_10013AC00);
  dispatch_group_enter(v25);
  uint64_t result = sub_1000E9E40();
  double v27 = *(double *)(v3 + 32);
  if ((~*(void *)&v27 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v27 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v27 < 9.22337204e18)
  {
    *uint64_t v12 = (uint64_t)v27;
    (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchTimeInterval.seconds(_:), v9);
    sub_1000E9E90();
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v45 = *(void *)(v45 + 8);
    ((void (*)(char *, uint64_t))v45)(v15, v53);
    sub_100022374(0, &qword_1001382D8);
    uint64_t v44 = v25;
    uint64_t v28 = (void *)sub_1000EA680();
    unint64_t v29 = (void *)swift_allocObject();
    v29[2] = v3;
    v29[3] = a1;
    v29[4] = a2;
    swift_retain();
    swift_retain();
    sub_1000E9E50();
    unint64_t v30 = (void *)swift_allocObject();
    v30[2] = v3;
    v30[3] = v28;
    v30[4] = sub_1000CF4B8;
    v30[5] = v29;
    unint64_t v59 = sub_1000CF50C;
    uint64_t v60 = v30;
    aBlock = _NSConcreteStackBlock;
    uint64_t v56 = 1107296256;
    uint64_t v57 = sub_10003B648;
    uint64_t v58 = &unk_1001277E0;
    uint64_t v31 = _Block_copy(&aBlock);
    swift_retain();
    id v32 = v28;
    swift_retain();
    swift_release();
    id v33 = (id)FCHandleOperationTimeout();
    _Block_release(v31);
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v33;
    uint64_t v35 = (void *)swift_allocObject();
    void v35[2] = v3;
    v35[3] = sub_1000CF568;
    v35[4] = v34;
    v35[5] = sub_1000CF4B8;
    v35[6] = v29;
    unint64_t v59 = sub_1000CF5D4;
    uint64_t v60 = v35;
    aBlock = _NSConcreteStackBlock;
    uint64_t v56 = 1107296256;
    uint64_t v57 = sub_10003B648;
    uint64_t v58 = &unk_100127858;
    uint64_t v36 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v37 = v46;
    sub_1000E9E10();
    uint64_t v54 = _swiftEmptyArrayStorage;
    sub_1000CF5E4();
    sub_10001B38C(&qword_10013A340);
    sub_1000CF63C();
    uint64_t v38 = v48;
    uint64_t v39 = v51;
    sub_1000EA7C0();
    sub_1000EA640();
    _Block_release(v36);

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v39);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v49);
    ((void (*)(char *, uint64_t))v45)(v52, v53);
    return swift_release();
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1000CAF1C(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = *(void *)(*a1 + 80);
  uint64_t v7 = sub_1000EA730();
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v28 = (char *)&v24 - v11;
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v12 = sub_1000EA720();
  os_log_type_t v13 = sub_1000EA620();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = v6;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v25 = v7;
    uint64_t v26 = a3;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v24 = v15 + 4;
    uint64_t v16 = a2;
    uint64_t v17 = a1[2];
    unint64_t v18 = a1[3];
    swift_bridgeObjectRetain();
    uint64_t v19 = v17;
    a2 = v16;
    uint64_t v30 = sub_1000B1D7C(v19, v18, &v31);
    uint64_t v7 = v25;
    sub_1000EA750();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "task manager %s invoking result handler", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v27;
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v31 = *(void *)((char *)a1 + qword_10013AC08);
  sub_1000E8E50();
  swift_retain();
  uint64_t v20 = v28;
  sub_1000E9010();
  swift_release();
  uint64_t v21 = v29;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v10, v20, v7);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v10, 1, v6);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    a2(v10);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_1000CB29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(void *)(*(void *)a1 + 168);
  swift_beginAccess();
  uint64_t v4 = sub_1000EA730();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_1000CB350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1000E9E00();
  __chkstk_darwin(v7);
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v8 = sub_1000EA720();
  os_log_type_t v9 = sub_1000EA620();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v12 = *(void *)(a1 + 16);
    unint64_t v11 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    uint64_t v15 = (void *)sub_1000B1D7C(v12, v11, aBlock);
    sub_1000EA750();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "task manager %s invoking cancellation handler", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v15 = *(void **)(a1 + qword_10013AC08);
  sub_1000E8E50();
  swift_retain();
  sub_10001B38C(&qword_10013AD30);
  sub_1000E9010();
  swift_release();
  swift_bridgeObjectRelease();
  aBlock[4] = a3;
  aBlock[5] = a4;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10003B648;
  void aBlock[3] = (uint64_t)&unk_100127880;
  _Block_copy(aBlock);
  uint64_t v15 = _swiftEmptyArrayStorage;
  sub_1000CF5E4();
  swift_retain();
  sub_10001B38C(&qword_10013A340);
  sub_1000CF63C();
  sub_1000EA7C0();
  sub_1000E9E80();
  swift_allocObject();
  sub_1000E9E70();
  swift_release();
  sub_1000EA650();
  return swift_release();
}

uint64_t sub_1000CB6CC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t (*a4)(void))
{
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v7 = sub_1000EA720();
  os_log_type_t v8 = sub_1000EA620();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 136315138;
    os_log_type_t v13 = a2;
    uint64_t v10 = *(void *)(a1 + 16);
    unint64_t v11 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    sub_1000B1D7C(v10, v11, &v14);
    sub_1000EA750();
    swift_release_n();
    a2 = v13;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "task manager %s completed all tasks", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t result = a2();
  if ((result & 1) == 0) {
    return a4();
  }
  return result;
}

void sub_1000CB8A0()
{
  uint64_t v1 = v0;
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v2 = sub_1000EA720();
  os_log_type_t v3 = sub_1000EA620();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = *(void *)(v1 + 16);
    unint64_t v6 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_1000B1D7C(v5, v6, &v8);
    sub_1000EA750();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "task manager %s did finish task", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v8 = *(void *)(v1 + qword_10013AC08);
  __chkstk_darwin(v7);
  sub_1000E8E50();
  swift_retain();
  sub_1000E9010();
  swift_release();
  dispatch_group_leave(*(dispatch_group_t *)(v1 + qword_10013AC00));
  dispatch_group_leave(*(dispatch_group_t *)(v1 + qword_10013ABF8));
}

uint64_t sub_1000CBADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 80);
  uint64_t v5 = sub_1000EA730();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v15 - v10;
  uint64_t v12 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v15 - v10, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0, 1, v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
  uint64_t v13 = a1 + *(void *)(*(void *)a1 + 168);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v13, v9, v5);
  return swift_endAccess();
}

uint64_t sub_1000CBCAC(void *a1)
{
  uint64_t v2 = v1;
  dispatch_group_enter(*(dispatch_group_t *)(v1 + qword_10013AC00));
  *(void *)&v18[0] = *(void *)(v1 + qword_10013AC08);
  sub_1000E8E50();
  swift_retain();
  sub_1000E9010();
  swift_release();
  sub_10002D970((uint64_t)a1, (uint64_t)v18);
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  uint64_t v4 = sub_1000EA720();
  os_log_type_t v5 = sub_1000EA620();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = *(void *)(v2 + 16);
    unint64_t v8 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    v16[0] = sub_1000B1D7C(v7, v8, &v17);
    sub_1000EA750();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    sub_10002D970((uint64_t)v18, (uint64_t)v16);
    sub_10001B38C((uint64_t *)&unk_100139FC0);
    uint64_t v9 = sub_1000EA300();
    v16[0] = sub_1000B1D7C(v9, v10, &v17);
    sub_1000EA750();
    swift_bridgeObjectRelease();
    sub_100020AC0((uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "task manager %s running sidecar task %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();

    sub_100020AC0((uint64_t)v18);
  }
  unint64_t v11 = (char **)sub_100020A28(a1, a1[3]);
  sub_100034A38((char *)(v2 + qword_10013ABF0), *v11);
  sub_10002D970((uint64_t)a1, (uint64_t)v18);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v2;
  sub_1000A9708(v18, v12 + 24);
  swift_retain();
  uint64_t v13 = (void *)sub_1000E9030();
  uint64_t v14 = sub_1000E9080();
  swift_release();

  swift_release();
  return v14;
}

uint64_t sub_1000CBFF8(uint64_t a1, uint64_t a2)
{
  sub_10002D970(a2, (uint64_t)v18);
  os_log_type_t v3 = (void **)(a1 + qword_10013AC10);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  double *v3 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_1000A4E8C(0, v4[2] + 1, 1, v4);
    double *v3 = v4;
  }
  unint64_t v7 = v4[2];
  unint64_t v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_1000A4E8C((void *)(v6 > 1), v7 + 1, 1, v4);
    double *v3 = v4;
  }
  uint64_t v8 = sub_10003A4C0((uint64_t)v18, v19);
  __chkstk_darwin(v8);
  unint64_t v10 = (uint64_t *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  uint64_t v12 = *v10;
  uint64_t v16 = type metadata accessor for EventProcessingSidecarTask();
  uint64_t v17 = &off_1001257C0;
  *(void *)&long long v15 = v12;
  v4[2] = v7 + 1;
  sub_1000A9708(&v15, (uint64_t)&v4[5 * v7 + 4]);
  sub_100020AC0((uint64_t)v18);
  return swift_endAccess();
}

void sub_1000CC1B0(uint64_t a1, uint64_t a2)
{
  sub_10002D970(a2, (uint64_t)v12);
  sub_100022374(0, (unint64_t *)&qword_100138300);
  swift_retain_n();
  os_log_type_t v3 = sub_1000EA720();
  os_log_type_t v4 = sub_1000EA620();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v6 = *(void *)(a1 + 16);
    unint64_t v7 = *(void *)(a1 + 24);
    swift_bridgeObjectRetain();
    v10[0] = sub_1000B1D7C(v6, v7, &v11);
    sub_1000EA750();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    sub_10002D970((uint64_t)v12, (uint64_t)v10);
    sub_10001B38C((uint64_t *)&unk_100139FC0);
    uint64_t v8 = sub_1000EA300();
    v10[0] = sub_1000B1D7C(v8, v9, &v11);
    sub_1000EA750();
    swift_bridgeObjectRelease();
    sub_100020AC0((uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "task manager %s finished running sidecar task %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();

    sub_100020AC0((uint64_t)v12);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + qword_10013AC00));
}

id *sub_1000CC3BC()
{
  swift_bridgeObjectRelease();

  sub_1000CF758((uint64_t)v0 + qword_10013ABF0, (uint64_t (*)(void))type metadata accessor for TaskContext);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + *((void *)*v0 + 21);
  uint64_t v2 = sub_1000EA730();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1000CC4B8()
{
  sub_1000CC3BC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for TaskManager()
{
  return sub_1000674DC();
}

uint64_t type metadata accessor for TaskContext()
{
  uint64_t result = qword_10013ACF0;
  if (!qword_10013ACF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1000CC574(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000EA180();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for NewsTimelineEntry();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_10001B38C(&qword_100137588);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v74 = v12;
      uint64_t v15 = sub_1000E8C50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v9, v10, v15);
      uint64_t v75 = v11;
      uint64_t v76 = v9;
      uint64_t v16 = *(int *)(v11 + 20);
      uint64_t v17 = &v9[v16];
      unint64_t v18 = &v10[v16];
      uint64_t v19 = *(void **)&v10[v16];
      *(void *)uint64_t v17 = v19;
      uint64_t v20 = (int *)type metadata accessor for TodayContent();
      uint64_t v21 = v20[5];
      uint64_t v22 = &v17[v21];
      unint64_t v23 = &v18[v21];
      uint64_t v24 = type metadata accessor for Banner();
      uint64_t v25 = *(void **)(v24 - 8);
      uint64_t v26 = (unsigned int (*)(char *, uint64_t, uint64_t))v25[6];
      id v27 = v19;
      if (v26(v23, 1, v24))
      {
        uint64_t v28 = sub_10001B38C(&qword_1001385E0);
        memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64));
        uint64_t v29 = v17;
      }
      else
      {
        uint64_t v30 = *((void *)v23 + 1);
        *(void *)uint64_t v22 = *(void *)v23;
        *((void *)v22 + 1) = v30;
        uint64_t v31 = *((void *)v23 + 3);
        uint64_t v71 = v25;
        *((void *)v22 + 2) = *((void *)v23 + 2);
        *((void *)v22 + 3) = v31;
        uint64_t v32 = *((void *)v23 + 5);
        *((void *)v22 + 4) = *((void *)v23 + 4);
        *((void *)v22 + 5) = v32;
        uint64_t v68 = v22;
        uint64_t v69 = (int *)v24;
        uint64_t v33 = *(int *)(v24 + 28);
        __dst = &v22[v33];
        uint64_t v34 = &v23[v33];
        uint64_t v35 = sub_1000E8B60();
        uint64_t v36 = *(void *)(v35 - 8);
        uint64_t v70 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v70(v34, 1, v35))
        {
          uint64_t v37 = sub_10001B38C((uint64_t *)&unk_1001370F0);
          memcpy(__dst, v34, *(void *)(*(void *)(v37 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v36 + 16))(__dst, v34, v35);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(__dst, 0, 1, v35);
        }
        uint64_t v29 = v17;
        uint64_t v38 = v69[8];
        uint64_t v39 = (void *)((char *)v68 + v38);
        unint64_t v40 = &v23[v38];
        uint64_t v41 = *((void *)v40 + 1);
        void *v39 = *(void *)v40;
        v39[1] = v41;
        uint64_t v42 = v69[9];
        uint64_t v43 = *(void **)&v23[v42];
        swift_bridgeObjectRetain();
        if (v43 != (void *)1) {
          id v44 = v43;
        }
        *(void *)((char *)v68 + v42) = v43;
        uint64_t v45 = v69[10];
        uint64_t v46 = (char *)v68 + v45;
        uint64_t v47 = &v23[v45];
        unint64_t v48 = *(void **)v47;
        uint64_t v49 = (void *)*((void *)v47 + 1);
        char v50 = v47[16];
        sub_10001D614(*(void **)v47, v49);
        *(void *)uint64_t v46 = v48;
        *((void *)v46 + 1) = v49;
        v46[16] = v50;
        (*((void (**)(void *, void, uint64_t, int *))v71 + 7))(v68, 0, 1, v69);
      }
      *(void *)((char *)v29 + v20[6]) = *(void *)&v18[v20[6]];
      *(void *)((char *)v29 + v20[7]) = *(void *)&v18[v20[7]];
      *((unsigned char *)v29 + v20[8]) = v18[v20[8]];
      uint64_t v51 = v20[9];
      uint64_t v72 = (char *)v29 + v51;
      uint64_t v73 = v20;
      uint64_t v52 = &v18[v51];
      uint64_t v53 = sub_1000E8B60();
      uint64_t v54 = *(void *)(v53 - 8);
      uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      if (v55(v52, 1, v53))
      {
        uint64_t v56 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(v72, v52, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v72, v52, v53);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v72, 0, 1, v53);
      }
      *(void *)((char *)v29 + v73[10]) = *(void *)&v18[v73[10]];
      uint64_t v57 = v73[11];
      uint64_t v58 = (void *)((char *)v29 + v57);
      unint64_t v59 = &v18[v57];
      uint64_t v60 = *((void *)v59 + 1);
      *uint64_t v58 = *(void *)v59;
      v58[1] = v60;
      uint64_t v61 = v73[12];
      uint64_t v62 = (void *)((char *)v29 + v61);
      uint64_t v63 = &v18[v61];
      uint64_t v64 = *((void *)v63 + 1);
      *uint64_t v62 = *(void *)v63;
      v62[1] = v64;
      uint64_t v65 = *(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v65(v76, 0, 1, v75);
    }
  }
  return a1;
}

uint64_t sub_1000CCB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for NewsTimelineEntry();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = sub_1000E8C50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v5, v8);
    unint64_t v9 = (id *)(v5 + *(int *)(v6 + 20));

    uint64_t v10 = type metadata accessor for TodayContent();
    uint64_t v11 = (char *)v9 + *(int *)(v10 + 20);
    uint64_t v12 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v12 - 1) + 48))(v11, 1, v12))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = &v11[v12[7]];
      uint64_t v14 = sub_1000E8B60();
      uint64_t v15 = *(void *)(v14 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
        (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
      }
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void **)&v11[v12[9]];
      if (v16 != (void *)1) {

      }
      sub_10001D758(*(void **)&v11[v12[10]], *(void **)&v11[v12[10] + 8]);
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v17 = (char *)v9 + *(int *)(v10 + 36);
    uint64_t v18 = sub_1000E8B60();
    uint64_t v19 = *(void *)(v18 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18)) {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
    }
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000CCE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)(a1 + v7);
  unint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001B38C(&qword_100137588);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v69 = v11;
    uint64_t v72 = a1;
    uint64_t v13 = sub_1000E8C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v9, v13);
    uint64_t v14 = *(int *)(v10 + 20);
    uint64_t v71 = v8;
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    uint64_t v17 = *(void **)&v9[v14];
    *(void *)&v8[v14] = v17;
    uint64_t v68 = (int *)type metadata accessor for TodayContent();
    uint64_t v18 = v68[5];
    uint64_t v19 = &v15[v18];
    uint64_t v20 = &v16[v18];
    uint64_t v21 = (int *)type metadata accessor for Banner();
    uint64_t v22 = (void *)*((void *)v21 - 1);
    unint64_t v23 = (unsigned int (*)(char *, uint64_t, int *))v22[6];
    id v24 = v17;
    uint64_t v70 = v10;
    if (v23(v20, 1, v21))
    {
      uint64_t v25 = sub_10001B38C(&qword_1001385E0);
      memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      uint64_t v65 = v21;
      uint64_t v66 = (void (**)(char *, void, uint64_t, int *))v22;
      uint64_t v26 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v26;
      uint64_t v27 = *((void *)v20 + 3);
      *((void *)v19 + 2) = *((void *)v20 + 2);
      *((void *)v19 + 3) = v27;
      uint64_t v28 = *((void *)v20 + 5);
      *((void *)v19 + 4) = *((void *)v20 + 4);
      *((void *)v19 + 5) = v28;
      uint64_t v29 = v21[7];
      __dst = &v19[v29];
      uint64_t v30 = &v20[v29];
      uint64_t v31 = sub_1000E8B60();
      uint64_t v62 = *(void *)(v31 - 8);
      uint64_t v63 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v63(v30, 1, v31))
      {
        uint64_t v32 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, v30, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v62 + 16))(__dst, v30, v31);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(__dst, 0, 1, v31);
      }
      uint64_t v33 = v21[8];
      uint64_t v34 = &v19[v33];
      uint64_t v35 = &v20[v33];
      uint64_t v36 = *((void *)v35 + 1);
      *(void *)uint64_t v34 = *(void *)v35;
      *((void *)v34 + 1) = v36;
      uint64_t v37 = v21[9];
      uint64_t v38 = *(void **)&v20[v37];
      swift_bridgeObjectRetain();
      if (v38 != (void *)1) {
        id v39 = v38;
      }
      *(void *)&v19[v37] = v38;
      uint64_t v40 = v65[10];
      uint64_t v41 = &v19[v40];
      uint64_t v42 = &v20[v40];
      uint64_t v43 = *(void **)v42;
      id v44 = (void *)*((void *)v42 + 1);
      char v45 = v42[16];
      sub_10001D614(*(void **)v42, v44);
      *(void *)uint64_t v41 = v43;
      *((void *)v41 + 1) = v44;
      v41[16] = v45;
      v66[7](v19, 0, 1, v65);
    }
    *(void *)&v15[v68[6]] = *(void *)&v16[v68[6]];
    *(void *)&v15[v68[7]] = *(void *)&v16[v68[7]];
    v15[v68[8]] = v16[v68[8]];
    uint64_t v46 = v68[9];
    uint64_t v67 = &v15[v46];
    uint64_t v47 = &v16[v46];
    uint64_t v48 = sub_1000E8B60();
    uint64_t v49 = *(void *)(v48 - 8);
    char v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    if (v50(v47, 1, v48))
    {
      uint64_t v51 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v67, v47, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v67, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v67, 0, 1, v48);
    }
    *(void *)&v15[v68[10]] = *(void *)&v16[v68[10]];
    uint64_t v52 = v68[11];
    uint64_t v53 = &v15[v52];
    uint64_t v54 = &v16[v52];
    uint64_t v55 = *((void *)v54 + 1);
    *(void *)uint64_t v53 = *(void *)v54;
    *((void *)v53 + 1) = v55;
    uint64_t v56 = v68[12];
    uint64_t v57 = &v15[v56];
    uint64_t v58 = &v16[v56];
    uint64_t v59 = *((void *)v58 + 1);
    *(void *)uint64_t v57 = *(void *)v58;
    *((void *)v57 + 1) = v59;
    uint64_t v60 = *(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v60(v71, 0, 1, v70);
    return v72;
  }
  return a1;
}

uint64_t sub_1000CD388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)(a1 + v7);
  unint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1000CF758((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
      goto LABEL_7;
    }
    uint64_t v150 = a1;
    uint64_t v29 = sub_1000E8C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24))(v8, v9, v29);
    uint64_t v30 = *(int *)(v10 + 20);
    uint64_t v31 = (void **)&v8[v30];
    uint64_t v32 = &v9[v30];
    uint64_t v33 = *(void **)&v9[v30];
    uint64_t v34 = *v31;
    void *v31 = v33;
    id v35 = v33;

    uint64_t v36 = (int *)type metadata accessor for TodayContent();
    uint64_t v37 = v36[5];
    uint64_t v38 = (char *)v31 + v37;
    id v39 = &v32[v37];
    uint64_t v40 = (int *)type metadata accessor for Banner();
    uint64_t v41 = *((void *)v40 - 1);
    uint64_t v42 = *(uint64_t (**)(char *, uint64_t, int *))(v41 + 48);
    int v43 = v42(v38, 1, v40);
    int v44 = v42(v39, 1, v40);
    if (v43)
    {
      if (!v44)
      {
        *(void *)uint64_t v38 = *(void *)v39;
        *((void *)v38 + 1) = *((void *)v39 + 1);
        *((void *)v38 + 2) = *((void *)v39 + 2);
        *((void *)v38 + 3) = *((void *)v39 + 3);
        *((void *)v38 + 4) = *((void *)v39 + 4);
        *((void *)v38 + 5) = *((void *)v39 + 5);
        uint64_t v45 = v40[7];
        __dsta = &v38[v45];
        uint64_t v139 = &v39[v45];
        uint64_t v46 = sub_1000E8B60();
        uint64_t v136 = *(void *)(v46 - 8);
        uint64_t v141 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v136 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v141(v139, 1, v46))
        {
          uint64_t v47 = sub_10001B38C((uint64_t *)&unk_1001370F0);
          memcpy(__dsta, v139, *(void *)(*(void *)(v47 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v136 + 16))(__dsta, v139, v46);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v136 + 56))(__dsta, 0, 1, v46);
        }
        uint64_t v87 = v40[8];
        uint64_t v88 = &v38[v87];
        uint64_t v89 = &v39[v87];
        *(void *)uint64_t v88 = *(void *)v89;
        *((void *)v88 + 1) = *((void *)v89 + 1);
        uint64_t v90 = v40[9];
        uint64_t v91 = *(void **)&v39[v90];
        swift_bridgeObjectRetain();
        if (v91 != (void *)1) {
          id v92 = v91;
        }
        *(void *)&v38[v90] = v91;
        uint64_t v93 = v40[10];
        __int16 v94 = &v38[v93];
        uint64_t v95 = &v39[v93];
        uint64_t v96 = *(void **)v95;
        uint64_t v97 = (void *)*((void *)v95 + 1);
        char v98 = v95[16];
        sub_10001D614(*(void **)v95, v97);
        *(void *)__int16 v94 = v96;
        *((void *)v94 + 1) = v97;
        v94[16] = v98;
        (*(void (**)(char *, void, uint64_t, int *))(v41 + 56))(v38, 0, 1, v40);
LABEL_45:
        *(void **)((char *)v31 + v36[6]) = *(void **)&v32[v36[6]];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void **)((char *)v31 + v36[7]) = *(void **)&v32[v36[7]];
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        *((unsigned char *)v31 + v36[8]) = v32[v36[8]];
        uint64_t v116 = v36[9];
        uint64_t v117 = (char *)v31 + v116;
        uint64_t v118 = &v32[v116];
        uint64_t v119 = sub_1000E8B60();
        uint64_t v120 = *(void *)(v119 - 8);
        uint64_t v121 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v120 + 48);
        int v122 = v121(v117, 1, v119);
        int v123 = v121(v118, 1, v119);
        if (v122)
        {
          if (!v123)
          {
            (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v117, v118, v119);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v120 + 56))(v117, 0, 1, v119);
LABEL_51:
            a1 = v150;
            *(void **)((char *)v31 + v36[10]) = *(void **)&v32[v36[10]];
            swift_retain();
            swift_release();
            uint64_t v125 = v36[11];
            uint64_t v126 = (void **)((char *)v31 + v125);
            uint64_t v127 = &v32[v125];
            *uint64_t v126 = *(void *)v127;
            v126[1] = *((void *)v127 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v128 = v36[12];
            uint64_t v129 = (void **)((char *)v31 + v128);
            uint64_t v130 = &v32[v128];
            *uint64_t v129 = *(void *)v130;
            v129[1] = *((void *)v130 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            return a1;
          }
        }
        else
        {
          if (!v123)
          {
            (*(void (**)(char *, char *, uint64_t))(v120 + 24))(v117, v118, v119);
            goto LABEL_51;
          }
          (*(void (**)(char *, uint64_t))(v120 + 8))(v117, v119);
        }
        uint64_t v124 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(v117, v118, *(void *)(*(void *)(v124 - 8) + 64));
        goto LABEL_51;
      }
LABEL_16:
      uint64_t v53 = sub_10001B38C(&qword_1001385E0);
      memcpy(v38, v39, *(void *)(*(void *)(v53 - 8) + 64));
      goto LABEL_45;
    }
    if (v44)
    {
      sub_1000CF758((uint64_t)v38, (uint64_t (*)(void))type metadata accessor for Banner);
      goto LABEL_16;
    }
    *(void *)uint64_t v38 = *(void *)v39;
    *((void *)v38 + 1) = *((void *)v39 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v38 + 2) = *((void *)v39 + 2);
    *((void *)v38 + 3) = *((void *)v39 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)v38 + 4) = *((void *)v39 + 4);
    *((void *)v38 + 5) = *((void *)v39 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v80 = v40[7];
    uint64_t v81 = &v38[v80];
    __dstb = &v39[v80];
    uint64_t v82 = sub_1000E8B60();
    uint64_t v143 = *(void *)(v82 - 8);
    uint64_t v145 = v81;
    char v83 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v143 + 48);
    LODWORD(v81) = v83(v81, 1, v82);
    int v84 = v83(__dstb, 1, v82);
    if (v81)
    {
      if (v84)
      {
        size_t v85 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v86 = v145;
LABEL_34:
        memcpy(v86, __dstb, v85);
        goto LABEL_37;
      }
      (*(void (**)(void *, char *, uint64_t))(v143 + 16))(v145, __dstb, v82);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v143 + 56))(v145, 0, 1, v82);
    }
    else
    {
      if (v84)
      {
        (*(void (**)(void *, uint64_t))(v143 + 8))(v145, v82);
        size_t v85 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v86 = v145;
        goto LABEL_34;
      }
      (*(void (**)(void *, char *, uint64_t))(v143 + 24))(v145, __dstb, v82);
    }
LABEL_37:
    uint64_t v99 = v40[8];
    uint64_t v100 = &v38[v99];
    uint64_t v101 = &v39[v99];
    *(void *)uint64_t v100 = *(void *)v101;
    *((void *)v100 + 1) = *((void *)v101 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v102 = v40[9];
    uint64_t v103 = &v38[v102];
    uint64_t v104 = *(void **)&v38[v102];
    uint64_t v105 = *(void **)&v39[v102];
    if (v104 == (void *)1)
    {
      if (v105 != (void *)1)
      {
        *(void *)uint64_t v103 = v105;
        id v106 = v105;
LABEL_44:
        uint64_t v108 = v40[10];
        uint64_t v109 = &v38[v108];
        uint64_t v110 = &v39[v108];
        uint64_t v111 = *(void **)v110;
        uint64_t v112 = (void *)*((void *)v110 + 1);
        char v113 = v110[16];
        sub_10001D614(*(void **)v110, v112);
        uint64_t v114 = *(void **)v109;
        uint64_t v115 = (void *)*((void *)v109 + 1);
        *(void *)uint64_t v109 = v111;
        *((void *)v109 + 1) = v112;
        v109[16] = v113;
        sub_10001D758(v114, v115);
        goto LABEL_45;
      }
    }
    else
    {
      if (v105 != (void *)1)
      {
        *(void *)uint64_t v103 = v105;
        id v107 = v105;

        goto LABEL_44;
      }
      sub_10001DBE4((id *)&v38[v102]);
      uint64_t v105 = *(void **)&v39[v102];
    }
    *(void *)uint64_t v103 = v105;
    goto LABEL_44;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v28 = sub_10001B38C(&qword_100137588);
    memcpy(v8, v9, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  uint64_t v15 = sub_1000E8C50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v8, v9, v15);
  uint64_t v16 = *(int *)(v10 + 20);
  uint64_t v138 = v8;
  uint64_t v17 = &v8[v16];
  uint64_t v18 = (void **)&v9[v16];
  uint64_t v19 = *v18;
  *(void *)&v8[v16] = *v18;
  uint64_t v144 = (int *)type metadata accessor for TodayContent();
  __dst = v17;
  uint64_t v20 = v144[5];
  uint64_t v21 = &v17[v20];
  uint64_t v140 = v18;
  uint64_t v22 = (void **)((char *)v18 + v20);
  uint64_t v23 = type metadata accessor for Banner();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v24 + 48);
  id v26 = v19;
  uint64_t v149 = a1;
  uint64_t v142 = v11;
  if (v25(v22, 1, v23))
  {
    uint64_t v27 = sub_10001B38C(&qword_1001385E0);
    memcpy(v21, v22, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    uint64_t v137 = v24;
    *(void *)uint64_t v21 = *v22;
    *((void *)v21 + 1) = v22[1];
    *((void *)v21 + 2) = v22[2];
    uint64_t v133 = v22;
    *((void *)v21 + 3) = v22[3];
    *((void *)v21 + 4) = v22[4];
    *((void *)v21 + 5) = v22[5];
    uint64_t v48 = *(int *)(v23 + 28);
    unint64_t v134 = (int *)v23;
    Swift::String v135 = &v21[v48];
    uint64_t v49 = (char *)v22 + v48;
    uint64_t v50 = sub_1000E8B60();
    uint64_t v51 = *(void *)(v50 - 8);
    unint64_t v132 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v132(v49, 1, v50))
    {
      uint64_t v52 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v135, v49, *(void *)(*(void *)(v52 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v135, v49, v50);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v135, 0, 1, v50);
    }
    uint64_t v54 = v134[8];
    uint64_t v55 = &v21[v54];
    uint64_t v56 = (void *)((char *)v133 + v54);
    *(void *)uint64_t v55 = *v56;
    *((void *)v55 + 1) = v56[1];
    uint64_t v57 = v134[9];
    uint64_t v58 = *(void **)((char *)v133 + v57);
    swift_bridgeObjectRetain();
    if (v58 != (void *)1) {
      id v59 = v58;
    }
    *(void *)&v21[v57] = v58;
    uint64_t v60 = v134[10];
    uint64_t v61 = &v21[v60];
    uint64_t v62 = (char *)v133 + v60;
    uint64_t v63 = *(void **)v62;
    uint64_t v64 = (void *)*((void *)v62 + 1);
    char v65 = v62[16];
    sub_10001D614(*(void **)v62, v64);
    *(void *)uint64_t v61 = v63;
    *((void *)v61 + 1) = v64;
    v61[16] = v65;
    (*(void (**)(char *, void, uint64_t, int *))(v137 + 56))(v21, 0, 1, v134);
  }
  *(void *)&__dst[v144[6]] = *(void **)((char *)v140 + v144[6]);
  *(void *)&__dst[v144[7]] = *(void **)((char *)v140 + v144[7]);
  __dst[v144[8]] = *((unsigned char *)v140 + v144[8]);
  uint64_t v66 = v144[9];
  uint64_t v67 = &__dst[v66];
  uint64_t v68 = (char *)v140 + v66;
  uint64_t v69 = sub_1000E8B60();
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  if (v71(v68, 1, v69))
  {
    uint64_t v72 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v67, v68, *(void *)(*(void *)(v72 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v67, v68, v69);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v67, 0, 1, v69);
  }
  a1 = v149;
  *(void *)&__dst[v144[10]] = *(void **)((char *)v140 + v144[10]);
  uint64_t v73 = v144[11];
  uint64_t v74 = &__dst[v73];
  uint64_t v75 = (void **)((char *)v140 + v73);
  *(void *)uint64_t v74 = *v75;
  *((void *)v74 + 1) = v75[1];
  uint64_t v76 = v144[12];
  uint64_t v77 = &__dst[v76];
  char v78 = (void **)((char *)v140 + v76);
  *(void *)uint64_t v77 = *v78;
  *((void *)v77 + 1) = v78[1];
  char v79 = *(void (**)(char *, void, uint64_t, uint64_t))(v142 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v79(v138, 0, 1, v10);
  return a1;
}

uint64_t sub_1000CE0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)(a1 + v7);
  unint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001B38C(&qword_100137588);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_1000E8C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
    uint64_t v14 = *(int *)(v10 + 20);
    uint64_t v45 = v8;
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    *(void *)uint64_t v15 = *(void *)&v9[v14];
    uint64_t v17 = (int *)type metadata accessor for TodayContent();
    uint64_t v18 = v17[5];
    uint64_t v19 = &v15[v18];
    uint64_t v20 = &v16[v18];
    uint64_t v21 = (int *)type metadata accessor for Banner();
    uint64_t v22 = *((void *)v21 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_10001B38C(&qword_1001385E0);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      long long v24 = *((_OWORD *)v20 + 1);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v24;
      *((_OWORD *)v19 + 2) = *((_OWORD *)v20 + 2);
      uint64_t v25 = v21[7];
      uint64_t v43 = v22;
      __dst = &v19[v25];
      id v26 = &v20[v25];
      uint64_t v27 = sub_1000E8B60();
      uint64_t v41 = *(void *)(v27 - 8);
      __src = v26;
      uint64_t v28 = v26;
      uint64_t v29 = v27;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v28, 1, v27))
      {
        uint64_t v30 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, __src, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, void *, uint64_t))(v41 + 32))(__dst, __src, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(__dst, 0, 1, v29);
      }
      *(_OWORD *)&v19[v21[8]] = *(_OWORD *)&v20[v21[8]];
      *(void *)&v19[v21[9]] = *(void *)&v20[v21[9]];
      uint64_t v31 = v21[10];
      uint64_t v32 = &v19[v31];
      uint64_t v33 = &v20[v31];
      v32[16] = v33[16];
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
      (*(void (**)(char *, void, uint64_t, int *))(v43 + 56))(v19, 0, 1, v21);
    }
    *(void *)&v15[v17[6]] = *(void *)&v16[v17[6]];
    *(void *)&v15[v17[7]] = *(void *)&v16[v17[7]];
    v15[v17[8]] = v16[v17[8]];
    uint64_t v34 = v17[9];
    id v35 = &v15[v34];
    uint64_t v36 = &v16[v34];
    uint64_t v37 = sub_1000E8B60();
    uint64_t v38 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      uint64_t v39 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v35, v36, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
    *(void *)&v15[v17[10]] = *(void *)&v16[v17[10]];
    *(_OWORD *)&v15[v17[11]] = *(_OWORD *)&v16[v17[11]];
    *(_OWORD *)&v15[v17[12]] = *(_OWORD *)&v16[v17[12]];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v45, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1000CE580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)(a1 + v7);
  unint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for NewsTimelineEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1000CF758((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for NewsTimelineEntry);
      goto LABEL_7;
    }
    uint64_t v121 = a1;
    uint64_t v27 = sub_1000E8C50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v8, v9, v27);
    uint64_t v28 = *(int *)(v10 + 20);
    uint64_t v29 = &v8[v28];
    uint64_t v30 = &v9[v28];
    uint64_t v31 = *(void **)&v8[v28];
    *(void *)&v8[v28] = *(void *)&v9[v28];

    uint64_t v32 = (int *)type metadata accessor for TodayContent();
    uint64_t v33 = v32[5];
    uint64_t v34 = &v29[v33];
    id v35 = &v30[v33];
    uint64_t v36 = (int *)type metadata accessor for Banner();
    uint64_t v37 = *((void *)v36 - 1);
    uint64_t v38 = *(uint64_t (**)(char *, uint64_t, int *))(v37 + 48);
    int v39 = v38(v34, 1, v36);
    int v40 = v38(v35, 1, v36);
    if (v39)
    {
      if (!v40)
      {
        long long v41 = *((_OWORD *)v35 + 1);
        *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
        *((_OWORD *)v34 + 1) = v41;
        *((_OWORD *)v34 + 2) = *((_OWORD *)v35 + 2);
        uint64_t v42 = v36[7];
        __dst = &v34[v42];
        uint64_t v43 = &v35[v42];
        uint64_t v44 = sub_1000E8B60();
        uint64_t v45 = *(void *)(v44 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
        {
          uint64_t v46 = sub_10001B38C((uint64_t *)&unk_1001370F0);
          memcpy(__dst, v43, *(void *)(*(void *)(v46 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v45 + 32))(__dst, v43, v44);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(__dst, 0, 1, v44);
        }
        *(_OWORD *)&v34[v36[8]] = *(_OWORD *)&v35[v36[8]];
        *(void *)&v34[v36[9]] = *(void *)&v35[v36[9]];
        uint64_t v74 = v36[10];
        uint64_t v75 = &v34[v74];
        uint64_t v76 = &v35[v74];
        v75[16] = v76[16];
        *(_OWORD *)uint64_t v75 = *(_OWORD *)v76;
        (*(void (**)(char *, void, uint64_t, int *))(v37 + 56))(v34, 0, 1, v36);
LABEL_39:
        *(void *)&v29[v32[6]] = *(void *)&v30[v32[6]];
        swift_bridgeObjectRelease();
        *(void *)&v29[v32[7]] = *(void *)&v30[v32[7]];
        swift_unknownObjectRelease();
        v29[v32[8]] = v30[v32[8]];
        uint64_t v92 = v32[9];
        uint64_t v93 = &v29[v92];
        __int16 v94 = &v30[v92];
        uint64_t v95 = sub_1000E8B60();
        uint64_t v96 = *(void *)(v95 - 8);
        uint64_t v97 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 48);
        int v98 = v97(v93, 1, v95);
        int v99 = v97(v94, 1, v95);
        if (v98)
        {
          if (!v99)
          {
            (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v93, v94, v95);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v96 + 56))(v93, 0, 1, v95);
LABEL_45:
            a1 = v121;
            *(void *)&v29[v32[10]] = *(void *)&v30[v32[10]];
            swift_release();
            uint64_t v101 = v32[11];
            uint64_t v102 = &v29[v101];
            uint64_t v103 = &v30[v101];
            uint64_t v105 = *(void *)v103;
            uint64_t v104 = *((void *)v103 + 1);
            *(void *)uint64_t v102 = v105;
            *((void *)v102 + 1) = v104;
            swift_bridgeObjectRelease();
            uint64_t v106 = v32[12];
            id v107 = &v29[v106];
            uint64_t v108 = &v30[v106];
            uint64_t v110 = *(void *)v108;
            uint64_t v109 = *((void *)v108 + 1);
            *(void *)id v107 = v110;
            *((void *)v107 + 1) = v109;
            swift_bridgeObjectRelease();
            return a1;
          }
        }
        else
        {
          if (!v99)
          {
            (*(void (**)(char *, char *, uint64_t))(v96 + 40))(v93, v94, v95);
            goto LABEL_45;
          }
          (*(void (**)(char *, uint64_t))(v96 + 8))(v93, v95);
        }
        uint64_t v100 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(v93, v94, *(void *)(*(void *)(v100 - 8) + 64));
        goto LABEL_45;
      }
LABEL_16:
      uint64_t v54 = sub_10001B38C(&qword_1001385E0);
      memcpy(v34, v35, *(void *)(*(void *)(v54 - 8) + 64));
      goto LABEL_39;
    }
    if (v40)
    {
      sub_1000CF758((uint64_t)v34, (uint64_t (*)(void))type metadata accessor for Banner);
      goto LABEL_16;
    }
    uint64_t v64 = *((void *)v35 + 1);
    *(void *)uint64_t v34 = *(void *)v35;
    *((void *)v34 + 1) = v64;
    swift_bridgeObjectRelease();
    uint64_t v65 = *((void *)v35 + 3);
    *((void *)v34 + 2) = *((void *)v35 + 2);
    *((void *)v34 + 3) = v65;
    swift_bridgeObjectRelease();
    uint64_t v66 = *((void *)v35 + 5);
    *((void *)v34 + 4) = *((void *)v35 + 4);
    *((void *)v34 + 5) = v66;
    swift_bridgeObjectRelease();
    uint64_t v67 = v36[7];
    uint64_t v68 = &v34[v67];
    __dstb = &v35[v67];
    uint64_t v69 = sub_1000E8B60();
    uint64_t v114 = *(void *)(v69 - 8);
    uint64_t v116 = v68;
    uint64_t v70 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v114 + 48);
    LODWORD(v68) = v70(v68, 1, v69);
    int v71 = v70(__dstb, 1, v69);
    if (v68)
    {
      if (v71)
      {
        size_t v72 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v73 = v116;
LABEL_30:
        memcpy(v73, __dstb, v72);
        goto LABEL_33;
      }
      (*(void (**)(void *, char *, uint64_t))(v114 + 32))(v116, __dstb, v69);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v114 + 56))(v116, 0, 1, v69);
    }
    else
    {
      if (v71)
      {
        (*(void (**)(void *, uint64_t))(v114 + 8))(v116, v69);
        size_t v72 = *(void *)(*(void *)(sub_10001B38C((uint64_t *)&unk_1001370F0) - 8) + 64);
        uint64_t v73 = v116;
        goto LABEL_30;
      }
      (*(void (**)(void *, char *, uint64_t))(v114 + 40))(v116, __dstb, v69);
    }
LABEL_33:
    uint64_t v77 = v36[8];
    char v78 = &v34[v77];
    char v79 = &v35[v77];
    uint64_t v81 = *(void *)v79;
    uint64_t v80 = *((void *)v79 + 1);
    *(void *)char v78 = v81;
    *((void *)v78 + 1) = v80;
    swift_bridgeObjectRelease();
    uint64_t v82 = v36[9];
    char v83 = &v34[v82];
    int v84 = *(void **)&v34[v82];
    uint64_t v85 = *(void *)&v35[v82];
    if (v84 != (void *)1)
    {
      if (v85 != 1)
      {
        *(void *)char v83 = v85;

        goto LABEL_38;
      }
      sub_10001DBE4((id *)&v34[v82]);
      uint64_t v85 = *(void *)&v35[v82];
    }
    *(void *)char v83 = v85;
LABEL_38:
    uint64_t v86 = v36[10];
    uint64_t v87 = &v34[v86];
    uint64_t v88 = &v35[v86];
    char v89 = v88[16];
    uint64_t v90 = *(void **)v87;
    uint64_t v91 = (void *)*((void *)v87 + 1);
    *(_OWORD *)uint64_t v87 = *(_OWORD *)v88;
    v87[16] = v89;
    sub_10001D758(v90, v91);
    goto LABEL_39;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v26 = sub_10001B38C(&qword_100137588);
    memcpy(v8, v9, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  uint64_t v120 = a1;
  uint64_t v15 = sub_1000E8C50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v8, v9, v15);
  uint64_t v16 = *(int *)(v10 + 20);
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  *(void *)&v8[v16] = *(void *)&v9[v16];
  uint64_t v19 = (int *)type metadata accessor for TodayContent();
  uint64_t v20 = v19[5];
  uint64_t v21 = &v17[v20];
  uint64_t v22 = &v18[v20];
  uint64_t v23 = (int *)type metadata accessor for Banner();
  uint64_t v24 = *((void *)v23 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_10001B38C(&qword_1001385E0);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    uint64_t v113 = v24;
    long long v47 = *((_OWORD *)v22 + 1);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    *((_OWORD *)v21 + 1) = v47;
    *((_OWORD *)v21 + 2) = *((_OWORD *)v22 + 2);
    uint64_t v48 = v23[7];
    __dsta = &v21[v48];
    uint64_t v49 = &v22[v48];
    uint64_t v50 = sub_1000E8B60();
    uint64_t v112 = *(void *)(v50 - 8);
    uint64_t v115 = v49;
    uint64_t v51 = v49;
    uint64_t v52 = v50;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v112 + 48))(v51, 1, v50))
    {
      uint64_t v53 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dsta, v115, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v112 + 32))(__dsta, v115, v52);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v112 + 56))(__dsta, 0, 1, v52);
    }
    *(_OWORD *)&v21[v23[8]] = *(_OWORD *)&v22[v23[8]];
    *(void *)&v21[v23[9]] = *(void *)&v22[v23[9]];
    uint64_t v55 = v23[10];
    uint64_t v56 = &v21[v55];
    uint64_t v57 = &v22[v55];
    v56[16] = v57[16];
    *(_OWORD *)uint64_t v56 = *(_OWORD *)v57;
    (*(void (**)(char *, void, uint64_t, int *))(v113 + 56))(v21, 0, 1, v23);
  }
  *(void *)&v17[v19[6]] = *(void *)&v18[v19[6]];
  *(void *)&v17[v19[7]] = *(void *)&v18[v19[7]];
  v17[v19[8]] = v18[v19[8]];
  uint64_t v58 = v19[9];
  id v59 = &v17[v58];
  uint64_t v60 = &v18[v58];
  uint64_t v61 = sub_1000E8B60();
  uint64_t v62 = *(void *)(v61 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61))
  {
    uint64_t v63 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v59, v60, v61);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
  }
  a1 = v120;
  *(void *)&v17[v19[10]] = *(void *)&v18[v19[10]];
  *(_OWORD *)&v17[v19[11]] = *(_OWORD *)&v18[v19[11]];
  *(_OWORD *)&v17[v19[12]] = *(_OWORD *)&v18[v19[12]];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1000CF0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CF0E4);
}

uint64_t sub_1000CF0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000EA180();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_10001B38C(&qword_100137588);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000CF1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CF1F4);
}

uint64_t sub_1000CF1F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000EA180();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_10001B38C(&qword_100137588);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_1000CF2FC()
{
  sub_1000EA180();
  if (v0 <= 0x3F)
  {
    sub_1000CF3C4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000CF3C4()
{
  if (!qword_10013AD00)
  {
    type metadata accessor for NewsTimelineEntry();
    unint64_t v0 = sub_1000EA730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10013AD00);
    }
  }
}

uint64_t sub_1000CF41C()
{
  return sub_1000CBFF8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000CF424()
{
  swift_release();
  sub_100020AC0(v0 + 24);

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000CF464()
{
  sub_1000CC1B0(*(void *)(v0 + 16), v0 + 24);
}

uint64_t sub_1000CF470()
{
  return sub_1000CBADC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000CF478()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000CF4B8()
{
  return sub_1000CAF1C(*(void **)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000CF4C4()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000CF50C()
{
  return sub_1000CB350(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000CF518(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000CF528()
{
  return swift_release();
}

uint64_t sub_1000CF530()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000CF568()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000CF58C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000CF5D4()
{
  return sub_1000CB6CC(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(uint64_t (**)(void))(v0 + 40));
}

unint64_t sub_1000CF5E4()
{
  unint64_t result = qword_10013A338;
  if (!qword_10013A338)
  {
    sub_1000E9E00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A338);
  }
  return result;
}

unint64_t sub_1000CF63C()
{
  unint64_t result = qword_10013A348;
  if (!qword_10013A348)
  {
    sub_10001B3D0(&qword_10013A340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013A348);
  }
  return result;
}

uint64_t sub_1000CF698@<X0>(void *a1@<X8>)
{
  os_log_type_t v3 = (void *)(v1 + qword_10013AC10);
  swift_beginAccess();
  *a1 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000CF6EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000CB29C(v1, a1);
}

uint64_t sub_1000CF6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TaskContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CF758(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1000CF7C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_100020A28(a1, a1[3]);
  sub_1000CFE94();
  unint64_t result = (void *)sub_1000E8EB0();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_1000EA2B0();
    uint64_t v7 = v6;
    uint64_t v8 = type metadata accessor for ProactiveSuggestionManager();
    unint64_t result = (void *)swift_allocObject();
    result[2] = v4;
    result[3] = v5;
    result[4] = v7;
    a2[3] = v8;
    a2[4] = &off_100125108;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000CF874()
{
  id v0 = objc_allocWithZone((Class)ATXProactiveCardSuggestionClient);
  NSString v1 = sub_1000EA280();
  id v2 = [v0 initWithSourceId:v1];

  return v2;
}

uint64_t sub_1000CF8E8(void *a1, void *a2)
{
  sub_100020A28(a2, a2[3]);
  sub_10001B38C(&qword_10013ADD0);
  uint64_t result = sub_1000E8EC0();
  if (v9)
  {
    sub_1000A9708(&v8, (uint64_t)v10);
    uint64_t v4 = sub_100020A28(a1, a1[3]);
    sub_10002D970((uint64_t)v10, (uint64_t)&v8);
    uint64_t v5 = swift_allocObject();
    sub_1000A9708(&v8, v5 + 16);
    uint64_t v6 = *v4;
    uint64_t v7 = *(void *)(*v4 + 16);
    *(void *)(v6 + 16) = sub_1000CFF0C;
    *(void *)(v6 + 24) = v5;
    sub_100034914(v7);
    return sub_100020AC0((uint64_t)v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000CF9CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_10001B38C((uint64_t *)&unk_100139040);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TodayContent();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (id *)((char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000CFF14(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000CFF7C((uint64_t)v7);
    return [*(id *)(*sub_100020A28(a3, a3[3]) + 16) clearSuggestions];
  }
  else
  {
    sub_1000B4EEC((uint64_t)v7, (uint64_t)v11);
    sub_100020A28(a3, a3[3]);
    sub_1000230E0(v11);
    return (id)sub_1000CFFDC((uint64_t)v11);
  }
}

uint64_t type metadata accessor for ProactiveAssembly()
{
  return self;
}

uint64_t sub_1000CFB74()
{
  uint64_t v0 = sub_1000E8EE0();
  uint64_t v14 = *(void *)(v0 - 8);
  uint64_t v15 = v0;
  __chkstk_darwin(v0);
  uint64_t v13 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000E9020();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E8F10();
  sub_10001B38C(&qword_10013ADD0);
  sub_1000E8FB0();
  swift_release();
  uint64_t v6 = enum case for Scope.singleton(_:);
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, enum case for Scope.singleton(_:), v2);
  sub_1000E8E10();
  swift_release();
  swift_release();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  sub_1000E8F20();
  sub_1000CFE94();
  sub_1000E8FA0();
  swift_release();
  v7(v5, v6, v2);
  sub_1000E8E10();
  swift_release();
  swift_release();
  v8(v5, v2);
  sub_1000E8F30();
  sub_100020A28(v16, v16[3]);
  sub_10001B38C(&qword_100137CA8);
  uint64_t v9 = v13;
  uint64_t v10 = v14;
  uint64_t v11 = v15;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v13, enum case for CallbackScope.any(_:), v15);
  sub_1000E8FD0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v11);
  return sub_100020AC0((uint64_t)v16);
}

unint64_t sub_1000CFE94()
{
  unint64_t result = qword_10013ADD8;
  if (!qword_10013ADD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10013ADD8);
  }
  return result;
}

uint64_t sub_1000CFED4()
{
  sub_100020AC0(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

id sub_1000CFF0C(uint64_t a1, uint64_t a2)
{
  return sub_1000CF9CC(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_1000CFF14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B38C((uint64_t *)&unk_100139040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CFF7C(uint64_t a1)
{
  uint64_t v2 = sub_10001B38C((uint64_t *)&unk_100139040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CFFDC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TodayContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall TelemetryManager.flush()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000E8C50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v46 - v7;
  sub_100020A28((void *)(v0 + 16), *(void *)(v0 + 40));
  char v9 = sub_1000D5530();
  id v51 = FCAnalyticsLog;
  sub_1000EA620();
  if (v9)
  {
    sub_1000E9220();

    sub_1000E8C40();
    id v10 = [objc_allocWithZone((Class)NTPBTelemetry) init];
    if (!v10) {
      goto LABEL_27;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void **)(v1 + 56);
    uint64_t v13 = v1 + OBJC_IVAR____TtC10NewsToday216TelemetryManager_lastFlushDate;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    Class isa = sub_1000E8BD0().super.isa;
    uint64_t v50 = *(void (**)(char *, uint64_t))(v3 + 8);
    id v51 = (id)(v3 + 8);
    v50(v6, v2);
    Class v15 = sub_1000E8BD0().super.isa;
    [v12 populateTelemetry:v11 withNetworkEventsFromDate:isa toDate:v15];

    id v16 = [v11 networkEventGroups];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = &selRef_addCountOfArticlesExposedEachSection_;
      if ([v16 count])
      {
        [*(id *)(v1 + 64) annotateTelemetry:v11 withOptions:4095];
        id v19 = [self nss_envelopeWithIdentifier];
        if (!v19)
        {
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
        uint64_t v20 = v19;
        [v19 setContentType:2];
        id v21 = [v11 data];
        if (!v21)
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        uint64_t v22 = v21;
        uint64_t v49 = v13;
        id v23 = [v21 fc_zlibDeflate];

        if (v23)
        {
          uint64_t v24 = sub_1000E8B90();
          unint64_t v26 = v25;

          v27.super.Class isa = sub_1000E8B80().super.isa;
          uint64_t v28 = v24;
          uint64_t v18 = &selRef_addCountOfArticlesExposedEachSection_;
          sub_1000221B8(v28, v26);
        }
        else
        {
          v27.super.Class isa = 0;
        }
        [v20 setContent:v27.super.isa];

        uint64_t v31 = (void *)FCAnalyticsLog;
        sub_10001B38C(&qword_100137370);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_1000F1E20;
        id v48 = v31;
        id v33 = [v17 v18[43]];
        *(void *)(v32 + 56) = &type metadata for Int;
        *(void *)(v32 + 64) = &protocol witness table for Int;
        *(void *)(v32 + 32) = v33;
        id v34 = [v20 content];
        if (!v34)
        {
LABEL_30:
          __break(1u);
          JUMPOUT(0x1000D073CLL);
        }
        id v35 = v34;
        uint64_t v36 = sub_1000E8B90();
        unint64_t v38 = v37;

        switch(v38 >> 62)
        {
          case 1uLL:
            goto LABEL_21;
          case 2uLL:
            uint64_t v40 = *(void *)(v36 + 16);
            uint64_t v47 = *(void *)(v36 + 24);
            sub_1000221B8(v36, v38);
            uint64_t v39 = v47 - v40;
            if (!__OFSUB__(v47, v40)) {
              goto LABEL_24;
            }
            __break(1u);
LABEL_21:
            sub_1000221B8(v36, v38);
            LODWORD(v39) = HIDWORD(v36) - v36;
            if (!__OFSUB__(HIDWORD(v36), v36))
            {
              uint64_t v39 = (int)v39;
LABEL_24:
              long long v41 = v48;
              uint64_t v13 = v49;
              *(void *)(v32 + 96) = &type metadata for Int;
              *(void *)(v32 + 104) = &protocol witness table for Int;
              *(void *)(v32 + 72) = v39;
              sub_1000EA620();
              sub_1000E9220();

              swift_bridgeObjectRelease();
              id v42 = [objc_allocWithZone((Class)NSSNewsAnalyticsSubmitEnvelopesOperation) init];
              sub_10001B38C(&qword_1001390C0);
              uint64_t v43 = swift_allocObject();
              *(_OWORD *)(v43 + 16) = xmmword_1000F15A0;
              *(void *)(v43 + 32) = v20;
              uint64_t v52 = v43;
              sub_1000EA490();
              sub_1000D0880();
              id v44 = v20;
              Class v45 = sub_1000EA460().super.isa;
              swift_bridgeObjectRelease();
              [v42 setEnvelopes:v45];

              [v42 start];
              goto LABEL_25;
            }
            __break(1u);
            break;
          case 3uLL:
            sub_1000221B8(v36, v38);
            uint64_t v39 = 0;
            goto LABEL_24;
          default:
            sub_1000221B8(v36, v38);
            uint64_t v39 = BYTE6(v38);
            goto LABEL_24;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    id v30 = FCAnalyticsLog;
    sub_1000EA620();
    sub_1000E9220();

LABEL_25:
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 24))(v13, v8, v2);
    swift_endAccess();
    v50(v8, v2);
    return;
  }
  sub_1000E9220();
  id v29 = v51;
}

uint64_t TelemetryManager.deinit()
{
  sub_100020AC0(v0 + 16);

  uint64_t v1 = v0 + OBJC_IVAR____TtC10NewsToday216TelemetryManager_lastFlushDate;
  uint64_t v2 = sub_1000E8C50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TelemetryManager.__deallocating_deinit()
{
  sub_100020AC0((uint64_t)(v0 + 2));

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC10NewsToday216TelemetryManager_lastFlushDate;
  uint64_t v2 = sub_1000E8C50();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

unint64_t sub_1000D0880()
{
  unint64_t result = qword_10013ADE8;
  if (!qword_10013ADE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10013ADE8);
  }
  return result;
}

uint64_t sub_1000D08C0()
{
  return type metadata accessor for TelemetryManager();
}

uint64_t type metadata accessor for TelemetryManager()
{
  uint64_t result = qword_10013AE18;
  if (!qword_10013AE18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000D0914()
{
  uint64_t result = sub_1000E8C50();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlags.NewsWidget(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000D0A5CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlags.NewsWidget()
{
  return &type metadata for FeatureFlags.NewsWidget;
}

unint64_t sub_1000D0A98()
{
  unint64_t result = qword_10013AEB8;
  if (!qword_10013AEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013AEB8);
  }
  return result;
}

const char *sub_1000D0AEC()
{
  return "NewsWidget";
}

const char *sub_1000D0B00()
{
  return "playbutton";
}

uint64_t sub_1000D0B14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v2[4];
  id v8 = [a1 userEngagementWithWidgetEventTracker:v2[3] trackableWidgetState:v7];
  char v9 = (void *)v2[2];
  uint64_t v10 = sub_1000E8B60();
  sub_1000D0EC4();
  sub_1000348BC();
  id v11 = v8;
  v12.super.Class isa = sub_1000EA1B0().super.isa;
  sub_10002230C((uint64_t)v2 + OBJC_IVAR____TtC10NewsToday221EngagementURLProvider_sharedDirectoryFileUrl, (uint64_t)v6);
  uint64_t v13 = *(void *)(v10 - 8);
  Class v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v10) != 1)
  {
    sub_1000E8AE0(v14);
    Class v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v10);
  }
  id v17 = [v9 URLForEngagement:a1 event:v11 trackableWidgetState:v7 prefetchAssetsByRemoteURL:v12.super.isa sharedDirectoryFileURL:v15];

  if (v17)
  {
    uint64_t v18 = v22;
    sub_1000E8B20();

    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
    uint64_t v18 = v22;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v18, v19, 1, v10);
}

uint64_t sub_1000D0D30()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_100020B20((uint64_t)v0 + OBJC_IVAR____TtC10NewsToday221EngagementURLProvider_sharedDirectoryFileUrl);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000D0DB4()
{
  return type metadata accessor for EngagementURLProvider();
}

uint64_t type metadata accessor for EngagementURLProvider()
{
  uint64_t result = qword_10013AEF0;
  if (!qword_10013AEF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000D0E08()
{
  sub_10001E230();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_1000D0EC4()
{
  unint64_t result = qword_1001390B0;
  if (!qword_1001390B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1001390B0);
  }
  return result;
}

unint64_t sub_1000D0F04()
{
  if (*v0) {
    return 0xD000000000000017;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_1000D0F44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000D1444(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000D0F6C(uint64_t a1)
{
  unint64_t v2 = sub_1000D194C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000D0FA8(uint64_t a1)
{
  unint64_t v2 = sub_1000D194C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000D0FE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v29 = a3;
  uint64_t v6 = sub_10001B38C(&qword_10013B048);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000D194C();
  sub_1000EAC20();
  if (a2)
  {
    uint64_t v10 = self;
    id v31 = 0;
    id v11 = a2;
    id v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v31];
    id v13 = v31;
    if (!v12)
    {
      uint64_t v19 = v13;
      sub_1000E8A40();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    uint64_t v14 = (void *)sub_1000E8B90();
    unint64_t v16 = v15;

    id v31 = v14;
    unint64_t v32 = v16;
    char v30 = 0;
    sub_1000222B8();
    sub_1000EAAE0();
    if (v3)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

      uint64_t v17 = (uint64_t)v14;
      unint64_t v18 = v16;
      return sub_1000221B8(v17, v18);
    }

    sub_1000221B8((uint64_t)v14, v16);
  }
  uint64_t v20 = self;
  id v31 = 0;
  id v21 = [v20 archivedDataWithRootObject:v29 requiringSecureCoding:1 error:&v31];
  id v22 = v31;
  if (v21)
  {
    id v23 = (void *)sub_1000E8B90();
    unint64_t v25 = v24;

    id v31 = v23;
    unint64_t v32 = v25;
    char v30 = 1;
    sub_1000222B8();
    sub_1000EAAE0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v17 = (uint64_t)v23;
    unint64_t v18 = v25;
    return sub_1000221B8(v17, v18);
  }
  NSData v27 = v22;
  sub_1000E8A40();

  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void *sub_1000D12F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000D1530(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1000D1320(void *a1)
{
  return sub_1000D0FE4(a1, *(void **)v1, *(void *)(v1 + 8));
}

uint64_t type metadata accessor for ImageJoeColorAnalyzer()
{
  return self;
}

uint64_t sub_1000D1444(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000100100DE0 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000100100E00)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1000EAB20();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_1000D1530(void *a1)
{
  uint64_t v3 = sub_10001B38C(&qword_10013B030);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)a1[3];
  sub_100020A28(a1, (uint64_t)v7);
  sub_1000D194C();
  sub_1000EAC00();
  if (v1) {
    goto LABEL_3;
  }
  char v20 = 0;
  sub_100022164();
  sub_1000EAA20();
  uint64_t v9 = v18;
  unint64_t v10 = v19;
  uint64_t v17 = v18;
  if (v19 >> 60 == 15)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  unint64_t v16 = sub_100022374(0, (unint64_t *)&unk_10013A600);
  sub_100022374(0, (unint64_t *)&qword_100139070);
  sub_1000D19F4(v9, v10);
  uint64_t v7 = (void *)sub_1000EA630();
  if (!v7)
  {
    sub_1000D19A0();
    swift_allocError();
    *id v13 = 0;
    swift_willThrow();
    uint64_t v14 = v17;
    sub_10002D6A4(v17, v10);
    sub_10002D6A4(v14, v10);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_3:
    sub_100020AC0((uint64_t)a1);
    return v7;
  }
  sub_10002D6A4(v17, v10);
LABEL_7:
  char v20 = 1;
  sub_1000EAA70();
  unint64_t v16 = v10;
  uint64_t v11 = v18;
  unint64_t v12 = v19;
  sub_100022374(0, (unint64_t *)&unk_10013A600);
  sub_100022374(0, (unint64_t *)&qword_100139070);
  if (sub_1000EA630())
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_10002D6A4(v17, v16);
    sub_1000221B8(v11, v12);
    sub_100020AC0((uint64_t)a1);
  }
  else
  {
    sub_1000D19A0();
    swift_allocError();
    *unint64_t v15 = 0;
    swift_willThrow();
    sub_1000221B8(v11, v12);
    sub_10002D6A4(v17, v16);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100020AC0((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_1000D194C()
{
  unint64_t result = qword_10013B038;
  if (!qword_10013B038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B038);
  }
  return result;
}

unint64_t sub_1000D19A0()
{
  unint64_t result = qword_10013B040;
  if (!qword_10013B040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B040);
  }
  return result;
}

uint64_t sub_1000D19F4(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for ImageColorAnalysisResult.Errors()
{
  return &type metadata for ImageColorAnalysisResult.Errors;
}

unsigned char *_s10NewsToday224ImageColorAnalysisResultV6ErrorsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000D1B2CLL);
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

ValueMetadata *type metadata accessor for ImageColorAnalysisResult.CodingKeys()
{
  return &type metadata for ImageColorAnalysisResult.CodingKeys;
}

void *initializeBufferWithCopyOfBuffer for ImageColorAnalysisResult(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for ImageColorAnalysisResult(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for ImageColorAnalysisResult(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for ImageColorAnalysisResult(uint64_t a1, _OWORD *a2)
{
  unsigned int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ImageColorAnalysisResult(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ImageColorAnalysisResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ImageColorAnalysisResult()
{
  return &type metadata for ImageColorAnalysisResult;
}

unint64_t sub_1000D1D04()
{
  unint64_t result = qword_10013B050;
  if (!qword_10013B050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B050);
  }
  return result;
}

unint64_t sub_1000D1D5C()
{
  unint64_t result = qword_10013B058;
  if (!qword_10013B058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B058);
  }
  return result;
}

unint64_t sub_1000D1DB4()
{
  unint64_t result = qword_10013B060;
  if (!qword_10013B060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B060);
  }
  return result;
}

unint64_t sub_1000D1E0C()
{
  unint64_t result = qword_10013B068;
  if (!qword_10013B068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B068);
  }
  return result;
}

UIImage *sub_1000D1E64(CGFloat a1, CGFloat a2)
{
  if (a1 == 0.0) {
    return 0;
  }
  int v3 = 0;
  BOOL v6 = (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(void *)&a1 & 0x7FF0000000000000) == 0;
  if (!v6 && a2 != 0.0)
  {
    if ((~*(void *)&a2 & 0x7FF0000000000000) != 0 || (*(void *)&a2 & 0xFFFFFFFFFFFFFLL) == 0)
    {
      UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
      [v2 set];
      id v8 = [self ts_bezierPathWithPillRect:0.0 cornerRadius:0.0 a1:a1 a2:a2];
      [v8 addClip];

      v9.origin.x = 0.0;
      v9.origin.y = 0.0;
      v9.size.width = a1;
      v9.size.height = a2;
      UIRectFill(v9);
      int v3 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      return v3;
    }
    return 0;
  }
  return v3;
}

id sub_1000D1F74(void *a1, void *a2, void *a3)
{
  if ([a1 userInterfaceStyle] == (id)2) {
    id v5 = a3;
  }
  else {
    id v5 = a2;
  }

  return v5;
}

void sub_1000D1FBC()
{
  id v0 = [self secondarySystemBackgroundColor];
  id v1 = [self traitCollectionWithUserInterfaceStyle:2];
  id v2 = [v0 resolvedColorWithTraitCollection:v1];

  qword_10014BE20 = (uint64_t)v2;
}

unsigned char *storeEnumTagSinglePayload for DeviceExpertError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000D20F8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceExpertError()
{
  return &type metadata for DeviceExpertError;
}

uint64_t sub_1000D2130()
{
  return sub_1000E8A50();
}

unint64_t sub_1000D2158()
{
  unint64_t result = qword_10013B070;
  if (!qword_10013B070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B070);
  }
  return result;
}

uint64_t sub_1000D21AC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000E8C50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v65 - v11;
  if (![a2 hasIdentifier])
  {
    if (qword_100135E40 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_1000E9260();
    sub_10001C4C8(v40, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v14 = sub_1000E9240();
    os_log_type_t v41 = sub_1000EA600();
    if (!os_log_type_enabled(v14, v41)) {
      goto LABEL_38;
    }
    id v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v42 = 0;
    uint64_t v43 = "TodayBannerValidator will not validate banner with no identifier";
LABEL_36:
    id v44 = v14;
    os_log_type_t v45 = v41;
    uint64_t v46 = v42;
    uint32_t v47 = 2;
    goto LABEL_37;
  }
  if ([a2 hasIsEnabled] && (objc_msgSend(a2, "isEnabled") & 1) == 0)
  {
    if (qword_100135E40 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_1000E9260();
    sub_10001C4C8(v48, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v14 = sub_1000E9240();
    os_log_type_t v41 = sub_1000EA620();
    if (!os_log_type_enabled(v14, v41)) {
      goto LABEL_38;
    }
    id v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v42 = 0;
    uint64_t v43 = "TodayBannerValidator will suppress banner due to isEnabled=false";
    goto LABEL_36;
  }
  if (![a2 hasDaysVisibleToNewSubscribers]
    || ![a2 daysVisibleToNewSubscribers])
  {
LABEL_18:
    sub_10002D970(v3 + 16, (uint64_t)v68);
    sub_100020A28(v68, v68[3]);
    uint64_t result = (uint64_t)[a2 identifier];
    if (!result)
    {
      __break(1u);
      return result;
    }
    unint64_t v25 = (void *)result;
    uint64_t v26 = sub_1000EA2B0();
    uint64_t v28 = v27;

    sub_1000E8F40();
    uint64_t v29 = v67;
    if (v67)
    {
      if (*(void *)(v67 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v30 = sub_10003BAEC(v26, v28);
        if (v31)
        {
          unint64_t v32 = (unint64_t *)(*(void *)(v29 + 56) + 16 * v30);
          unint64_t v34 = *v32;
          unint64_t v33 = v32[1];
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          sub_100020AC0((uint64_t)v68);
          if (([a2 hasNumberOfAppearancesToHide] & 1) != 0
            && [a2 numberOfAppearancesToHide]
            && v34 >= (unint64_t)[a2 numberOfAppearancesToHide])
          {
            if (qword_100135E40 != -1) {
              swift_once();
            }
            uint64_t v61 = sub_1000E9260();
            sub_10001C4C8(v61, (uint64_t)static Logger.todayWidgetBanner);
            uint64_t v14 = sub_1000E9240();
            os_log_type_t v62 = sub_1000EA620();
            if (!os_log_type_enabled(v14, v62)) {
              goto LABEL_38;
            }
            uint64_t v63 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v63 = 134217984;
            v68[0] = v34;
            sub_1000EA750();
            uint64_t v43 = "TodayBannerValidator will suppress banner due to numberOfAppearancesToHide reached. numberOfAppearances=%lu";
          }
          else
          {
            if (![a2 hasNumberOfTapsToHide]
              || ![a2 numberOfTapsToHide]
              || v33 < (unint64_t)[a2 numberOfTapsToHide])
            {
              if (qword_100135E40 != -1) {
                swift_once();
              }
              uint64_t v35 = sub_1000E9260();
              sub_10001C4C8(v35, (uint64_t)static Logger.todayWidgetBanner);
              uint64_t v36 = sub_1000E9240();
              os_log_type_t v37 = sub_1000EA620();
              if (!os_log_type_enabled(v36, v37)) {
                goto LABEL_51;
              }
              unint64_t v38 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v38 = 0;
              uint64_t v39 = "TodayBannerValidator validated bannerConfig";
LABEL_50:
              _os_log_impl((void *)&_mh_execute_header, v36, v37, v39, v38, 2u);
              swift_slowDealloc();
LABEL_51:

              return 1;
            }
            if (qword_100135E40 != -1) {
              swift_once();
            }
            uint64_t v64 = sub_1000E9260();
            sub_10001C4C8(v64, (uint64_t)static Logger.todayWidgetBanner);
            uint64_t v14 = sub_1000E9240();
            os_log_type_t v62 = sub_1000EA620();
            if (!os_log_type_enabled(v14, v62))
            {
LABEL_38:

              return 0;
            }
            uint64_t v63 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v63 = 134217984;
            v68[0] = v33;
            sub_1000EA750();
            uint64_t v43 = "TodayBannerValidator will suppress banner due to numberOfTapsToHide reached. numberOfTaps=%lu";
          }
          id v44 = v14;
          os_log_type_t v45 = v62;
          uint64_t v46 = v63;
          uint32_t v47 = 12;
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v44, v45, v43, v46, v47);
          swift_slowDealloc();
          goto LABEL_38;
        }
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_100020AC0((uint64_t)v68);
    if (qword_100135E40 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_1000E9260();
    sub_10001C4C8(v49, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v36 = sub_1000E9240();
    os_log_type_t v37 = sub_1000EA620();
    if (!os_log_type_enabled(v36, v37)) {
      goto LABEL_51;
    }
    unint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v38 = 0;
    uint64_t v39 = "TodayBannerValidator validating banner due to no state";
    goto LABEL_50;
  }
  id v13 = [a1 bundleSubscription];
  if (!v13)
  {
    if (qword_100135E40 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_1000E9260();
    sub_10001C4C8(v50, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v14 = sub_1000E9240();
    os_log_type_t v41 = sub_1000EA600();
    if (!os_log_type_enabled(v14, v41)) {
      goto LABEL_38;
    }
    id v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v42 = 0;
    goto LABEL_36;
  }
  uint64_t v14 = v13;
  if (![v13 isSubscribed])
  {
    if (qword_100135E40 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_1000E9260();
    sub_10001C4C8(v51, (uint64_t)static Logger.todayWidgetBanner);
    uint64_t v52 = sub_1000E9240();
    os_log_type_t v53 = sub_1000EA620();
    if (!os_log_type_enabled(v52, v53)) {
      goto LABEL_64;
    }
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    goto LABEL_63;
  }
  id v15 = [v14 initialPurchaseTimestamp];
  if (!v15)
  {
    if (qword_100135E40 == -1)
    {
LABEL_61:
      uint64_t v56 = sub_1000E9260();
      sub_10001C4C8(v56, (uint64_t)static Logger.todayWidgetBanner);
      uint64_t v52 = sub_1000E9240();
      os_log_type_t v53 = sub_1000EA600();
      if (!os_log_type_enabled(v52, v53))
      {
LABEL_64:

        goto LABEL_38;
      }
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
            "Timestamp is missing";
LABEL_63:
      _os_log_impl((void *)&_mh_execute_header, v52, v53, v55, v54, 2u);
      swift_slowDealloc();
      goto LABEL_64;
    }
LABEL_82:
    swift_once();
    goto LABEL_61;
  }
  unint64_t v16 = v15;
  [v15 doubleValue];
  sub_1000E8C20();
  sub_1000E8C40();
  sub_1000E8BC0();
  double v18 = v17;
  unint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v10, v6);
  double v20 = v18 / 86400.0;
  if ((~COERCE__INT64(v18 / 86400.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_80;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  uint64_t v66 = v19;
  if (v20 >= 9.22337204e18)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v21 = (uint64_t)v20;
  id v22 = [a2 daysVisibleToNewSubscribers];
  if (v21 < 1 || (unint64_t)v22 >= v21)
  {

    v66(v12, v6);
    goto LABEL_18;
  }
  if (qword_100135E40 != -1) {
    swift_once();
  }
  uint64_t v57 = sub_1000E9260();
  sub_10001C4C8(v57, (uint64_t)static Logger.todayWidgetBanner);
  uint64_t v58 = sub_1000E9240();
  os_log_type_t v59 = sub_1000EA620();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 134217984;
    v68[0] = v21;
    sub_1000EA750();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "TodayBannerValidator will suppress banner due to daysVisibleToNewSubscribers limit reached. daysSubscribed=%lld", v60, 0xCu);
    swift_slowDealloc();
  }

  v66(v12, v6);
  return 0;
}

uint64_t type metadata accessor for TodayBannerValidator()
{
  return self;
}

unint64_t sub_1000D2D10()
{
  unint64_t result = qword_10013B128;
  if (!qword_10013B128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B128);
  }
  return result;
}

uint64_t sub_1000D2D64()
{
  return sub_10001D100(&qword_10013B130, &qword_10013B138);
}

uint64_t sub_1000D2DA0()
{
  uint64_t v0 = sub_10001B38C(&qword_10013B178);
  sub_10001C500(v0, qword_10014BE28);
  sub_10001C4C8(v0, (uint64_t)qword_10014BE28);
  sub_1000D47A4();
  return sub_1000E8840();
}

uint64_t sub_1000D2E1C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_1000E8A60();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_1000E8CC0();
  v1[6] = swift_task_alloc();
  sub_1000EA270();
  v1[7] = swift_task_alloc();
  sub_1000E8A70();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000D2F60, 0, 0);
}

uint64_t sub_1000D2F60()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = (uint64_t *)v0[2];
  sub_10001B38C(&qword_10013B138);
  sub_1000EA260();
  sub_1000E8C90();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_1000E8A80();
  sub_10001D100(&qword_10013B208, &qword_10013B210);
  *uint64_t v4 = sub_1000E8930();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1000D3108()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000E8A60();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8CC0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000EA270();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E8A70();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000E8910();
  sub_10001C500(v10, qword_10014BE40);
  sub_10001C4C8(v10, (uint64_t)qword_10014BE40);
  sub_1000EA260();
  sub_1000E8C90();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000E8A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1000E8900();
}

uint64_t sub_1000D33E4()
{
  uint64_t v0 = sub_10001B38C(&qword_10013B1E8);
  sub_10001C500(v0, qword_10014BE58);
  sub_10001C4C8(v0, (uint64_t)qword_10014BE58);
  sub_1000D3FF8();
  return sub_1000E88B0();
}

uint64_t sub_1000D3460()
{
  uint64_t v0 = sub_1000E8A70();
  sub_10001C500(v0, qword_10014BE70);
  sub_10001C4C8(v0, (uint64_t)qword_10014BE70);
  return sub_1000E8A50();
}

uint64_t sub_1000D34C4()
{
  uint64_t v0 = sub_10001B38C(&qword_100136528);
  sub_10001C500(v0, qword_10014BE88);
  uint64_t v1 = sub_10001C4C8(v0, (uint64_t)qword_10014BE88);
  sub_1000E87D0();
  uint64_t v2 = sub_1000E87E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000D357C()
{
  uint64_t result = swift_getKeyPath();
  qword_10014BEA0 = result;
  return result;
}

uint64_t sub_1000D35A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_1000D35C8, 0, 0);
}

uint64_t sub_1000D35C8()
{
  sub_1000E8650();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_1000E8650();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100135E38 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10014BEA0;
  *(void *)(v0 + 80) = qword_10014BEA0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_10001D100(&qword_10013B208, &qword_10013B210);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_1000D3724;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000D3724()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100019FD8;
  }
  else {
    uint64_t v2 = sub_1000D3878;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000D3878()
{
  sub_1000E8650();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10014BEA0;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100019DFC;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_1000D3954()
{
  if (qword_100135E38 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000D39B4()
{
  unint64_t result = qword_10013B140;
  if (!qword_10013B140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B140);
  }
  return result;
}

unint64_t sub_1000D3A0C()
{
  unint64_t result = qword_10013B148;
  if (!qword_10013B148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B148);
  }
  return result;
}

uint64_t sub_1000D3A60()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000D3A94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D3AE4@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A9E4(&qword_100135E28, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10014BE70, a1);
}

uint64_t sub_1000D3B1C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100135E30 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B38C(&qword_100136528);
  uint64_t v3 = sub_10001C4C8(v2, (uint64_t)qword_10014BE88);

  return sub_10001CB68(v3, a1);
}

uint64_t sub_1000D3B98(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10001A400;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_1000D35C8, 0, 0);
}

uint64_t sub_1000D3C4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000D4E34();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000D3C74()
{
  return 0xD000000000000021;
}

unint64_t sub_1000D3C94()
{
  unint64_t result = qword_10013B158;
  if (!qword_10013B158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B158);
  }
  return result;
}

unint64_t sub_1000D3CEC()
{
  unint64_t result = qword_10013B160;
  if (!qword_10013B160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B160);
  }
  return result;
}

unint64_t sub_1000D3D44()
{
  unint64_t result = qword_10013B168;
  if (!qword_10013B168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B168);
  }
  return result;
}

uint64_t sub_1000D3D98()
{
  return sub_10001D100(&qword_10013B170, &qword_10013B178);
}

uint64_t sub_1000D3DD4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000D3DF4, 0, 0);
}

uint64_t sub_1000D3DF4()
{
  if (qword_100135C08 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  swift_retain();
  swift_retain();
  sub_1000E8D20();
  swift_release();
  swift_release();
  *uint64_t v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000D3ED0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_1000D3EF4, 0, 0);
}

uint64_t sub_1000D3EF4()
{
  if (qword_100135C08 != -1) {
    swift_once();
  }
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  swift_retain();
  swift_retain();
  sub_1000E8D30();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000D3FC8@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A834(&qword_100135E10, &qword_10013B178, (uint64_t)qword_10014BE28, a1);
}

unint64_t sub_1000D3FF8()
{
  unint64_t result = qword_10013B180;
  if (!qword_10013B180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B180);
  }
  return result;
}

uint64_t sub_1000D404C()
{
  return sub_10001D100(&qword_10013B188, &qword_10013B178);
}

uint64_t sub_1000D4088()
{
  uint64_t v0 = qword_10013B118;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000D40C4()
{
  unint64_t result = qword_10013B190;
  if (!qword_10013B190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B190);
  }
  return result;
}

uint64_t sub_1000D4118@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A834(&qword_100135E20, &qword_10013B1E8, (uint64_t)qword_10014BE58, a1);
}

unint64_t sub_1000D4148()
{
  unint64_t result = qword_10013B198;
  if (!qword_10013B198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B198);
  }
  return result;
}

unint64_t sub_1000D41A0()
{
  unint64_t result = qword_10013B1A0;
  if (!qword_10013B1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1A0);
  }
  return result;
}

unint64_t sub_1000D41F8()
{
  unint64_t result = qword_10013B1A8;
  if (!qword_10013B1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1A8);
  }
  return result;
}

unint64_t sub_1000D4250()
{
  unint64_t result = qword_10013B1B0;
  if (!qword_10013B1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1B0);
  }
  return result;
}

uint64_t sub_1000D42A4@<X0>(uint64_t *a1@<X8>)
{
  sub_1000D47A4();
  uint64_t result = sub_1000E8630();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000D42E4()
{
  sub_1000D4750();
  uint64_t v2 = sub_1000E8870();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10001C5B8(v3, v0, v2, v1);
}

uint64_t sub_1000D4378@<X0>(uint64_t a1@<X8>)
{
  return sub_10001A9E4(&qword_100135E18, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10014BE40, a1);
}

uint64_t sub_1000D43B0()
{
  return sub_10001D100(&qword_10013B1C0, &qword_10013B1C8);
}

uint64_t sub_1000D43EC(uint64_t a1)
{
  unint64_t v2 = sub_1000D3FF8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000D443C()
{
  unint64_t result = qword_10013B1D0;
  if (!qword_10013B1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1D0);
  }
  return result;
}

uint64_t sub_1000D4490()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8A70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_1000E8A50();
  sub_1000E8A50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v9 = sub_1000E8800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_1000E8A50();
  return sub_1000E8810();
}

uint64_t sub_1000D46E4(uint64_t a1)
{
  unint64_t v2 = sub_1000D4250();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GameCenterEntity()
{
  return &type metadata for GameCenterEntity;
}

ValueMetadata *type metadata accessor for GameCenterEntity.UpdateIntent_value()
{
  return &type metadata for GameCenterEntity.UpdateIntent_value;
}

unint64_t sub_1000D4750()
{
  unint64_t result = qword_10013B1D8;
  if (!qword_10013B1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1D8);
  }
  return result;
}

unint64_t sub_1000D47A4()
{
  unint64_t result = qword_10013B1E0;
  if (!qword_10013B1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B1E0);
  }
  return result;
}

uint64_t sub_1000D47F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_10001B38C(&qword_100136608);
  uint64_t v20 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&KeyPath - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_100136610);
  uint64_t v21 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001B38C(&qword_100136618);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v22 = v7;
  uint64_t v23 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10001B38C(&qword_100136620);
  sub_1000C8724();
  uint64_t v11 = sub_10001B3D0(&qword_100136628);
  uint64_t v12 = sub_1000E9740();
  uint64_t v13 = sub_10001D100(&qword_100136630, &qword_100136628);
  unint64_t v14 = sub_1000397BC();
  uint64_t v25 = v11;
  uint64_t v26 = v12;
  uint64_t v27 = v13;
  unint64_t v28 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1000EA070();
  sub_1000E9680();
  uint64_t v15 = sub_10001D100((unint64_t *)&unk_100136640, &qword_100136608);
  sub_1000E9780();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v1);
  uint64_t v25 = v1;
  uint64_t v26 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_1000E97B0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  uint64_t v25 = v4;
  uint64_t v26 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v17 = v22;
  sub_1000E9770();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v10, v17);
}

uint64_t sub_1000D4C34()
{
  uint64_t v0 = sub_1000E9740();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_100136628);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E9680();
  sub_1000E9CD0();
  sub_1000E9730();
  sub_10001D100(&qword_100136630, &qword_100136628);
  sub_1000397BC();
  sub_1000E9AA0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000D4E34()
{
  uint64_t v0 = sub_10001B38C(&qword_1001364F8);
  __chkstk_darwin(v0 - 8);
  unint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000E8860();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B38C(&qword_100136500);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_10001B38C(&qword_1001364A8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_1000E8A70();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_10001B38C(&qword_10013B218);
  sub_1000E8A50();
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_1000E8600();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  double v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000D3FF8();
  unint64_t v19 = v23;
  uint64_t v24 = sub_1000E8670();
  sub_10001B38C(&qword_100136510);
  sub_1000E8A50();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_1000EA540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_1000E8690();
  return v24;
}

uint64_t sub_1000D5274@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for GameCenterToggleControl()
{
  return &type metadata for GameCenterToggleControl;
}

uint64_t sub_1000D5290()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D52B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t Logger.todayWidgetBanner.unsafeMutableAddressor()
{
  if (qword_100135E40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000E9260();

  return sub_10001C4C8(v0, (uint64_t)static Logger.todayWidgetBanner);
}

uint64_t sub_1000D5404()
{
  uint64_t v0 = sub_1000E9260();
  sub_10001C500(v0, static Logger.todayWidgetBanner);
  sub_10001C4C8(v0, (uint64_t)static Logger.todayWidgetBanner);
  return sub_1000E9250();
}

uint64_t static Logger.todayWidgetBanner.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100135E40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000E9260();
  uint64_t v3 = sub_10001C4C8(v2, (uint64_t)static Logger.todayWidgetBanner);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000D5530()
{
  id v1 = [*(id *)(v0 + 24) userID];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_1000EA2B0();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  id v6 = [*(id *)(v0 + 16) possiblyUnfetchedAppConfiguration];
  if ([v6 respondsToSelector:"widgetTelemetrySamplingRate"])
  {
    [v6 widgetTelemetrySamplingRate];
    double v8 = v7;
    swift_unknownObjectRelease();
    float v9 = v8;
  }
  else
  {
    swift_unknownObjectRelease();
    float v9 = 0.0;
  }
  char v10 = sub_1000D5728(v9, v3, v5);
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1000D5614()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for TelemetryEnablement()
{
  return self;
}

uint64_t sub_1000D5678(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000E89E0();
  if (!result || (uint64_t result = sub_1000E8A00(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1000E89F0();
      sub_1000E9F30();
      sub_1000D5E5C();
      return sub_1000E9EE0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000D5728(float a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000E9F30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E9F20();
  uint64_t v43 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000EA2E0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3
    || (uint64_t v42 = v9,
        sub_1000EA2D0(),
        uint64_t v16 = sub_1000EA2C0(),
        unint64_t v18 = v17,
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12),
        v18 >> 60 == 15))
  {
    id v19 = FCAnalyticsLog;
    sub_1000EA620();
    sub_1000E9220();

    return 0;
  }
  int v45 = 0;
  sub_1000D5E5C();
  sub_1000E9F00();
  switch(v18 >> 62)
  {
    case 1uLL:
      uint64_t v22 = (int)v16;
      uint64_t v23 = v16;
      uint64_t v24 = v16 >> 32;
      if (v24 < v22) {
        goto LABEL_27;
      }
      sub_1000D19F4(v23, v18);
      sub_1000D5678(v22, v24);
      sub_10002D6A4(v23, v18);
      uint64_t v16 = v23;
      break;
    case 2uLL:
      uint64_t v25 = v16;
      uint64_t v26 = *(void *)(v16 + 16);
      uint64_t v27 = *(void *)(v25 + 24);
      sub_1000D5EB4(v25, v18);
      swift_retain();
      swift_retain();
      sub_1000D5678(v26, v27);
      uint64_t v16 = v25;
      swift_release();
      swift_release();
      uint64_t v28 = v25;
      goto LABEL_13;
    case 3uLL:
      memset(v44, 0, 14);
      goto LABEL_12;
    default:
      v44[0] = v16;
      LOWORD(v44[1]) = v18;
      BYTE2(v44[1]) = BYTE2(v18);
      BYTE3(v44[1]) = BYTE3(v18);
      BYTE4(v44[1]) = BYTE4(v18);
      BYTE5(v44[1]) = BYTE5(v18);
LABEL_12:
      sub_1000E9EE0();
      uint64_t v28 = v16;
LABEL_13:
      sub_10002D6A4(v28, v18);
      break;
  }
  sub_1000E9EF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000E9F10();
  if (!CCBigNumFromData())
  {
    id v39 = FCAnalyticsLog;
    sub_1000EA620();
    sub_1000E9220();
    sub_10002D6A4(v16, v18);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v42);
    return 0;
  }
  uint64_t v29 = CCBigNumFromHexString();
  float v30 = a1 * 100.0;
  if ((~COERCE_INT(a1 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v30 <= -1.0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v41 = v16;
  if (v30 >= 4295000000.0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  uint64_t v31 = v29;
  CCBigNumFromDecimalString();
  CCCreateBigNum();
  v40[1] = v31;
  int v45 = CCBigNumMulI();
  CCCreateBigNum();
  v40[0] = CCCreateBigNum();
  int v45 = CCBigNumDiv();
  int v32 = CCBigNumCompare();
  uint64_t v20 = v32 >> 31;
  uint64_t v33 = (void *)FCAnalyticsLog;
  sub_10001B38C(&qword_100137370);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1000F1E20;
  unint64_t v35 = sub_1000263E0();
  uint64_t v36 = 0x64656C6261736964;
  if (v32 < 0) {
    uint64_t v36 = 0x64656C62616E65;
  }
  unint64_t v37 = 0xE800000000000000;
  if (v32 < 0) {
    unint64_t v37 = 0xE700000000000000;
  }
  *(void *)(v34 + 56) = &type metadata for String;
  *(void *)(v34 + 64) = v35;
  *(void *)(v34 + 32) = v36;
  *(void *)(v34 + 40) = v37;
  *(void *)(v34 + 96) = &type metadata for Float;
  *(void *)(v34 + 104) = &protocol witness table for Float;
  *(float *)(v34 + 72) = a1;
  id v38 = v33;
  sub_1000EA620();
  sub_1000E9220();

  swift_bridgeObjectRelease();
  CCBigNumFree();
  CCBigNumFree();
  CCBigNumFree();
  CCBigNumFree();
  CCBigNumFree();
  CCBigNumFree();
  sub_10002D6A4(v41, v18);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v42);
  return v20;
}

unint64_t sub_1000D5E5C()
{
  unint64_t result = qword_10013B2D8;
  if (!qword_10013B2D8)
  {
    sub_1000E9F30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B2D8);
  }
  return result;
}

uint64_t sub_1000D5EB4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000D19F4(a1, a2);
  }
  return a1;
}

uint64_t destroy for AudioPlayButton()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s10NewsToday215AudioPlayButtonVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioPlayButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AudioPlayButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioPlayButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioPlayButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioPlayButton()
{
  return &type metadata for AudioPlayButton;
}

uint64_t sub_1000D603C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D6058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  int v77 = a3;
  uint64_t v84 = a1;
  uint64_t v74 = a4;
  uint64_t v5 = sub_1000E9380();
  uint64_t v82 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001B38C(&qword_100137578);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v76 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v58 - v11;
  uint64_t v13 = sub_1000E8C50();
  uint64_t v75 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v58 - v17;
  uint64_t v71 = sub_10001B38C(&qword_100137580);
  uint64_t v19 = __chkstk_darwin(v71);
  size_t v72 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v58 - v21;
  uint64_t v83 = sub_1000E9390();
  uint64_t v81 = *(void *)(v83 - 8);
  uint64_t v23 = __chkstk_darwin(v83);
  uint64_t v80 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v73 = (char *)&v58 - v26;
  __chkstk_darwin(v25);
  char v79 = (char *)&v58 - v27;
  sub_1000E9BC0();
  uint64_t v78 = sub_1000E9C00();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000E9DC0();
  sub_1000E9300();
  uint64_t v70 = v88;
  int v66 = v89;
  uint64_t v69 = v90;
  int v65 = v91;
  uint64_t v68 = v92;
  uint64_t v67 = v93;
  swift_bridgeObjectRetain();
  uint64_t v84 = sub_100077BC8(v84, a2);
  uint64_t v64 = v29;
  sub_1000E8C10();
  sub_1000E8C10();
  sub_1000D683C();
  uint64_t v30 = v13;
  uint64_t result = sub_1000EA230();
  if (result)
  {
    uint64_t v32 = *(int *)(v8 + 48);
    uint64_t v59 = v8;
    uint64_t v62 = v5;
    uint64_t v60 = v22;
    uint64_t v33 = &v12[v32];
    uint64_t v61 = v7;
    uint64_t v34 = v75;
    uint64_t v63 = KeyPath;
    unint64_t v35 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
    v35(v12, v18, v30);
    uint64_t v36 = v33;
    uint64_t v58 = v33;
    v35(v33, v16, v30);
    unint64_t v37 = v76;
    id v38 = &v76[*(int *)(v8 + 48)];
    id v39 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
    v39(v76, v12, v30);
    v39(v38, v36, v30);
    uint64_t v40 = (uint64_t)v72;
    v35(v72, v37, v30);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v34 + 8);
    v41(v38, v30);
    uint64_t v42 = &v37[*(int *)(v59 + 48)];
    v35(v37, v12, v30);
    v35(v42, v58, v30);
    v35((char *)(v40 + *(int *)(v71 + 36)), v42, v30);
    v41(v37, v30);
    sub_100035398(v40, (uint64_t)v60);
    uint64_t v43 = (unsigned int *)&enum case for PlaybackButton.State.playing(_:);
    if ((v77 & 1) == 0) {
      uint64_t v43 = (unsigned int *)&enum case for PlaybackButton.State.unplayed(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v82 + 104))(v61, *v43, v62);
    uint64_t v86 = v84;
    uint64_t v87 = v64;
    sub_10007718C();
    swift_retain();
    swift_retain();
    id v44 = v73;
    sub_1000E9370();
    uint64_t v45 = v81;
    uint64_t v46 = v79;
    uint64_t v47 = v83;
    (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v79, v44, v83);
    swift_release();
    swift_release();
    LOBYTE(v86) = v66;
    char v85 = v65;
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    uint64_t v49 = v80;
    v48(v80, v46, v47);
    char v50 = v86;
    char v51 = v85;
    uint64_t v52 = v74;
    uint64_t v53 = v78;
    *uint64_t v74 = v63;
    v52[1] = v53;
    v52[2] = v70;
    *((unsigned char *)v52 + 24) = v50;
    v52[4] = v69;
    *((unsigned char *)v52 + 40) = v51;
    uint64_t v54 = v67;
    v52[6] = v68;
    v52[7] = v54;
    uint64_t v55 = v52;
    uint64_t v56 = sub_10001B38C(&qword_10013B2E8);
    v48((char *)v55 + *(int *)(v56 + 48), v49, v47);
    uint64_t v57 = *(void (**)(char *, uint64_t))(v45 + 8);
    swift_retain();
    swift_retain();
    v57(v46, v47);
    v57(v49, v47);
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000D67D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  int v5 = *(unsigned __int8 *)(v1 + 16);
  *a1 = sub_1000E9DC0();
  a1[1] = v6;
  uint64_t v7 = sub_10001B38C(&qword_10013B2E0);
  return sub_1000D6058(v3, v4, v5, (uint64_t *)((char *)a1 + *(int *)(v7 + 44)));
}

unint64_t sub_1000D683C()
{
  unint64_t result = qword_100137590;
  if (!qword_100137590)
  {
    sub_1000E8C50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100137590);
  }
  return result;
}

unint64_t sub_1000D6898()
{
  unint64_t result = qword_10013B2F0;
  if (!qword_10013B2F0)
  {
    sub_10001B3D0(&qword_10013B2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B2F0);
  }
  return result;
}

uint64_t type metadata accessor for BiomeEventStore()
{
  return self;
}

void sub_1000D6918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a7;
  uint64_t v30 = a8;
  id v31 = a5;
  uint64_t v13 = type metadata accessor for TaskContext();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v28 + 64);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = sub_10001B38C(&qword_100137580);
  uint64_t v27 = *(void *)(v15 - 8);
  uint64_t v16 = *(void *)(v27 + 64);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a6;
  _OWORD v19[3] = sub_10007441C;
  v19[4] = v18;
  v19[5] = a3;
  v19[6] = a4;
  uint64_t v36 = sub_1000D8204;
  unint64_t v37 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_1000D6F2C;
  unint64_t v35 = &unk_100127D80;
  uint64_t v20 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  sub_1000D80D8(v29, (uint64_t)v17);
  sub_1000D822C(v30, (uint64_t)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v22 = (v16 + *(unsigned __int8 *)(v28 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v23 = swift_allocObject();
  sub_10002D5DC((uint64_t)v17, v23 + v21, &qword_100137580);
  sub_1000CF6F4((uint64_t)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  *(void *)(v23 + ((v14 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = a6;
  uint64_t v36 = sub_1000D86CC;
  unint64_t v37 = (void *)v23;
  aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_1000D6F2C;
  unint64_t v35 = &unk_100127DD0;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v25 = [v31 sinkWithCompletion:v20 receiveInput:v24];
  _Block_release(v24);
  _Block_release(v20);
}

uint64_t sub_1000D6C64(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(id))
{
  id v9 = [a1 state];
  if (v9 == (id)1)
  {
    id v10 = [a1 error];
    if (!v10)
    {
      sub_1000D8818();
      id v10 = (id)swift_allocError();
    }
    sub_1000EA600();
    sub_10001B38C(&qword_100137370);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1000F1610;
    sub_10001B38C(&qword_100137378);
    sub_1000EA910();
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_1000263E0();
    *(void *)(v11 + 32) = 0;
    *(void *)(v11 + 40) = 0xE000000000000000;
    sub_100026434();
    uint64_t v12 = (void *)sub_1000EA720();
    sub_1000E9220();
    swift_bridgeObjectRelease();

    a5(v10);
    return swift_errorRelease();
  }
  else if (v9)
  {
    uint64_t result = sub_1000EA960();
    __break(1u);
  }
  else
  {
    sub_10001B38C(&qword_100137370);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1000F1610;
    swift_beginAccess();
    uint64_t v15 = *(void *)(*(void *)(a2 + 16) + 16);
    *(void *)(v14 + 56) = &type metadata for Int;
    *(void *)(v14 + 64) = &protocol witness table for Int;
    *(void *)(v14 + 32) = v15;
    sub_100026434();
    uint64_t v16 = (void *)sub_1000EA720();
    sub_1000EA620();
    sub_1000E9220();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    uint64_t v17 = swift_bridgeObjectRetain();
    a3(v17);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000D6F30(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v60 = a4;
  uint64_t v62 = a3;
  uint64_t v6 = sub_10001B38C(&qword_1001393C8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000E9F60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v64 = v9;
  uint64_t v65 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v61 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v58 - v13;
  uint64_t v14 = sub_10001B38C(&qword_100137580);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000E8C50();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v58 - v22;
  id v24 = [a1 eventBody];
  if (!v24) {
    return;
  }
  id v25 = v24;
  id v26 = [v24 homeScreenEvent];

  if (!v26) {
    return;
  }
  id v59 = v26;
  id v27 = [v26 date];
  sub_1000E8C30();

  sub_1000D87D0((unint64_t *)&qword_100137590, (void (*)(uint64_t))&type metadata accessor for Date);
  char v28 = sub_1000EA220();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  sub_1000D80D8(a2, (uint64_t)v16);
  if ((v28 & 1) == 0)
  {
    sub_100028B6C((uint64_t)v16, &qword_100137580);
    uint64_t v45 = *(void (**)(char *, uint64_t))(v18 + 8);
    v45(v21, v17);
    v45(v23, v17);
    goto LABEL_10;
  }
  char v29 = sub_1000EA230();
  sub_100028B6C((uint64_t)v16, &qword_100137580);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v18 + 8);
  v30(v21, v17);
  v30(v23, v17);
  if ((v29 & 1) == 0)
  {
LABEL_10:

    return;
  }
  id v31 = v59;
  id v32 = [v59 widgetSize];
  if ((unint64_t)v32 >= 4)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 56))(v8, 1, 1, v64);

    sub_100028B6C((uint64_t)v8, &qword_1001393C8);
    return;
  }
  uint64_t v34 = v64;
  uint64_t v33 = v65;
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v8, *(unsigned int *)*(&off_100127E88 + (void)v32), v64);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v8, 0, 1, v34);
  unint64_t v35 = v63;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v63, v8, v34);
  uint64_t v36 = v61;
  sub_1000EA130();
  sub_1000D87D0((unint64_t *)&qword_100139068, (void (*)(uint64_t))&type metadata accessor for InternalWidgetFamily);
  sub_1000EA420();
  sub_1000EA420();
  uint64_t v37 = v68[0];
  uint64_t v38 = v66;
  id v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v36, v34);
  if (v37 != v38) {
    goto LABEL_24;
  }
  id v40 = [v59 widgetBundleId];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = sub_1000EA2B0();
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
  }
  id v46 = [self mainBundle];
  id v47 = [v46 bundleIdentifier];

  if (!v47)
  {
    if (!v44) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  uint64_t v48 = sub_1000EA2B0();
  uint64_t v50 = v49;

  if (!v44)
  {
    if (!v50) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if (!v50)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    v39(v35, v34);
    goto LABEL_10;
  }
  if (v42 == v48 && v44 == v50)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v51 = sub_1000EAB20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v51 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_26:
  id v52 = v59;
  sub_1000D7684((uint64_t)&v66);
  if (v67)
  {
    uint64_t v53 = (void **)(v60 + 16);
    sub_1000A9708(&v66, (uint64_t)v68);
    sub_10002D970((uint64_t)v68, (uint64_t)&v66);
    swift_beginAccess();
    uint64_t v54 = *v53;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v53 = v54;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v54 = sub_1000A4D34(0, v54[2] + 1, 1, v54);
      *uint64_t v53 = v54;
    }
    unint64_t v57 = v54[2];
    unint64_t v56 = v54[3];
    if (v57 >= v56 >> 1)
    {
      uint64_t v54 = sub_1000A4D34((void *)(v56 > 1), v57 + 1, 1, v54);
      *uint64_t v53 = v54;
    }
    v54[2] = v57 + 1;
    sub_1000A9708(&v66, (uint64_t)&v54[5 * v57 + 4]);
    swift_endAccess();

    sub_100020AC0((uint64_t)v68);
    v39(v35, v34);
  }
  else
  {
    v39(v35, v34);

    sub_100028B6C((uint64_t)&v66, &qword_10013A090);
  }
}

void sub_1000D7684(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = sub_1000E8C50();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v13 = [v1 eventTypeString];
  if (!v13)
  {
    sub_1000EA2B0();
    NSString v13 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  id v14 = v13;
  if (([v14 isEqualToString:@"Unknown"] & 1) != 0
    || ([v14 isEqualToString:@"HomeScreenPageShown"] & 1) != 0
    || ([v14 isEqualToString:@"HomeScreenDisappeared"] & 1) != 0
    || ([v14 isEqualToString:@"StackChanged"] & 1) != 0)
  {
    goto LABEL_20;
  }
  if (([v14 isEqualToString:@"WidgetTapped"] & 1) == 0)
  {
    if (([v14 isEqualToString:@"WidgetLongLook"] & 1) == 0
      && ([v14 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
      && ([v14 isEqualToString:@"UserStackConfigChanged"] & 1) == 0
      && ([v14 isEqualToString:@"DeviceLocked"] & 1) == 0
      && ([v14 isEqualToString:@"DeviceUnlocked"] & 1) == 0
      && ([v14 isEqualToString:@"PinnedWidgetAdded"] & 1) == 0
      && ([v14 isEqualToString:@"PinnedWidgetDeleted"] & 1) == 0
      && ([v14 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
      && ([v14 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0)
    {
      if ([v14 isEqualToString:@"StackShown"])
      {

        id v24 = [v1 date];
        sub_1000E8C30();

        id v25 = [v1 stackKind];
        if ((unint64_t)v25 >= 4) {
          char v26 = 0;
        }
        else {
          char v26 = (char)v25;
        }
        id v27 = [v1 stackLocation];
        if ((unint64_t)v27 >= 6) {
          char v28 = 0;
        }
        else {
          char v28 = (char)v27;
        }
        char v29 = (int *)type metadata accessor for AppearanceEvent(0);
        *(void *)(a1 + 24) = v29;
        *(void *)(a1 + 32) = &off_100125D80;
        uint64_t v30 = sub_100028B08((uint64_t *)a1);
        (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(v30, v12, v9);
        *((unsigned char *)v30 + v29[5]) = v26;
        *((unsigned char *)v30 + v29[6]) = v28;
        *((unsigned char *)v30 + v29[7]) = 0;
        return;
      }
      if ([v14 isEqualToString:@"StackDisappeared"])
      {

        id v31 = [v1 date];
        uint64_t v32 = type metadata accessor for DisappearanceEvent(0);
        *(void *)(a1 + 24) = v32;
        *(void *)(a1 + 32) = &off_100125D98;
        uint64_t v33 = sub_100028B08((uint64_t *)a1);
        sub_1000E8C30();

        *((unsigned char *)v33 + *(int *)(v32 + 20)) = 2;
        return;
      }
      if (([v14 isEqualToString:@"StackCreated"] & 1) == 0
        && ([v14 isEqualToString:@"StackDeleted"] & 1) == 0
        && ([v14 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
        && ([v14 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0)
      {
        if ([v14 isEqualToString:@"StackVisibilityChanged"])
        {

          id v34 = [v1 metadata];
          if (v34)
          {
            unint64_t v35 = v34;
            id v36 = [v34 visibleRect];

            if (v36)
            {
              [v36 rect];
              uint64_t v38 = v37;
              uint64_t v40 = v39;
              uint64_t v42 = v41;
              uint64_t v44 = v43;

              id v45 = [v1 date];
              uint64_t v46 = type metadata accessor for VisibleRectChangedEvent(0);
              *(void *)(a1 + 24) = v46;
              *(void *)(a1 + 32) = &off_100125DC8;
              id v47 = sub_100028B08((uint64_t *)a1);
              sub_1000E8C30();

              uint64_t v48 = (uint64_t *)((char *)v47 + *(int *)(v46 + 20));
              *uint64_t v48 = v38;
              v48[1] = v40;
              v48[2] = v42;
              v48[3] = v44;
              return;
            }
          }
          sub_1000EA600();
          sub_100026434();
          uint64_t v49 = (void *)sub_1000EA720();
          sub_1000E9220();

LABEL_21:
          *(void *)(a1 + 32) = 0;
          *(_OWORD *)a1 = 0u;
          *(_OWORD *)(a1 + 16) = 0u;
          return;
        }
        if (([v14 isEqualToString:@"AppAdded"] & 1) == 0) {
          [v14 isEqualToString:@"AppRemoved"];
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }

  id v15 = [v1 metadata];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 engagedUrl];

    if (v17)
    {
      sub_1000E8B20();

      uint64_t v18 = sub_1000E8B60();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
    }
    else
    {
      uint64_t v20 = sub_1000E8B60();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 1, 1, v20);
    }
    sub_10002D5DC((uint64_t)v6, (uint64_t)v8, (uint64_t *)&unk_1001370F0);
  }
  else
  {
    uint64_t v19 = sub_1000E8B60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  }
  id v21 = [v1 date];
  uint64_t v22 = type metadata accessor for EngagementEvent(0);
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = &off_100125DB0;
  uint64_t v23 = sub_100028B08((uint64_t *)a1);
  sub_1000E8C30();

  sub_10002D5DC((uint64_t)v8, (uint64_t)v23 + *(int *)(v22 + 20), (uint64_t *)&unk_1001370F0);
}

uint64_t sub_1000D7DA0(uint64_t a1, uint8_t *a2)
{
  uint64_t v4 = sub_10001B38C(&qword_100137580);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D80D8(a1, (uint64_t)v6);
  sub_100026434();
  uint64_t v7 = sub_1000EA720();
  os_log_type_t v8 = sub_1000EA620();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = a2;
    uint64_t v20 = 0;
    uint64_t v18 = a1;
    *(_DWORD *)uint64_t v9 = 136315138;
    id v17 = v9 + 4;
    unint64_t v21 = 0xE000000000000000;
    uint64_t v22 = v10;
    sub_1000E8C50();
    sub_1000EA910();
    v23._countAndFlagsBits = 3026478;
    v23._object = (void *)0xE300000000000000;
    sub_1000EA370(v23);
    sub_1000EA910();
    uint64_t v20 = sub_1000B1D7C(v20, v21, &v22);
    a1 = v18;
    sub_1000EA750();
    swift_bridgeObjectRelease();
    sub_100028B6C((uint64_t)v6, &qword_100137580);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "event store querying for events in range %s", v9, 0xCu);
    swift_arrayDestroy();
    a2 = v19;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_100028B6C((uint64_t)v6, &qword_100137580);
  }
  id v11 = [objc_allocWithZone((Class)ATXBiomeUIStream) init];
  CFDateRef isa = sub_1000E8BD0().super.isa;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = _swiftEmptyArrayStorage;
  id v14 = [v11 publisherFromStartTime:CFDateGetAbsoluteTime(isa)];
  *(&v17 - 4) = (uint8_t *)__chkstk_darwin(v14);
  *(&v17 - 3) = (uint8_t *)v13;
  *(&v17 - 2) = (uint8_t *)a1;
  *(&v17 - 1) = a2;
  sub_10001B38C(&qword_10013B398);
  swift_allocObject();
  uint64_t v15 = sub_1000E90A0();

  swift_release();
  return v15;
}

uint64_t sub_1000D80D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B38C(&qword_100137580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D8140()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000D8178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000D6918(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_1000D8184()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000D81BC()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000D8204(void *a1)
{
  return sub_1000D6C64(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_1000D8214(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D8224()
{
  return swift_release();
}

uint64_t sub_1000D822C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TaskContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D8290()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)(sub_10001B38C(&qword_100137580) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for TaskContext() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v33 = *(void *)(*(void *)v6 + 64);
  uint64_t v9 = v1 + v4;
  uint64_t v10 = sub_1000E8C50();
  id v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  uint64_t v12 = v9 + v2[11];
  uint64_t v13 = v8;
  v11(v12, v10);
  uint64_t v14 = sub_1000EA180();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v1 + v8, v14);
  uint64_t v15 = v1 + v8 + v6[7];
  uint64_t v16 = type metadata accessor for NewsTimelineEntry();
  int v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16);
  uint64_t v18 = v33;
  if (!v17)
  {
    uint64_t v32 = v7;
    v11(v15, v10);
    uint64_t v19 = (id *)(v15 + *(int *)(v16 + 20));

    uint64_t v20 = type metadata accessor for TodayContent();
    unint64_t v21 = (char *)v19 + *(int *)(v20 + 20);
    uint64_t v22 = (int *)type metadata accessor for Banner();
    if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v22 - 1) + 48))(v21, 1, v22))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Swift::String v23 = &v21[v22[7]];
      uint64_t v24 = sub_1000E8B60();
      uint64_t v25 = *(void *)(v24 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24)) {
        (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
      }
      swift_bridgeObjectRelease();
      char v26 = *(void **)&v21[v22[9]];
      if (v26 != (void *)1) {

      }
      sub_10001D758(*(void **)&v21[v22[10]], *(void **)&v21[v22[10] + 8]);
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    id v27 = (char *)v19 + *(int *)(v20 + 36);
    uint64_t v28 = sub_1000E8B60();
    uint64_t v29 = *(void *)(v28 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28)) {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v8;
    uint64_t v18 = v33;
    uint64_t v7 = v32;
  }
  unint64_t v30 = ((v18 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();

  return _swift_deallocObject(v1, v30, v3 | v7 | 7);
}

void sub_1000D86CC(void *a1)
{
  uint64_t v3 = *(void *)(sub_10001B38C(&qword_100137580) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for TaskContext() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_1000D6F30(a1, v1 + v4, v1 + v7, v8);
}

uint64_t sub_1000D87D0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000D8818()
{
  unint64_t result = qword_10013B3A0;
  if (!qword_10013B3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B3A0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BiomeEventStore.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000D8908);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventStore.Errors()
{
  return &type metadata for BiomeEventStore.Errors;
}

unint64_t sub_1000D8944()
{
  unint64_t result = qword_10013B3A8;
  if (!qword_10013B3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B3A8);
  }
  return result;
}

uint64_t sub_1000D89A0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  if ([a1 itemType] || (uint64_t v13 = swift_dynamicCastObjCProtocolConditional()) == 0)
  {
    sub_1000DB680(a4, a5);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v14 = (void *)v13;
    swift_unknownObjectRetain();
    id v15 = [v14 title];
    if (v15)
    {

      id v16 = [objc_allocWithZone((Class)FTHeadlineRowOpenURLEngagementDescriptor) initWithHeadline:v14];
      sub_100020A28(a3, a3[3]);
      uint64_t v17 = type metadata accessor for Item.Headline(0);
      sub_1000D0B14(v16, (uint64_t)a6 + *(int *)(v17 + 24));

      swift_unknownObjectRelease();
      *a6 = v14;
      a6[1] = a2;
      uint64_t v18 = (void *)((char *)a6 + *(int *)(v17 + 28));
      *uint64_t v18 = a4;
      v18[1] = a5;
      uint64_t v19 = type metadata accessor for Item(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a6, 0, 1, v19);
      return sub_100020AC0((uint64_t)a3);
    }
    swift_bridgeObjectRelease();
    sub_1000EA610();
    sub_10001B38C(&qword_100137370);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1000F1610;
    id v21 = [v14 identifier];
    uint64_t v22 = sub_1000EA2B0();
    uint64_t v24 = v23;

    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = sub_1000263E0();
    *(void *)(v20 + 32) = v22;
    *(void *)(v20 + 40) = v24;
    sub_100022374(0, (unint64_t *)&qword_100138300);
    uint64_t v25 = (void *)sub_1000EA720();
    sub_1000E9220();
    sub_1000DB680(a4, a5);
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease_n();
  }
  sub_100020AC0((uint64_t)a3);
  uint64_t v11 = type metadata accessor for Item(0);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a6, 1, 1, v11);
}

void *sub_1000D8C74()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  unsigned int v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000DB9FC(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000DD310((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  else
  {
    sub_1000DB7A8((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    uint64_t v9 = &v4[*(int *)(v2 + 28)];
    id v10 = *(id *)v9;
    uint64_t v8 = (void *)*((void *)v9 + 1);
    sub_1000DBB4C(*(id *)v9, v8);
    sub_1000DD310((uint64_t)v4, type metadata accessor for Item.Headline);
    if (v8)
    {
      id v11 = v8;
      sub_1000DB680(v10, v8);
    }
  }
  return v8;
}

id sub_1000D8DF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  unsigned int v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000DB9FC(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000DD310((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  sub_1000DB7A8((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
  uint64_t v8 = &v4[*(int *)(v2 + 28)];
  id v9 = *(id *)v8;
  id v10 = (void *)*((void *)v8 + 1);
  sub_1000DBB4C(*(id *)v8, v10);
  sub_1000DD310((uint64_t)v4, type metadata accessor for Item.Headline);
  if (!v10) {
    return 0;
  }
  id v11 = v9;
  sub_1000DB680(v9, v10);
  return v9;
}

id sub_1000D8F80()
{
  uint64_t v1 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E8B60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Item.Headline(0);
  sub_10002230C(v0 + *(int *)(v8 + 24), (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_100028B6C((uint64_t)v3, (uint64_t *)&unk_1001370F0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_1000E8AE0(v10);
    uint64_t v12 = v11;
    id v9 = [v11 nss_isAudioURL];

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v9;
}

id sub_1000D9124()
{
  uint64_t v1 = sub_10001B38C(&qword_10013B5F0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D9AA8(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_100028B6C((uint64_t)v3, &qword_10013B5F0);
    return 0;
  }
  else
  {
    sub_1000DB7A8((uint64_t)v3, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    uint64_t v9 = *(void *)(v0 + 8);
    if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10003BC3C((uint64_t)v7), (v11 & 1) != 0)) {
      id v8 = [*(id *)(*(void *)(v9 + 56) + 8 * v10) imageWithRenderingMode:2];
    }
    else {
      id v8 = 0;
    }
    sub_1000DD310((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  return v8;
}

uint64_t sub_1000D92DC()
{
  id v1 = *v0;
  id v2 = [*v0 storyTypeColorLight];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1000EA2B0();
    uint64_t v6 = v5;

    id v7 = [v1 storyTypeColorDark];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = sub_1000EA2B0();
      char v11 = v10;

      sub_100022374(0, (unint64_t *)&qword_100139070);
      v12._countAndFlagsBits = v4;
      v12._object = v6;
      Class isa = UIColor.init(hex:)(v12).super.isa;
      v14._countAndFlagsBits = v9;
      v14._object = v11;
      Class v15 = UIColor.init(hex:)(v14).super.isa;
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = isa;
      *(void *)(v16 + 24) = v15;
      id v17 = objc_allocWithZone((Class)UIColor);
      v23[4] = sub_10002E180;
      v23[5] = v16;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 1107296256;
      void v23[2] = sub_100075C34;
      v23[3] = &unk_100128110;
      uint64_t v18 = _Block_copy(v23);
      uint64_t v19 = isa;
      uint64_t v20 = v15;
      [v17 initWithDynamicProvider:v18];
      _Block_release(v18);
      swift_release();
      uint64_t v21 = sub_1000E9C40();

      return v21;
    }
    swift_bridgeObjectRelease();
  }

  return sub_1000E9C20();
}

void *sub_1000D94C0()
{
  uint64_t v1 = sub_10001B38C(&qword_10013B5F0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D9D50(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_100028B6C((uint64_t)v3, &qword_10013B5F0);
    return 0;
  }
  else
  {
    sub_1000DB7A8((uint64_t)v3, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
    uint64_t v9 = *(void *)(v0 + 8);
    if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10003BC3C((uint64_t)v7), (v11 & 1) != 0))
    {
      id v8 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
      id v12 = v8;
    }
    else
    {
      id v8 = 0;
    }
    sub_1000DD310((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ImageStore.Key);
  }
  return v8;
}

id sub_1000D9660()
{
  uint64_t v1 = sub_10001B38C(&qword_10013B5F8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [*v0 compactSourceName];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_1000EA2B0();
  }
  sub_1000E89C0();
  uint64_t v6 = sub_1000E89D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 0, 1, v6);
  char v7 = sub_1000E8ED0();
  swift_bridgeObjectRelease();
  sub_100028B6C((uint64_t)v3, &qword_10013B5F8);
  id v8 = *v0;
  if (v7)
  {
    id v8 = [v8 sourceName];
    uint64_t v9 = v8;
    if (v8)
    {
LABEL_7:
      uint64_t v11 = sub_1000EA2B0();

      return (id)v11;
    }
    __break(1u);
  }
  id result = [v8 compactSourceName];
  uint64_t v9 = result;
  if (result) {
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id sub_1000D97E8()
{
  uint64_t v1 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (id *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v4 = [*v0 titleCompact];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_1000EA2B0();
    uint64_t v8 = v7;

    sub_1000DB9FC((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
    if (v8)
    {
LABEL_7:
      sub_1000DD310((uint64_t)v3, type metadata accessor for Item.Headline);
      return (id)v6;
    }
  }
  else
  {
    sub_1000DB9FC((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
  }
  id result = [*v3 title];
  if (result)
  {
    unint64_t v10 = result;
    uint64_t v6 = sub_1000EA2B0();

    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000D992C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2 - 8);
  id v4 = (id *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000DB9FC(v1, (uint64_t)v7, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    return 0x6567617373656DLL;
  }
  else
  {
    sub_1000DB7A8((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    id v9 = [*v4 identifier];
    uint64_t v8 = sub_1000EA2B0();

    sub_1000DD310((uint64_t)v4, type metadata accessor for Item.Headline);
  }
  return v8;
}

uint64_t sub_1000D9AA8@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  id v13 = [*v1 sourceNameImageRemoteURL];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_1000E8B20();

    Class v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v15(v5, v10, v6);
    uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v16(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v15(v12, v5, v6);
      v15(a1, v12, v6);
      v16(a1, 0, 1, v6);
      uint64_t v17 = type metadata accessor for ImageStore.Key();
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 0, 1, v17);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_100028B6C((uint64_t)v5, (uint64_t *)&unk_1001370F0);
  uint64_t v19 = type metadata accessor for ImageStore.Key();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
}

uint64_t sub_1000D9D50@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - v11;
  id v13 = *v1;
  if ([*v1 needsPlaceholderThumbnail])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    uint64_t v14 = type metadata accessor for ImageStore.Key();
    Class v15 = *(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    return v15(a1, 0, 1, v14);
  }
  else
  {
    id v17 = [v13 thumbnailRemoteURL];
    if (v17)
    {
      uint64_t v18 = v17;
      sub_1000E8B20();

      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v19(v5, v10, v6);
      uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
      v20(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
      {
        v19(v12, v5, v6);
        v19(a1, v12, v6);
        v20(a1, 0, 1, v6);
        uint64_t v21 = type metadata accessor for ImageStore.Key();
        return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 0, 1, v21);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    }
    sub_100028B6C((uint64_t)v5, (uint64_t *)&unk_1001370F0);
    uint64_t v22 = type metadata accessor for ImageStore.Key();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a1, 1, 1, v22);
  }
}

uint64_t sub_1000DA09C()
{
  id v1 = [*v0 identifier];
  uint64_t v2 = sub_1000EA2B0();

  return v2;
}

uint64_t sub_1000DA0F8()
{
  uint64_t v1 = 0x656E696C64616568;
  if (*v0 != 1) {
    uint64_t v1 = 0x6567617373656DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_1000DA14C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000DDA48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000DA174(uint64_t a1)
{
  unint64_t v2 = sub_1000DB700();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DA1B0(uint64_t a1)
{
  unint64_t v2 = sub_1000DB700();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000DA1EC(char *a1, char *a2)
{
  return sub_1000C36A0(*a1, *a2);
}

Swift::Int sub_1000DA1F8()
{
  return sub_1000EABE0();
}

uint64_t sub_1000DA27C()
{
  sub_1000EA330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000DA2EC()
{
  return sub_1000EABE0();
}

uint64_t sub_1000DA36C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100124788;
  v8._object = v3;
  Swift::Int v5 = sub_1000EA9E0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_1000DA3CC(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x656E696C64616568;
  if (*v1) {
    uint64_t v2 = 0x6567617373656DLL;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1000DA40C()
{
  return sub_1000EA440();
}

uint64_t sub_1000DA46C()
{
  return sub_1000EA430();
}

uint64_t sub_1000DA4BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v22 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v22);
  Swift::OpaquePointer v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B38C(&qword_10013B3B8);
  uint64_t v23 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Item(0);
  __chkstk_darwin(v8);
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100020A28(a1, a1[3]);
  sub_1000DB700();
  uint64_t v11 = v25;
  sub_1000EAC00();
  if (!v11)
  {
    uint64_t v21 = v4;
    uint64_t v25 = v8;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    char v28 = 0;
    sub_1000DB754();
    sub_1000EAA70();
    uint64_t v15 = v12;
    if (v29)
    {
      char v27 = 2;
      uint64_t v17 = sub_1000EAA30();
      uint64_t v19 = v18;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
      uint64_t *v10 = v17;
      v10[1] = v19;
    }
    else
    {
      char v26 = 1;
      sub_1000DB864(&qword_10013B3D0, (void (*)(uint64_t))type metadata accessor for Item.Headline);
      uint64_t v16 = (uint64_t)v21;
      sub_1000EAA70();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
      sub_1000DB7A8(v16, (uint64_t)v10, type metadata accessor for Item.Headline);
    }
    swift_storeEnumTagMultiPayload();
    sub_1000DB7A8((uint64_t)v10, v13, type metadata accessor for Item);
  }
  return sub_100020AC0((uint64_t)a1);
}

uint64_t sub_1000DA824(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v16 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Item(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001B38C(&qword_10013B3D8);
  uint64_t v17 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000DB700();
  sub_1000EAC20();
  sub_1000DB9FC(v2, (uint64_t)v8, type metadata accessor for Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v23 = 1;
    char v22 = 0;
    sub_1000DB810();
    uint64_t v12 = v18;
    sub_1000EAAE0();
    if (!v12)
    {
      char v21 = 2;
      sub_1000EAAA0();
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000DB7A8((uint64_t)v8, (uint64_t)v5, type metadata accessor for Item.Headline);
    __int16 v20 = 0;
    sub_1000DB810();
    uint64_t v14 = v18;
    sub_1000EAAE0();
    if (!v14)
    {
      char v19 = 1;
      sub_1000DB864((unint64_t *)&unk_10013B3E8, (void (*)(uint64_t))type metadata accessor for Item.Headline);
      sub_1000EAAE0();
    }
    sub_1000DD310((uint64_t)v5, type metadata accessor for Item.Headline);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v9);
  }
}

uint64_t sub_1000DAB74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000DA4BC(a1, a2);
}

uint64_t sub_1000DAB8C(void *a1)
{
  return sub_1000DA824(a1);
}

uint64_t sub_1000DABA4()
{
  uint64_t result = 0x696C64616548746ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6F74536567616D69;
      break;
    case 2:
      uint64_t result = 0x72556E6F69746361;
      break;
    case 3:
      uint64_t result = 0x64657A796C616E61;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000DAC54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000DDBE4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000DAC7C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000DAC88(uint64_t a1)
{
  unint64_t v2 = sub_1000DB8AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DACC4(uint64_t a1)
{
  unint64_t v2 = sub_1000DB8AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000DAD00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_10001B38C((uint64_t *)&unk_1001370F0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001B38C(&qword_10013B3F8);
  uint64_t v28 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1[3];
  char v29 = a1;
  sub_100020A28(a1, v12);
  sub_1000DB8AC();
  uint64_t v13 = v30;
  sub_1000EAC00();
  if (v13) {
    return sub_100020AC0((uint64_t)v29);
  }
  uint64_t v26 = v3;
  unint64_t v30 = v5;
  uint64_t v14 = v28;
  char v32 = 0;
  sub_100022164();
  sub_1000EAA70();
  long long v15 = v31;
  sub_100022374(0, (unint64_t *)&unk_10013A600);
  sub_100022374(0, &qword_10013B408);
  uint64_t v16 = sub_1000EA630();
  uint64_t v18 = (void *)v16;
  if (!v16)
  {
    sub_1000DB900();
    swift_allocError();
    swift_willThrow();
    sub_1000221B8(v15, *((unint64_t *)&v15 + 1));
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    return sub_100020AC0((uint64_t)v29);
  }
  uint64_t v24 = v15;
  uint64_t v25 = v11;
  uint64_t *v11 = v16;
  char v32 = 1;
  sub_1000DB954();
  id v19 = v18;
  sub_1000EAA70();
  v25[1] = v31;
  LOBYTE(v31) = 2;
  sub_1000DBAB8((unint64_t *)&qword_100139E10, &qword_100137200);
  uint64_t v20 = (uint64_t)v30;
  uint64_t v26 = 0;
  sub_1000EAA70();
  sub_100020B80(v20, (uint64_t)v25 + *(int *)(v9 + 24));
  sub_10001B38C(&qword_10013B420);
  char v32 = 3;
  sub_1000DBB8C(&qword_10013B428, (void (*)(void))sub_1000DB9A8);
  sub_1000EAA70();
  uint64_t v21 = v24;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
  sub_1000221B8(v21, *((unint64_t *)&v15 + 1));

  uint64_t v22 = (uint64_t)v25;
  *(_OWORD *)((char *)v25 + *(int *)(v9 + 28)) = v31;
  sub_1000DB9FC(v22, v27, type metadata accessor for Item.Headline);
  sub_100020AC0((uint64_t)v29);
  return sub_1000DD310(v22, type metadata accessor for Item.Headline);
}

uint64_t sub_1000DB290(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10001B38C((uint64_t *)&unk_10013B438);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000DB8AC();
  sub_1000EAC20();
  uint64_t v9 = self;
  uint64_t v10 = *v3;
  id v24 = 0;
  id v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v24];
  id v12 = v24;
  if (v11)
  {
    uint64_t v13 = (void *)sub_1000E8B90();
    unint64_t v15 = v14;

    id v24 = v13;
    unint64_t v25 = v15;
    char v23 = 0;
    sub_1000222B8();
    sub_1000EAAE0();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return sub_1000221B8((uint64_t)v13, v15);
    }
    id v24 = (id)v3[1];
    char v23 = 1;
    sub_1000DBA64();
    swift_bridgeObjectRetain();
    sub_1000EAAE0();
    swift_bridgeObjectRelease();
    uint64_t v22 = type metadata accessor for Item.Headline(0);
    LOBYTE(v24) = 2;
    sub_10001B38C((uint64_t *)&unk_1001370F0);
    sub_1000DBAB8((unint64_t *)&qword_100137240, &qword_100139E70);
    sub_1000EAAE0();
    uint64_t v18 = (char *)v3 + *(int *)(v22 + 28);
    uint64_t v20 = (void *)*((void *)v18 + 1);
    id v24 = *(id *)v18;
    id v19 = v24;
    unint64_t v25 = (unint64_t)v20;
    char v23 = 3;
    sub_1000DBB4C(v24, v20);
    sub_10001B38C(&qword_10013B420);
    sub_1000DBB8C(&qword_10013B450, (void (*)(void))sub_1000DBBFC);
    sub_1000EAAE0();
    sub_1000221B8((uint64_t)v13, v15);
    sub_1000DB680(v19, v20);
  }
  else
  {
    uint64_t v17 = v12;
    sub_1000E8A40();

    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000DB650@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000DAD00(a1, a2);
}

uint64_t sub_1000DB668(void *a1)
{
  return sub_1000DB290(a1);
}

void sub_1000DB680(void *a1, void *a2)
{
  if (a2)
  {
  }
}

uint64_t type metadata accessor for Item(uint64_t a1)
{
  return sub_10004A6F4(a1, qword_10013B570);
}

uint64_t type metadata accessor for Item.Headline(uint64_t a1)
{
  return sub_10004A6F4(a1, qword_10013B4B8);
}

unint64_t sub_1000DB700()
{
  unint64_t result = qword_10013B3C0;
  if (!qword_10013B3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B3C0);
  }
  return result;
}

unint64_t sub_1000DB754()
{
  unint64_t result = qword_10013B3C8;
  if (!qword_10013B3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B3C8);
  }
  return result;
}

uint64_t sub_1000DB7A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000DB810()
{
  unint64_t result = qword_10013B3E0;
  if (!qword_10013B3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B3E0);
  }
  return result;
}

uint64_t sub_1000DB864(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000DB8AC()
{
  unint64_t result = qword_10013B400;
  if (!qword_10013B400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B400);
  }
  return result;
}

unint64_t sub_1000DB900()
{
  unint64_t result = qword_10013B410;
  if (!qword_10013B410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B410);
  }
  return result;
}

unint64_t sub_1000DB954()
{
  unint64_t result = qword_10013B418;
  if (!qword_10013B418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B418);
  }
  return result;
}

unint64_t sub_1000DB9A8()
{
  unint64_t result = qword_10013B430;
  if (!qword_10013B430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B430);
  }
  return result;
}

uint64_t sub_1000DB9FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000DBA64()
{
  unint64_t result = qword_10013B448;
  if (!qword_10013B448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B448);
  }
  return result;
}

uint64_t sub_1000DBAB8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B3D0((uint64_t *)&unk_1001370F0);
    sub_1000DB864(a2, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1000DBB4C(id result, void *a2)
{
  if (a2)
  {
    id v2 = result;
    return a2;
  }
  return result;
}

uint64_t sub_1000DBB8C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001B3D0(&qword_10013B420);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000DBBFC()
{
  unint64_t result = qword_10013B458;
  if (!qword_10013B458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B458);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Item.Headline.Errors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000DBCECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Item.Headline.Errors()
{
  return &type metadata for Item.Headline.Errors;
}

unsigned char *storeEnumTagSinglePayload for Item.Headline.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000DBDF0);
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

ValueMetadata *type metadata accessor for Item.Headline.CodingKeys()
{
  return &type metadata for Item.Headline.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for Item.CodingType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1000DBEF4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Item.CodingType()
{
  return &type metadata for Item.CodingType;
}

unsigned char *storeEnumTagSinglePayload for Item.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000DBFF8);
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

ValueMetadata *type metadata accessor for Item.CodingKeys()
{
  return &type metadata for Item.CodingKeys;
}

uint64_t *sub_1000DC030(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 24);
    __dst = (char *)a1 + v8;
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = sub_1000E8B60();
    uint64_t v11 = *(void *)(v10 - 8);
    id v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v14 = *(int *)(a3 + 28);
    unint64_t v15 = (uint64_t *)((char *)v7 + v14);
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = (void *)*((void *)v16 + 1);
    if (v17)
    {
      uint64_t v18 = *(void **)v16;
      *unint64_t v15 = v18;
      v15[1] = v17;
      id v19 = v18;
      id v20 = v17;
    }
    else
    {
      *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
    }
  }
  return v7;
}

void sub_1000DC200(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1000E8B60();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  if (*(void *)(v7 + 8))
  {

    uint64_t v8 = *(void **)(v7 + 8);
  }
}

void *sub_1000DC300(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  __dst = (char *)a1 + v7;
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = sub_1000E8B60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  unint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = (void *)*((void *)v15 + 1);
  if (v16)
  {
    uint64_t v17 = *(void **)v15;
    *uint64_t v14 = v17;
    v14[1] = v16;
    id v18 = v17;
    id v19 = v16;
  }
  else
  {
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  }
  return a1;
}

void *sub_1000DC47C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000E8B60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)((char *)a1 + v15 + 8);
  uint64_t v19 = *((void *)v17 + 1);
  if (!v18)
  {
    if (v19)
    {
      uint64_t v26 = *(void **)v17;
      *uint64_t v16 = *(void *)v17;
      uint64_t v27 = (void *)*((void *)v17 + 1);
      v16[1] = v27;
      id v28 = v26;
      id v29 = v27;
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    sub_10005C2F0((uint64_t)v16);
    goto LABEL_13;
  }
  id v20 = (void *)*v16;
  uint64_t v21 = *(void **)v17;
  *uint64_t v16 = *(void *)v17;
  id v22 = v21;

  char v23 = (void *)*((void *)v17 + 1);
  id v24 = (void *)v16[1];
  v16[1] = v23;
  id v25 = v23;

  return a1;
}

void *sub_1000DC6A4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000E8B60();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *sub_1000DC7D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000E8B60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (uint64_t)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  if (!*(void *)((char *)a1 + v15 + 8))
  {
LABEL_11:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!*((void *)v17 + 1))
  {
    sub_10005C2F0(v16);
    goto LABEL_11;
  }
  uint64_t v18 = *(void **)v16;
  *(void *)uint64_t v16 = *(void *)v17;

  uint64_t v19 = *(void **)(v16 + 8);
  *(void *)(v16 + 8) = *((void *)v17 + 1);

  return a1;
}

uint64_t sub_1000DC9C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DC9D8);
}

uint64_t sub_1000DC9D8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000DCA8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DCAA0);
}

void *sub_1000DCAA0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10001B38C((uint64_t *)&unk_1001370F0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000DCB4C()
{
  sub_10001E230();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1000DCBF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = type metadata accessor for Item.Headline(0);
      uint64_t v10 = *(int *)(v9 + 24);
      uint64_t v24 = v9;
      __dst = (char *)a1 + v10;
      uint64_t v11 = (char *)a2 + v10;
      uint64_t v12 = sub_1000E8B60();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v14(v11, 1, v12))
      {
        uint64_t v15 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
      }
      uint64_t v16 = *(int *)(v24 + 28);
      uint64_t v17 = (uint64_t *)((char *)a1 + v16);
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = (void *)*((void *)v18 + 1);
      if (v19)
      {
        id v20 = *(void **)v18;
        *uint64_t v17 = v20;
        v17[1] = v19;
        id v21 = v20;
        id v22 = v19;
      }
      else
      {
        *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_1000DCE10(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = type metadata accessor for Item.Headline(0);
    uint64_t v3 = a1 + *(int *)(v2 + 24);
    uint64_t v4 = sub_1000E8B60();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    }
    uint64_t v6 = a1 + *(int *)(v2 + 28);
    if (*(void *)(v6 + 8))
    {

      uint64_t v7 = *(void **)(v6 + 8);
    }
  }
}

void *sub_1000DCF4C(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = type metadata accessor for Item.Headline(0);
    uint64_t v7 = *(int *)(v6 + 24);
    __dst = (char *)a1 + v7;
    uint64_t v22 = v6;
    uint64_t v8 = (char *)a2 + v7;
    uint64_t v9 = sub_1000E8B60();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(__dst, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
    }
    uint64_t v13 = *(int *)(v22 + 28);
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = (void *)*((void *)v15 + 1);
    if (v16)
    {
      uint64_t v17 = *(void **)v15;
      *uint64_t v14 = v17;
      v14[1] = v16;
      id v18 = v17;
      id v19 = v16;
    }
    else
    {
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000DD110(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1000DD310((uint64_t)a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v4 = type metadata accessor for Item.Headline(0);
      uint64_t v5 = *(int *)(v4 + 24);
      __dst = (char *)a1 + v5;
      uint64_t v20 = v4;
      uint64_t v6 = (char *)a2 + v5;
      uint64_t v7 = sub_1000E8B60();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      if (v9(v6, 1, v7))
      {
        uint64_t v10 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(__dst, v6, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(__dst, v6, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
      }
      uint64_t v11 = *(int *)(v20 + 28);
      uint64_t v12 = (void *)((char *)a1 + v11);
      uint64_t v13 = (char *)a2 + v11;
      if (*((void *)v13 + 1))
      {
        uint64_t v14 = *(void **)v13;
        *uint64_t v12 = *(void *)v13;
        uint64_t v15 = (void *)*((void *)v13 + 1);
        v12[1] = v15;
        id v16 = v14;
        id v17 = v15;
      }
      else
      {
        *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000DD310(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1000DD370(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = type metadata accessor for Item.Headline(0);
    uint64_t v8 = *(int *)(v7 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000E8B60();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_10001B38C((uint64_t *)&unk_1001370F0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1000DD4F0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000DD310((uint64_t)a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = type metadata accessor for Item.Headline(0);
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_1000E8B60();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = sub_10001B38C((uint64_t *)&unk_1001370F0);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 28));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1000DD694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000DD6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000DD6E8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000DD6F8()
{
  uint64_t result = type metadata accessor for Item.Headline(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_1000DD78C()
{
  unint64_t result = qword_10013B5A8;
  if (!qword_10013B5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5A8);
  }
  return result;
}

unint64_t sub_1000DD7E4()
{
  unint64_t result = qword_10013B5B0;
  if (!qword_10013B5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5B0);
  }
  return result;
}

unint64_t sub_1000DD83C()
{
  unint64_t result = qword_10013B5B8;
  if (!qword_10013B5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5B8);
  }
  return result;
}

unint64_t sub_1000DD894()
{
  unint64_t result = qword_10013B5C0;
  if (!qword_10013B5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5C0);
  }
  return result;
}

unint64_t sub_1000DD8EC()
{
  unint64_t result = qword_10013B5C8;
  if (!qword_10013B5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5C8);
  }
  return result;
}

unint64_t sub_1000DD944()
{
  unint64_t result = qword_10013B5D0;
  if (!qword_10013B5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5D0);
  }
  return result;
}

unint64_t sub_1000DD99C()
{
  unint64_t result = qword_10013B5D8;
  if (!qword_10013B5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5D8);
  }
  return result;
}

unint64_t sub_1000DD9F4()
{
  unint64_t result = qword_10013B5E0;
  if (!qword_10013B5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5E0);
  }
  return result;
}

uint64_t sub_1000DDA48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656E696C64616568 && a2 == 0xE800000000000000 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1000EAB20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_1000DDB90()
{
  unint64_t result = qword_10013B5E8;
  if (!qword_10013B5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B5E8);
  }
  return result;
}

uint64_t sub_1000DDBE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696C64616548746ELL && a2 == 0xEE0061746144656ELL;
  if (v2 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F74536567616D69 && a2 == 0xEA00000000006572 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72556E6F69746361 && a2 == 0xE90000000000006CLL || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64657A796C616E61 && a2 == 0xEE0073726F6C6F43)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1000EAB20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000DDE00()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000DDE40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000DDE50()
{
  return swift_release();
}

uint64_t sub_1000DDE58(void *a1)
{
  uint64_t v2 = sub_10001B38C(&qword_10013B760);
  uint64_t v22 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  __chkstk_darwin(v2);
  id v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B38C(&qword_10013B768);
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  __chkstk_darwin(v4);
  uint64_t v24 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v28 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001B38C(&qword_10013B770);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000E10C8();
  sub_1000EAC20();
  sub_1000DF918(v27, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6) == 1)
  {
    char v30 = 1;
    sub_1000E111C();
    id v16 = v21;
    sub_1000EAA90();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v28, v11, v6);
    char v29 = 0;
    sub_1000E11D4();
    id v18 = v24;
    sub_1000EAA90();
    sub_1000E1228(&qword_100139E70, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v19 = v26;
    sub_1000EAAE0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v19);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

Swift::Int sub_1000DE2B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000E8B60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000EABB0();
  sub_1000DF918(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_1000EABC0(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_1000EABC0(0);
    sub_1000E1228((unint64_t *)&qword_100139090, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_1000EA1E0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_1000EABE0();
}

uint64_t sub_1000DE488@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v38 = sub_10001B38C(&qword_10013B728);
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v43 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10001B38C(&qword_10013B730);
  uint64_t v39 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v42 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B38C(&qword_10013B738);
  uint64_t v41 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ImageStore.Key();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - v12;
  sub_100020A28(a1, a1[3]);
  sub_1000E10C8();
  uint64_t v14 = v44;
  sub_1000EAC00();
  if (v14) {
    goto LABEL_7;
  }
  id v34 = v11;
  unint64_t v35 = v13;
  id v16 = v42;
  uint64_t v15 = v43;
  uint64_t v44 = a1;
  uint64_t v17 = sub_1000EAA80();
  uint64_t v18 = v5;
  uint64_t v19 = v7;
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v21 = sub_1000EA8A0();
    swift_allocError();
    uint64_t v23 = v22;
    sub_10001B38C(&qword_10013B748);
    *uint64_t v23 = v8;
    sub_1000EAA00();
    sub_1000EA890();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, enum case for DecodingError.typeMismatch(_:), v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v5);
    a1 = v44;
LABEL_7:
    uint64_t v25 = (uint64_t)a1;
    return sub_100020AC0(v25);
  }
  uint64_t v20 = (uint64_t)v44;
  if (*(unsigned char *)(v17 + 32))
  {
    char v46 = 1;
    sub_1000E111C();
    sub_1000EA9F0();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v38);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v5);
    uint64_t v27 = sub_1000E8B60();
    uint64_t v28 = (uint64_t)v35;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v35, 1, 1, v27);
  }
  else
  {
    char v45 = 0;
    sub_1000E11D4();
    uint64_t v24 = v16;
    sub_1000EA9F0();
    uint64_t v29 = sub_1000E8B60();
    sub_1000E1228(&qword_100137200, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v30 = (uint64_t)v34;
    uint64_t v31 = v37;
    sub_1000EAA70();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v18);
    char v32 = v44;
    uint64_t v28 = (uint64_t)v35;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v30, 0, 1, v29);
    sub_1000E1170(v30, v28);
    uint64_t v20 = (uint64_t)v32;
  }
  sub_1000E1170(v28, v40);
  uint64_t v25 = v20;
  return sub_100020AC0(v25);
}

uint64_t sub_1000DEA7C()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0x725565746F6D6572;
  }
}

uint64_t sub_1000DEAC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000DFCE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000DEAE8(uint64_t a1)
{
  unint64_t v2 = sub_1000E10C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DEB24(uint64_t a1)
{
  unint64_t v2 = sub_1000E10C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000DEB68()
{
  return 12383;
}

uint64_t sub_1000DEB74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1000EAB20();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1000DEBF4(uint64_t a1)
{
  unint64_t v2 = sub_1000E11D4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DEC30(uint64_t a1)
{
  unint64_t v2 = sub_1000E11D4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000DEC6C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1000DEC9C(uint64_t a1)
{
  unint64_t v2 = sub_1000E111C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DECD8(uint64_t a1)
{
  unint64_t v2 = sub_1000E111C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000DED14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000DE488(a1, a2);
}

uint64_t sub_1000DED2C(void *a1)
{
  return sub_1000DDE58(a1);
}

void sub_1000DED48()
{
  uint64_t v1 = sub_1000E8B60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  char v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000DF918(v0, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_1000EABC0(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_1000EABC0(0);
    sub_1000E1228((unint64_t *)&qword_100139090, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_1000EA1E0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

Swift::Int sub_1000DEF00()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000E8B60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000EABB0();
  sub_1000DF918(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_1000EABC0(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_1000EABC0(0);
    sub_1000E1228((unint64_t *)&qword_100139090, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_1000EA1E0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_1000EABE0();
}

uint64_t sub_1000DF0E0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B38C(&qword_10013B700);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000E0E20();
  sub_1000EAC20();
  v9[1] = a2;
  sub_10001B38C(&qword_10013B6E0);
  sub_1000E0F74();
  sub_1000EAAE0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000DF230()
{
  return 0x7942736567616D69;
}

uint64_t sub_1000DF250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7942736567616D69 && a2 == 0xEB0000000079654BLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1000EAB20();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1000DF300(uint64_t a1)
{
  unint64_t v2 = sub_1000E0E20();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DF33C(uint64_t a1)
{
  unint64_t v2 = sub_1000E0E20();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_1000DF378@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000DFDDC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1000DF3A4(void *a1)
{
  return sub_1000DF0E0(a1, *v1);
}

uint64_t sub_1000DF3C4(uint64_t a1)
{
  unint64_t v2 = sub_1000E0124();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000DF400(uint64_t a1)
{
  unint64_t v2 = sub_1000E0124();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000DF43C()
{
  return sub_1000EABE0();
}

uint64_t sub_1000DF490()
{
  return sub_1000EA330();
}

Swift::Int sub_1000DF4A8()
{
  return sub_1000EABE0();
}

uint64_t sub_1000DF4F8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1001247D8;
  v7._object = v3;
  Swift::Int v5 = sub_1000EA9E0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000DF54C(void *a1@<X8>)
{
  *a1 = 0x6567616D496975;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_1000DF568()
{
  return sub_1000EA440();
}

uint64_t sub_1000DF5C8()
{
  return sub_1000EA430();
}

void sub_1000DF618(void *a1, void *a2)
{
  uint64_t v5 = sub_1000E8C80();
  uint64_t v19 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001B38C(&qword_10013B618);
  uint64_t v20 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020A28(a1, a1[3]);
  sub_1000E0124();
  sub_1000EAC20();
  LOBYTE(v21) = 0;
  sub_1000E01CC();
  id v11 = a2;
  sub_1000EAAE0();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  }
  else
  {
    unint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    id v12 = v11;
    sub_1000E8C70();
    uint64_t v13 = sub_1000E8C60();
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    unint64_t v21 = v13;
    unint64_t v22 = v15;
    v25._countAndFlagsBits = 1735290926;
    v25._object = (void *)0xE400000000000000;
    sub_1000EA370(v25);

    unint64_t v16 = v21;
    unint64_t v17 = v22;
    unint64_t v21 = (unint64_t)v12;
    unint64_t v22 = v16;
    unint64_t v23 = v17;
    char v24 = 1;
    sub_100021960();
    sub_1000EAAE0();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  }
}

void *sub_1000DF8D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000DFF54(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_1000DF8FC(void *a1)
{
  sub_1000DF618(a1, *v1);
}

uint64_t sub_1000DF918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ImageStore.Key()
{
  uint64_t result = qword_10013B698;
  if (!qword_10013B698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000DF9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E8B60();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = type metadata accessor for ImageStore.Key();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001B38C((uint64_t *)&unk_1001379E0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  unint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t)&v17[*(int *)(v15 + 56)];
  sub_1000DF918(a1, (uint64_t)v17);
  sub_1000DF918(a2, v18);
  uint64_t v19 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v5[6];
  if (v19((uint64_t)v17, 1, v4) != 1)
  {
    sub_1000DF918((uint64_t)v17, (uint64_t)v13);
    if (v19(v18, 1, v4) != 1)
    {
      unint64_t v21 = (void (*)(char *, char *, uint64_t))v5[4];
      v21(v10, v13, v4);
      v21(v8, (char *)v18, v4);
      char v20 = sub_1000E8B10();
      unint64_t v22 = (void (*)(char *, uint64_t))v5[1];
      v22(v8, v4);
      v22(v10, v4);
      sub_100085560((uint64_t)v17);
      return v20 & 1;
    }
    ((void (*)(char *, uint64_t))v5[1])(v13, v4);
    goto LABEL_6;
  }
  if (v19(v18, 1, v4) != 1)
  {
LABEL_6:
    sub_1000DFC80((uint64_t)v17);
    char v20 = 0;
    return v20 & 1;
  }
  sub_100085560((uint64_t)v17);
  char v20 = 1;
  return v20 & 1;
}

uint64_t sub_1000DFC80(uint64_t a1)
{
  uint64_t v2 = sub_10001B38C((uint64_t *)&unk_1001379E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000DFCE0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x725565746F6D6572 && a2 == 0xE90000000000006CLL;
  if (v2 || (sub_1000EAB20() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001001014F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1000EAB20();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *sub_1000DFDDC(void *a1)
{
  uint64_t v3 = sub_10001B38C(&qword_10013B6D0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100020A28(a1, a1[3]);
  sub_1000E0E20();
  sub_1000EAC00();
  if (v1)
  {
    sub_100020AC0((uint64_t)a1);
  }
  else
  {
    sub_10001B38C(&qword_10013B6E0);
    sub_1000E0E74();
    sub_1000EAA70();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_100020AC0((uint64_t)a1);
  }
  return v7;
}

void *sub_1000DFF54(void *a1)
{
  uint64_t v3 = sub_10001B38C(&qword_10013B600);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100020A28(a1, a1[3]);
  sub_1000E0124();
  sub_1000EAC00();
  if (!v1)
  {
    LOBYTE(v10) = 0;
    sub_1000E0178();
    sub_1000EAA70();
    v9[7] = 1;
    sub_1000218B8();
    sub_1000EAA70();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v10;
    swift_bridgeObjectRelease();
  }
  sub_100020AC0((uint64_t)a1);
  return v7;
}

unint64_t sub_1000E0124()
{
  unint64_t result = qword_10013B608;
  if (!qword_10013B608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B608);
  }
  return result;
}

unint64_t sub_1000E0178()
{
  unint64_t result = qword_10013B610;
  if (!qword_10013B610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B610);
  }
  return result;
}

unint64_t sub_1000E01CC()
{
  unint64_t result = qword_10013B620;
  if (!qword_10013B620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B620);
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageStore.Image.CodingType()
{
  return &type metadata for ImageStore.Image.CodingType;
}

ValueMetadata *type metadata accessor for ImageStore.Image.CodingKeys()
{
  return &type metadata for ImageStore.Image.CodingKeys;
}

ValueMetadata *type metadata accessor for ImageStore()
{
  return &type metadata for ImageStore;
}

uint64_t *sub_1000E025C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_1000E8B60();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_1000E03A8(uint64_t a1)
{
  uint64_t v2 = sub_1000E8B60();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_1000E0478(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_1000E0588(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_1000E06FC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_1000E080C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_1000E0980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E0994);
}

uint64_t sub_1000E0994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E8B60();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000E0A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E0A14);
}

uint64_t sub_1000E0A14(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1000E8B60();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_1000E0A94(uint64_t a1)
{
  uint64_t v2 = sub_1000E8B60();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_1000E0AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E8B60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_1000E0B6C()
{
  uint64_t result = sub_1000E8B60();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ImageStore.Image(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageStore.Image(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageStore.Image()
{
  return &type metadata for ImageStore.Image;
}

uint64_t sub_1000E0C78()
{
  return sub_1000E1228(&qword_10013B6A8, (void (*)(uint64_t))type metadata accessor for ImageStore.Key);
}

unint64_t sub_1000E0CC4()
{
  unint64_t result = qword_10013B6B0;
  if (!qword_10013B6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6B0);
  }
  return result;
}

unint64_t sub_1000E0D1C()
{
  unint64_t result = qword_10013B6B8;
  if (!qword_10013B6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6B8);
  }
  return result;
}

unint64_t sub_1000E0D74()
{
  unint64_t result = qword_10013B6C0;
  if (!qword_10013B6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6C0);
  }
  return result;
}

unint64_t sub_1000E0DCC()
{
  unint64_t result = qword_10013B6C8;
  if (!qword_10013B6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6C8);
  }
  return result;
}

unint64_t sub_1000E0E20()
{
  unint64_t result = qword_10013B6D8;
  if (!qword_10013B6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6D8);
  }
  return result;
}

unint64_t sub_1000E0E74()
{
  unint64_t result = qword_10013B6E8;
  if (!qword_10013B6E8)
  {
    sub_10001B3D0(&qword_10013B6E0);
    sub_1000E1228(&qword_10013B6F0, (void (*)(uint64_t))type metadata accessor for ImageStore.Key);
    sub_1000E0F20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6E8);
  }
  return result;
}

unint64_t sub_1000E0F20()
{
  unint64_t result = qword_10013B6F8;
  if (!qword_10013B6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B6F8);
  }
  return result;
}

unint64_t sub_1000E0F74()
{
  unint64_t result = qword_10013B708;
  if (!qword_10013B708)
  {
    sub_10001B3D0(&qword_10013B6E0);
    sub_1000E1228(&qword_10013B710, (void (*)(uint64_t))type metadata accessor for ImageStore.Key);
    sub_1000E1020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B708);
  }
  return result;
}

unint64_t sub_1000E1020()
{
  unint64_t result = qword_10013B718;
  if (!qword_10013B718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B718);
  }
  return result;
}

unint64_t sub_1000E1074()
{
  unint64_t result = qword_10013B720;
  if (!qword_10013B720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B720);
  }
  return result;
}

unint64_t sub_1000E10C8()
{
  unint64_t result = qword_10013B740;
  if (!qword_10013B740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B740);
  }
  return result;
}

unint64_t sub_1000E111C()
{
  unint64_t result = qword_10013B750;
  if (!qword_10013B750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B750);
  }
  return result;
}

uint64_t sub_1000E1170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ImageStore.Key();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000E11D4()
{
  unint64_t result = qword_10013B758;
  if (!qword_10013B758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B758);
  }
  return result;
}

uint64_t sub_1000E1228(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *_s10NewsToday210ImageStoreV5ImageO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000E133CLL);
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

ValueMetadata *type metadata accessor for ImageStore.Key.CodingKeys()
{
  return &type metadata for ImageStore.Key.CodingKeys;
}

ValueMetadata *type metadata accessor for ImageStore.Key.RemoteUrlCodingKeys()
{
  return &type metadata for ImageStore.Key.RemoteUrlCodingKeys;
}

ValueMetadata *type metadata accessor for ImageStore.Key.ThumbnailPlaceholderCodingKeys()
{
  return &type metadata for ImageStore.Key.ThumbnailPlaceholderCodingKeys;
}

unsigned char *_s10NewsToday210ImageStoreV5ImageO10CodingTypeOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000E1430);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageStore.CodingKeys()
{
  return &type metadata for ImageStore.CodingKeys;
}

unint64_t sub_1000E146C()
{
  unint64_t result = qword_10013B778;
  if (!qword_10013B778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B778);
  }
  return result;
}

unint64_t sub_1000E14C4()
{
  unint64_t result = qword_10013B780;
  if (!qword_10013B780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B780);
  }
  return result;
}

unint64_t sub_1000E151C()
{
  unint64_t result = qword_10013B788;
  if (!qword_10013B788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B788);
  }
  return result;
}

unint64_t sub_1000E1574()
{
  unint64_t result = qword_10013B790;
  if (!qword_10013B790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B790);
  }
  return result;
}

unint64_t sub_1000E15CC()
{
  unint64_t result = qword_10013B798;
  if (!qword_10013B798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B798);
  }
  return result;
}

unint64_t sub_1000E1624()
{
  unint64_t result = qword_10013B7A0;
  if (!qword_10013B7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7A0);
  }
  return result;
}

unint64_t sub_1000E167C()
{
  unint64_t result = qword_10013B7A8;
  if (!qword_10013B7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7A8);
  }
  return result;
}

unint64_t sub_1000E16D4()
{
  unint64_t result = qword_10013B7B0;
  if (!qword_10013B7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7B0);
  }
  return result;
}

unint64_t sub_1000E172C()
{
  unint64_t result = qword_10013B7B8;
  if (!qword_10013B7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7B8);
  }
  return result;
}

unint64_t sub_1000E1784()
{
  unint64_t result = qword_10013B7C0;
  if (!qword_10013B7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7C0);
  }
  return result;
}

unint64_t sub_1000E17DC()
{
  unint64_t result = qword_10013B7C8;
  if (!qword_10013B7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7C8);
  }
  return result;
}

uint64_t NTPBTodaySectionConfigWebEmbed.conforms(to:)(__objc2_prot *a1)
{
  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  LODWORD(result) = [(__objc2_prot *)&v3 conformsToProtocol:a1];
  if (&OBJC_PROTOCOL___NTTodayItem == a1) {
    return 1;
  }
  else {
    return result;
  }
}

id TagIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntent();
  return [super init];
}

uint64_t type metadata accessor for TagIntent()
{
  return self;
}

id TagIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  [super initWithCoder:a1];

  return v3;
}

id TagIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id TagIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TagIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TagIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000EA280();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000EA280();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000EA280();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000EA280();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TagIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TagIntent.__deallocating_deinit()
{
  return sub_1000E2664(type metadata accessor for TagIntent);
}

unint64_t TodayIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1000E269C(a1);
}

Swift::Int sub_1000E1EFC()
{
  Swift::UInt v1 = *v0;
  sub_1000EABB0();
  sub_1000EABC0(v1);
  return sub_1000EABE0();
}

void sub_1000E1F44()
{
  sub_1000EABC0(*v0);
}

Swift::Int sub_1000E1F70()
{
  Swift::UInt v1 = *v0;
  sub_1000EABB0();
  sub_1000EABC0(v1);
  return sub_1000EABE0();
}

unint64_t sub_1000E1FB4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1000E269C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t TagIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TagIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TagIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *TagIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TagIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TagIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super init];
}

id Tag.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id TagIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id TodayIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id TagIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  id v3 = [super initWithBackingStore:a1];

  return v3;
}

id sub_1000E246C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TagIntentResponse();
  return [super a3];
}

id TodayIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id TagIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  id v3 = [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TagIntentResponse.__deallocating_deinit()
{
  return sub_1000E2664(type metadata accessor for TagIntentResponse);
}

id sub_1000E2664(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_1000E269C(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for TagIntentResponse()
{
  return self;
}

unint64_t sub_1000E26D4()
{
  unint64_t result = qword_10013B7D8;
  if (!qword_10013B7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B7D8);
  }
  return result;
}

uint64_t sub_1000E2728@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000E277C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TagIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TagIntentResponseCode()
{
  return &type metadata for TagIntentResponseCode;
}

id TodayIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntent();
  return [super init];
}

uint64_t type metadata accessor for TodayIntent()
{
  return self;
}

id TodayIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntent();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TodayIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id TodayIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_1000EA280();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000EA280();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for TodayIntent();
  id v10 = [v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id TodayIntent.__deallocating_deinit()
{
  return sub_1000E31CC(type metadata accessor for TodayIntent);
}

uint64_t TodayIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___TodayIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *TodayIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *TodayIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id TodayIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super init];
}

id TodayIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id TodayIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  id v3 = [super initWithBackingStore:a1];

  return v3;
}

id sub_1000E3058(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return [super a3];
}

id TodayIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_1000EA1B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  [super initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id TodayIntentResponse.__deallocating_deinit()
{
  return sub_1000E31CC(type metadata accessor for TodayIntentResponse);
}

id sub_1000E31CC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for TodayIntentResponse()
{
  return self;
}

unint64_t sub_1000E322C()
{
  unint64_t result = qword_10013B838;
  if (!qword_10013B838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10013B838);
  }
  return result;
}

uint64_t sub_1000E3280@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1000E32D4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___TodayIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TodayIntentResponseCode()
{
  return &type metadata for TodayIntentResponseCode;
}

id Tag.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000EA280();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id Tag.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_1000EA280();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_1000EA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Tag();
  [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for Tag()
{
  return self;
}

id Tag.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Tag();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id Tag.__deallocating_deinit()
{
  return sub_1000E3D84(type metadata accessor for Tag);
}

id static TagResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static TagResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000E380C();
    swift_bridgeObjectRetain();
    sub_1000EA970();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000EAB30();
    sub_1000E380C();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1000E380C();
  Class isa = sub_1000EA460().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_1000E380C()
{
  unint64_t result = qword_10013B8B8;
  if (!qword_10013B8B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10013B8B8);
  }
  return result;
}

id static TagResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static TagResolutionResult.success(with:)()
{
}

void static TagResolutionResult.disambiguation(with:)()
{
}

void static TagResolutionResult.confirmationRequired(with:)()
{
}

id TagResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_1000EA1B0().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id TagResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_1000EA1B0().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TagResolutionResult();
  id v5 = [super initWithJSONDictionary:isa forIntent:a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TagResolutionResult()
{
  return self;
}

id TagResolutionResult.__deallocating_deinit()
{
  return sub_1000E3D84(type metadata accessor for TagResolutionResult);
}

id sub_1000E3D84(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000E3DE0()
{
  return sub_1000E3F8C(1);
}

uint64_t sub_1000E3DE8(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_10014B898 == -1)
  {
    if (qword_10014B8A0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_10014B898, 0, (dispatch_function_t)sub_1000E3F84);
    if (qword_10014B8A0) {
      return _availability_version_check();
    }
  }
  if (qword_10014B890 == -1)
  {
    BOOL v8 = dword_10014B880 < a2;
    if (dword_10014B880 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_10014B890, 0, (dispatch_function_t)sub_1000E3DE0);
    BOOL v8 = dword_10014B880 < a2;
    if (dword_10014B880 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_10014B884 > a3) {
    return 1;
  }
  return dword_10014B884 >= a3 && dword_10014B888 >= a4;
}

uint64_t sub_1000E3F84()
{
  return sub_1000E3F8C(0);
}

uint64_t sub_1000E3F8C(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_10014B8A0;
  if (qword_10014B8A0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_10014B8A0 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          id v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            objc_super v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                NSString v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  NSString v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    id v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        objc_super v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          objc_super v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_10014B880, &dword_10014B884, &dword_10014B888);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
  return result;
}

void sub_1000E42C4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_1000E4388()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E444C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000E4510()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000E45D4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E4698()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);
}

void sub_1000E475C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000E4820()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_1000E48E4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000E49A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);
}

void sub_1000E4A6C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);
}

void sub_1000E4B30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"reporter", v6, 2u);
}

void sub_1000E4BF4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URL", v6, 2u);
}

void sub_1000E4CB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E4D7C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000E4E40()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E4F04()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);
}

void sub_1000E4FC8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"b", v6, 2u);
}

void sub_1000E508C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"a", v6, 2u);
}

void sub_1000E5150()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startDate", v6, 2u);
}

void sub_1000E5214()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"expected nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startState", v6, 2u);
}

void sub_1000E52D8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"start and end events must be balanced!"];
  int v1 = 136315906;
  int v2 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetLingerEventTracker.m";
  __int16 v5 = 1024;
  sub_10000D1E8();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000E53AC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startDate", v6, 2u);
}

void sub_1000E5470()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startState", v6, 2u);
}

void sub_1000E5534()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"start and end events must be balanced!"];
  int v1 = 136315906;
  int v2 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetLingerEventTracker.m";
  __int16 v5 = 1024;
  sub_10000D1E8();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000E5608()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);
}

void sub_1000E56CC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000E5790()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"endTodaySourceIdentifier", v6, 2u);
}

void sub_1000E5854()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userIDProvider", v6, 2u);
}

void sub_1000E5918()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionManager", v6, 2u);
}

void sub_1000E59DC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E5AA0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"changeDate", v6, 2u);
}

void sub_1000E5B64()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastVisibleItemsChangeDate", v6, 2u);
}

void sub_1000E5C28()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E5CEC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"engagement", v6, 2u);
}

void sub_1000E5DB0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000E5E74()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E5F38()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);
}

void sub_1000E5FFC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"section"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NTHeadlineEngagementEventTracker trackEngagementWithTodaySource:appConfigTreatmentID:section:otherVisibleSectio"
       "ns:headlineOrder:widgetDisplayMode:]";
  __int16 v3 = 2080;
  int v4 = "FTHeadlineEngagementEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E60DC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySource"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NTHeadlineEngagementEventTracker trackEngagementWithTodaySource:appConfigTreatmentID:section:otherVisibleSectio"
       "ns:headlineOrder:widgetDisplayMode:]";
  __int16 v3 = 2080;
  int v4 = "FTHeadlineEngagementEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E61BC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Case not implemented"];
  int v1 = 136315906;
  int v2 = "NSString *FTCampaignIdentifierForSourceIdentifier(NSString *__strong)";
  __int16 v3 = 2080;
  int v4 = "FTConstants.m";
  __int16 v5 = 1024;
  int v6 = 30;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_1000E629C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySource"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetAppearanceEventTracker trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetAppearanceEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E637C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"appearanceDate"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetAppearanceEventTracker trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetAppearanceEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E645C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);
}

void sub_1000E6520()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionsByHeadline", v6, 2u);
}

void sub_1000E65E4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlines", v6, 2u);
}

void sub_1000E66A8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"NewsArticleID", v6, 2u);
}

void sub_1000E676C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" unvalidatedValue];
  *(_DWORD *)buf = 136315906;
  int v2 = "NSString *FTValidatedFreeValuedPropertyValue(NSString *__strong)";
  __int16 v3 = 2080;
  int v4 = "FTEventTrackingConstants.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E684C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" name];
  *(_DWORD *)buf = 136315906;
  int v2 = "+[PETEventProperty(FTAdditions) ft_BOOLeanPropertyWithName:]";
  __int16 v3 = 2080;
  int v4 = "FTEventTrackingConstants.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E692C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "userIDProvider"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTNewsAnalyticsWidgetEventTracker initWithUserIDProvider:]";
  __int16 v3 = 2080;
  int v4 = "FTNewsAnalyticsWidgetEventTracker.m";
  __int16 v5 = 1024;
  int v6 = 41;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E6A18()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);
}

void sub_1000E6ADC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);
}

void sub_1000E6BA0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);
}

void sub_1000E6C64()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);
}

void sub_1000E6D28()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);
}

void sub_1000E6DEC()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);
}

void sub_1000E6EB0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"eventTrackers"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTAggregateWidgetEventTracker initWithEventTrackers:]";
  __int16 v3 = 2080;
  int v4 = "FTAggregateWidgetEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E6F90()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"trackableWidgetState"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTAggregateWidgetEventTracker widgetDidAppearAtDate:withTrackableWidgetState:]";
  __int16 v3 = 2080;
  int v4 = "FTAggregateWidgetEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7070(uint64_t a1, id *a2)
{
  __int16 v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [*a2 downloadError];
  sub_100014104();
  sub_10001411C((void *)&_mh_execute_header, v5, v6, "failed to download JSON for banner %{public}@ with error %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000E7118(uint64_t a1, id *a2)
{
  __int16 v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [*a2 downloadError];
  sub_100014104();
  sub_10001411C((void *)&_mh_execute_header, v5, v6, "failed to download JSON for headline %{public}@ with error %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000E71C0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"availabilityMonitor"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTEngagementURLProvider initWithAvailabilityMonitor:]";
  __int16 v3 = 2080;
  int v4 = "FTEngagementURLProvider.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E72A0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"engagementDescriptor"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTEngagementURLProvider URLForEngagement:event:trackableWidgetState:prefetchAssetsByRemoteURL:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "FTEngagementURLProvider.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7380()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s", "updateFetchDuration >= 0"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetUpdateEventTracker trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReacha"
       "ble:cellularRadioAccessTechnology:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetUpdateEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7460()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"todaySourceIdentifier"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTWidgetUpdateEventTracker trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReacha"
       "ble:cellularRadioAccessTechnology:]";
  __int16 v3 = 2080;
  int v4 = "FTWidgetUpdateEventTracker.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7540()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"predicate", v6, 2u);
}

void sub_1000E7604()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);
}

void sub_1000E76C8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E778C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000E7850()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E7914()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchInfo", v6, 2u);
}

void sub_1000E79D8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"otherQueryItems"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NSURL(FTReferralAdditions) ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryI"
       "tems:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FTReferralAdditions.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7AB8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"sourceIdentifier"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[NSURL(FTReferralAdditions) ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryI"
       "tems:sharedDirectoryFileURL:]";
  __int16 v3 = 2080;
  int v4 = "NSURL+FTReferralAdditions.m";
  __int16 v5 = 1024;
  sub_1000065C0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7B98()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);
}

void sub_1000E7C5C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"section", v6, 2u);
}

void sub_1000E7D20()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);
}

void sub_1000E7DE4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000E7EA8()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s" @"trackableWidgetState"];
  *(_DWORD *)buf = 136315906;
  int v2 = "-[FTProactiveWidgetEventTracker widgetDidAppearAtDate:withTrackableWidgetState:]";
  __int16 v3 = 2080;
  int v4 = "FTProactiveWidgetEventTracker.m";
  __int16 v5 = 1024;
  int v6 = 59;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

void sub_1000E7F94()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"documentsDirectoryFileURL", v6, 2u);
}

void sub_1000E8058()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayEventTracker", v6, 2u);
}

void sub_1000E811C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlinesAppearanceDate", v6, 2u);
}

void sub_1000E81E0()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);
}

void sub_1000E82A4()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

void sub_1000E8368()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid parameter not satisfying %s"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);
}

void sub_1000E842C()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'"];
  sub_100006600();
  sub_1000065F0();
  sub_1000065C0();
  sub_1000065D4((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);
}

uint64_t sub_1000E84F0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_1000E8500()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t sub_1000E8510()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_1000E8520()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000E8530()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_1000E8540()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_1000E8550()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_1000E8590()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000E85A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000E85B0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000E85C0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000E85D0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000E8600()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000E8610()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_1000E8620()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000E8630()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_1000E8640()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000E8650()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000E8660()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000E8670()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E8680()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E8690()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E86A0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000E86B0()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_1000E86C0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000E86D0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000E86E0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000E86F0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000E8700()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000E8710()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000E8720()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000E8730()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_1000E8740()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_1000E8750()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000E8760(Swift::String a1)
{
}

uint64_t sub_1000E8770()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E8780()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_1000E8790()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000E87A0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000E87B0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000E87C0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000E87D0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_1000E87E0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000E87F0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_1000E8800()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000E8810()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000E8820()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_1000E8830()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000E8840()
{
  return _UniqueEntityProvider.init(_:)();
}

uint64_t sub_1000E8850()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000E8860()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000E8870()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000E88A0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000E88B0()
{
  return _EntityURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000E88C0()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000E88D0(Swift::String a1)
{
}

uint64_t sub_1000E88E0()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E88F0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000E8900()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000E8910()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000E8930()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000E8940()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000E8950()
{
  return dispatch thunk of JSONDecoder.userInfo.modify();
}

uint64_t sub_1000E8960()
{
  return JSONDecoder.init()();
}

uint64_t sub_1000E8970()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1000E8980()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_1000E8990()
{
  return dispatch thunk of JSONEncoder.userInfo.modify();
}

uint64_t sub_1000E89A0()
{
  return JSONEncoder.init()();
}

uint64_t sub_1000E89B0()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_1000E89C0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000E89D0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000E89E0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1000E89F0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_1000E8A00()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000E8A10()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t sub_1000E8A20()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_1000E8A30()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000E8A40()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000E8A50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000E8A60()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000E8A70()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000E8A80()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000E8A90()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_1000E8AA0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_1000E8AB0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000E8AC0()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_1000E8AD0()
{
  return URL.lastPathComponent.getter();
}

void sub_1000E8AE0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000E8AF0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_1000E8B00()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000E8B10()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_1000E8B20()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E8B30()
{
  return URL.path.getter();
}

uint64_t sub_1000E8B40()
{
  return URL.init(string:)();
}

uint64_t sub_1000E8B50()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_1000E8B60()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000E8B70()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_1000E8B80()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000E8B90()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E8BA0()
{
  return Data.write(to:options:)();
}

uint64_t _s10NewsToday216TelemetryManagerC13lastFlushDate33_F9D4AB4E0910E2715C8CD19E0D9BCB95LL10Foundation0G0Vvpfi_0()
{
  return static Date.distantPast.getter();
}

uint64_t sub_1000E8BC0()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_1000E8BD0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000E8BE0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_1000E8BF0()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_1000E8C00()
{
  return static Date.- infix(_:_:)();
}

uint64_t sub_1000E8C10()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_1000E8C20()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_1000E8C30()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E8C40()
{
  return Date.init()();
}

uint64_t sub_1000E8C50()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000E8C60()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000E8C70()
{
  return UUID.init()();
}

uint64_t sub_1000E8C80()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000E8C90()
{
  return static Locale.current.getter();
}

uint64_t sub_1000E8CA0()
{
  return Locale.Language.init(identifier:)();
}

uint64_t sub_1000E8CB0()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_1000E8CC0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000E8CD0()
{
  return static Settings.WidgetBanner.shouldResetState.getter();
}

uint64_t sub_1000E8D00()
{
  return Configurable.setting<A>(_:)();
}

uint64_t sub_1000E8D10()
{
  return Configurable.setting<A>(_:_:)();
}

uint64_t sub_1000E8D20()
{
  return SettingProperty.wrappedValue.getter();
}

uint64_t sub_1000E8D30()
{
  return SettingProperty.wrappedValue.setter();
}

uint64_t sub_1000E8D40()
{
  return SettingProperty.init(_:)();
}

uint64_t sub_1000E8D50()
{
  return type metadata accessor for Access();
}

uint64_t sub_1000E8D60()
{
  return type metadata accessor for Domain();
}

uint64_t sub_1000E8D70()
{
  return Setting.init(_:defaultValue:domain:access:)();
}

uint64_t sub_1000E8D80()
{
  return Updatable.save<A>(setting:value:)();
}

uint64_t sub_1000E8D90()
{
  return Updatable.apply(preset:)();
}

uint64_t sub_1000E8DB0()
{
  return CGFloat.init(truncating:)();
}

uint64_t sub_1000E8DD0()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000E8DE0()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000E8DF0()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E8E00()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000E8E10()
{
  return Definition.inScope(_:)();
}

uint64_t sub_1000E8E20()
{
  return static UnfairLock.Options.dataSynchronization.getter();
}

uint64_t sub_1000E8E30()
{
  return type metadata accessor for UnfairLock.Options();
}

uint64_t sub_1000E8E40()
{
  return UnfairLock.init(options:)();
}

uint64_t sub_1000E8E50()
{
  return type metadata accessor for UnfairLock();
}

uint64_t sub_1000E8E60()
{
  return dispatch thunk of ContextType.use<A>(_:for:)();
}

uint64_t sub_1000E8E70()
{
  return static LazyOptions.keepOnMain.getter();
}

uint64_t sub_1000E8E80()
{
  return type metadata accessor for LazyOptions();
}

uint64_t sub_1000E8E90()
{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

uint64_t sub_1000E8EA0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:with:)();
}

uint64_t sub_1000E8EB0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_1000E8EC0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_1000E8ED0()
{
  return isNilOrEmpty(_:trim:)();
}

uint64_t sub_1000E8EE0()
{
  return type metadata accessor for CallbackScope();
}

uint64_t sub_1000E8EF0()
{
  return SingletonPool.init()();
}

uint64_t sub_1000E8F00()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_1000E8F10()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_1000E8F20()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_1000E8F30()
{
  return ProxyContainer.callback.getter();
}

uint64_t sub_1000E8F40()
{
  return SingleValueStore.storedValue.getter();
}

uint64_t sub_1000E8F50()
{
  return SingleValueStore.add(value:)();
}

void sub_1000E8F60()
{
}

uint64_t sub_1000E8F70()
{
  return SingleValueStore.init(directory:subdirectoryPath:filename:log:)();
}

uint64_t sub_1000E8F80()
{
  return + infix<A, B>(_:_:)();
}

uint64_t sub_1000E8F90()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t sub_1000E8FA0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_1000E8FB0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_1000E8FC0()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t sub_1000E8FD0()
{
  return dispatch thunk of CallbackRegistrationType.whenResolving<A>(_:scope:callback:)();
}

uint64_t sub_1000E8FE0()
{
  return dispatch thunk of Lazy.value.getter();
}

uint64_t sub_1000E8FF0()
{
  return Lazy.__allocating_init(options:loadBlock:)();
}

uint64_t sub_1000E9000()
{
  return type metadata accessor for Lazy();
}

uint64_t sub_1000E9010()
{
  return Lock.sync<A>(_:)();
}

uint64_t sub_1000E9020()
{
  return type metadata accessor for Scope();
}

uint64_t sub_1000E9030()
{
  return zalgo.getter();
}

uint64_t sub_1000E9040()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000E9050()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_1000E9060()
{
  return Promise.error(on:closure:)();
}

uint64_t sub_1000E9070()
{
  return Promise.init(value:)();
}

uint64_t sub_1000E9080()
{
  return Promise.always(on:closure:)();
}

uint64_t sub_1000E9090()
{
  return Promise.recover(on:closure:)();
}

uint64_t sub_1000E90A0()
{
  return Promise.init(resolver:)();
}

uint64_t sub_1000E90B0()
{
  return combine<A, B>(_:_:)();
}

uint64_t sub_1000E90C0()
{
  return firstly<A>(closure:)();
}

uint64_t sub_1000E90D0()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_1000E90E0()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t sub_1000E90F0()
{
  return Container.resolver.getter();
}

uint64_t sub_1000E9100()
{
  return type metadata accessor for Container();
}

uint64_t sub_1000E9110()
{
  return NewsAppConfigurationManager.init(appConfigurationManager:transform:)();
}

uint64_t sub_1000E9120()
{
  return type metadata accessor for NewsAppConfigurationManager();
}

uint64_t sub_1000E9130()
{
  return static FeatureState.recoveringState<A>(isEnabled:feature:configuration:)();
}

uint64_t sub_1000E9140()
{
  return Configuration.init(articleEmbeddingsScoringState:clientSideEngagementBoostEnabled:fallbackToReverseChronSorting:newsTabiPersonalizationState:personalizationTreatment:statelessPersonalizationState:extensionStatelessPersonalizationState:publisherDampeningConfig:shadowPublisherDampeningConfig:statelessPersonalizationPublisherFavorability:personalizationAnalyticsEnabled:tabiTagScoringEnabled:tabiCohortMembershipsEnabled:aggregatesInXavierEnabled:aggregatesInExtensionsXavierEnabled:tabiScoringInExtensionsEnabled:)();
}

uint64_t sub_1000E9150()
{
  return ScoringServiceType.score(items:configurationSet:)();
}

uint64_t sub_1000E9160()
{
  return XavierScoringService.limitItems(byFlowRate:timeInterval:publisherCount:)();
}

uint64_t sub_1000E9170()
{
  return XavierScoringService.limitItems(byMinimumItemQuality:)();
}

uint64_t sub_1000E9180()
{
  return XavierScoringService.prepareForUse(completionHandler:)();
}

uint64_t sub_1000E9190()
{
  return XavierScoringService.__allocating_init(aggregateStore:configurationManager:translationProvider:todayPrivateData:)();
}

unint64_t sub_1000E91A0(Swift::OpaquePointer_optional a1)
{
  return (unint64_t)XavierScoringService.rankTagIDsDescending(_:)(a1);
}

double sub_1000E91B0()
{
  return XavierScoringService.decayedPublisherDiversificationPenalty()();
}

unint64_t sub_1000E91C0(Swift::OpaquePointer_optional forTagIDs)
{
  return (unint64_t)XavierScoringService.scores(forTagIDs:)(forTagIDs);
}

uint64_t sub_1000E91D0()
{
  return type metadata accessor for XavierScoringService();
}

uint64_t sub_1000E91E0()
{
  return dispatch thunk of ConfigurationManagerType.onChangeOfConfiguration(perform:)();
}

uint64_t sub_1000E91F0()
{
  return dispatch thunk of ConfigurationManagerType.fetchConfigurationIfNeeded(cachedOnly:)();
}

uint64_t sub_1000E9200()
{
  return dispatch thunk of ConfigurationManagerType.configuration.getter();
}

uint64_t sub_1000E9210()
{
  return ConfigurationManagerType.fetchConfigurationIfNeeded()();
}

uint64_t sub_1000E9220()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000E9230()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000E9240()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000E9250()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000E9260()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000E9270()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000E9280()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_1000E9290()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1000E92A0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000E92C0()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
}

uint64_t sub_1000E92D0()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_1000E92E0()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_1000E92F0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000E9300()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000E9310()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1000E9320()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_1000E9330()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_1000E9340()
{
  return GeometryReader.init(content:)();
}

uint64_t sub_1000E9350()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_1000E9360()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_1000E9370()
{
  return PlaybackButton.init<A>(interval:state:intent:playSystemImage:pauseSystemImage:)();
}

uint64_t sub_1000E9380()
{
  return type metadata accessor for PlaybackButton.State();
}

uint64_t sub_1000E9390()
{
  return type metadata accessor for PlaybackButton();
}

uint64_t sub_1000E93A0()
{
  return ModifiedContent<>.accessibility(removeTraits:)();
}

uint64_t sub_1000E93B0()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_1000E93C0()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1000E93D0()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_1000E93E0()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_1000E93F0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000E9400()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000E9410()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000E9420()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000E9430()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_1000E9440()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000E9450()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000E9460()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000E9470()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000E9480()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000E9490()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_1000E94A0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000E94B0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000E94C0()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_1000E94D0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000E94E0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000E94F0()
{
  return EnvironmentValues._lineHeightMultiple.getter();
}

uint64_t sub_1000E9500()
{
  return EnvironmentValues._lineHeightMultiple.setter();
}

uint64_t sub_1000E9510()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000E9520()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000E9530()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000E9540()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000E9550()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_1000E9560()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_1000E9570()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_1000E9580()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000E9590()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000E95A0()
{
  return EnvironmentValues.widgetContentMargins.getter();
}

uint64_t sub_1000E95B0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000E95C0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000E95D0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000E95E0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000E95F0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000E9600()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_1000E9610()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_1000E9620()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000E9630()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:style:)();
}

void sub_1000E9640(Swift::String a1)
{
}

void sub_1000E9650(Swift::String a1)
{
}

uint64_t sub_1000E9660()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E9670()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_1000E9680()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000E9690()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000E96A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000E96B0()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t sub_1000E96C0()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_1000E96D0()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t sub_1000E96E0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000E96F0()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_1000E9700()
{
  return ContentSizeCategory.init(_:)();
}

uint64_t sub_1000E9710()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000E9720()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000E9730()
{
  return TitleOnlyLabelStyle.init()();
}

uint64_t sub_1000E9740()
{
  return type metadata accessor for TitleOnlyLabelStyle();
}

uint64_t sub_1000E9750()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000E9760()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000E9770()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_1000E9780()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000E9790()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000E97A0()
{
  return WidgetConfiguration.internalSupportedFamilies(_:)();
}

uint64_t sub_1000E97B0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000E97C0()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_1000E97D0()
{
  return WidgetConfiguration.enableContentMarginsForFirstParty(_:)();
}

uint64_t sub_1000E97E0()
{
  return static WidgetConfiguration._makeWidgetConfiguration(widget:inputs:)();
}

uint64_t sub_1000E97F0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000E9800()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_1000E9810()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_1000E9820()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_1000E9830()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_1000E9840()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1000E9850()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_1000E9860()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000E9870()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000E9880()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000E9890()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000E98A0()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_1000E98B0()
{
  return static Font.Weight.heavy.getter();
}

uint64_t sub_1000E98C0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000E98D0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_1000E98E0()
{
  return static Font.callout.getter();
}

uint64_t sub_1000E98F0()
{
  return static Font.caption.getter();
}

uint64_t sub_1000E9900()
{
  return Font.leading(_:)();
}

uint64_t sub_1000E9910()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000E9920()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_1000E9930()
{
  return Font.init(_:)();
}

uint64_t sub_1000E9940()
{
  return Link.init(destination:label:)();
}

uint64_t sub_1000E9950()
{
  return Link.init(sensitiveUrl:label:)();
}

uint64_t sub_1000E9960()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000E9970()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_1000E9980()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000E9990()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_1000E99A0()
{
  return Text.typesettingLanguage(_:isEnabled:)();
}

uint64_t sub_1000E99B0()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_1000E99C0()
{
  return Text.font(_:)();
}

uint64_t sub_1000E99D0()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t sub_1000E99E0()
{
  return Text.tracking(_:)();
}

uint64_t sub_1000E99F0()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration.Style();
}

uint64_t sub_1000E9A00()
{
  return Text.DateStyle.UnitsConfiguration.init(units:style:)();
}

uint64_t sub_1000E9A10()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration();
}

uint64_t sub_1000E9A20()
{
  return static Text.DateStyle.relative(unitConfiguration:)();
}

uint64_t sub_1000E9A30()
{
  return type metadata accessor for Text.DateStyle();
}

uint64_t sub_1000E9A40()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000E9A50()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000E9A60()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000E9A70()
{
  return View.widgetURL(_:)();
}

uint64_t sub_1000E9A80()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000E9A90()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000E9AA0()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_1000E9AB0()
{
  return View.unredacted()();
}

uint64_t sub_1000E9AC0()
{
  return View.accessibility(label:)();
}

uint64_t sub_1000E9AD0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000E9AE0()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_1000E9AF0()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_1000E9B00()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_1000E9B10()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000E9B20()
{
  return View.typesettingLanguage(_:isEnabled:)();
}

uint64_t sub_1000E9B30()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1000E9B40()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_1000E9B50()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_1000E9B60()
{
  return View.position(x:y:)();
}

uint64_t sub_1000E9B70()
{
  return View.redacted(reason:)();
}

uint64_t sub_1000E9B80()
{
  return View.clipShape<A>(_:style:)();
}

uint64_t sub_1000E9B90()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_1000E9BA0()
{
  return static Color.gray.getter();
}

uint64_t sub_1000E9BB0()
{
  return static Color.pink.getter();
}

uint64_t sub_1000E9BC0()
{
  return static Color.black.getter();
}

uint64_t sub_1000E9BD0()
{
  return static Color.clear.getter();
}

uint64_t sub_1000E9BE0()
{
  return static Color.green.getter();
}

uint64_t sub_1000E9BF0()
{
  return static Color.white.getter();
}

uint64_t sub_1000E9C00()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000E9C10()
{
  return static Color.primary.getter();
}

uint64_t sub_1000E9C20()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000E9C30()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000E9C40()
{
  return Color.init(_:)();
}

uint64_t sub_1000E9C50()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000E9C60()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000E9C70()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_1000E9C80()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1000E9C90()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_1000E9CA0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_1000E9CB0()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000E9CC0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000E9CD0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_1000E9CE0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000E9CF0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000E9D00()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000E9D10()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_1000E9D20()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_1000E9D30()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000E9D40()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000E9D50()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_1000E9D60()
{
  return Gradient.init(stops:)();
}

uint64_t sub_1000E9D70()
{
  return Gradient.init(colors:)();
}

uint64_t sub_1000E9D80()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1000E9D90()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_1000E9DA0()
{
  return static Alignment.top.getter();
}

uint64_t sub_1000E9DB0()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_1000E9DC0()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000E9DD0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_1000E9DE0()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_1000E9DF0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000E9E00()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000E9E10()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000E9E20()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_1000E9E30()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000E9E40()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000E9E50()
{
  return DispatchTime.rawValue.getter();
}

uint64_t sub_1000E9E60()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000E9E70()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_1000E9E80()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_1000E9E90()
{
  return + infix(_:_:)();
}

uint64_t sub_1000E9EA0()
{
  return FeedScoredItem.identifier.getter();
}

uint64_t sub_1000E9EB0()
{
  return FeedScoredItem.scoreProfile.getter();
}

uint64_t sub_1000E9EC0()
{
  return FeedScoredItem.item.getter();
}

uint64_t sub_1000E9ED0()
{
  return type metadata accessor for FeedScoredItem();
}

uint64_t sub_1000E9EE0()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_1000E9EF0()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_1000E9F00()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_1000E9F10()
{
  return static SHA256Digest.byteCount.getter();
}

uint64_t sub_1000E9F20()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_1000E9F30()
{
  return type metadata accessor for SHA256();
}

uint64_t sub_1000E9F40()
{
  return InternalWidgetFamily.init(rawValue:)();
}

uint64_t sub_1000E9F50()
{
  return InternalWidgetFamily.rawValue.getter();
}

uint64_t sub_1000E9F60()
{
  return type metadata accessor for InternalWidgetFamily();
}

uint64_t sub_1000E9F70()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_1000E9F80()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_1000E9F90()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1000E9FA0()
{
  return static WidgetAccentedRenderingMode.desaturated.getter();
}

uint64_t sub_1000E9FB0()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_1000E9FC0()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000E9FD0()
{
  return WidgetInfo.configuration.getter();
}

uint64_t sub_1000E9FE0()
{
  return WidgetInfo.internalFamily.getter();
}

uint64_t sub_1000E9FF0()
{
  return WidgetInfo.kind.getter();
}

uint64_t sub_1000EA000()
{
  return type metadata accessor for WidgetInfo();
}

uint64_t sub_1000EA010()
{
  return static WidgetCenter.Private_Timeouts.timeline.getter();
}

uint64_t sub_1000EA020()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_1000EA030()
{
  return dispatch thunk of WidgetCenter.getCurrentConfigurations(_:)();
}

uint64_t sub_1000EA040()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_1000EA050()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t sub_1000EA060()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000EA070()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_1000EA080()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000EA090()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_1000EA0A0()
{
  return type metadata accessor for IntentConfiguration();
}

uint64_t sub_1000EA0B0()
{
  return static TimelineReloadPolicy.after(_:jitteredUpTo:)();
}

uint64_t sub_1000EA0C0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_1000EA0D0()
{
  return dispatch thunk of IntentTimelineProvider.placeholder(in:)();
}

uint64_t sub_1000EA0E0()
{
  return dispatch thunk of IntentTimelineProvider.recommendations()();
}

uint64_t sub_1000EA100()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_1000EA120()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_1000EA130()
{
  return TimelineProviderContext.internalFamily.getter();
}

uint64_t sub_1000EA140()
{
  return type metadata accessor for TimelineProviderContext.EnvironmentVariants();
}

uint64_t sub_1000EA150()
{
  return TimelineProviderContext.EnvironmentVariants.subscript.getter();
}

uint64_t sub_1000EA160()
{
  return TimelineProviderContext.environmentVariants.getter();
}

uint64_t sub_1000EA170()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_1000EA180()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_1000EA190()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_1000EA1A0()
{
  return Array.init()();
}

NSDictionary sub_1000EA1B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000EA1C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000EA1D0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000EA1E0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000EA1F0()
{
  return Character.write<A>(to:)();
}

uint64_t sub_1000EA200()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000EA210()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_1000EA220()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_1000EA230()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_1000EA240()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_1000EA250()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t sub_1000EA260()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000EA270()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000EA280()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000EA290()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000EA2A0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000EA2B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000EA2C0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000EA2D0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000EA2E0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000EA2F0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000EA300()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000EA310()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_1000EA320()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_1000EA330()
{
  return String.hash(into:)();
}

uint64_t sub_1000EA340()
{
  return String.count.getter();
}

uint64_t sub_1000EA350()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_1000EA360()
{
  return String.index(_:offsetBy:)();
}

void sub_1000EA370(Swift::String a1)
{
}

Swift::Int sub_1000EA380()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000EA390()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_1000EA3A0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000EA3C0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000EA3D0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_1000EA3E0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_1000EA3F0()
{
  return String.subscript.getter();
}

uint64_t sub_1000EA400()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000EA410()
{
  return String.subscript.getter();
}

uint64_t sub_1000EA420()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000EA430()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1000EA440()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000EA450()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000EA460()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000EA470()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000EA480()
{
  return Array.description.getter();
}

uint64_t sub_1000EA490()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000EA4A0()
{
  return Array.mapToDictionary<A>(_:)();
}

uint64_t sub_1000EA4B0()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t sub_1000EA4C0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000EA4D0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

BOOL sub_1000EA4E0()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t sub_1000EA4F0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000EA500()
{
  return Array.append(_:)();
}

uint64_t sub_1000EA510()
{
  return Array.endIndex.getter();
}

void sub_1000EA520(Swift::Bool keepingCapacity)
{
}

uint64_t sub_1000EA530()
{
  return type metadata accessor for Array();
}

uint64_t sub_1000EA540()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_1000EA550()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000EA560()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000EA570()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000EA580()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000EA590()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000EA5B0()
{
  return Set.description.getter();
}

uint64_t sub_1000EA5C0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000EA5D0()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_1000EA5E0()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t sub_1000EA5F0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000EA600()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000EA610()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000EA620()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000EA630()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_1000EA640()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_1000EA650()
{
  return OS_dispatch_group.notify(queue:work:)();
}

uint64_t sub_1000EA660()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000EA670()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1000EA680()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000EA690()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_1000EA6A0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000EA6B0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000EA6C0()
{
  return static UIFont.preferredFont(for:weight:)();
}

uint64_t sub_1000EA6D0()
{
  return UIColor.legibleForeground.getter();
}

uint64_t sub_1000EA6E0()
{
  return static UIColor.darkLightLuminanceThreshold.getter();
}

uint64_t sub_1000EA6F0()
{
  return UIImage.croppedImage(of:with:scale:byRoundingCorners:cornerRadius:)();
}

Swift::Int sub_1000EA700(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000EA710()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000EA720()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000EA730()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000EA740()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_1000EA750()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000EA760()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000EA770()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_1000EA780()
{
  return StringProtocol.localizedCapitalized.getter();
}

uint64_t sub_1000EA790()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_1000EA7A0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000EA7B0()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_1000EA7C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000EA7D0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000EA7E0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

Swift::Int sub_1000EA7F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000EA800()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000EA810()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000EA820()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000EA830()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000EA840(Swift::Int a1)
{
}

uint64_t sub_1000EA850()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000EA860()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000EA870()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000EA880()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000EA890()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_1000EA8A0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_1000EA8B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000EA8C0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000EA8D0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000EA8E0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000EA8F0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000EA900()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000EA910()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000EA920()
{
  return CodingUserInfoKey.init(rawValue:)();
}

uint64_t sub_1000EA930()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t sub_1000EA940()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_1000EA950()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000EA960()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000EA970()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000EA980()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000EA990()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000EA9A0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000EA9B0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000EA9C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000EA9D0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_1000EA9E0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000EA9F0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000EAA00()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_1000EAA10()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_1000EAA20()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000EAA30()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000EAA40()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000EAA50()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000EAA60()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000EAA70()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000EAA80()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1000EAA90()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_1000EAAA0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000EAAB0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000EAAC0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000EAAD0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000EAAE0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_1000EAB00(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000EAB10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000EAB20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000EAB30()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000EAB40()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000EAB50()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000EAB60()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000EAB70()
{
  return Error._code.getter();
}

uint64_t sub_1000EAB80()
{
  return Error._domain.getter();
}

uint64_t sub_1000EAB90()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000EABB0()
{
  return Hasher.init(_seed:)();
}

void sub_1000EABC0(Swift::UInt a1)
{
}

void sub_1000EABD0(Swift::UInt64 a1)
{
}

Swift::Int sub_1000EABE0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000EABF0()
{
  return dispatch thunk of Decoder.userInfo.getter();
}

uint64_t sub_1000EAC00()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000EAC10()
{
  return dispatch thunk of Encoder.userInfo.getter();
}

uint64_t sub_1000EAC20()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t CCBigNumCompare()
{
  return _CCBigNumCompare();
}

uint64_t CCBigNumDiv()
{
  return _CCBigNumDiv();
}

uint64_t CCBigNumFree()
{
  return _CCBigNumFree();
}

uint64_t CCBigNumFromData()
{
  return _CCBigNumFromData();
}

uint64_t CCBigNumFromDecimalString()
{
  return _CCBigNumFromDecimalString();
}

uint64_t CCBigNumFromHexString()
{
  return _CCBigNumFromHexString();
}

uint64_t CCBigNumMulI()
{
  return _CCBigNumMulI();
}

uint64_t CCCreateBigNum()
{
  return _CCCreateBigNum();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return _CGBitmapContextCreateWithData(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo, releaseCallback, releaseInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return _CGBitmapContextGetBitmapInfo(context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return _CGBitmapContextGetBytesPerRow(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
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

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return _CGImageCreateCopyWithColorSpace(image, space);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  return _CTFontGetBoundingRectsForGlyphs(font, orientation, glyphs, boundingRects, count);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return _CTFontGetGlyphsForCharacters(font, characters, glyphs, count);
}

uint64_t FCBundle()
{
  return _FCBundle();
}

uint64_t FCCheckedProtocolCast()
{
  return _FCCheckedProtocolCast();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return _FCDispatchQueueForQualityOfService();
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

uint64_t FCHandleOperationTimeout()
{
  return _FCHandleOperationTimeout();
}

uint64_t FCPerformBlockOnMainThread()
{
  return _FCPerformBlockOnMainThread();
}

uint64_t FCProtocolCast()
{
  return _FCProtocolCast();
}

uint64_t FCSecondsToMilliseconds()
{
  return _FCSecondsToMilliseconds();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return _FCURLForContainerizedUserAccountCachesDirectory();
}

uint64_t FCURLForContainerizedUserAccountDocumentDirectory()
{
  return _FCURLForContainerizedUserAccountDocumentDirectory();
}

uint64_t FCURLForLegacyWidgetReferralItems()
{
  return _FCURLForLegacyWidgetReferralItems();
}

uint64_t FCURLForTodayPersonalizationUpdateStore()
{
  return _FCURLForTodayPersonalizationUpdateStore();
}

uint64_t FCURLForWidgetReferralItems()
{
  return _FCURLForWidgetReferralItems();
}

uint64_t FCUUIDStringToUUIDBytes()
{
  return _FCUUIDStringToUUIDBytes();
}

uint64_t NDDownloadServiceXPCConnection()
{
  return _NDDownloadServiceXPCConnection();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NSSNewsTagWidgetPlaceholderName()
{
  return _NSSNewsTagWidgetPlaceholderName();
}

uint64_t NTDeleteOnDiskAssets()
{
  return _NTDeleteOnDiskAssets();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

{
}

{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CTRByPersonalizationFeatureID(void *a1, const char *a2, ...)
{
  return _[a1 CTRByPersonalizationFeatureID];
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return _[a1 JSONArray];
}

id objc_msgSend_NewsURL(void *a1, const char *a2, ...)
{
  return _[a1 NewsURL];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__annotateEvent_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEvent:withTrackableWidgetState:");
}

id objc_msgSend__eventTrackersRespondingToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventTrackersRespondingToSelector:");
}

id objc_msgSend__newWidgetEngagementWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newWidgetEngagementWithTrackableWidgetState:");
}

id objc_msgSend__pbDisplayModeWithDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 _pbDisplayModeWithDisplayMode:];
}

id objc_msgSend__pbStackLocationWithStackLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbStackLocationWithStackLocation:");
}

id objc_msgSend__pbWidgetTypeWithStackKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbWidgetTypeWithStackKind:");
}

id objc_msgSend__registerOnceVisibleHeadlines_withLastSeenDate_minimumNumberOfTimesPreseenToBeSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:");
}

id objc_msgSend__shouldReportEventWithTodayResults_fetchInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTodayResults:fetchInfo:");
}

id objc_msgSend__shouldReportEventWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTrackableWidgetState:");
}

id objc_msgSend__trackWidgetLingerEventWithEndTodaySource_endAppConfigTreatmentID_endWidgetDisplayMode_endAppearanceType_endPropertiesChanged_lingerInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackWidgetLingerEventWithEndTodaySource:endAppConfigTreatmentID:endWidgetDisplayMode:endAppearanceType:endPropertiesChanged:lingerInterval:");
}

id objc_msgSend__widgetEngagementForHeadline_inSection_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_widgetEngagementForHeadline:inSection:withTrackableWidgetState:");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _[a1 abbreviation];
}

id objc_msgSend_absoluteItemCountForCurrentDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 absoluteItemCountForCurrentDisplayMode];
}

id objc_msgSend_absoluteOrderOfItem_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfItem:];
}

id objc_msgSend_absoluteOrderOfItemInSection_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfItemInSection:];
}

id objc_msgSend_absoluteOrderOfSection_(void *a1, const char *a2, ...)
{
  return [a1 absoluteOrderOfSection:];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accumulator(void *a1, const char *a2, ...)
{
  return _[a1 accumulator];
}

id objc_msgSend_activeDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 activeDisplayMode];
}

id objc_msgSend_addCountOfArticlesExposedEachSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCountOfArticlesExposedEachSection:");
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return [a1 addEvents:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addWidgetPersonalizationFeatureCTRPair_(void *a1, const char *a2, ...)
{
  return [a1 addWidgetPersonalizationFeatureCTRPair:];
}

id objc_msgSend_allItemsCount(void *a1, const char *a2, ...)
{
  return _[a1 allItemsCount];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_analyticsElement(void *a1, const char *a2, ...)
{
  return _[a1 analyticsElement];
}

id objc_msgSend_analyzeImage_(void *a1, const char *a2, ...)
{
  return [a1 analyzeImage:];
}

id objc_msgSend_annotateEvent_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 annotateEvent:withOptions:];
}

id objc_msgSend_annotateSession_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 annotateSession:withOptions:];
}

id objc_msgSend_appConfigTreatmentID(void *a1, const char *a2, ...)
{
  return _[a1 appConfigTreatmentID];
}

id objc_msgSend_appearanceType(void *a1, const char *a2, ...)
{
  return _[a1 appearanceType];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_articleID(void *a1, const char *a2, ...)
{
  return _[a1 articleID];
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return _[a1 articleRecordData];
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return _[a1 asChannel];
}

id objc_msgSend_assetHandleForCKAssetURL_lifetimeHint_(void *a1, const char *a2, ...)
{
  return [a1 assetHandleForCKAssetURL:lifetimeHint:];
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return _[a1 assetHandles];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return _[a1 assetManager];
}

id objc_msgSend_availabilityMonitor(void *a1, const char *a2, ...)
{
  return _[a1 availabilityMonitor];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backingElement(void *a1, const char *a2, ...)
{
  return _[a1 backingElement];
}

id objc_msgSend_banner(void *a1, const char *a2, ...)
{
  return _[a1 banner];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_baseNewsURL(void *a1, const char *a2, ...)
{
  return _[a1 baseNewsURL];
}

id objc_msgSend_cellularRadioAccessTechnology(void *a1, const char *a2, ...)
{
  return _[a1 cellularRadioAccessTechnology];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return _[a1 channelID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_color_isCloseToOtherColor_(void *a1, const char *a2, ...)
{
  return [a1 color:isCloseToOtherColor:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsInTimeZone_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 componentsInTimeZone:fromDate:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _[a1 contentID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return [a1 dateFromComponents:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_dominantColors(void *a1, const char *a2, ...)
{
  return _[a1 dominantColors];
}

id objc_msgSend_downloadError(void *a1, const char *a2, ...)
{
  return _[a1 downloadError];
}

id objc_msgSend_downloadIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 downloadIfNeededWithCompletion:];
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return [a1 enableFlushingWithFlushingThreshold:];
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return _[a1 encodableElement];
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return _[a1 encodableElementClass];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodeQueryValueWithError_(void *a1, const char *a2, ...)
{
  return [a1 encodeQueryValueWithError:];
}

id objc_msgSend_engagementWithBackgroundAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithBackgroundAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithBannerAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 engagementWithBannerAtDate:withTargetURL:trackableWidgetState:];
}

id objc_msgSend_engagementWithHeaderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithHeaderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithPlaceholderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithPlaceholderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithRowAtDate_forHeadline_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 engagementWithRowAtDate:forHeadline:withTrackableWidgetState:];
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return _[a1 entryID];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_eventAccumulators(void *a1, const char *a2, ...)
{
  return _[a1 eventAccumulators];
}

id objc_msgSend_eventAnnotator(void *a1, const char *a2, ...)
{
  return _[a1 eventAnnotator];
}

id objc_msgSend_eventTrackers(void *a1, const char *a2, ...)
{
  return _[a1 eventTrackers];
}

id objc_msgSend_eventTrackersProxy(void *a1, const char *a2, ...)
{
  return _[a1 eventTrackersProxy];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_extentsOfSections_(void *a1, const char *a2, ...)
{
  return [a1 extentsOfSections:];
}

id objc_msgSend_fc_NewsArticleID(void *a1, const char *a2, ...)
{
  return [a1 fc_NewsArticleID];
}

id objc_msgSend_fc_array_(void *a1, const char *a2, ...)
{
  return [a1 fc_array:];
}

id objc_msgSend_fc_arrayByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_arrayByTransformingWithBlock:];
}

id objc_msgSend_fc_arrayOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 fc_arrayOfObjectsPassingTest:];
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithKeyAndValueBlock_(void *a1, const char *a2, ...)
{
  return [a1 fc_dictionaryByTransformingValuesWithKeyAndValueBlock:];
}

id objc_msgSend_fc_isHardPaywallNewsArticleURL_(void *a1, const char *a2, ...)
{
  return [a1 fc_isHardPaywallNewsArticleURL];
}

id objc_msgSend_fc_isNewsArticleURL(void *a1, const char *a2, ...)
{
  return [a1 fc_isNewsArticleURL];
}

id objc_msgSend_fc_rotateElementsFromTheIndexOfSelectedItem_(void *a1, const char *a2, ...)
{
  return [a1 fc_rotateElementsFromTheIndexOfSelectedItem:];
}

id objc_msgSend_fc_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObject:forKey:];
}

id objc_msgSend_fc_safelySetObjectAllowingNil_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fc_safelySetObjectAllowingNil:forKey:];
}

id objc_msgSend_fc_stringWithISO8601Format(void *a1, const char *a2, ...)
{
  return [a1 fc_stringWithISO8601Format];
}

id objc_msgSend_fetchDate(void *a1, const char *a2, ...)
{
  return _[a1 fetchDate];
}

id objc_msgSend_fetchInfoForVisibleResults(void *a1, const char *a2, ...)
{
  return _[a1 fetchInfoForVisibleResults];
}

id objc_msgSend_fileCoordinatedFIFOHost(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedFIFOHost];
}

id objc_msgSend_fileCoordinatedStore(void *a1, const char *a2, ...)
{
  return _[a1 fileCoordinatedStore];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_flintDocumentURL(void *a1, const char *a2, ...)
{
  return _[a1 flintDocumentURL];
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return _[a1 flintDocumentURLAssetHandlesByRemoteURL];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithSymbolicTraits:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_ft_appearanceTypeProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_appearanceTypeProperty];
}

id objc_msgSend_ft_BOOLeanPropertyWithName_(void *a1, const char *a2, ...)
{
  return [a1 ft_BOOLeanPropertyWithName:];
}

id objc_msgSend_ft_eventWithDate_action_headline_section_headlineIndexInSection_precedingHeadlinesCount_precedingSectionsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:");
}

id objc_msgSend_ft_headlineSourceProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_headlineSourceProperty];
}

id objc_msgSend_ft_itemWithHeadlines_sectionsByHeadline_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_itemWithHeadlines:sectionsByHeadline:assetHandlesByRemoteURL:");
}

id objc_msgSend_ft_localTimeHourProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_localTimeHourProperty];
}

id objc_msgSend_ft_referralURLWithSourceIdentifier_appConfigTreatmentID_widgetEngagement_otherQueryItems_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryItems:sharedDirectoryFileURL:");
}

id objc_msgSend_ft_sectionProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_sectionProperty];
}

id objc_msgSend_ft_setTemporalBoundsBySanitizingStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 ft_setTemporalBoundsBySanitizingStartDate:endDate:];
}

id objc_msgSend_ft_timeZoneProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_timeZoneProperty];
}

id objc_msgSend_ft_userGroupProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_userGroupProperty];
}

id objc_msgSend_ft_widgetDisplayModeProperty(void *a1, const char *a2, ...)
{
  return [a1 ft_widgetDisplayModeProperty];
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:range:];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _[a1 headline];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageMethod(void *a1, const char *a2, ...)
{
  return _[a1 imageMethod];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndexesInRange:];
}

id objc_msgSend_initWithArticleID_sourceChannelID_sectionData_flintDocumentAssetHandle_articleRecordData_sourceChannelRecordData_parentIssueRecordData_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:];
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithArticleRecordData:sourceChannel:parentIssue:assetManager:];
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:options:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithContentType_contentTypeVersion_contentTypeMinorVersion_contentTypePatchVersion_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentType:contentTypeVersion:contentTypeMinorVersion:contentTypePatchVersion:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:context:];
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:sourceChannel:assetManager:];
}

id objc_msgSend_initWithEncodableElement_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithEncodableElement:assetHandlesByRemoteURL:];
}

id objc_msgSend_initWithEnvelopeDescriptor_sessionManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvelopeDescriptor:sessionManager:];
}

id objc_msgSend_initWithEventTrackers_(void *a1, const char *a2, ...)
{
  return [a1 initWithEventTrackers:];
}

id objc_msgSend_initWithFeatureId_event_registerProperties_(void *a1, const char *a2, ...)
{
  return [a1 initWithFeatureId:event:registerProperties:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithFileURL_allowedClasses_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:allowedClasses:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithJSONArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithJSONArray:];
}

id objc_msgSend_initWithJSONArray_flintDocumentURLAssetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithJSONArray:flintDocumentURLAssetHandlesByRemoteURL:];
}

id objc_msgSend_initWithMaxRowCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMaxRowCount:];
}

id objc_msgSend_initWithMaxRowCount_trackedEvents_(void *a1, const char *a2, ...)
{
  return [a1 initWithMaxRowCount:trackedEvents:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithName_directory_keyManager_avAssetFactory_resourceURLGenerator_networkBehaviorMonitor_networkReachability_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:];
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:value:];
}

id objc_msgSend_initWithReferralItem_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithReferralItem:sharedDirectoryFileURL:];
}

id objc_msgSend_initWithSessionManager_userIDProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionManager:userIDProvider:];
}

id objc_msgSend_initWithTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return [a1 initWithTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:];
}

id objc_msgSend_initWithURL_engagementReporter_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:engagementReporter:];
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_initWithWidgetEventTracker_predicate_(void *a1, const char *a2, ...)
{
  return [a1 initWithWidgetEventTracker:predicate:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isLingerInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isLingerInProgress];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isNewsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isNewsAvailable];
}

id objc_msgSend_itemExposuresSinceLastWidgetAppearance(void *a1, const char *a2, ...)
{
  return _[a1 itemExposuresSinceLastWidgetAppearance];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _[a1 itemType];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_lastVisibleItemsChangeArticleCount(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangeArticleCount];
}

id objc_msgSend_lastVisibleItemsChangeDate(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangeDate];
}

id objc_msgSend_lastVisibleItemsChangePairs(void *a1, const char *a2, ...)
{
  return _[a1 lastVisibleItemsChangePairs];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:withObject:");
}

id objc_msgSend_minimumArticleExposureDurationToBePreseen(void *a1, const char *a2, ...)
{
  return _[a1 minimumArticleExposureDurationToBePreseen];
}

id objc_msgSend_minimumNumberOfTimesPreseenToBeSeen(void *a1, const char *a2, ...)
{
  return _[a1 minimumNumberOfTimesPreseenToBeSeen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return _[a1 myEncodableElement];
}

id objc_msgSend_needsSeenStateTracking(void *a1, const char *a2, ...)
{
  return _[a1 needsSeenStateTracking];
}

id objc_msgSend_nf_object_isEqualToObject_(void *a1, const char *a2, ...)
{
  return [a1 nf_object:isEqualToObject:];
}

id objc_msgSend_nss_URLWithCampaignID_(void *a1, const char *a2, ...)
{
  return [a1 nss_URLWithCampaignID:];
}

id objc_msgSend_nss_eventWithIdentifier(void *a1, const char *a2, ...)
{
  return [a1 nss_eventWithIdentifier];
}

id objc_msgSend_nss_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 nss_setStartDate:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 objectsAtIndexes:];
}

id objc_msgSend_observeEvent_(void *a1, const char *a2, ...)
{
  return [a1 observeEvent:];
}

id objc_msgSend_observeEvents_(void *a1, const char *a2, ...)
{
  return [a1 observeEvents:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_openInNewsReferralItemQueryItemName(void *a1, const char *a2, ...)
{
  return _[a1 openInNewsReferralItemQueryItemName];
}

id objc_msgSend_openInNewsReferralItemWithTrackableWidgetState_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return [a1 openInNewsReferralItemWithTrackableWidgetState:assetHandlesByRemoteURL:];
}

id objc_msgSend_orderHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 orderHeadlineEngagementEventTracker];
}

id objc_msgSend_orderedSetWithOrderedSet_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithOrderedSet:];
}

id objc_msgSend_outstandingItemExposureEvents(void *a1, const char *a2, ...)
{
  return _[a1 outstandingItemExposureEvents];
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return _[a1 parentIssueRecordData];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_personalizationEventAtDate_withAction_headline_section_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 personalizationEventAtDate:withAction:headline:section:trackableWidgetState:];
}

id objc_msgSend_personalizationMetadata(void *a1, const char *a2, ...)
{
  return _[a1 personalizationMetadata];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preseenCountTrackingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 preseenCountTrackingIdentifier];
}

id objc_msgSend_propertyWithName_enumMapping_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:enumMapping:];
}

id objc_msgSend_propertyWithName_enumMapping_autoSanitizeValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:enumMapping:autoSanitizeValues:];
}

id objc_msgSend_propertyWithName_possibleValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:possibleValues:];
}

id objc_msgSend_propertyWithName_range_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:range:];
}

id objc_msgSend_propertyWithName_range_clampValues_(void *a1, const char *a2, ...)
{
  return [a1 propertyWithName:range:clampValues:];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_referralBarName(void *a1, const char *a2, ...)
{
  return _[a1 referralBarName];
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return _[a1 referralItem];
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return _[a1 remoteURL];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _[a1 reporter];
}

id objc_msgSend_saveWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveWithCompletionHandler:];
}

id objc_msgSend_sectionForItem_(void *a1, const char *a2, ...)
{
  return [a1 sectionForItem:];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_sessionAnnotator(void *a1, const char *a2, ...)
{
  return _[a1 sessionAnnotator];
}

id objc_msgSend_sessionHasEngagement(void *a1, const char *a2, ...)
{
  return _[a1 sessionHasEngagement];
}

id objc_msgSend_setAppConfigTreatmentId_(void *a1, const char *a2, ...)
{
  return [a1 setAppConfigTreatmentId:];
}

id objc_msgSend_setArticleId_(void *a1, const char *a2, ...)
{
  return [a1 setArticleId:];
}

id objc_msgSend_setBannerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBannerIdentifier:];
}

id objc_msgSend_setContentFetchDate_(void *a1, const char *a2, ...)
{
  return [a1 setContentFetchDate:];
}

id objc_msgSend_setContentId_(void *a1, const char *a2, ...)
{
  return [a1 setContentId:];
}

id objc_msgSend_setCtr_(void *a1, const char *a2, ...)
{
  return [a1 setCtr:];
}

id objc_msgSend_setCurrentSession_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSession:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEngagementTargetUrl_(void *a1, const char *a2, ...)
{
  return [a1 setEngagementTargetUrl:];
}

id objc_msgSend_setEntryId_(void *a1, const char *a2, ...)
{
  return [a1 setEntryId:];
}

id objc_msgSend_setEnvelopes_(void *a1, const char *a2, ...)
{
  return [a1 setEnvelopes:];
}

id objc_msgSend_setEventObject_(void *a1, const char *a2, ...)
{
  return [a1 setEventObject:];
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return [a1 setEvents:];
}

id objc_msgSend_setGestureType_(void *a1, const char *a2, ...)
{
  return [a1 setGestureType:];
}

id objc_msgSend_setItemExposuresSinceLastWidgetAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setItemExposuresSinceLastWidgetAppearance:];
}

id objc_msgSend_setLastVisibleItemsChangeArticleCount_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangeArticleCount:];
}

id objc_msgSend_setLastVisibleItemsChangeDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangeDate:];
}

id objc_msgSend_setLastVisibleItemsChangePairs_(void *a1, const char *a2, ...)
{
  return [a1 setLastVisibleItemsChangePairs:];
}

id objc_msgSend_setLingerInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setLingerInProgress:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOtherVisibleSections_(void *a1, const char *a2, ...)
{
  return [a1 setOtherVisibleSections:];
}

id objc_msgSend_setOutstandingItemExposureEvents_(void *a1, const char *a2, ...)
{
  return [a1 setOutstandingItemExposureEvents:];
}

id objc_msgSend_setPersonalizationFeatureId_(void *a1, const char *a2, ...)
{
  return [a1 setPersonalizationFeatureId:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRunningObsolete_(void *a1, const char *a2, ...)
{
  return [a1 setRunningObsolete:];
}

id objc_msgSend_setSessionHasEngagement_(void *a1, const char *a2, ...)
{
  return [a1 setSessionHasEngagement:];
}

id objc_msgSend_setSourceChannelId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceChannelId:];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setStartDate:];
}

id objc_msgSend_setStartState_(void *a1, const char *a2, ...)
{
  return [a1 setStartState:];
}

id objc_msgSend_setStoryType_(void *a1, const char *a2, ...)
{
  return [a1 setStoryType:];
}

id objc_msgSend_setSubmissionCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setSubmissionCompletion:];
}

id objc_msgSend_setTodayWidgetExposure_(void *a1, const char *a2, ...)
{
  return [a1 setTodayWidgetExposure];
}

id objc_msgSend_setTodayWidgetHeadlineExposure_(void *a1, const char *a2, ...)
{
  return [a1 setTodayWidgetHeadlineExposure];
}

id objc_msgSend_setUserID_(void *a1, const char *a2, ...)
{
  return [a1 setUserID:];
}

id objc_msgSend_setUserId_(void *a1, const char *a2, ...)
{
  return [a1 setUserId:];
}

id objc_msgSend_setUserSegmentationSegmentSetIds_count_(void *a1, const char *a2, ...)
{
  return [a1 setUserSegmentationSegmentSetIds:count:];
}

id objc_msgSend_setUserSegmentationTreatmentIds_count_(void *a1, const char *a2, ...)
{
  return [a1 setUserSegmentationTreatmentIds:count:];
}

id objc_msgSend_setVisibleHeadlines_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleHeadlines:];
}

id objc_msgSend_setVisibleHeadlinesAppearanceDate_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleHeadlinesAppearanceDate:];
}

id objc_msgSend_setWebEmbedId_(void *a1, const char *a2, ...)
{
  return [a1 setWebEmbedId:];
}

id objc_msgSend_setWidgetAppearanceDate_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetAppearanceDate:];
}

id objc_msgSend_setWidgetAppearanceType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetAppearanceType:];
}

id objc_msgSend_setWidgetArticleCount_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleCount:];
}

id objc_msgSend_setWidgetArticleCountInSection_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleCountInSection:];
}

id objc_msgSend_setWidgetArticleRank_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleRank:];
}

id objc_msgSend_setWidgetArticleRankInSection_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetArticleRankInSection:];
}

id objc_msgSend_setWidgetContentType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetContentType:];
}

id objc_msgSend_setWidgetDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetDisplayMode:];
}

id objc_msgSend_setWidgetDisplayModeSessionEnd_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetDisplayModeSessionEnd];
}

id objc_msgSend_setWidgetEngagement_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetEngagement];
}

id objc_msgSend_setWidgetEngagementType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetEngagementType:];
}

id objc_msgSend_setWidgetExposureStackLocation_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetExposureStackLocation];
}

id objc_msgSend_setWidgetHeadlineExposureCount_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetHeadlineExposureCount:];
}

id objc_msgSend_setWidgetSectionDisplayRank_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionDisplayRank:];
}

id objc_msgSend_setWidgetSectionId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionId:];
}

id objc_msgSend_setWidgetSectionIdsExposed_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionIdsExposed:];
}

id objc_msgSend_setWidgetSectionSubid_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionSubid:];
}

id objc_msgSend_setWidgetSectionSubidsExposed_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionSubidsExposed:];
}

id objc_msgSend_setWidgetSectionsArticleCountPairs_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSectionsArticleCountPairs:];
}

id objc_msgSend_setWidgetSessionId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetSessionId:];
}

id objc_msgSend_setWidgetType_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetType:];
}

id objc_msgSend_setWidgetUserId_(void *a1, const char *a2, ...)
{
  return [a1 setWidgetUserId:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _[a1 sharedDirectoryFileURL];
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkReachability];
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return [a1 slowCachedTagForID:];
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelID];
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return _[a1 sourceChannelRecordData];
}

id objc_msgSend_sourceTagID(void *a1, const char *a2, ...)
{
  return _[a1 sourceTagID];
}

id objc_msgSend_stackKind(void *a1, const char *a2, ...)
{
  return _[a1 stackKind];
}

id objc_msgSend_stackLocation(void *a1, const char *a2, ...)
{
  return _[a1 stackLocation];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startState(void *a1, const char *a2, ...)
{
  return _[a1 startState];
}

id objc_msgSend_storyType(void *a1, const char *a2, ...)
{
  return _[a1 storyType];
}

id objc_msgSend_stringIsValid_(void *a1, const char *a2, ...)
{
  return [a1 stringIsValid:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subidentifier(void *a1, const char *a2, ...)
{
  return _[a1 subidentifier];
}

id objc_msgSend_submissionGroup(void *a1, const char *a2, ...)
{
  return _[a1 submissionGroup];
}

id objc_msgSend_submitEventsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 submitEventsIfNeededWithCompletion:];
}

id objc_msgSend_submitUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 submitUpdate:withCompletion:];
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return _[a1 tagController];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeOfDayHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 timeOfDayHeadlineEngagementEventTracker];
}

id objc_msgSend_timeOfDayWidgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 timeOfDayWidgetAppearanceEventTracker];
}

id objc_msgSend_todayEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 todayEventTracker];
}

id objc_msgSend_todayResults(void *a1, const char *a2, ...)
{
  return _[a1 todayResults];
}

id objc_msgSend_todaySourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 todaySourceIdentifier];
}

id objc_msgSend_trackAppearanceAtDate_withHeadlineSource_appConfigTreatmentID_appearanceType_allItemsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:");
}

id objc_msgSend_trackDisappearance(void *a1, const char *a2, ...)
{
  return _[a1 trackDisappearance];
}

id objc_msgSend_trackEventWithPropertyValues_(void *a1, const char *a2, ...)
{
  return [a1 trackEventWithPropertyValues:];
}

id objc_msgSend_trackEventWithPropertyValues_value_(void *a1, const char *a2, ...)
{
  return [a1 trackEventWithPropertyValues:value:];
}

id objc_msgSend_trackUpdateWithTodaySource_appConfigTreatmentID_error_updateFetchDuration_wifiReachable_cellularRadioAccessTechnology_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReachable:cellularRadioAccessTechnology:");
}

id objc_msgSend_trackWidgetLingerEventExtremity_atDate_withTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:");
}

id objc_msgSend_trackedEvents(void *a1, const char *a2, ...)
{
  return _[a1 trackedEvents];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithPreferredContentSizeCategory:];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:fromData:error:];
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return _[a1 uniqueKey];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userEngagedWithWidgetAtDate_actionURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _[a1 userID];
}

id objc_msgSend_userIDProvider(void *a1, const char *a2, ...)
{
  return _[a1 userIDProvider];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userSegmentationSegmentSetIds(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationSegmentSetIds];
}

id objc_msgSend_userSegmentationSegmentSetIdsCount(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationSegmentSetIdsCount];
}

id objc_msgSend_userSegmentationTreatmentIds(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationTreatmentIds];
}

id objc_msgSend_userSegmentationTreatmentIdsCount(void *a1, const char *a2, ...)
{
  return _[a1 userSegmentationTreatmentIdsCount];
}

id objc_msgSend_visibleHeadlines(void *a1, const char *a2, ...)
{
  return _[a1 visibleHeadlines];
}

id objc_msgSend_visibleHeadlinesAppearanceDate(void *a1, const char *a2, ...)
{
  return _[a1 visibleHeadlinesAppearanceDate];
}

id objc_msgSend_visibleItems(void *a1, const char *a2, ...)
{
  return _[a1 visibleItems];
}

id objc_msgSend_visibleItemsDidChangeAtDate_withTriggerEvent_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:];
}

id objc_msgSend_visibleSections(void *a1, const char *a2, ...)
{
  return _[a1 visibleSections];
}

id objc_msgSend_widgetAppearanceDate(void *a1, const char *a2, ...)
{
  return _[a1 widgetAppearanceDate];
}

id objc_msgSend_widgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetAppearanceEventTracker];
}

id objc_msgSend_widgetConfig(void *a1, const char *a2, ...)
{
  return _[a1 widgetConfig];
}

id objc_msgSend_widgetDidAppearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 widgetDidAppearAtDate:withTrackableWidgetState:];
}

id objc_msgSend_widgetDidDisappearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return [a1 widgetDidDisappearAtDate:withTrackableWidgetState:];
}

id objc_msgSend_widgetDisappearanceEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetDisappearanceEventTracker];
}

id objc_msgSend_widgetDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 widgetDisplayMode];
}

id objc_msgSend_widgetEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetEventTracker];
}

id objc_msgSend_widgetLingerEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetLingerEventTracker];
}

id objc_msgSend_widgetPerformedUpdateWithTodayResults_fetchInfo_error_updateFetchDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:");
}

id objc_msgSend_widgetUpdateEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetUpdateEventTracker];
}

id objc_msgSend_widgetUpdateFailureEventTracker(void *a1, const char *a2, ...)
{
  return _[a1 widgetUpdateFailureEventTracker];
}

id objc_msgSend_wifiReachable(void *a1, const char *a2, ...)
{
  return _[a1 wifiReachable];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}

id objc_msgSend_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:");
}

id objc_msgSend_writeWithAccessor_completion_(void *a1, const char *a2, ...)
{
  return [a1 writeWithAccessor:completion:];
}