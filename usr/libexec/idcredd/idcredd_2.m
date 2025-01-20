uint64_t *sub_10016B040(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char *v34;
  char *__dst;
  uint64_t v36;
  void *v37;
  char *v38;

  v4 = a1;
  v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    v9 = a3[7];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (char *)a2 + v9;
    v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *v10 = *(uint64_t *)((char *)a2 + v9);
    v10[1] = v12;
    v36 = type metadata accessor for CredentialElement(0);
    v37 = v10;
    v13 = *(int *)(v36 + 20);
    v38 = v11;
    v34 = &v11[v13];
    __dst = (char *)v10 + v13;
    v14 = type metadata accessor for AnyCodable();
    v15 = *(void *)(v14 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v34, 1, v14))
    {
      v17 = sub_100006CC8(&qword_1001C12C8);
      memcpy(__dst, v34, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v34, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    v19 = *(int *)(v36 + 24);
    v20 = (char *)v37 + v19;
    v21 = &v38[v19];
    v22 = *((void *)v21 + 1);
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)v20 = *(_OWORD *)v21;
    }
    else
    {
      v23 = *(void *)v21;
      sub_10000354C(*(void *)v21, *((void *)v21 + 1));
      *(void *)v20 = v23;
      *((void *)v20 + 1) = v22;
    }
    v24 = a3[8];
    v25 = a3[9];
    v26 = (uint64_t *)((char *)v4 + v24);
    v27 = (uint64_t *)((char *)a2 + v24);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = (uint64_t *)((char *)v4 + v25);
    v30 = (uint64_t *)((char *)a2 + v25);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for CredentialElement(uint64_t a1)
{
  return sub_1000141A4(a1, (uint64_t *)&unk_1001C4B58);
}

uint64_t sub_10016B2B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for CredentialElement(0);
  uint64_t v6 = v4 + *(int *)(v5 + 20);
  uint64_t v7 = type metadata accessor for AnyCodable();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  v9 = (uint64_t *)(v4 + *(int *)(v5 + 24));
  unint64_t v10 = v9[1];
  if (v10 >> 60 != 15) {
    sub_1000035EC(*v9, v10);
  }
  swift_release();

  return swift_release();
}

void *sub_10016B3F0(void *a1, void *a2, int *a3)
{
  uint64_t v32 = a2[1];
  *a1 = *a2;
  a1[1] = v32;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
  *uint64_t v8 = *(void *)((char *)a2 + v7);
  v8[1] = v10;
  uint64_t v34 = type metadata accessor for CredentialElement(0);
  v35 = v8;
  uint64_t v11 = *(int *)(v34 + 20);
  __dst = (char *)v8 + v11;
  v36 = v9;
  v12 = &v9[v11];
  uint64_t v13 = type metadata accessor for AnyCodable();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = sub_100006CC8(&qword_1001C12C8);
    memcpy(__dst, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
  }
  uint64_t v17 = *(int *)(v34 + 24);
  v18 = (char *)v35 + v17;
  v19 = &v36[v17];
  unint64_t v20 = *((void *)v19 + 1);
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  else
  {
    uint64_t v21 = *(void *)v19;
    sub_10000354C(*(void *)v19, *((void *)v19 + 1));
    *(void *)v18 = v21;
    *((void *)v18 + 1) = v20;
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  v24 = (void *)((char *)a1 + v22);
  v25 = (void *)((char *)a2 + v22);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  v27 = (void *)((char *)a1 + v23);
  v28 = (void *)((char *)a2 + v23);
  uint64_t v29 = v28[1];
  void *v27 = *v28;
  v27[1] = v29;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_10016B5F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = a3;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = *(void *)((char *)a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = type metadata accessor for CredentialElement(0);
  uint64_t v9 = *(int *)(v36 + 20);
  uint64_t v10 = (char *)v7 + v9;
  uint64_t v11 = &v8[v9];
  uint64_t v12 = type metadata accessor for AnyCodable();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v35 = v10;
  LODWORD(v10) = v14(v10, 1, v12);
  int v15 = v14(v11, 1, v12);
  if (v10)
  {
    if (v15)
    {
      size_t v16 = *(void *)(*(void *)(sub_100006CC8(&qword_1001C12C8) - 8) + 64);
      uint64_t v17 = v35;
LABEL_6:
      memcpy(v17, v11, v16);
      goto LABEL_9;
    }
    (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v35, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v35, 0, 1, v12);
  }
  else
  {
    if (v15)
    {
      (*(void (**)(void *, uint64_t))(v13 + 8))(v35, v12);
      size_t v16 = *(void *)(*(void *)(sub_100006CC8(&qword_1001C12C8) - 8) + 64);
      uint64_t v17 = v35;
      goto LABEL_6;
    }
    (*(void (**)(void *, char *, uint64_t))(v13 + 24))(v35, v11, v12);
  }
LABEL_9:
  uint64_t v18 = *(int *)(v36 + 24);
  v19 = (void *)((char *)v7 + v18);
  unint64_t v20 = (uint64_t *)&v8[v18];
  unint64_t v21 = *(void *)&v8[v18 + 8];
  if (*(void *)((char *)v7 + v18 + 8) >> 60 != 15)
  {
    if (v21 >> 60 != 15)
    {
      uint64_t v23 = *v20;
      sub_10000354C(*v20, v21);
      uint64_t v24 = *v19;
      unint64_t v25 = v19[1];
      uint64_t *v19 = v23;
      v19[1] = v21;
      sub_1000035EC(v24, v25);
      goto LABEL_16;
    }
    sub_100014414((uint64_t)v19);
    goto LABEL_14;
  }
  if (v21 >> 60 == 15)
  {
LABEL_14:
    *(_OWORD *)v19 = *(_OWORD *)v20;
    goto LABEL_16;
  }
  uint64_t v22 = *v20;
  sub_10000354C(*v20, v21);
  uint64_t *v19 = v22;
  v19[1] = v21;
LABEL_16:
  uint64_t v26 = *(int *)(v37 + 32);
  v27 = (void *)((char *)a1 + v26);
  v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  void *v27 = *v28;
  v27[1] = v29;
  swift_retain();
  swift_release();
  uint64_t v30 = *(int *)(v37 + 36);
  v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  uint64_t v33 = v32[1];
  void *v31 = *v32;
  v31[1] = v33;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10016B91C(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for CredentialElement(0);
  uint64_t v11 = *(int *)(v10 + 20);
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = type metadata accessor for AnyCodable();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100006CC8(&qword_1001C12C8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
  uint64_t v17 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  return a1;
}

void *sub_10016BA90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v31 = a3;
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = *(void *)((char *)a2 + v9 + 8);
  *uint64_t v10 = *(void *)((char *)a2 + v9);
  v10[1] = v12;
  swift_bridgeObjectRelease();
  uint64_t v30 = type metadata accessor for CredentialElement(0);
  uint64_t v13 = *(int *)(v30 + 20);
  uint64_t v14 = (char *)v10 + v13;
  uint64_t v15 = &v11[v13];
  uint64_t v16 = type metadata accessor for AnyCodable();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  uint64_t v29 = v14;
  LODWORD(v14) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (v14)
  {
    if (v19)
    {
      size_t v20 = *(void *)(*(void *)(sub_100006CC8(&qword_1001C12C8) - 8) + 64);
      unint64_t v21 = v29;
LABEL_6:
      memcpy(v21, v15, v20);
      goto LABEL_9;
    }
    (*(void (**)(void *, char *, uint64_t))(v17 + 32))(v29, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v29, 0, 1, v16);
  }
  else
  {
    if (v19)
    {
      (*(void (**)(void *, uint64_t))(v17 + 8))(v29, v16);
      size_t v20 = *(void *)(*(void *)(sub_100006CC8(&qword_1001C12C8) - 8) + 64);
      unint64_t v21 = v29;
      goto LABEL_6;
    }
    (*(void (**)(void *, char *, uint64_t))(v17 + 40))(v29, v15, v16);
  }
LABEL_9:
  uint64_t v22 = *(int *)(v30 + 24);
  uint64_t v23 = (void *)((char *)v10 + v22);
  uint64_t v24 = (uint64_t *)&v11[v22];
  unint64_t v25 = *(void *)((char *)v10 + v22 + 8);
  if (v25 >> 60 != 15)
  {
    unint64_t v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      uint64_t v27 = *v23;
      *uint64_t v23 = *v24;
      v23[1] = v26;
      sub_1000035EC(v27, v25);
      goto LABEL_14;
    }
    sub_100014414((uint64_t)v23);
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
LABEL_14:
  *(_OWORD *)((char *)a1 + *(int *)(v31 + 32)) = *(_OWORD *)((char *)a2 + *(int *)(v31 + 32));
  swift_release();
  *(_OWORD *)((char *)a1 + *(int *)(v31 + 36)) = *(_OWORD *)((char *)a2 + *(int *)(v31 + 36));
  swift_release();
  return a1;
}

uint64_t sub_10016BD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016BD40);
}

uint64_t sub_10016BD40(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for CredentialElement(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10016BDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016BE04);
}

uint64_t sub_10016BE04(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for CredentialElement(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ElementFallback(uint64_t a1)
{
  return sub_1000141A4(a1, qword_1001C4A08);
}

uint64_t sub_10016BECC()
{
  uint64_t result = type metadata accessor for CredentialElement(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_10016BF78(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    unint64_t v9 = *((void *)a2 + 4);
    swift_bridgeObjectRetain();
    sub_10000354C(v8, v9);
    *((void *)a1 + 3) = v8;
    *((void *)a1 + 4) = v9;
    uint64_t v10 = *((void *)a2 + 5);
    unint64_t v11 = *((void *)a2 + 6);
    sub_10000354C(v10, v11);
    *((void *)a1 + 5) = v10;
    *((void *)a1 + 6) = v11;
    uint64_t v12 = a3[8];
    uint64_t v13 = &a1[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = type metadata accessor for Date();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v16(&a1[a3[9]], &a2[a3[9]], v15);
    uint64_t v17 = a3[10];
    uint64_t v18 = a3[11];
    int v19 = &a1[v17];
    size_t v20 = &a2[v17];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)int v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = &a1[v18];
    uint64_t v23 = &a2[v18];
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = a3[12];
    unint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    uint64_t v28 = *((void *)v27 + 1);
    *(void *)unint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10016C0FC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_1000035EC(*(void *)(a1 + 24), *(void *)(a1 + 32));
  sub_1000035EC(*(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + *(int *)(a2 + 36), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_10016C1E0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  unint64_t v8 = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  sub_10000354C(v7, v8);
  *((void *)a1 + 3) = v7;
  *((void *)a1 + 4) = v8;
  uint64_t v9 = *((void *)a2 + 5);
  unint64_t v10 = *((void *)a2 + 6);
  sub_10000354C(v9, v10);
  *((void *)a1 + 5) = v9;
  *((void *)a1 + 6) = v10;
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(&a1[a3[9]], &a2[a3[9]], v14);
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = &a1[v16];
  int v19 = &a2[v16];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = &a1[v17];
  uint64_t v22 = &a2[v17];
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  uint64_t v24 = a3[12];
  uint64_t v25 = &a1[v24];
  unint64_t v26 = &a2[v24];
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_10016C314(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v6 = *((void *)a2 + 3);
  unint64_t v7 = *((void *)a2 + 4);
  sub_10000354C(v6, v7);
  uint64_t v8 = *((void *)a1 + 3);
  unint64_t v9 = *((void *)a1 + 4);
  *((void *)a1 + 3) = v6;
  *((void *)a1 + 4) = v7;
  sub_1000035EC(v8, v9);
  uint64_t v10 = *((void *)a2 + 5);
  unint64_t v11 = *((void *)a2 + 6);
  sub_10000354C(v10, v11);
  uint64_t v12 = *((void *)a1 + 5);
  unint64_t v13 = *((void *)a1 + 6);
  *((void *)a1 + 5) = v10;
  *((void *)a1 + 6) = v11;
  sub_1000035EC(v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24);
  v18(v15, v16, v17);
  v18(&a1[a3[9]], &a2[a3[9]], v17);
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[11];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[12];
  unint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  *(void *)unint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10016C4A4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[9], a2 + a3[9], v9);
  uint64_t v11 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10016C590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 24);
  unint64_t v9 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v7;
  sub_1000035EC(v8, v9);
  uint64_t v10 = *(void *)(a1 + 40);
  unint64_t v11 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_1000035EC(v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(a1 + a3[9], a2 + a3[9], v15);
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[12];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  void *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10016C6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016C6DC);
}

uint64_t sub_10016C6DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for Date();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10016C78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016C7A0);
}

uint64_t sub_10016C7A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PayloadMetadata(uint64_t a1)
{
  return sub_1000141A4(a1, qword_1001C4AA8);
}

uint64_t sub_10016C868()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10016C928(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = type metadata accessor for AnyCodable();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_100006CC8(&qword_1001C12C8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    unint64_t v19 = *((void *)v18 + 1);
    if (v19 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    }
    else
    {
      uint64_t v20 = *(void *)v18;
      sub_10000354C(*(void *)v18, *((void *)v18 + 1));
      *(void *)uint64_t v17 = v20;
      *((void *)v17 + 1) = v19;
    }
  }
  return v4;
}

uint64_t sub_10016CAE8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for AnyCodable();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *v8;
    return sub_1000035EC(v10, v9);
  }
  return result;
}

void *sub_10016CBE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AnyCodable();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_100006CC8(&qword_1001C12C8);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  unint64_t v17 = *((void *)v16 + 1);
  if (v17 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  else
  {
    uint64_t v18 = *(void *)v16;
    sub_10000354C(*(void *)v16, *((void *)v16 + 1));
    *(void *)uint64_t v15 = v18;
    *((void *)v15 + 1) = v17;
  }
  return a1;
}

void *sub_10016CD50(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AnyCodable();
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
    uint64_t v14 = sub_100006CC8(&qword_1001C12C8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  unint64_t v17 = (void *)((char *)a2 + v15);
  unint64_t v18 = *(void *)((char *)a2 + v15 + 8);
  if (*(void *)((char *)a1 + v15 + 8) >> 60 != 15)
  {
    if (v18 >> 60 != 15)
    {
      uint64_t v20 = *v17;
      sub_10000354C(v20, v18);
      uint64_t v21 = *v16;
      unint64_t v22 = v16[1];
      *uint64_t v16 = v20;
      v16[1] = v18;
      sub_1000035EC(v21, v22);
      return a1;
    }
    sub_100014414((uint64_t)v16);
    goto LABEL_12;
  }
  if (v18 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    return a1;
  }
  uint64_t v19 = *v17;
  sub_10000354C(v19, v18);
  *uint64_t v16 = v19;
  v16[1] = v18;
  return a1;
}

_OWORD *sub_10016CF70(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AnyCodable();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100006CC8(&qword_1001C12C8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_10016D0A0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AnyCodable();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100006CC8(&qword_1001C12C8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  unint64_t v17 = (void *)((char *)a1 + v16);
  unint64_t v18 = (void *)((char *)a2 + v16);
  unint64_t v19 = *(void *)((char *)a1 + v16 + 8);
  if (v19 >> 60 != 15)
  {
    unint64_t v20 = v18[1];
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *v17;
      *unint64_t v17 = *v18;
      v17[1] = v20;
      sub_1000035EC(v21, v19);
      return a1;
    }
    sub_100014414((uint64_t)v17);
  }
  *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
  return a1;
}

uint64_t sub_10016D280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016D294);
}

uint64_t sub_10016D294(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100006CC8(&qword_1001C12C8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10016D348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10016D35C);
}

uint64_t sub_10016D35C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100006CC8(&qword_1001C12C8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10016D408()
{
  sub_10016D4A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10016D4A8()
{
  if (!qword_1001C4B68)
  {
    type metadata accessor for AnyCodable();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1001C4B68);
    }
  }
}

unint64_t sub_10016D500(uint64_t a1, void *a2)
{
  uint64_t v35 = type metadata accessor for DIPError.Code();
  uint64_t v5 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v36 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DIPSignpost.Config();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for DIPSignpost();
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IDCSSignposts.databaseFetchAuthACL.getter();
  uint64_t v37 = v10;
  DIPSignpost.init(_:)();
  type metadata accessor for StoredAuthACL();
  uint64_t v11 = (void *)static StoredAuthACL.fetchRequest()();
  [v11 setFetchLimit:1];
  sub_100044DE0();
  sub_100006CC8(&qword_1001C0878);
  uint64_t v12 = swift_allocObject();
  long long v34 = xmmword_1001768E0;
  *(_OWORD *)(v12 + 16) = xmmword_1001768E0;
  *(void *)(v12 + 56) = &type metadata for String;
  *(void *)(v12 + 64) = sub_10000DB88();
  *(void *)(v12 + 32) = a1;
  *(void *)(v12 + 40) = a2;
  swift_bridgeObjectRetain();
  int v13 = NSPredicate.init(format:_:)();
  [v11 setPredicate:v13];

  unint64_t result = NSManagedObjectContext.fetch<A>(_:)();
  if (v2)
  {

    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    _StringGuts.grow(_:)(30);
    v15._object = (void *)0x8000000100185270;
    v15._countAndFlagsBits = 0xD000000000000018;
    String.append(_:)(v15);
    v16._countAndFlagsBits = a1;
    v16._object = a2;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 8250;
    v17._object = (void *)0xE200000000000000;
    String.append(_:)(v17);
    uint64_t v42 = v2;
    sub_100006CC8(&qword_1001C0890);
    _print_unlocked<A, B>(_:_:)();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v36, enum case for DIPError.Code.coreDataError(_:), v35);
    sub_100006CC8((uint64_t *)&unk_1001C4950);
    unint64_t v18 = (int *)(sub_100006CC8(&qword_1001C0898) - 8);
    unint64_t v19 = (*(unsigned __int8 *)(*(void *)v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v18 + 80);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v34;
    unint64_t v21 = v20 + v19;
    unint64_t v22 = (uint64_t *)(v20 + v19 + v18[14]);
    uint64_t v23 = enum case for DIPError.PropertyKey.underlyingErrno(_:);
    uint64_t v24 = type metadata accessor for DIPError.PropertyKey();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v21, v23, v24);
    swift_getErrorValue();
    swift_errorRetain();
    uint64_t v25 = dispatch thunk of Error._code.getter();
    v22[3] = (uint64_t)&type metadata for Int;
    *unint64_t v22 = v25;
    sub_10004A5E8(v20);
    uint64_t v26 = type metadata accessor for DIPError();
    sub_10000507C();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    uint64_t v27 = v37;
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v39);
    return v26;
  }
  unint64_t v28 = result;
  uint64_t v30 = v37;
  uint64_t v29 = v38;
  uint64_t v31 = v39;
  if (!(result >> 62))
  {
    if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_10:
    swift_bridgeObjectRelease();

    uint64_t v26 = 0;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v33) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v28 & 0xC000000000000001) != 0)
  {
    id v32 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_8;
  }
  if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v32 = *(id *)(v28 + 32);
LABEL_8:
    uint64_t v26 = (uint64_t)v32;
    swift_bridgeObjectRelease();

LABEL_11:
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    return v26;
  }
  __break(1u);
  return result;
}

uint64_t sub_10016DAF8(char *a1, uint64_t a2)
{
  uint64_t v47 = a2;
  uint64_t v5 = type metadata accessor for DIPError.Code();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v46 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DIPSignpost.Config();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for DIPSignpost();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IDCSSignposts.databaseDeleteAuthACL.getter();
  DIPSignpost.init(_:)();
  unint64_t v12 = sub_10016E0B8();
  if (v3)
  {
    uint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    _StringGuts.grow(_:)(27);
    v13._object = (void *)0x8000000100185300;
    v13._countAndFlagsBits = 0xD000000000000019;
    String.append(_:)(v13);
    uint64_t v50 = v3;
    sub_100006CC8(&qword_1001C0890);
    _print_unlocked<A, B>(_:_:)();
    uint64_t v47 = v48;
    v43 = (char *)v49;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v46, enum case for DIPError.Code.coreDataError(_:), v5);
    sub_100006CC8((uint64_t *)&unk_1001C4950);
    int v14 = (int *)(sub_100006CC8(&qword_1001C0898) - 8);
    unint64_t v15 = (*(unsigned __int8 *)(*(void *)v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v14 + 80);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1001768E0;
    unint64_t v17 = v16 + v15;
    unint64_t v18 = (uint64_t *)(v17 + v14[14]);
    uint64_t v19 = enum case for DIPError.PropertyKey.underlyingErrno(_:);
    uint64_t v20 = type metadata accessor for DIPError.PropertyKey();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v17, v19, v20);
    swift_getErrorValue();
    swift_errorRetain();
    uint64_t v21 = dispatch thunk of Error._code.getter();
    v18[3] = (uint64_t)&type metadata for Int;
    uint64_t *v18 = v21;
    char v22 = sub_10004A5E8(v16);
    type metadata accessor for DIPError();
    sub_10000507C();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v45);
  }
  else
  {
    unint64_t v23 = v12;
    v46 = a1;
    uint64_t v42 = 0;
    v43 = v11;
    uint64_t v41 = v2;
    if (v12 >> 62) {
      goto LABEL_21;
    }
    uint64_t v24 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v24)
    {
      uint64_t v25 = 4;
      while (1)
      {
        id v26 = (v23 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : *(id *)(v23 + 8 * v25);
        uint64_t v27 = v26;
        uint64_t v28 = v25 - 3;
        if (__OFADD__(v25 - 4, 1)) {
          break;
        }
        id v29 = [v26 identifier];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v33 = v32;

          if ((char *)v31 == v46 && v33 == v47)
          {
            swift_bridgeObjectRelease();
LABEL_19:
            swift_bridgeObjectRelease();
            [*(id *)(v41 + 16) deleteObject:v27];

            char v22 = 1;
            goto LABEL_23;
          }
          char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v35) {
            goto LABEL_19;
          }
        }

        ++v25;
        if (v28 == v24) {
          goto LABEL_22;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
LABEL_22:
    swift_bridgeObjectRelease();
    char v22 = 0;
LABEL_23:
    uint64_t v37 = v44;
    uint64_t v36 = v45;
    uint64_t v38 = v43;
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
  }
  return v22 & 1;
}

uint64_t sub_10016E0B8()
{
  uint64_t v1 = type metadata accessor for DIPError.Code();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unint64_t v23 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DIPSignpost.Config();
  __chkstk_darwin(v4 - 8);
  uint64_t v24 = type metadata accessor for DIPSignpost();
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IDCSSignposts.databaseFetchAllAuthACLs.getter();
  DIPSignpost.init(_:)();
  type metadata accessor for StoredAuthACL();
  uint64_t v8 = (void *)static StoredAuthACL.fetchRequest()();
  uint64_t v9 = NSManagedObjectContext.fetch<A>(_:)();

  if (v0)
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    v10._countAndFlagsBits = 0xD00000000000001ELL;
    v10._object = (void *)0x8000000100185340;
    String.append(_:)(v10);
    uint64_t v27 = v0;
    sub_100006CC8(&qword_1001C0890);
    _print_unlocked<A, B>(_:_:)();
    v21[1] = v26;
    v21[2] = v25;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v23, enum case for DIPError.Code.coreDataError(_:), v1);
    sub_100006CC8((uint64_t *)&unk_1001C4950);
    uint64_t v11 = (int *)(sub_100006CC8(&qword_1001C0898) - 8);
    unint64_t v12 = (*(unsigned __int8 *)(*(void *)v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v11 + 80);
    uint64_t v13 = swift_allocObject();
    uint64_t v22 = v9;
    uint64_t v14 = v13;
    *(_OWORD *)(v13 + 16) = xmmword_1001768E0;
    unint64_t v15 = v13 + v12;
    uint64_t v16 = (uint64_t *)(v13 + v12 + v11[14]);
    uint64_t v17 = enum case for DIPError.PropertyKey.underlyingErrno(_:);
    uint64_t v18 = type metadata accessor for DIPError.PropertyKey();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v15, v17, v18);
    swift_getErrorValue();
    swift_errorRetain();
    uint64_t v19 = dispatch thunk of Error._code.getter();
    v16[3] = (uint64_t)&type metadata for Int;
    *uint64_t v16 = v19;
    sub_10004A5E8(v14);
    type metadata accessor for DIPError();
    sub_10000507C();
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
    return v22;
  }
  else
  {
    DIPSignpost.end(workflowID:isBackground:)((Swift::String_optional)0, (Swift::Bool_optional)2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
  }
  return v9;
}

ValueMetadata *type metadata accessor for KeySigningKeySignatureProvider()
{
  return &type metadata for KeySigningKeySignatureProvider;
}

uint64_t sub_10016E568()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*v0 + OBJC_IVAR____TtC7idcredd13CredentialKey_lock) + 16);
  os_unfair_lock_lock(v1);
  sub_1000698E4(v2);
  os_unfair_lock_unlock(v1);
  return v4;
}

uint64_t sub_10016E5E4(uint64_t a1, uint64_t a2)
{
  return sub_10006A400(a1, a2);
}

uint64_t sub_10016E608(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v66 = a3;
  uint64_t v67 = a4;
  uint64_t v65 = a2;
  v75 = a1;
  uint64_t v64 = type metadata accessor for PayloadMetadata(0);
  __chkstk_darwin(v64);
  v68 = (uint64_t *)((char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for Logger();
  int64_t v70 = *(void *)(v5 - 8);
  uint64_t v71 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v69 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v63 = (char *)&v61 - v8;
  uint64_t v74 = type metadata accessor for IDCSAnalytics.NamespaceElement();
  uint64_t v62 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  Swift::String v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ISO18013KnownDocTypes();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v73 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v61 - v15;
  sub_100006CC8(&qword_1001C12D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001767E0;
  v72 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  v72(v16, enum case for ISO18013KnownDocTypes.iso18013_5_1_mDL(_:), v11);
  uint64_t v18 = ISO18013KnownDocTypes.rawValue.getter();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  v21(v16, v11);
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = v20;
  uint64_t v22 = v73;
  v72(v73, enum case for ISO18013KnownDocTypes.japanNationalIDCard(_:), v11);
  unint64_t v23 = v22;
  uint64_t v24 = ISO18013KnownDocTypes.rawValue.getter();
  uint64_t v26 = v25;
  v21(v23, v11);
  *(void *)(inited + 48) = v24;
  *(void *)(inited + 56) = v26;
  uint64_t v27 = sub_100096844(inited);
  swift_setDeallocating();
  uint64_t v28 = v75;
  swift_arrayDestroy();
  uint64_t v29 = *v28;
  uint64_t v30 = v28[1];
  swift_bridgeObjectRetain();
  LOBYTE(v26) = sub_100007A0C(v29, v30, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    v51 = v69;
    defaultLogger()();
    v52 = v68;
    sub_100063940((uint64_t)v28, (uint64_t)v68);
    v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)v55 = 136315138;
      uint64_t v56 = *v52;
      unint64_t v57 = v52[1];
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_10004C3A4(v56, v57, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100063C98((uint64_t)v52);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Not checking for missing elements because document type %s is not supported for analytics", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100063C98((uint64_t)v52);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v51, v71);
  }
  uint64_t v31 = v62;
  uint64_t v32 = v63;
  uint64_t v33 = v65;
  if (!*(uint64_t *)((char *)v28 + *(int *)(v64 + 40) + 8))
  {
    defaultLogger()();
    v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Not processing missing elements due to missing issuer data", v60, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v32, v71);
  }
  unint64_t v34 = sub_10016EDC0(v29, v30, v66, v67);
  uint64_t v35 = sub_10016FFE4(v34, v33);
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v37 = 0;
  uint64_t v38 = *(void *)(v35 + 64);
  v68 = (uint64_t *)v35;
  v69 = (char *)(v35 + 64);
  uint64_t v39 = 1 << *(unsigned char *)(v35 + 32);
  uint64_t v40 = -1;
  if (v39 < 64) {
    uint64_t v40 = ~(-1 << v39);
  }
  unint64_t v41 = v40 & v38;
  int64_t v70 = (unint64_t)(v39 + 63) >> 6;
  uint64_t v42 = (void (**)(char *, uint64_t))(v31 + 8);
  while (v41)
  {
    unint64_t v43 = __clz(__rbit64(v41));
    v41 &= v41 - 1;
    unint64_t v44 = v43 | (v37 << 6);
LABEL_22:
    uint64_t v48 = *(void *)(*(void *)(v35 + 56) + 8 * v44);
    uint64_t v49 = *(void *)(v48 + 16);
    if (v49)
    {
      v72 = (void (*)(char *, void, uint64_t))v41;
      v73 = (char *)v37;
      v75 = *(uint64_t **)(*(void *)(v35 + 48) + 16 * v44);
      type metadata accessor for IDCSAnalytics();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v71 = v48;
      uint64_t v50 = v48 + 40;
      do
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        IDCSAnalytics.NamespaceElement.init(namespace:element:)();
        static IDCSAnalytics.sendPayloadMissingRequiredElementEvent(element:issuer:)();
        (*v42)(v10, v74);
        v50 += 16;
        --v49;
      }
      while (v49);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v68;
      unint64_t v41 = (unint64_t)v72;
      int64_t v37 = (int64_t)v73;
    }
  }
  int64_t v45 = v37 + 1;
  if (__OFADD__(v37, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v45 >= v70) {
    return swift_release();
  }
  unint64_t v46 = *(void *)&v69[8 * v45];
  ++v37;
  if (v46) {
    goto LABEL_21;
  }
  int64_t v37 = v45 + 1;
  if (v45 + 1 >= v70) {
    return swift_release();
  }
  unint64_t v46 = *(void *)&v69[8 * v37];
  if (v46) {
    goto LABEL_21;
  }
  int64_t v37 = v45 + 2;
  if (v45 + 2 >= v70) {
    return swift_release();
  }
  unint64_t v46 = *(void *)&v69[8 * v37];
  if (v46)
  {
LABEL_21:
    unint64_t v41 = (v46 - 1) & v46;
    unint64_t v44 = __clz(__rbit64(v46)) + (v37 << 6);
    goto LABEL_22;
  }
  int64_t v47 = v45 + 3;
  if (v47 >= v70) {
    return swift_release();
  }
  unint64_t v46 = *(void *)&v69[8 * v47];
  if (v46)
  {
    int64_t v37 = v47;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v37 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v37 >= v70) {
      return swift_release();
    }
    unint64_t v46 = *(void *)&v69[8 * v37];
    ++v47;
    if (v46) {
      goto LABEL_21;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_10016EDC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v26[1] = a4;
  v26[2] = a3;
  uint64_t v27 = a2;
  uint64_t v5 = type metadata accessor for ISO18013KnownDocTypes();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v26 - v10;
  uint64_t v12 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  v12((char *)v26 - v10, enum case for ISO18013KnownDocTypes.iso18013_5_1_mDL(_:), v5);
  uint64_t v13 = ISO18013KnownDocTypes.rawValue.getter();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v11, v5);
  if (v13 == a1 && v15 == v27)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v26[0] = a1;
    uint64_t v18 = v27;
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      v12(v9, enum case for ISO18013KnownDocTypes.japanNationalIDCard(_:), v5);
      uint64_t v20 = ISO18013KnownDocTypes.rawValue.getter();
      uint64_t v22 = v21;
      v16(v9, v5);
      if (v20 == v26[0] && v22 == v18)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0) {
          return sub_10004AA18((uint64_t)_swiftEmptyArrayStorage);
        }
      }
    }
  }
  return swift_bridgeObjectRetain();
}

char *sub_10016EFE0()
{
  uint64_t v217 = type metadata accessor for ISO23220_1_Japan_ElementIdentifier();
  uint64_t v216 = *(void *)(v217 - 8);
  uint64_t v0 = __chkstk_darwin(v217);
  v221 = (char *)&v190 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __chkstk_darwin(v0);
  v220 = (char *)&v190 - v3;
  uint64_t v4 = __chkstk_darwin(v2);
  v219 = (char *)&v190 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  v218 = (char *)&v190 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v215 = (char *)&v190 - v9;
  __chkstk_darwin(v8);
  v214 = (char *)&v190 - v10;
  uint64_t v212 = type metadata accessor for ISO23220_1_ElementIdentifier();
  uint64_t v210 = *(void *)(v212 - 8);
  uint64_t v11 = __chkstk_darwin(v212);
  v213 = (char *)&v190 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v211 = (char *)&v190 - v14;
  __chkstk_darwin(v13);
  v209 = (char *)&v190 - v15;
  uint64_t v16 = type metadata accessor for ISO18013_5_1_ElementIdentifier();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  v207 = (char *)&v190 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  v206 = (char *)&v190 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v205 = (char *)&v190 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v204 = (char *)&v190 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v203 = (char *)&v190 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v200 = (char *)&v190 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v198 = (char *)&v190 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v197 = (char *)&v190 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v196 = (char *)&v190 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v195 = (char *)&v190 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v194 = (char *)&v190 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v193 = (char *)&v190 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  v192 = (char *)&v190 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v191 = (char *)&v190 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  uint64_t v48 = (char *)&v190 - v47;
  __chkstk_darwin(v46);
  uint64_t v50 = (char *)&v190 - v49;
  uint64_t v51 = type metadata accessor for ISO18013KnownNamespaces();
  uint64_t v222 = v51;
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = __chkstk_darwin(v51);
  v208 = (char *)&v190 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v53);
  uint64_t v56 = (char *)&v190 - v55;
  v201 = (char *)&v190 - v55;
  uint64_t v202 = sub_100006CC8(&qword_1001C12D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001768E0;
  v58 = *(void (**)(char *, void, uint64_t))(v52 + 104);
  uint64_t v226 = v52 + 104;
  v227 = v58;
  v58(v56, enum case for ISO18013KnownNamespaces.iso18013_5_1(_:), v51);
  uint64_t v59 = ISO18013KnownNamespaces.rawValue.getter();
  uint64_t v61 = v60;
  uint64_t v62 = *(void (**)(char *, uint64_t))(v52 + 8);
  uint64_t v224 = v52 + 8;
  v225 = v62;
  v62(v56, v51);
  uint64_t v199 = inited;
  *(void *)(inited + 32) = v59;
  *(void *)(inited + 40) = v61;
  uint64_t v223 = sub_100006CC8(&qword_1001C12D8);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_100178390;
  uint64_t v64 = *(void (**)(char *, void, uint64_t))(v17 + 104);
  v64(v50, enum case for ISO18013_5_1_ElementIdentifier.givenName(_:), v16);
  uint64_t v65 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v67 = v66;
  v68 = *(void (**)(char *, uint64_t))(v17 + 8);
  v68(v50, v16);
  *(void *)(v63 + 32) = v65;
  *(void *)(v63 + 40) = v67;
  v64(v48, enum case for ISO18013_5_1_ElementIdentifier.familyName(_:), v16);
  uint64_t v69 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v71 = v70;
  v68(v48, v16);
  *(void *)(v63 + 48) = v69;
  *(void *)(v63 + 56) = v71;
  v72 = v191;
  v64(v191, enum case for ISO18013_5_1_ElementIdentifier.portrait(_:), v16);
  uint64_t v73 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v75 = v74;
  v68(v72, v16);
  *(void *)(v63 + 64) = v73;
  *(void *)(v63 + 72) = v75;
  uint64_t v76 = v192;
  v64(v192, enum case for ISO18013_5_1_ElementIdentifier.residentAddress(_:), v16);
  uint64_t v77 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v79 = v78;
  v68(v76, v16);
  *(void *)(v63 + 80) = v77;
  *(void *)(v63 + 88) = v79;
  v80 = v193;
  v64(v193, enum case for ISO18013_5_1_ElementIdentifier.residentCity(_:), v16);
  uint64_t v81 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v83 = v82;
  v68(v80, v16);
  *(void *)(v63 + 96) = v81;
  *(void *)(v63 + 104) = v83;
  v84 = v194;
  v64(v194, enum case for ISO18013_5_1_ElementIdentifier.residentState(_:), v16);
  uint64_t v85 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v87 = v86;
  v68(v84, v16);
  *(void *)(v63 + 112) = v85;
  *(void *)(v63 + 120) = v87;
  v88 = v195;
  v64(v195, enum case for ISO18013_5_1_ElementIdentifier.residentCountry(_:), v16);
  uint64_t v89 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v91 = v90;
  v68(v88, v16);
  *(void *)(v63 + 128) = v89;
  *(void *)(v63 + 136) = v91;
  v92 = v196;
  v64(v196, enum case for ISO18013_5_1_ElementIdentifier.residentPostalCode(_:), v16);
  uint64_t v93 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v95 = v94;
  v68(v92, v16);
  *(void *)(v63 + 144) = v93;
  *(void *)(v63 + 152) = v95;
  v96 = v197;
  v64(v197, enum case for ISO18013_5_1_ElementIdentifier.issuingAuthority(_:), v16);
  uint64_t v97 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v99 = v98;
  v68(v96, v16);
  *(void *)(v63 + 160) = v97;
  *(void *)(v63 + 168) = v99;
  v100 = v198;
  v64(v198, enum case for ISO18013_5_1_ElementIdentifier.issuingCountry(_:), v16);
  uint64_t v101 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v103 = v102;
  v68(v100, v16);
  *(void *)(v63 + 176) = v101;
  *(void *)(v63 + 184) = v103;
  v104 = v200;
  v64(v200, enum case for ISO18013_5_1_ElementIdentifier.issuingJurisdiction(_:), v16);
  uint64_t v105 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v107 = v106;
  v68(v104, v16);
  *(void *)(v63 + 192) = v105;
  *(void *)(v63 + 200) = v107;
  v108 = v203;
  v64(v203, enum case for ISO18013_5_1_ElementIdentifier.expiryDate(_:), v16);
  uint64_t v109 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v111 = v110;
  v68(v108, v16);
  *(void *)(v63 + 208) = v109;
  *(void *)(v63 + 216) = v111;
  v112 = v204;
  v64(v204, enum case for ISO18013_5_1_ElementIdentifier.documentNumber(_:), v16);
  uint64_t v113 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v115 = v114;
  v68(v112, v16);
  *(void *)(v63 + 224) = v113;
  *(void *)(v63 + 232) = v115;
  v116 = v205;
  v64(v205, enum case for ISO18013_5_1_ElementIdentifier.drivingPrivileges(_:), v16);
  uint64_t v117 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v119 = v118;
  v68(v116, v16);
  *(void *)(v63 + 240) = v117;
  *(void *)(v63 + 248) = v119;
  v120 = v206;
  v64(v206, enum case for ISO18013_5_1_ElementIdentifier.ageInYears(_:), v16);
  uint64_t v121 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v123 = v122;
  v68(v120, v16);
  *(void *)(v63 + 256) = v121;
  *(void *)(v63 + 264) = v123;
  v124 = v207;
  v64(v207, enum case for ISO18013_5_1_ElementIdentifier.birthDate(_:), v16);
  v125 = v124;
  uint64_t v126 = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  uint64_t v128 = v127;
  v68(v125, v16);
  *(void *)(v63 + 272) = v126;
  *(void *)(v63 + 280) = v128;
  uint64_t v129 = v199;
  *(void *)(v199 + 48) = v63;
  v207 = (char *)sub_10004AA18(v129);
  uint64_t v130 = swift_initStackObject();
  *(_OWORD *)(v130 + 16) = xmmword_1001767E0;
  v131 = v201;
  uint64_t v132 = v222;
  v227(v201, enum case for ISO18013KnownNamespaces.iso23220_1(_:), v222);
  uint64_t v133 = ISO18013KnownNamespaces.rawValue.getter();
  uint64_t v135 = v134;
  v225(v131, v132);
  *(void *)(v130 + 32) = v133;
  *(void *)(v130 + 40) = v135;
  uint64_t v136 = swift_allocObject();
  *(_OWORD *)(v136 + 16) = xmmword_100176D20;
  uint64_t v137 = v210;
  v138 = *(void (**)(char *, void, uint64_t))(v210 + 104);
  v139 = v209;
  uint64_t v140 = v212;
  v138(v209, enum case for ISO23220_1_ElementIdentifier.ageInYears(_:), v212);
  uint64_t v141 = ISO23220_1_ElementIdentifier.rawValue.getter();
  uint64_t v143 = v142;
  v144 = *(void (**)(char *, uint64_t))(v137 + 8);
  v144(v139, v140);
  *(void *)(v136 + 32) = v141;
  *(void *)(v136 + 40) = v143;
  v145 = v211;
  v138(v211, enum case for ISO23220_1_ElementIdentifier.birthDate(_:), v140);
  uint64_t v146 = ISO23220_1_ElementIdentifier.rawValue.getter();
  uint64_t v148 = v147;
  v144(v145, v140);
  *(void *)(v136 + 48) = v146;
  *(void *)(v136 + 56) = v148;
  v149 = v213;
  v138(v213, enum case for ISO23220_1_ElementIdentifier.sex(_:), v140);
  v150 = v149;
  uint64_t v151 = ISO23220_1_ElementIdentifier.rawValue.getter();
  uint64_t v153 = v152;
  v144(v150, v140);
  *(void *)(v136 + 64) = v151;
  *(void *)(v136 + 72) = v153;
  *(void *)(v130 + 48) = v136;
  v154 = v208;
  uint64_t v155 = v222;
  v227(v208, enum case for ISO18013KnownNamespaces.iso23220_1_jp(_:), v222);
  uint64_t v156 = ISO18013KnownNamespaces.rawValue.getter();
  uint64_t v158 = v157;
  v225(v154, v155);
  *(void *)(v130 + 56) = v156;
  *(void *)(v130 + 64) = v158;
  uint64_t v159 = swift_allocObject();
  *(_OWORD *)(v159 + 16) = xmmword_100177AA0;
  uint64_t v160 = v216;
  v161 = *(void (**)(char *, void, uint64_t))(v216 + 104);
  v162 = v214;
  uint64_t v163 = v217;
  v161(v214, enum case for ISO23220_1_Japan_ElementIdentifier.localGovCode(_:), v217);
  uint64_t v164 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v166 = v165;
  v167 = *(void (**)(char *, uint64_t))(v160 + 8);
  v167(v162, v163);
  *(void *)(v159 + 32) = v164;
  *(void *)(v159 + 40) = v166;
  v168 = v215;
  v161(v215, enum case for ISO23220_1_Japan_ElementIdentifier.fullName(_:), v163);
  uint64_t v169 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v171 = v170;
  v167(v168, v163);
  *(void *)(v159 + 48) = v169;
  *(void *)(v159 + 56) = v171;
  v172 = v218;
  v161(v218, enum case for ISO23220_1_Japan_ElementIdentifier.birthDate(_:), v163);
  uint64_t v173 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v175 = v174;
  v167(v172, v163);
  *(void *)(v159 + 64) = v173;
  *(void *)(v159 + 72) = v175;
  v176 = v219;
  v161(v219, enum case for ISO23220_1_Japan_ElementIdentifier.residentAddress(_:), v163);
  uint64_t v177 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v179 = v178;
  v167(v176, v163);
  *(void *)(v159 + 80) = v177;
  *(void *)(v159 + 88) = v179;
  v180 = v220;
  v161(v220, enum case for ISO23220_1_Japan_ElementIdentifier.sex(_:), v163);
  uint64_t v181 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v183 = v182;
  v167(v180, v163);
  *(void *)(v159 + 96) = v181;
  *(void *)(v159 + 104) = v183;
  v184 = v221;
  v161(v221, enum case for ISO23220_1_Japan_ElementIdentifier.portrait(_:), v163);
  v185 = v184;
  uint64_t v186 = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  uint64_t v188 = v187;
  v167(v185, v163);
  *(void *)(v159 + 112) = v186;
  *(void *)(v159 + 120) = v188;
  *(void *)(v130 + 72) = v159;
  sub_10004AA18(v130);
  return v207;
}

uint64_t sub_10016FFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_10004AA18((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v82 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v83 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v78 = 0;
  int64_t v8 = 0;
  uint64_t v84 = a1;
  uint64_t v85 = a2;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  while (2)
  {
    unint64_t v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
    {
      uint64_t v14 = (uint64_t *)(*(void *)(v84 + 48) + 16 * i);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      uint64_t v17 = *(void *)(*(void *)(v84 + 56) + 8 * i);
      uint64_t v18 = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
      if (!v18) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_10013C484(v16, v15);
      if ((v20 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      uint64_t v35 = *(void **)(*(void *)(a2 + 56) + 8 * v19);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v74 = v35;
      uint64_t v77 = *(void *)(v17 + 16);
      if (v77)
      {
        unint64_t v71 = v7;
        int64_t v72 = v8;
        unint64_t v36 = 0;
        uint64_t v79 = v35[2];
        uint64_t v76 = v17 + 32;
        uint64_t v70 = v35 + 9;
        uint64_t v37 = v35;
        uint64_t v73 = v17;
        while (1)
        {
          if (v36 >= *(void *)(v17 + 16)) {
            goto LABEL_86;
          }
          uint64_t v38 = (uint64_t *)(v76 + 16 * v36);
          uint64_t v39 = *v38;
          uint64_t v40 = v38[1];
          if (!v79) {
            goto LABEL_47;
          }
          if (v37[4] != v39 || v37[5] != v40)
          {
            uint64_t v80 = *v38;
            uint64_t v42 = v38[1];
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
            {
              uint64_t v39 = v80;
              uint64_t v40 = v42;
              if (v79 == 1) {
                goto LABEL_47;
              }
              if ((v37[6] != v80 || v37[7] != v42) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                break;
              }
            }
          }
LABEL_38:
          if (++v36 == v77)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v7 = v71;
            int64_t v8 = v72;
            goto LABEL_78;
          }
        }
        uint64_t v39 = v80;
        uint64_t v40 = v42;
        if (v79 != 2)
        {
          uint64_t v64 = v70;
          uint64_t v65 = 2;
          do
          {
            uint64_t v66 = v65 + 1;
            if (__OFADD__(v65, 1)) {
              goto LABEL_90;
            }
            BOOL v67 = *(v64 - 1) == v39 && *v64 == v40;
            if (v67 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              uint64_t v37 = v74;
              goto LABEL_38;
            }
            v64 += 2;
            ++v65;
            uint64_t v39 = v80;
            uint64_t v40 = v42;
          }
          while (v66 != v79);
        }
LABEL_47:
        uint64_t v81 = v39;
        uint64_t v43 = v40;
        swift_bridgeObjectRetain();
        uint64_t v75 = v43;
        swift_bridgeObjectRetain();
        sub_100006E40((uint64_t)v78);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v46 = sub_10013C484(v16, v15);
        uint64_t v47 = v4[2];
        BOOL v48 = (v45 & 1) == 0;
        uint64_t v49 = v47 + v48;
        if (__OFADD__(v47, v48)) {
          goto LABEL_87;
        }
        char v50 = v45;
        if (v4[3] >= v49)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_10009AAA0();
          }
        }
        else
        {
          sub_100098B18(v49, isUniquelyReferenced_nonNull_native);
          unint64_t v51 = sub_10013C484(v16, v15);
          if ((v50 & 1) != (v52 & 1)) {
            goto LABEL_91;
          }
          unint64_t v46 = v51;
        }
        swift_bridgeObjectRelease();
        if ((v50 & 1) == 0)
        {
          v4[(v46 >> 6) + 8] |= 1 << v46;
          uint64_t v53 = (uint64_t *)(v4[6] + 16 * v46);
          uint64_t *v53 = v16;
          v53[1] = v15;
          *(void *)(v4[7] + 8 * v46) = _swiftEmptyArrayStorage;
          uint64_t v54 = v4[2];
          uint64_t v55 = v54 + 1;
          BOOL v56 = __OFADD__(v54, 1);
          swift_bridgeObjectRetain();
          if (v56) {
            goto LABEL_89;
          }
          v4[2] = v55;
        }
        swift_bridgeObjectRetain();
        uint64_t v57 = v4[7];
        swift_bridgeObjectRelease();
        v58 = *(char **)(v57 + 8 * v46);
        char v59 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v57 + 8 * v46) = v58;
        if ((v59 & 1) == 0)
        {
          v58 = sub_1000D0D48(0, *((void *)v58 + 2) + 1, 1, v58);
          *(void *)(v57 + 8 * v46) = v58;
        }
        unint64_t v61 = *((void *)v58 + 2);
        unint64_t v60 = *((void *)v58 + 3);
        uint64_t v62 = v81;
        if (v61 >= v60 >> 1)
        {
          v68 = sub_1000D0D48((char *)(v60 > 1), v61 + 1, 1, v58);
          uint64_t v62 = v81;
          v58 = v68;
          *(void *)(v57 + 8 * v46) = v68;
        }
        a2 = v85;
        uint64_t v17 = v73;
        uint64_t v37 = v74;
        *((void *)v58 + 2) = v61 + 1;
        uint64_t v63 = &v58[16 * v61];
        *((void *)v63 + 4) = v62;
        *((void *)v63 + 5) = v75;
        swift_bridgeObjectRelease();
        uint64_t v78 = sub_1000EC028;
        goto LABEL_38;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_78:
      swift_bridgeObjectRelease();
      if (v7) {
        goto LABEL_4;
      }
LABEL_5:
      int64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_85;
      }
      if (v11 >= v83)
      {
LABEL_82:
        swift_release();
        sub_100006E40((uint64_t)v78);
        return (uint64_t)v4;
      }
      unint64_t v12 = *(void *)(v82 + 8 * v11);
      ++v8;
      if (!v12)
      {
        int64_t v8 = v11 + 1;
        if (v11 + 1 >= v83) {
          goto LABEL_82;
        }
        unint64_t v12 = *(void *)(v82 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 2;
          if (v11 + 2 >= v83) {
            goto LABEL_82;
          }
          unint64_t v12 = *(void *)(v82 + 8 * v8);
          if (!v12)
          {
            int64_t v13 = v11 + 3;
            if (v13 >= v83) {
              goto LABEL_82;
            }
            unint64_t v12 = *(void *)(v82 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                int64_t v8 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_88;
                }
                if (v8 >= v83) {
                  goto LABEL_82;
                }
                unint64_t v12 = *(void *)(v82 + 8 * v8);
                ++v13;
                if (v12) {
                  goto LABEL_18;
                }
              }
            }
            int64_t v8 = v13;
          }
        }
      }
LABEL_18:
      unint64_t v7 = (v12 - 1) & v12;
    }
    swift_bridgeObjectRetain();
LABEL_23:
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v23 = sub_10013C484(v16, v15);
    uint64_t v24 = v4[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (!__OFADD__(v24, v25))
    {
      char v27 = v22;
      if (v4[3] < v26)
      {
        sub_100098B18(v26, v21);
        unint64_t v28 = sub_10013C484(v16, v15);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_91;
        }
        unint64_t v23 = v28;
        if ((v27 & 1) == 0) {
          goto LABEL_27;
        }
LABEL_31:
        uint64_t v34 = v4[7];
        swift_bridgeObjectRelease();
        *(void *)(v34 + 8 * v23) = v17;
        goto LABEL_32;
      }
      if (v21)
      {
        if (v22) {
          goto LABEL_31;
        }
      }
      else
      {
        sub_10009AAA0();
        if (v27) {
          goto LABEL_31;
        }
      }
LABEL_27:
      v4[(v23 >> 6) + 8] |= 1 << v23;
      uint64_t v30 = (uint64_t *)(v4[6] + 16 * v23);
      *uint64_t v30 = v16;
      v30[1] = v15;
      *(void *)(v4[7] + 8 * v23) = v17;
      uint64_t v31 = v4[2];
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      if (v32) {
        goto LABEL_84;
      }
      v4[2] = v33;
      swift_bridgeObjectRetain();
LABEL_32:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2 = v85;
      if (v7) {
        continue;
      }
      goto LABEL_5;
    }
    break;
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10017067C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10013C3B0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10009A0E0();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for SESKeystore.KeyDesignation();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = type metadata accessor for MockSESKeystore.MockDesignatedKey(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_100014C18(v12 + *(void *)(v20 + 72) * v6, a2);
    sub_100168FFC(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for MockSESKeystore.MockDesignatedKey(0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_100170834(uint64_t a1, uint64_t a2)
{
  return sub_1001709BC(a1, a2, (void (*)(unint64_t, uint64_t))sub_100169344, (void (*)(void))sub_10009A5D0);
}

uint64_t sub_100170860(uint64_t a1, uint64_t a2)
{
  return sub_1001709BC(a1, a2, (void (*)(unint64_t, uint64_t))sub_100169344, (void (*)(void))sub_10009AAA0);
}

double sub_10017088C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10013C484(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10009AAAC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_10004DCD8((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_100169348(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100170990(uint64_t a1, uint64_t a2)
{
  return sub_1001709BC(a1, a2, (void (*)(unint64_t, uint64_t))sub_100169344, (void (*)(void))sub_10009AC94);
}

uint64_t sub_1001709BC(uint64_t a1, uint64_t a2, void (*a3)(unint64_t, uint64_t), void (*a4)(void))
{
  char v7 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_10013C484(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v7;
  uint64_t v16 = *v7;
  *char v7 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a4();
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v10);
  a3(v10, v13);
  *char v7 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

void sub_100170AA4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v101 = a2;
  uint64_t v102 = a1;
  uint64_t v98 = type metadata accessor for DIPError.Code();
  uint64_t v4 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  v100 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v103 = v6;
  uint64_t v104 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v94 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v97 = (char *)&v91 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v93 = (char *)&v91 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v96 = (char *)&v91 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v92 = (char *)&v91 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v91 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v23 = (char *)&v91 - v22;
  __chkstk_darwin(v21);
  BOOL v25 = (char *)&v91 - v24;
  char v110 = a3;
  uint64_t v26 = self;
  id v27 = [v26 standardUserDefaults];
  v28._object = (void *)0x8000000100185380;
  v28._countAndFlagsBits = 0xD000000000000029;
  Swift::Bool v29 = NSUserDefaults.internalBool(forKey:)(v28);

  id v95 = v26;
  if (v29)
  {
    defaultLogger()();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v30, v31))
    {
      BOOL v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Forcing shouldHaveOACL to false due to internal defaults setting", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v104 + 8))(v25, v103);
    a3 = 0;
    char v110 = 0;
    uint64_t v33 = v100;
  }
  else
  {
    id v34 = [v26 standardUserDefaults];
    v35._countAndFlagsBits = 0xD00000000000002ALL;
    v35._object = (void *)0x80000001001853B0;
    Swift::Bool v36 = NSUserDefaults.internalBool(forKey:)(v35);

    uint64_t v33 = v100;
    if (v36)
    {
      defaultLogger()();
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "Forcing shouldHaveOACL to true due to internal defaults setting", v39, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v104 + 8))(v23, v103);
      a3 = 1;
      char v110 = 1;
    }
  }
  defaultLogger()();
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 67109120;
    LODWORD(v107) = a3 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "ACLMigrator migrateOACLOperation shouldHaveOACL? %{BOOL}d", v42, 8u);
    swift_slowDealloc();
  }

  uint64_t v43 = v104 + 8;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v104 + 8);
  v44(v20, v103);
  type metadata accessor for SecAccessControl(0);
  uint64_t v45 = v99;
  unint64_t v46 = (char *)static SecAccessControlRef.fromData(_:)();
  if (v45)
  {
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v33, enum case for DIPError.Code.internalError(_:), v98);
LABEL_26:
    swift_errorRetain();
    sub_100102620((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for DIPError();
    sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    return;
  }
  v100 = v46;
  Constraints = (void *)SecAccessControlGetConstraints();
  if (!Constraints
    || (id v48 = Constraints,
        uint64_t v104 = v43,
        id v49 = v48,
        *(void *)&long long v107 = 0,
        static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(),
        v49,
        (uint64_t v50 = v107) == 0))
  {
    v58 = *(void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v59 = v98;
    v58(v33, enum case for DIPError.Code.secAccessControlCannotGetConstraints(_:), v98);
    sub_100102620((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for DIPError();
    sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
    swift_allocError();
LABEL_25:
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();

    v58(v33, enum case for DIPError.Code.internalError(_:), v59);
    goto LABEL_26;
  }
  uint64_t v109 = v107;
  if (!*(void *)(v107 + 16))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    v58 = *(void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v59 = v98;
    v58(v33, enum case for DIPError.Code.idcsInvalidACL(_:), v98);
    sub_100102620((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for DIPError();
    sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
    swift_allocError();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  unint64_t v51 = sub_10013C484(1852273519, 0xE400000000000000);
  if ((v52 & 1) == 0
    || (sub_10004DD90(*(void *)(v50 + 56) + 32 * v51, (uint64_t)&v107),
        uint64_t v53 = sub_100006CC8(&qword_1001C4BA0),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  uint64_t v54 = *(void *)&v106[0];
  swift_beginAccess();
  if (v110 == 1)
  {
    if (*(void *)(v50 + 16))
    {
      unint64_t v55 = sub_10013C484(1818452335, 0xE400000000000000);
      BOOL v56 = v96;
      if (v57)
      {
        sub_10004DD90(*(void *)(v50 + 56) + 32 * v55, (uint64_t)&v107);
      }
      else
      {
        long long v107 = 0u;
        long long v108 = 0u;
      }
    }
    else
    {
      long long v107 = 0u;
      long long v108 = 0u;
      BOOL v56 = v96;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v108 + 1))
    {
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v61 = v92;
        defaultLogger()();
        uint64_t v63 = Logger.logObject.getter();
        os_log_type_t v64 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v65 = 0;
          swift_bridgeObjectRelease();
          uint64_t v66 = "ACL contains oacl dictionary, no migration needed";
LABEL_53:
          _os_log_impl((void *)&_mh_execute_header, v63, v64, v66, v65, 2u);
          swift_slowDealloc();

          v44(v61, v103);
LABEL_55:
          sub_10000354C(v102, v101);
          return;
        }
        goto LABEL_54;
      }
    }
    else
    {
      sub_1000FFBF0((uint64_t)&v107);
    }
    defaultLogger()();
    BOOL v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v69 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "Adding oacl operation to acl", v69, 2u);
      swift_slowDealloc();
    }

    uint64_t v70 = v56;
    uint64_t v71 = v103;
    v44(v70, v103);
    *((void *)&v108 + 1) = v53;
    *(void *)&long long v107 = v54;
    sub_10004DCD8(&v107, v106);
    uint64_t v72 = v109;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v105 = v72;
    sub_100169938(v106, 1818452335, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
    uint64_t v109 = v105;
    swift_bridgeObjectRelease();
    id v74 = [v95 standardUserDefaults];
    v75._countAndFlagsBits = 0xD000000000000021;
    v75._object = (void *)0x80000001001854B0;
    Swift::Bool v76 = NSUserDefaults.internalBool(forKey:)(v75);

    if (v76)
    {
      uint64_t v77 = v93;
      defaultLogger()();
      uint64_t v78 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v80 = 0;
        _os_log_impl((void *)&_mh_execute_header, v78, v79, "Setting OACL to true due to internal defaults setting", v80, 2u);
        swift_slowDealloc();
      }

      v44(v77, v71);
      *((void *)&v108 + 1) = &type metadata for Bool;
      LOBYTE(v107) = 1;
      sub_10004DCD8(&v107, v106);
      uint64_t v81 = v109;
      char v82 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v105 = v81;
      sub_100169938(v106, 1818452335, 0xE400000000000000, v82);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (*(void *)(v50 + 16))
    {
      unint64_t v60 = sub_10013C484(1818452335, 0xE400000000000000);
      unint64_t v61 = v97;
      if (v62)
      {
        sub_10004DD90(*(void *)(v50 + 56) + 32 * v60, (uint64_t)&v107);
      }
      else
      {
        long long v107 = 0u;
        long long v108 = 0u;
      }
    }
    else
    {
      long long v107 = 0u;
      long long v108 = 0u;
      unint64_t v61 = v97;
    }
    swift_bridgeObjectRelease();
    uint64_t v83 = *((void *)&v108 + 1);
    sub_1000FFBF0((uint64_t)&v107);
    if (!v83)
    {
      defaultLogger()();
      uint64_t v63 = Logger.logObject.getter();
      os_log_type_t v64 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v65 = 0;
        swift_bridgeObjectRelease();
        uint64_t v66 = "ACL does not contain oacl dictionary, no migration needed";
        goto LABEL_53;
      }
LABEL_54:

      v44(v61, v103);
      swift_bridgeObjectRelease();
      goto LABEL_55;
    }
    uint64_t v84 = v94;
    defaultLogger()();
    uint64_t v85 = Logger.logObject.getter();
    os_log_type_t v86 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v85, v86))
    {
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, v85, v86, "Removing oacl operation from acl", v87, 2u);
      swift_slowDealloc();
    }

    v44(v84, v103);
    sub_10017088C(1818452335, 0xE400000000000000, &v107);
    sub_1000FFBF0((uint64_t)&v107);
  }
  v88 = v100;
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  SecAccessControlSetConstraints();

  uint64_t v90 = (void *)SecAccessControlCopyData();
  if (v90)
  {
    swift_bridgeObjectRelease();
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    __break(1u);
  }
}

void *sub_100171940()
{
  uint64_t v0 = type metadata accessor for DIPError.Code();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v42 = 0;
  uint64_t v10 = (void *)SecAccessControlCreate();
  uint64_t v11 = v10;
  uint64_t v12 = v42;
  if (v10)
  {
    if (!v42)
    {
      id v13 = v10;
      unint64_t v14 = sub_10004AB68((uint64_t)_swiftEmptyArrayStorage);
      os_log_type_t v41 = &type metadata for Bool;
      LOBYTE(v40) = 1;
      sub_10004DCD8(&v40, v39);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v38 = v14;
      sub_100169938(v39, 1852273519, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
      unint64_t v16 = v38;
      swift_bridgeObjectRelease();
      os_log_type_t v41 = &type metadata for Bool;
      LOBYTE(v40) = 1;
      sub_10004DCD8(&v40, v39);
      char v17 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v38 = v16;
      sub_100169938(v39, 1818452335, 0xE400000000000000, v17);
      swift_bridgeObjectRelease();
      id v18 = v13;
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      SecAccessControlSetConstraints();

      return v11;
    }
    goto LABEL_5;
  }
  if (v42)
  {
LABEL_5:
    uint64_t v35 = v4;
    uint64_t v36 = v1;
    type metadata accessor for CFError(0);
    sub_100172360(&qword_1001C4BA8, type metadata accessor for CFError);
    swift_allocError();
    *uint64_t v20 = v12;
    swift_errorRetain();
    defaultLogger()();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = v0;
      uint64_t v24 = (uint8_t *)v23;
      *(void *)&long long v40 = swift_slowAlloc();
      uint64_t v33 = v3;
      id v34 = v11;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_getErrorValue();
      uint64_t v25 = Error.localizedDescription.getter();
      *(void *)&v39[0] = sub_10004C3A4(v25, v26, (uint64_t *)&v40);
      uint64_t v3 = v33;
      uint64_t v11 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Unable to create empty ACL due to error: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v0 = v32;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v35);
    (*(void (**)(char *, void, uint64_t))(v36 + 104))(v3, enum case for DIPError.Code.secAccessControlCannotCreateACL(_:), v0);
    swift_errorRetain();
    sub_100102620((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for DIPError();
    sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    swift_errorRelease();

    return v11;
  }
  uint64_t v28 = v4;
  defaultLogger()();
  Swift::Bool v29 = Logger.logObject.getter();
  uint64_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, (os_log_type_t)v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, "Unable to create empty ACL.", v31, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v28);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for DIPError.Code.secAccessControlCannotCreateACL(_:), v0);
  sub_100102620((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for DIPError();
  sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
  swift_allocError();
  DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
  swift_willThrow();
  return v11;
}

void sub_1001720A0(void *a1)
{
  uint64_t v3 = type metadata accessor for DIPError.Code();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100171940();
  if (v1) {
    goto LABEL_2;
  }
  id v8 = v7;
  sub_10004B42C((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v13 = 0;
  id v10 = [a1 evaluateAccessControl:v8 operation:3 options:isa error:&v13];

  if (!v10)
  {
    id v12 = v13;
    _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_2:
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for DIPError.Code.internalError(_:), v3);
    swift_errorRetain();
    sub_100102620((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for DIPError();
    sub_100172360((unint64_t *)&qword_1001C0E20, (void (*)(uint64_t))&type metadata accessor for DIPError);
    swift_allocError();
    DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
    swift_willThrow();
    swift_errorRelease();
    return;
  }
  id v11 = v13;
}

uint64_t sub_100172360(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t DateComponents.year.getter()
{
  return DateComponents.year.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t URL.isFileOnDisk.getter()
{
  return URL.isFileOnDisk.getter();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.debugDescription.getter()
{
  return URL.debugDescription.getter();
}

uint64_t static URL.libraryDirectory.getter()
{
  return static URL.libraryDirectory.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

Swift::String __swiftcall Data.base16EncodedString()()
{
  uint64_t v0 = Data.base16EncodedString()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t Data.subdata(in:)()
{
  return Data.subdata(in:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.isAtLeast(days:after:)()
{
  return Date.isAtLeast(days:after:)();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.data.getter()
{
  return UUID.data.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t COSE_Sign1.AlgorithmIdentifier.rawValue.getter()
{
  return COSE_Sign1.AlgorithmIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for COSE_Sign1.AlgorithmIdentifier()
{
  return type metadata accessor for COSE_Sign1.AlgorithmIdentifier();
}

uint64_t COSE_Sign1.init(algorithmIdentifier:keyIdentifier:payload:signature:includeCBORTag:)()
{
  return COSE_Sign1.init(algorithmIdentifier:keyIdentifier:payload:signature:includeCBORTag:)();
}

uint64_t COSE_Sign1.algorithmIdentifier.getter()
{
  return COSE_Sign1.algorithmIdentifier.getter();
}

uint64_t COSE_Sign1.payload.getter()
{
  return COSE_Sign1.payload.getter();
}

uint64_t COSE_Sign1.signature.getter()
{
  return COSE_Sign1.signature.getter();
}

uint64_t COSE_Sign1.x509Chain.getter()
{
  return COSE_Sign1.x509Chain.getter();
}

uint64_t type metadata accessor for COSE_Sign1()
{
  return type metadata accessor for COSE_Sign1();
}

uint64_t CBORDecoder.codingKeyFormat.setter()
{
  return CBORDecoder.codingKeyFormat.setter();
}

uint64_t CBORDecoder.presentmentType.setter()
{
  return CBORDecoder.presentmentType.setter();
}

uint64_t dispatch thunk of CBORDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of CBORDecoder.decode<A>(_:from:)();
}

uint64_t CBORDecoder.init()()
{
  return CBORDecoder.init()();
}

uint64_t type metadata accessor for CBORDecoder()
{
  return type metadata accessor for CBORDecoder();
}

uint64_t CBOREncoder.codingKeyFormat.setter()
{
  return CBOREncoder.codingKeyFormat.setter();
}

uint64_t CBOREncoder.presentmentType.setter()
{
  return CBOREncoder.presentmentType.setter();
}

uint64_t type metadata accessor for CBOREncoder.DictionaryEncodingStrategy()
{
  return type metadata accessor for CBOREncoder.DictionaryEncodingStrategy();
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.setter()
{
  return dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.setter();
}

uint64_t dispatch thunk of CBOREncoder.encode<A>(_:)()
{
  return dispatch thunk of CBOREncoder.encode<A>(_:)();
}

uint64_t CBOREncoder.init()()
{
  return CBOREncoder.init()();
}

uint64_t type metadata accessor for CBOREncoder()
{
  return type metadata accessor for CBOREncoder();
}

uint64_t COSEKey.publicKeyData.getter()
{
  return COSEKey.publicKeyData.getter();
}

uint64_t COSEKey.init(ec2CurveIdentifier:publicKey:)()
{
  return COSEKey.init(ec2CurveIdentifier:publicKey:)();
}

uint64_t COSEKey.publicKeyIdentifier.getter()
{
  return COSEKey.publicKeyIdentifier.getter();
}

uint64_t COSEKey.ec2.getter()
{
  return COSEKey.ec2.getter();
}

uint64_t COSEKey.type.getter()
{
  return COSEKey.type.getter();
}

uint64_t COSEKey.algorithm.getter()
{
  return COSEKey.algorithm.getter();
}

uint64_t type metadata accessor for COSEKey()
{
  return type metadata accessor for COSEKey();
}

uint64_t type metadata accessor for COSE_Mac0()
{
  return type metadata accessor for COSE_Mac0();
}

uint64_t AsyncCoreDataContainer.init(contextBuilder:)()
{
  return AsyncCoreDataContainer.init(contextBuilder:)();
}

uint64_t AsyncCoreDataStore.init(persistentStoreName:modelURL:databaseURL:storeType:urlFileProtection:)()
{
  return AsyncCoreDataStore.init(persistentStoreName:modelURL:databaseURL:storeType:urlFileProtection:)();
}

uint64_t type metadata accessor for AsyncCoreDataStore.StoreType()
{
  return type metadata accessor for AsyncCoreDataStore.StoreType();
}

uint64_t AsyncCoreDataStore.container.getter()
{
  return AsyncCoreDataStore.container.getter();
}

uint64_t type metadata accessor for AsyncCoreDataStore()
{
  return type metadata accessor for AsyncCoreDataStore();
}

uint64_t CoreIDVAssetBundle.issuerRoots.getter()
{
  return CoreIDVAssetBundle.issuerRoots.getter();
}

uint64_t CoreIDVAssetBundle.CertificateType.rawValue.getter()
{
  return CoreIDVAssetBundle.CertificateType.rawValue.getter();
}

uint64_t type metadata accessor for CoreIDVAssetBundle.CertificateType()
{
  return type metadata accessor for CoreIDVAssetBundle.CertificateType();
}

uint64_t CoreIDVAssetBundle.appleIssuerRoots.getter()
{
  return CoreIDVAssetBundle.appleIssuerRoots.getter();
}

uint64_t CoreIDVAssetBundle.terminalAuthRoots.getter()
{
  return CoreIDVAssetBundle.terminalAuthRoots.getter();
}

uint64_t type metadata accessor for CoreIDVAssetBundle()
{
  return type metadata accessor for CoreIDVAssetBundle();
}

uint64_t type metadata accessor for CoreIDVFeatureFlag()
{
  return type metadata accessor for CoreIDVFeatureFlag();
}

uint64_t CoreIDVAssetCertificates.certificates.getter()
{
  return CoreIDVAssetCertificates.certificates.getter();
}

uint64_t CoreIDVAssetCertificates.overrideDefault.getter()
{
  return CoreIDVAssetCertificates.overrideDefault.getter();
}

uint64_t type metadata accessor for CoreIDVAssetCertificates()
{
  return type metadata accessor for CoreIDVAssetCertificates();
}

uint64_t CoreIDVAsset.iOS.getter()
{
  return CoreIDVAsset.iOS.getter();
}

uint64_t CoreIDVAsset.base.getter()
{
  return CoreIDVAsset.base.getter();
}

uint64_t type metadata accessor for CoreIDVAsset()
{
  return type metadata accessor for CoreIDVAsset();
}

uint64_t AnyCodable.arrayValue.getter()
{
  return AnyCodable.arrayValue.getter();
}

uint64_t AnyCodable.doubleValue.getter()
{
  return AnyCodable.doubleValue.getter();
}

uint64_t AnyCodable.stringValue.getter()
{
  return AnyCodable.stringValue.getter();
}

uint64_t static AnyCodable.== infix(_:_:)()
{
  return static AnyCodable.== infix(_:_:)();
}

uint64_t AnyCodable.init(value:)()
{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

{
  return AnyCodable.init(value:)();
}

uint64_t AnyCodable.value.getter()
{
  return AnyCodable.value.getter();
}

uint64_t AnyCodable.intValue.getter()
{
  return AnyCodable.intValue.getter();
}

uint64_t AnyCodable.BOOLValue.getter()
{
  return AnyCodable.BOOLValue.getter();
}

uint64_t AnyCodable.dataValue.getter()
{
  return AnyCodable.dataValue.getter();
}

uint64_t AnyCodable.dateValue.getter()
{
  return AnyCodable.dateValue.getter();
}

uint64_t AnyCodable.dictValue.getter()
{
  return AnyCodable.dictValue.getter();
}

uint64_t type metadata accessor for AnyCodable()
{
  return type metadata accessor for AnyCodable();
}

uint64_t HPKEParams.pkISm.getter()
{
  return HPKEParams.pkISm.getter();
}

uint64_t type metadata accessor for HPKEParams()
{
  return type metadata accessor for HPKEParams();
}

uint64_t HashDigest.equalsHash(of:)()
{
  return HashDigest.equalsHash(of:)();
}

uint64_t HashDigest.algorithm.getter()
{
  return HashDigest.algorithm.getter();
}

uint64_t type metadata accessor for HashDigest()
{
  return type metadata accessor for HashDigest();
}

uint64_t randomData(numBytes:)()
{
  return randomData(numBytes:)();
}

uint64_t DIPLogError(_:message:log:)()
{
  return DIPLogError(_:message:log:)();
}

Swift::Void __swiftcall DIPSignpost.end(workflowID:isBackground:)(Swift::String_optional workflowID, Swift::Bool_optional isBackground)
{
}

uint64_t type metadata accessor for DIPSignpost.Config()
{
  return type metadata accessor for DIPSignpost.Config();
}

uint64_t type metadata accessor for DIPSignpost()
{
  return type metadata accessor for DIPSignpost();
}

uint64_t DIPSignpost.init(_:)()
{
  return DIPSignpost.init(_:)();
}

uint64_t DIPTrustKey.baaCertificate.getter()
{
  return DIPTrustKey.baaCertificate.getter();
}

uint64_t DIPTrustKey.keyBlob.getter()
{
  return DIPTrustKey.keyBlob.getter();
}

uint64_t type metadata accessor for DIPTrustKey()
{
  return type metadata accessor for DIPTrustKey();
}

uint64_t dispatch thunk of SESKeystore.signDigest(_:withKey:externalizedLAContext:outputFormat:seAccessEndpoint:)()
{
  return dispatch thunk of SESKeystore.signDigest(_:withKey:externalizedLAContext:outputFormat:seAccessEndpoint:)();
}

uint64_t dispatch thunk of SESKeystore.designateKey(_:designation:sessionHandoffToken:)()
{
  return dispatch thunk of SESKeystore.designateKey(_:designation:sessionHandoffToken:)();
}

uint64_t dispatch thunk of SESKeystore.getPublicKey(of:)()
{
  return dispatch thunk of SESKeystore.getPublicKey(of:)();
}

uint64_t SESKeystore.DesignatedKey.init(designation:publicKeyIdentifier:)()
{
  return SESKeystore.DesignatedKey.init(designation:publicKeyIdentifier:)();
}

uint64_t type metadata accessor for SESKeystore.DesignatedKey()
{
  return type metadata accessor for SESKeystore.DesignatedKey();
}

uint64_t type metadata accessor for SESKeystore.KeyDesignation()
{
  return type metadata accessor for SESKeystore.KeyDesignation();
}

uint64_t dispatch thunk of SESKeystore.getAttestation(for:subjectIdentifier:oids:)()
{
  return dispatch thunk of SESKeystore.getAttestation(for:subjectIdentifier:oids:)();
}

uint64_t type metadata accessor for SESKeystore.AttestationOIDs()
{
  return type metadata accessor for SESKeystore.AttestationOIDs();
}

uint64_t dispatch thunk of SESKeystore.getACLConstraints(of:)()
{
  return dispatch thunk of SESKeystore.getACLConstraints(of:)();
}

uint64_t dispatch thunk of SESKeystore.getCASDCertificate()()
{
  return dispatch thunk of SESKeystore.getCASDCertificate()();
}

uint64_t dispatch thunk of SESKeystore.clearKeyDesignation(_:)()
{
  return dispatch thunk of SESKeystore.clearKeyDesignation(_:)();
}

uint64_t type metadata accessor for SESKeystore.SignatureOutputFormat()
{
  return type metadata accessor for SESKeystore.SignatureOutputFormat();
}

uint64_t dispatch thunk of SESKeystore.changeACL(of:to:authorizingLAContext:)()
{
  return dispatch thunk of SESKeystore.changeACL(of:to:authorizingLAContext:)();
}

uint64_t dispatch thunk of SESKeystore.createKey(acl:)()
{
  return dispatch thunk of SESKeystore.createKey(acl:)();
}

uint64_t dispatch thunk of SESKeystore.deleteKey(_:)()
{
  return dispatch thunk of SESKeystore.deleteKey(_:)();
}

uint64_t SESKeystore.init()()
{
  return SESKeystore.init()();
}

uint64_t type metadata accessor for SESKeystore()
{
  return type metadata accessor for SESKeystore();
}

uint64_t SESKeystore.deinit()
{
  return SESKeystore.deinit();
}

uint64_t type metadata accessor for DIPCertUsage()
{
  return type metadata accessor for DIPCertUsage();
}

uint64_t HPKEEnvelope.params.getter()
{
  return HPKEEnvelope.params.getter();
}

uint64_t LogotypeData.image.getter()
{
  return LogotypeData.image.getter();
}

uint64_t type metadata accessor for LogotypeData()
{
  return type metadata accessor for LogotypeData();
}

uint64_t LogotypeInfo.data.getter()
{
  return LogotypeInfo.data.getter();
}

uint64_t type metadata accessor for LogotypeInfo()
{
  return type metadata accessor for LogotypeInfo();
}

Swift::Void __swiftcall logMilestone(tag:description:)(Swift::String tag, Swift::String description)
{
}

uint64_t HPKESuiteKwV1.openMessageAEAD(cipherText:key:aad:)()
{
  return HPKESuiteKwV1.openMessageAEAD(cipherText:key:aad:)();
}

uint64_t HPKESuiteKwV1.openMessageHPKE<A>(envelope:authenticationContext:decoder:)()
{
  return HPKESuiteKwV1.openMessageHPKE<A>(envelope:authenticationContext:decoder:)();
}

uint64_t HPKESuiteKwV1.init(skR:info:)()
{
  return HPKESuiteKwV1.init(skR:info:)();
}

uint64_t type metadata accessor for HPKESuiteKwV1()
{
  return type metadata accessor for HPKESuiteKwV1();
}

uint64_t type metadata accessor for IDCSAnalytics.NetworkStatus()
{
  return type metadata accessor for IDCSAnalytics.NetworkStatus();
}

uint64_t type metadata accessor for IDCSAnalytics.ConnectionType()
{
  return type metadata accessor for IDCSAnalytics.ConnectionType();
}

uint64_t IDCSAnalytics.NamespaceElement.init(namespace:element:)()
{
  return IDCSAnalytics.NamespaceElement.init(namespace:element:)();
}

uint64_t type metadata accessor for IDCSAnalytics.NamespaceElement()
{
  return type metadata accessor for IDCSAnalytics.NamespaceElement();
}

uint64_t type metadata accessor for IDCSAnalytics.ReaderAuthOutcome()
{
  return type metadata accessor for IDCSAnalytics.ReaderAuthOutcome();
}

uint64_t type metadata accessor for IDCSAnalytics.PayloadValidationReason()
{
  return type metadata accessor for IDCSAnalytics.PayloadValidationReason();
}

uint64_t type metadata accessor for IDCSAnalytics.PayloadValidationResult()
{
  return type metadata accessor for IDCSAnalytics.PayloadValidationResult();
}

uint64_t type metadata accessor for IDCSAnalytics.ReaderAuthFailureReason()
{
  return type metadata accessor for IDCSAnalytics.ReaderAuthFailureReason();
}

uint64_t static IDCSAnalytics.sendLegacyACLUsageEvent(presentmentType:)()
{
  return static IDCSAnalytics.sendLegacyACLUsageEvent(presentmentType:)();
}

uint64_t type metadata accessor for IDCSAnalytics.ElementFallbackAlgorithm()
{
  return type metadata accessor for IDCSAnalytics.ElementFallbackAlgorithm();
}

uint64_t static IDCSAnalytics.sendGarbageCollectedEvent(eventType:count:)()
{
  return static IDCSAnalytics.sendGarbageCollectedEvent(eventType:count:)();
}

uint64_t type metadata accessor for IDCSAnalytics.GarbageCollectionEventType()
{
  return type metadata accessor for IDCSAnalytics.GarbageCollectionEventType();
}

uint64_t static IDCSAnalytics.sendOnlineOCSPOutcomeEvent(docType:outcome:)()
{
  return static IDCSAnalytics.sendOnlineOCSPOutcomeEvent(docType:outcome:)();
}

uint64_t static IDCSAnalytics.sendPayloadValidationEvent(reason:docType:issuer:result:region:issuingJurisdiction:)()
{
  return static IDCSAnalytics.sendPayloadValidationEvent(reason:docType:issuer:result:region:issuingJurisdiction:)();
}

uint64_t static IDCSAnalytics.sendReaderAuthOutcomeEvent(docType:outcome:failureReason:)()
{
  return static IDCSAnalytics.sendReaderAuthOutcomeEvent(docType:outcome:failureReason:)();
}

uint64_t type metadata accessor for IDCSAnalytics.ReaderAuthOnlineOCSPOutcome()
{
  return type metadata accessor for IDCSAnalytics.ReaderAuthOnlineOCSPOutcome();
}

uint64_t static IDCSAnalytics.sendPayloadPortraitSizeEvent(docType:issuer:portraitSizeBytes:)()
{
  return static IDCSAnalytics.sendPayloadPortraitSizeEvent(docType:issuer:portraitSizeBytes:)();
}

uint64_t static IDCSAnalytics.sendPhysicalPresentmentEvent(networkStatus:connectionType:presentmentResult:biometricAuthMethod:terminalAuthPerformed:portraitWasRequested:isAppleReader:)()
{
  return static IDCSAnalytics.sendPhysicalPresentmentEvent(networkStatus:connectionType:presentmentResult:biometricAuthMethod:terminalAuthPerformed:portraitWasRequested:isAppleReader:)();
}

uint64_t static IDCSAnalytics.sendPayloadIngestionSizeEvent(docType:issuer:overallSizeBytes:numberOfPackages:packageSizeBytes:)()
{
  return static IDCSAnalytics.sendPayloadIngestionSizeEvent(docType:issuer:overallSizeBytes:numberOfPackages:packageSizeBytes:)();
}

uint64_t type metadata accessor for IDCSAnalytics.FetchCredentialUUIDsEventResult()
{
  return type metadata accessor for IDCSAnalytics.FetchCredentialUUIDsEventResult();
}

uint64_t static IDCSAnalytics.sendElementFallbackTriggeredEvent(algorithm:from:to:)()
{
  return static IDCSAnalytics.sendElementFallbackTriggeredEvent(algorithm:from:to:)();
}

uint64_t static IDCSAnalytics.sendFetchCredentialUUIDsCalledEvent(result:)()
{
  return static IDCSAnalytics.sendFetchCredentialUUIDsCalledEvent(result:)();
}

uint64_t static IDCSAnalytics.sendPayloadMissingRequiredElementEvent(element:issuer:)()
{
  return static IDCSAnalytics.sendPayloadMissingRequiredElementEvent(element:issuer:)();
}

uint64_t static IDCSAnalytics.sendRequestedElementsNotPermittedEvent(rpIdentifier:isDisplayOnly:notPermittedElements:)()
{
  return static IDCSAnalytics.sendRequestedElementsNotPermittedEvent(rpIdentifier:isDisplayOnly:notPermittedElements:)();
}

uint64_t IDCSAnalytics.PhysicalPresentmentRequestedEventOutcome.description.getter()
{
  return IDCSAnalytics.PhysicalPresentmentRequestedEventOutcome.description.getter();
}

uint64_t type metadata accessor for IDCSAnalytics.PhysicalPresentmentRequestedEventOutcome()
{
  return type metadata accessor for IDCSAnalytics.PhysicalPresentmentRequestedEventOutcome();
}

uint64_t static IDCSAnalytics.sendUnknownLogotypeHashAlgorithmIdentifier(_:)()
{
  return static IDCSAnalytics.sendUnknownLogotypeHashAlgorithmIdentifier(_:)();
}

uint64_t type metadata accessor for IDCSAnalytics()
{
  return type metadata accessor for IDCSAnalytics();
}

uint64_t static IDCSSignposts.databaseFetchAuthACL.getter()
{
  return static IDCSSignposts.databaseFetchAuthACL.getter();
}

uint64_t static IDCSSignposts.consistencyCheckTotal.getter()
{
  return static IDCSSignposts.consistencyCheckTotal.getter();
}

uint64_t static IDCSSignposts.databaseDeleteAuthACL.getter()
{
  return static IDCSSignposts.databaseDeleteAuthACL.getter();
}

uint64_t static IDCSSignposts.presentmentReaderAuth.getter()
{
  return static IDCSSignposts.presentmentReaderAuth.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredential.getter()
{
  return static IDCSSignposts.databaseFetchCredential.getter();
}

uint64_t static IDCSSignposts.ckmFetchSESProgenitorKey.getter()
{
  return static IDCSSignposts.ckmFetchSESProgenitorKey.getter();
}

uint64_t static IDCSSignposts.consistencyCheckPayloads.getter()
{
  return static IDCSSignposts.consistencyCheckPayloads.getter();
}

uint64_t static IDCSSignposts.databaseFetchAllAuthACLs.getter()
{
  return static IDCSSignposts.databaseFetchAllAuthACLs.getter();
}

uint64_t static IDCSSignposts.presentmentBuildProposal.getter()
{
  return static IDCSSignposts.presentmentBuildProposal.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponse.getter()
{
  return static IDCSSignposts.presentmentBuildResponse.getter();
}

uint64_t static IDCSSignposts.ckmFetchSESPresentmentKey.getter()
{
  return static IDCSSignposts.ckmFetchSESPresentmentKey.getter();
}

uint64_t static IDCSSignposts.databaseFetchAllSEKeySlots.getter()
{
  return static IDCSSignposts.databaseFetchAllSEKeySlots.getter();
}

uint64_t static IDCSSignposts.presentmentEncryptResponse.getter()
{
  return static IDCSSignposts.presentmentEncryptResponse.getter();
}

uint64_t static IDCSSignposts.ckmGenerateSESProgenitorKey.getter()
{
  return static IDCSSignposts.ckmGenerateSESProgenitorKey.getter();
}

uint64_t static IDCSSignposts.databaseFetchActiveDocTypes.getter()
{
  return static IDCSSignposts.databaseFetchActiveDocTypes.getter();
}

uint64_t static IDCSSignposts.databaseFetchAllCredentials.getter()
{
  return static IDCSSignposts.databaseFetchAllCredentials.getter();
}

uint64_t static IDCSSignposts.databaseFetchPrearmTrustKey.getter()
{
  return static IDCSSignposts.databaseFetchPrearmTrustKey.getter();
}

uint64_t static IDCSSignposts.presentmentDeriveSessionKey.getter()
{
  return static IDCSSignposts.presentmentDeriveSessionKey.getter();
}

uint64_t static IDCSSignposts.presentmentInterpretRequest.getter()
{
  return static IDCSSignposts.presentmentInterpretRequest.getter();
}

uint64_t static IDCSSignposts.ckmGenerateSESPresentmentKey.getter()
{
  return static IDCSSignposts.ckmGenerateSESPresentmentKey.getter();
}

uint64_t static IDCSSignposts.databaseDeletePrearmTrustKey.getter()
{
  return static IDCSSignposts.databaseDeletePrearmTrustKey.getter();
}

uint64_t static IDCSSignposts.presentmentBuildErrorResponse.getter()
{
  return static IDCSSignposts.presentmentBuildErrorResponse.getter();
}

uint64_t static IDCSSignposts.consistencyCheckKeySigningKeys.getter()
{
  return static IDCSSignposts.consistencyCheckKeySigningKeys.getter();
}

uint64_t static IDCSSignposts.presentmentDecodeReaderRequest.getter()
{
  return static IDCSSignposts.presentmentDecodeReaderRequest.getter();
}

uint64_t static IDCSSignposts.storageGeneratePresentmentKeys.getter()
{
  return static IDCSSignposts.storageGeneratePresentmentKeys.getter();
}

uint64_t static IDCSSignposts.consistencyCheckPresentmentKeys.getter()
{
  return static IDCSSignposts.consistencyCheckPresentmentKeys.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredentialInStates.getter()
{
  return static IDCSSignposts.databaseFetchCredentialInStates.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponsePayload.getter()
{
  return static IDCSSignposts.presentmentBuildResponsePayload.getter();
}

uint64_t static IDCSSignposts.presentmentDecryptReaderRequest.getter()
{
  return static IDCSSignposts.presentmentDecryptReaderRequest.getter();
}

uint64_t static IDCSSignposts.presentmentGenerateTransportKey.getter()
{
  return static IDCSSignposts.presentmentGenerateTransportKey.getter();
}

uint64_t static IDCSSignposts.storageGenerateSESPresentmentKey.getter()
{
  return static IDCSSignposts.storageGenerateSESPresentmentKey.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredentialIdentifiers.getter()
{
  return static IDCSSignposts.databaseFetchCredentialIdentifiers.getter();
}

uint64_t static IDCSSignposts.storagePrepareProgenitorKeyMetadata.getter()
{
  return static IDCSSignposts.storagePrepareProgenitorKeyMetadata.getter();
}

uint64_t static IDCSSignposts.consistencyCheckDeviceEncryptionKeys.getter()
{
  return static IDCSSignposts.consistencyCheckDeviceEncryptionKeys.getter();
}

uint64_t static IDCSSignposts.presentmentDecodeSessionEstablishment.getter()
{
  return static IDCSSignposts.presentmentDecodeSessionEstablishment.getter();
}

uint64_t static IDCSSignposts.databaseFetchActiveRegionsInPartitions.getter()
{
  return static IDCSSignposts.databaseFetchActiveRegionsInPartitions.getter();
}

uint64_t static IDCSSignposts.databaseFetchActiveCredentialsByDocType.getter()
{
  return static IDCSSignposts.databaseFetchActiveCredentialsByDocType.getter();
}

uint64_t static IDCSSignposts.databaseFetchAllInactivePresentmentKeys.getter()
{
  return static IDCSSignposts.databaseFetchAllInactivePresentmentKeys.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponseSignDeviceDataSES.getter()
{
  return static IDCSSignposts.presentmentBuildResponseSignDeviceDataSES.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredentialIdentifiersByDocType.getter()
{
  return static IDCSSignposts.databaseFetchCredentialIdentifiersByDocType.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponsePayloadDeviceSigned.getter()
{
  return static IDCSSignposts.presentmentBuildResponsePayloadDeviceSigned.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponsePayloadIssuerSigned.getter()
{
  return static IDCSSignposts.presentmentBuildResponsePayloadIssuerSigned.getter();
}

uint64_t static IDCSSignposts.databaseFetchAllInactiveDeviceEncryptionKeys.getter()
{
  return static IDCSSignposts.databaseFetchAllInactiveDeviceEncryptionKeys.getter();
}

uint64_t static IDCSSignposts.presentmentBuildResponseSignDeviceDataLegacySE.getter()
{
  return static IDCSSignposts.presentmentBuildResponseSignDeviceDataLegacySE.getter();
}

uint64_t static IDCSSignposts.databaseFetchActiveCredentialsByDocTypeAndRegion.getter()
{
  return static IDCSSignposts.databaseFetchActiveCredentialsByDocTypeAndRegion.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredentialIdentifiersByDocTypeAndRegion.getter()
{
  return static IDCSSignposts.databaseFetchCredentialIdentifiersByDocTypeAndRegion.getter();
}

uint64_t static IDCSSignposts.databaseFetchCredentialIdentifiersForPublicKeyIdentifier.getter()
{
  return static IDCSSignposts.databaseFetchCredentialIdentifiersForPublicKeyIdentifier.getter();
}

uint64_t LogotypeImage.imageDetails.getter()
{
  return LogotypeImage.imageDetails.getter();
}

uint64_t type metadata accessor for LogotypeImage()
{
  return type metadata accessor for LogotypeImage();
}

uint64_t SealedMessage.unencryptedData.getter()
{
  return SealedMessage.unencryptedData.getter();
}

uint64_t SealedMessage.data.getter()
{
  return SealedMessage.data.getter();
}

uint64_t SealedMessage.keyID.getter()
{
  return SealedMessage.keyID.getter();
}

uint64_t static StoredAuthACL.fetchRequest()()
{
  return static StoredAuthACL.fetchRequest()();
}

uint64_t type metadata accessor for StoredAuthACL()
{
  return type metadata accessor for StoredAuthACL();
}

uint64_t static StoredPayload.fetchRequest()()
{
  return static StoredPayload.fetchRequest()();
}

uint64_t type metadata accessor for StoredPayload()
{
  return type metadata accessor for StoredPayload();
}

uint64_t defaultLogger()()
{
  return defaultLogger()();
}

Swift::Void __swiftcall DIPOIDVerifier.setTrustedRoots(_:)(Swift::OpaquePointer a1)
{
}

uint64_t static DIPOIDVerifier.getSpecificCertificateError(_:)()
{
  return static DIPOIDVerifier.getSpecificCertificateError(_:)();
}

uint64_t DIPOIDVerifier.init()()
{
  return DIPOIDVerifier.init()();
}

uint64_t type metadata accessor for DIPOIDVerifier()
{
  return type metadata accessor for DIPOIDVerifier();
}

uint64_t DIPRecordError(_:message:log:)()
{
  return DIPRecordError(_:message:log:)();
}

uint64_t type metadata accessor for HPKEPrivateKey()
{
  return type metadata accessor for HPKEPrivateKey();
}

uint64_t dispatch thunk of NetworkMonitor.currentPath.getter()
{
  return dispatch thunk of NetworkMonitor.currentPath.getter();
}

uint64_t static NetworkMonitor.shared.getter()
{
  return static NetworkMonitor.shared.getter();
}

uint64_t type metadata accessor for NetworkMonitor()
{
  return type metadata accessor for NetworkMonitor();
}

uint64_t static StoredTrustKey.fetchRequest()()
{
  return static StoredTrustKey.fetchRequest()();
}

uint64_t type metadata accessor for StoredTrustKey()
{
  return type metadata accessor for StoredTrustKey();
}

uint64_t AnyCodableArray.init(value:)()
{
  return AnyCodableArray.init(value:)();
}

uint64_t AnyCodableArray.asNSArray()()
{
  return AnyCodableArray.asNSArray()();
}

uint64_t type metadata accessor for AnyCodableArray()
{
  return type metadata accessor for AnyCodableArray();
}

uint64_t AppleIDVManager.init()()
{
  return AppleIDVManager.init()();
}

uint64_t type metadata accessor for AppleIDVManager()
{
  return type metadata accessor for AppleIDVManager();
}

uint64_t CBOREncodedCBOR.init(value:tag:encoder:)()
{
  return CBOREncodedCBOR.init(value:tag:encoder:)();
}

uint64_t CBOREncodedCBOR.value.getter()
{
  return CBOREncodedCBOR.value.getter();
}

uint64_t CBOREncodedCBOR.dataValue.getter()
{
  return CBOREncodedCBOR.dataValue.getter();
}

uint64_t CBOREncodedCBOR.init(_:dataValue:decoder:)()
{
  return CBOREncodedCBOR.init(_:dataValue:decoder:)();
}

uint64_t ISO18013Package.version.getter()
{
  return ISO18013Package.version.getter();
}

uint64_t ISO18013Package.Document.issuerAuth.getter()
{
  return ISO18013Package.Document.issuerAuth.getter();
}

uint64_t ISO18013Package.Document.namespaces.getter()
{
  return ISO18013Package.Document.namespaces.getter();
}

uint64_t type metadata accessor for ISO18013Package.Document()
{
  return type metadata accessor for ISO18013Package.Document();
}

uint64_t ISO18013Package.documents.getter()
{
  return ISO18013Package.documents.getter();
}

uint64_t type metadata accessor for ISO18013Package()
{
  return type metadata accessor for ISO18013Package();
}

uint64_t LogotypeDetails.logotypes.getter()
{
  return LogotypeDetails.logotypes.getter();
}

uint64_t type metadata accessor for LogotypeDetails()
{
  return type metadata accessor for LogotypeDetails();
}

uint64_t type metadata accessor for MobileAssetType()
{
  return type metadata accessor for MobileAssetType();
}

uint64_t static StoredCryptoKey.fetchRequest()()
{
  return static StoredCryptoKey.fetchRequest()();
}

uint64_t type metadata accessor for StoredCryptoKey()
{
  return type metadata accessor for StoredCryptoKey();
}

Swift::Bool __swiftcall isInternalBuild()()
{
  return isInternalBuild()();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareACL(aclType:aclUsage:bioUUID:)()
{
  return dispatch thunk of AppleIDVManaging.prepareACL(aclType:aclUsage:bioUUID:)();
}

uint64_t dispatch thunk of AppleIDVManaging.persistACLBlob(_:requiresDoublePress:)()
{
  return dispatch thunk of AppleIDVManaging.persistACLBlob(_:requiresDoublePress:)();
}

uint64_t dispatch thunk of AppleIDVManaging.getUUIDsFromACL(_:)()
{
  return dispatch thunk of AppleIDVManaging.getUUIDsFromACL(_:)();
}

uint64_t dispatch thunk of AppleIDVManaging.prearmCredential(withAuthorizationToken:protectedPublicKey:)()
{
  return dispatch thunk of AppleIDVManaging.prearmCredential(withAuthorizationToken:protectedPublicKey:)();
}

uint64_t dispatch thunk of AppleIDVManaging.generatePhoneToken(withNonce:aclBlob:keyBlob:keyAttestation:casdCertificate:)()
{
  return dispatch thunk of AppleIDVManaging.generatePhoneToken(withNonce:aclBlob:keyBlob:keyAttestation:casdCertificate:)();
}

uint64_t dispatch thunk of AppleIDVManaging.establishPrearmTrust(baaCertificate:)()
{
  return dispatch thunk of AppleIDVManaging.establishPrearmTrust(baaCertificate:)();
}

uint64_t dispatch thunk of AppleIDVManaging.generateNonceOnWatch()()
{
  return dispatch thunk of AppleIDVManaging.generateNonceOnWatch()();
}

uint64_t dispatch thunk of AppleIDVManaging.persistModifiedACLBlob(_:referenceACLBlob:externalizedLAContext:)()
{
  return dispatch thunk of AppleIDVManaging.persistModifiedACLBlob(_:referenceACLBlob:externalizedLAContext:)();
}

uint64_t dispatch thunk of AppleIDVManaging.recoverPersistedACLBlob(from:)()
{
  return dispatch thunk of AppleIDVManaging.recoverPersistedACLBlob(from:)();
}

uint64_t dispatch thunk of AppleIDVManaging.requireDoublePressOnACL(_:)()
{
  return dispatch thunk of AppleIDVManaging.requireDoublePressOnACL(_:)();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareUnboundACLForWatch(withAccessibilityEnabled:)()
{
  return dispatch thunk of AppleIDVManaging.prepareUnboundACLForWatch(withAccessibilityEnabled:)();
}

uint64_t dispatch thunk of AppleIDVManaging.prepareBioBindingUnboundACL()()
{
  return dispatch thunk of AppleIDVManaging.prepareBioBindingUnboundACL()();
}

uint64_t dispatch thunk of AppleIDVManaging.updatePrearmTrustKeyforWatch(inKeyBlob:prognitorPublicKey:)()
{
  return dispatch thunk of AppleIDVManaging.updatePrearmTrustKeyforWatch(inKeyBlob:prognitorPublicKey:)();
}

uint64_t dispatch thunk of AppleIDVManaging.authorizePresentmentForSignature(aclBlob:externalizedLAContext:seSlot:payloadDigest:)()
{
  return dispatch thunk of AppleIDVManaging.authorizePresentmentForSignature(aclBlob:externalizedLAContext:seSlot:payloadDigest:)();
}

uint64_t dispatch thunk of AppleIDVManaging.preparePasscodeBindingUnboundACL()()
{
  return dispatch thunk of AppleIDVManaging.preparePasscodeBindingUnboundACL()();
}

uint64_t dispatch thunk of AppleIDVManaging.revokeCredentialAuthorizationToken()()
{
  return dispatch thunk of AppleIDVManaging.revokeCredentialAuthorizationToken()();
}

uint64_t dispatch thunk of AppleIDVManaging.credentialAuthenticationTokenStatus()()
{
  return dispatch thunk of AppleIDVManaging.credentialAuthenticationTokenStatus()();
}

uint64_t dispatch thunk of AppleIDVManaging.generatePrearmTrustKeyforWatchAndCopyPublicKey(nonce:prognitorPublicKey:)()
{
  return dispatch thunk of AppleIDVManaging.generatePrearmTrustKeyforWatchAndCopyPublicKey(nonce:prognitorPublicKey:)();
}

uint64_t dispatch thunk of BiometricsHelper.biometricType.getter()
{
  return dispatch thunk of BiometricsHelper.biometricType.getter();
}

uint64_t dispatch thunk of BiometricsHelper.requiresDoublePress.getter()
{
  return dispatch thunk of BiometricsHelper.requiresDoublePress.getter();
}

uint64_t BiometricsHelper.init()()
{
  return BiometricsHelper.init()();
}

uint64_t type metadata accessor for BiometricsHelper()
{
  return type metadata accessor for BiometricsHelper();
}

uint64_t EncryptionParams.keyAgreement.getter()
{
  return EncryptionParams.keyAgreement.getter();
}

uint64_t type metadata accessor for EncryptionParams()
{
  return type metadata accessor for EncryptionParams();
}

uint64_t ISO18013Response.DeviceAuth.init(deviceSignature:deviceMac:)()
{
  return ISO18013Response.DeviceAuth.init(deviceSignature:deviceMac:)();
}

uint64_t type metadata accessor for ISO18013Response.DeviceAuth()
{
  return type metadata accessor for ISO18013Response.DeviceAuth();
}

uint64_t ISO18013Response.DeviceSigned.init(namespaces:deviceAuth:)()
{
  return ISO18013Response.DeviceSigned.init(namespaces:deviceAuth:)();
}

uint64_t type metadata accessor for ISO18013Response.DeviceSigned()
{
  return type metadata accessor for ISO18013Response.DeviceSigned();
}

uint64_t ISO18013Response.IssuerSigned.init(namespaces:issuerAuth:)()
{
  return ISO18013Response.IssuerSigned.init(namespaces:issuerAuth:)();
}

uint64_t type metadata accessor for ISO18013Response.IssuerSigned()
{
  return type metadata accessor for ISO18013Response.IssuerSigned();
}

uint64_t static ISO18013Response.supportedVersion.getter()
{
  return static ISO18013Response.supportedVersion.getter();
}

uint64_t type metadata accessor for ISO18013Response.Status()
{
  return type metadata accessor for ISO18013Response.Status();
}

uint64_t ISO18013Response.init(version:documents:documentErrors:status:)()
{
  return ISO18013Response.init(version:documents:documentErrors:status:)();
}

uint64_t ISO18013Response.Document.init(docType:issuerSigned:deviceSigned:errors:)()
{
  return ISO18013Response.Document.init(docType:issuerSigned:deviceSigned:errors:)();
}

uint64_t type metadata accessor for ISO18013Response.Document()
{
  return type metadata accessor for ISO18013Response.Document();
}

uint64_t type metadata accessor for ISO18013Response()
{
  return type metadata accessor for ISO18013Response();
}

uint64_t SEPairingManager.init()()
{
  return SEPairingManager.init()();
}

uint64_t type metadata accessor for SEPairingManager()
{
  return type metadata accessor for SEPairingManager();
}

uint64_t static StoredCredential.fetchRequest()()
{
  return static StoredCredential.fetchRequest()();
}

uint64_t type metadata accessor for StoredCredential()
{
  return type metadata accessor for StoredCredential();
}

uint64_t errorFromCFError(_:_:_:)()
{
  return errorFromCFError(_:_:_:)();
}

uint64_t setDefaultLogger(_:)()
{
  return setDefaultLogger(_:)();
}

uint64_t CredentialKeyType.init(rawValue:)()
{
  return CredentialKeyType.init(rawValue:)();
}

uint64_t CredentialKeyType.rawValue.getter()
{
  return CredentialKeyType.rawValue.getter();
}

uint64_t type metadata accessor for CredentialKeyType()
{
  return type metadata accessor for CredentialKeyType();
}

uint64_t DeviceIdentityKey.certificates.getter()
{
  return DeviceIdentityKey.certificates.getter();
}

uint64_t DeviceIdentityKey.key.getter()
{
  return DeviceIdentityKey.key.getter();
}

uint64_t type metadata accessor for DeviceIdentityKey()
{
  return type metadata accessor for DeviceIdentityKey();
}

Swift::Void __swiftcall debugLogFootprint(_:)(Swift::String a1)
{
}

uint64_t decodeCertificate(fromDER:)()
{
  return decodeCertificate(fromDER:)();
}

uint64_t CredentialKeyUsage.init(rawValue:)()
{
  return CredentialKeyUsage.init(rawValue:)();
}

uint64_t CredentialKeyUsage.rawValue.getter()
{
  return CredentialKeyUsage.rawValue.getter();
}

uint64_t type metadata accessor for CredentialKeyUsage()
{
  return type metadata accessor for CredentialKeyUsage();
}

uint64_t KeyAgreementParams.recipientFingerprint.getter()
{
  return KeyAgreementParams.recipientFingerprint.getter();
}

uint64_t type metadata accessor for KeyAgreementParams()
{
  return type metadata accessor for KeyAgreementParams();
}

uint64_t MobileAssetManager.init()()
{
  return MobileAssetManager.init()();
}

uint64_t type metadata accessor for MobileAssetManager()
{
  return type metadata accessor for MobileAssetManager();
}

uint64_t type metadata accessor for PublicKeyAlgorithm()
{
  return type metadata accessor for PublicKeyAlgorithm();
}

uint64_t static StoredRelyingParty.fetchRequest()()
{
  return static StoredRelyingParty.fetchRequest()();
}

uint64_t type metadata accessor for StoredRelyingParty()
{
  return type metadata accessor for StoredRelyingParty();
}

uint64_t type metadata accessor for AlgorithmIdentifier()
{
  return type metadata accessor for AlgorithmIdentifier();
}

uint64_t FeatureFlagProvider.init()()
{
  return FeatureFlagProvider.init()();
}

uint64_t type metadata accessor for FeatureFlagProvider()
{
  return type metadata accessor for FeatureFlagProvider();
}

uint64_t ISO18013SessionData.init(data:status:)()
{
  return ISO18013SessionData.init(data:status:)();
}

uint64_t type metadata accessor for ISO18013SessionData.Status()
{
  return type metadata accessor for ISO18013SessionData.Status();
}

uint64_t type metadata accessor for ISO18013SessionData()
{
  return type metadata accessor for ISO18013SessionData();
}

uint64_t static RFC8152SigStructure.protectedHeaderAlg.getter()
{
  return static RFC8152SigStructure.protectedHeaderAlg.getter();
}

uint64_t RFC8152SigStructure.init(protected:payload:)()
{
  return RFC8152SigStructure.init(protected:payload:)();
}

uint64_t type metadata accessor for RFC8152SigStructure()
{
  return type metadata accessor for RFC8152SigStructure();
}

uint64_t AnyCodableDictionary.asNSDictionary()()
{
  return AnyCodableDictionary.asNSDictionary()();
}

uint64_t AnyCodableDictionary.init(value:)()
{
  return AnyCodableDictionary.init(value:)();
}

uint64_t type metadata accessor for AnyCodableDictionary()
{
  return type metadata accessor for AnyCodableDictionary();
}

uint64_t dispatch thunk of FeatureFlagProviding.isEnabled(_:)()
{
  return dispatch thunk of FeatureFlagProviding.isEnabled(_:)();
}

uint64_t static ISO18013JumboPackage.supportedJumboPackageVersion.getter()
{
  return static ISO18013JumboPackage.supportedJumboPackageVersion.getter();
}

uint64_t ISO18013JumboPackage.init(version:packages:)()
{
  return ISO18013JumboPackage.init(version:packages:)();
}

uint64_t ISO18013JumboPackage.packages.getter()
{
  return ISO18013JumboPackage.packages.getter();
}

uint64_t type metadata accessor for ISO18013JumboPackage()
{
  return type metadata accessor for ISO18013JumboPackage();
}

uint64_t type metadata accessor for DIPECIESSessionECV3SH()
{
  return type metadata accessor for DIPECIESSessionECV3SH();
}

uint64_t DIPECIESSessionECV3SH.init(_:)()
{
  return DIPECIESSessionECV3SH.init(_:)();
}

uint64_t DeviceIdentityOptions.init(validityMinutes:isDecryptionKey:aclData:)()
{
  return DeviceIdentityOptions.init(validityMinutes:isDecryptionKey:aclData:)();
}

uint64_t type metadata accessor for DeviceIdentityOptions()
{
  return type metadata accessor for DeviceIdentityOptions();
}

uint64_t type metadata accessor for EnrolledBiometricType()
{
  return type metadata accessor for EnrolledBiometricType();
}

uint64_t ISO18013KnownDocTypes.init(rawValue:)()
{
  return ISO18013KnownDocTypes.init(rawValue:)();
}

uint64_t ISO18013KnownDocTypes.rawValue.getter()
{
  return ISO18013KnownDocTypes.rawValue.getter();
}

uint64_t type metadata accessor for ISO18013KnownDocTypes()
{
  return type metadata accessor for ISO18013KnownDocTypes();
}

uint64_t ISO18013ReaderRequest.DocRequest.itemsRequest.getter()
{
  return ISO18013ReaderRequest.DocRequest.itemsRequest.getter();
}

uint64_t ISO18013ReaderRequest.DocRequest.readerAuth.getter()
{
  return ISO18013ReaderRequest.DocRequest.readerAuth.getter();
}

uint64_t type metadata accessor for ISO18013ReaderRequest.DocRequest()
{
  return type metadata accessor for ISO18013ReaderRequest.DocRequest();
}

uint64_t ISO18013ReaderRequest.ItemsRequest.namespaces.getter()
{
  return ISO18013ReaderRequest.ItemsRequest.namespaces.getter();
}

uint64_t ISO18013ReaderRequest.ItemsRequest.requestInfo.getter()
{
  return ISO18013ReaderRequest.ItemsRequest.requestInfo.getter();
}

uint64_t ISO18013ReaderRequest.ItemsRequest.docType.getter()
{
  return ISO18013ReaderRequest.ItemsRequest.docType.getter();
}

uint64_t type metadata accessor for ISO18013ReaderRequest.ItemsRequest()
{
  return type metadata accessor for ISO18013ReaderRequest.ItemsRequest();
}

uint64_t ISO18013ReaderRequest.docRequests.getter()
{
  return ISO18013ReaderRequest.docRequests.getter();
}

uint64_t ISO18013ReaderRequest.version.getter()
{
  return ISO18013ReaderRequest.version.getter();
}

uint64_t type metadata accessor for ISO18013ReaderRequest()
{
  return type metadata accessor for ISO18013ReaderRequest();
}

uint64_t computeISO18013Digest(algorithm:data:)()
{
  return computeISO18013Digest(algorithm:data:)();
}

uint64_t COSESignatureValidator.validateSignature(signature:publicKeyData:publicKeyAlgorithm:algorithmIdentifier:payload:)()
{
  return COSESignatureValidator.validateSignature(signature:publicKeyData:publicKeyAlgorithm:algorithmIdentifier:payload:)();
}

uint64_t COSESignatureValidator.init(errorCodeUnknownAlgorithm:errorCodeInvalidPublicKey:errorCodeMisformattedSignature:errorCodeInvalidSignature:)()
{
  return COSESignatureValidator.init(errorCodeUnknownAlgorithm:errorCodeInvalidPublicKey:errorCodeMisformattedSignature:errorCodeInvalidSignature:)();
}

uint64_t type metadata accessor for COSESignatureValidator()
{
  return type metadata accessor for COSESignatureValidator();
}

uint64_t DeviceIdentityKeystore.init()()
{
  return DeviceIdentityKeystore.init()();
}

uint64_t type metadata accessor for DeviceIdentityKeystore()
{
  return type metadata accessor for DeviceIdentityKeystore();
}

uint64_t EncryptedDataContainer.getUnencryptedData(alg:decryptor:senderSigningKey:recipientSigningKey:)()
{
  return EncryptedDataContainer.getUnencryptedData(alg:decryptor:senderSigningKey:recipientSigningKey:)();
}

uint64_t decodeCertificateChain(fromBase64DER:)()
{
  return decodeCertificateChain(fromBase64DER:)();
}

uint64_t decodeCertificateChain(fromDER:)()
{
  return decodeCertificateChain(fromDER:)();
}

uint64_t ISO18013CodingKeyFormat.rawValue.getter()
{
  return ISO18013CodingKeyFormat.rawValue.getter();
}

uint64_t type metadata accessor for ISO18013CodingKeyFormat()
{
  return type metadata accessor for ISO18013CodingKeyFormat();
}

uint64_t ISO18013DigestAlgorithm.init(rawValue:)()
{
  return ISO18013DigestAlgorithm.init(rawValue:)();
}

uint64_t type metadata accessor for ISO18013DigestAlgorithm()
{
  return type metadata accessor for ISO18013DigestAlgorithm();
}

uint64_t ISO18013KnownNamespaces.rawValue.getter()
{
  return ISO18013KnownNamespaces.rawValue.getter();
}

uint64_t type metadata accessor for ISO18013KnownNamespaces()
{
  return type metadata accessor for ISO18013KnownNamespaces();
}

uint64_t type metadata accessor for ISO18013PresentmentType()
{
  return type metadata accessor for ISO18013PresentmentType();
}

uint64_t type metadata accessor for StoredCredentialOptions()
{
  return type metadata accessor for StoredCredentialOptions();
}

uint64_t ISO18013IssuerSignedItem.elementValue.getter()
{
  return ISO18013IssuerSignedItem.elementValue.getter();
}

uint64_t ISO18013IssuerSignedItem.elementIdentifier.getter()
{
  return ISO18013IssuerSignedItem.elementIdentifier.getter();
}

uint64_t ISO18013IssuerSignedItem.random.getter()
{
  return ISO18013IssuerSignedItem.random.getter();
}

uint64_t ISO18013IssuerSignedItem.init(digestID:random:elementIdentifier:elementValue:)()
{
  return ISO18013IssuerSignedItem.init(digestID:random:elementIdentifier:elementValue:)();
}

uint64_t ISO18013IssuerSignedItem.digestID.getter()
{
  return ISO18013IssuerSignedItem.digestID.getter();
}

uint64_t type metadata accessor for ISO18013IssuerSignedItem()
{
  return type metadata accessor for ISO18013IssuerSignedItem();
}

uint64_t ISO18013SessionCryptarch.deriveSessionKeys(sessionTranscript:ikm:)()
{
  return ISO18013SessionCryptarch.deriveSessionKeys(sessionTranscript:ikm:)();
}

uint64_t ISO18013SessionCryptarch.setRemoteKey(_:)()
{
  return ISO18013SessionCryptarch.setRemoteKey(_:)();
}

uint64_t ISO18013SessionCryptarch.isReadyForEncryption.getter()
{
  return ISO18013SessionCryptarch.isReadyForEncryption.getter();
}

uint64_t type metadata accessor for ISO18013SessionCryptarch.Role()
{
  return type metadata accessor for ISO18013SessionCryptarch.Role();
}

uint64_t ISO18013SessionCryptarch.init(role:curve:variant:localKey:)()
{
  return ISO18013SessionCryptarch.init(role:curve:variant:localKey:)();
}

uint64_t ISO18013SessionCryptarch.init(role:variant:curve:)()
{
  return ISO18013SessionCryptarch.init(role:variant:curve:)();
}

uint64_t type metadata accessor for ISO18013SessionCryptarch.Curve()
{
  return type metadata accessor for ISO18013SessionCryptarch.Curve();
}

uint64_t type metadata accessor for ISO18013SessionCryptarch.Variant()
{
  return type metadata accessor for ISO18013SessionCryptarch.Variant();
}

uint64_t ISO18013SessionCryptarch.decrypt(data:)()
{
  return ISO18013SessionCryptarch.decrypt(data:)();
}

uint64_t ISO18013SessionCryptarch.encrypt(data:)()
{
  return ISO18013SessionCryptarch.encrypt(data:)();
}

uint64_t ISO18013SessionCryptarch.publicKey.getter()
{
  return ISO18013SessionCryptarch.publicKey.getter();
}

uint64_t type metadata accessor for ISO18013SessionCryptarch()
{
  return type metadata accessor for ISO18013SessionCryptarch();
}

uint64_t DeviceInformationProvider.init()()
{
  return DeviceInformationProvider.init()();
}

uint64_t type metadata accessor for DeviceInformationProvider()
{
  return type metadata accessor for DeviceInformationProvider();
}

uint64_t HPKEEncryptedMessagePlain.open(with:authenticationContext:)()
{
  return HPKEEncryptedMessagePlain.open(with:authenticationContext:)();
}

uint64_t ISO18013SessionTranscript.appleSessionTranscript.getter()
{
  return ISO18013SessionTranscript.appleSessionTranscript.getter();
}

uint64_t type metadata accessor for ISO18013SessionTranscript()
{
  return type metadata accessor for ISO18013SessionTranscript();
}

uint64_t dispatch thunk of DeviceInformationProviding.isPhone.getter()
{
  return dispatch thunk of DeviceInformationProviding.isPhone.getter();
}

uint64_t static SharedInternalDefaultsKeys.issuerValidationLogOnly.getter()
{
  return static SharedInternalDefaultsKeys.issuerValidationLogOnly.getter();
}

uint64_t type metadata accessor for DIPBackgroundDeferralStatus()
{
  return type metadata accessor for DIPBackgroundDeferralStatus();
}

uint64_t DIPBackgroundActivityManager.registerActivity(identifier:activity:)()
{
  return DIPBackgroundActivityManager.registerActivity(identifier:activity:)();
}

uint64_t static DIPBackgroundActivityManager.sharedInstance.getter()
{
  return static DIPBackgroundActivityManager.sharedInstance.getter();
}

uint64_t type metadata accessor for DIPBackgroundActivityManager()
{
  return type metadata accessor for DIPBackgroundActivityManager();
}

uint64_t ISO18013DeviceAuthentication.init(sessionTranscript:docType:deviceNamespaceBytes:)()
{
  return ISO18013DeviceAuthentication.init(sessionTranscript:docType:deviceNamespaceBytes:)();
}

uint64_t type metadata accessor for ISO18013DeviceAuthentication()
{
  return type metadata accessor for ISO18013DeviceAuthentication();
}

uint64_t ISO18013MobileSecurityObject.ValidityInfo.validUntil.getter()
{
  return ISO18013MobileSecurityObject.ValidityInfo.validUntil.getter();
}

uint64_t ISO18013MobileSecurityObject.ValidityInfo.validFrom.getter()
{
  return ISO18013MobileSecurityObject.ValidityInfo.validFrom.getter();
}

uint64_t type metadata accessor for ISO18013MobileSecurityObject.ValidityInfo()
{
  return type metadata accessor for ISO18013MobileSecurityObject.ValidityInfo();
}

uint64_t ISO18013MobileSecurityObject.validityInfo.getter()
{
  return ISO18013MobileSecurityObject.validityInfo.getter();
}

uint64_t ISO18013MobileSecurityObject.valueDigests.getter()
{
  return ISO18013MobileSecurityObject.valueDigests.getter();
}

uint64_t ISO18013MobileSecurityObject.DeviceKeyInfo.deviceKey.getter()
{
  return ISO18013MobileSecurityObject.DeviceKeyInfo.deviceKey.getter();
}

uint64_t type metadata accessor for ISO18013MobileSecurityObject.DeviceKeyInfo()
{
  return type metadata accessor for ISO18013MobileSecurityObject.DeviceKeyInfo();
}

uint64_t ISO18013MobileSecurityObject.deviceKeyInfo.getter()
{
  return ISO18013MobileSecurityObject.deviceKeyInfo.getter();
}

uint64_t ISO18013MobileSecurityObject.digestAlgorithm.getter()
{
  return ISO18013MobileSecurityObject.digestAlgorithm.getter();
}

uint64_t ISO18013MobileSecurityObject.docType.getter()
{
  return ISO18013MobileSecurityObject.docType.getter();
}

uint64_t ISO18013MobileSecurityObject.version.getter()
{
  return ISO18013MobileSecurityObject.version.getter();
}

uint64_t type metadata accessor for ISO18013MobileSecurityObject()
{
  return type metadata accessor for ISO18013MobileSecurityObject();
}

uint64_t ISO18013ReaderAuthentication.init(sessionTranscript:itemsRequestBytes:)()
{
  return ISO18013ReaderAuthentication.init(sessionTranscript:itemsRequestBytes:)();
}

uint64_t type metadata accessor for ISO18013ReaderAuthentication()
{
  return type metadata accessor for ISO18013ReaderAuthentication();
}

uint64_t ISO18013SessionEstablishment.data.getter()
{
  return ISO18013SessionEstablishment.data.getter();
}

uint64_t ISO18013SessionEstablishment.readerKey.getter()
{
  return ISO18013SessionEstablishment.readerKey.getter();
}

uint64_t type metadata accessor for ISO18013SessionEstablishment()
{
  return type metadata accessor for ISO18013SessionEstablishment();
}

uint64_t ISO23220_1_ElementIdentifier.rawValue.getter()
{
  return ISO23220_1_ElementIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for ISO23220_1_ElementIdentifier()
{
  return type metadata accessor for ISO23220_1_ElementIdentifier();
}

Swift::Bool __swiftcall shouldIncludeUnencryptedData()()
{
  return shouldIncludeUnencryptedData()();
}

uint64_t HPKEEncryptedMessageAlgorithm.algorithm.getter()
{
  return HPKEEncryptedMessageAlgorithm.algorithm.getter();
}

uint64_t type metadata accessor for HPKEEncryptedMessageAlgorithm()
{
  return type metadata accessor for HPKEEncryptedMessageAlgorithm();
}

uint64_t type metadata accessor for ISO18013AppleSessionTranscript()
{
  return type metadata accessor for ISO18013AppleSessionTranscript();
}

uint64_t static ISO18013_5_1_ElementIdentifier.parseAgeOverElement(_:)()
{
  return static ISO18013_5_1_ElementIdentifier.parseAgeOverElement(_:)();
}

uint64_t static ISO18013_5_1_ElementIdentifier.isAgeOverElement(_:)()
{
  return static ISO18013_5_1_ElementIdentifier.isAgeOverElement(_:)();
}

uint64_t static ISO18013_5_1_ElementIdentifier.ageOver(nn:)()
{
  return static ISO18013_5_1_ElementIdentifier.ageOver(nn:)();
}

uint64_t ISO18013_5_1_ElementIdentifier.rawValue.getter()
{
  return ISO18013_5_1_ElementIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for ISO18013_5_1_ElementIdentifier()
{
  return type metadata accessor for ISO18013_5_1_ElementIdentifier();
}

uint64_t HPKEEncryptedMessageWithKeyWrap.getMessages()()
{
  return HPKEEncryptedMessageWithKeyWrap.getMessages()();
}

uint64_t HPKEEncryptedMessageWithKeyWrap.getKeys()()
{
  return HPKEEncryptedMessageWithKeyWrap.getKeys()();
}

uint64_t dispatch thunk of static MobileDocumentElementIdentifier.namespaceIdentifier.getter()
{
  return dispatch thunk of static MobileDocumentElementIdentifier.namespaceIdentifier.getter();
}

uint64_t EncryptedDataContainerParamsOnly.params.getter()
{
  return EncryptedDataContainerParamsOnly.params.getter();
}

uint64_t type metadata accessor for EncryptedDataContainerParamsOnly()
{
  return type metadata accessor for EncryptedDataContainerParamsOnly();
}

uint64_t DigitalPresentmentResponseCryptor.init(sessionTranscript:)()
{
  return DigitalPresentmentResponseCryptor.init(sessionTranscript:)();
}

uint64_t DigitalPresentmentResponseCryptor.encrypt(_:to:)()
{
  return DigitalPresentmentResponseCryptor.encrypt(_:to:)();
}

uint64_t type metadata accessor for DigitalPresentmentResponseCryptor()
{
  return type metadata accessor for DigitalPresentmentResponseCryptor();
}

uint64_t static ISO18013ReaderRequestInfoConstant.requestLogotypeIconDataKey.getter()
{
  return static ISO18013ReaderRequestInfoConstant.requestLogotypeIconDataKey.getter();
}

uint64_t static ISO18013ReaderRequestInfoConstant.requestInterpretWillNotRetainIntentAsDisplayOnlyKey.getter()
{
  return static ISO18013ReaderRequestInfoConstant.requestInterpretWillNotRetainIntentAsDisplayOnlyKey.getter();
}

uint64_t KeyAuthorizationCOSE_Sign1Payload.init(publicKey:keyPurpose:authorizerType:)()
{
  return KeyAuthorizationCOSE_Sign1Payload.init(publicKey:keyPurpose:authorizerType:)();
}

uint64_t type metadata accessor for KeyAuthorizationCOSE_Sign1Payload.KeyPurpose()
{
  return type metadata accessor for KeyAuthorizationCOSE_Sign1Payload.KeyPurpose();
}

uint64_t type metadata accessor for KeyAuthorizationCOSE_Sign1Payload.AuthorizerType()
{
  return type metadata accessor for KeyAuthorizationCOSE_Sign1Payload.AuthorizerType();
}

uint64_t type metadata accessor for KeyAuthorizationCOSE_Sign1Payload()
{
  return type metadata accessor for KeyAuthorizationCOSE_Sign1Payload();
}

uint64_t ISO18013DictionaryEncodingStrategy.cborEncoderStrategy.getter()
{
  return ISO18013DictionaryEncodingStrategy.cborEncoderStrategy.getter();
}

uint64_t type metadata accessor for ISO18013DictionaryEncodingStrategy()
{
  return type metadata accessor for ISO18013DictionaryEncodingStrategy();
}

uint64_t ISO23220_1_Japan_ElementIdentifier.rawValue.getter()
{
  return ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for ISO23220_1_Japan_ElementIdentifier()
{
  return type metadata accessor for ISO23220_1_Japan_ElementIdentifier();
}

uint64_t type metadata accessor for EncryptionParamsAlgorithmIdentifier()
{
  return type metadata accessor for EncryptionParamsAlgorithmIdentifier();
}

uint64_t HPKEEnvelopeEncryptedMessagePKRHash.pkRHash.getter()
{
  return HPKEEnvelopeEncryptedMessagePKRHash.pkRHash.getter();
}

uint64_t type metadata accessor for HPKEEnvelopeEncryptedMessagePKRHash()
{
  return type metadata accessor for HPKEEnvelopeEncryptedMessagePKRHash();
}

uint64_t ReaderAuthenticationAllowableElements.documentTypes.getter()
{
  return ReaderAuthenticationAllowableElements.documentTypes.getter();
}

uint64_t ReaderAuthenticationAllowableElements.elements.getter()
{
  return ReaderAuthenticationAllowableElements.elements.getter();
}

uint64_t type metadata accessor for ReaderAuthenticationAllowableElements()
{
  return type metadata accessor for ReaderAuthenticationAllowableElements();
}

uint64_t type metadata accessor for HPKEEncryptionParamsAlgorithmIdentifier()
{
  return type metadata accessor for HPKEEncryptionParamsAlgorithmIdentifier();
}

uint64_t type metadata accessor for AEADKey()
{
  return type metadata accessor for AEADKey();
}

uint64_t type metadata accessor for DIPError.PropertyKey()
{
  return type metadata accessor for DIPError.PropertyKey();
}

uint64_t DIPError.Code.init(rawValue:)()
{
  return DIPError.Code.init(rawValue:)();
}

uint64_t type metadata accessor for DIPError.Code()
{
  return type metadata accessor for DIPError.Code();
}

uint64_t DIPError.code.getter()
{
  return DIPError.code.getter();
}

uint64_t type metadata accessor for DIPError()
{
  return type metadata accessor for DIPError();
}

uint64_t DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)()
{
  return DIPError.init(_:fromError:code:forceCode:properties:file:function:line:)();
}

uint64_t Logotype.subjectLogo.getter()
{
  return Logotype.subjectLogo.getter();
}

uint64_t Logotype.readerMetadata.getter()
{
  return Logotype.readerMetadata.getter();
}

uint64_t type metadata accessor for Logotype()
{
  return type metadata accessor for Logotype();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t Regex.Match.subscript.getter()
{
  return Regex.Match.subscript.getter();
}

uint64_t Logger.cryptoParam(_:)()
{
  return Logger.cryptoParam(_:)();
}

uint64_t Logger.sensitive(_:)()
{
  return Logger.sensitive(_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for NWInterface.InterfaceType()
{
  return type metadata accessor for NWInterface.InterfaceType();
}

uint64_t NWPath.usesInterfaceType(_:)()
{
  return NWPath.usesInterfaceType(_:)();
}

uint64_t static NWPath.Status.== infix(_:_:)()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t type metadata accessor for NWPath()
{
  return type metadata accessor for NWPath();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for CryptoKitError()
{
  return type metadata accessor for CryptoKitError();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return SymmetricKey.init<A>(data:)();
}

uint64_t SymmetricKey.init(size:)()
{
  return SymmetricKey.init(size:)();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return type metadata accessor for SymmetricKey();
}

uint64_t static SymmetricKeySize.bits256.getter()
{
  return static SymmetricKeySize.bits256.getter();
}

uint64_t type metadata accessor for SymmetricKeySize()
{
  return type metadata accessor for SymmetricKeySize();
}

uint64_t static AES.GCM.open(_:using:)()
{
  return static AES.GCM.open(_:using:)();
}

uint64_t static AES.GCM.seal<A>(_:using:nonce:)()
{
  return static AES.GCM.seal<A>(_:using:nonce:)();
}

uint64_t type metadata accessor for AES.GCM.Nonce()
{
  return type metadata accessor for AES.GCM.Nonce();
}

uint64_t AES.GCM.SealedBox.combined.getter()
{
  return AES.GCM.SealedBox.combined.getter();
}

uint64_t AES.GCM.SealedBox.init(combined:)()
{
  return AES.GCM.SealedBox.init(combined:)();
}

uint64_t type metadata accessor for AES.GCM.SealedBox()
{
  return type metadata accessor for AES.GCM.SealedBox();
}

uint64_t Digest.data.getter()
{
  return Digest.data.getter();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

uint64_t type metadata accessor for Insecure.SHA1Digest()
{
  return type metadata accessor for Insecure.SHA1Digest();
}

uint64_t type metadata accessor for Insecure.SHA1()
{
  return type metadata accessor for Insecure.SHA1();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.debugDescription.getter()
{
  return Dictionary.debugDescription.getter();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t Character.isUppercase.getter()
{
  return Character.isUppercase.getter();
}

uint64_t BidirectionalCollection<>.wholeMatch<A>(of:)()
{
  return BidirectionalCollection<>.wholeMatch<A>(of:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t Array<A>.base64EncodedStrings()()
{
  return Array<A>.base64EncodedStrings()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Collection.nilIfEmpty.getter()
{
  return Collection.nilIfEmpty.getter();
}

uint64_t Collection<>.contains<A>(_:)()
{
  return Collection<>.contains<A>(_:)();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)()
{
  return RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t static SecTrustRef.newFromUnverifiedCertificate(_:)()
{
  return static SecTrustRef.newFromUnverifiedCertificate(_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

Swift::Bool __swiftcall NSUserDefaults.internalBool(forKey:)(Swift::String forKey)
{
  return NSUserDefaults.internalBool(forKey:)(forKey._countAndFlagsBits, forKey._object);
}

Swift::String_optional __swiftcall NSUserDefaults.internalString(forKey:)(Swift::String forKey)
{
  uint64_t v1 = NSUserDefaults.internalString(forKey:)(forKey._countAndFlagsBits, forKey._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

Swift::Bool __swiftcall NSXPCConnection.isEntitled(_:)(Swift::String a1)
{
  return NSXPCConnection.isEntitled(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall NSXPCConnection.hasArrayEntitlement(name:values:)(Swift::String name, Swift::OpaquePointer values)
{
  return NSXPCConnection.hasArrayEntitlement(name:values:)(name._countAndFlagsBits, name._object, values._rawValue);
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::String_optional __swiftcall SecCertificateRef.commonName()()
{
  uint64_t v0 = SecCertificateRef.commonName()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::String_optional __swiftcall SecCertificateRef.organization()()
{
  uint64_t v0 = SecCertificateRef.organization()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t SecCertificateRef.privacyPolicyURL.getter()
{
  return SecCertificateRef.privacyPolicyURL.getter();
}

uint64_t SecCertificateRef.derRepresentation()()
{
  return SecCertificateRef.derRepresentation()();
}

Swift::String_optional __swiftcall SecCertificateRef.organizationalUnit()()
{
  uint64_t v0 = SecCertificateRef.organizationalUnit()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t SecCertificateRef.publicKeyAlgorithm()()
{
  return SecCertificateRef.publicKeyAlgorithm()();
}

uint64_t SecCertificateRef.rawECPublicKeyData()()
{
  return SecCertificateRef.rawECPublicKeyData()();
}

uint64_t SecCertificateRef.merchantCategoryCode.getter()
{
  return SecCertificateRef.merchantCategoryCode.getter();
}

uint64_t SecCertificateRef.allowableElementsForDisplayOnly.getter()
{
  return SecCertificateRef.allowableElementsForDisplayOnly.getter();
}

uint64_t SecCertificateRef.allowableElementsForDataTransfer.getter()
{
  return SecCertificateRef.allowableElementsForDataTransfer.getter();
}

uint64_t SecCertificateRef.logotype.getter()
{
  return SecCertificateRef.logotype.getter();
}

uint64_t SecCertificateRef.pseudonym.getter()
{
  return SecCertificateRef.pseudonym.getter();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t SecAccessControlRef.isOSGNChild.getter()
{
  return SecAccessControlRef.isOSGNChild.getter();
}

uint64_t SecAccessControlRef.hasIDVPolicy.getter()
{
  return SecAccessControlRef.hasIDVPolicy.getter();
}

uint64_t SecAccessControlRef.osgnParentKey.getter()
{
  return SecAccessControlRef.osgnParentKey.getter();
}

uint64_t SecAccessControlRef.constraintsData.getter()
{
  return SecAccessControlRef.constraintsData.getter();
}

uint64_t SecAccessControlRef.isBiometricAuth.getter()
{
  return SecAccessControlRef.isBiometricAuth.getter();
}

uint64_t SecAccessControlRef.hasStockholmPolicy.getter()
{
  return SecAccessControlRef.hasStockholmPolicy.getter();
}

uint64_t static SecAccessControlRef.fromConstraintsData(_:)()
{
  return static SecAccessControlRef.fromConstraintsData(_:)();
}

uint64_t SecAccessControlRef.constraintsDescription.getter()
{
  return SecAccessControlRef.constraintsDescription.getter();
}

uint64_t SecAccessControlRef.data.getter()
{
  return SecAccessControlRef.data.getter();
}

uint64_t static SecAccessControlRef.fromData(_:)()
{
  return static SecAccessControlRef.fromData(_:)();
}

uint64_t type metadata accessor for NSManagedObjectContext.ScheduledTaskType()
{
  return type metadata accessor for NSManagedObjectContext.ScheduledTaskType();
}

uint64_t NSManagedObjectContext.fetch<A>(_:)()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t NSSet.makeIterator()()
{
  return NSSet.makeIterator()();
}

uint64_t static NSError.mapFromError(_:domain:mapper:)()
{
  return static NSError.mapFromError(_:domain:mapper:)();
}

uint64_t SecKeyRef.publicKeyData.getter()
{
  return SecKeyRef.publicKeyData.getter();
}

uint64_t SecKeyRef.signSHA256Digest(_:algorithm:)()
{
  return SecKeyRef.signSHA256Digest(_:algorithm:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t AnyHashable.description.getter()
{
  return AnyHashable.description.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.base.getter()
{
  return AnyHashable.base.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error.dipErrorCode.getter()
{
  return Error.dipErrorCode.getter();
}

uint64_t dispatch thunk of Error._code.getter()
{
  return dispatch thunk of Error._code.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

uint64_t DCCredentialAuthACLTypeToString()
{
  return _DCCredentialAuthACLTypeToString();
}

uint64_t DCCredentialPayloadFormatToString()
{
  return _DCCredentialPayloadFormatToString();
}

uint64_t DCCredentialPayloadProtectionPolicyToString()
{
  return _DCCredentialPayloadProtectionPolicyToString();
}

uint64_t DCCredentialPayloadProtectionTypeToString()
{
  return _DCCredentialPayloadProtectionTypeToString();
}

uint64_t DCCredentialPresentmentAuthPolicyToString()
{
  return _DCCredentialPresentmentAuthPolicyToString();
}

uint64_t DCCredentialReaderAuthenticationPolicyToString()
{
  return _DCCredentialReaderAuthenticationPolicyToString();
}

uint64_t DCCredentialStateToString()
{
  return _DCCredentialStateToString();
}

uint64_t DCPresentmentElementFallbackModeToString()
{
  return _DCPresentmentElementFallbackModeToString();
}

uint64_t DCPresentmentMessageEncodingFormatToString()
{
  return _DCPresentmentMessageEncodingFormatToString();
}

uint64_t DCPresentmentSessionEncryptionModeToString()
{
  return _DCPresentmentSessionEncryptionModeToString();
}

uint64_t DCPresentmentSessionResponseEncryptionModeToString()
{
  return _DCPresentmentSessionResponseEncryptionModeToString();
}

uint64_t DCPresentmentTypeToString()
{
  return _DCPresentmentTypeToString();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return _MobileGestalt_copy_buildVersion_obj();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t SESLegacyKeyDelete()
{
  return _SESLegacyKeyDelete();
}

uint64_t SESLegacyKeyGetOccupiedSlots()
{
  return _SESLegacyKeyGetOccupiedSlots();
}

uint64_t SESLegacyKeyGetOccupiedSlotsWithListenerEndpoint()
{
  return _SESLegacyKeyGetOccupiedSlotsWithListenerEndpoint();
}

uint64_t SESLegacyKeySignPrecomputedDigest()
{
  return _SESLegacyKeySignPrecomputedDigest();
}

uint64_t SESLegacyKeySignPrecomputedDigestWithListenerEndpoint()
{
  return _SESLegacyKeySignPrecomputedDigestWithListenerEndpoint();
}

uint64_t SESLegacyKeySignPrecomputedWithIDV()
{
  return _SESLegacyKeySignPrecomputedWithIDV();
}

uint64_t SecAccessControlCopyData()
{
  return _SecAccessControlCopyData();
}

uint64_t SecAccessControlCreate()
{
  return _SecAccessControlCreate();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return _SecAccessControlGetConstraints();
}

uint64_t SecAccessControlSetConstraints()
{
  return _SecAccessControlSetConstraints();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return _SecTrustCopyResult(trust);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}